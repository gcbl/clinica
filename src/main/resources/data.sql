DELETE FROM SC_AGENDAMENTO; 
DELETE FROM SC_RECEITA_MEDICAMENTO; 
DELETE FROM SC_RECEITA;
DELETE FROM SC_EXAME_SOLICITACAO_EXAME;
DELETE FROM SC_SOLICITACAO_EXAME;
DELETE FROM SC_EXAME; 
DELETE FROM SC_MEDICAMENTO; 
DELETE FROM SC_MEDICO; 
DELETE FROM SC_PACIENTE; 



DELETE FROM USER_ROLE;
DELETE FROM ROLE;
DELETE FROM USER;

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
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values (99,'9999', '41207727130', '1901-01-01', 'NOME', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 1,'0001', '21228022780', '1980-01-01', 'Tomás Leonardo Iago Cardoso', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 2,'0002', '60074180738', '1981-02-02', 'Diogo Oliver Mendes', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 3,'0003', '89984152324', '1982-03-03', 'Joaquim Kaique Igor Pereira', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 4,'0004', '16694260091', '1983-04-04', 'Ruan Iago Alexandre Araújo', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 5,'0005', '29725008731', '1984-05-05', 'Mário Miguel Julio da Rocha', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 6,'0006', '68184554508', '1985-06-06', 'Elza Priscila Liz Peixoto', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 7,'0007', '89828149494', '1986-07-07', 'Andrea Sophie Barros', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 8,'0008', '95274469027', '1987-08-08', 'Kamilly Márcia Santos', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values ( 9,'0009', '52640009800', '1988-09-09', 'Francisca Emanuelly Almada', 'RUA');
INSERT INTO SC_MEDICO  (ID, CRM, CPF, DT_NASCIMENTO, NOME, ENDERECO) values (10,'0010', '61512078158', '1989-10-10', 'Natália Eloá Valentina Ribeiro', 'RUA');



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
( 1, 'Danilo Cavalcante', '40068299575', '1955-01-03', 'Avenida Espirito Santo, 816', 'Quadro Conjuntos', '58000000', 'João Pessoa', 'PB'), 
( 2, 'Gabriela Pilar', '37551156208', '1972-04-16', 'Rua Diamente, 817', 'Primeiro de Maio', '30000000', 'Belo Horizonte', 'MG'), 
( 3, 'Gabriela Batista', '55808213525', '1961-07-12', 'Av. Pedro XVX, 398', 'Santo Antônio', '50000000', 'Recife', 'PE'), 
( 4, 'Isaac Carvalho', '41464907315', '1993-04-21', 'Avenida Sergipe, 233', 'E', '23799000', 'Rio de Janeiro', 'RJ'), 
( 5, 'Júlia De Oliveira', '36601719560', '1957-01-14', 'Rua Doze, 1372', 'Principal', '69000000', 'Manaus', 'AM'), 
( 6, 'Hugo Morais', '63896538403', '1968-07-24', 'Av. dos Sonhos, 1663', 'H', '65099000', 'São Luiz', 'MA'), 
( 7, 'Gabriel Garcia', '88036412543', '1983-06-07', 'Rua Primeiro de Maio, 1814', 'Um', '79680000', 'Água Clara', 'MS'), 
( 8, 'Manuela Souza', '96054826816', '1993-01-23', 'Rua Rubi, 207', 'Conjuto 1', '88100000', 'Florianópolis', 'SC'), 
( 9, 'Duarte Mesquita', '54795518173', '2002-05-05', 'Rua Avenida Horizonte, 245', 'D', '66999000', 'Belém', 'PA'), 
( 10, 'Murilo Suarez', '52859523952', '1958-05-24', 'Rua A, 953', 'Santo Antônio', '41999000', 'Salvador', 'BA'), 
( 11, 'Joaquim Menezes', '74363126507', '1953-12-09', 'Rua Doze, 53', '3', '86300000', 'Cornélio Procópio', 'PR'), 
( 12, 'Bárbara Menezes', '06738821956', '1959-11-29', 'Rua Onze, 321', '1', '91999000', 'Porto Alegre', 'RS'), 
( 13, 'Lia Neves', '34854566167', '1992-10-02', 'Av. Pedro XVX, 1905', 'Conjunto B', '70999000', 'Brasília', 'DF'), 
( 14, 'Paola Maia', '75956681314', '1968-11-09', 'Rua Um, 406', 'Conjuto D', '50000000', 'Recife', 'PE'), 
( 15, 'Vicente Sampaio', '21391740890', '1967-01-25', 'Av. João Pombo, 331', '1', '86300000', 'Cornélio Procópio', 'PR'), 
( 16, 'Ariela Alves', '13695450100', '1954-01-19', 'Rua Um, 1932', 'Treze', '50000000', 'Recife', 'PE'), 
( 17, 'Clarisse Alencar', '52865818110', '1975-05-09', 'Rua Cinco, 574', 'Diamente', '69000000', 'Manaus', 'AM'), 
( 18, 'Bryan Martinez', '02192910550', '1954-05-25', 'Av. João Pombo, 1799', 'Siqueira Lima', '78480000', 'Cuiabá', 'MT'), 
( 19, 'Eduardo Xavier', '82558637614', '1970-11-28', 'Avenida São José, 1830', 'João Lima', '69000000', 'Manaus', 'AM'), 
( 20, 'Matheus Menezes', '51942939680', '1998-10-05', 'Av. Santiago, 560', 'Nove', '82999000', 'Curitiba', 'PR'), 
( 21, 'Guilherme Paris', '18062159426', '1985-05-06', 'Av. João Pombo, 1504', 'Cinco', '57099000', 'Maceió', 'AL'), 
( 22, 'Calebe Amaral', '66693078966', '1951-10-20', 'Avenida Seis, 512', 'Santo Antônio', '70999000', 'Brasília', 'DF'), 
( 23, 'Micaela Martinele', '32595270443', '1997-03-18', 'Rua 1, 1625', 'Principal', '70999000', 'Brasília', 'DF'), 
( 24, 'Ariana Rocha', '05681689255', '1966-09-20', 'Av. Xv, 1251', 'Conjuto 3', '60000000', 'Fortaleza', 'CE'), 
( 25, 'Leandro Mello', '85502473325', '1989-07-19', 'Av. dos Sonhos, 180', 'Conjunto B', '86300000', 'Cornélio Procópio', 'PR'), 
( 26, 'Lorenzo Sampaio', '24052143183', '1970-04-17', 'Rua João Quinze, 1534', 'Espirito Santo', '50000000', 'Recife', 'PE'), 
( 27, 'Carol Barcellos', '63810984493', '1953-05-11', 'Rua I, 1557', 'Dez', '41999000', 'Salvador', 'BA'), 
( 28, 'Filipe Leão', '76649311189', '1973-12-12', 'Rua Um, 516', 'Dois', '23799000', 'Rio de Janeiro', 'RJ'), 
( 29, 'Bryan Martinez', '49100088102', '1952-09-22', 'Av. Três, 1979', 'Conjunto A', '29099000', 'Vitória', 'ES'), 
( 30, 'João Oliveira', '05551275167', '1955-08-30', 'Av. Pombo Rocha, 602', 'Conjuto 2', '60000000', 'Fortaleza', 'CE'), 
( 31, 'Lis Paris', '52985380880', '1959-12-19', 'Avenida São José, 1547', 'Um', '86300000', 'Cornélio Procópio', 'PR'), 
( 32, 'Rebeca Araújo', '22803909901', '1972-01-17', 'Rua 3, 1025', 'João Rocha', '69000000', 'Manaus', 'AM'), 
( 33, 'Vinicios Soares', '59327839404', '1965-11-28', 'Rua 1, 1024', 'Seis', '23799000', 'Rio de Janeiro', 'RJ'), 
( 34, 'Marina Lima', '64198021562', '1976-02-22', 'Rua C, 1405', 'Cinco', '60000000', 'Fortaleza', 'CE'), 
( 35, 'Maria Clara Lacerda', '94591051730', '1981-01-23', 'Rua 2, 457', 'Conjuto 4', '59000000', 'Natal', 'RN'), 
( 36, 'Rafaela Costa', '70101000634', '1980-11-12', 'Rua 1, 144', 'Posto Norte', '49099000', 'Aracaju', 'SE'), 
( 37, 'Angelina Barcellos', '79054105879', '1966-01-30', 'Av. Três, 472', 'Espirito Santo', '66999000', 'Belém', 'PA'), 
( 38, 'Rebeca Oliveira', '77738807199', '1961-05-13', 'Rua 3, 599', 'Conjunto B', '82999000', 'Curitiba', 'PR'), 
( 39, 'Ângelo Oliveira', '11293471682', '1950-12-01', 'Av. Xv, 347', 'Santo Antônio', '29099000', 'Vitória', 'ES'), 
( 40, 'Rafaela Neves', '43514713286', '1971-01-25', 'Rua Esmeralda, 1610', 'João Lima', '78480000', 'Cuiabá', 'MT'), 
( 41, 'Victor Gonçalves', '69684939507', '1983-07-27', 'Rua A, 1533', 'Conjunto A', '79680000', 'Água Clara', 'MS'), 
( 42, 'Luisa Lima', '69745353418', '1977-03-19', 'Rua C, 1815', 'Conjuto 2', '88100000', 'Florianópolis', 'SC'), 
( 43, 'Rodrigo Vasconcelos', '80588013480', '1987-07-17', 'Av. Xv, 302', 'Conjunto C', '59000000', 'Natal', 'RN'), 
( 44, 'Clara Moraes', '61088623352', '1986-06-05', 'Rua Paraíba, 1400', 'João Rocha', '86300000', 'Cornélio Procópio', 'PR'), 
( 45, 'Yasmin Araújo', '16254013290', '1981-05-09', 'Rua Santo Antônio, 1290', 'C', '70999000', 'Brasília', 'DF'), 
( 46, 'Alexander Mello', '78934087315', '1959-09-09', 'Rua João Gabriel, 1277', 'Limeira', '70999000', 'Brasília', 'DF'), 
( 47, 'Benjamim Bernardes', '41687788782', '1953-12-28', 'Avenida São José, 657', 'Dez', '8000000', 'São Paulo', 'SP'), 
( 48, 'Guilherme Gomes', '23596744121', '1958-09-13', 'Avenida Sergipe, 417', 'G', '69000000', 'Manaus', 'AM'), 
( 49, 'Mateus Moreira', '33491008999', '1976-09-13', 'Avenida São José, 1106', '2', '69000000', 'Manaus', 'AM'), 
( 50, 'Raquel Freitas', '94709531773', '1991-09-03', 'Rua 1, 838', 'Horizonte', '70999000', 'Brasília', 'DF'), 
( 51, 'Alessandra Gomes', '59862678186', '1990-08-29', 'Rua Doze, 1388', 'Conjunto B', '82999000', 'Curitiba', 'PR'), 
( 52, 'Sophia Costa', '27478693423', '1996-04-07', 'Rua A, 894', 'Cinco', '8000000', 'São Paulo', 'SP'), 
( 53, 'Thiago Chaves', '30178086100', '1982-07-11', 'Rua G, 480', 'João Rocha', '23799000', 'Rio de Janeiro', 'RJ'), 
( 54, 'Pablo Batista', '48766754305', '1971-04-16', 'Av. João Pombo, 1228', 'Um', '86300000', 'Cornélio Procópio', 'PR'), 
( 55, 'Isadora Garcia', '32575969956', '1983-09-12', 'Av. Santiago, 558', 'Jardim Pérola', '49099000', 'Aracaju', 'SE'), 
( 56, 'Ana Beatriz De Oliveira', '79715682235', '1988-05-05', 'Av. João Pombo, 1231', 'Principal', '68914000', 'Macapá', 'AP'), 
( 57, 'Isis Monteiro', '54436689271', '1995-12-22', 'Rua dos Amigos, 705', 'D', '91999000', 'Porto Alegre', 'RS'), 
( 58, 'Ana Clara Monteiro', '09901768942', '1987-06-09', 'Rua Paraíba, 716', 'Conjuto 2', '68914000', 'Macapá', 'AP'), 
( 59, 'Ana Júlia Paes', '73448656704', '1976-09-27', 'Rua Esmeralda, 693', 'Brasil', '69339000', 'Boa Vista', 'RR'), 
( 60, 'Vitória Alencar', '67606254800', '1975-12-24', 'Rua Oito, 1412', 'Perola', '82999000', 'Curitiba', 'PR'), 
( 61, 'Helena Garcia', '07479969970', '1973-04-16', 'Rua Principal, 231', 'Doze', '91999000', 'Porto Alegre', 'RS'), 
( 62, 'Estela Leão', '83195352478', '1977-12-22', 'Av. Santiago, 1389', 'E', '8000000', 'São Paulo', 'SP'), 
( 63, 'Diogo Cavalcante', '93929853396', '1981-11-16', 'Avenida São José, 1329', 'Conjuto 1', '29099000', 'Vitória', 'ES'), 
( 64, 'Lucca Albuquerque', '37189174672', '1987-09-14', 'Rua João Quinze, 1343', 'Conjuto 1', '50000000', 'Recife', 'PE'), 
( 65, 'Isis Morais', '48157829461', '1957-12-22', 'Av. Três, 1183', 'Um', '57099000', 'Maceió', 'AL'), 
( 66, 'Mariana Freitas', '44723494260', '1958-09-29', 'Avenida Sergipe, 1055', 'Jardim Pérola', '88100000', 'Florianópolis', 'SC'), 
( 67, 'Isabelly Oliveira', '90155040910', '1978-12-19', 'Av. Três, 1038', 'Posto Norte', '69000000', 'Manaus', 'AM'), 
( 68, 'Igor Muniz', '53992794601', '1979-12-21', 'Av. São Paulo, 883', 'Posto Norte', '86300000', 'Cornélio Procópio', 'PR'), 
( 69, 'Lorenzo Paiva', '77753874080', '1967-06-18', 'Rua I, 1485', 'Primeiro de Maio', '30000000', 'Belo Horizonte', 'MG'), 
( 70, 'João Lucas Pereira', '55953476868', '1973-03-31', 'Rua G, 364', 'B', '50000000', 'Recife', 'PE'), 
( 71, 'Bianca Galisteu', '09256163896', '1992-10-06', 'Rua B, 1996', 'Conjuto D', '29099000', 'Vitória', 'ES'), 
( 72, 'Emanuel Bernardes', '54955658946', '1980-04-08', 'Avenida Sergipe, 512', 'Jardim Pérola', '8000000', 'São Paulo', 'SP'), 
( 73, 'Abel Menezzes', '21263012906', '1973-07-02', 'Rua Sete, 1020', 'Seis', '58000000', 'João Pessoa', 'PB'), 
( 74, 'Davi Lucca Pinheiro', '18358967667', '1953-06-01', 'Rua Cinco, 244', 'H', '64099000', 'Teresina', 'PI'), 
( 75, 'Davi Medeiros', '32661993916', '1967-01-17', 'Av. Dom Pedro II, 222', 'Dez', '66999000', 'Belém', 'PA'), 
( 76, 'Emanuela Gonçalves', '34700451009', '1958-09-20', 'Rua D, 342', 'Um', '69920000', 'Rio Branco', 'AC'), 
( 77, 'Manuel Frota', '61534204946', '1978-09-03', 'Avenida São José, 1831', '2', '68914000', 'Macapá', 'AP'), 
( 78, 'Apólo Amaral', '29727331777', '1983-01-05', 'Avenida Seis, 261', 'Diamente', '91999000', 'Porto Alegre', 'RS'), 
( 79, 'Gustavo Andrade', '08916129710', '1961-06-20', 'Av. Pombo Rocha, 52', 'Conjuto 4', '79680000', 'Água Clara', 'MS'), 
( 80, 'Melissa Oliveira', '95667490820', '1958-06-15', 'Rua Um, 310', 'Espirito Santo', '88100000', 'Florianópolis', 'SC'), 
( 81, 'Mariana Vieira', '63132601802', '1953-10-11', 'Rua Esmeralda, 188', 'C', '82999000', 'Curitiba', 'PR'), 
( 82, 'Marina Lessa', '57856869534', '1989-06-18', 'Av. João Pombo, 1316', 'Jardim Esperança', '69000000', 'Manaus', 'AM'), 
( 83, 'Heitor Pinheiro', '60934176035', '2001-03-31', 'Rua Cinco, 1244', '3', '70999000', 'Brasília', 'DF'), 
( 84, 'Diego Moreira', '27243621104', '1999-02-10', 'Rua A, 1519', 'Paraíba', '66999000', 'Belém', 'PA'), 
( 85, 'João Miguel Barreto', '81080228608', '1951-06-04', 'Rua F, 649', 'Cinco', '69000000', 'Manaus', 'AM'), 
( 86, 'Rafael Pilar', '34767620252', '1984-12-04', 'Rua 1, 455', 'Conjuto 4', '65099000', 'São Luiz', 'MA'), 
( 87, 'Alice Nogueira', '71427531102', '1965-01-18', 'Avenida Brasil, 1346', 'C', '88100000', 'Florianópolis', 'SC'), 
( 88, 'Helena Barreto', '93959184115', '1969-03-12', 'Rua Nove, 1878', 'Nogueira', '70999000', 'Brasília', 'DF'), 
( 89, 'Ana Júlia Oliveira', '68082490403', '1967-07-13', 'Rua dos Amigos, 1667', 'Conjuto A', '30000000', 'Belo Horizonte', 'MG'), 
( 90, 'Felipe Ferrari', '91988637384', '1999-06-21', 'Rua dos Amigos, 851', 'Jardim Veneza', '88100000', 'Florianópolis', 'SC'), 
( 91, 'Guilherme Reis', '27530079778', '1974-02-08', 'Av. São Paulo, 573', '1', '68914000', 'Macapá', 'AP'), 
( 92, 'Matheus Figueira', '00279551924', '1959-01-23', 'Av. Santiago, 639', 'Onze', '79680000', 'Água Clara', 'MS'), 
( 93, 'Clara Mello', '29183935924', '1981-08-27', 'Avenida Sergipe, 1295', '2', '23799000', 'Rio de Janeiro', 'RJ'), 
( 94, 'Rafaela Martinez', '59880760921', '1966-08-03', 'Rua Cinco, 204', 'Conjuto D', '29099000', 'Vitória', 'ES'), 
( 95, 'Lorena Guimarães', '09573982633', '1971-02-17', 'Rua 2, 890', 'Jardim Pérola', '79680000', 'Água Clara', 'MS'), 
( 96, 'Calebe De Oliveira', '11073881121', '1988-08-10', 'Rua Sete, 1496', 'Cinco', '8000000', 'São Paulo', 'SP'), 
( 97, 'Eva Pilar', '98038890442', '1969-07-10', 'Rua Dez, 1833', 'Conjuto A', '69920000', 'Rio Branco', 'AC'), 
( 98, 'Débora Oliveira', '27756349237', '1958-06-24', 'Av. dos Sonhos, 836', 'E', '29099000', 'Vitória', 'ES'), 
( 99, 'Emanuelle Barreto', '10881795763', '1986-09-08', 'Avenida Brasil, 1824', 'Martins de Souza', '60000000', 'Fortaleza', 'CE'), 
( 100, 'Juliano Guimarães', '39996399206', '1968-01-19', 'Rua 1, 1518', 'Conjunto B', '49099000', 'Aracaju', 'SE'), 
( 101, 'Clara Nogueira', '83512384498', '1957-04-27', 'Rua Rubi, 1642', 'Conjuto 2', '78480000', 'Cuiabá', 'MT'), 
( 102, 'Eduarda Martinele', '24722695369', '1977-09-27', 'Rua E, 362', 'Conjuto 2', '68914000', 'Macapá', 'AP'), 
( 103, 'Esther Vieira', '65632584500', '1953-02-19', 'Rua Primeiro de Maio, 1736', 'G', '69339000', 'Boa Vista', 'RR'), 
( 104, 'Joana Paes', '46443009932', '1977-12-29', 'Av. São Paulo, 704', 'D', '23799000', 'Rio de Janeiro', 'RJ'), 
( 105, 'Alana Monteiro', '58510496854', '1999-02-19', 'Rua João Quinze, 1471', 'Limeira', '49099000', 'Aracaju', 'SE'), 
( 106, 'Joaquim Rodrigues', '22921370034', '1971-09-08', 'Rua Cinco, 1127', 'Nogueira', '49099000', 'Aracaju', 'SE'), 
( 107, 'Abigail Frota', '28770463972', '1998-03-06', 'Rua Nove, 1796', 'Quadro Conjuntos', '88100000', 'Florianópolis', 'SC'), 
( 108, 'Lourenço Vasconcelos', '55261321107', '1964-05-01', 'Rua dos Amigos, 1782', 'Horizonte', '30000000', 'Belo Horizonte', 'MG'), 
( 109, 'Iara De Novais', '64870672880', '1986-07-11', 'Rua Sete, 1596', 'Jardim das Rosas', '79680000', 'Água Clara', 'MS'), 
( 110, 'Eduardo Duarte', '34529464792', '1989-10-26', 'Rua D, 1664', 'Perola', '50000000', 'Recife', 'PE'), 
( 111, 'Beatriz Morais', '45280549495', '1962-08-17', 'Rua H, 349', 'Dez', '65099000', 'São Luiz', 'MA'), 
( 112, 'Melissa De Oliveira', '86625478008', '1974-08-17', 'Rua I, 221', 'C', '59000000', 'Natal', 'RN'), 
( 113, 'Ágata Soares', '85248583039', '1975-08-23', 'Rua Avenida Horizonte, 749', 'Conjuto D', '64099000', 'Teresina', 'PI'), 
( 114, 'Larissa Medeiros', '49185088633', '1977-03-12', 'Rua João Gabriel, 1915', 'D', '88100000', 'Florianópolis', 'SC'), 
( 115, 'Rebeca Pilar', '36387013100', '1966-05-01', 'Rua Paraíba, 1202', 'Conjuto D', '78480000', 'Cuiabá', 'MT'), 
( 116, 'Laura Mello', '94421744956', '1950-10-20', 'Rua João Quinze, 1922', 'Conjunto A', '49099000', 'Aracaju', 'SE'), 
( 117, 'Júlia Freitas', '09183990097', '1975-07-30', 'Rua Avenida Horizonte, 1586', 'Marcelo Queiroz', '82999000', 'Curitiba', 'PR'), 
( 118, 'Lara Figueira', '42516422288', '1959-01-17', 'Avenida Espirito Santo, 345', 'Cinco', '86300000', 'Cornélio Procópio', 'PR'), 
( 119, 'Benício Barcellos', '62430412390', '1980-05-23', 'Rua Dois, 1320', 'Jardim Pérola', '50000000', 'Recife', 'PE'), 
( 120, 'Victor Martinez', '79571457442', '1963-01-07', 'Rua G, 974', '3', '70999000', 'Brasília', 'DF'), 
( 121, 'Joaquim Gomes', '41756668930', '1965-02-25', 'Rua Avenida Horizonte, 890', 'Santo Antônio', '86300000', 'Cornélio Procópio', 'PR'), 
( 122, 'Lara Gomes', '97779655326', '2001-07-18', 'Rua Sete, 1547', 'Sergipe', '86300000', 'Cornélio Procópio', 'PR'), 
( 123, 'Maísa Vasconcelos', '78971711752', '1970-05-20', 'Av. Pedro XVX, 847', '1', '78480000', 'Cuiabá', 'MT'), 
( 124, 'Rafael Muniz', '84316252283', '1963-08-23', 'Rua Nove, 382', 'Espirito Santo', '91999000', 'Porto Alegre', 'RS'), 
( 125, 'Maria Alice Soares', '25950280490', '1980-08-23', 'Rua 2, 25', 'Treze', '49099000', 'Aracaju', 'SE'), 
( 126, 'Eduardo Santos', '47357682110', '1964-05-02', 'Rua B, 596', 'Conjuto 1', '29099000', 'Vitória', 'ES'), 
( 127, 'Laura Alves', '35455657186', '1981-05-09', 'Rua D, 695', 'Dez', '8000000', 'São Paulo', 'SP'), 
( 128, 'Ana Barreto', '03119597686', '1996-08-21', 'Rua Avenida Horizonte, 1495', 'Conjuto 4', '69920000', 'Rio Branco', 'AC'), 
( 129, 'Emanuel Carvalho', '87064575922', '1951-09-11', 'Rua F, 564', 'Primeiro de Maio', '50000000', 'Recife', 'PE'), 
( 130, 'Igor Leão', '86400152873', '1982-09-20', 'Av. João Pombo, 93', 'Cinco', '86300000', 'Cornélio Procópio', 'PR'), 
( 131, 'Brenda Mauricio', '79453806544', '1970-06-09', 'Rua João Gabriel, 707', 'João Rocha', '70999000', 'Brasília', 'DF'), 
( 132, 'Francisco Nogueira', '00215710584', '1981-09-04', 'Rua 1, 710', 'Conjunto B', '79680000', 'Água Clara', 'MS'), 
( 133, 'Anabela Bernardes', '64112606486', '1996-03-23', 'Rua Nove, 1748', 'Martins de Souza', '30000000', 'Belo Horizonte', 'MG'), 
( 134, 'Cecília Monteiro', '46307840552', '1958-02-13', 'Rua D, 1544', 'Conjuto B', '82999000', 'Curitiba', 'PR'), 
( 135, 'Danilo Marques', '55669525183', '1998-08-14', 'Rua Paraíba, 1163', 'Dois', '69339000', 'Boa Vista', 'RR'), 
( 136, 'Isadora Muniz', '18729506557', '1982-05-07', 'Rua Sete, 1743', 'Conjuto 4', '30000000', 'Belo Horizonte', 'MG'), 
( 137, 'Nicole Barreto', '94511305862', '1962-08-06', 'Rua C, 974', 'Perola', '29099000', 'Vitória', 'ES'), 
( 138, 'Felipe Barreto', '97066868277', '1992-10-17', 'Rua Sete, 1274', 'Principal', '91999000', 'Porto Alegre', 'RS'), 
( 139, 'Anderson Duarte', '28351050776', '1976-10-28', 'Avenida Espirito Santo, 2', 'Conjuto 3', '41999000', 'Salvador', 'BA'), 
( 140, 'Ana Maia', '63310201600', '1994-11-25', 'Avenida Brasil, 1312', 'Sete', '78480000', 'Cuiabá', 'MT'), 
( 141, 'Pietro Martins', '01155200152', '1953-10-29', 'Rua dos Amigos, 1004', 'Sergipe', '59000000', 'Natal', 'RN'), 
( 142, 'Isa Paris', '78161695237', '1974-01-27', 'Rua Oito, 181', 'Jardim Pérola', '69000000', 'Manaus', 'AM'), 
( 143, 'João Miguel Reis', '51534607978', '1954-10-16', 'Avenida Seis, 1877', 'Siqueira Lima', '57099000', 'Maceió', 'AL'), 
( 144, 'Alan Carvalho', '24671489635', '1989-10-12', 'Av. Pombo Rocha, 1876', 'D', '60000000', 'Fortaleza', 'CE'), 
( 145, 'João Queiroz', '40748615776', '1979-08-07', 'Av. Pedro XVX, 1387', 'Onze', '60000000', 'Fortaleza', 'CE'), 
( 146, 'Alícia Santos', '62936798302', '1963-12-06', 'Rua 1, 1737', 'C', '69339000', 'Boa Vista', 'RR'), 
( 147, 'Helena Alencar', '49291940089', '1969-03-17', 'Rua 3, 826', 'Dez', '60000000', 'Fortaleza', 'CE'), 
( 148, 'Diana Queiroz', '43703466901', '1982-03-07', 'Rua F, 1828', 'Conjuto D', '69000000', 'Manaus', 'AM'), 
( 149, 'Manuela Novaes', '57437403722', '1969-03-17', 'Av. Pedro XVX, 821', 'G', '66999000', 'Belém', 'PA'), 
( 150, 'Nicolas Rocha', '88345940021', '1999-08-09', 'Rua G, 353', 'Jardim Pérola', '57099000', 'Maceió', 'AL'), 
( 151, 'Catarina Costa', '51527020371', '1957-02-27', 'Avenida Brasil, 1652', 'Conjunto C', '30000000', 'Belo Horizonte', 'MG'), 
( 152, 'Olívia Maximus', '31670176517', '1959-12-02', 'Rua Sete, 770', 'Nove', '60000000', 'Fortaleza', 'CE'), 
( 153, 'Camila Gomes', '68508045964', '1966-07-15', 'Av. Três, 59', 'E', '66999000', 'Belém', 'PA'), 
( 154, 'Raul Santana', '95702243714', '1952-12-05', 'Rua Diamente, 810', 'Jardim das Rosas', '68914000', 'Macapá', 'AP'), 
( 155, 'Diego Soares', '36931423517', '1952-01-25', 'Av. Três, 1401', 'Conjuto 2', '8000000', 'São Paulo', 'SP'), 
( 156, 'Gabriela Ribeiro', '77782380804', '1953-11-21', 'Rua Principal, 1988', 'São José', '23799000', 'Rio de Janeiro', 'RJ'), 
( 157, 'Davi Lucas De Novais', '43439196925', '1996-07-14', 'Avenida São José, 1812', 'Diamente', '64099000', 'Teresina', 'PI'), 
( 158, 'Vicente Boaventura', '91012181154', '1960-07-31', 'Rua C, 3', 'Posto Norte', '58000000', 'João Pessoa', 'PB'), 
( 159, 'Lorena Pereira', '38190654071', '1997-12-07', 'Rua C, 588', 'Primeiro de Maio', '68914000', 'Macapá', 'AP'), 
( 160, 'Benjamim Boaventura', '84277701116', '1978-03-24', 'Rua Nove, 1633', 'Diamente', '59000000', 'Natal', 'RN'), 
( 161, 'Emanuela Queiroz', '21123483108', '1980-02-26', 'Rua Cinco, 1118', 'Conjunto B', '30000000', 'Belo Horizonte', 'MG'), 
( 162, 'Miguel Leão', '10857105213', '1967-08-03', 'Av. Quatro, 1287', 'Martins de Souza', '60000000', 'Fortaleza', 'CE'), 
( 163, 'Bruna Barreto', '40234232110', '1969-08-28', 'Avenida Espirito Santo, 536', 'H', '70999000', 'Brasília', 'DF'), 
( 164, 'Ana Beatriz Andrade', '70501768262', '1996-12-15', 'Rua Santo Antônio, 1308', 'Onze', '91999000', 'Porto Alegre', 'RS'), 
( 165, 'Fernando Gomes', '81554867703', '1986-03-15', 'Rua Cinco, 1732', 'D', '8000000', 'São Paulo', 'SP'), 
( 166, 'Luana Suarez', '81681826429', '1993-06-13', 'Avenida Seis, 191', 'H', '50000000', 'Recife', 'PE'), 
( 167, 'Leticia Paris', '03075772950', '1979-01-14', 'Rua Avenida Horizonte, 1561', 'I', '8000000', 'São Paulo', 'SP'), 
( 168, 'Elisa Lacerda', '68417019928', '1962-05-03', 'Rua B, 1955', 'Primeiro de Maio', '59000000', 'Natal', 'RN'), 
( 169, 'Henrique Vieira', '78918193947', '1982-08-24', 'Av. Dom Pedro II, 1739', 'Perola', '57099000', 'Maceió', 'AL'), 
( 170, 'Joaquim Alves', '32182632123', '1971-08-06', 'Av. Quatro, 1623', 'Conjuto 3', '70999000', 'Brasília', 'DF'), 
( 171, 'Vitor Novaes', '49461255667', '1976-05-15', 'Rua 2, 1066', 'D', '82999000', 'Curitiba', 'PR'), 
( 172, 'Lucca Neves', '23362249094', '1966-10-18', 'Rua Principal, 354', 'Principal', '69000000', 'Manaus', 'AM'), 
( 173, 'Alice Ribeiro', '52458543332', '1975-07-07', 'Rua Cinco, 1502', 'Conjuto E', '59000000', 'Natal', 'RN'),
( 174, 'Renan Ferrari', '41343572177', '1967-12-18', 'Rua A, 151', '2', '64099000', 'Teresina', 'PI'), 
( 175, 'Henrique Oliveira', '45885113785', '1953-03-24', 'Av. Xv, 1760', 'A', '23799000', 'Rio de Janeiro', 'RJ'), 
( 176, 'Alícia Vitor', '55539931211', '1963-05-19', 'Av. Pombo Rocha, 325', 'João Lima', '88100000', 'Florianópolis', 'SC'), 
( 177, 'Esther Barreto', '55800210977', '1957-04-27', 'Rua Esmeralda, 483', 'E', '69000000', 'Manaus', 'AM'), 
( 178, 'Maria Fernanda Soares', '84250638170', '1970-08-27', 'Rua Diamente, 1109', 'Limeira', '29099000', 'Vitória', 'ES'), 
( 179, 'Lorenzo Morais', '59761090477', '1955-03-10', 'Av. Santiago, 120', 'Sergipe', '79680000', 'Água Clara', 'MS'), 
( 180, 'Benjamim Queiroz', '91703080041', '1953-01-05', 'Avenida São José, 522', 'Nove', '59000000', 'Natal', 'RN'), 
( 181, 'Flôr Vieira', '15581657386', '1990-08-22', 'Rua F, 580', 'Seis', '86300000', 'Cornélio Procópio', 'PR'), 
( 182, 'Pedro Costa', '49364480015', '1992-05-12', 'Rua Primeiro de Maio, 876', 'João Lima', '8000000', 'São Paulo', 'SP'), 
( 183, 'Melinda Oliveira', '83467045774', '1968-01-13', 'Av. Pedro XVX, 658', 'Conjunto B', '59000000', 'Natal', 'RN'), 
( 184, 'Vicente Ferrari', '79998953936', '1974-02-20', 'Rua Treze, 1745', 'D', '23799000', 'Rio de Janeiro', 'RJ'), 
( 185, 'Manuela Freitas', '48432966517', '1958-07-13', 'Av. Dom Pedro II, 241', 'São Paulo', '49099000', 'Aracaju', 'SE'), 
( 186, 'Benjamim Campos', '13523535123', '1978-10-26', 'Av. das Lameiras, 1719', 'Treze', '82999000', 'Curitiba', 'PR'), 
( 187, 'Leonardo Batista', '73134382571', '1979-02-02', 'Av. Quatro, 1292', 'Siqueira Lima', '70999000', 'Brasília', 'DF'), 
( 188, 'Maria Luiza Costa', '53311978684', '2001-12-28', 'Rua A, 1274', 'Oito', '79680000', 'Água Clara', 'MS'), 
( 189, 'Joana Araújo', '15925130693', '1994-07-05', 'Rua João Gabriel, 944', 'Onze', '29099000', 'Vitória', 'ES'), 
( 190, 'Kevin Vieira', '46486644265', '1962-08-04', 'Rua Sete, 1920', 'Jardim Veneza', '29099000', 'Vitória', 'ES'), 
( 191, 'Abel Martinele', '28513612790', '1986-01-30', 'Rua Nove, 1184', '1', '88100000', 'Florianópolis', 'SC'), 
( 192, 'Caio Pereira', '73094306110', '1982-09-03', 'Rua Oito, 608', 'Diamente', '57099000', 'Maceió', 'AL'), 
( 193, 'Ester Muniz', '54084022152', '1999-09-30', 'Rua Avenida Horizonte, 1327', 'Quadro Conjuntos', '70999000', 'Brasília', 'DF'), 
( 194, 'Brenda Albuquerque', '72195897783', '1974-02-08', 'Av. Dom Pedro II, 1660', 'Conjuto 4', '59000000', 'Natal', 'RN'), 
( 195, 'Samuel Freitas', '82493609239', '1999-12-25', 'Rua B, 652', 'Cinco', '50000000', 'Recife', 'PE'), 
( 196, 'Lourenço Martinez', '85550942836', '1954-09-28', 'Av. das Lameiras, 353', 'Sergipe', '58000000', 'João Pessoa', 'PB'), 
( 197, 'Adriana Cavalcante', '01800617801', '1953-01-20', 'Av. Três, 290', 'Diamente', '23799000', 'Rio de Janeiro', 'RJ'), 
( 198, 'Lara Ribeiro', '97640870518', '1996-01-29', 'Rua Esmeralda, 890', '3', '64099000', 'Teresina', 'PI'), 
( 199, 'Daniela Paiva', '10557739403', '1963-08-21', 'Av. São Paulo, 1924', 'Oito', '64099000', 'Teresina', 'PI'), 
( 200, 'Lucas Martins', '88005736142', '1963-11-07', 'Av. João Pombo, 1372', 'Conjunto C', '69339000', 'Boa Vista', 'RR');


-- INSERT 20 MEDICOS
DELETE FROM SC_MEDICO;
INSERT INTO SC_MEDICO (ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CRM, COR_CALENDARIO)
SELECT ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CONCAT(ID, '09', ID) CRM,
       concat('', 
              SELECT concat('#', SUBSTR((CAST(CAST(A AS INT) AS BINARY)), 3)) FROM (SELECT floor(random() * (CAST(CAST('FFFFFF' AS BINARY) AS INT) - CAST(CAST('100000' AS BINARY) AS INT) + 1) + CAST(CAST('100000' AS BINARY) AS INT) ) AS A )
       )
FROM TEMP_PESSOA
WHERE rownum BETWEEN 1 AND 20;

-- COR
-- SELECT concat('#', SUBSTR((CAST(CAST(A AS INT) AS BINARY)), 3)) FROM (SELECT floor(random() * (CAST(CAST('FFFFFF' AS BINARY) AS INT) - CAST(CAST('100000' AS BINARY) AS INT) + 1) + CAST(CAST('100000' AS BINARY) AS INT) ) AS A );

-- INSERT 5 RECEPCIONISTAS
DELETE FROM SC_RECEPCIONISTA ;
INSERT INTO SC_RECEPCIONISTA  (ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, MATRICULA)
SELECT ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CONCAT(ID, '11', ID) MATRICULA
FROM TEMP_PESSOA
WHERE rownum BETWEEN 21 AND 25;

-- INSERT 100 PACIENTES
DELETE FROM SC_PACIENTE;
INSERT INTO SC_PACIENTE (ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, PLANO_SAUDE)
SELECT ID, CEP, CIDADE, CPF, DT_NASCIMENTO, ENDERECO, BAIRRO, ESTADO, NOME, CONCAT('Plano de Saude ', ESTADO) PLANO_SAUDE
FROM TEMP_PESSOA
WHERE rownum BETWEEN 101 AND 200;

DELETE FROM TEMP_PESSOA;
DROP TABLE TEMP_PESSOA;