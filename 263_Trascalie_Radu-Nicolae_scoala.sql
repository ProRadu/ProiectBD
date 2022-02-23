#drop database scoala;
create database scoala;
create table profesor
( cnp varchar(14) not null
, nume varchar(25)
, prenume varchar(25)
, adresa varchar(40)
, numar_telefon varchar(11)
, email varchar(40)
, constraint cnp_pk
primary key (cnp)
);

create table clasa
( cod_clasa decimal not null
, an_incepere date
, constraint cod_clasa_pk
primary key (cod_clasa)
);

create table proiecte
( cod_proiect decimal not null
, nume varchar(25)
, diploma_participare bool
, constraint cod_proiect_pk
primary key (cod_proiect)
);

create table carte
( cod_carte decimal not null
, titlu varchar(25)
, autor varchar(45)
, editura varchar(25)
, numar_pagini decimal
, constraint cod_carte_pk
primary key (cod_carte)
);

create table revista
( numar_revista decimal not null
, cnp varchar(14)
, titlu varchar(25)
, data_aparitie date
, numar_pagini decimal
, constraint numar_revista_pk
primary key (numar_revista)
, constraint cnp_revista_fk
foreign key (cnp)
references profesor (cnp) on delete set null
);

create table predare
( cod_clasa decimal not null
, cnp varchar(14) not null
, materie varchar(25)
, constraint cod_clasa_plus_cnp_pk
primary key (cod_clasa, cnp)
, constraint cod_clasa_predare_fk
foreign key (cod_clasa)
references clasa (cod_clasa) on delete cascade
, constraint cnp_predare_fk
foreign key (cnp)
references profesor (cnp) on delete cascade
);

create table elev
( numar_matricol decimal not null
, cod_clasa decimal
, nume varchar(25)
, prenume varchar(25)
, adresa varchar(40)
, numar_telefon varchar(11)
, email varchar(40)
, constraint numar_matricol_pk
primary key (numar_matricol)
, constraint cod_clasa_elev_fk
foreign key (cod_clasa)
references clasa (cod_clasa) on delete set null
);

create table note
( materie varchar(25) not null
, data_primire date not null
, numar_matricol decimal not null
, valoare_nota decimal
, constraint materie_plus_data_primire_plus_numar_matricol_pk
primary key (materie, data_primire, numar_matricol)
, constraint numar_matricol_note_fk
foreign key (numar_matricol)
references elev (numar_matricol) on delete cascade
, constraint valoare_note_interval
check (valoare_nota > 0 and valoare_nota <11 )
);

create table imprumut
( cod_carte decimal not null
, numar_matricol decimal not null
, data_imprumut date not null
, constraint cod_carte_plus_numar_matricol_plus_data_imprumut_pk
primary key (cod_carte, numar_matricol, data_imprumut)
,constraint cod_carte_imprumut_fk
foreign key (cod_carte)
references carte (cod_carte) on delete cascade
, constraint numar_matriol_imprumut_fk
foreign key (numar_matricol)
references elev (numar_matricol) on delete cascade
);

create table participare
( cod_proiect decimal not null
, numar_matricol decimal not null
, data_participare date not null
, constraint cod_proiect_plus_numar_matricol_plus_data_participare_pk
primary key (cod_proiect, numar_matricol, data_participare)
, constraint cod_proiect_participare_fk
foreign key (cod_proiect)
references proiecte (cod_proiect) on delete cascade
, constraint numar_matriol_participare_fk
foreign key (numar_matricol)
references elev (numar_matricol) on delete cascade
);

insert into profesor values('1234567891111','Nume_Profesor_1','Prenume_Profesor_1','Adresa_Profesor_1','1123456789','email_Profesor_1@email.com');
insert into profesor values('1234567892222','Nume_Profesor_2','Prenume_Profesor_2','Adresa_Profesor_2','2123456789','email_Profesor_2@email.com');
insert into profesor values('1234567893333','Nume_Profesor_3','Prenume_Profesor_3','Adresa_Profesor_3','3123456789','email_Profesor_3@email.com');
insert into profesor values('1234567894444','Nume_Profesor_4','Prenume_Profesor_4','Adresa_Profesor_4','4123456789','email_Profesor_4@email.com');
insert into profesor values('1234567895555','Nume_Profesor_5','Prenume_Profesor_5','Adresa_Profesor_5','5123456789','email_Profesor_5@email.com');

insert into clasa values(1,'2019-09-15');
insert into clasa values(2,'2020-09-15');
insert into clasa values(3,'2021-09-15');
insert into clasa values(4,'2022-09-15');
insert into clasa values(5,'2022-09-15');

insert into proiecte values(1,'Turneu de Sah',true);
insert into proiecte values(2,'Vizita la muzeu',false);
insert into proiecte values(3,'Concurs de muzica',true);
insert into proiecte values(4,'Concurs de dans',true);
insert into proiecte values(5,'Concurs de mima',false);

insert into carte values(1,'Titlu_Carte_1','Autor_Carte_1','Editura_Carte_1',50);
insert into carte values(2,'Titlu_Carte_2','Autor_Carte_2','Editura_Carte_2',78);
insert into carte values(3,'Titlu_Carte_3','Autor_Carte_3','Editura_Carte_3',120);
insert into carte values(4,'Titlu_Carte_4','Autor_Carte_4','Editura_Carte_4',63);
insert into carte values(5,'Titlu_Carte_5','Autor_Carte_5','Editura_Carte_5',523);

insert into revista values(1,'1234567891111','Titlu_Revista_1','2021-09-25',25);
insert into revista values(2,'1234567893333','Titlu_Revista_2','2021-10-25',26);
insert into revista values(3,'1234567893333','Titlu_Revista_3','2021-11-25',22);
insert into revista values(4,'1234567891111','Titlu_Revista_4','2021-12-20',40);
insert into revista values(5,'1234567892222','Titlu_Revista_5','2021-01-25',23);

insert into predare values(1,'1234567893333','Matematica');
insert into predare values(1,'1234567891111','Fizica');
insert into predare values(1,'1234567892222','Chimie');
insert into predare values(2,'1234567893333','Matematica');
insert into predare values(3,'1234567894444','Matematica');

insert into elev values(1,2,'Nume_Elev_1','Prenume_Elev_1','Adresa_Elev_1','1001234567','email_Elev_1@email.com');
insert into elev values(2,2,'Nume_Elev_2','Prenume_Elev_2','Adresa_Elev_2','2001234567','email_Elev_2@email.com');
insert into elev values(3,2,'Nume_Elev_3','Prenume_Elev_3','Adresa_Elev_3','3001234567','email_Elev_3@email.com');
insert into elev values(4,2,'Nume_Elev_4','Prenume_Elev_4','Adresa_Elev_4','4001234567','email_Elev_4@email.com');
insert into elev values(5,3,'Nume_Elev_5','Prenume_Elev_5','Adresa_Elev_5','5001234567','email_Elev_5@email.com');
insert into elev values(6,3,'Nume_Elev_6','Prenume_Elev_6','Adresa_Elev_6','6001234567','email_Elev_6@email.com');
insert into elev values(7,4,'Nume_Elev_7','Prenume_Elev_7','Adresa_Elev_7','7001234567','email_Elev_7@email.com');
insert into elev values(8,1,'Nume_Elev_8','Prenume_Elev_8','Adresa_Elev_8','8001234567','email_Elev_8@email.com');

insert into note values('Matematica','2021-10-12',1,9);
insert into note values('Matematica','2021-11-01',1,10);
insert into note values('Fizica','2021-10-18',1,8);
insert into note values('Chimie','2021-10-28',3,9);
insert into note values('Matematica','2021-11-19',4,8);
insert into note values('Matematica','2021-12-12',5,9);
insert into note values('Matematica','2021-12-18',2,8);
insert into note values('Matematica','2022-01-12',1,8);

insert into imprumut values(1,3,'2021-11-20');
insert into imprumut values(3,1,'2021-11-26');
insert into imprumut values(4,1,'2021-12-02');
insert into imprumut values(2,4,'2021-12-21');
insert into imprumut values(1,7,'2021-12-22');

insert into participare values(1,2,'2022-01-06');
insert into participare values(1,3,'2021-01-06');
insert into participare values(3,2,'2021-01-06');
insert into participare values(3,5,'2022-01-06');
insert into participare values(4,6,'2021-11-15');