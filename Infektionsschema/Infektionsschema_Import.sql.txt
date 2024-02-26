DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS sozialegruppe CASCADE;
DROP TABLE IF EXISTS infiziert;
DROP TABLE IF EXISTS mitgliedin;
DROP TABLE IF EXISTS labor CASCADE;
DROP TABLE IF EXISTS virentest;

create table person
  (personid integer primary key,
    name varchar (20) not null,
    geburtsjahr integer);

create table sozialegruppe
  (gruppeid integer primary key,
    beschreibung varchar (40));

create table infiziert
  (wurdeinfiziert integer primary key,
    hatinfiziert integer references person on delete cascade,
    gruppeid integer references sozialegruppe);

create table mitgliedin
  (gruppeid integer references sozialegruppe on delete cascade,
    personid integer references person on delete cascade,
    primary key (gruppeid, personid));

create table labor
  (laborid integer primary key,
    name varchar (30));

create table virentest
  (laborid integer references labor,
    personid integer references person on delete cascade,
    testergebnis varchar(10));

Insert into person (personid, name, geburtsjahr)
  values
    (63061, 'Noah', 1997),
    (63108, 'Emma', 2008),
    (63258, 'Finn', 1981),
    (63376, 'Ben', 1965),
    (63533, 'Paul', 1982),
    (63663, 'Mia', 1976),
    (63748, 'Sarah', 1986),
    (63875, 'Markus', 1957);

Insert into sozialegruppe (gruppeid, beschreibung)
  values
    (47005, 'Familie Sichert'),
    (47011, 'Familie Anneser'),
    (47012, 'Lehrstuhl I25'),
    (47015, 'Kindergarten');

Insert into infiziert (wurdeinfiziert, hatinfiziert, gruppeid)
  values
    (63061, 63376, 47011),
    (63108, 63376, 47011),
    (63663, 63376, 47011),
    (63258, 63663, 47015);

Insert into mitgliedin (gruppeid, personid)
  values
    (47005, 63533),
    (47005, 63748),
    (47005, 63875),
    (47011, 63061),
    (47011, 63108),
    (47011, 63376),
    (47011, 63663),
    (47012, 63533),
    (47012, 63748),
    (47015, 63258),
    (47015, 63376),
    (47015, 63663),
    (47015, 63748);

Insert into labor (laborid, name)
  values
    (53001, 'Charité Berlin'),
    (53004, 'Klinikum rechts der Isar');

Insert into virentest (laborid, personid, testergebnis)
  values
    (53001, 63061, 'positiv'),
    (53001, 63108, 'positiv'),
    (53001, 63376, 'positiv'),
    (53001, 63533, 'negativ'),
    (53001, 63663, 'positiv'),
    (53004, 63258, 'positiv'),
    (53004, 63376, 'positiv'),
    (53004, 63533, 'negativ'),
    (53004, 63748, 'negativ');
