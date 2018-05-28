


/******Inserting roles**********/
INSERT INTO `h_transplant`.`role`
(`roleName`)
VALUES
('Admin');

INSERT INTO `h_transplant`.`role`
(`roleName`)
VALUES
('User');

/******Inserting users**********/
INSERT INTO `h_transplant`.`user`(`userName`,`userFirstName`,`userLastName`,`userPassword`,`roleId`)
VALUES
("admin","admin",null,'123456',1);


/******Inserting surgeryType**********/
INSERT INTO `h_transplant`.`surgerytype`
(`typeDescription`,
`typePriceDefault`,
`typePhotoPath`)
VALUES
('Partial',
1000,
null);

INSERT INTO `h_transplant`.`surgerytype`
(`typeDescription`,
`typePriceDefault`)
VALUES
('Complete',
4000);



-- ---------packages----------------
			
INSERT INTO `h_transplant`.`package`
(`packageName`,
`packageDescription`,
`packagePrice`,
`packageStatus`,
`typeId`)
VALUES
('Partial',
'Partial hair transplant are between 500 to 2000 hair transplant. Book it today!.',
1000,
'AC',
1);

INSERT INTO `h_transplant`.`package`
(
`packageName`,
`packageDescription`,
`packagePrice`,
`packageStatus`,
`typeId`)
VALUES
('Complete Hair transplant',
'Complete hair transplant are between 5000 to 10000 hairs. Book it today!',
4000,
'AC',
2);
