CREATE TABLE bwars_redlist.major_group_count (
    id serial,
    grouping text NOT NULL,
    num_records int NOT NULL
);

INSERT INTO bwars_redlist.major_group_count(grouping, num_records)
SELECT 'total', count(sm.*)
FROM sur_mat sm
JOIN nomenclature.species s on sm.tik = s.id
JOIN nomenclature.genus g on s.parent = g.id
JOIN nomenclature.family f on g.parent = f.id
JOIN nomenclature.superfamily sf on f.parent = sf.id;

INSERT INTO bwars_redlist.major_group_count(grouping, num_records)
SELECT 'Bombus', count(sm.*)
FROM sur_mat sm
JOIN nomenclature.species s on sm.tik = s.id
JOIN nomenclature.genus g on s.parent = g.id
JOIN nomenclature.family f on g.parent = f.id
JOIN nomenclature.superfamily sf on f.parent = sf.id
WHERE g.name = 'Bombus';

INSERT INTO bwars_redlist.major_group_count(grouping, num_records)
SELECT 'Ant', count(sm.*)
FROM sur_mat sm
JOIN nomenclature.species s on sm.tik = s.id
JOIN nomenclature.genus g on s.parent = g.id
JOIN nomenclature.family f on g.parent = f.id
JOIN nomenclature.superfamily sf on f.parent = sf.id
WHERE sf.name = 'Formicoidea';

INSERT INTO bwars_redlist.major_group_count(grouping, num_records)
SELECT 'Other bees', count(sm.*)
FROM sur_mat sm
JOIN nomenclature.species s on sm.tik = s.id
JOIN nomenclature.genus g on s.parent = g.id
JOIN nomenclature.family f on g.parent = f.id
JOIN nomenclature.superfamily sf on f.parent = sf.id
WHERE g.name != 'Bombus'
AND f.name = 'Apidae';