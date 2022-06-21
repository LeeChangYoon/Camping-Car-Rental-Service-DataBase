drop database if exists rental;
create database if not exists rental;
use rental;

create table if not exists branch (
	bin			varchar(18) unique not null,
    state		varchar(20),
    street		varchar(30),
    zip			varchar(5),
    brn_eml		varchar(50),
    brn_phn		varchar(11),
    brn_cap		integer,
    
    primary key (bin)
);

CREATE TABLE IF NOT EXISTS camp_car (
    cin VARCHAR(17) NOT NULL,
    issue_dt DATE NOT NULL,
    cat_tp VARCHAR(25),
    manu_dt DATE,
    dri_dis INTEGER,
    camp_fac VARCHAR(50),
    camp_cap INTEGER,
    camp_fl TINYINT(1),
    lcns_rq VARCHAR(10),
    bin VARCHAR(18) DEFAULT '081690937011420608',
    PRIMARY KEY (cin , issue_dt),
    FOREIGN KEY (bin)
        REFERENCES branch (bin)
        ON UPDATE CASCADE
);

create table if not exists customer_credential (
    login_id	varchar(13) unique not null,
    password	varchar(13),
    login_time	time,
    logout_time	time,
    
    primary key (login_id)
 );
 
create table if not exists customer (
	lcns_no		varchar(12) unique not null,
    fname 		varchar(50),
    mname		varchar(50),
    lname		varchar(50),
    cus_phn		varchar(11),
    cus_eml		varchar(50),
    cus_addr	varchar(50),
    cus_age		integer,
    login_id	varchar(13),
    
    primary key (lcns_no),
    foreign key (login_id) references customer_credential(login_id) on update cascade on delete cascade
);

create table if not exists event (
	ein			integer auto_increment unique not null,
    evnt_sdt	date,
    evnt_edt	date,
    evnt_des	varchar(100),
    app_loc		varchar(50),
    
    primary key (ein)
);

create table if not exists accident (
	ain			varchar(10) unique not null,
    cin			varchar(17),
    issue_dt	date,
    acc_dt		date,
    acc_des 	varchar(50),
    damage		float,
    
    primary key (ain),
    foreign key (cin, issue_dt) references camp_car(cin, issue_dt) on update cascade on delete cascade
);

create table if not exists review (
	rev_sq		integer auto_increment unique not null,
    rate 		integer,
    rev_des		varchar(100),
    lcns_no		varchar(12) default "unkown",
    cin			varchar(17),
    issue_dt	date,
    
    primary key (rev_sq),
    foreign key (lcns_no) references customer(lcns_no) on update cascade,
    foreign key (cin, issue_dt) references camp_car(cin, issue_dt) on update cascade on delete cascade
);

create table if not exists accessory (
	acsry_no	varchar(10) unique not null,
    status		tinyint(1),
    acsry_amt	integer,
    acsry_tp	varchar(50),
    
    primary key (acsry_no)
);

create table if not exists pay_type (
	pay_tp		integer auto_increment unique not null,
    pay_nm		varchar(10),
    
    primary key (pay_tp)
);
 
create table if not exists pay (
	pay_id		varchar(20) unique not null,
    pay_tp		integer,
    pay_amt		float,
    pay_dt		date,
    
    primary key (pay_id),
    foreign key (pay_tp) references pay_type(pay_tp) on update cascade on delete no action
);

create table if not exists reservation (
	rid			varchar(20) unique not null,
    res_sdt		date,
    res_edt		date,
    res_sloc	varchar(50),
    res_eloc	varchar(50),
    pass_amt	integer,
    meter_std	integer,
    meter_end	integer,
    rent_amt	float,
    add_amt		float,
    ttl_amt		float,
    pnlt_amt	float,
    bill_addr	varchar(50),
    pay_id		varchar(20) default "refund",
    lcns_no		varchar(12),
    cin			varchar(17),
    issue_dt	date,
    
    primary key (rid),
    foreign key (pay_id) references pay(pay_id) on update cascade,
    foreign key (lcns_no) references customer(lcns_no) on update cascade on delete cascade,
    foreign key (cin, issue_dt) references camp_car(cin, issue_dt) on update cascade on delete cascade
);

create table if not exists insurance (
	iin			varchar(10) unique not null,
    ins_tp		varchar(15),
    clsn_cov	tinyint(1),
    body_cov	tinyint(1),
    medi_cov	tinyint(1),
    ins_prc		float,
    cin			varchar(17),
    issue_dt	date,
    
    primary key (iin),
    foreign key (cin, issue_dt) references camp_car(cin, issue_dt) on update cascade on delete cascade
);

create table if not exists choose (
	rid			varchar(20) unique not null,
    acsry_no	varchar(10),

    primary key (rid),
    foreign key (rid) references reservation(rid) on update cascade on delete cascade,
    foreign key (acsry_no) references accessory(acsry_no) on update cascade on delete cascade
);

create table if not exists apply (
	rid			varchar(20) unique not null,
    ein			integer,
    
    primary key (rid),
    foreign key (ein) references event(ein) on update cascade on delete cascade,
    foreign key (rid) references reservation(rid) on update cascade on delete cascade
);




