USE `messages`;

INSERT INTO `messages` (`reference`, `ocpp_reference`, `chargerid`, `connectorid`, `action`, `rx_content`, `datereceived`, `tx_content`, `datesent`, `datecreated`) VALUES
    -- Initiated by Charge Point
    -- Received request from CP
    ('CP-1cfddac7-4566-4998-9485-dd81a', '1cfddac7-4566-4998-9485-dd86575997ca',1,0,'BootNotification','[2,"1cfddac7-4566-4998-9485-dd86575997ca","BootNotification",{"chargePointModel":"SingleSocketCharger","chargePointVendor":"VendorX"}]',UNIX_TIMESTAMP(),'',0,UNIX_TIMESTAMP()),

    -- Initiated by Central System
    -- Create request to CP. When message just created datesent=0
    ('CS-34534af4-4566-4998-9485-dd8657599bbb','34534af4-4566-4998-9485-dd8657599bbb',1,0,'TriggerMessage','',0,'[2,\"34534af4-4566-4998-9485-dd8657599bbb\",\"TriggerMessage\",{\"requestedMessage\":\"FirmwareStatusNotification\"}]',0,UNIX_TIMESTAMP()),
    -- When messages sent add datesent=UNIX_TIMESTAMP()
    ('CS-11114af4-4566-4998-9485-dd865759wert','11114af4-4566-4998-9485-dd865759wert',1,0,'TriggerMessage','',0,'[2,\"11114af4-4566-4998-9485-dd865759wert\",\"TriggerMessage\",{\"requestedMessage\":\"FirmwareStatusNotification\"}]',UNIX_TIMESTAMP(),UNIX_TIMESTAMP());

INSERT INTO `cache_messages` (`reference`,`ocpp_reference`,`chargerid`,`datecreated`) VALUES
	('CP-1cfddac7-4566-4998-9485-dd86575997ca', 'A12', 1, UNIX_TIMESTAMP()),
	('CS-11114af4-4566-4998-9485-dd865759wert', 'A12', 1, UNIX_TIMESTAMP());