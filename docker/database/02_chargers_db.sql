USE `chargers`;

INSERT INTO `chargers` (`id`,`accountid`,`name`,`description`,`connectors`,`status`,`protocol`,`datecreated`,`dateupdated`) VALUES
	(NULL, 1, 'CP0001V1_demo', 'Demo charger', 0, 'active', '1.6', UNIX_TIMESTAMP(), UNIX_TIMESTAMP());

INSERT INTO `configs` (`id`,`configtype`,`parameterid`,`configkey`,`configvalue`) VALUES
	(NULL, 'charger', -1, 'Authorization Bearer', 'WEFdfswerRMGTOGRTG=='),
	(NULL, 'charger', -1, 'heartbeatInterval', '600'),
	(NULL, 'charger', 1, 'Authorization Bearer', 'DSswerRMGTOGRTG=='),
	(NULL, 'charger', 1, 'heartbeatInterval', '300');
