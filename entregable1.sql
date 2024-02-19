--- base de datos para gestion de un blog ---

create table users (
	id serial primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	email varchar(50) not null
);

insert into users (first_name, last_name, email) values 
	('Carla','Alexandra','carla@mail.com'),
	('Veronica','Perez','veronica@mail.com'),
	('Elis','Mendez','elis@mail.com');

create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(200) not null,
	text text
);

insert into posts (creator_id, title, text) values 
	('2','primer post','qui dolorem ipsum, quia dolor sit amet consectetur adipisci velit'),
	('4','segundo post','but occasionally circumstances occur in which toil and pain can'),
	('4','tercer post','labore et dolore magnam aliquam quaerat voluptatem'),
	('3','cuarto post','sed quia non numquam eius modi tempora incidunt, ut'),
	('2','quinto post','Nor again is there anyone who loves or pursues or desires to obtain pain');

create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);

insert into likes (user_id, post_id) values 
	('2','2'),
	('3','2'),
	('4','2'),
	('2','3'),
	('3','1'),
	('4','4'),
	('2','5');

-- consulta de todos los post con los datos de los creadores 

select posts.title, users.id, users.first_name, users.last_name, users.email from posts inner join users
on posts.creator_id = users.id;


-- consulta de todos los post con los likes que dieron 

select posts.title, users.first_name, users.last_name, users.email from posts inner join likes
on posts.id = likes.post_id inner join users
on users.id = likes.user_id;

