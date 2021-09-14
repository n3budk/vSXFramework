MySQL = module("vsx_mysql", "MySQL")

Debug = module("lib/Debug")

local config = module("cfg/base")

MySQL.debug = config.debug

MySQL.createConnection("vSX", config.db.host,config.db.user,config.db.password,config.db.database)

MySQL.createCommand("vSX/base_tables", [[
    CREATE TABLE IF NOT EXISTS vsx_users(
        id INTEGER AUTO_INCREMENT,
        last_login VARCHAR(100),
        whitelisted BOOLEAN,
        banned BOOLEAN,
        CONSTRAINT pk_user PRIMARY KEY(id)
    );
    CREATE TABLE IF NOT EXISTS vsx_user_ids(
        identifier VARCHAR(100) NOT NULL,
        user_id INTEGER,
        CONSTRAINT pk_user_ids PRIMARY KEY(identifier),
        CONSTRAINT fk_user_ids_users FOREIGN KEY(user_id) REFERENCES vsx_users(id) ON DELETE CASCADE
    );
    CREATE TABLE IF NOT EXISTS vsx_user_data(
        user_id INTEGER,
        dkey VARCHAR(100),
        dvalue TEXT,
        CONSTRAINT pk_user_data PRIMARY KEY(user_id,dkey),
        CONSTRAINT fk_user_data_users FOREIGN KEY(user_id) REFERENCES vsx_users(id) ON DELETE CASCADE
    );
    CREATE TABLE IF NOT EXISTS vsx_srv_data(
        dkey VARCHAR(100),
        dvalue TEXT,
        CONSTRAINT pk_srv_data PRIMARY KEY(dkey)
    );
    CREATE TABLE IF NOT EXISTS vsx_user_identities(
        user_id INTEGER,
        phone VARCHAR(20),
        firstname VARCHAR(50),
        lastname varchar(100) DEFAULT NULL,
        dateofbirth varchar(15) DEFAULT NULL,
        sex varchar(15) DEFAULT NULL,
        height varchar(15) DEFAULT NULL,
        skin longtext DEFAULT NULL,
        CONSTRAINT pk_user_identities PRIMARY KEY(user_id),
        CONSTRAINT fk_user_identities_users FOREIGN KEY(user_id) REFERENCES vsx_users(id) ON DELETE CASCADE,
        INDEX(phone)
    );
    CREATE TABLE IF NOT EXISTS vsx_user_moneys(
        user_id INTEGER,
        wallet INTEGER,
        bank INTEGER,
        CONSTRAINT pk_user_moneys PRIMARY KEY(user_id),
        CONSTRAINT fk_user_moneys_users FOREIGN KEY(user_id) REFERENCES vsx_users(id) ON DELETE CASCADE
    );
    CREATE TABLE IF NOT EXISTS vsx_licenses(
	    type varchar(60) NOT NULL,
	    label varchar(60) NOT NULL,
        CONSTRAINT pk_vsx_licenses PRIMARY KEY(type)
    );
    CREATE TABLE IF NOT EXISTS vsx_user_licenses(
	    id int NOT NULL AUTO_INCREMENT,
	    type varchar(60) NOT NULL,
	    owner VARCHAR(60) NOT NULL,
        CONSTRAINT pk_vsx_user_licenses PRIMARY KEY(id)
    );
]])

MySQL.createCommand("vSX/base_insert_licenses_tables", [[
    INSERT IGNORE INTO `vsx_licenses` (`type`, `label`) VALUES
        ('dmv', 'Código'),
	    ('drive', 'Carta de Condução'),
	    ('drive_bike', 'Carta de Condução Mota'),
	    ('drive_truck', 'Carta de Condução Camião'),
        ('weapon', 'Porte de Armas');
]])

MySQL.createCommand("vSX/create_user", "INSERT INTO vsx_users(whitelisted,banned) VALUES(false,false); SELECT LAST_INSERT_ID() AS id")
MySQL.createCommand("vSX/add_identifier", "INSERT INTO vsx_user_ids(identifier,user_id) VALUES(@identifier,@user_id)")
MySQL.createCommand("vSX/userid_byidentifier", "SELECT user_id FROM vsx_user_ids WHERE identifier = @identifier")

MySQL.createCommand("vSX/set_userdata", "REPLACE INTO vsx_user_data(user_id,dkey,dvalue) VALUES(@user_id,@key,@value)")
MySQL.createCommand("vSX/get_userdata", "SELECT dvalue FROM vsx_user_data WHERE user_id = @user_id AND dkey = @key")

MySQL.createCommand("vSX/set_srvdata", "REPLACE INTO vsx_srv_data(dkey,dvalue) VALUES(@key,@value)")
MySQL.createCommand("vSX/get_srvdata", "SELECT dvalue FROM vsx_srv_data WHERE dkey = @key")

MySQL.createCommand("vSX/get_banned", "SELECT banned FROM vsx_users WHERE id = @user_id")
MySQL.createCommand("vSX/set_banned", "UPDATE vsx_users SET banned = @banned WHERE id = @user_id")
MySQL.createCommand("vSX/get_whitelisted", "SELECT whitelisted FROM vsx_users WHERE id = @user_id")
MySQL.createCommand("vSX/set_whitelisted", "UPDATE vsx_users SET whitelisted = @whitelisted WHERE id = @user_id")
MySQL.createCommand("vSX/set_last_login", "UPDATE vsx_users SET last_login = @last_login WHERE id = @user_id")
MySQL.createCommand("vSX/get_last_login", "SELECT last_login FROM vsx_users WHERE id = @user_id")

MySQL.createCommand("vSX/get_user_identity", "SELECT * FROM vsx_user_identities WHERE user_id = @user_id")
MySQL.createCommand("vSX/init_user_identity", "INSERT IGNORE INTO vsx_user_identities(user_id,phone) VALUES(@user_id,@phone)")
MySQL.createCommand("vSX/get_userbyphone", "SELECT user_id FROM vsx_user_identities WHERE phone = @phone")

MySQL.createCommand("vSX/money_init_user", "INSERT IGNORE INTO vsx_user_moneys(user_id,wallet,bank) VALUES(@user_id,@wallet,@bank)")
MySQL.createCommand("vSX/get_money", "SELECT wallet,bank FROM vsx_user_moneys WHERE user_id = @user_id")
MySQL.createCommand("vSX/set_money", "UPDATE vsx_user_moneys SET wallet = @wallet, bank = @bank WHERE user_id = @user_id")

MySQL.query("vSX/base_tables")
MySQL.query("vSX/base_insert_licenses_tables")