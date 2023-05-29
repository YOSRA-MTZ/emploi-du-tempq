-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 28 mai 2023 à 17:50
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `emploi`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `identifiant` varchar(50) NOT NULL,
  `mdp_admin` varchar(50) NOT NULL,
  `email_admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `identifiant`, `mdp_admin`, `email_admin`) VALUES
(1, 'admin', 'admin', 'admin@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `appartient`
--

CREATE TABLE `appartient` (
  `id_class` int(11) NOT NULL,
  `id_module` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `class`
--

CREATE TABLE `class` (
  `id_class` int(11) NOT NULL,
  `nom_class` varchar(50) NOT NULL,
  `niveau` varchar(50) NOT NULL,
  `annee_scolaire` varchar(50) NOT NULL,
  `id_filiere` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `concerner`
--

CREATE TABLE `concerner` (
  `id_seance` int(11) NOT NULL,
  `id_planning` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `contient`
--

CREATE TABLE `contient` (
  `id_horaire` int(11) NOT NULL,
  `id_dispo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE `demande` (
  `id_demande` int(11) NOT NULL,
  `contenu` varchar(50) NOT NULL,
  `statut_demande` varchar(50) NOT NULL,
  `id_enseignant` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `disponibilite`
--

CREATE TABLE `disponibilite` (
  `id_dispo` int(11) NOT NULL,
  `lundi` varchar(50) NOT NULL,
  `mardi` varchar(50) NOT NULL,
  `mercredi` varchar(50) NOT NULL,
  `jeudi` varchar(50) NOT NULL,
  `vendredi` varchar(50) NOT NULL,
  `samedi` varchar(50) NOT NULL,
  `id_enseignant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `disponibilite`
--

INSERT INTO `disponibilite` (`id_dispo`, `lundi`, `mardi`, `mercredi`, `jeudi`, `vendredi`, `samedi`, `id_enseignant`) VALUES
(18, '', '', '', '', '3', '', 5);

-- --------------------------------------------------------

--
-- Structure de la table `element_module`
--

CREATE TABLE `element_module` (
  `id_element_module` int(11) NOT NULL,
  `nom_element_module` varchar(50) NOT NULL,
  `volume_horaire` varchar(50) NOT NULL,
  `coefficient` varchar(50) NOT NULL,
  `id_module` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `enseignant`
--

CREATE TABLE `enseignant` (
  `id_enseignant` int(11) NOT NULL,
  `nom_enseignant` varchar(50) NOT NULL,
  `email_enseignant` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `statut_enseignant` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `enseignant`
--

INSERT INTO `enseignant` (`id_enseignant`, `nom_enseignant`, `email_enseignant`, `adresse`, `telephone`, `statut_enseignant`, `password`) VALUES
(2, 'yosra', 'y.moumtaz@gmail.com', 'hhhhhhhhhhhh', '0689674533', 'vacataire', 'aaa'),
(5, 'salam', 'a@gmail.com', 'ZFFEGEG', '0988796', 'vacataire', 'aa');

-- --------------------------------------------------------

--
-- Structure de la table `enseigne`
--

CREATE TABLE `enseigne` (
  `id_element_module` int(11) NOT NULL,
  `id_enseignant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `est_plannifier`
--

CREATE TABLE `est_plannifier` (
  `id_seance` int(11) NOT NULL,
  `id_element_module` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id_etudiant` int(11) NOT NULL,
  `nom_etudiant` varchar(50) NOT NULL,
  `prenom_etudiant` varchar(50) NOT NULL,
  `email_etudiant` varchar(50) NOT NULL,
  `mdp_etudiant` varchar(50) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `naissance` varchar(50) NOT NULL,
  `telephone` varchar(50) NOT NULL,
  `id_group` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `filiere`
--

CREATE TABLE `filiere` (
  `id_filiere` int(11) NOT NULL,
  `chef_filiere` varchar(50) NOT NULL,
  `nom_filiere` varchar(50) NOT NULL,
  `nom_faculte` varchar(50) NOT NULL,
  `nbr_annee` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE `groupe` (
  `id_group` int(11) NOT NULL,
  `nom_group` varchar(50) NOT NULL,
  `id_class` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `horaire`
--

CREATE TABLE `horaire` (
  `id_horaire` int(11) NOT NULL,
  `nom_horaire` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `horaire`
--

INSERT INTO `horaire` (`id_horaire`, `nom_horaire`) VALUES
(1, 'AM'),
(2, 'PM'),
(3, 'AM/PM');

-- --------------------------------------------------------

--
-- Structure de la table `module`
--

CREATE TABLE `module` (
  `id_module` int(11) NOT NULL,
  `nom_module` varchar(50) NOT NULL,
  `semestre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `planning`
--

CREATE TABLE `planning` (
  `id_planning` int(11) NOT NULL,
  `nom_planning` varchar(50) NOT NULL,
  `id_admin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE `salle` (
  `id_salle` int(11) NOT NULL,
  `num_salle` varchar(50) NOT NULL,
  `capacite` int(11) NOT NULL,
  `etage_salle` varchar(50) NOT NULL,
  `campus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `id_seance` int(11) NOT NULL,
  `date_seance` varchar(50) NOT NULL,
  `debut_seance` varchar(50) NOT NULL,
  `fin_seance` varchar(50) NOT NULL,
  `commentaire_seance` varchar(50) NOT NULL,
  `statut_seance` varchar(50) NOT NULL,
  `id_salle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Index pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD PRIMARY KEY (`id_class`,`id_module`),
  ADD KEY `Appartient__module0_FK` (`id_module`);

--
-- Index pour la table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id_class`),
  ADD KEY `class__filiere_FK` (`id_filiere`);

--
-- Index pour la table `concerner`
--
ALTER TABLE `concerner`
  ADD PRIMARY KEY (`id_seance`,`id_planning`),
  ADD KEY `concerner__planning0_FK` (`id_planning`);

--
-- Index pour la table `contient`
--
ALTER TABLE `contient`
  ADD PRIMARY KEY (`id_horaire`,`id_dispo`),
  ADD KEY `contient_disponibilite0_FK` (`id_dispo`);

--
-- Index pour la table `demande`
--
ALTER TABLE `demande`
  ADD PRIMARY KEY (`id_demande`),
  ADD KEY `_demande__enseignant_FK` (`id_enseignant`),
  ADD KEY `_demande__admin0_FK` (`id_admin`);

--
-- Index pour la table `disponibilite`
--
ALTER TABLE `disponibilite`
  ADD PRIMARY KEY (`id_dispo`),
  ADD KEY `disponiblite_enseignant_FK` (`id_enseignant`);

--
-- Index pour la table `element_module`
--
ALTER TABLE `element_module`
  ADD PRIMARY KEY (`id_element_module`),
  ADD KEY `element_module__module_FK` (`id_module`);

--
-- Index pour la table `enseignant`
--
ALTER TABLE `enseignant`
  ADD PRIMARY KEY (`id_enseignant`);

--
-- Index pour la table `enseigne`
--
ALTER TABLE `enseigne`
  ADD PRIMARY KEY (`id_element_module`,`id_enseignant`),
  ADD KEY `enseigne_enseignant0_FK` (`id_enseignant`);

--
-- Index pour la table `est_plannifier`
--
ALTER TABLE `est_plannifier`
  ADD PRIMARY KEY (`id_seance`,`id_element_module`),
  ADD KEY `est_plannifier__element_module0_FK` (`id_element_module`);

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id_etudiant`),
  ADD KEY `etudiant__groupe0_FK` (`id_group`);

--
-- Index pour la table `filiere`
--
ALTER TABLE `filiere`
  ADD PRIMARY KEY (`id_filiere`);

--
-- Index pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id_group`),
  ADD KEY `groupe__class_FK` (`id_class`);

--
-- Index pour la table `horaire`
--
ALTER TABLE `horaire`
  ADD PRIMARY KEY (`id_horaire`);

--
-- Index pour la table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id_module`);

--
-- Index pour la table `planning`
--
ALTER TABLE `planning`
  ADD PRIMARY KEY (`id_planning`),
  ADD KEY `planning__admin_FK` (`id_admin`);

--
-- Index pour la table `salle`
--
ALTER TABLE `salle`
  ADD PRIMARY KEY (`id_salle`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`id_seance`),
  ADD KEY `seance__salle_FK` (`id_salle`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `class`
--
ALTER TABLE `class`
  MODIFY `id_class` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `demande`
--
ALTER TABLE `demande`
  MODIFY `id_demande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `disponibilite`
--
ALTER TABLE `disponibilite`
  MODIFY `id_dispo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `element_module`
--
ALTER TABLE `element_module`
  MODIFY `id_element_module` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `enseignant`
--
ALTER TABLE `enseignant`
  MODIFY `id_enseignant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id_etudiant` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `filiere`
--
ALTER TABLE `filiere`
  MODIFY `id_filiere` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id_group` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `horaire`
--
ALTER TABLE `horaire`
  MODIFY `id_horaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `module`
--
ALTER TABLE `module`
  MODIFY `id_module` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `planning`
--
ALTER TABLE `planning`
  MODIFY `id_planning` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `salle`
--
ALTER TABLE `salle`
  MODIFY `id_salle` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `seance`
--
ALTER TABLE `seance`
  MODIFY `id_seance` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `appartient`
--
ALTER TABLE `appartient`
  ADD CONSTRAINT `Appartient__module0_FK` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`),
  ADD CONSTRAINT `Appartient_class_FK` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`);

--
-- Contraintes pour la table `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class__filiere_FK` FOREIGN KEY (`id_filiere`) REFERENCES `filiere` (`id_filiere`);

--
-- Contraintes pour la table `concerner`
--
ALTER TABLE `concerner`
  ADD CONSTRAINT `concerner__planning0_FK` FOREIGN KEY (`id_planning`) REFERENCES `planning` (`id_planning`),
  ADD CONSTRAINT `concerner__seance_FK` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`);

--
-- Contraintes pour la table `contient`
--
ALTER TABLE `contient`
  ADD CONSTRAINT `contient_attribut_FK` FOREIGN KEY (`id_horaire`) REFERENCES `horaire` (`id_horaire`),
  ADD CONSTRAINT `contient_disponibilite0_FK` FOREIGN KEY (`id_dispo`) REFERENCES `disponibilite` (`id_dispo`);

--
-- Contraintes pour la table `demande`
--
ALTER TABLE `demande`
  ADD CONSTRAINT `_demande__admin0_FK` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`),
  ADD CONSTRAINT `_demande__enseignant_FK` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`);

--
-- Contraintes pour la table `disponibilite`
--
ALTER TABLE `disponibilite`
  ADD CONSTRAINT `disponiblite_enseignant_FK` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`) ON DELETE CASCADE;

--
-- Contraintes pour la table `element_module`
--
ALTER TABLE `element_module`
  ADD CONSTRAINT `element_module__module_FK` FOREIGN KEY (`id_module`) REFERENCES `module` (`id_module`);

--
-- Contraintes pour la table `enseigne`
--
ALTER TABLE `enseigne`
  ADD CONSTRAINT `enseigne__element_module_FK` FOREIGN KEY (`id_element_module`) REFERENCES `element_module` (`id_element_module`),
  ADD CONSTRAINT `enseigne_enseignant0_FK` FOREIGN KEY (`id_enseignant`) REFERENCES `enseignant` (`id_enseignant`);

--
-- Contraintes pour la table `est_plannifier`
--
ALTER TABLE `est_plannifier`
  ADD CONSTRAINT `est_plannifier__element_module0_FK` FOREIGN KEY (`id_element_module`) REFERENCES `element_module` (`id_element_module`),
  ADD CONSTRAINT `est_plannifier__seance_FK` FOREIGN KEY (`id_seance`) REFERENCES `seance` (`id_seance`);

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant__groupe0_FK` FOREIGN KEY (`id_group`) REFERENCES `groupe` (`id_group`);

--
-- Contraintes pour la table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `groupe__class_FK` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`);

--
-- Contraintes pour la table `planning`
--
ALTER TABLE `planning`
  ADD CONSTRAINT `planning__admin_FK` FOREIGN KEY (`id_admin`) REFERENCES `admin` (`id_admin`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `seance__salle_FK` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
