


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
`typeId`,
`packageImgPath`)
VALUES
('Partial',
'Partial hair transplant are between 500 to 2000 hair transplant. Book it today!.',
1000,
'AC',
1,
'https://drive.google.com/open?id=15_ysI4D5eYt-QClU1Fmzj_SVOkkA-AVf');

INSERT INTO `h_transplant`.`package`
(
`packageName`,
`packageDescription`,
`packagePrice`,
`packageStatus`,
`typeId`,
`packageImgPath`)
VALUES
('Complete Hair transplant',
'Complete hair transplant are between 5000 to 10000 hairs. Book it today!',
4000,
'AC',
2,
'https://drive.google.com/open?id=1iHaWKm5TPLAi4I0OwfDidjFxpZQKcIQW');

INSERT INTO `h_transplant`.`package`
(
`packageName`,
`packageDescription`,
`packagePrice`,
`packageStatus`,
`typeId`,
`packageImgPath`)
VALUES
('Full Package',
'Complete hair transplant + flight + hotel. Book it today!',
6000,
'AC',
2,
'https://drive.google.com/open?id=1n5aba-YuzPx8PG_Lc_rvAwOJnpXUBVoK');

