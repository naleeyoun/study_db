CREATE TABLE IF NOT EXISTS `movie`.`mvCode` (
  `mvcdSeq` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `mvcdSeqAnother` VARCHAR(50) NULL,
  `mvcdName` VARCHAR(50) NOT NULL,
  `mvcdNameEng` VARCHAR(50) NULL,
  `mvcdNameLang1` VARCHAR(50) NULL,
  `mvcdNameLang2` VARCHAR(50) NULL,
  `mvcdNameLang3` VARCHAR(50) NULL,
  `mvcdNameLang4` VARCHAR(50) NULL,
  `mvcdNameLang5` VARCHAR(50) NULL,
  `mvcdUseNy` TINYINT NULL,
  `mvcdOrder` TINYINT NULL,
  `mvcdReferenceV1` VARCHAR(50) NULL,
  `mvcdReferenceV2` VARCHAR(50) NULL,
  `mvcdReferenceV3` VARCHAR(50) NULL,
  `mvcdReferenceI1` INT NULL,
  `mvcdReferenceI2` INT NULL,
  `mvcdReferenceI3` INT NULL,
  `mvcdDelNy` TINYINT NOT NULL,
  `regIp` VARCHAR(100) NULL,
  `regSeq` BIGINT NULL,
  `regDevice` TINYINT NULL,
  `regDateTime` DATETIME NULL,
  `regDateTimeSvr` DATETIME NULL,
  `modIp` VARCHAR(100) NULL,
  `modSeq` BIGINT NULL,
  `modDevice` TINYINT NULL,
  `modDateTime` DATETIME NULL,
  `modDateTimeSvr` DATETIME NULL,
  `mvcgSeq` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`mvcdSeq`),
  INDEX `fk_mvCode_mvCodeGroup1_idx` (`mvcgSeq` ASC) VISIBLE,
  CONSTRAINT `fk_mvCode_mvCodeGroup1`
    FOREIGN KEY (`mvcgSeq`)
    REFERENCES `movie`.`mvCodeGroup` (`mvcgSeq`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;