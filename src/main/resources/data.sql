DELETE FROM SC_AGENDAMENTO; 
DELETE FROM SC_RECEITA_MEDICAMENTO; 
DELETE FROM SC_RECEITA;
DELETE FROM SC_EXAME_SOLICITACAO_EXAME;
DELETE FROM SC_SOLICITACAO_EXAME;
DELETE FROM SC_EXAME; 
DELETE FROM SC_MEDICAMENTO; 
DELETE FROM SC_ATENDIMENTO;
DELETE FROM SC_RESULTADO_EXAME;
DELETE FROM SC_PACIENTE;
DELETE FROM SC_MEDICO;
DELETE FROM SC_RECEPCIONISTA;

DELETE FROM USER_ROLE;
DELETE FROM ROLE;
DELETE FROM USER;

--DELETE FROM SC_SEC_USUARIO_GRUPOS;
DELETE FROM SC_SEC_USUARIO_GRUPO;
--DELETE FROM SC_SEC_USUARIO_PERMISSOES;
DELETE FROM SC_SEC_GRUPO_PERMISSOES;
DELETE FROM SC_SEC_GRUPO;
DELETE FROM SC_SEC_PERMISSAO;
DELETE FROM SC_SEC_USUARIO;


-- USUARIOS
INSERT INTO ROLE VALUES (1, 'ADMIN');

-- OPCIONAL
INSERT INTO USER VALUES (1, 1, 'teste@teste.com', 'last name', 'name', '$2a$10$IzpvPiq.R5pAMhPbA430yekFGV18tOVw9YLAbhJuqf5.MbWjvj6cm');
INSERT INTO USER_ROLE VALUES (1, 1);





-- MEDICAMENTOS
DELETE FROM SC_RECEITA_MEDICAMENTO; 
DELETE FROM SC_RECEITA;

DELETE FROM SC_MEDICAMENTO;

INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (1, 'diclofenaco',          'Diclac P','SANDOZ','SUSPENSAO ORAL 1,8 MG/ML');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (2, 'diclofenaco potassico','Clofen K','NECKERMAN','COMP. REV. 50MG');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (3, 'diclofenaco potassico','Diclac P','SANDOZ','DRAGEA SIMPLES 50MG');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (4, 'diclofenaco potassico','Fenaflan','TEUTO','COMP. DISPERSIVEL 44,3MG');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (5, 'diclofenaco potassico','Fenaflan','TEUTO','COMP. REV. 50MG');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (6, 'diclofenaco potassico','Fenaflan','TEUTO','SUSPENSAO ORAL 15MG/ML');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (7, 'diclofenaco potassico','Fenaren','UNIAO QUIMICA','SUSPENSAO ORAL 15MG/ML');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (8, 'diclofenaco potassico','Neotaflan','BRAINFARMA','SOL. INJETAVEL 25MG/ML');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (9, 'diclofenaco potassico','Probenxil','CIMED','COMP. REV. 50MG');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (10, 'diclofenaco potassico','Probenxil','CIMED','SUSPENSAO ORAL 15MG/ML');
INSERT INTO SC_MEDICAMENTO (ID, NOME_GENERICO, NOME_FABRICA, FABRICANTE, CONCENTRACAO_FORMA_FARMACEUTICA) VALUES (11, 'diclofenaco resinato','Diclac P','SANDOZ','SUSPENSAO ORAL 44,94 MG/ML'); 

-- RECEITA


-- MEDICOS
DELETE FROM SC_MEDICO;
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values (99,'9999', '412.077.271-30', '1901-01-01', 'NOME', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 1,'0001', '212.280.227-80', '1980-01-01', 'Tomás Leonardo Iago Cardoso', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 2,'0002', '600.741.807-38', '1981-02-02', 'Diogo Oliver Mendes', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 3,'0003', '899.841.523-24', '1982-03-03', 'Joaquim Kaique Igor Pereira', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 4,'0004', '166.942.600-91', '1983-04-04', 'Ruan Iago Alexandre Araújo', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 5,'0005', '297.250.087-31', '1984-05-05', 'Mário Miguel Julio da Rocha', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 6,'0006', '681.845.545-08', '1985-06-06', 'Elza Priscila Liz Peixoto', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 7,'0007', '898.281.494-94', '1986-07-07', 'Andrea Sophie Barros', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 8,'0008', '952.744.690-27', '1987-08-08', 'Kamilly Márcia Santos', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 9,'0009', '526.400.098-00', '1988-09-09', 'Francisca Emanuelly Almada', 'RUA');
-- INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values (10,'0010', '615.120.781-58', '1989-10-10', 'Natália Eloá Valentina Ribeiro', 'RUA');



-- EXAMES
DELETE FROM SC_EXAME_SOLICITACAO_EXAME;
DELETE FROM SC_SOLICITACAO_EXAME;
DELETE FROM SC_EXAME;

INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (1,'17- OH- Progesterona','17-alfa-hidroxiprogesterona - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (2,'Ácido Ascórbico - Vitamina C','Ácido ascórbico (vitamina C) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (3,'Ácido Fólico','Ácido fólico, pesquisa e/ou dosagem nos eritrócitos');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (4,'Ácido Úrico','Ácido úrico - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (5,'ACTH','Adrenocorticotrófico, hormônio (ACTH) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (6,'Albumina','Albumina - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (7,'Alumínio','Alumínio, pesquisa e/ou dosagem no soro');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (8,'Amilase','Amilase - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (9,'Anti HBS','Hepatite B - HBSAC (anti-antígeno de superfície) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (10,'Anti HCV','Hepatite C - anti-HCV - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (11,'Anti HIV','HIV1+ HIV2, (determinação conjunta), pesquisa de anticorpos');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (12,'Anti LA /SSB','Anti-LA/SSB - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (13,'Anti RO/SSA','Anti-Ro/SSA - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (14,'Antibiograma (Colocar nas observações qual região)','Antibiograma automatizado');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (15,'Antibiograma urina','Antibiograma automatizado');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (16,'Anticoagulante Lúpico','Anticoagulante lúpico, pesquisa');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (17,'Anticorpos anti neutrófilos','Antineutrófilos (anca)  C - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (18,'Anticorpos anti tireoglobulina','Anticorpos antitireóide (tireoglobulina) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (19,'Anticorpos anti transglutaminas IGA, IGG colocar nas observações qual a necessária)','Anti transglutaminase tecidual - IgA');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (20,'Anticorpos totais anti - Trypanosoma cruzi','Chagas IgG - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (21,'Antígeno CA (CA 19.9, CA 125, CA 72-4, CA 15-3)-(colocar nas observações qual a necessária)','Marcadores tumorais (CA 19.9, CA 125, CA 72-4, CA 15-3, etc.) cada - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (22,'Antiperoxidade tireoideana -TPO - AMM','Antiperoxidase tireoideana - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (23,'Atividade da Biotinidase','Biotinidase atividade da, qualitativo - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (24,'Atividade da Glicose- 6- Fosfato Desidrogenase','Glicose-6-fosfato deidrogenase (G6FD) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (25,'Beta HCG','Hormônio gonodotrofico corionico quantitativo (HCG-Beta-HCG) - dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (26,'Bilirrubinas T + F','Bilirrubinas (direta, indireta e total) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (27,'Cálcio','Cálcio - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (28,'Cardiolipina IGA','Anticardiolipina - IgA - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (29,'Cardiolipina IGG','Anticardiolipina - IgG - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (30,'Cardiolipina IGM','Anticardiolipina - IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (31,'CEA - Antígeno carcinoembrionário','Antígeno carcinoembriogênico (CEA) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (32,'Chlamydia IGG','Chlamydia - IgG - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (33,'Chlamydia IGM','Chlamydia - IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (34,'Citomegalovírus IGG','Citomegalovírus IgG - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (35,'Citomegalovírus IGM','Citomegalovírus IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (36,'CK','Creatino fosfoquinase total (CK) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (37,'CKMB','Creatino fosfoquinase - fração MB - atividade - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (38,'Coagulograma','Coagulograma (TS, TC, prova do laço, retração do coágulo, contagem de plaquetas, tempo de protombina, tempo de tromboplastina, parcial ativado) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (39,'Colesterol HDL','Colesterol (HDL) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (40,'Colesterol LDL (colocar nas observações se Enzimático)','Colesterol (LDL) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (41,'Colesterol total','Colesterol total - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (42,'Colesterol VLDL','Colesterol (VLDL) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (43,'Coombs Direto','Coombs direto');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (44,'Coombs Indireto','Coombs indireto');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (45,'Coprocultura','Cultura, fezes: salmonella, shigella e escherichia coli enteropatogênicas (sorologia incluída)');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (46,'Creatinina','Creatinina - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (47,'Cromatografia de Aminoácidos','Cromatografia de aminoácidos (perfil qualitatitivo) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (48,'Eletroforese de Proteínas','Eletroforese de proteínas');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (49,'Endomisio IGA, IGG, IGM (colocar nas observações qual  a necessária)','Anticorpos antiendomisio - IgG, IgM, IgA (cada) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (50,'Epstein Baar IGG','Mononucleose, anti-VCA (EBV) IgG - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (51,'Epstein Baar IGM','Mononucleose, anti-VCA (EBV) IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (52,'Estradiol','Estradiol - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (53,'Exame comum de urina','Rotina de urina (caracteres físicos, elementos anormais e sedimentoscopia)');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (54,'Exame Cultural - Bacteriológico (colocar nas observações qual região)','Cultura automatizada - MICROBIOLOGIA');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (55,'FAN - anticorpos anti nucleo','Fator antinúcleo, (FAN) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (56,'Ferritina','Ferritina - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (57,'Ferro','Ferro sérico - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (58,'Fosfatase Alcalina','Fosfatase alcalina - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (59,'Fósforo','Fósforo - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (60,'FSH','Folículo estimulante, hormônio (FSH) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (61,'Galactose e Galactose -1 -Fosfato','Galactose - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (62,'Gliadina IGA','Antigliadina (glúten) - IgA - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (63,'Gliadina IGG','Antigliadina (glúten) - IgG - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (64,'Gliadina IGM','Antigliadina (glúten) - IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (65,'Glicose (colocar nas observações as variações; ex.: G20, Pós Prandial)','Glicose - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (66,'Gra - Bacterioscópico (colocar nas observações qual região)','Bacterioscopia (Gram, Ziehl, Albert  etc), por lâmina');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (67,'HbF, HbA, HbA2, HbS, HbC,HbD e outras','Hemoglobina (eletroforese) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (68,'HBS AG (antígeno Austrália)','Antígeno Austrália (HBSAG) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (69,'Hemoglobina Glicada','Hemoglobina glicada (Fração A1c) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (70,'Hemograma completo','Hemograma com contagem de plaquetas ou frações (eritrograma, leucograma, plaquetas)');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (71,'IGA na saliva','IgA na saliva - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (72,'IGE  por Alérgeno  (descrever quantidades na observação)','IgE, por alérgeno (cada) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (73,'IGE Específico','IgE, total - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (74,'IgM anti - Citomegalovírus','Citomegalovírus IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (75,'IgM anti - Treponema pallidum','Sífilis por PCR - pesquisa');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (76,'IgM anti - vírus da Rubéola','Rubéola - IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (77,'IgM anti- Toxoplasma gondii','Toxoplasmose IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (78,'Imunoglobulina IGA','IgA - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (79,'Imunoglobulina IGE','IgE, total - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (80,'Imunoglobulina IGG','IgG - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (81,'Imunoglobulina IGM','IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (82,'Insulina','Insulina - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (83,'IRT','Fibrose cística, pesquisa de uma mutação');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (84,'KTTP - Tempo de tromboplastina parcial ativada','Tempo de tromboplastina parcial ativada - determinação');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (85,'LH','Hormônio luteinizante (LH) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (86,'Lipase','Lipase - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (87,'Micológico Cultural (colocar nas observações qual região)','Exame micológico - cultura e identificação de colônia');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (88,'Micológico Direto (colocar nas observações qual região)','Exame micológico direto (por local)');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (89,'Microalbuminuria em amostra ou em urina de 24hs (colocar nas observações qual a necessária)','Microalbuminúria');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (90,'Parasitológico de Fezes (colocar nas observações a quantidade)','Parasitológico - nas fezes');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (91,'PKU','Fenilcetonúria, pesquisa');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (92,'Potássio','Potássio - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (93,'Proteína C Reativa','Proteína C reativa, quantitativa - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (94,'Proteínas Totais','Proteínas totais - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (95,'Proteínas Totais e Frações','Proteínas totais albumina e globulina - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (96,'PSA livre','Antígeno específico prostático livre (PSA livre) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (97,'PSA Total','Antígeno específico prostático total (PSA) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (98,'SAG - Streptococcus Agalactie (colocar nas observações qual região)','Cultura bacteriana (em diversos materiais biológicos)');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (99,'Sódio','Sódio - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (100,'T3','Triiodotironina (T3) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (101,'T3 Livre','T3 livre - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (102,'T4','Provas de função tireoideana (T3, T4, índices e TSH)');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (103,'T4 Livre','T4 livre - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (104,'TAP -  Tempo de Atividade da Protrombina','Tempo de protrombina - determinação');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (105,'Tempo De Coagulação','Tempo de coagulação - determinação');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (106,'Tempo De Sangramento','Tempo de sangramento (Duke) - determinação');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (107,'Testosterona Livre','Testosterona livre - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (108,'Testosterona Total','Testosterona total - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (109,'TGO - transaminases oxalacética','Transaminase oxalacética (amino transferase aspartato) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (110,'TGP - transaminases pirúvica','Transaminase pirúvica (amino transferase de alanina) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (111,'Toxoplasmose IGA','Toxoplasmose - IgA - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (112,'Toxoplasmose IGG','Toxoplasmose IgG - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (113,'Toxoplasmose IGM','Toxoplasmose IgM - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (114,'Triglicerídeos','Triglicerídeos - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (115,'Troponina','Troponina - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (116,'TSH','Tireoestimulante, hormônio (TSH) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (117,'Ureia','Uréia - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (118,'Urocultura urina','Cultura automatizada - MICROBIOLOGIA');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (119,'VDRL','Sífilis - VDRL');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (120,'VHS','Hemossedimentação, (VHS) - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (121,'Vitamina B12','Vitamina B12 - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (122,'Vitamina D3, 1,25 hidroxi','1,25-dihidroxi vitamina D - pesquisa e/ou dosagem');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (123,'Vitamina D3, 25 hidroxi','Vitamina "D" 25 HIDROXI, pesquisa e/ou dosagem (Vitamina D3) ');
INSERT INTO SC_EXAME (ID, NOME, DESCRICAO) VALUES (124,'Zinco','Zinco - pesquisa e/ou dosagem');

-- PESSOAS 
-- DROP TABLE TEMP_PESSOA;
CREATE TABLE TEMP_PESSOA(
    ID VARCHAR(255),
    DATA_CRIACAO TIMESTAMP,
    BAIRRO VARCHAR(255),
    CEP VARCHAR(255),
    CIDADE VARCHAR(255),
    CPF VARCHAR(255),
    DT_NASCIMENTO DATE,
    ENDERECO VARCHAR(255),
    ESTADO VARCHAR(255),
    NOME VARCHAR(255)
);
-- ALTER TABLE PUBLIC.TEMP_PESSOA ADD CONSTRAINT PUBLIC.CONSTRAINT_EF PRIMARY KEY(ID);

DELETE FROM TEMP_PESSOA;
INSERT INTO TEMP_PESSOA (ID, NOME, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, CEP, CIDADE, ESTADO) VALUES
( 1, 'Danilo Cavalcante', '400.682.995-75', '1955-01-03', 'Avenida Espirito Santo, 816', 'Quadro Conjuntos', '58000-000', 'João Pessoa', 'PB'),
( 2, 'Gabriela Pilar', '375.511.562-08', '1972-04-16', 'Rua Diamente, 817', 'Primeiro de Maio', '30000-000', 'Belo Horizonte', 'MG'),
( 3, 'Gabriela Batista', '558.082.135-25', '1961-07-12', 'Av. Pedro XVX, 398', 'Santo Antônio', '50000-000', 'Recife', 'PE'),
( 4, 'Isaac Carvalho', '414.649.073-15', '1993-04-21', 'Avenida Sergipe, 233', 'E', '23799-000', 'Rio de Janeiro', 'RJ'),
( 5, 'Júlia De Oliveira', '366.017.195-60', '1957-01-14', 'Rua Doze, 1372', 'Principal', '69000-000', 'Manaus', 'AM'),
( 6, 'Hugo Morais', '638.965.384-03', '1968-07-24', 'Av. dos Sonhos, 1663', 'H', '65099-000', 'São Luiz', 'MA'),
( 7, 'Gabriel Garcia', '880.364.125-43', '1983-06-07', 'Rua Primeiro de Maio, 1814', 'Um', '79680-000', 'Água Clara', 'MS'),
( 8, 'Manuela Souza', '960.548.268-16', '1993-01-23', 'Rua Rubi, 207', 'Conjuto 1', '88100-000', 'Florianópolis', 'SC'),
( 9, 'Duarte Mesquita', '547.955.181-73', '2002-05-05', 'Rua Avenida Horizonte, 245', 'D', '66999-000', 'Belém', 'PA'),
( 10, 'Murilo Suarez', '528.595.239-52', '1958-05-24', 'Rua A, 953', 'Santo Antônio', '41999-000', 'Salvador', 'BA'),
( 11, 'Joaquim Menezes', '743.631.265-07', '1953-12-09', 'Rua Doze, 53', '3', '86300-000', 'Cornélio Procópio', 'PR'),
( 12, 'Bárbara Menezes', '067.388.219-56', '1959-11-29', 'Rua Onze, 321', '1', '91999-000', 'Porto Alegre', 'RS'),
( 13, 'Lia Neves', '348.545.661-67', '1992-10-02', 'Av. Pedro XVX, 1905', 'Conjunto B', '70999-000', 'Brasília', 'DF'),
( 14, 'Paola Maia', '759.566.813-14', '1968-11-09', 'Rua Um, 406', 'Conjuto D', '50000-000', 'Recife', 'PE'),
( 15, 'Vicente Sampaio', '213.917.408-90', '1967-01-25', 'Av. João Pombo, 331', '1', '86300-000', 'Cornélio Procópio', 'PR'),
( 16, 'Ariela Alves', '136.954.501-00', '1954-01-19', 'Rua Um, 1932', 'Treze', '50000-000', 'Recife', 'PE'),
( 17, 'Clarisse Alencar', '528.658.181-10', '1975-05-09', 'Rua Cinco, 574', 'Diamente', '69000-000', 'Manaus', 'AM'),
( 18, 'Bryan Martinez', '021.929.105-50', '1954-05-25', 'Av. João Pombo, 1799', 'Siqueira Lima', '78480-000', 'Cuiabá', 'MT'),
( 19, 'Eduardo Xavier', '825.586.376-14', '1970-11-28', 'Avenida São José, 1830', 'João Lima', '69000-000', 'Manaus', 'AM'),
( 20, 'Matheus Menezes', '519.429.396-80', '1998-10-05', 'Av. Santiago, 560', 'Nove', '82999-000', 'Curitiba', 'PR'),
( 21, 'Guilherme Paris', '180.621.594-26', '1985-05-06', 'Av. João Pombo, 1504', 'Cinco', '57099-000', 'Maceió', 'AL'),
( 22, 'Calebe Amaral', '666.930.789-66', '1951-10-20', 'Avenida Seis, 512', 'Santo Antônio', '70999-000', 'Brasília', 'DF'),
( 23, 'Micaela Martinele', '325.952.704-43', '1997-03-18', 'Rua 1, 1625', 'Principal', '70999-000', 'Brasília', 'DF'),
( 24, 'Ariana Rocha', '056.816.892-55', '1966-09-20', 'Av. Xv, 1251', 'Conjuto 3', '60000-000', 'Fortaleza', 'CE'),
( 25, 'Leandro Mello', '855.024.733-25', '1989-07-19', 'Av. dos Sonhos, 180', 'Conjunto B', '86300-000', 'Cornélio Procópio', 'PR'),
( 26, 'Lorenzo Sampaio', '240.521.431-83', '1970-04-17', 'Rua João Quinze, 1534', 'Espirito Santo', '50000-000', 'Recife', 'PE'),
( 27, 'Carol Barcellos', '638.109.844-93', '1953-05-11', 'Rua I, 1557', 'Dez', '41999-000', 'Salvador', 'BA'),
( 28, 'Filipe Leão', '766.493.111-89', '1973-12-12', 'Rua Um, 516', 'Dois', '23799-000', 'Rio de Janeiro', 'RJ'),
( 29, 'Bryan Martinez', '491.000.881-02', '1952-09-22', 'Av. Três, 1979', 'Conjunto A', '29099-000', 'Vitória', 'ES'),
( 30, 'João Oliveira', '055.512.751-67', '1955-08-30', 'Av. Pombo Rocha, 602', 'Conjuto 2', '60000-000', 'Fortaleza', 'CE'),
( 31, 'Lis Paris', '529.853.808-80', '1959-12-19', 'Avenida São José, 1547', 'Um', '86300-000', 'Cornélio Procópio', 'PR'),
( 32, 'Rebeca Araújo', '228.039.099-01', '1972-01-17', 'Rua 3, 1025', 'João Rocha', '69000-000', 'Manaus', 'AM'),
( 33, 'Vinicios Soares', '593.278.394-04', '1965-11-28', 'Rua 1, 1024', 'Seis', '23799-000', 'Rio de Janeiro', 'RJ'),
( 34, 'Marina Lima', '641.980.215-62', '1976-02-22', 'Rua C, 1405', 'Cinco', '60000-000', 'Fortaleza', 'CE'),
( 35, 'Maria Clara Lacerda', '945.910.517-30', '1981-01-23', 'Rua 2, 457', 'Conjuto 4', '59000-000', 'Natal', 'RN'),
( 36, 'Rafaela Costa', '701.010.006-34', '1980-11-12', 'Rua 1, 144', 'Posto Norte', '49099-000', 'Aracaju', 'SE'),
( 37, 'Angelina Barcellos', '790.541.058-79', '1966-01-30', 'Av. Três, 472', 'Espirito Santo', '66999-000', 'Belém', 'PA'),
( 38, 'Rebeca Oliveira', '777.388.071-99', '1961-05-13', 'Rua 3, 599', 'Conjunto B', '82999-000', 'Curitiba', 'PR'),
( 39, 'Ângelo Oliveira', '112.934.716-82', '1950-12-01', 'Av. Xv, 347', 'Santo Antônio', '29099-000', 'Vitória', 'ES'),
( 40, 'Rafaela Neves', '435.147.132-86', '1971-01-25', 'Rua Esmeralda, 1610', 'João Lima', '78480-000', 'Cuiabá', 'MT'),
( 41, 'Victor Gonçalves', '696.849.395-07', '1983-07-27', 'Rua A, 1533', 'Conjunto A', '79680-000', 'Água Clara', 'MS'),
( 42, 'Luisa Lima', '697.453.534-18', '1977-03-19', 'Rua C, 1815', 'Conjuto 2', '88100-000', 'Florianópolis', 'SC'),
( 43, 'Rodrigo Vasconcelos', '805.880.134-80', '1987-07-17', 'Av. Xv, 302', 'Conjunto C', '59000-000', 'Natal', 'RN'),
( 44, 'Clara Moraes', '610.886.233-52', '1986-06-05', 'Rua Paraíba, 1400', 'João Rocha', '86300-000', 'Cornélio Procópio', 'PR'),
( 45, 'Yasmin Araújo', '162.540.132-90', '1981-05-09', 'Rua Santo Antônio, 1290', 'C', '70999-000', 'Brasília', 'DF'),
( 46, 'Alexander Mello', '789.340.873-15', '1959-09-09', 'Rua João Gabriel, 1277', 'Limeira', '70999-000', 'Brasília', 'DF'),
( 47, 'Benjamim Bernardes', '416.877.887-82', '1953-12-28', 'Avenida São José, 657', 'Dez', '80000-000', 'São Paulo', 'SP'),
( 48, 'Guilherme Gomes', '235.967.441-21', '1958-09-13', 'Avenida Sergipe, 417', 'G', '69000-000', 'Manaus', 'AM'),
( 49, 'Mateus Moreira', '334.910.089-99', '1976-09-13', 'Avenida São José, 1106', '2', '69000-000', 'Manaus', 'AM'),
( 50, 'Raquel Freitas', '947.095.317-73', '1991-09-03', 'Rua 1, 838', 'Horizonte', '70999-000', 'Brasília', 'DF'),
( 51, 'Alessandra Gomes', '598.626.781-86', '1990-08-29', 'Rua Doze, 1388', 'Conjunto B', '82999-000', 'Curitiba', 'PR'),
( 52, 'Sophia Costa', '274.786.934-23', '1996-04-07', 'Rua A, 894', 'Cinco', '80000-000', 'São Paulo', 'SP'),
( 53, 'Thiago Chaves', '301.780.861-00', '1982-07-11', 'Rua G, 480', 'João Rocha', '23799-000', 'Rio de Janeiro', 'RJ'),
( 54, 'Pablo Batista', '487.667.543-05', '1971-04-16', 'Av. João Pombo, 1228', 'Um', '86300-000', 'Cornélio Procópio', 'PR'),
( 55, 'Isadora Garcia', '325.759.699-56', '1983-09-12', 'Av. Santiago, 558', 'Jardim Pérola', '49099-000', 'Aracaju', 'SE'),
( 56, 'Ana Beatriz De Oliveira', '797.156.822-35', '1988-05-05', 'Av. João Pombo, 1231', 'Principal', '68914-000', 'Macapá', 'AP'),
( 57, 'Isis Monteiro', '544.366.892-71', '1995-12-22', 'Rua dos Amigos, 705', 'D', '91999-000', 'Porto Alegre', 'RS'),
( 58, 'Ana Clara Monteiro', '099.017.689-42', '1987-06-09', 'Rua Paraíba, 716', 'Conjuto 2', '68914-000', 'Macapá', 'AP'),
( 59, 'Ana Júlia Paes', '734.486.567-04', '1976-09-27', 'Rua Esmeralda, 693', 'Brasil', '69339-000', 'Boa Vista', 'RR'),
( 60, 'Vitória Alencar', '676.062.548-00', '1975-12-24', 'Rua Oito, 1412', 'Perola', '82999-000', 'Curitiba', 'PR'),
( 61, 'Helena Garcia', '074.799.699-70', '1973-04-16', 'Rua Principal, 231', 'Doze', '91999-000', 'Porto Alegre', 'RS'),
( 62, 'Estela Leão', '831.953.524-78', '1977-12-22', 'Av. Santiago, 1389', 'E', '80000-000', 'São Paulo', 'SP'),
( 63, 'Diogo Cavalcante', '939.298.533-96', '1981-11-16', 'Avenida São José, 1329', 'Conjuto 1', '29099-000', 'Vitória', 'ES'),
( 64, 'Lucca Albuquerque', '371.891.746-72', '1987-09-14', 'Rua João Quinze, 1343', 'Conjuto 1', '50000-000', 'Recife', 'PE'),
( 65, 'Isis Morais', '481.578.294-61', '1957-12-22', 'Av. Três, 1183', 'Um', '57099-000', 'Maceió', 'AL'),
( 66, 'Mariana Freitas', '447.234.942-60', '1958-09-29', 'Avenida Sergipe, 1055', 'Jardim Pérola', '88100-000', 'Florianópolis', 'SC'),
( 67, 'Isabelly Oliveira', '901.550.409-10', '1978-12-19', 'Av. Três, 1038', 'Posto Norte', '69000-000', 'Manaus', 'AM'),
( 68, 'Igor Muniz', '539.927.946-01', '1979-12-21', 'Av. São Paulo, 883', 'Posto Norte', '86300-000', 'Cornélio Procópio', 'PR'),
( 69, 'Lorenzo Paiva', '777.538.740-80', '1967-06-18', 'Rua I, 1485', 'Primeiro de Maio', '30000-000', 'Belo Horizonte', 'MG'),
( 70, 'João Lucas Pereira', '559.534.768-68', '1973-03-31', 'Rua G, 364', 'B', '50000-000', 'Recife', 'PE'),
( 71, 'Bianca Galisteu', '092.561.638-96', '1992-10-06', 'Rua B, 1996', 'Conjuto D', '29099-000', 'Vitória', 'ES'),
( 72, 'Emanuel Bernardes', '549.556.589-46', '1980-04-08', 'Avenida Sergipe, 512', 'Jardim Pérola', '80000-000', 'São Paulo', 'SP'),
( 73, 'Abel Menezzes', '212.630.129-06', '1973-07-02', 'Rua Sete, 1020', 'Seis', '58000-000', 'João Pessoa', 'PB'),
( 74, 'Davi Lucca Pinheiro', '183.589.676-67', '1953-06-01', 'Rua Cinco, 244', 'H', '64099-000', 'Teresina', 'PI'),
( 75, 'Davi Medeiros', '326.619.939-16', '1967-01-17', 'Av. Dom Pedro II, 222', 'Dez', '66999-000', 'Belém', 'PA'),
( 76, 'Emanuela Gonçalves', '347.004.510-09', '1958-09-20', 'Rua D, 342', 'Um', '69920-000', 'Rio Branco', 'AC'),
( 77, 'Manuel Frota', '615.342.049-46', '1978-09-03', 'Avenida São José, 1831', '2', '68914-000', 'Macapá', 'AP'),
( 78, 'Apólo Amaral', '297.273.317-77', '1983-01-05', 'Avenida Seis, 261', 'Diamente', '91999-000', 'Porto Alegre', 'RS'),
( 79, 'Gustavo Andrade', '089.161.297-10', '1961-06-20', 'Av. Pombo Rocha, 52', 'Conjuto 4', '79680-000', 'Água Clara', 'MS'),
( 80, 'Melissa Oliveira', '956.674.908-20', '1958-06-15', 'Rua Um, 310', 'Espirito Santo', '88100-000', 'Florianópolis', 'SC'),
( 81, 'Mariana Vieira', '631.326.018-02', '1953-10-11', 'Rua Esmeralda, 188', 'C', '82999-000', 'Curitiba', 'PR'),
( 82, 'Marina Lessa', '578.568.695-34', '1989-06-18', 'Av. João Pombo, 1316', 'Jardim Esperança', '69000-000', 'Manaus', 'AM'),
( 83, 'Heitor Pinheiro', '609.341.760-35', '2001-03-31', 'Rua Cinco, 1244', '3', '70999-000', 'Brasília', 'DF'),
( 84, 'Diego Moreira', '272.436.211-04', '1999-02-10', 'Rua A, 1519', 'Paraíba', '66999-000', 'Belém', 'PA'),
( 85, 'João Miguel Barreto', '810.802.286-08', '1951-06-04', 'Rua F, 649', 'Cinco', '69000-000', 'Manaus', 'AM'),
( 86, 'Rafael Pilar', '347.676.202-52', '1984-12-04', 'Rua 1, 455', 'Conjuto 4', '65099-000', 'São Luiz', 'MA'),
( 87, 'Alice Nogueira', '714.275.311-02', '1965-01-18', 'Avenida Brasil, 1346', 'C', '88100-000', 'Florianópolis', 'SC'),
( 88, 'Helena Barreto', '939.591.841-15', '1969-03-12', 'Rua Nove, 1878', 'Nogueira', '70999-000', 'Brasília', 'DF'),
( 89, 'Ana Júlia Oliveira', '680.824.904-03', '1967-07-13', 'Rua dos Amigos, 1667', 'Conjuto A', '30000-000', 'Belo Horizonte', 'MG'),
( 90, 'Felipe Ferrari', '919.886.373-84', '1999-06-21', 'Rua dos Amigos, 851', 'Jardim Veneza', '88100-000', 'Florianópolis', 'SC'),
( 91, 'Guilherme Reis', '275.300.797-78', '1974-02-08', 'Av. São Paulo, 573', '1', '68914-000', 'Macapá', 'AP'),
( 92, 'Matheus Figueira', '02.795.519-24', '1959-01-23', 'Av. Santiago, 639', 'Onze', '79680-000', 'Água Clara', 'MS'),
( 93, 'Clara Mello', '291.839.359-24', '1981-08-27', 'Avenida Sergipe, 1295', '2', '23799-000', 'Rio de Janeiro', 'RJ'),
( 94, 'Rafaela Martinez', '598.807.609-21', '1966-08-03', 'Rua Cinco, 204', 'Conjuto D', '29099-000', 'Vitória', 'ES'),
( 95, 'Lorena Guimarães', '095.739.826-33', '1971-02-17', 'Rua 2, 890', 'Jardim Pérola', '79680-000', 'Água Clara', 'MS'),
( 96, 'Calebe De Oliveira', '110.738.811-21', '1988-08-10', 'Rua Sete, 1496', 'Cinco', '80000-000', 'São Paulo', 'SP'),
( 97, 'Eva Pilar', '980.388.904-42', '1969-07-10', 'Rua Dez, 1833', 'Conjuto A', '69920-000', 'Rio Branco', 'AC'),
( 98, 'Débora Oliveira', '277.563.492-37', '1958-06-24', 'Av. dos Sonhos, 836', 'E', '29099-000', 'Vitória', 'ES'),
( 99, 'Emanuelle Barreto', '108.817.957-63', '1986-09-08', 'Avenida Brasil, 1824', 'Martins de Souza', '60000-000', 'Fortaleza', 'CE'),
( 100, 'Juliano Guimarães', '399.963.992-06', '1968-01-19', 'Rua 1, 1518', 'Conjunto B', '49099-000', 'Aracaju', 'SE'),
( 101, 'Clara Nogueira', '835.123.844-98', '1957-04-27', 'Rua Rubi, 1642', 'Conjuto 2', '78480-000', 'Cuiabá', 'MT'),
( 102, 'Eduarda Martinele', '247.226.953-69', '1977-09-27', 'Rua E, 362', 'Conjuto 2', '68914-000', 'Macapá', 'AP'),
( 103, 'Esther Vieira', '656.325.845-00', '1953-02-19', 'Rua Primeiro de Maio, 1736', 'G', '69339-000', 'Boa Vista', 'RR'),
( 104, 'Joana Paes', '464.430.099-32', '1977-12-29', 'Av. São Paulo, 704', 'D', '23799-000', 'Rio de Janeiro', 'RJ'),
( 105, 'Alana Monteiro', '585.104.968-54', '1999-02-19', 'Rua João Quinze, 1471', 'Limeira', '49099-000', 'Aracaju', 'SE'),
( 106, 'Joaquim Rodrigues', '229.213.700-34', '1971-09-08', 'Rua Cinco, 1127', 'Nogueira', '49099-000', 'Aracaju', 'SE'),
( 107, 'Abigail Frota', '287.704.639-72', '1998-03-06', 'Rua Nove, 1796', 'Quadro Conjuntos', '88100-000', 'Florianópolis', 'SC'),
( 108, 'Lourenço Vasconcelos', '552.613.211-07', '1964-05-01', 'Rua dos Amigos, 1782', 'Horizonte', '30000-000', 'Belo Horizonte', 'MG'),
( 109, 'Iara De Novais', '648.706.728-80', '1986-07-11', 'Rua Sete, 1596', 'Jardim das Rosas', '79680-000', 'Água Clara', 'MS'),
( 110, 'Eduardo Duarte', '345.294.647-92', '1989-10-26', 'Rua D, 1664', 'Perola', '50000-000', 'Recife', 'PE'),
( 111, 'Beatriz Morais', '452.805.494-95', '1962-08-17', 'Rua H, 349', 'Dez', '65099-000', 'São Luiz', 'MA'),
( 112, 'Melissa De Oliveira', '866.254.780-08', '1974-08-17', 'Rua I, 221', 'C', '59000-000', 'Natal', 'RN'),
( 113, 'Ágata Soares', '852.485.830-39', '1975-08-23', 'Rua Avenida Horizonte, 749', 'Conjuto D', '64099-000', 'Teresina', 'PI'),
( 114, 'Larissa Medeiros', '491.850.886-33', '1977-03-12', 'Rua João Gabriel, 1915', 'D', '88100-000', 'Florianópolis', 'SC'),
( 115, 'Rebeca Pilar', '363.870.131-00', '1966-05-01', 'Rua Paraíba, 1202', 'Conjuto D', '78480-000', 'Cuiabá', 'MT'),
( 116, 'Laura Mello', '944.217.449-56', '1950-10-20', 'Rua João Quinze, 1922', 'Conjunto A', '49099-000', 'Aracaju', 'SE'),
( 117, 'Júlia Freitas', '091.839.900-97', '1975-07-30', 'Rua Avenida Horizonte, 1586', 'Marcelo Queiroz', '82999-000', 'Curitiba', 'PR'),
( 118, 'Lara Figueira', '425.164.222-88', '1959-01-17', 'Avenida Espirito Santo, 345', 'Cinco', '86300-000', 'Cornélio Procópio', 'PR'),
( 119, 'Benício Barcellos', '624.304.123-90', '1980-05-23', 'Rua Dois, 1320', 'Jardim Pérola', '50000-000', 'Recife', 'PE'),
( 120, 'Victor Martinez', '795.714.574-42', '1963-01-07', 'Rua G, 974', '3', '70999-000', 'Brasília', 'DF'),
( 121, 'Joaquim Gomes', '417.566.689-30', '1965-02-25', 'Rua Avenida Horizonte, 890', 'Santo Antônio', '86300-000', 'Cornélio Procópio', 'PR'),
( 122, 'Lara Gomes', '977.796.553-26', '2001-07-18', 'Rua Sete, 1547', 'Sergipe', '86300-000', 'Cornélio Procópio', 'PR'),
( 123, 'Maísa Vasconcelos', '789.717.117-52', '1970-05-20', 'Av. Pedro XVX, 847', '1', '78480-000', 'Cuiabá', 'MT'),
( 124, 'Rafael Muniz', '843.162.522-83', '1963-08-23', 'Rua Nove, 382', 'Espirito Santo', '91999-000', 'Porto Alegre', 'RS'),
( 125, 'Maria Alice Soares', '259.502.804-90', '1980-08-23', 'Rua 2, 25', 'Treze', '49099-000', 'Aracaju', 'SE'),
( 126, 'Eduardo Santos', '473.576.821-10', '1964-05-02', 'Rua B, 596', 'Conjuto 1', '29099-000', 'Vitória', 'ES'),
( 127, 'Laura Alves', '354.556.571-86', '1981-05-09', 'Rua D, 695', 'Dez', '80000-000', 'São Paulo', 'SP'),
( 128, 'Ana Barreto', '031.195.976-86', '1996-08-21', 'Rua Avenida Horizonte, 1495', 'Conjuto 4', '69920-000', 'Rio Branco', 'AC'),
( 129, 'Emanuel Carvalho', '870.645.759-22', '1951-09-11', 'Rua F, 564', 'Primeiro de Maio', '50000-000', 'Recife', 'PE'),
( 130, 'Igor Leão', '864.001.528-73', '1982-09-20', 'Av. João Pombo, 93', 'Cinco', '86300-000', 'Cornélio Procópio', 'PR'),
( 131, 'Brenda Mauricio', '794.538.065-44', '1970-06-09', 'Rua João Gabriel, 707', 'João Rocha', '70999-000', 'Brasília', 'DF'),
( 132, 'Francisco Nogueira', '772.974.670-06', '1981-09-04', 'Rua 1, 710', 'Conjunto B', '79680-000', 'Água Clara', 'MS'),
( 133, 'Anabela Bernardes', '641.126.064-86', '1996-03-23', 'Rua Nove, 1748', 'Martins de Souza', '30000-000', 'Belo Horizonte', 'MG'),
( 134, 'Cecília Monteiro', '463.078.405-52', '1958-02-13', 'Rua D, 1544', 'Conjuto B', '82999-000', 'Curitiba', 'PR'),
( 135, 'Danilo Marques', '556.695.251-83', '1998-08-14', 'Rua Paraíba, 1163', 'Dois', '69339-000', 'Boa Vista', 'RR'),
( 136, 'Isadora Muniz', '187.295.065-57', '1982-05-07', 'Rua Sete, 1743', 'Conjuto 4', '30000-000', 'Belo Horizonte', 'MG'),
( 137, 'Nicole Barreto', '945.113.058-62', '1962-08-06', 'Rua C, 974', 'Perola', '29099-000', 'Vitória', 'ES'),
( 138, 'Felipe Barreto', '970.668.682-77', '1992-10-17', 'Rua Sete, 1274', 'Principal', '91999-000', 'Porto Alegre', 'RS'),
( 139, 'Anderson Duarte', '283.510.507-76', '1976-10-28', 'Avenida Espirito Santo, 2', 'Conjuto 3', '41999-000', 'Salvador', 'BA'),
( 140, 'Ana Maia', '633.102.016-00', '1994-11-25', 'Avenida Brasil, 1312', 'Sete', '78480-000', 'Cuiabá', 'MT'),
( 141, 'Pietro Martins', '011.552.001-52', '1953-10-29', 'Rua dos Amigos, 1004', 'Sergipe', '59000-000', 'Natal', 'RN'),
( 142, 'Isa Paris', '781.616.952-37', '1974-01-27', 'Rua Oito, 181', 'Jardim Pérola', '69000-000', 'Manaus', 'AM'),
( 143, 'João Miguel Reis', '515.346.079-78', '1954-10-16', 'Avenida Seis, 1877', 'Siqueira Lima', '57099-000', 'Maceió', 'AL'),
( 144, 'Alan Carvalho', '246.714.896-35', '1989-10-12', 'Av. Pombo Rocha, 1876', 'D', '60000-000', 'Fortaleza', 'CE'),
( 145, 'João Queiroz', '407.486.157-76', '1979-08-07', 'Av. Pedro XVX, 1387', 'Onze', '60000-000', 'Fortaleza', 'CE'),
( 146, 'Alícia Santos', '629.367.983-02', '1963-12-06', 'Rua 1, 1737', 'C', '69339-000', 'Boa Vista', 'RR'),
( 147, 'Helena Alencar', '492.919.400-89', '1969-03-17', 'Rua 3, 826', 'Dez', '60000-000', 'Fortaleza', 'CE'),
( 148, 'Diana Queiroz', '437.034.669-01', '1982-03-07', 'Rua F, 1828', 'Conjuto D', '69000-000', 'Manaus', 'AM'),
( 149, 'Manuela Novaes', '574.374.037-22', '1969-03-17', 'Av. Pedro XVX, 821', 'G', '66999-000', 'Belém', 'PA'),
( 150, 'Nicolas Rocha', '883.459.400-21', '1999-08-09', 'Rua G, 353', 'Jardim Pérola', '57099-000', 'Maceió', 'AL'),
( 151, 'Catarina Costa', '515.270.203-71', '1957-02-27', 'Avenida Brasil, 1652', 'Conjunto C', '30000-000', 'Belo Horizonte', 'MG'),
( 152, 'Olívia Maximus', '316.701.765-17', '1959-12-02', 'Rua Sete, 770', 'Nove', '60000-000', 'Fortaleza', 'CE'),
( 153, 'Camila Gomes', '685.080.459-64', '1966-07-15', 'Av. Três, 59', 'E', '66999-000', 'Belém', 'PA'),
( 154, 'Raul Santana', '957.022.437-14', '1952-12-05', 'Rua Diamente, 810', 'Jardim das Rosas', '68914-000', 'Macapá', 'AP'),
( 155, 'Diego Soares', '369.314.235-17', '1952-01-25', 'Av. Três, 1401', 'Conjuto 2', '80000-000', 'São Paulo', 'SP'),
( 156, 'Gabriela Ribeiro', '777.823.808-04', '1953-11-21', 'Rua Principal, 1988', 'São José', '23799-000', 'Rio de Janeiro', 'RJ'),
( 157, 'Davi Lucas De Novais', '434.391.969-25', '1996-07-14', 'Avenida São José, 1812', 'Diamente', '64099-000', 'Teresina', 'PI'),
( 158, 'Vicente Boaventura', '910.121.811-54', '1960-07-31', 'Rua C, 3', 'Posto Norte', '58000-000', 'João Pessoa', 'PB'),
( 159, 'Lorena Pereira', '381.906.540-71', '1997-12-07', 'Rua C, 588', 'Primeiro de Maio', '68914-000', 'Macapá', 'AP'),
( 160, 'Benjamim Boaventura', '842.777.011-16', '1978-03-24', 'Rua Nove, 1633', 'Diamente', '59000-000', 'Natal', 'RN'),
( 161, 'Emanuela Queiroz', '211.234.831-08', '1980-02-26', 'Rua Cinco, 1118', 'Conjunto B', '30000-000', 'Belo Horizonte', 'MG'),
( 162, 'Miguel Leão', '108.571.052-13', '1967-08-03', 'Av. Quatro, 1287', 'Martins de Souza', '60000-000', 'Fortaleza', 'CE'),
( 163, 'Bruna Barreto', '402.342.321-10', '1969-08-28', 'Avenida Espirito Santo, 536', 'H', '70999-000', 'Brasília', 'DF'),
( 164, 'Ana Beatriz Andrade', '705.017.682-62', '1996-12-15', 'Rua Santo Antônio, 1308', 'Onze', '91999-000', 'Porto Alegre', 'RS'),
( 165, 'Fernando Gomes', '815.548.677-03', '1986-03-15', 'Rua Cinco, 1732', 'D', '80000-000', 'São Paulo', 'SP'),
( 166, 'Luana Suarez', '816.818.264-29', '1993-06-13', 'Avenida Seis, 191', 'H', '50000-000', 'Recife', 'PE'),
( 167, 'Leticia Paris', '030.757.729-50', '1979-01-14', 'Rua Avenida Horizonte, 1561', 'I', '80000-000', 'São Paulo', 'SP'),
( 168, 'Elisa Lacerda', '684.170.199-28', '1962-05-03', 'Rua B, 1955', 'Primeiro de Maio', '59000-000', 'Natal', 'RN'),
( 169, 'Henrique Vieira', '789.181.939-47', '1982-08-24', 'Av. Dom Pedro II, 1739', 'Perola', '57099-000', 'Maceió', 'AL'),
( 170, 'Joaquim Alves', '321.826.321-23', '1971-08-06', 'Av. Quatro, 1623', 'Conjuto 3', '70999-000', 'Brasília', 'DF'),
( 171, 'Vitor Novaes', '494.612.556-67', '1976-05-15', 'Rua 2, 1066', 'D', '82999-000', 'Curitiba', 'PR'),
( 172, 'Lucca Neves', '233.622.490-94', '1966-10-18', 'Rua Principal, 354', 'Principal', '69000-000', 'Manaus', 'AM'),
( 173, 'Alice Ribeiro', '524.585.433-32', '1975-07-07', 'Rua Cinco, 1502', 'Conjuto E', '59000-000', 'Natal', 'RN'),
( 174, 'Renan Ferrari', '413.435.721-77', '1967-12-18', 'Rua A, 151', '2', '64099-000', 'Teresina', 'PI'),
( 175, 'Henrique Oliveira', '458.851.137-85', '1953-03-24', 'Av. Xv, 1760', 'A', '23799-000', 'Rio de Janeiro', 'RJ'),
( 176, 'Alícia Vitor', '555.399.312-11', '1963-05-19', 'Av. Pombo Rocha, 325', 'João Lima', '88100-000', 'Florianópolis', 'SC'),
( 177, 'Esther Barreto', '558.002.109-77', '1957-04-27', 'Rua Esmeralda, 483', 'E', '69000-000', 'Manaus', 'AM'),
( 178, 'Maria Fernanda Soares', '842.506.381-70', '1970-08-27', 'Rua Diamente, 1109', 'Limeira', '29099-000', 'Vitória', 'ES'),
( 179, 'Lorenzo Morais', '597.610.904-77', '1955-03-10', 'Av. Santiago, 120', 'Sergipe', '79680-000', 'Água Clara', 'MS'),
( 180, 'Benjamim Queiroz', '917.030.800-41', '1953-01-05', 'Avenida São José, 522', 'Nove', '59000-000', 'Natal', 'RN'),
( 181, 'Flôr Vieira', '155.816.573-86', '1990-08-22', 'Rua F, 580', 'Seis', '86300-000', 'Cornélio Procópio', 'PR'),
( 182, 'Pedro Costa', '493.644.800-15', '1992-05-12', 'Rua Primeiro de Maio, 876', 'João Lima', '80000-000', 'São Paulo', 'SP'),
( 183, 'Melinda Oliveira', '834.670.457-74', '1968-01-13', 'Av. Pedro XVX, 658', 'Conjunto B', '59000-000', 'Natal', 'RN'),
( 184, 'Vicente Ferrari', '799.989.539-36', '1974-02-20', 'Rua Treze, 1745', 'D', '23799-000', 'Rio de Janeiro', 'RJ'),
( 185, 'Manuela Freitas', '484.329.665-17', '1958-07-13', 'Av. Dom Pedro II, 241', 'São Paulo', '49099-000', 'Aracaju', 'SE'),
( 186, 'Benjamim Campos', '135.235.351-23', '1978-10-26', 'Av. das Lameiras, 1719', 'Treze', '82999-000', 'Curitiba', 'PR'),
( 187, 'Leonardo Batista', '731.343.825-71', '1979-02-02', 'Av. Quatro, 1292', 'Siqueira Lima', '70999-000', 'Brasília', 'DF'),
( 188, 'Maria Luiza Costa', '533.119.786-84', '2001-12-28', 'Rua A, 1274', 'Oito', '79680-000', 'Água Clara', 'MS'),
( 189, 'Joana Araújo', '159.251.306-93', '1994-07-05', 'Rua João Gabriel, 944', 'Onze', '29099-000', 'Vitória', 'ES'),
( 190, 'Kevin Vieira', '464.866.442-65', '1962-08-04', 'Rua Sete, 1920', 'Jardim Veneza', '29099-000', 'Vitória', 'ES'),
( 191, 'Abel Martinele', '285.136.127-90', '1986-01-30', 'Rua Nove, 1184', '1', '88100-000', 'Florianópolis', 'SC'),
( 192, 'Caio Pereira', '730.943.061-10', '1982-09-03', 'Rua Oito, 608', 'Diamente', '57099-000', 'Maceió', 'AL'),
( 193, 'Ester Muniz', '540.840.221-52', '1999-09-30', 'Rua Avenida Horizonte, 1327', 'Quadro Conjuntos', '70999-000', 'Brasília', 'DF'),
( 194, 'Brenda Albuquerque', '721.958.977-83', '1974-02-08', 'Av. Dom Pedro II, 1660', 'Conjuto 4', '59000-000', 'Natal', 'RN'),
( 195, 'Samuel Freitas', '824.936.092-39', '1999-12-25', 'Rua B, 652', 'Cinco', '50000-000', 'Recife', 'PE'),
( 196, 'Lourenço Martinez', '855.509.428-36', '1954-09-28', 'Av. das Lameiras, 353', 'Sergipe', '58000-000', 'João Pessoa', 'PB'),
( 197, 'Adriana Cavalcante', '018.006.178-01', '1953-01-20', 'Av. Três, 290', 'Diamente', '23799-000', 'Rio de Janeiro', 'RJ'),
( 198, 'Lara Ribeiro', '976.408.705-18', '1996-01-29', 'Rua Esmeralda, 890', '3', '64099-000', 'Teresina', 'PI'),
( 199, 'Daniela Paiva', '105.577.394-03', '1963-08-21', 'Av. São Paulo, 1924', 'Oito', '64099-000', 'Teresina', 'PI'),
( 200, 'Lucas Martins', '880.057.361-42', '1963-11-07', 'Av. João Pombo, 1372', 'Conjunto C', '69339-000', 'Boa Vista', 'RR');

-- INSERT 20 MEDICOS
--INSERT INTO SC_MEDICO (ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CRM, COR_CALENDARIO)
--SELECT ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CONCAT(ID, '09', ID) CRM,
--       concat('', 
--              SELECT concat('#', SUBSTR((CAST(CAST(A AS INT) AS BINARY)), 3)) FROM (SELECT floor(random() * (CAST(CAST('FFFFFF' AS BINARY) AS INT) - CAST(CAST('100000' AS BINARY) AS INT) + 1) + CAST(CAST('100000' AS BINARY) AS INT) ) AS A )
--       )
--FROM TEMP_PESSOA
--WHERE rownum BETWEEN 1 AND 20;

-- INSERE 20 USUARIOS - ESTES SERAO OS MEDICOS
INSERT INTO SC_SEC_USUARIO (ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, LOGIN, SENHA)
SELECT ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CONCAT(ID, '') LOGIN, CONCAT(ID, '') SENHA
FROM TEMP_PESSOA
WHERE rownum BETWEEN 1 AND 20;


-- INSERE OS MEDICOS COM OS MESMOS IDS - JOINED TABLE COM USUARIO
INSERT INTO SC_MEDICO (ID, CRM , COR_CALENDARIO)
SELECT ID, CONCAT(ID, '00', ID) CRM,
       concat('', 
              SELECT concat('#', SUBSTR((CAST(CAST(A AS INT) AS BINARY)), 3)) FROM (SELECT floor(random() * (CAST(CAST('FFFFFF' AS BINARY) AS INT) - CAST(CAST('100000' AS BINARY) AS INT) + 1) + CAST(CAST('100000' AS BINARY) AS INT) ) AS A )
       )
FROM TEMP_PESSOA
WHERE rownum BETWEEN 1 AND 20;

-- INSERE 5 USUARIOS - ESTES SERAO OS RECEPCIONISTAS
INSERT INTO SC_SEC_USUARIO (ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, LOGIN, SENHA)
SELECT ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CONCAT(ID, '') LOGIN, CONCAT(ID, '') SENHA
FROM TEMP_PESSOA
WHERE rownum BETWEEN 21 AND 25;

-- INSERE OS RECEPCIONISTAS COM OS MESMOS IDS - JOINED TABLE COM O USUARIO
INSERT INTO SC_RECEPCIONISTA (ID, MATRICULA)
SELECT ID, CONCAT(ID, '99', ID) MATRICULA
FROM TEMP_PESSOA
WHERE rownum BETWEEN 21 AND 25;

-- INSERT 5 RECEPCIONISTAS
--DELETE FROM SC_RECEPCIONISTA ;
--INSERT INTO SC_RECEPCIONISTA  (ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, MATRICULA)
--SELECT ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CONCAT(ID, '11', ID) MATRICULA
--FROM TEMP_PESSOA
--WHERE rownum BETWEEN 21 AND 25;

-- INSERT 100 PACIENTES
DELETE FROM SC_PACIENTE;
INSERT INTO SC_PACIENTE (ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, PLANO_SAUDE)
SELECT ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CONCAT('Plano de Saude ', ESTADO) PLANO_SAUDE
FROM TEMP_PESSOA
WHERE rownum BETWEEN 101 AND 200;

DELETE FROM TEMP_PESSOA;
DROP TABLE TEMP_PESSOA;

-- SECURITY
-- insert into SC_SEC_Usuario (id, nome, login, senha, ativo) values (0, 'admin', 'admin', 'admin', true);
-- insert into SC_SEC_Usuario (id, nome, login, senha, ativo) values (1, 'med', 'med', 'med', true);
-- insert into SC_SEC_Usuario (id, nome, login, senha, ativo) values (2, 'rec', 'rec', 'rec', true);
-- insert into SC_SEC_Usuario (id, nome, login, senha, ativo) values (3, 'Alexandre Afonso', 'teste@teste.com', '$2a$10$IzpvPiq.R5pAMhPbA430yekFGV18tOVw9YLAbhJuqf5.MbWjvj6cm', true);

-- GRUPOS
insert into SC_SEC_Grupo (id, nome, descricao) values (0, 'ADMINISTRADORES', 'Grupo de Administradores do Sistema');
insert into SC_SEC_Grupo (id, nome, descricao) values (1, 'MEDICOS', 'Grupo de Médicos');
insert into SC_SEC_Grupo (id, nome, descricao) values (2, 'RECEPCIONISTAS', 'Grupo de Recepcionista');
insert into SC_SEC_Grupo (id, nome, descricao) values (3, 'TESTES', 'Grupo de Teste');

-- PERMISSOES ROLES/URLS
insert into SC_SEC_Permissao (id, nome) values (66, '/listar-medico');
insert into SC_SEC_Permissao (id, nome) values (48, '/incluir-medico');
insert into SC_SEC_Permissao (id, nome) values (20, '/editar-medico');
insert into SC_SEC_Permissao (id, nome) values (30, '/excluir-medico');
-- insert into SC_SEC_Permissao (id, nome) values (67, '/listar-medico-json');
-- insert into SC_SEC_Permissao (id, nome) values (56, '/listar-all-medico-json');
insert into SC_SEC_Permissao (id, nome) values (71, '/listar-recepcionista');
insert into SC_SEC_Permissao (id, nome) values (51, '/incluir-recepcionista');
insert into SC_SEC_Permissao (id, nome) values (23, '/editar-recepcionista');
insert into SC_SEC_Permissao (id, nome) values (33, '/excluir-recepcionista');

insert into SC_SEC_Permissao (id, nome) values (68, '/listar-paciente');
insert into SC_SEC_Permissao (id, nome) values (49, '/incluir-paciente');
insert into SC_SEC_Permissao (id, nome) values (21, '/editar-paciente');
insert into SC_SEC_Permissao (id, nome) values (31, '/excluir-paciente');
--insert into SC_SEC_Permissao (id, nome) values (57, '/listar-all-paciente-json');
--insert into SC_SEC_Permissao (id, nome) values (69, '/listar-paciente-json');
-- insert into SC_SEC_Permissao (id, nome) values (62, '/listar-historico-clinico-paciente-form');
insert into SC_SEC_Permissao (id, nome) values (61, '/listar-historico-clinico-paciente');


insert into SC_SEC_Permissao (id, nome) values (11, '/');
insert into SC_SEC_Permissao (id, nome) values (12, '/antigo/**');
insert into SC_SEC_Permissao (id, nome) values (13, '/atender');
insert into SC_SEC_Permissao (id, nome) values (14, '/criar-agenda-agendamento');
insert into SC_SEC_Permissao (id, nome) values (15, '/desmarcar-horario-ajax-json');
insert into SC_SEC_Permissao (id, nome) values (16, '/editar-agendamento');
insert into SC_SEC_Permissao (id, nome) values (17, '/editar-atendimento');
insert into SC_SEC_Permissao (id, nome) values (18, '/editar-exame');
insert into SC_SEC_Permissao (id, nome) values (19, '/editar-medicamento');


insert into SC_SEC_Permissao (id, nome) values (22, '/editar-receita');

insert into SC_SEC_Permissao (id, nome) values (24, '/editar-resultadoExame');
insert into SC_SEC_Permissao (id, nome) values (25, '/editar-solicitacaoExame');
insert into SC_SEC_Permissao (id, nome) values (26, '/excluir-agendamento');
insert into SC_SEC_Permissao (id, nome) values (27, '/excluir-atendimento');
insert into SC_SEC_Permissao (id, nome) values (28, '/excluir-exame');
insert into SC_SEC_Permissao (id, nome) values (29, '/excluir-medicamento');


insert into SC_SEC_Permissao (id, nome) values (32, '/excluir-receita');

insert into SC_SEC_Permissao (id, nome) values (34, '/excluir-resultadoExame');
insert into SC_SEC_Permissao (id, nome) values (35, '/excluir-solicitacaoExame');
insert into SC_SEC_Permissao (id, nome) values (36, '/exibir-calendario-agendamento');
insert into SC_SEC_Permissao (id, nome) values (37, '/exibir-calendario-agendamento-medico');
insert into SC_SEC_Permissao (id, nome) values (38, '/exibir-calendario-vagas-agendamento');
insert into SC_SEC_Permissao (id, nome) values (39, '/exibir-calendario-vagas-agendamento-medico');
insert into SC_SEC_Permissao (id, nome) values (40, '/fullcalendar-listar-horario-ocupado-json');
insert into SC_SEC_Permissao (id, nome) values (41, '/fullcalendar-listar-horario-vago-json');
insert into SC_SEC_Permissao (id, nome) values (42, '/incluir-agendaForm');
insert into SC_SEC_Permissao (id, nome) values (43, '/incluir-agendamento');
insert into SC_SEC_Permissao (id, nome) values (44, '/incluir-atendimento');
insert into SC_SEC_Permissao (id, nome) values (45, '/incluir-consulta-agendamento');
insert into SC_SEC_Permissao (id, nome) values (46, '/incluir-exame');
insert into SC_SEC_Permissao (id, nome) values (47, '/incluir-medicamento');


insert into SC_SEC_Permissao (id, nome) values (50, '/incluir-receita');

insert into SC_SEC_Permissao (id, nome) values (52, '/incluir-resultadoExame');
insert into SC_SEC_Permissao (id, nome) values (53, '/incluir-solicitacaoExame');
insert into SC_SEC_Permissao (id, nome) values (54, '/listar-agendamento');
insert into SC_SEC_Permissao (id, nome) values (55, '/listar-all-exame-json');


insert into SC_SEC_Permissao (id, nome) values (58, '/listar-atendimento');
insert into SC_SEC_Permissao (id, nome) values (59, '/listar-exame');
insert into SC_SEC_Permissao (id, nome) values (60, '/listar-exame-json');
insert into SC_SEC_Permissao (id, nome) values (63, '/listar-horario-vago-json');
insert into SC_SEC_Permissao (id, nome) values (64, '/listar-medicamento');
insert into SC_SEC_Permissao (id, nome) values (65, '/listar-medicamento-json');


insert into SC_SEC_Permissao (id, nome) values (70, '/listar-receita');

insert into SC_SEC_Permissao (id, nome) values (72, '/listar-resultadoExame');
insert into SC_SEC_Permissao (id, nome) values (73, '/listar-solicitacaoExame');
insert into SC_SEC_Permissao (id, nome) values (74, '/login');
insert into SC_SEC_Permissao (id, nome) values (75, '/loginErrado');
insert into SC_SEC_Permissao (id, nome) values (76, '/marcar-horario-ajax-json');
insert into SC_SEC_Permissao (id, nome) values (77, '/pesquisar-agendamento');
insert into SC_SEC_Permissao (id, nome) values (78, '/privado/**');
insert into SC_SEC_Permissao (id, nome) values (79, '/privado/api/**');
insert into SC_SEC_Permissao (id, nome) values (80, '/privado/home');
insert into SC_SEC_Permissao (id, nome) values (81, '/privado/inicio');
insert into SC_SEC_Permissao (id, nome) values (82, '/registration');

insert into SC_SEC_Permissao (id, nome) values (83, '/listar-grupo');
insert into SC_SEC_Permissao (id, nome) values (84, '/incluir-grupo');
insert into SC_SEC_Permissao (id, nome) values (85, '/editar-grupo');
insert into SC_SEC_Permissao (id, nome) values (86, '/excluir-grupo');


-- ADICIONANDO TODAS AS PERMISSOES PARA O GRUPO DE ID = 0
INSERT INTO SC_SEC_Grupo_Permissoes (GRUPO_ID, permissoes_id)
SELECT '0', ID FROM SC_SEC_PERMISSAO;

-- ADICIONANDO PERMISSOES PARA O GRUPO DE ID = 2
-- RECEPCIONISTA NAO PODE INCLUIR/EXCLUIR/EDITAR nada
INSERT INTO SC_SEC_Grupo_Permissoes (GRUPO_ID, permissoes_id)
SELECT '2', ID FROM SC_SEC_PERMISSAO WHERE UPPER(NOME) NOT LIKE '%INCLUIR%' and UPPER(NOME) NOT LIKE '%EXCLUIR%' and UPPER(NOME) NOT LIKE '%EDITAR%';




-- ADICIONANDO O USUARIO 1 no grupo de administradores
insert into SC_SEC_USUARIO_GRUPO (ID_USUARIO, ID_GRUPO) values (1, 0);
insert into SC_SEC_USUARIO_GRUPO (ID_USUARIO, ID_GRUPO) values (20, 0);
insert into SC_SEC_USUARIO_GRUPO (ID_USUARIO, ID_GRUPO) values (25, 3);


-- ----
insert into SC_SEC_Permissao (id, nome) values (1000, 'PERFIL_ADMIN');
insert into SC_SEC_Permissao (id, nome) values (1001, 'PERFIL_MEDICO');
insert into SC_SEC_Permissao (id, nome) values (1002, 'PERFIL_RECEPCIONISTA');

insert into SC_SEC_Grupo_Permissoes (grupo_id, permissoes_id) values (0, 1000);
insert into SC_SEC_Grupo_Permissoes (grupo_id, permissoes_id) values (1, 1001);
insert into SC_SEC_Grupo_Permissoes (grupo_id, permissoes_id) values (2, 1002);


--insert into SC_SEC_Usuario_Grupos (usuario_id, grupos_id) values (20, 2);
