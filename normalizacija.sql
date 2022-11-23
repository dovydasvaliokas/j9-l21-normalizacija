-- Sukuriu prekės lentelę
CREATE TABLE IF NOT EXISTS preke(
    id INTEGER UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
    pavadinimas VARCHAR(60) NOT NULL,
    aprasymas VARCHAR(500) NOT NULL,
    kaina DECIMAL(6, 2) UNSIGNED NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB;

-- Sukuriu kategorijos lentelę
CREATE TABLE IF NOT EXISTS kategorija(
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    pavadinimas VARCHAR(60) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB;


-- Prekės ir kategorijos sujungimo lentelė
CREATE TABLE IF NOT EXISTS prekiu_kategorijos (
    prekes_id INTEGER UNSIGNED ZEROFILL NOT NULL,
    kategorijos_id INTEGER UNSIGNED ZEROFILL NOT NULL,
    PRIMARY KEY(prekes_id, kategorijos_id),
    FOREIGN KEY (prekes_id) REFERENCES preke(id),
    FOREIGN KEY (kategorijos_id) REFERENCES kategorija(id)
)ENGINE=INNODB;

-- Pirmą prekę su pirma kategorija
INSERT INTO prekiu_kategorijos(prekes_id, kategorijos_id)
VALUES
(1, 1);

-- sukūriau sandėlio lentelę
CREATE TABLE IF NOT EXISTS sandelis(
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    adresas VARCHAR(100) NOT NULL,
    PRIMARY KEY(id)
)ENGINE=INNODB;

-- sukuriu darbuotojo lentelę, kurioje yra susiejimas su sandėlio lentele
CREATE TABLE IF NOT EXISTS darbuotojas (
  id int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  vardas varchar(60) NOT NULL,
  pavarde varchar(60) NOT NULL,
  sandelis_kuriame_dirba_id int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (sandelis_kuriame_dirba_id) REFERENCES sandelis(id)
) ENGINE=InnoDB