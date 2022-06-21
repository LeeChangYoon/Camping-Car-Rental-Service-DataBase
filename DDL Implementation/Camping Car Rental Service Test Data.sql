insert into BRANCH values
	("BPA2003-01", "Pennsylvania", "303 Arsenal Rd", "17402", "pa2003.01@redcamp.com", "58286598632", 900),
	("BNY2007-09", "New York", "4320 Broadway", "10033", "ny2007.09@redcamp.com", "77771923678", 500),
	("BKY2009-13", "Kentucky", "516 S 12th St, Murray", "42071", "ky2009.13@redcamp.com", "74611264636", 520),
	("BIL2010-15", "Illinois", "2221 W Jefferson St, Joliet", "60435", "il2010.15@redcamp.com", "84712177628", 430),
	("BMN2015-22", "Minnesota", "14695 Edgewood Dr N Ste 130", "56425", "mn2015.22@redcamp.com", "65139453513", 240),
	("BWA2015-23", "Washington", "1302 Iowa St, Bellingham", "98229", "wa2015.23@redcamp.com", "42536483055", 220);

insert into CAMP_CAR values
	("V1207012501", "2012-07-01", "Van", "2012-03-09", 61000, "short-trip", 2, 1, "Type2", "BNY2007-09"),
	("F2101050347", "2021-01-05", "Family", "2020-12-17", 10000, "full-day", 8, 0, "Type1", "BWA2015-23"),
	("X2203160045", "2022-03-16", "Luxury", "2021-11-09", 12000, "full-day", 4, 1, "Type1", "BNY2007-09"),
	("L1207010203", "2012-07-01", "Large", "2010-08-08", 37400, "half-day", 6, 1, "Type1", "BKY2009-13"),
	("S1504010002", "2015-04-01", "Small", "2015-03-27", 30200, "half-day", 2, 0, "Type2", "BMN2015-22");

insert into CUSTOMER_CREDENTIAL values
	("henry531", "1234", "13:37:31", "13:45:51"),
	("williamcooper", "99357", "21:34:01", "21:37:56"),
	("emmataylor", "em555", "14:38:44", "15:02:30"),
	("nickbaker", "99999", "07:01:01", "07:58:21"),
	("imjessica", "a4321", "13:24:31", "13:25:47");

insert into CUSTOMER values
	("NY4742198091", "Henry", "Drake", "Johnson", "21222837519", "henry531@gmail.com", "53 Highlands Ave", 22, "henry531"),
	("WA8572301845", "William", "Warren", "Cooper", "36098837212", "wwc1993@apple.com", "12543 Rd H SW, Royal City", 29, "williamcooper"),
	("MN8193840918", "Emma", "Norah", "Taylor", "50763241267", "imemma@emma.com", "800 NW Conifer Dr, Grand Rapids", 51, "emmataylor"),
	("IL1298993217", "Nicholas", "Scott", "Baker", "84798121220", "nickbaker@iit.edu", "Hermann Hall Conference Center", 25, "nickbaker"),
	("NY4757102934", "Jessica", "Jane", "Carpenter", "51697642134", "jessicajane@gmail.com", "1771 Springfield Ave, New Providence", 34, "imjessica");

insert into EVENT(EVNT_SDT, EVNT_EDT, EVNT_DES, APP_LOC) values
	("2020-07-01", "2020-08-31", "Summer Event: 20% discount for reservation Luxury car", "Washington"),
	("2021-07-01", "2021-08-31", "Summer Event: 20% discount for reservation Luxury car", "Washington"),
	("2021-12-25", "2021-12-31", "The End of Year: 10% discount for college student", "Illinois"),
	("2022-01-01", "2022-01-15", "The New Year: free additional 1 day", "Kentucky"),
	("2022-04-12", "2022-04-18", "15th Anniversary Event: 15% discount for all reservation", "New York");

insert into ACCIDENT values	
	("D1V1208131", "V1207012501", "2012-07-01", "2012-08-13", "Tire Puncture", 1),
	("C1S1904263", "S1504010002", "2015-04-01", "2019-04-26", "Crash Accident", 9),
	("D2F2107249", "F2101050347", "2021-01-05", "2021-07-24", "Left Side Mirror Broken", 2),
	("E3V2103232", "V1207012501", "2012-07-01", "2021-03-23", "Overheated Engine", 9),
	("C1X2206011", "X2203160045", "2022-03-16", "2022-06-01", "Crash Accident", 7);

insert into REVIEW(RATE, REV_DES, LCNS_NO, CIN, ISSUE_DT) values
	(4, "It was good~", "NY4742198091", "L1207010203", "2012-07-01"),
	(2, "There was a crash accident", "MN8193840918", "S1504010002", "2015-04-01"),
	(1, "The engine was overheated because of one cracked hose for coolant.", "NY4757102934", "V1207012501", "2012-07-01"),
	(5, "I broke the side mirror, but the staff told me how to handle the insurance.", "WA8572301845", "F2101050347", "2021-01-05"),
	(5, "I got 10% discount by The End of Year Event!", "IL1298993217", "F2101050347", "2021-01-05");

insert into ACCESSORY values	
	("A001-1", 1, 300, "Bedding sheet"),
	("A002-1", 1, 500, "Tableware set"),
	("A003-1", 1, 78, "Awning(for V, S, M type car)"),
	("A003-2", 1, 151, "Awning(for L, F, X type car)"),
	("A004-1", 1, 23, "Table for four");

insert into PAY_TYPE(PAY_NM) values
	("Card"),
	("Cash");

insert into PAY values 
	("C1411010078", 1, 150, "2014-10-30"),
	("C1904240374", 1, 240, "2019-04-23"),
	("C2103200037", 2, 510, "2021-03-17"),
	("C2107220006", 1, 340, "2021-07-17"),
	("C2112250974", 2, 195, "2021-12-24"),
	("C2204120049", 1, 160, "2022-04-09"),
	("C2205070113", 2, 1850, "2022-05-06");

insert into RESERVATION values	
	("RKY1411010078", "2014-11-01", "2014-11-02", "Kentucky", "Nashville", 5, 4500, 9100, 150, 0, 150, 0, "anna@apple.com", "C1411010078", "NY4742198091", "L1207010203", "2012-07-01"),
	("RMN1904240374", "2019-04-24", "2019-04-26", "Minnesota", "North Dakota", 2, 200, 7400, 240, 0, 240, 10, "imemma@emma.com", "C1904240374", "MN8193840918", "S1504010002", "2015-04-01"),
	("RNY2103200037", "2021-03-20", "2021-03-24", "New York", "New York", 2, 44000, 50300, 480, 30, 510, 200, "jessicajane@gmail.com", "C2103200037", "NY4757102934", "V1207012501", "2012-07-01"),
	("RWA2107220006", "2021-07-22", "2021-07-24", "Washington", "Washington", 6, 6100, 8600, 320, 20, 340, 100, "wwc1993@apple.com", "C2107220006", "WA8572301845", "F2101050347", "2021-01-05"),
	("RIL2112250974", "2021-12-25", "2021-12-26", "Illinois", "Chicago", 4, 8600, 9000, 160, 35, 195, 0, "nickbaker@iit.edu", "C2112250974", "IL1298993217", "F2101050347", "2021-01-05"),
	("RNY2204120049", "2022-04-12", "2022-04-13", "New York", "New York", 1, 60000, 60700, 120, 40, 160, 0, "henry531@gmail.com", "C2204120049", "NY4742198091", "V1207012501", "2012-07-01"),
	("RNY2205070113", "2022-05-07", "2022-05-14", "New York", "New York", 4, 0, 1700, 1800, 50, 1850, 350, "henry531@gmail.com", "C2205070113", "NY4742198091", "X2203160045", "2022-03-16");

insert into INSURANCE values
	("INS01-V", "CM", 1, 0, 1, 12.7, "V1207012501", "2012-07-01"),
	("INS01-F", "CM", 1, 0, 1, 40, "F2101050347", "2021-01-05"),
	("INS03-X", "CBM", 1, 1, 1, 60.5, "X2203160045", "2022-03-16"),
	("INS02-L", "CB", 1, 1, 0, 38.9, "L1207010203", "2012-07-01"),
	("INS03-S", "CBM", 1, 1, 1, 19.9, "S1504010002", "2015-04-01");

insert into CHOOSE values
	("RNY2103200037", "A001-1"),
	("RNY2205070113", "A003-2"),
	("RWA2107220006", "A002-1");

insert into APPLY values
	("RWA2107220006", 2),
	("RIL2112250974", 3),
	("RNY2204120049", 5);