DROP TABLE IF EXISTS `tarefa`;
               
CREATE TABLE `tarefa` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(200) NOT NULL,
  `descricao` longtext NOT NULL,
  `data_criacao` datetime NOT NULL,
  `prazo` datetime NOT NULL,
  `idtipo` BIGINT(20) NOT NULL,
  `idprioridade` BIGINT(20) NOT NULL,
  `idstatus` BIGINT(20) NOT NULL,
  `atribuido` BIGINT(20) NOT NULL,
  `criadapor` BIGINT(20) NOT NULL,
  PRIMARY KEY (`id`)
);
 
-- ---
-- Table 'usuario'
--
-- ---
 
DROP TABLE IF EXISTS `usuario`;
               
CREATE TABLE `usuario` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `admin` INTEGER(1) NOT NULL DEFAULT 0,
  `nome` VARCHAR(200) NOT NULL,
  `mail` VARCHAR(200) NOT NULL,
  `senha` VARCHAR(6) NOT NULL,
  PRIMARY KEY (`id`)
);
 
-- ---
-- Table 'tipo'
--
-- ---
 
DROP TABLE IF EXISTS `tipo`;
               
CREATE TABLE `tipo` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`)
);
 
-- ---
-- Table 'prioridade'
--
-- ---
 
DROP TABLE IF EXISTS `prioridade`;
               
CREATE TABLE `prioridade` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `prioridade` VARCHAR(100) NOT NULL DEFAULT 'NULL',
  PRIMARY KEY (`id`)
);
 
-- ---
-- Table 'status'
--
-- ---
 
DROP TABLE IF EXISTS `status`;
               
CREATE TABLE `status` (
  `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`)
);