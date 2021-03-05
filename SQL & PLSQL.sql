--Exercitiul 4
--Implementati în Oracle diagrama conceptuala realizata: definiti toate tabelele,  implementând  toate constrângerile de integritate necesare (chei primare, cheile externe etc).

create table detinator_brand (
                                id_detinator number(3) primary key,
                                nume varchar2(50),
                                tara_origine varchar2(30)
                                );

create table brand (
                    id_brand number(4) primary key,
                    denumire varchar2(50),
                    an_infiintare number(4),
                    id_detinator number(3)
                    );
alter table brand
add constraint fk_brand foreign key (id_detinator) references detinator_brand(id_detinator) on delete cascade;

create table model_masina (
                    id_model number(5) primary key,
                    id_brand number(4),
                    nume_model varchar2(50)                 
                    );
alter table model_masina
add constraint fk_model foreign key (id_brand) references brand(id_brand) on delete cascade;

create table optiune (
                        id_optiune number(3) primary key,
                        capacitate_motor number(4,2),
                        transmisie varchar2(50),
                        combustibil varchar2(50)
                        );
                  
create table optiune_model(
                        id_optiune number(3),
                        id_model number(5),
                        pret number(9),
                        primary key (id_optiune, id_model)
                        );
alter table optiune_model 
add constraint fk_optm_1 foreign key (id_optiune) references optiune(id_optiune) on delete  cascade;
alter table optiune_model 
add constraint fk_optm_2 foreign key (id_model) references model_masina(id_model) on delete  cascade;

create table cumparator(
                    id_cumparator number(5) primary key,
                    adresa varchar2(50),
                    nr_telefon varchar2(10)
                    );       
             
create table persoana_fizica(
                            id_cumparator number(5) primary key,
                            nume varchar2(20),
                            prenume varchar2(40),
                            serie_ci varchar2(3),
                            nr_ci number(6)
                            );
alter table persoana_fizica add constraint fk_pz1 foreign key (id_cumparator) references cumparator(id_cumparator) on delete cascade;

create table persoana_juridica (
                                id_cumparator number(5) primary key,
                                cui number(8),
                                data_incepere_activitate date,
                                profit_anual number(8),
                                nume_firma varchar2(50)
                                );
alter table persoana_juridica add constraint fk_pj1 foreign key (id_cumparator) references cumparator(id_cumparator) on delete cascade; 

create table in_proprietate (
                            id_optiune number(3),
                            id_model number(5),
                            id_cumparator number(5),
                            nr_exemplare number(4),
                            primary key (id_model, id_optiune, id_cumparator)
);
alter table in_proprietate add constraint fk_ip_1 foreign key (id_optiune,id_model) references optiune_model(id_optiune, id_model);
alter table in_proprietate add constraint fk_ip_2 foreign key (id_cumparator) references cumparator(id_cumparator);

--Exercitiul 5
--Adaugati informatii  coerente  în  tabelele  create  (minim 3-5  înregistrari  pentru  fiecare  entitate independenta; minim 10 inregistrari pentru tabela asociativa).

create sequence seq_detinator_brand
start with 1
increment by 1;

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Fiat Chrysler Automobiles', 'Italia');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Volkswagen Group', 'Germania');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Hyundai Motor Group', 'Coreea de Sud');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Honda Motor Company', 'Japonia');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'BMW Group', 'Germania');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'General Motors', 'SUA');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Ford Motor Company', 'SUA');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Tata Motors', 'India');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Toyota Motor Corporation', 'Japonia');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Mazda Motor Corporation', 'Japonia');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Renault-Nissan-Mitsubishi Alliance', 'Tarile de Jos');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Zhejiang Geely Holding Group Company', 'China');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Tesla', 'SUA');

insert into detinator_brand
values (seq_detinator_brand.nextval, 'Peugeot SA', 'Franta');

create sequence seq_brand
start with 1
increment by 1;

insert into brand
values (seq_brand.nextval, 'Alfa Romeo', 1910, 1);

insert into brand
values (seq_brand.nextval, 'Fiat', 1899, 1);

insert into brand
values (seq_brand.nextval, 'Maserati', 1914, 1);

insert into brand
values (seq_brand.nextval, 'Audi', 1909, 2);

insert into brand
values (seq_brand.nextval, 'Volkswagen', 1937, 2);

insert into brand
values (seq_brand.nextval, 'Lamborghini', 1963, 2);

insert into brand
values (seq_brand.nextval, 'Hyundai', 1967, 3);

insert into brand
values (seq_brand.nextval, 'Kia', 1963, 3);

insert into brand
values (seq_brand.nextval, 'Honda', 1948, 4);

insert into brand
values (seq_brand.nextval, 'BMW', 1916, 5);

insert into brand
values (seq_brand.nextval, 'Chevrolet', 1911, 6);

insert into brand
values (seq_brand.nextval, 'Ford', 1903, 7);

insert into brand
values (seq_brand.nextval, 'Land Rover', 1948, 8);

insert into brand
values (seq_brand.nextval, 'Toyota', 1937, 9);

insert into brand
values (seq_brand.nextval, 'Mazda', 1920, 10);

insert into brand
values (seq_brand.nextval, 'Nissan', 1933, 11);

insert into brand
values (seq_brand.nextval, 'Volvo', 1927, 12);

insert into brand
values (seq_brand.nextval, 'Tesla', 2003, 13);

insert into brand
values (seq_brand.nextval, 'Opel', 1862, 14);

insert into brand
values (seq_brand.nextval, 'Peugeot', 1882, 14);

create sequence seq_model 
start with 1
increment by 1;


insert into model_masina
values (seq_model.nextval, 2, 'Bella');

insert into model_masina
values (seq_model.nextval, 2, '4C');

insert into model_masina
values (seq_model.nextval, 3, 'Cronos');

insert into model_masina
values (seq_model.nextval, 4, 'GranTurismo');

insert into model_masina
values (seq_model.nextval, 5, 'A6');

insert into model_masina
values (seq_model.nextval, 5, 'Q3');

insert into model_masina
values (seq_model.nextval, 6, 'Polo');

insert into model_masina
values (seq_model.nextval, 6, 'Golf');

insert into model_masina
values (seq_model.nextval, 7, 'Aventador');

insert into model_masina
values (seq_model.nextval, 7, 'Veneno');

insert into model_masina
values (seq_model.nextval, 8, 'Accent');

insert into model_masina
values (seq_model.nextval, 8, 'Elantra');

insert into model_masina
values (seq_model.nextval, 10, 'Civic');

insert into model_masina
values (seq_model.nextval, 11, 'X7');

insert into model_masina
values (seq_model.nextval, 12, 'i3');

insert into model_masina
values (seq_model.nextval, 12, 'Spark');

insert into model_masina
values (seq_model.nextval, 13, 'Focus');

insert into model_masina
values (seq_model.nextval, 13, 'Fiesta');

insert into model_masina
values (seq_model.nextval, 14, 'LR3');

insert into model_masina
values (seq_model.nextval, 15, 'Yaris');

insert into model_masina
values (seq_model.nextval, 16, 'CX-3');

insert into model_masina
values (seq_model.nextval, 17, 'Note');

insert into model_masina
values (seq_model.nextval, 18, 'S40');

insert into model_masina
values (seq_model.nextval, 19, 'Model 3');

insert into model_masina
values (seq_model.nextval, 20, 'Corsa');

insert into model_masina
values (seq_model.nextval, 20, 'Astra');

insert into model_masina
values (seq_model.nextval, 21, '207');

insert into model_masina
values (seq_model.nextval, 9, 'Optima');


create sequence seq_cump
start with 1
increment by 1;

insert into cumparator
values (seq_cump.nextval, 'Str. Poiana, nr. 5, Comarnic', '0753234567');

insert into cumparator
values (seq_cump.nextval, 'Str. Castanilor, nr. 203, Sinaia', '0769853987');

insert into cumparator
values (seq_cump.nextval, 'Bd-ul Iuliu Maniu, nr.7, Sector 6, Bucuresti', '0244567890');

insert into cumparator
values (seq_cump.nextval, 'Bd-ul 15 Noiembrie, nr. 50A, Brasov', '0245678490');

insert into cumparator
values (seq_cump.nextval, 'Str. Ion Creanga, nr. 20, Constanta', '0789675456');

insert into cumparator
values (seq_cump.nextval, 'Bd-ul Mihai Eminescu, nr. 48B, Cluj-Napoca', '02454320');

insert into cumparator
values (seq_cump.nextval, 'Bd-ul Chisinau, nr. 3C, Sector 4, Bucuresti', '0765431987');

insert into cumparator
values (seq_cump.nextval, 'Str. Livadei, nr. 80, Craiova', '0785214567');

insert into cumparator
values (seq_cump.nextval, 'Bd-ul I.L.Caragiale, nr. 55, Timisoara', '0244561234');

insert into cumparator 
values (seq_cump.nextval, 'Bd-ul Timisoara, nr. 10, Timisoara', '0799078909');

insert into cumparator 
values (seq_cump.nextval, 'Str. Stiintei, nr. 39, Constanta', '0765134094');

insert into cumparator 
values (seq_cump.nextval, 'Bd-ul Tudor Arghezi, nr. 99, Iasi', '0244543189');

insert into cumparator 
values (seq_cump.nextval, 'Str. Vasile Alecsandri, nr. 5, Galati', '0244356098');

insert into persoana_fizica
values (1, 'Popescu', 'Maria', 'PX', 234567);

insert into persoana_fizica
values (2, 'Ionescu', 'Ana', 'PH', 987654);

insert into persoana_fizica
values (5, 'Anastasescu', 'Ion', 'CH', 206840);

insert into persoana_fizica
values (7, 'Miron', 'Costin', 'CP', 563890);

insert into persoana_fizica
values (22, 'Vasile', 'Corina', 'TM', 109543);

insert into persoana_fizica
values (41, 'Comanici', 'Ioana', 'TM', 907654 );

insert into persoana_fizica 
values (42, 'Bulei', 'Stefania', 'CT', 674321 );



insert into persoana_juridica
values (3, 5436789, to_date('25-01-2007', 'dd-mm-yyyy'), 100000, 'A and F SRL');

insert into persoana_juridica
values (4, 465398, to_date('19-06-2005', 'dd-mm-yyyy'), 345000, 'Smile SRL');

insert into persoana_juridica
values (6, 897678, to_date('07-10-2010', 'dd-mm-yyyy'), 456890, 'Food SRL');

insert into persoana_juridica 
values (21, 908789, to_date ('01-01-1999', 'dd-mm-yyyy'), 60000, 'Work SRL');

insert into persoana_juridica 
values (23, 861356, to_date('02-09-2004', 'dd-mm-yyyy'), 120000, 'Dental SRL');

insert into persoana_juridica
values (43, 78654321, to_date('09-02-2009', 'dd-mm-yyyy'),78900, 'Psiholog SRL' );

insert into persoana_juridica
values (44, 783214, to_date('06-02-2009', 'dd-mm-yyyy'), 46000, 'V and A SRL' );


create sequence seq_optiune
start with 1
increment by 1;

insert into optiune 
values (seq_optiune.nextval, 1.6, 'automata DSG', 'benzina');

insert into optiune 
values (seq_optiune.nextval, 1.6, 'automata cu convertizor de cuplu', 'motorina');

insert into optiune 
values (seq_optiune.nextval, 2.0, 'manuala', 'GPL');

insert into optiune 
values (seq_optiune.nextval, 1.5, 'manuala robotizata', 'GNC');

insert into optiune 
values (seq_optiune.nextval, 1.3, 'manuala CVT', 'benzina');

insert into optiune 
values (seq_optiune.nextval, 1.9, 'manuala', 'motorina');

insert into optiune 
values (seq_optiune.nextval, 1.6, 'automata DSG', 'GPL');

insert into optiune 
values (seq_optiune.nextval, 1.6, 'automata DSG', 'benzina');

insert into optiune 
values (seq_optiune.nextval, null, null, 'electric');


insert into optiune_model
values(1, 2, 10000);

insert into optiune_model
values(1, 3, 25000);

insert into optiune_model
values(2, 2, 35750);

insert into optiune_model
values(3, 4,5890);

insert into optiune_model
values( 4, 5, 34570);

insert into optiune_model
values( 4, 6, 27500);

insert into optiune_model
values( 9, 25, 50000);

insert into optiune_model
values( 9, 16, 60000);

insert into optiune_model
values( 5, 7, 34500);

insert into optiune_model
values( 1,7, 7500);

insert into optiune_model
values(7, 8, 11200);

insert into optiune_model
values( 8, 10, 13750);

insert into optiune_model
values(4, 11, 13900);

insert into optiune_model
values(3, 12, 56000);

insert into optiune_model
values( 4, 13, 19000);

insert into optiune_model
values(2, 3, 23900);

insert into optiune_model
values(1, 4, 10000);

insert into optiune_model
values(7, 14, 10000);

insert into optiune_model
values(4, 3, 10000);

insert into optiune_model
values(3, 15, 10000);

insert into optiune_model
values(4, 17, 23450);

insert into optiune_model
values(4, 18, 23400);

insert into optiune_model
values(3, 19, 90000);

insert into optiune_model
values(2, 20, 8000);

insert into optiune_model
values(7, 21, 40230);

insert into optiune_model
values(5, 22, 34500);

insert into optiune_model
values(4, 23, 11000);

insert into optiune_model
values(3, 24, 18900);

insert into optiune_model
values(5, 26, 20000);

insert into optiune_model
values(2, 27, 10000);

insert into optiune_model
values(3, 28, 11300);

insert into optiune_model
values(2, 28, 34000);

insert into optiune_model
values (3,9,12450);

insert into optiune_model
values (5,29,67000);


insert into in_proprietate
values (1,2,1,1);

insert into in_proprietate
values (2,2,1,5);

insert into in_proprietate
values (1,2,2,4);

insert into in_proprietate
values (1,3,2,2);

insert into in_proprietate
values (1,3,3,2);

insert into in_proprietate
values (3,4,3,1);

insert into in_proprietate
values (4,6,4,2);

insert into in_proprietate
values (1,2,5,1);

insert into in_proprietate
values (9,25,6,1);

insert into in_proprietate
values (9,16,6,1);

insert into in_proprietate
values (7,14,7,5);

insert into in_proprietate
values (7,8,6,2);

insert into in_proprietate 
values (4, 23, 21, 3);

insert into in_proprietate
values (5, 26, 22, 2);

insert into in_proprietate
values (9, 25, 23, 4);

insert into in_proprietate
values (9,25,1,1);

insert into in_proprietate
values (4,11,22,3);

insert into in_proprietate
values(5,29,7,1);

insert into in_proprietate
values (5,26,7,1);
        

insert into in_proprietate
values (4, 23, 41, 2);

insert into in_proprietate
values (3,15,42, 3);

insert into in_proprietate
values (2,28,43,4);

insert into in_proprietate
values (5,29,44,3);

--Exercitiul 6
-- Definiti un subprogram stocat care sa utilizeze un tip de colectie studiat. Apelati subprogramul. 
--Cerinta:
--Definiti o procedura care sa modifice preturile unor modele în functie de optiunile lor astfel: 
--daca folosesc benzina, pretul lor va creste cu 10% din pretul initial doar pentru optiunile care includ benzina, 
--iar daca folosesc motorina, pretul lor va deveni cel mai mic pret dintre valorile modelelor produse de acelasi brand, indiferent de optiunile lor. 
--si in acest caz, modificarile se vor face asupra optiunilor modelelor respective care includ motorina drept combustibil.



create or replace procedure modificare_pret is
    type tablou_indexat_model is table of model_masina.id_model%type index by pls_integer;
    id_modele tablou_indexat_model;
    type tablou_indexat_opt is table of optiune_model.id_optiune%type index by pls_integer;
    model_opt tablou_indexat_opt;
    type tablou_indexat_comb is table of optiune.combustibil%type index by pls_integer;
    model_comb tablou_indexat_comb;
    type tablou_indexat_pret_min is table of optiune_model.pret%type index by pls_integer;
    pret_minim_brand tablou_indexat_pret_min;
    pret_min optiune_model.pret%type;
begin
    select om.id_model, om.id_optiune, o.combustibil
    bulk collect into id_modele, model_opt, model_comb
    from optiune o join optiune_model om on (o.id_optiune = om.id_optiune) 
    where combustibil = 'benzina' or combustibil = 'motorina';
    
    for i in id_modele.first..id_modele.last loop
        if (model_comb(i) = 'motorina') then
            select min(pret)
            into pret_min
            from optiune_model om join model_masina mm on (om.id_model = mm.id_model) join brand b on (b.id_brand = mm.id_brand)
            where b.denumire = (select denumire 
                                from brand b join model_masina mm on (mm.id_brand = b.id_brand)
                                where id_model = id_modele(i));
            pret_minim_brand(i) := pret_min;
        end if;
    end loop;
    
    for i in id_modele.first..id_modele.last loop
        if (model_comb(i) = 'benzina') then
            update optiune_model
            set pret = pret + 10 / 100 * pret
            where id_model = id_modele(i) and id_optiune = model_opt(i);
        else             
            update optiune_model
            set pret = pret_minim_brand(i)
            where id_model = id_modele(i) and id_optiune = model_opt(i);
        end if;
        
    end loop;
end modificare_pret;
/

begin
    modificare_pret();
end;
/

select om.id_model, om.id_optiune, o.combustibil, om.pret, nume_model, denumire
    from optiune o join optiune_model om on (o.id_optiune = om.id_optiune) join model_masina mm on (mm.id_model = om.id_model) join brand b on (b.id_brand = mm.id_brand)
    where combustibil = 'benzina' or combustibil = 'motorina';
    
--Exercitiul 7;
-- Definiti un subprogram stocat care sa utilizeze un tip de cursor studiat. Apelati subprogramul. 
--Cerinta: Definiti o procedura care va afisa numele brand-urilor care au cele mai multe modele vândute aflate în proprietatea unor persoane fizice.

create or replace procedure best_sold_brand is
    cursor c is 
        select ip.id_optiune, ip.id_model, ip.id_cumparator, ip.nr_exemplare
        from persoana_fizica pz join cumparator c on (pz.id_cumparator = c.id_cumparator) 
                                join in_proprietate ip on (ip.id_cumparator = c.id_cumparator);
    nume_brand brand.denumire%type;
    type tablou_indexat_brand is table of number(4) index by brand.denumire%type;
    brands tablou_indexat_brand;
    type tablou_indexat_model is table of in_proprietate%rowtype index by pls_integer;
    models tablou_indexat_model;
    type tablou_indexat_brand2 is table of brand.denumire%type index by pls_integer;
    aux tablou_indexat_brand2;
    nr_maxim_modele number;
    i varchar2(20);
begin
    open c;
    fetch c bulk collect into models;
    close c;
    
    select denumire
    bulk collect into aux
    from brand;
    
    for j in 1..aux.count loop
        brands(aux(j)) := 0;
    end loop;
    
    for j in models.first..models.last loop
        select denumire
        into nume_brand
        from brand b join model_masina mm on (mm.id_brand = b.id_brand)
        where id_model = models(j).id_model;
        brands(nume_brand) := brands(nume_brand) + 1;        
    end loop;
    
    nr_maxim_modele := 0;
    i := brands.first;
    while i is not null loop
        if (brands(i) > nr_maxim_modele) then
            nr_maxim_modele := brands(i);
        end if;
        i := brands.next(i);
   end loop;
    
    i := brands.first;
    while i is not null loop
        if (brands(i) = nr_maxim_modele) then
           dbms_output.put_line (i);
        end if;
        i := brands.next(i);
   end loop;
   
end best_sold_brand;
/

begin
    best_sold_brand();
end;
/

--Exercitiul 8
-- Definiti un subprogram stocat de tip functie care sa utilizeze 3 dintre tabelele definite. Tratati toate exceptiile care pot aparea. Apelati subprogramul astfel încât s? eviden?ia?i toate cazurile tratate.
--Cerinta: 
--Definiti o functie care va avea ca parametru un an si va returna numarul total al optiunilor in care se gasesc modelele apartinând brand-urilor al carui an de infiintare va fi cel primit ca argument.


create or replace function nr_optiuni_modele (an brand.an_infiintare%type) return number is
    type tablou_indexat_brand is table of brand.id_brand%type index by pls_integer;
    brands tablou_indexat_brand;
    nr_total_optiuni number := 0;
    nr number;
    i number;
begin   
    select id_brand
    bulk collect into brands
    from brand
    where an_infiintare = an;
    
    if (brands.count = 0) then
        raise no_data_found;
    end if;
    
    i := brands.first;
    while i is not null loop
        select count(id_optiune)
        into nr
        from optiune_model om join model_masina mm on (om.id_model = mm.id_model) join brand b on (b.id_brand = mm.id_brand)
        where b.id_brand = brands(i);
        nr_total_optiuni := nr_total_optiuni + nr;
        i := brands.next(i);
    end loop;

    return nr_total_optiuni;
    
    exception
        when no_data_found then
            dbms_output.put_line('Niciun brand nu a fost infiintat in anul primit ca argument');
            return -1;
end nr_optiuni_modele;
/

--pentru exceptie
declare
    nr_optiuni number;
begin
    nr_optiuni := nr_optiuni_modele(1850);
    dbms_output.put_line (nr_optiuni);
end;
/

declare
    nr_optiuni number;
begin
    nr_optiuni := nr_optiuni_modele(1937);
    dbms_output.put_line (nr_optiuni);
end;
/

--Exercitiul 9
-- Definiti un subprogram stocat de tip procedur? care sa utilizeze 5 dintre tabelele definite. Tratati toate exceptiile care pot aparea. Apelati subprogramul astfel incat sa evidentiati toate cazurile tratate. 
-- Cerinta:Definiti o procedura care primeste ca argument id-ul unei persoane juridice si afiseaza numele si valorea celui mai scump model achizitionat de firma respectiva,
--cat si numele firmei si numarul de exemplare din modelul respectiv.


create or replace procedure best_model(id_cump persoana_juridica.id_cumparator%type) is
    nume_f persoana_juridica.nume_firma%type;
    nume_m model_masina.nume_model%type;
    valoare optiune_model.pret%type;
    nr_ex in_proprietate.nr_exemplare%type;
begin
    select nume_firma
    into nume_f
    from persoana_juridica
    where id_cumparator = id_cump;
    
    select nume_model, pret, nr_exemplare
    into nume_m, valoare, nr_ex
    from persoana_juridica pj join cumparator c on (pj.id_cumparator = c.id_cumparator) join in_proprietate ip on (ip.id_cumparator = c.id_cumparator)
                              join optiune_model om on (om.id_optiune = ip.id_optiune) and (om.id_model = ip.id_model)
                              join model_masina mm on (mm.id_model = om.id_model)
    where pret = (select max(pret)
                  from optiune_model om join in_proprietate ip on (om.id_model = ip.id_model) and (om.id_optiune = ip.id_optiune) join cumparator c on (c.id_cumparator = ip.id_cumparator) 
                  where c.id_cumparator = id_cump
                  )
    and pj.id_cumparator = id_cump;
    
   if(nr_ex = 1) then
        dbms_output.put_line('Firma ' || nume_f || ' detine ' || nr_ex || ' ' || nume_m || ', in valoare de ' || valoare );
    else 
         dbms_output.put_line('Firma ' || nume_f || ' detine ' || nr_ex || ' ' || nume_m || ', in valoare de ' || valoare || 'fiecare');
    end if;
    
    exception
        when no_data_found then
            dbms_output.put_line('Nu exista persoana juridica in calitate de cumparator cu id-ul primit');
end best_model;
/

--pentru exceptie
begin
    best_model(2);
end;
/


begin
    best_model(3);
end;
/

--Exercitiul 10
-- Definiti un trigger de tip LMD la nivel de comand?. Declansati trigger-ul. 
-- Cerinta: Definiti un trigger care nu va permite achizitia de modele în zilele de sarbatoare, declarate libere (1, 25 ?i 26 decembrie, 1, 2 ?i 24 ianuarie , 1 mai, 1 iunie, 15 august, 30 noiembrie)
--din anul 2021.


create or replace trigger fara_achizitii_zi_libera
before insert or update on in_proprietate
declare 
    type zile is table of date;
    zile_libere zile := zile();
begin
    for i in 1..15 loop
        zile_libere.extend;
    end loop;
    zile_libere(1) := to_date('01-01-2021', 'dd-mm-yyyy');
    zile_libere(2) := to_date('02-01-2021', 'dd-mm-yyyy');
    zile_libere(3) := to_date('24-01-2021', 'dd-mm-yyyy');
    zile_libere(4) := to_date('01-05-2021', 'dd-mm-yyyy');
    zile_libere(5) := to_date('01-06-2021', 'dd-mm-yyyy');
    zile_libere(6) := to_date('15-08-2021', 'dd-mm-yyyy');
    zile_libere(7) := to_date('03-11-2021', 'dd-mm-yyyy');
    zile_libere(8) := to_date('01-12-2021', 'dd-mm-yyyy');
    zile_libere(9) := to_date('25-12-2021', 'dd-mm-yyyy');
    zile_libere(10) := to_date('26-12-2021', 'dd-mm-yyyy');
    zile_libere(11) := to_date('30-04-2021', 'dd-mm-yyyy');
    zile_libere(12) := to_date('02-05-2021', 'dd-mm-yyyy');
    zile_libere(13) := to_date('03-05-2021', 'dd-mm-yyyy');
    zile_libere(14) := to_date('20-06-2021', 'dd-mm-yyyy');
    zile_libere(15) := to_date('21-06-2021', 'dd-mm-yyyy');
    
    if (to_date(to_char(sysdate,'dd-mm-yyyy'), 'dd-mm-yyyy')  member of zile_libere) then
        raise_application_error(-20001, 'Nu se pot efectua achizitii astazi');
    end if;
end;
/

insert into in_proprietate
values (2,28,1,2);


--Exercitiul 11
--Definiti un trigger de tip LMD la nivel de linie. Declansati trigger-ul. 
--Cerinta:
--Definiti un trigger care sa nu permita modificarea pretului unui model cu o anumita optiune astfel încat acesta sa devina cel mai scump model al companiei care detine brand-ul modelului respectiv.


create or replace trigger modificare_pret 
before update of pret on optiune_model
for each row
declare
    pret_maxim_companie optiune_model.pret%type;
    id_companie detinator_brand.id_detinator%type;
    pragma autonomous_transaction;
begin   
    select distinct(db.id_detinator)
    into id_companie
    from optiune_model om join model_masina mm on (mm.id_model = om.id_model) join brand b on (b.id_brand = mm.id_brand)
                          join detinator_brand db on (db.id_detinator = b.id_detinator)
    where om.id_model = :old.id_model;

    select max(pret)
    into pret_maxim_companie
    from optiune_model om join model_masina mm on (mm.id_model = om.id_model) join brand b on (b.id_brand = mm.id_brand)
                          join detinator_brand db on (db.id_detinator = b.id_detinator)
    where db.id_detinator = id_companie;
    
    if (:new.pret > pret_maxim_companie) then
        raise_application_error (-20001, 'Pretul depaseste pretul maxim al companiei ce detine brand-ul modelului');
    end if;
end; 
/

update optiune_model
set pret = 40000
where id_model = 3 and id_optiune = 2 ;

--Exercitiul 12
--Definiti un trigger de tip LDD. Declansati trigger-ul. 
--Cerinta:Definiti un trigger care va afisa informatiile referitoare la orice actiune asupra schemei bazei de date, dupa ce le va memora într-un tabel.


create table info_evenimente_schema (
                                    utilizator_bd varchar2(30),
                                    eveniment_bd varchar2(10),
                                    data_eveniment_bd date,
                                    nume_obj varchar2(30)
                                    );

create or replace trigger afisare_info
after create or alter or drop on schema
declare
    nume_eveniment varchar2(20);
begin
    insert into info_evenimente_schema
    values (sys.login_user, sys.sysevent, sysdate, sys.dictionary_obj_name);
    if(upper(sys.sysevent) = 'CREATE') then
        nume_eveniment := 'a creat';
    elsif (upper(sys.sysevent) = 'ALTER') then
        nume_eveniment := 'a modificat';
    else 
        nume_eveniment := 'a sters';
    end if;
    
    dbms_output.put_line ('Utilizatorul ' || sys.login_user || ' ' || nume_eveniment || ' ' || sys.dictionary_obj_name || ' in data de ' || sysdate);
end;
/

alter table detinator_brand
add an_infiintare number(4);

alter table detinator_brand
drop column an_infiintare;

--Exercitiul 13
-- Definiti un pachet care sa contina toate obiectele definite in cadrul proiectului. 

create or replace package pachet is
    type tablou_indexat_model is table of model_masina.id_model%type index by pls_integer;
    type tablou_indexat_model1 is table of in_proprietate%rowtype index by pls_integer;
    type tablou_indexat_opt is table of optiune_model.id_optiune%type index by pls_integer;
    type tablou_indexat_comb is table of optiune.combustibil%type index by pls_integer;
    type tablou_indexat_pret_min is table of optiune_model.pret%type index by pls_integer;
    type tablou_indexat_brand1 is table of number(4) index by brand.denumire%type;
    type tablou_indexat_brand2 is table of brand.id_brand%type index by pls_integer;
    type tablou_indexat_brand3 is table of brand.denumire%type index by pls_integer;
    procedure modificare_pret;           
    procedure best_sold_brand;
    function nr_optiuni_modele (an brand.an_infiintare%type) return number;
    procedure best_model(id_cump persoana_juridica.id_cumparator%type);
    cursor c return in_proprietate%rowtype;
end pachet;
/

create or replace package body pachet is
    cursor c return in_proprietate%rowtype is 
        select ip.id_optiune, ip.id_model, ip.id_cumparator, ip.nr_exemplare
        from persoana_fizica pz join cumparator c on (pz.id_cumparator = c.id_cumparator) 
                                join in_proprietate ip on (ip.id_cumparator = c.id_cumparator);
        
    procedure modificare_pret is
        id_modele tablou_indexat_model;
        model_opt tablou_indexat_opt;
        model_comb tablou_indexat_comb;
        pret_minim_brand tablou_indexat_pret_min;
        pret_min optiune_model.pret%type;
    begin
    
        select om.id_model, om.id_optiune, o.combustibil
        bulk collect into id_modele, model_opt, model_comb
        from optiune o join optiune_model om on (o.id_optiune = om.id_optiune) 
        where combustibil = 'benzina' or combustibil = 'motorina';
    
        for i in id_modele.first..id_modele.last loop
            if (model_comb(i) = 'motorina') then
                select min(pret)
                into pret_min
                from optiune_model om join model_masina mm on (om.id_model = mm.id_model) join brand b on (b.id_brand = mm.id_brand)
                where b.denumire = (select denumire 
                                    from brand b join model_masina mm on (mm.id_brand = b.id_brand)
                                    where id_model = id_modele(i));
                pret_minim_brand(i) := pret_min;
            end if;
        end loop;
    
        for i in id_modele.first..id_modele.last loop
            if (model_comb(i) = 'benzina') then
                update optiune_model
                set pret = pret + 10 / 100 * pret
                where id_model = id_modele(i) and id_optiune = model_opt(i);
            else             
                update optiune_model
                set pret = pret_minim_brand(i)
                where id_model = id_modele(i) and id_optiune = model_opt(i);
            end if;            
        end loop;
        
    end modificare_pret;
    
    procedure best_sold_brand is
        nume_brand brand.denumire%type;
        brands tablou_indexat_brand1;
        models tablou_indexat_model1;
        aux tablou_indexat_brand3;
        nr_maxim_modele number;
        i varchar2(20);
    begin
    
        open c;
        fetch c bulk collect into models;
        close c;
        
        select denumire
        bulk collect into aux
        from brand;
        
        for j in 1..aux.count loop
            brands(aux(j)) := 0;
        end loop;
        
        for j in models.first..models.last loop
            select denumire
            into nume_brand
            from brand b join model_masina mm on (mm.id_brand = b.id_brand)
            where id_model = models(j).id_model;
            brands(nume_brand) := brands(nume_brand) + 1;        
        end loop;
        
        nr_maxim_modele := 0;
        i := brands.first;
        while i is not null loop
            if (brands(i) > nr_maxim_modele) then
                nr_maxim_modele := brands(i);
            end if;
            i := brands.next(i);
       end loop;
        
        i := brands.first;
        while i is not null loop
            if (brands(i) = nr_maxim_modele) then
               dbms_output.put_line (i);
            end if;
            i := brands.next(i);
       end loop;   
       
    end best_sold_brand;
    
    function nr_optiuni_modele (an brand.an_infiintare%type) return number is
        brands tablou_indexat_brand2;
        nr_total_optiuni number := 0;
        nr number;
        i number;
    begin
    
        select id_brand
        bulk collect into brands
        from brand
        where an_infiintare = an;
        
        if (brands.count = 0) then
            raise no_data_found;
        end if;
        
        i := brands.first;
        while i is not null loop
            select count(id_optiune)
            into nr
            from optiune_model om join model_masina mm on (om.id_model = mm.id_model) join brand b on (b.id_brand = mm.id_brand)
            where b.id_brand = brands(i);
            nr_total_optiuni := nr_total_optiuni + nr;
            i := brands.next(i);
        end loop;
    
        return nr_total_optiuni;
        
        exception
            when no_data_found then
                dbms_output.put_line('Niciun brand nu a fost infiintat in anul primit ca argument');
                return -1;
                
    end nr_optiuni_modele;
    
    procedure best_model(id_cump persoana_juridica.id_cumparator%type) is
        nume_f persoana_juridica.nume_firma%type;
        nume_m model_masina.nume_model%type;
        valoare optiune_model.pret%type;
        nr_ex in_proprietate.nr_exemplare%type;
    begin
    
        select nume_firma
        into nume_f
        from persoana_juridica
        where id_cumparator = id_cump;
        
        select nume_model, pret, nr_exemplare
        into nume_m, valoare, nr_ex
        from persoana_juridica pj join cumparator c on (pj.id_cumparator = c.id_cumparator) 
                                  join in_proprietate ip on (ip.id_cumparator = c.id_cumparator)
                                  join optiune_model om on (om.id_optiune = ip.id_optiune) and (om.id_model = ip.id_model)
                                  join model_masina mm on (mm.id_model = om.id_model)
        where pret = (select max(pret)
                      from optiune_model om join in_proprietate ip on (om.id_model = ip.id_model) and (om.id_optiune = ip.id_optiune) 
                      join cumparator c on (c.id_cumparator = ip.id_cumparator) 
                      where c.id_cumparator = id_cump
                      )
        and pj.id_cumparator = id_cump;
        
        dbms_output.put_line('Firma ' || nume_f || ' detine ' || nr_ex || ' ' || nume_m || ', in valoare de ' || valoare || ' fiecare');
        
        exception
            when no_data_found then
                dbms_output.put_line('Nu exista persoana juridica in calitate de cumparator cu id-ul primit');
                
    end best_model;
end pachet;
/

begin
    pachet.modificare_pret();
end;
/

begin
    pachet.best_sold_brand();
end;
/

declare
    an brand.an_infiintare%type;
begin
    an := pachet.nr_optiuni_modele(1937);
    dbms_output.put_line(an);
end;
/

--pentru execptie
declare
    an brand.an_infiintare%type;
begin
    an := pachet.nr_optiuni_modele(1850);
    dbms_output.put_line(an);
end;
/

--pentru exceptie
begin
    pachet.best_model(2);
end;
/

begin
    pachet.best_model(3);
end;
/

--Exercitiul 14
--Definiti un pachet care sa includa tipuri de date complexe si obiecte necesare pentru actiuni integrate. 

create or replace package complex is
    type tablou_nume_modele is table of model_masina.nume_model%type index by pls_integer;
    type tablou_modele_branduri is table of tablou_nume_modele index by brand.denumire%type;
    type modele_persoana is record
    (
        nume persoana_fizica.nume%type,
        prenume persoana_fizica.prenume%type,
        serie_ci persoana_fizica.serie_ci%type,
        nr_ci persoana_fizica.nr_ci%type,
        modele_masini tablou_modele_branduri
    );
    type tablou_inregistrari is table of modele_persoana index by pls_integer;
    procedure afisare_date;
end complex;
/

create or replace package body complex is
--Procedura ce afiseaza date despre persoanele_fizice si modelele pe care le detin
    procedure afisare_date is
        persoane tablou_inregistrari;
        nume_modele tablou_nume_modele;
        modele_brand tablou_modele_branduri;
        cursor c is 
            select *
            from persoana_fizica;
        i number := 1;
        linie persoana_fizica%rowtype;
        type tablou_indexat_brand2 is table of brand.denumire%type index by pls_integer;
        aux tablou_indexat_brand2;
        b brand.denumire%type;
        j varchar2(20);
        z number;

    begin
        open c;
        loop
            fetch c into linie;
            exit when c%notfound;           
            select denumire
            bulk collect into aux
            from brand b join model_masina mm on (b.id_brand = mm.id_brand)join optiune_model om on (mm.id_model = om.id_model)
                                join in_proprietate ip on (ip.id_model = om.id_model) and (ip.id_optiune = om.id_optiune)
                                join cumparator c on (c.id_cumparator = ip.id_cumparator)
                                join persoana_fizica pz on (pz.id_cumparator = c.id_cumparator) 
            where pz.id_cumparator = linie.id_cumparator;

            persoane(i).nume := linie.nume;
            persoane(i).prenume := linie.prenume;
            persoane(i).serie_ci := linie.serie_ci;
            persoane(i).nr_ci := linie.nr_ci;

            select distinct(nume_model)
            bulk collect into nume_modele
            from model_masina mm join optiune_model om on (mm.id_model = om.id_model)
                                join in_proprietate ip on (ip.id_model = om.id_model) and (ip.id_optiune = om.id_optiune)
                                join cumparator c on (c.id_cumparator = ip.id_cumparator)
                                join persoana_fizica pz on (pz.id_cumparator = c.id_cumparator)
            where pz.id_cumparator = linie.id_cumparator;

            for j in nume_modele.first..nume_modele.last loop
                select denumire
                into b
                from brand b join model_masina mm on (b.id_brand = mm.id_brand)
                where nume_model = nume_modele(j);
                modele_brand(b)(modele_brand.count + 1) := nume_modele(j);
            end loop;
            persoane(i).modele_masini := modele_brand;
            i := i + 1;
            modele_brand.delete;
        end loop;
      close c;

      for i in persoane.first..persoane.last loop
        dbms_output.put_line(persoane(i).nume || ' ' || persoane(i).prenume||': ');
        j := persoane(i).modele_masini.first;
        while j is not null loop
            dbms_output.put(j || ': ');
            z := persoane(i).modele_masini(j).first;
            while z is not null loop
                dbms_output.put(persoane(i).modele_masini(j)(z) || ' ');
            z := persoane(i).modele_masini(j).next(z);
            end loop;
            dbms_output.new_line;
        j := persoane(i).modele_masini.next(j);
        end loop;
        dbms_output.new_line;
      end loop;

    end afisare_date;

end complex;
/

begin
    complex.afisare_date();
end;
/

