local Components = {
	{label = "Sexo", name = "sex", value = 0, min =  0, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Mãe", name = "mom", value = 21, min = 21, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Pai", name = "dad", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Semelhança", name = "face_md_weight", value = 50, min = 0, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Tom de Pele", name = "skin_md_weight", value = 50, min = 0, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Nariz 1", name = "nose_1", value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Nariz 2", name = "nose_2", value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Nariz 3", name = "nose_3", value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Nariz 4", name = "nose_4", value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Nariz 5", name = "nose_5", value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Nariz 6", name = "nose_6", value = 0, min = -10, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Bochechas 1", name = "cheeks_1", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Bochechas 2", name = "cheeks_2", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Bochechas 3", name = "cheeks_3", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Plenitude Labial", name = "lip_thickness", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Largura do Osso da Mandíbula", name = "jaw_1", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Comprimento do Osso da Mandíbula", name = "jaw_2", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Altura do Queixo", name = "chin_1", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Comprimento do Queixo", name = "chin_2", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Largura do Queixo", name = "chin_3", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Buraco do Queixo", name = "chin_4", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Espessura do Pescoço", name = "neck_thickness", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cabelo 1", name = "hair_1", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Cabelo 2", name = "hair_2", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Cor do Cabelo 1", name = "hair_color_1", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Cor do Cabelo 2", name = "hair_color_2", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65},
	{label = "Camisola 1", name = "tshirt_1", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 8},
	{label = "Camisola 2", name = "tshirt_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = "tshirt_1"},
	{label = "Casacos 1", name = "torso_1", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 11},
	{label = "Casacos 2", name = "torso_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = "torso_1"},
	{label = "Decalques 1", name = "decals_1", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 10},
	{label = "Decalques 2", name = "decals_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = "decals_1"},
	{label = "Braços 1", name = "arms", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15},
	{label = "Braços 2", name = "arms_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15},
	{label = "Calças 1", name = "pants_1", value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.5, componentId = 4},
	{label = "Calças 2", name = "pants_2", value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.5, textureof = "pants_1"},
	{label = "Sapatos 1", name = "shoes_1", value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.8, componentId = 6},
	{label = "Sapatos 2", name = "shoes_2", value = 0, min = 0, zoomOffset = 0.8, camOffset = -0.8, textureof = "shoes_1"},
	{label = "Máscara 1", name = "mask_1", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, componentId = 1},
	{label = "Máscara 2", name = "mask_2", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = "mask_1"},
	{label = "Coletes 1", name = "bproof_1", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 9},
	{label = "Coletes 2", name = "bproof_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = "bproof_1"},
	{label = "Correntes 1", name = "chain_1", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, componentId = 7},
	{label = "Correntes 2", name = "chain_2", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = "chain_1"},
	{label = "Capacete 1", name = "helmet_1", value = -1, min = -1, zoomOffset = 0.6, camOffset = 0.65, componentId = 0},
	{label = "Capacete 2", name = "helmet_2", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = "helmet_1"},
	{label = "Óculos 1", name = "glasses_1", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, componentId = 1},
	{label = "Óculos 2", name = "glasses_2", value = 0, min = 0, zoomOffset = 0.6, camOffset = 0.65, textureof = "glasses_1"},
	{label = "Relógios 1", name = "watches_1", value = -1, min = -1, zoomOffset = 0.75, camOffset = 0.15, componentId = 6},
	{label = "Relógios 2", name = "watches_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = "watches_1"},
	{label = "Pulseiras 1", name = "bracelets_1", value = -1, min = -1, zoomOffset = 0.75, camOffset = 0.15, componentId = 7},
	{label = "Pulseiras 2", name = "bracelets_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = "bracelets_1"},
	{label = "Mochilas", name = "bags_1", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, componentId = 5},
	{label = "Cor da Mochila", name = "bags_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15, textureof = "bags_1"},
	{label = "Cor dos Olhos", name = "eye_color", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Olhos", name = "eye_squint", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Tamanho da Sobrancelha", name = "eyebrows_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Tipo de Sobrancelha", name = "eyebrows_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cor da Sobrancelha 1", name = "eyebrows_3", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cor da Sobrancelha 2", name = "eyebrows_4", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Altura da Sobrancelha", name = "eyebrows_5", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Profundidade da Sobrancelha", name = "eyebrows_6", value = 0, min = -10, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Tipo de Maquiagem", name = "makeup_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Espessura da Maquiagem", name = "makeup_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cor da Maquiagem 1", name = "makeup_3", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cor da Maquiagem 2", name = "makeup_4", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Tipo de Batom", name = "lipstick_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Espessura do Batom", name = "lipstick_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cor do Batom 1", name = "lipstick_3", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cor do Batom 2", name = "lipstick_4", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Acessórios de Ouvido", name = "ears_1", value = -1, min = -1, zoomOffset = 0.4, camOffset = 0.65, componentId = 2},
	{label = "Cor dos Acessórios de Ouvido", name = "ears_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65, textureof = "ears_1"},
	{label = "Pelos do Peito 1", name = "chest_1", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15},
	{label = "Pelos do Peito 2", name = "chest_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15},
	{label = "Cor dos Pelos do Peito", name = "chest_3", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15},
	{label = "Manchas Corporais", name = "bodyb_1", value = -1, min = -1, zoomOffset = 0.75, camOffset = 0.15},
	{label = "Tamanho das Manchas Corporais", name = "bodyb_2", value = 0, min = 0, zoomOffset = 0.75, camOffset = 0.15},
	{label = "Efeito das Manchas Corporais", name = "bodyb_3", value = -1, min = -1, zoomOffset = 0.4, camOffset = 0.15},
	{label = "Espessura das Manchas Corporais", name = "bodyb_4", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.15},
	{label = "Rugas", name = "age_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Espessura de Rugas", name = "age_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Manchas", name = "blemishes_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Tamanho das Manchas", name = "blemishes_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Blush", name = "blush_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Espessura do Blush", name = "blush_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cor do Blush", name = "blush_3", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Pele", name = "complexion_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Espessura da Pele", name = "complexion_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Sol", name = "sun_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Espessura do Sol", name = "sun_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Sardas", name = "moles_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Espessura das Sardas", name = "moles_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Tipo de Barba", name = "beard_1", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Tamanho da Barba", name = "beard_2", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cor da Barba 1", name = "beard_3", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65},
	{label = "Cor da Barba 2", name = "beard_4", value = 0, min = 0, zoomOffset = 0.4, camOffset = 0.65}
}

local LastSex = -1
local LoadSkin = nil
local LoadClothes = nil
local Character = {}

for i = 1, #Components, 1 do
	Character[Components[i].name] = Components[i].value
end

function LoadDefaultModel(malePed, cb)
	local playerPed = PlayerPedId()
	local characterModel
	if malePed then
		characterModel = GetHashKey("mp_m_freemode_01")
	else
		characterModel = GetHashKey("mp_f_freemode_01")
	end
	RequestModel(characterModel)
	Citizen.CreateThread(function()
		while not HasModelLoaded(characterModel) do
			RequestModel(characterModel)
			Citizen.Wait(0)
		end
		if IsModelInCdimage(characterModel) and IsModelValid(characterModel) then
			SetPlayerModel(PlayerId(), characterModel)
			SetPedDefaultComponentVariation(playerPed)
		end
		SetModelAsNoLongerNeeded(characterModel)
		if cb ~= nil then
			cb()
		end
		TriggerEvent("vsx_skinchanger:modelLoaded")
	end)
end

function GetMaxVals()
	local playerPed = PlayerPedId()
	local data = {sex = 1, mom = 45, dad = 44, face_md_weight = 100, skin_md_weight = 100, nose_1 = 10, nose_2 = 10, nose_3 = 10, nose_4 = 10, nose_5 = 10, nose_6 = 10, cheeks_1 = 10, cheeks_2 = 10, cheeks_3 = 10, lip_thickness = 10, jaw_1 = 10, jaw_2 = 10, chin_1 = 10, chin_2 = 10, chin_3 = 10, chin_4 = 10, neck_thickness = 10, age_1 = GetNumHeadOverlayValues(3)-1, age_2 = 10, beard_1 = GetNumHeadOverlayValues(1)-1, beard_2 = 10, beard_3 = GetNumHairColors()-1, beard_4 = GetNumHairColors()-1, hair_1 = GetNumberOfPedDrawableVariations(playerPed, 2) - 1, hair_2 = GetNumberOfPedTextureVariations(playerPed, 2, Character["hair_1"]) - 1, hair_color_1 = GetNumHairColors()-1, hair_color_2 = GetNumHairColors()-1, eye_color = 31, eye_squint = 10, eyebrows_1 = GetNumHeadOverlayValues(2)-1, eyebrows_2 = 10, eyebrows_3 = GetNumHairColors()-1, eyebrows_4 = GetNumHairColors()-1, eyebrows_5 = 10, eyebrows_6 = 10, makeup_1 = GetNumHeadOverlayValues(4)-1, makeup_2 = 10, makeup_3 = GetNumHairColors()-1, makeup_4 = GetNumHairColors()-1, lipstick_1 = GetNumHeadOverlayValues(8)-1, lipstick_2 = 10, lipstick_3 = GetNumHairColors()-1, lipstick_4 = GetNumHairColors()-1, blemishes_1 = GetNumHeadOverlayValues(0)-1, blemishes_2 = 10, blush_1 = GetNumHeadOverlayValues(5)-1, blush_2 = 10, blush_3 = GetNumHairColors()-1, complexion_1 = GetNumHeadOverlayValues(6)-1, complexion_2 = 10, sun_1 = GetNumHeadOverlayValues(7)-1, sun_2 = 10, moles_1 = GetNumHeadOverlayValues(9)-1, moles_2 = 10, chest_1 = GetNumHeadOverlayValues(10)-1, chest_2 = 10, chest_3 = GetNumHairColors()-1, bodyb_1 = GetNumHeadOverlayValues(11)-1, bodyb_2 = 10, bodyb_3 = GetNumHeadOverlayValues(12)-1, bodyb_4 = 10, ears_1 = GetNumberOfPedPropDrawableVariations(playerPed, 2) - 1, ears_2 = GetNumberOfPedPropTextureVariations(playerPed, 2, Character["ears_1"] - 1), tshirt_1 = GetNumberOfPedDrawableVariations(playerPed, 8) - 1, tshirt_2 = GetNumberOfPedTextureVariations(playerPed, 8, Character["tshirt_1"]) - 1, torso_1 = GetNumberOfPedDrawableVariations(playerPed, 11) - 1, torso_2 = GetNumberOfPedTextureVariations(playerPed, 11, Character["torso_1"]) - 1, decals_1 = GetNumberOfPedDrawableVariations(playerPed, 10) - 1, decals_2 = GetNumberOfPedTextureVariations(playerPed, 10, Character["decals_1"]) - 1, arms = GetNumberOfPedDrawableVariations(playerPed, 3) - 1, arms_2 = 10, pants_1 = GetNumberOfPedDrawableVariations(playerPed, 4) - 1, pants_2 = GetNumberOfPedTextureVariations(playerPed, 4, Character["pants_1"]) - 1, shoes_1 = GetNumberOfPedDrawableVariations(playerPed, 6) - 1, shoes_2 = GetNumberOfPedTextureVariations(playerPed, 6, Character["shoes_1"]) - 1, mask_1 = GetNumberOfPedDrawableVariations(playerPed, 1) - 1, mask_2 = GetNumberOfPedTextureVariations(playerPed, 1, Character["mask_1"]) - 1, bproof_1 = GetNumberOfPedDrawableVariations(playerPed, 9) - 1, bproof_2 = GetNumberOfPedTextureVariations(playerPed, 9, Character["bproof_1"]) - 1, chain_1 = GetNumberOfPedDrawableVariations(playerPed, 7) - 1, chain_2 = GetNumberOfPedTextureVariations(playerPed, 7, Character["chain_1"]) - 1, bags_1 = GetNumberOfPedDrawableVariations(playerPed, 5) - 1, bags_2 = GetNumberOfPedTextureVariations(playerPed, 5, Character["bags_1"]) - 1, helmet_1 = GetNumberOfPedPropDrawableVariations(playerPed, 0) - 1, helmet_2 = GetNumberOfPedPropTextureVariations(playerPed, 0, Character["helmet_1"]) - 1, glasses_1 = GetNumberOfPedPropDrawableVariations(playerPed, 1) - 1, glasses_2 = GetNumberOfPedPropTextureVariations(playerPed, 1, Character["glasses_1"] - 1), watches_1 = GetNumberOfPedPropDrawableVariations(playerPed, 6) - 1, watches_2 = GetNumberOfPedPropTextureVariations(playerPed, 6, Character["watches_1"]) - 1, bracelets_1 = GetNumberOfPedPropDrawableVariations(playerPed, 7) - 1, bracelets_2 = GetNumberOfPedPropTextureVariations(playerPed, 7, Character["bracelets_1"] - 1)}
	return data
end

function ApplySkin(skin, clothes)
	local playerPed = PlayerPedId()
	for k, v in pairs(skin) do
		Character[k] = v
	end
	if clothes ~= nil then
		for k, v in pairs(clothes) do
			if k ~= "sex" and k ~= "mom" and k ~= "dad" and k ~= "face_md_weight" and k ~= "skin_md_weight" and k ~= "nose_1" and k ~= "nose_2" and k ~= "nose_3" and k ~= "nose_4" and k ~= "nose_5" and k ~= "nose_6" and k ~= "cheeks_1" and k ~= "cheeks_2" and k ~= "cheeks_3" and k ~= "lip_thickness" and k ~= "jaw_1" and k ~= "jaw_2" and k ~= "chin_1" and k ~= "chin_2" and k ~= "chin_3" and k ~= "chin_4" and k ~= "neck_thickness" and k ~= "age_1" and k ~= "age_2" and k ~= "eye_color" and k ~= "eye_squint" and k ~= "beard_1" and k ~= "beard_2" and k ~= "beard_3" and k ~= "beard_4" and k ~= "hair_1" and k ~= "hair_2" and k ~= "hair_color_1" and k ~= "hair_color_2" and k ~= "eyebrows_1" and k ~= "eyebrows_2" and k ~= "eyebrows_3" and k ~= "eyebrows_4" and k ~= "eyebrows_5" and k ~= "eyebrows_6" and k ~= "makeup_1" and k ~= "makeup_2" and k ~= "makeup_3" and k ~= "makeup_4" and k ~= "lipstick_1" and k ~= "lipstick_2" and k ~= "lipstick_3" and k ~= "lipstick_4" and k ~= "blemishes_1" and k ~= "blemishes_2" and k ~= "blemishes_3" and k ~= "blush_1" and k ~= "blush_2" and k ~= "blush_3" and k ~= "complexion_1" and k ~= "complexion_2" and k ~= "sun_1" and k ~= "sun_2" and k ~= "moles_1" and k ~= "moles_2" and k ~= "chest_1" and k ~= "chest_2" and k ~= "chest_3" and k ~= "bodyb_1" and k ~= "bodyb_2" and k ~= "bodyb_3" and k ~= "bodyb_4" then
				Character[k] = v
			end
		end
	end
	local face_weight = (Character["face_md_weight"] / 100) + 0.0
	local skin_weight = (Character["skin_md_weight"] / 100) + 0.0
	SetPedHeadBlendData(playerPed, Character["mom"], Character["dad"], 0, Character["mom"], Character["dad"], 0, face_weight, skin_weight, 0.0, false)
	SetPedFaceFeature(playerPed, 0, (Character["nose_1"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 1, (Character["nose_2"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 2, (Character["nose_3"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 3, (Character["nose_4"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 4, (Character["nose_5"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 5, (Character["nose_6"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 6, (Character["eyebrows_5"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 7, (Character["eyebrows_6"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 8, (Character["cheeks_1"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 9, (Character["cheeks_2"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 10, (Character["cheeks_3"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 11, (Character["eye_squint"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 12, (Character["lip_thickness"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 13, (Character["jaw_1"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 14, (Character["jaw_2"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 15, (Character["chin_1"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 16, (Character["chin_2"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 17, (Character["chin_3"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 18, (Character["chin_4"] / 10) + 0.0)
	SetPedFaceFeature(playerPed, 19, (Character["neck_thickness"] / 10) + 0.0)
	SetPedHairColor(playerPed, Character["hair_color_1"], Character["hair_color_2"])
	SetPedHeadOverlay(playerPed, 3, Character["age_1"],	(Character["age_2"] / 10) + 0.0)
	SetPedHeadOverlay(playerPed, 0, Character["blemishes_1"], (Character["blemishes_2"] / 10) + 0.0)
	SetPedHeadOverlay(playerPed, 1, Character["beard_1"], (Character["beard_2"] / 10) + 0.0)
	SetPedEyeColor(playerPed, Character["eye_color"], 0, 1)
	SetPedHeadOverlay(playerPed, 2, Character["eyebrows_1"], (Character["eyebrows_2"] / 10) + 0.0)
	SetPedHeadOverlay(playerPed, 4, Character["makeup_1"], (Character["makeup_2"] / 10) + 0.0)
	SetPedHeadOverlay(playerPed, 8, Character["lipstick_1"], (Character["lipstick_2"] / 10) + 0.0)
	SetPedComponentVariation(playerPed, 2, Character["hair_1"], Character["hair_2"], 2)
	SetPedHeadOverlayColor(playerPed, 1, 1,	Character["beard_3"], Character["beard_4"])
	SetPedHeadOverlayColor(playerPed, 2, 1,	Character["eyebrows_3"], Character["eyebrows_4"])
	SetPedHeadOverlayColor(playerPed, 4, 2,	Character["makeup_3"], Character["makeup_4"])
	SetPedHeadOverlayColor(playerPed, 8, 1,	Character["lipstick_3"], Character["lipstick_4"])
	SetPedHeadOverlay(playerPed, 5, Character["blush_1"], (Character["blush_2"] / 10) + 0.0)
	SetPedHeadOverlayColor(playerPed, 5, 2,	Character["blush_3"])
	SetPedHeadOverlay(playerPed, 6, Character["complexion_1"], (Character["complexion_2"] / 10) + 0.0)
	SetPedHeadOverlay(playerPed, 7, Character["sun_1"], (Character["sun_2"] / 10) + 0.0)
	SetPedHeadOverlay(playerPed, 9, Character["moles_1"], (Character["moles_2"] / 10) + 0.0)
	SetPedHeadOverlay(playerPed, 10, Character["chest_1"], (Character["chest_2"] / 10) + 0.0)
	SetPedHeadOverlayColor(playerPed, 10, 1, Character["chest_3"])
	if Character["bodyb_1"] == -1 then
		SetPedHeadOverlay(playerPed, 11, 255, (Character["bodyb_2"] / 10) + 0.0)
	else
		SetPedHeadOverlay(playerPed, 11, Character["bodyb_1"], (Character["bodyb_2"] / 10) + 0.0)
	end
	if Character["bodyb_3"] == -1 then
		SetPedHeadOverlay(playerPed, 12, 255, (Character["bodyb_4"] / 10) + 0.0)
	else
		SetPedHeadOverlay(playerPed, 12, Character["bodyb_3"], (Character["bodyb_4"] / 10) + 0.0)
	end
	if Character["ears_1"] == -1 then
		ClearPedProp(playerPed, 2)
	else
		SetPedPropIndex(playerPed, 2, Character["ears_1"], Character["ears_2"], 2)
	end
	SetPedComponentVariation(playerPed, 8, Character["tshirt_1"], Character["tshirt_2"], 2)
	SetPedComponentVariation(playerPed, 11, Character["torso_1"], Character["torso_2"], 2)
	SetPedComponentVariation(playerPed, 3, Character["arms"], Character["arms_2"], 2)
	SetPedComponentVariation(playerPed, 10, Character["decals_1"], Character["decals_2"], 2)
	SetPedComponentVariation(playerPed, 4, Character["pants_1"], Character["pants_2"], 2)
	SetPedComponentVariation(playerPed, 6, Character["shoes_1"], Character["shoes_2"], 2)
	SetPedComponentVariation(playerPed, 1, Character["mask_1"], Character["mask_2"], 2)
	SetPedComponentVariation(playerPed, 9, Character["bproof_1"], Character["bproof_2"], 2)
	SetPedComponentVariation(playerPed, 7, Character["chain_1"], Character["chain_2"], 2)
	SetPedComponentVariation(playerPed, 5, Character["bags_1"], Character["bags_2"], 2)
	if Character["helmet_1"] == -1 then
		ClearPedProp(playerPed, 0)
	else
		SetPedPropIndex(playerPed, 0, Character["helmet_1"], Character["helmet_2"], 2)
	end
	if Character["glasses_1"] == -1 then
		ClearPedProp(playerPed, 1)
	else
		SetPedPropIndex(playerPed, 1, Character["glasses_1"], Character["glasses_2"], 2)
	end
	if Character["watches_1"] == -1 then
		ClearPedProp(playerPed, 6)
	else
		SetPedPropIndex(playerPed, 6, Character["watches_1"], Character["watches_2"], 2)
	end
	if Character["bracelets_1"] == -1 then
		ClearPedProp(playerPed,	7)
	else
		SetPedPropIndex(playerPed, 7, Character["bracelets_1"], Character["bracelets_2"], 2)
	end
end

AddEventHandler("vsx_skinchanger:loadDefaultModel", function(loadMale, cb)
	LoadDefaultModel(loadMale, cb)
end)

AddEventHandler("vsx_skinchanger:getData", function(cb)
	local components = json.decode(json.encode(Components))
	for k, v in pairs(Character) do
		for i = 1, #components, 1 do
			if k == components[i].name then
				components[i].value = v
			end
		end
	end
	cb(components, GetMaxVals())
end)

AddEventHandler("vsx_skinchanger:change", function(key, val)
	Character[key] = val
	if key == "sex" then
		TriggerEvent("vsx_skinchanger:loadSkin", Character)
	else
		ApplySkin(Character)
	end
end)

AddEventHandler("vsx_skinchanger:getSkin", function(cb)
	cb(Character)
end)

AddEventHandler("vsx_skinchanger:modelLoaded", function()
	ClearPedProp(PlayerPedId(), 0)
	if LoadSkin ~= nil then
		ApplySkin(LoadSkin)
		LoadSkin = nil
	end
	if LoadClothes ~= nil then
		ApplySkin(LoadClothes.playerSkin, LoadClothes.clothesSkin)
		LoadClothes = nil
	end
end)

RegisterNetEvent("vsx_skinchanger:loadSkin")
AddEventHandler("vsx_skinchanger:loadSkin", function(skin, cb)
	if skin then
		if skin ~= nil then
			if skin["sex"] ~= LastSex then
				LoadSkin = skin
				if skin["sex"] == 0 then
					TriggerEvent("vsx_skinchanger:loadDefaultModel", true, cb)
				else
					TriggerEvent("vsx_skinchanger:loadDefaultModel", false, cb)
				end
			else
				ApplySkin(skin)
				if cb ~= nil then
					cb()
				end
			end
			LastSex = skin["sex"]
		end
	end
end)

RegisterNetEvent("vsx_skinchanger:loadClothes")
AddEventHandler("vsx_skinchanger:loadClothes", function(playerSkin, clothesSkin)
	if playerSkin["sex"] ~= LastSex then
		LoadClothes = {playerSkin	= playerSkin, clothesSkin	= clothesSkin}
		if playerSkin["sex"] == 0 then
			TriggerEvent("vsx_skinchanger:loadDefaultModel", true)
		else
			TriggerEvent("vsx_skinchanger:loadDefaultModel", false)
		end
	else
		ApplySkin(playerSkin, clothesSkin)
	end
	LastSex = playerSkin["sex"]
end)