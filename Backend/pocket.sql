CREATE TABLE `Category` (
	`cate_id`	int	NOT NULL AUTO_INCREMENT,
	`cate_name`	varchar(100)	NOT NULL,
	PRIMARY KEY (`cate_id`)
);

CREATE TABLE `Pattern` (
	`pattern_id`	int	NOT NULL AUTO_INCREMENT,
	`pattern_name`	varchar(100)	NOT NULL,
	PRIMARY KEY (`pattern_id`)
);

CREATE TABLE `Goods` (
	`goods_id`	varchar(255)	NOT NULL,
	`cate_id`	int	NOT NULL,
	`pattern_id`	int	NOT NULL,
	`goods_name`	varchar(100)	NOT NULL,
	`createdAt`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP,
	`updatedAt`	TIMESTAMP	NOT NULL    DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`goods_id`),
	KEY `FK_Category_Goods` (`cate_id`) USING BTREE,
	KEY `FK_Pattern_Goods` (`pattern_id`) USING BTREE,
	CONSTRAINT `Goods_ibfk_1` FOREIGN KEY(`cate_id`) REFERENCES `Category` (`cate_id`)  ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Goods_ibfk_2` FOREIGN KEY(`pattern_id`) REFERENCES `Pattern` (`pattern_id`)  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Fabric` (
	`fabric_id`	int	NOT NULL AUTO_INCREMENT,
	`fabric_name`	varchar(100)	NOT NULL,
	PRIMARY KEY (`fabric_id`)
);


CREATE TABLE `Composition` (
	`com_id`	int	NOT NULL AUTO_INCREMENT,
	`goods_id`	varchar(255)	NOT NULL,
	`fabric_id`	int	NOT NULL,
	`com_info`	float NOT NULL,
	PRIMARY KEY (`com_id`),
	KEY `FK_Goods_Composition` (`goods_id`) USING BTREE,
	KEY `FK_Fabric_Composition` (`fabric_id`) USING BTREE,
	CONSTRAINT `Composition_ibfk_1` FOREIGN KEY(`goods_id`) REFERENCES `Goods` (`goods_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT `Composition_ibfk_2` FOREIGN KEY(`fabric_id`) REFERENCES `Fabric` (`fabric_id`) ON DELETE CASCADE ON UPDATE CASCADE
);