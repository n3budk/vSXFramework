(function () {
	let MenuTpl =
		'<div id="menu_{{_namespace}}_{{_name}}" class="dialog {{#isBig}}big{{/isBig}}">' +
			'<div class="head"><span>{{title}}</span></div>' +
				'{{#isDefault}}<input type="text" name="value" id="inputText"/>{{/isDefault}}' +
				'{{#isBig}}<textarea name="value"/>{{/isBig}}' +
				'<button type="button" name="submit">Submit</button>' +
				'<button type="button" name="cancel">Cancel</button>' +
			'</div>' +
		'</div>'
	;

	window.VSX_MENU = {};
	VSX_MENU.ResourceName = 'vsx_menu_dialog';
	VSX_MENU.opened = {};
	VSX_MENU.focus = [];
	VSX_MENU.pos = {};

	VSX_MENU.open = function (namespace, name, data) {
		if (typeof VSX_MENU.opened[namespace] == 'undefined') {
			VSX_MENU.opened[namespace] = {};
		}

		if (typeof VSX_MENU.opened[namespace][name] != 'undefined') {
			VSX_MENU.close(namespace, name);
		}

		if (typeof VSX_MENU.pos[namespace] == 'undefined') {
			VSX_MENU.pos[namespace] = {};
		}

		if (typeof data.type == 'undefined') {
			data.type = 'default';
		}

		if (typeof data.align == 'undefined') {
			data.align = 'top-left';
		}

		data._index = VSX_MENU.focus.length;
		data._namespace = namespace;
		data._name = name;

		VSX_MENU.opened[namespace][name] = data;
		VSX_MENU.pos[namespace][name] = 0;

		VSX_MENU.focus.push({
			namespace: namespace,
			name: name
		});

		document.onkeyup = function (key) {
			if (key.which == 27) { // Escape key
				SendMessage(VSX_MENU.ResourceName, 'menu_cancel', data);
			} else if (key.which == 13) { // Enter key
				SendMessage(VSX_MENU.ResourceName, 'menu_submit', data);
			}
		};

		VSX_MENU.render();
	};

	VSX_MENU.close = function (namespace, name) {
		delete VSX_MENU.opened[namespace][name];

		for (let i = 0; i < VSX_MENU.focus.length; i++) {
			if (VSX_MENU.focus[i].namespace == namespace && VSX_MENU.focus[i].name == name) {
				VSX_MENU.focus.splice(i, 1);
				break;
			}
		}

		VSX_MENU.render();
	};

	VSX_MENU.render = function () {
		let menuContainer = $('#menus')[0];
		$(menuContainer).find('button[name="submit"]').unbind('click');
		$(menuContainer).find('button[name="cancel"]').unbind('click');
		$(menuContainer).find('[name="value"]').unbind('input propertychange');
		menuContainer.innerHTML = '';
		$(menuContainer).hide();

		for (let namespace in VSX_MENU.opened) {
			for (let name in VSX_MENU.opened[namespace]) {
				let menuData = VSX_MENU.opened[namespace][name];
				let view = JSON.parse(JSON.stringify(menuData));

				switch (menuData.type) {

					case 'default': {
						view.isDefault = true;
						break;
					}

					case 'big': {
						view.isBig = true;
						break;
					}

					default: break;
				}

				let menu = $(Mustache.render(MenuTpl, view))[0];

				$(menu).css('z-index', 1000 + view._index);

				$(menu).find('button[name="submit"]').click(function () {
					VSX_MENU.submit(this.namespace, this.name, this.data);
				}.bind({ namespace: namespace, name: name, data: menuData }));

				$(menu).find('button[name="cancel"]').click(function () {
					VSX_MENU.cancel(this.namespace, this.name, this.data);
				}.bind({ namespace: namespace, name: name, data: menuData }));

				$(menu).find('[name="value"]').bind('input propertychange', function () {
					this.data.value = $(menu).find('[name="value"]').val();
					VSX_MENU.change(this.namespace, this.name, this.data);
				}.bind({ namespace: namespace, name: name, data: menuData }));

				if (typeof menuData.value != 'undefined') {
					$(menu).find('[name="value"]').val(menuData.value);
				}

				menuContainer.appendChild(menu);
			}
		}

		$(menuContainer).show();
		$("#inputText").focus();
	};

	VSX_MENU.submit = function (namespace, name, data) {
		SendMessage(VSX_MENU.ResourceName, 'menu_submit', data);
	};

	VSX_MENU.cancel = function (namespace, name, data) {
		SendMessage(VSX_MENU.ResourceName, 'menu_cancel', data);
	};

	VSX_MENU.change = function (namespace, name, data) {
		SendMessage(VSX_MENU.ResourceName, 'menu_change', data);
	};

	VSX_MENU.getFocused = function () {
		return VSX_MENU.focus[VSX_MENU.focus.length - 1];
	};

	window.onData = (data) => {
		switch (data.action) {

			case 'openMenu': {
				VSX_MENU.open(data.namespace, data.name, data.data);
				break;
			}

			case 'closeMenu': {
				VSX_MENU.close(data.namespace, data.name);
				break;
			}
		}
	};

	window.onload = function (e) {
		window.addEventListener('message', (event) => {
			onData(event.data);
		});
	};

})();
