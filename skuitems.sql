-- NOTE: This constitutes a lot of assumptions on what data is represented and
--       what it is associated with. Without more real information on the data,
--       I cannot create a proper schema for these tables. There are simply too
--       many pieces with too little information. This particular example code
--       should suffice to show a basic understanding of SQL and database structure,
--       but nothing further.

CREATE TABLE Payer (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE Merchant (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE SkuItems (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE,
	sku VARCHAR(255),
	description VARCHAR(255),
	quantity INTEGER,
	price NUMERIC(15, 2),
	merchant_id BIGINT UNSIGNED,
	payer_id BIGINT UNSIGNED,
	PRIMARY KEY (id),
	FOREIGN KEY (merchant_id) REFERENCES Merchant(id) ON DELETE SET NULL ON UPDATE CASCADE,
	FOREIGN KEY (payer_id) REFERENCES Payer(id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=INNODB;
