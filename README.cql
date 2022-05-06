DESCRIBE keyspaces;

TRACING ON;

CONSISTENCY;

CONSISTENCY TWO;

CREATE KEYSPACE IF NOT EXISTS not_youtube WITH REPLICATION = { 'class' : 'NetworkTopologyStrategy', 'datacenter1' : 2 };

CREATE TABLE not_youtube.user (id TIMEUUID, email TEXT, first_name TEXT, last_name TEXT, PRIMARY KEY(id));

CREATE TABLE not_youtube.video (id TIMEUUID, name TEXT, duration BIGINT, author_id TIMEUUID, likes SET<TIMEUUID>, dislikes SET<TIMEUUID>,  PRIMARY KEY((author_id), id)) WITH CLUSTERING ORDER BY (id DESC);

CREATE TABLE not_youtube.video_stats (id TIMEUUID, views_count COUNTER, author_id TIMEUUID, PRIMARY KEY((author_id), id)) WITH CLUSTERING ORDER BY (id DESC);

UPDATE not_youtube.video_stats SET views_count = views_count + 1 WHERE id=353f1444-cd22-11ec-9d64-0242ac120002 AND author_id=50554d6e-29bb-11e5-b345-feff819cdc9f;

SELECT * FROM not_youtube.video_stats WHERE id=353f1444-cd22-11ec-9d64-0242ac120002 AND author_id=50554d6e-29bb-11e5-b345-feff819cdc9f;

CREATE TABLE not_youtube.user_playlist (id TIMEUUID, name TEXT, owner_id TIMEUUID, video_ids SET<TIMEUUID>, is_private BOOLEAN, PRIMARY KEY((owner_id), id)) WITH CLUSTERING ORDER BY (id DESC);

INSERT INTO not_youtube.user(id, email, first_name, last_name) VALUES(50554d6e-29bb-11e5-b345-feff819cdc9f, 'pera@gmail.com', 'Pera', 'Peric');
INSERT INTO not_youtube.user(id, email, first_name, last_name) VALUES(9fe81962-cd1d-11ec-9d64-0242ac120002, 'mika@gmail.com', 'Mika', 'Mikic');
INSERT INTO not_youtube.user(id, email, first_name, last_name) VALUES(cc7dee5c-cd1d-11ec-9d64-0242ac120002, 'zika@gmail.com', 'Zika', 'Zikic');
INSERT INTO not_youtube.user(id, email, first_name, last_name) VALUES(d3366742-cd1d-11ec-9d64-0242ac120002, 'mira@gmail.com', 'Mira', 'Miric');
INSERT INTO not_youtube.user(id, email, first_name, last_name) VALUES(dac66e4e-cd1d-11ec-9d64-0242ac120002, 'ana@gmail.com', 'Ana', 'Anic');
INSERT INTO not_youtube.user(id, email, first_name, last_name) VALUES(df9fb72c-cd1d-11ec-9d64-0242ac120002, 'tamara@gmail.com', 'Tamara', 'Tamaric');
INSERT INTO not_youtube.user(id, email, first_name, last_name) VALUES(e458691c-cd1d-11ec-9d64-0242ac120002, 'igor@gmail.com', 'Igor', 'Igic');
INSERT INTO not_youtube.user(id, email, first_name, last_name) VALUES(e95a26da-cd1d-11ec-9d64-0242ac120002, 'vlada@gmail.com', 'Vlado', 'Vladic');

SELECT * FROM not_youtube.user;

INSERT INTO not_youtube.video(id, name, duration, author_id, likes, dislikes) VALUES(353f1444-cd22-11ec-9d64-0242ac120002, 'React tutorial', 600, 50554d6e-29bb-11e5-b345-feff819cdc9f, {dac66e4e-cd1d-11ec-9d64-0242ac120002, df9fb72c-cd1d-11ec-9d64-0242ac120002}, null);
INSERT INTO not_youtube.video(id, name, duration, author_id, likes, dislikes) VALUES(ca1c4a50-cd22-11ec-9d64-0242ac120002, 'Vue tutorial', 800, 50554d6e-29bb-11e5-b345-feff819cdc9f, null, null);
INSERT INTO not_youtube.video(id, name, duration, author_id, likes, dislikes) VALUES(cf57c652-cd22-11ec-9d64-0242ac120002, 'Java tutorial', 660, 50554d6e-29bb-11e5-b345-feff819cdc9f, null, {e458691c-cd1d-11ec-9d64-0242ac120002, df9fb72c-cd1d-11ec-9d64-0242ac120002});
INSERT INTO not_youtube.video(id, name, duration, author_id, likes, dislikes) VALUES(d41cce1c-cd22-11ec-9d64-0242ac120002, 'Docker tutorial', 530, 50554d6e-29bb-11e5-b345-feff819cdc9f, {e458691c-cd1d-11ec-9d64-0242ac120002}, {df9fb72c-cd1d-11ec-9d64-0242ac120002});
INSERT INTO not_youtube.video(id, name, duration, author_id, likes, dislikes) VALUES(d8796394-cd22-11ec-9d64-0242ac120002, 'LOL gameplays', 1000, e95a26da-cd1d-11ec-9d64-0242ac120002, null, null);
INSERT INTO not_youtube.video(id, name, duration, author_id, likes, dislikes) VALUES(dc9fa3de-cd22-11ec-9d64-0242ac120002, 'Witcher 3', 899, e95a26da-cd1d-11ec-9d64-0242ac120002, null, null);

SELECT * FROM not_youtube.video WHERE author_id=50554d6e-29bb-11e5-b345-feff819cdc9f;

INSERT INTO not_youtube.user_playlist(id, name, owner_id, video_ids, is_private) VALUES(dc9fa3de-cd22-11ec-9d64-0242ac121002, 'My learn playlist', e458691c-cd1d-11ec-9d64-0242ac120002, {353f1444-cd22-11ec-9d64-0242ac120002, ca1c4a50-cd22-11ec-9d64-0242ac120002, cf57c652-cd22-11ec-9d64-0242ac120002, d41cce1c-cd22-11ec-9d64-0242ac120002}, false);
INSERT INTO not_youtube.user_playlist(id, name, owner_id, video_ids, is_private) VALUES(dd9fa3de-dd22-11ec-9d64-0242ac121112, 'My games playlist', e458691c-cd1d-11ec-9d64-0242ac120002, {d8796394-cd22-11ec-9d64-0242ac120002, dc9fa3de-cd22-11ec-9d64-0242ac120002}, true);

SELECT * FROM not_youtube.user_playlist WHERE owner_id=e458691c-cd1d-11ec-9d64-0242ac120002;
