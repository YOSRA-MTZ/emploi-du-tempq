
CREATE TABLE filiere(
        id_filiere   Int  Auto_increment  NOT NULL ,
        chef_filiere Varchar (50) NOT NULL ,
        nom_filiere  Varchar (50) NOT NULL ,
        nom_faculte  Varchar (50) NOT NULL ,
        nbr_annee    Varchar (50) NOT NULL
	,CONSTRAINT filiere_PK PRIMARY KEY (id_filiere)
)ENGINE=InnoDB;

CREATE TABLE class(
        id_class       Int  Auto_increment  NOT NULL ,
        nom_class      Varchar (50) NOT NULL ,
        niveau         Varchar (50) NOT NULL ,
        annee_scolaire Varchar (50) NOT NULL ,
        id_filiere     Int NOT NULL
	,CONSTRAINT _class_PK PRIMARY KEY (id_class)

	,CONSTRAINT class__filiere_FK FOREIGN KEY (id_filiere) REFERENCES filiere(id_filiere)
)ENGINE=InnoDB;

CREATE TABLE groupe(
        id_group  Int  Auto_increment  NOT NULL ,
        nom_group Varchar (50) NOT NULL ,
        id_class  Int NOT NULL
	,CONSTRAINT _groupe_PK PRIMARY KEY (id_group)

	,CONSTRAINT groupe__class_FK FOREIGN KEY (id_class) REFERENCES class(id_class)
)ENGINE=InnoDB;

CREATE TABLE admin(
        id_admin    Int  Auto_increment  NOT NULL ,
        identifiant Varchar (50) NOT NULL ,
        mdp_admin   Varchar (50) NOT NULL ,
        email_admin Varchar (50) NOT NULL
	,CONSTRAINT admin_PK PRIMARY KEY (id_admin)
)ENGINE=InnoDB;

CREATE TABLE planning(
        id_planning  Int  Auto_increment  NOT NULL ,
        nom_planning Varchar (50) NOT NULL ,
        id_admin     Int NOT NULL
	,CONSTRAINT _planning_PK PRIMARY KEY (id_planning)

	,CONSTRAINT planning__admin_FK FOREIGN KEY (id_admin) REFERENCES admin(id_admin)
)ENGINE=InnoDB;

CREATE TABLE etudiant(
        id_etudiant     Int  Auto_increment  NOT NULL ,
        nom_etudiant    Varchar (50) NOT NULL ,
        prenom_etudiant Varchar (50) NOT NULL ,
        email_etudiant  Varchar (50) NOT NULL ,
        mdp_etudiant    Varchar (50) NOT NULL ,
        adresse         Varchar (50) NOT NULL,
        naissance       VARCHAR (50) NOT NULL,
        telephone       VARCHAR (50) NOT NULL,
        id_planning     Int NOT NULL ,
        id_group        Int NOT NULL
	,CONSTRAINT _etudiant_PK PRIMARY KEY (id_etudiant)

	,CONSTRAINT etudiant__planning_FK FOREIGN KEY (id_planning) REFERENCES planning(id_planning)
	,CONSTRAINT etudiant__groupe0_FK FOREIGN KEY (id_group) REFERENCES groupe(id_group)
)ENGINE=InnoDB;

CREATE TABLE enseignant(
        id_enseignant     Int  Auto_increment  NOT NULL ,
        nom_enseignant    Varchar (50) NOT NULL ,
        prenom_enseignant Varchar (50) NOT NULL ,
        email_enseignant  Varchar (50) NOT NULL ,
        adresse           VARCHAR (50) NOT NULL,
        telephone         VARCHAR(50)NOT NULL,
        statut_enseignant Varchar (50) NOT NULL ,
        password           Varchar (50) NOT NULL ,
        id_planning       Int NOT NULL
	,CONSTRAINT enseignant_PK PRIMARY KEY (id_enseignant)

	,CONSTRAINT enseignant__planning_FK FOREIGN KEY (id_planning) REFERENCES planning(id_planning)
)ENGINE=InnoDB;

CREATE TABLE demande(
        id_demande     Int  Auto_increment  NOT NULL ,
        contenu        Varchar (50) NOT NULL ,
        statut_demande Varchar (50) NOT NULL ,
        id_enseignant  Int NOT NULL ,
        id_admin       Int NOT NULL
	,CONSTRAINT _demande_PK PRIMARY KEY (id_demande)

	,CONSTRAINT _demande__enseignant_FK FOREIGN KEY (id_enseignant) REFERENCES enseignant(id_enseignant)
	,CONSTRAINT _demande__admin0_FK FOREIGN KEY (id_admin) REFERENCES admin(id_admin)
)ENGINE=InnoDB;

CREATE TABLE disponibilite(
		id_dispo  Int  Auto_increment  NOT NULL ,
		lundi  Varchar (50) NOT NULL ,
		mardi   Varchar (50) NOT NULL ,
		mercredi   Varchar (50) NOT NULL ,
		jeudi   Varchar (50) NOT NULL ,
		vendredi   Varchar (50) NOT NULL ,
		samedi   Varchar (50) NOT NULL ,
		id_enseignant Int
		
		,CONSTRAINT disponibilite_PK PRIMARY KEY (id_dispo)

	,CONSTRAINT disponiblite_enseignant_FK FOREIGN KEY (id_enseignant) REFERENCES enseignant(id_enseignant)
)ENGINE=InnoDB;

CREATE TABLE horaire(
		id_horaire  Int  Auto_increment  NOT NULL ,
		nom_horaire Varchar (50) NOT NULL
			,CONSTRAINT attribut_PK PRIMARY KEY (id_horaire)
)ENGINE=InnoDB;

CREATE TABLE contient(
	 id_horaire Int NOT NULL ,
        id_dispo    Int NOT NULL,
	CONSTRAINT contient_PK PRIMARY KEY (id_horaire,id_dispo),
	CONSTRAINT contient_attribut_FK FOREIGN KEY (id_horaire) REFERENCES horaire(id_horaire),
	CONSTRAINT contient_disponibilite0_FK FOREIGN KEY (id_dispo) REFERENCES disponibilite(id_dispo)
)ENGINE=InnoDB;

CREATE TABLE module(
        id_module  Int  Auto_increment  NOT NULL ,
        nom_module Varchar (50) NOT NULL ,
        semestre   Varchar (50) NOT NULL
	,CONSTRAINT _module_PK PRIMARY KEY (id_module)
)ENGINE=InnoDB;

CREATE TABLE Appartient(
        id_class  Int NOT NULL ,
        id_module Int NOT NULL
	,CONSTRAINT Appartient_PK PRIMARY KEY (id_class,id_module)

	,CONSTRAINT Appartient_class_FK FOREIGN KEY (id_class) REFERENCES class(id_class)
	,CONSTRAINT Appartient__module0_FK FOREIGN KEY (id_module) REFERENCES module(id_module)
)ENGINE=InnoDB;

CREATE TABLE element_module(
        id_element_module  Int  Auto_increment  NOT NULL ,
        nom_element_module Varchar (50) NOT NULL ,
        volume_horaire     Varchar (50) NOT NULL ,
        coefficient        Varchar (50) NOT NULL ,
        id_module          Int
	,CONSTRAINT element_module_PK PRIMARY KEY (id_element_module)

	,CONSTRAINT element_module__module_FK FOREIGN KEY (id_module) REFERENCES module(id_module)
)ENGINE=InnoDB;

CREATE TABLE salle(
        id_salle    Int  Auto_increment  NOT NULL ,
        num_salle   Varchar (50) NOT NULL ,
        capacite    Int NOT NULL ,
        etage_salle Varchar (50) NOT NULL ,
        campus      Varchar (50) NOT NULL
	,CONSTRAINT salle_PK PRIMARY KEY (id_salle)
)ENGINE=InnoDB;

CREATE TABLE seance(
        id_seance          Int  Auto_increment  NOT NULL ,
        date_seance        Varchar (50) NOT NULL ,
        debut_seance       Varchar (50) NOT NULL ,
        fin_seance         Varchar (50) NOT NULL ,
        commentaire_seance Varchar (50) NOT NULL ,
        statut_seance      Varchar (50) NOT NULL ,
        id_salle           Int NOT NULL
	,CONSTRAINT seance_PK PRIMARY KEY (id_seance)

	,CONSTRAINT seance__salle_FK FOREIGN KEY (id_salle) REFERENCES salle(id_salle)
)ENGINE=InnoDB;

CREATE TABLE est_plannifier(
        id_seance         Int NOT NULL ,
        id_element_module Int NOT NULL
	,CONSTRAINT est_plannifier_PK PRIMARY KEY (id_seance,id_element_module)

	,CONSTRAINT est_plannifier__seance_FK FOREIGN KEY (id_seance) REFERENCES seance(id_seance)
	,CONSTRAINT est_plannifier__element_module0_FK FOREIGN KEY (id_element_module) REFERENCES element_module(id_element_module)
)ENGINE=InnoDB;

CREATE TABLE concerner(
        id_seance   Int NOT NULL ,
        id_planning Int NOT NULL
	,CONSTRAINT concerner_PK PRIMARY KEY (id_seance,id_planning)

	,CONSTRAINT concerner__seance_FK FOREIGN KEY (id_seance) REFERENCES seance(id_seance)
	,CONSTRAINT concerner__planning0_FK FOREIGN KEY (id_planning) REFERENCES planning(id_planning)
)ENGINE=InnoDB;

CREATE TABLE enseigne(
        id_element_module Int NOT NULL ,
        id_enseignant     Int NOT NULL
	,CONSTRAINT enseigne_PK PRIMARY KEY (id_element_module,id_enseignant)

	,CONSTRAINT enseigne__element_module_FK FOREIGN KEY (id_element_module) REFERENCES element_module(id_element_module)
	,CONSTRAINT enseigne_enseignant0_FK FOREIGN KEY (id_enseignant) REFERENCES enseignant(id_enseignant)
)ENGINE=InnoDB;
