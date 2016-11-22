/* AFRICAN CITIES */
/*
Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

select "(" + Convert(Varchar(5),ID) + ",'" + Name + "','" + CountryCode + "','" + District + "'," + Convert(varchar(10),Population) + ")" from City
select "('" + Code + "','" + Name + "','" + Continent + "','" + Region + "'," + Convert(Varchar(20),SurfaceArea) + ",'" + Indepyear + "'," + Convert(Varchar(20),Population) + ",'" + LifeExpectancy + "'," + Convert(Varchar(10),GNP) + ",'" + GNPOLD + "','" + LocalName + "','" + GovernmentForm + "','" + isnull(HeadOFState,'') + "','" + Capital + "','" + Code2 + "')," from Country
*/

DECLARE @City Table (ID int, Name Varchar(20), CountryCode Varchar(5), District Varchar(20), Population int)
insert into @City Values (4,'Mazar-e-Sharif','AFG','Balkh',127800), (11,'Groningen','NLD','Groningen',172701), (80,'Merlo','ARG','Buenos Aires',463846), (89,'San Isidro','ARG','Buenos Aires',306341), (91,'Malvinas Argentinas','ARG','Buenos Aires',290335), (124,'San Rafael','ARG','Mendoza',94651), (128,'Vanadzor','ARM','Lori',172700), (141,'Geelong','AUS','Victoria',125382), 
(142,'Townsville','AUS','Queensland',109914), (143,'Cairns','AUS','Queensland',92273), (146,'Sumqayit','AZE','Sumqayit',283000), (150,'Dhaka','BGD','Dhaka',3612850), (151,'Chittagong','BGD','Chittagong',1392860), (162,'Dinajpur','BGD','Rajshahi',127815), (166,'Tangail','BGD','Dhaka',106004), (168,'Pabna','BGD','Rajshahi',103277), (304,'Petrolina','BRA','Pernambuco',210540), 
(321,'Rio Grande','BRA','Rio Grande do Sul',182222), (379,'Palmas','BRA','Tocantins',121919), (431,'Angra dos Reis','BRA','Rio de Janeiro',96864), (473,'Stoke-on-Trent','GBR','England',252000), (478,'Aberdeen','GBR','Scotland',213070), (479,'Northampton','GBR','England',196000), (484,'Luton','GBR','England',183000), (510,'Slough','GBR','England',112000), (521,'Colchester','GBR','England',96063), 
(526,'Birkenhead','GBR','England',93087), (532,'Maidstone','GBR','England',90878), (540,'Plovdiv','BGR','Plovdiv',342584), (575,'Punta Arenas','CHL','Magallanes',125631), (628,'Qina','EGY','Qina',171275), (633,'Warraq al-Arab','EGY','Giza',127108), (657,'Zaragoza','ESP','Aragonia',603367), (665,'Vigo','ESP','Galicia',283670), (673,'Badalona','ESP','Katalonia',209635), 
(686,'Terrassa','ESP','Katalonia',168695), (720,'Kempton Park','ZAF','Gauteng',442633), (721,'Alberton','ZAF','Gauteng',410102), (732,'Klerksdorp','ZAF','North West',261911), (738,'Uitenhage','ZAF','Eastern Cape',192120), (743,'Brakpan','ZAF','Gauteng',171363), (784,'Iloilo','PHL','Western Visayas',365820), (789,'Iligan','PHL','Central Mindanao',285061), (805,'San Pablo','PHL','Southern Tagalog',207927), 
(811,'Binangonan','PHL','Southern Tagalog',187691), (820,'Legazpi','PHL','Bicol',157010), (858,'Hagonoy','PHL','Central Luzon',111425), (865,'San Jose','PHL','Central Luzon',108254), (886,'Bislig','PHL','Caraga',97860), (887,'Talavera','PHL','Central Luzon',97329), (892,'Capas','PHL','Central Luzon',95219), (902,'Libreville','GAB','Estuaire',419000), (906,'Kutaisi','GEO','Imereti',240900), 
(909,'Sohumi','GEO','Abhasia [Aphazeti]',111700), (931,'Delmas','HTI','Ouest',240429), (939,'Jakarta','IDN','Jakarta Raya',9604900), (941,'Bandung','IDN','West Java',2429000), (967,'Ciputat','IDN','West Java',270800), (981,'Karawang','IDN','West Java',145000), (997,'Cianjur','IDN','West Java',114300), (1002,'Citeureup','IDN','West Java',105100), (1004,'Klaten','IDN','Central Java',103300), 
(1021,'Sawangan','IDN','West Java',91100), (1032,'Nagpur','IND','Maharashtra',1624752), (1045,'Patna','IND','Bihar',917243), (1046,'Srinagar','IND','Jammu and Kashmir',892506), (1060,'Hubli-Dharwad','IND','Karnataka',648298), (1063,'Bareilly','IND','Uttar Pradesh',587211), (1092,'Bhilai','IND','Chhatisgarh',386159), (1099,'Jamnagar','IND','Gujarat',341637), (1119,'Davangere','IND','Karnataka',266082), 
(1122,'Bellary','IND','Karnataka',245391), (1126,'Muzaffarpur','IND','Bihar',241107), (1163,'Bally','IND','West Bengali',184474), (1164,'Bhilwara','IND','Rajasthan',183965), (1195,'Arrah (Ara)','IND','Bihar',157082), (1201,'Cuddalore','IND','Tamil Nadu',153086), (1203,'Dhanbad','IND','Jharkhand',151789) 
--select * from @City

--/*
DECLARE @Country Table (Code Varchar(3), Name Varchar(44), Continent Varchar(13), Region Varchar(25), SurfaceArea int, InDEPYEAR Varchar(5), Population int, LifeExpectancy varchar(4), GNP int, GNPOLD varchar(9), LocalName Varchar(44), GovernmentForm varchar(44), HeadOfState varchar(32), Capital varchar(4), Code2 varchar(2))
insert into @Country Values ('ABW','Aruba','North America','Caribbean',193,'NULL',103000,'78.4',828,'793.0','Aruba','Nonmetropolitan Territory of The Netherlands','Beatrix','129','AW'), 
('AFG','Afghanistan','Asia','Southern and Central Asia',652090,'1919',22720000,'45.9',5976,'NULL','Afganistan/Afqanestan','Islamic Emirate','Mohammad Omar','1','AF'), 
('AIA','Anguilla','North America','Caribbean',96,'NULL',8000,'76.1',63,'NULL','Anguilla','Dependent Territory of the UK','Elisabeth II','62','AI'), 
('AND','Andorra','Europe','Southern Europe',468,'1278',78000,'83.5',1630,'NULL','Andorra','Parliamentary Coprincipality','','55','AD'), 
('ANT','Netherlands Antilles','North America','Caribbean',800,'NULL',217000,'74.7',1941,'NULL','Nederlandse Antillen','Nonmetropolitan Territory of The Netherlands','Beatrix','33','AN'), 
('ASM','American Samoa','Oceania','Polynesia',199,'NULL',68000,'75.1',334,'NULL','Amerika Samoa','US Territory','George W. Bush','54','AS'), 
('ATG','Antigua and Barbuda','North America','Caribbean',442,'1981',68000,'70.5',612,'584.0','Antigua and Barbuda','Constitutional Monarchy','Elisabeth II','63','AG'), 
('AUS','Australia','Oceania','Australia and New Zealand',7741220,'1901',18886000,'79.8',351182,'392911.0','Australia','Constitutional Monarchy, Federation','Elisabeth II','135','AU'), 
('BDI','Burundi','Africa','Eastern Africa',27834,'1962',6695000,'46.2',903,'982.0','Burundi/Uburundi','Republic','Pierre Buyoya','552','BI'), 
('BGD','Bangladesh','Asia','Southern and Central Asia',143998,'1971',129155000,'60.2',32852,'31966.0','Bangladesh','Republic','Shahabuddin Ahmad','150','BD'), 
('BGR','Bulgaria','Europe','Eastern Europe',110994,'1908',8190900,'70.9',12178,'10169.0','Balgarija','Republic','Petar Stojanov','539','BG'), 
('BHR','Bahrain','Asia','Middle East',694,'1971',617000,'73.0',6366,'6097.0','Al-Bahrayn','Monarchy (Emirate)','Hamad ibn Isa al-Khalifa','149','BH'), 
('BHS','Bahamas','North America','Caribbean',13878,'1973',307000,'71.1',3527,'3347.0','The Bahamas','Constitutional Monarchy','Elisabeth II','148','BS'), 
('BIH','Bosnia and Herzegovina','Europe','Southern Europe',51197,'1992',3972000,'71.5',2841,'NULL','Bosna i Hercegovina','Federal Republic','Ante Jelavic','201','BA'), 
('BLZ','Belize','North America','Central America',22696,'1981',241000,'70.9',630,'616.0','Belize','Constitutional Monarchy','Elisabeth II','185','BZ'), 
('BMU','Bermuda','North America','North America',53,'NULL',65000,'76.9',2328,'2190.0','Bermuda','Dependent Territory of the UK','Elisabeth II','191','BM'), 
('BRA','Brazil','South America','South America',8547403,'1822',170115000,'62.9',776739,'804108.0','Brasil','Federal Republic','Fernando Henrique Cardoso','211','BR'), 
('BRB','Barbados','North America','Caribbean',430,'1966',270000,'73.0',2223,'2186.0','Barbados','Constitutional Monarchy','Elisabeth II','174','BB'), 
('BRN','Brunei','Asia','Southeast Asia',5765,'1984',328000,'73.6',11705,'12460.0','Brunei Darussalam','Monarchy (Sultanate)','Haji Hassan al-Bolkiah','538','BN'), 
('BTN','Bhutan','Asia','Southern and Central Asia',47000,'1910',2124000,'52.4',372,'383.0','Druk-Yul','Monarchy','Jigme Singye Wangchuk','192','BT'), 
('BWA','Botswana','Africa','Southern Africa',581730,'1966',1622000,'39.3',4834,'4935.0','Botswana','Republic','Festus G. Mogae','204','BW'), 
('CAN','Canada','North America','North America',9970610,'1867',31147000,'79.4',598862,'625626.0','Canada','Constitutional Monarchy, Federation','Elisabeth II','1822','CA'), 
('CCK','Cocos (Keeling) Islands','Oceania','Australia and New Zealand',14,'NULL',600,'NULL',0,'NULL','Cocos (Keeling) Islands','Territory of Australia','Elisabeth II','2317','CC'), 
('CHE','Switzerland','Europe','Western Europe',41284,'1499',7160400,'79.6',264478,'256092.0','Schweiz/Suisse/Svizzera/Svizra','Federation','Adolf Ogi','3248','CH'), 
('CHL','Chile','South America','South America',756626,'1810',15211000,'75.7',72949,'75780.0','Chile','Republic','Ricardo Lagos Escobar','554','CL'), 
('CMR','Cameroon','Africa','Central Africa',475442,'1960',15085000,'54.8',9174,'8596.0','Cameroun/Cameroon','Republic','Paul Biya','1804','CM'), 
('COG','Congo','Africa','Central Africa',342000,'1960',2943000,'47.4',2108,'2287.0','Congo','Republic','Denis Sassou-Nguesso','2296','CG'), 
('COK','Cook Islands','Oceania','Polynesia',236,'NULL',20000,'71.1',100,'NULL','The Cook Islands','Nonmetropolitan Territory of New Zealand','Elisabeth II','583','CK'), 
('COM','Comoros','Africa','Eastern Africa',1862,'1975',578000,'60.0',4401,'4361.0','Komori/Comores','Republic','Azali Assoumani','2295','KM'), 
('CUB','Cuba','North America','Caribbean',110861,'1902',11201000,'76.2',17843,'18862.0','Cuba','Socialistic Republic','Fidel Castro Ruz','2413','CU'), 
('CXR','Christmas Island','Oceania','Australia and New Zealand',135,'NULL',2500,'NULL',0,'NULL','Christmas Island','Territory of Australia','Elisabeth II','1791','CX'), 
('CYM','Cayman Islands','North America','Caribbean',264,'NULL',38000,'78.9',1263,'1186.0','Cayman Islands','Dependent Territory of the UK','Elisabeth II','553','KY'), 
('DEU','Germany','Europe','Western Europe',357022,'1955',82164700,'77.4',2133367,'2102826.0','Deutschland','Federal Republic','Johannes Rau','3068','DE'), 
('DJI','Djibouti','Africa','Eastern Africa',23200,'1977',638000,'50.8',382,'373.0','Djibouti/Jibuti','Republic','Ismail Omar Guelleh','585','DJ'), 
('DMA','Dominica','North America','Caribbean',751,'1978',71000,'73.4',256,'243.0','Dominica','Republic','Vernon Shaw','586','DM'), 
('DNK','Denmark','Europe','Nordic Countries',43094,'800',5330000,'76.5',174099,'169264.0','Danmark','Constitutional Monarchy','Margrethe II','3315','DK'), 
('ECU','Ecuador','South America','South America',283561,'1822',12646000,'71.1',19770,'19769.0','Ecuador','Republic','Gustavo Noboa Bejarano','594','EC'), 
('EGY','Egypt','Africa','Northern Africa',1001449,'1922',68470000,'63.3',82710,'75617.0','Misr','Republic','Hosni Mubarak','608','EG'), 
('ERI','Eritrea','Africa','Eastern Africa',117600,'1993',3850000,'55.8',650,'755.0','Ertra','Republic','Isayas Afewerki [Isaias Afwerki]','652','ER'), 
('ESH','Western Sahara','Africa','Northern Africa',266000,'NULL',293000,'49.8',60,'NULL','As-Sahrawiya','Occupied by Marocco','Mohammed Abdel Aziz','2453','EH'), 
('EST','Estonia','Europe','Baltic Countries',45227,'1991',1439200,'69.5',5328,'3371.0','Eesti','Republic','Lennart Meri','3791','EE'), 
('FIN','Finland','Europe','Nordic Countries',338145,'1917',5171300,'77.4',121914,'119833.0','Suomi','Republic','Tarja Halonen','3236','FI'), 
('FJI','Fiji Islands','Oceania','Melanesia',18274,'1970',817000,'67.9',1536,'2149.0','Fiji Islands','Republic','Josefa Iloilo','764','FJ'), 
('FLK','Falkland Islands','South America','South America',12173,'NULL',2000,'NULL',0,'NULL','Falkland Islands','Dependent Territory of the UK','Elisabeth II','763','FK'), 
('FRA','France','Europe','Western Europe',551500,'843',59225700,'78.8',1424285,'1392448.0','France','Republic','Jacques Chirac','2974','FR'), 
('FSM','Micronesia, Federated States of','Oceania','Micronesia',702,'1990',119000,'68.6',212,'NULL','Micronesia','Federal Republic','Leo A. Falcam','2689','FM'), 
('GAB','Gabon','Africa','Central Africa',267668,'1960',1226000,'50.1',5493,'5279.0','Le Gabon','Republic','Omar Bongo','902','GA'), 
('GBR','United Kingdom','Europe','British Islands',242900,'1066',59623400,'77.7',1378330,'1296830.0','United Kingdom','Constitutional Monarchy','Elisabeth II','456','GB'), 
('GHA','Ghana','Africa','Western Africa',238533,'1957',20212000,'57.4',7137,'6884.0','Ghana','Republic','John Kufuor','910','GH'), 
('GIB','Gibraltar','Europe','Southern Europe',6,'NULL',25000,'79.0',258,'NULL','Gibraltar','Dependent Territory of the UK','Elisabeth II','915','GI'), 
('GLP','Guadeloupe','North America','Caribbean',1705,'NULL',456000,'77.0',3501,'NULL','Guadeloupe','Overseas Department of France','Jacques Chirac','919','GP'), 
('GMB','Gambia','Africa','Western Africa',11295,'1965',1305000,'53.2',320,'325.0','The Gambia','Republic','Yahya Jammeh','904','GM'), 
('GNQ','Equatorial Guinea','Africa','Central Africa',28051,'1968',453000,'53.6',283,'542.0','Guinea Ecuatorial','Republic','Teodoro Obiang Nguema Mbasogo','2972','GQ'), 
('GRD','Grenada','North America','Caribbean',344,'1974',94000,'64.5',318,'NULL','Grenada','Constitutional Monarchy','Elisabeth II','916','GD'), 
('GTM','Guatemala','North America','Central America',108889,'1821',11385000,'66.2',19008,'17797.0','Guatemala','Republic','Alfonso Portillo Cabrera','922','GT'), 
('GUM','Guam','Oceania','Micronesia',549,'NULL',168000,'77.8',1197,'1136.0','Guam','US Territory','George W. Bush','921','GU'), 
('GUY','Guyana','South America','South America',214969,'1966',861000,'64.0',722,'743.0','Guyana','Republic','Bharrat Jagdeo','928','GY'), 
('HKG','Hong Kong','Asia','Eastern Asia',1075,'NULL',6782000,'79.5',166448,'173610.0','Xianggang/Hong Kong','Special Administrative Region of China','Jiang Zemin','937','HK'), 
('HMD','Heard Island and McDonald Islands','Antarctica','Antarctica',359,'NULL',0,'NULL',0,'NULL','Heard and McDonald Islands','Territory of Australia','Elisabeth II','NULL','HM'), 
('IDN','Indonesia','Asia','Southeast Asia',1904569,'1945',212107000,'68.0',84982,'215002.0','Indonesia','Republic','Abdurrahman Wahid','939','ID'), 
('IND','India','Asia','Southern and Central Asia',3287263,'1947',1013662000,'62.5',447114,'430572.0','Bharat/India','Federal Republic','Kocheril Raman Narayanan','1109','IN'), 
('IOT','British Indian Ocean Territory','Africa','Eastern Africa',78,'NULL',0,'NULL',0,'NULL','British Indian Ocean Territory','Dependent Territory of the UK','Elisabeth II','NULL','IO'), 
('IRN','Iran','Asia','Southern and Central Asia',1648195,'1906',67702000,'69.7',195746,'160151.0','Iran','Islamic Republic','Ali Mohammad Khatami-Ardakani','1380','IR'), 
('ITA','Italy','Europe','Southern Europe',301316,'1861',57680000,'79.0',1161755,'1145372.0','Italia','Republic','Carlo Azeglio Ciampi','1464','IT'), 
('JAM','Jamaica','North America','Caribbean',10990,'1962',2583000,'75.2',6871,'6722.0','Jamaica','Constitutional Monarchy','Elisabeth II','1530','JM'), 
('JOR','Jordan','Asia','Middle East',88946,'1946',5083000,'77.4',7526,'7051.0','Al-Urdunn','Constitutional Monarchy','Abdullah II','1786','JO'), 
('JPN','Japan','Asia','Eastern Asia',377829,'-660',126714000,'80.7',3787042,'4192638.0','Nihon/Nippon','Constitutional Monarchy','Akihito','1532','JP'), 
('KAZ','Kazakstan','Asia','Southern and Central Asia',2724900,'1991',16223000,'63.2',24375,'23383.0','Qazaqstan','Republic','Nursultan Nazarbajev','1864','KZ'), 
('KEN','Kenya','Africa','Eastern Africa',580367,'1963',30080000,'48.0',9217,'10241.0','Kenya','Republic','Daniel arap Moi','1881','KE'), 
('KGZ','Kyrgyzstan','Asia','Southern and Central Asia',199900,'1991',4699000,'63.4',1626,'1767.0','Kyrgyzstan','Republic','Askar Akajev','2253','KG'), 
('KIR','Kiribati','Oceania','Micronesia',726,'1979',83000,'59.8',41,'NULL','Kiribati','Republic','Teburoro Tito','2256','KI'), 
('KNA','Saint Kitts and Nevis','North America','Caribbean',261,'1983',38000,'70.7',299,'NULL','Saint Kitts and Nevis','Constitutional Monarchy','Elisabeth II','3064','KN'), 
('KWT','Kuwait','Asia','Middle East',17818,'1961',1972000,'76.1',27037,'30373.0','Al-Kuwayt','Constitutional Monarchy (Emirate)','Jabir al-Ahmad al-Jabir al-Sabah','2429','KW'), 
('LAO','Laos','Asia','Southeast Asia',236800,'1953',5433000,'53.1',1292,'1746.0','Lao','Republic','Khamtay Siphandone','2432','LA'), 
('LBR','Liberia','Africa','Western Africa',111369,'1847',3154000,'51.0',2012,'NULL','Liberia','Republic','Charles Taylor','2440','LR'), 
('LBY','Libyan Arab Jamahiriya','Africa','Northern Africa',1759540,'1951',5605000,'75.5',44806,'40562.0','Libiya','Socialistic State','Muammar al-Qadhafi','2441','LY'), 
('LCA','Saint Lucia','North America','Caribbean',622,'1979',154000,'72.3',571,'NULL','Saint Lucia','Constitutional Monarchy','Elisabeth II','3065','LC'), 
('LIE','Liechtenstein','Europe','Western Europe',160,'1806',32300,'78.8',1119,'1084.0','Liechtenstein','Constitutional Monarchy','Hans-Adam II','2446','LI'), 
('LKA','Sri Lanka','Asia','Southern and Central Asia',65610,'1948',18827000,'71.8',15706,'15091.0','Sri Lanka/Ilankai','Republic','Chandrika Kumaratunga','3217','LK'), 
('LSO','Lesotho','Africa','Southern Africa',30355,'1966',2153000,'50.8',1061,'1161.0','Lesotho','Constitutional Monarchy','Letsie III','2437','LS'), 
('LTU','Lithuania','Europe','Baltic Countries',65301,'1991',3698500,'69.1',10692,'9585.0','Lietuva','Republic','Valdas Adamkus','2447','LT'), 
('LVA','Latvia','Europe','Baltic Countries',64589,'1991',2424200,'68.4',6398,'5639.0','Latvija','Republic','Vaira Vike-Freiberga','2434','LV'), 
('MAC','Macao','Asia','Eastern Asia',18,'NULL',473000,'81.6',5749,'5940.0','Macau/Aomen','Special Administrative Region of China','Jiang Zemin','2454','MO'), 
('MAR','Morocco','Africa','Northern Africa',446550,'1956',28351000,'69.1',36124,'33514.0','Al-Maghrib','Constitutional Monarchy','Mohammed VI','2486','MA'), 
('MCO','Monaco','Europe','Western Europe',2,'1861',34000,'78.8',776,'NULL','Monaco','Constitutional Monarchy','Rainier III','2695','MC'), 
('MDA','Moldova','Europe','Eastern Europe',33851,'1991',4380000,'64.5',1579,'1872.0','Moldova','Republic','Vladimir Voronin','2690','MD'), 
('MDG','Madagascar','Africa','Eastern Africa',587041,'1960',15942000,'55.0',3750,'3545.0','Madagasikara/Madagascar','Federal Republic','Didier Ratsiraka','2455','MG'), 
('MDV','Maldives','Asia','Southern and Central Asia',298,'1965',286000,'62.2',199,'NULL','Dhivehi Raajje/Maldives','Republic','Maumoon Abdul Gayoom','2463','MV'), 
('MHL','Marshall Islands','Oceania','Micronesia',181,'1990',64000,'65.5',97,'NULL','Marshall Islands/Majol','Republic','Kessai Note','2507','MH'), 
('MKD','Macedonia','Europe','Southern Europe',25713,'1991',2024000,'73.8',1694,'1915.0','Makedonija','Republic','Boris Trajkovski','2460','MK'), 
('MLT','Malta','Europe','Southern Europe',316,'1964',380200,'77.9',3512,'3338.0','Malta','Republic','Guido de Marco','2484','MT'), 
('MMR','Myanmar','Asia','Southeast Asia',676578,'1948',45611000,'54.9',180375,'171028.0','Myanma Pye','Republic','kenraali Than Shwe','2710','MM'), 
('MNG','Mongolia','Asia','Eastern Asia',1566500,'1921',2662000,'67.3',1043,'933.0','Mongol Uls','Republic','Natsagiin Bagabandi','2696','MN'), 
('MNP','Northern Mariana Islands','Oceania','Micronesia',464,'NULL',78000,'75.5',0,'NULL','Northern Mariana Islands','Commonwealth of the US','George W. Bush','2913','MP'), 
('MSR','Montserrat','North America','Caribbean',102,'NULL',11000,'78.0',109,'NULL','Montserrat','Dependent Territory of the UK','Elisabeth II','2697','MS'), 
('MTQ','Martinique','North America','Caribbean',1102,'NULL',395000,'78.3',2731,'2559.0','Martinique','Overseas Department of France','Jacques Chirac','2508','MQ'), 
('MUS','Mauritius','Africa','Eastern Africa',2040,'1968',1158000,'71.0',4251,'4186.0','Mauritius','Republic','Cassam Uteem','2511','MU'), 
('MWI','Malawi','Africa','Eastern Africa',118484,'1964',10925000,'37.6',1687,'2527.0','Malawi','Republic','Bakili Muluzi','2462','MW'), 
('MYS','Malaysia','Asia','Southeast Asia',329758,'1957',22244000,'70.8',69213,'97884.0','Malaysia','Constitutional Monarchy, Federation','Salahuddin Abdul Aziz Shah Alhaj','2464','MY'), 
('MYT','Mayotte','Africa','Eastern Africa',373,'NULL',149000,'59.5',0,'NULL','Mayotte','Territorial Collectivity of France','Jacques Chirac','2514','YT'), 
('NAM','Namibia','Africa','Southern Africa',824292,'1990',1726000,'42.5',3101,'3384.0','Namibia','Republic','Sam Nujoma','2726','NA'), 
('NER','Niger','Africa','Western Africa',1267000,'1960',10730000,'41.3',1706,'1580.0','Niger','Republic','Mamadou Tandja','2738','NE'), 
('NFK','Norfolk Island','Oceania','Australia and New Zealand',36,'NULL',2000,'NULL',0,'NULL','Norfolk Island','Territory of Australia','Elisabeth II','2806','NF'), 
('NGA','Nigeria','Africa','Western Africa',923768,'1960',111506000,'51.6',65707,'58623.0','Nigeria','Federal Republic','Olusegun Obasanjo','2754','NG'), 
('NIU','Niue','Oceania','Polynesia',260,'NULL',2000,'NULL',0,'NULL','Niue','Nonmetropolitan Territory of New Zealand','Elisabeth II','2805','NU'), 
('NLD','Netherlands','Europe','Western Europe',41526,'1581',15864000,'78.3',371362,'360478.0','Nederland','Constitutional Monarchy','Beatrix','5','NL'), 
('NOR','Norway','Europe','Nordic Countries',323877,'1905',4478500,'78.7',145895,'153370.0','Norge','Constitutional Monarchy','Harald V','2807','NO'), 
('NPL','Nepal','Asia','Southern and Central Asia',147181,'1769',23930000,'57.8',4768,'4837.0','Nepal','Constitutional Monarchy','Gyanendra Bir Bikram','2729','NP'), 
('NRU','Nauru','Oceania','Micronesia',21,'1968',12000,'60.8',197,'NULL','Naoero/Nauru','Republic','Bernard Dowiyogo','2728','NR'), 
('NZL','New Zealand','Oceania','Australia and New Zealand',270534,'1907',3862000,'77.8',54669,'64960.0','New Zealand/Aotearoa','Constitutional Monarchy','Elisabeth II','3499','NZ'), 
('PAK','Pakistan','Asia','Southern and Central Asia',796095,'1947',156483000,'61.1',61289,'58549.0','Pakistan','Republic','Mohammad Rafiq Tarar','2831','PK'), 
('PCN','Pitcairn','Oceania','Polynesia',49,'NULL',50,'NULL',0,'NULL','Pitcairn','Dependent Territory of the UK','Elisabeth II','2912','PN'), 
('PHL','Philippines','Asia','Southeast Asia',300000,'1946',75967000,'67.5',65107,'82239.0','Pilipinas','Republic','Gloria Macapagal-Arroyo','766','PH'), 
('PLW','Palau','Oceania','Micronesia',459,'1994',19000,'68.6',105,'NULL','Belau/Palau','Republic','Kuniwo Nakamura','2881','PW'), 
('PNG','Papua New Guinea','Oceania','Melanesia',462840,'1975',4807000,'63.1',4988,'6328.0','Papua New Guinea/Papua Niugini','Constitutional Monarchy','Elisabeth II','2884','PG'), 
('POL','Poland','Europe','Eastern Europe',323250,'1918',38653600,'73.2',151697,'135636.0','Polska','Republic','Aleksander Kwasniewski','2928','PL'), 
('PRI','Puerto Rico','North America','Caribbean',8875,'NULL',3869000,'75.6',34100,'32100.0','Puerto Rico','Commonwealth of the US','George W. Bush','2919','PR'), 
('PSE','Palestine','Asia','Middle East',6257,'NULL',3101000,'71.4',4173,'NULL','Filastin','Autonomous Area','Yasser (Yasir) Arafat','4074','PS'), 
('QAT','Qatar','Asia','Middle East',11000,'1971',599000,'72.4',9472,'8920.0','Qatar','Monarchy','Hamad ibn Khalifa al-Thani','2973','QA'), 
('RUS','Russian Federation','Europe','Eastern Europe',17075400,'1991',146934000,'67.2',276608,'442989.0','Rossija','Federal Republic','Vladimir Putin','3580','RU'), 
('RWA','Rwanda','Africa','Eastern Africa',26338,'1962',7733000,'39.3',2036,'1863.0','Rwanda/Urwanda','Republic','Paul Kagame','3047','RW'), 
('SDN','Sudan','Africa','Northern Africa',2505813,'1956',29490000,'56.6',10162,'NULL','As-Sudan','Islamic Republic','Omar Hassan Ahmad al-Bashir','3225','SD'), 
('SGP','Singapore','Asia','Southeast Asia',618,'1965',3567000,'80.1',86503,'96318.0','Singapore/Singapura/Xinjiapo/Singapur','Republic','Sellapan Rama Nathan','3208','SG'), 
('SGS','South Georgia and the South Sandwich Islands','Antarctica','Antarctica',3903,'NULL',0,'NULL',0,'NULL','South Georgia and the South Sandwich Islands','Dependent Territory of the UK','Elisabeth II','NULL','GS'), 
('SHN','Saint Helena','Africa','Western Africa',314,'NULL',6000,'76.8',0,'NULL','Saint Helena','Dependent Territory of the UK','Elisabeth II','3063','SH'), 
('SJM','Svalbard and Jan Mayen','Europe','Nordic Countries',62422,'NULL',3200,'NULL',0,'NULL','Svalbard og Jan Mayen','Dependent Territory of Norway','Harald V','938','SJ'), 
('SLB','Solomon Islands','Oceania','Melanesia',28896,'1978',444000,'71.3',182,'220.0','Solomon Islands','Constitutional Monarchy','Elisabeth II','3161','SB'), 
('SLE','Sierra Leone','Africa','Western Africa',71740,'1961',4854000,'45.3',746,'858.0','Sierra Leone','Republic','Ahmed Tejan Kabbah','3207','SL'), 
('SMR','San Marino','Europe','Southern Europe',61,'885',27000,'81.1',510,'NULL','San Marino','Republic','NULL','3171','SM'), 
('SOM','Somalia','Africa','Eastern Africa',637657,'1960',10097000,'46.2',935,'NULL','Soomaaliya','Republic','Abdiqassim Salad Hassan','3214','SO'), 
('SPM','Saint Pierre and Miquelon','North America','North America',242,'NULL',7000,'77.6',0,'NULL','Saint-Pierre-et-Miquelon','Territorial Collectivity of France','Jacques Chirac','3067','PM'), 
('SUR','Suriname','South America','South America',163265,'1975',417000,'71.4',870,'706.0','Suriname','Republic','Ronald Venetiaan','3243','SR'), 
('SVK','Slovakia','Europe','Eastern Europe',49012,'1993',5398700,'73.7',20594,'19452.0','Slovensko','Republic','Rudolf Schuster','3209','SK'), 
('SVN','Slovenia','Europe','Southern Europe',20256,'1991',1987800,'74.9',19756,'18202.0','Slovenija','Republic','Milan Kucan','3212','SI'), 
('SWE','Sweden','Europe','Nordic Countries',449964,'836',8861400,'79.6',226492,'227757.0','Sverige','Constitutional Monarchy','Carl XVI Gustaf','3048','SE'), 
('SWZ','Swaziland','Africa','Southern Africa',17364,'1968',1008000,'40.4',1206,'1312.0','kaNgwane','Monarchy','Mswati III','3244','SZ'), 
('SYR','Syria','Asia','Middle East',185180,'1941',16125000,'68.5',65984,'64926.0','Suriya','Republic','Bashar al-Assad','3250','SY'), 
('TCA','Turks and Caicos Islands','North America','Caribbean',430,'NULL',17000,'73.3',96,'NULL','The Turks and Caicos Islands','Dependent Territory of the UK','Elisabeth II','3423','TC'), 
('THA','Thailand','Asia','Southeast Asia',513115,'1350',61399000,'68.6',116416,'153907.0','Prathet Thai','Constitutional Monarchy','Bhumibol Adulyadej','3320','TH'), 
('TKL','Tokelau','Oceania','Polynesia',12,'NULL',2000,'NULL',0,'NULL','Tokelau','Nonmetropolitan Territory of New Zealand','Elisabeth II','3333','TK'), 
('TTO','Trinidad and Tobago','North America','Caribbean',5130,'1962',1295000,'68.0',6232,'5867.0','Trinidad and Tobago','Republic','Arthur N. R. Robinson','3336','TT'), 
('TUN','Tunisia','Africa','Northern Africa',163610,'1956',9586000,'73.7',20026,'18898.0','Tunis/Tunisie','Republic','Zine al-Abidine Ben Ali','3349','TN'), 
('TUV','Tuvalu','Oceania','Polynesia',26,'1978',12000,'66.3',6,'NULL','Tuvalu','Constitutional Monarchy','Elisabeth II','3424','TV'), 
('TZA','Tanzania','Africa','Eastern Africa',883749,'1961',33517000,'52.3',8005,'7388.0','Tanzania','Republic','Benjamin William Mkapa','3306','TZ'), 
('UGA','Uganda','Africa','Eastern Africa',241038,'1962',21778000,'42.9',6313,'6887.0','Uganda','Republic','Yoweri Museveni','3425','UG'), 
('UMI','United States Minor Outlying Islands','Oceania','Micronesia/Caribbean',16,'NULL',0,'NULL',0,'NULL','United States Minor Outlying Islands','Dependent Territory of the US','George W. Bush','NULL','UM'), 
('USA','United States','North America','North America',9363520,'1776',278357000,'77.1',8510700,'8110900.0','United States','Federal Republic','George W. Bush','3813','US'), 
('UZB','Uzbekistan','Asia','Southern and Central Asia',447400,'1991',24318000,'63.7',14194,'21300.0','Uzbekiston','Republic','Islam Karimov','3503','UZ'), 
('VCT','Saint Vincent and the Grenadines','North America','Caribbean',388,'1979',114000,'72.3',285,'NULL','Saint Vincent and the Grenadines','Constitutional Monarchy','Elisabeth II','3066','VC'), 
('VGB','Virgin Islands, British','North America','Caribbean',151,'NULL',21000,'75.4',612,'573.0','British Virgin Islands','Dependent Territory of the UK','Elisabeth II','537','VG'), 
('VIR','Virgin Islands, U.S.','North America','Caribbean',347,'NULL',93000,'78.1',0,'NULL','Virgin Islands of the United States','US Territory','George W. Bush','4067','VI'), 
('VUT','Vanuatu','Oceania','Melanesia',12189,'1980',190000,'60.6',261,'246.0','Vanuatu','Republic','John Bani','3537','VU'), 
('WLF','Wallis and Futuna','Oceania','Polynesia',200,'NULL',15000,'NULL',0,'NULL','Wallis-et-Futuna','Nonmetropolitan Territory of France','Jacques Chirac','3536','WF'), 
('WSM','Samoa','Oceania','Polynesia',2831,'1962',180000,'69.2',141,'157.0','Samoa','Parlementary Monarchy','Malietoa Tanumafili II','3169','WS'), 
('YEM','Yemen','Asia','Middle East',527968,'1918',18112000,'59.8',6041,'5729.0','Al-Yaman','Republic','Ali Abdallah Salih','1780','YE'), 
('ZAF','South Africa','Africa','Southern Africa',1221037,'1910',40377000,'51.1',116729,'129092.0','South Africa','Republic','Thabo Mbeki','716','ZA'), 
('ZMB','Zambia','Africa','Eastern Africa',752618,'1964',9169000,'37.2',3377,'3922.0','Zambia','Republic','Frederick Chiluba','3162','ZM'), 
('ZWE','Zimbabwe','Africa','Eastern Africa',390757,'1980',11669000,'37.8',5951,'8670.0','Zimbabwe','Republic','Robert G. Mugabe','4068','ZW')
--Select * from @Country
--*/
 
select c1.name 
from @City c1
inner join @Country c2
on c1.CountryCode = c2.Code
where c2.Continent = 'Africa';

/* Hackerrank accepted solution:
select c1.name from City c1
inner join Country c2
on c1.CountryCode = c2.Code
where c2.Continent = 'Africa';

Output: 
Qina
Warraq al-Arab
Kempton Park
Alberton
Klerksdorp
Uitenhage
Brakpan
Libreville

*/