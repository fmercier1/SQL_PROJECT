CREATE TABLE CHARACTER (
    CHARACTER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    CHARACTER_NAME text NOT NULL UNIQUE,
    ACTOR_NAME text NOT NULL);
CREATE TABLE DESIGNER (
    DESIGNER_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    DESIGNER_NAME text NOT NULL UNIQUE,
    BIOGRAPHY text);

CREATE TABLE EDITOR (
    EDITOR_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    EDITOR_NAME text NOT NULL UNIQUE,
    LOCATION text,
    DESCRIPTION text);
CREATE TABLE PLATFORM (   
    PLATFORM_ID INTEGER PRIMARY KEY AUTOINCREMENT,   
    PLATFORM_NAME text NOT NULL UNIQUE,    
    RELEASE text NOT NULL,
    DESCRIPTION text);





CREATE TABLE TITLE (   
    TITLE_ID INTEGER PRIMARY KEY AUTOINCREMENT,   
    TITLE_NAME text NOT NULL UNIQUE,
    RELEASE text NOT NULL,
    KIND text NOT NULL,
    PEGI INTEGER,
    LICENCE text,    
    EDITOR_ID,
        FOREIGN KEY (EDITOR_ID)
            REFERENCES EDITOR (EDITOR_ID)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION);

CREATE TABLE EVALUATION (   
    EVALUATION_ID INTEGER PRIMARY KEY AUTOINCREMENT,   
    PRESS_NAME text NOT NULL,    
    SCORE text NOT NULL,
    COMMENT text,
    TITLE_ID,
        FOREIGN KEY (TITLE_ID)
            REFERENCES TITLE (TITLE_ID)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION);

CREATE TABLE TITLE_TO_CHARACTER (   
    LTC_ID INTEGER PRIMARY KEY AUTOINCREMENT,   
    TITLE_ID,    
    CHARACTER_ID,
        FOREIGN KEY (TITLE_ID)
            REFERENCES TITLE (TITLE_ID)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION,
        FOREIGN KEY (CHARACTER_ID)
            REFERENCES CHARACTER (CHARACTER_ID)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION);

CREATE TABLE TITLE_TO_PLATFORM (   
    LTP_ID INTEGER PRIMARY KEY AUTOINCREMENT,   
    TITLE_ID,    
    PLATFORM_ID,
        FOREIGN KEY (TITLE_ID)
            REFERENCES TITLE (TITLE_ID)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION,
        FOREIGN KEY (PLATFORM_ID)
            REFERENCES PLATFORM (PLATFORM_ID)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION);

CREATE TABLE TITLE_TO_DESIGNER (
    LTD_ID INTEGER PRIMARY KEY AUTOINCREMENT,   
    TITLE_ID,    
    DESIGNER_ID,
        FOREIGN KEY (TITLE_ID)
            REFERENCES TITLE (TITLE_ID)
                ON DELETE NO ACTION
                ON UPDATE NO ACTION,
        FOREIGN KEY (DESIGNER_ID)
            REFERENCES DESIGNER (DESIGNER_ID)
                        ON DELETE NO ACTION
                        ON UPDATE NO ACTION);

INSERT INTO PLATFORM (PLATFORM_NAME,RELEASE,DESCRIPTION)
    VALUES  
    ("XBOX ONE","22/10/2013","La Xbox One est une console de jeux vidéo de huitième génération développée par Microsoft. Dévoilée le 21 mai 2013, elle succède à la Xbox 360 et se place en concurrence frontale avec la PlayStation 4 de Sony"),
    ("PlayStation 4","15/10/2013","La PlayStation 4 (abrégée officiellement PS4) est une console de jeux vidéo de salon de huitième génération développée par Sony Computer Entertainment. Présentée le 20 février 2013, elle succède à la PlayStation 3 et se place en concurrence avec la Xbox One"),
    ("Nintendo Switch","03/03/2017","La Nintendo Switch est une console de jeux vidéo produite par Nintendo, succédant à la Wii U. Il s'agit de la première console hybride, c'est-à-dire multi modes"),
    ("PC","1980","Differentes version d'ordinateur personelle existe"),
    ("ANDROID","23/10/2008","Android, est un système d'exploitation mobile, fondé sur le noyau Linux et développé par Google."),
    ("IOS","2007","iOS, anciennement iPhone OS le « i » de iOS étant pour iPhone d'où la minuscule, est le système d'exploitation mobile développé par Apple pour plusieurs de ses appareils."),
    ("MacOS","1998","macOS2 (auparavant Mac OS X puis OS X3,4) est un système d’exploitation partiellement propriétaire5 développé et commercialisé par Apple depuis 1998, dont la version la plus récente est macOS Catalina (version 10.15) lancée le 7 octobre 2019. Avec iOS, iPadOS, watchOS et tvOS, il fait partie des systèmes d'exploitation d'Apple."),
    ("Linux","17/09/1991","Linux ou GNU/Linux est une famille de systèmes d'exploitation open source de type Unix fondé sur le noyau Linux, créé en 1991 par Linus Torvalds. De nombreuses distributions GNU/Linux ont depuis vu le jour et constituent un important vecteur de popularisation du mouvement du logiciel libre.");

INSERT INTO EDITOR (EDITOR_NAME,LOCATION,DESCRIPTION)
    VALUES  ("Rockstar North","Scotland","Rockstar North, anciennement appelé DMA Design entre 1988 et 2002, est un studio britannique de développement de jeu vidéo basé à Édimbourg (Ecosse) appartenant à Rockstar Games depuis 1999."),
            ("Valve","USA","Valve Corporation est un studio américain de développement de jeux vidéo basé à Bellevue, dans l'État de Washington. Valve est devenu célèbre après la sortie de son premier jeu, Half-Life, en novembre 1998."),
            ("Ubisoft Montréal","Canada","Ubisoft Montréal (nom commercial de l'entreprise Ubisoft Divertissements Inc.) est un studio de développement de jeux vidéo, appartenant à l'éditeur français Ubisoft."),
            ("KING","London","King Digital Entertainment, anciennement King.com, dit King, est une entreprise britannique de jeu vidéo fondée en 2003, dont le siège social est situé à Londres et le siège fiscal à Dublin. Elle est l'un des développeurs d'applications pour Facebook les plus notables");

INSERT INTO TITLE (TITLE_NAME,RELEASE,PEGI,KIND,LICENCE,EDITOR_ID)
    VALUES  ("GTA V","17/09/2013","18","ACTION-ADVENTURE","Grand Theft Auto",1),
            ("GTA III","22/09/2001","18","ACTION-ADVENTURE","Grand Theft Auto",1),
            ("FARCRY 4","18/11/2014","18","ACTION-ADVENTURE","FARCRY",2),
            ("FARCRY 6","2021","18","ACTION-ADVENTURE","FARCRY",2),
            ("Candy Crush Saga","12/04/2012","3","FAMILY","Candy Crush",4),
            ("Counter-Strike: Global Offensive","21/06/2012","18","ACTION-WAR","Counter-Strike",3);
            
INSERT INTO DESIGNER (DESIGNER_NAME,BIOGRAPHY)
    VALUES  ("Dan Houser","Dan Houser is a writer, director and producer, known for Grand Theft Auto: Vice City (2002), Grand Theft Auto: San Andreas (2004), Bully (2006), Grand Theft Auto IV (2008), Red Dead Redemption (2010), Max Payne 3 (2012) and Grand Theft Auto V (2013). Houser is the co-founder and vice president of creativity for Rockstar Games."),
            ("Rupert Humphries","Rupert Humphries is a voice actor and writer working for Rockstar Games."),
            ("Michael Unsworth","Michael Unsworth is known for his work on Grand Theft Auto IV (2008), Red Dead Redemption II (2018) and Grand Theft Auto V (2013)."),
            ("Paul Kurowski","Paul Kurowski is known for his work on Grand Theft Auto III (2001), Crysis 3 (2013) and APB: All Points Bulletin (2010)."),
            ("Patrick Methe","Specialties: Artificial Intelligence : Source Linkedin and Farcry producter"),
            ("Mark Thompson","I aspire to be the Shingy of videogames. : Source Linkedin"),
            ("Lucien Soulban","Lucien Soulban is a writer and actor, known for Far Cry 3: Blood Dragon (2013), Far Cry 3 (2012) and Far Cry 4 (2014)."),
            ("Erik Marcisak","Erik Marcisak was born on March 17, 1978 in Queens, New York, USA. He is known for his work on PowerUp Heroes (2011), Prince of Central Park (2000) and Fever (1999)."),
            ("Chet Faliszek","Chet Faliszek was born in 1965. He is a writer, known for Left 4 Dead 2 (2009), Left 4 Dead (2008) and The Orange Box (2007)."),
            ("Ted Kosmatka","Experienced software developer, designer, and dreamer. : Source Linkedin"),
            ("Yonna Ingolf","Yonna Ingolf is known for her work on Candy Crush Saga (2012).");

INSERT INTO CHARACTER (CHARACTER_NAME,ACTOR_NAME)
    VALUES  ("Franklin Clinton","Shawn Fonteno"),
            ("Michael De Santa","Ned Luke"),
            ("Trevor Philips","Steven Ogg"),
            ("Salvatore Leone","Frank Vincent"),
            ("Luigi Goterelli","Joe Pantolianoé"),
            ("Anton Castillo","Giancarlo Esposito"),
            ("Diego","Anthony Gonzalez"),
            ("Pagan Min","Troy Baker"),
            ("Sabal","Naveen Andrews");

INSERT INTO EVALUATION (PRESS_NAME,SCORE,COMMENT,TITLE_ID)
    VALUES  ("Micromania","5/5","BEST GAME EVER",1),
            ("JeuxVideo.com","4.5/5","VERY GOOD GAME",1),
            ("Micromania","4/5","BEST GAME EVER when is lunch",2),
            ("JeuxVideo.com","4.5/5","STILL AN GOOD GAME",2),
            ("Micromania","4/5","NICE GAME",3),
            ("JeuxVideo.com","3.5/5","",3),
            ("Micromania","4.5/5","AWESOME COMMING SOON",4),
            ("JeuxVideo.com","5/5","Giancarlo Esposito we love this actor from Breaking bad",4),
            ("Micromania","2/5","WE CAN'T get money with this game...",5),
            ("JeuxVideo.com","4/5","ADDICTIVE",5),
            ("Micromania","4/5","GOOD GAME",6),
            ("JeuxVideo.com","2.5/5","SAME GAME THAN THE LAST ONE",6);

INSERT INTO TITLE_TO_CHARACTER (TITLE_ID,CHARACTER_ID)
    VALUES  (1,1),
            (1,2),
            (1,3),
            (2,4),
            (2,5),
            (3,6),
            (3,7),
            (4,8),
            (4,9);

INSERT INTO TITLE_TO_PLATFORM (TITLE_ID,PLATFORM_ID)
    VALUES  (1,1),
            (1,2),
            (1,4),
            (1,7),
            (1,8),
            (2,4),
            (2,5),
            (2,6),
            (2,7),
            (2,8),
            (3,1),
            (3,2),
            (3,7),
            (3,8),
            (4,1),
            (4,2),
            (4,7),
            (4,8),
            (5,5),
            (5,6),
            (6,4),
            (6,7),
            (6,8);

INSERT INTO TITLE_TO_DESIGNER (TITLE_ID,DESIGNER_ID)
    VALUES  (1,1),
            (1,2),
            (1,3),
            (2,1),
            (2,4),
            (3,5),
            (3,6),
            (4,7),
            (4,8),
            (6,9),
            (6,10),
            (5,11);

SELECT TITLE.TITLE_NAME, CHARACTER.ACTOR_NAME, CHARACTER.CHARACTER_NAME FROM TITLE INNER JOIN ([CHARACTER] INNER JOIN [TITLE_TO_CHARACTER] ON CHARACTER.CHARACTER_ID = [TITLE_TO_CHARACTER].CHARACTER_ID) ON TITLE.TITLE_ID = [TITLE_TO_CHARACTER].TITLE_ID;

SELECT TITLE_NAME FROM TITLE WHERE TITLE_NAME LIKE 'C%';

SELECT CHARACTER_NAME, ACTOR_NAME FROM CHARACTER GROUP BY ACTOR_NAME;

SELECT PRESS_NAME, SCORE FROM EVALUATION GROUP BY PRESS_NAME HAVING SCORE > 3/5;

SELECT MAX(SCORE) FROM EVALUATION;

SELECT BIOGRAPHY FROM DESIGNER WHERE DESIGNER_NAME = "Rupert Humphries";

SELECT * FROM TITLE WHERE EDITOR_ID BETWEEN 1 AND 3;

SELECT * FROM PLATFORM LEFT JOIN TITLE ON TITLE.TITLE_ID = PLATFORM.PLATFORM_ID;