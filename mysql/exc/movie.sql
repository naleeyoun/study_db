INSERT INTO `movie`.`mvmember`
(
	`mvmmDelNy`,
	`mvmmAdminNy`,
	`mvmmDormancyNy`,
	`mvmmName`,
	`mvmmId`,
	`mvmmPassword`,
	`mvmmGenderCd`,
	`mvmmDob`,
	`mvmmSavedCd`,
	`mvmmMarriageCd`,
	`mvmmMarriageDate`,
	`mvmmChildrenNum`,
	`mvmmFavoriteColor`,
	`mvmmRecommenderSeq`,
	`mvmmEmailConsentNy`,
	`mvmmSmsConsentNy`,
	`mvmmPushConsentNy`,
	`regDateTime`,
	`regDateTimeSvr`,
	`modDateTime`,
	`modDateTimeSvr`
)
VALUES
(
	0 -- `mvmmDelNy`,
	, 1 -- `mvmmAdminNy`,
	, 0 -- `mvmmDormancyNy`,
	, "윤이나" -- `mvmmName`,
	, "yina" -- `mvmmId`,
	, "4FA210A06F9FAA90AADCA1A977D784D5D4E95ED4C993A60B2D6C5F0BF5956633" -- `mvmmPassword`,
	, 4 -- `mvmmGenderCd`,
	, "2000-05-25" -- `mvmmDob`,
	, -- `mvmmSavedCd`,
	-- `mvmmMarriageCd`,
	-- `mvmmMarriageDate`,
	-- `mvmmChildrenNum`,
	-- `mvmmFavoriteColor`,
	-- `mvmmRecommenderSeq`,
	-- `mvmmEmailConsentNy`,
	-- `mvmmSmsConsentNy`,
	-- `mvmmPushConsentNy`,
	-- `regDateTime`,
	-- `regDateTimeSvr`,
	-- `modDateTime`,
	-- `modDateTimeSvr`

);




use movie;
select * from mvnationality;
select * from mvmovie;
select * from mvcode;
select * from mvgenre;
select * from mvcharacter;
select * from mvscreen;
select * from mvtime;
select * from mvseat;