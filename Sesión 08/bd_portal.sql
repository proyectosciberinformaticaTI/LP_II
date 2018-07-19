create database portal;

use portal;

create table tb_categoria(
cod_cat      smallint not null auto_increment,
des_cat      varchar(30),
est_cat      char(1),
 primary key (cod_cat)
);


create table tb_producto(
cod_pro      smallint not null auto_increment,
nom_pro      varchar(50),
des_pro      text,
pre_pro      real,
stk_pro      int,
cod_cat      smallint,
est_pro      char(1),
img_pro   varchar(100),
primary key (cod_pro),
foreign key (cod_cat) references tb_categoria(cod_cat)
);

create table tb_comentario(
cod_com      smallint not null auto_increment,
cod_pro      smallint,
dir_com      varchar(30),
pun_com      varchar(30),
des_com      text,
primary key (cod_com),
foreign key (cod_pro) references tb_producto(cod_pro)
);


create table tb_usuario(
cod_usu  smallint not null auto_increment,
log_usu  varchar(15),
pas_usu  varchar(15),
nom_usu  varchar(30),
ape_usu  varchar(50),
eda_usu  smallint,
est_usu  char(1),
primary key(cod_usu)
);



create table tb_cliente(
cod_cli  smallint not null auto_increment,
nom_cli  varchar(30),
ape_cli  varchar(50),
sex_cli  varchar(1),
log_cli  varchar(15),
pas_cli  varchar(15),
primary key(cod_cli)
);


create table tb_pedido(
cod_ped      smallint not null auto_increment,
fec_ped      date,
cod_cli   smallint,
est_ped      char(1),
primary key (cod_ped),
foreign key (cod_cli) references tb_cliente(cod_cli)
);

create table tb_detalle_pedido(
cod_ped    smallint,
cod_pro    smallint,
pre_pro    real,
can_pro    smallint,
primary key (cod_ped,cod_pro),
foreign key (cod_ped) references tb_pedido(cod_ped),
foreign key (cod_pro) references tb_producto(cod_pro) 
);


insert into tb_categoria values (null,'Pulsera','1');
insert into tb_categoria values (null,'Aretes','1');
insert into tb_categoria values (null,'Anillos','1');


insert into tb_producto values (
null,
'Pulsera del lazuli de Lapis, Enigma',
'Showcased en un punto ancho, pulido, tres piedras preciosas irradian misterio azul profundo.  Neeru Goel combina el encanto natural del lazuli de los lapis con plata esterlina.  Las colmenas argent afilan la pulsera en negrilla, trayendo estilo indio tradicional a un diseo encantador.',
320,
20,
1,
'1',
'images/items/b01_1.jpg'
);


insert into tb_producto values (
null,
'Pulsera de Amethyst,Dewdrops lilac',
'Los dewdrops de la piedra preciosa confieren una elegancia cristalina a las flores en esta pulsera hermosa.  Diseos y mano-artes de Beenu el pedazo en plata esterlina con los amethysts chispeantes.  El puno de encaje hace un accesorio mesmerizing para la preparacin con estilo.',
150,
50,
1,
'1',
'images/items/b02_1.jpg'
);


insert into tb_producto values (
null,
'Aretes de la malaquita,fuerza de la vida',
'La malaquita verde implica vida, mientras que la gema seala hacia arriba en un gesto del crecimiento.  Wararat Supasirisuk crea los pendientes del atontamiento de la plata esterlina brillante (0,925).  La malaquita se piensa extensamente para promover la purificacin y sueos curativos as como el dibujo hacia fuera de energa negativa.',
470,
15,
2,
'1',
'images/items/e08_1.jpg'
);


insert into tb_producto values (
null,
'Anillo,libelula de plata ',
'Altsimo en gossamer se va volando, las liblulas anuncian la llegada del verano en los jardines de Balinese.  Rusdiarta forma un par como pendientes.  Suspendido en los alambres esterlinas, las criaturas de plata se parecen bailar.',
640,
35,
2,
'1',
'images/items/e09_1.jpg'
);


insert into tb_comentario values (
null,
1,
'usuario@hotmail.com',
'images/puntuacion/4.gif',
'Esta joya es excelente, la verdad conbina con todo:sonrisa: :sonrisa: '
);

insert into tb_comentario values (
null,
2,
'usuario@hotmail.com',
'images/puntuacion/5.gif',
'Realmente el diseo es grandioso :sonrisa: :sonrisa: :beso: '
);


insert into tb_comentario values (
null,
3,
'usuario@hotmail.com',
'images/puntuacion/1.gif',
'No sirve :confuso: :enfadado: '
);


insert into tb_comentario values (
null,
4,
'usuario@hotmail.com',
'images/puntuacion/5.gif',
'Es excelente :risa: :risa: :risa: '
);

insert into tb_comentario values (
null,
1,
'usuario@hotmail.com',
'images/puntuacion/5.gif',
'Me ayudo Mucho'
);


insert into tb_comentario values (
null,
1,
'usuario@hotmail.com',
'images/puntuacion/2.gif',
'No sirve :enfadado: :enfadado: '
);


insert into tb_comentario values (
null,
2,
'usuario@hotmail.com',
'images/puntuacion/2.gif',
'No sirve :enfadado: :enfadado: '
);


insert into tb_comentario values (
null,
2,
'usuario@hotmail.com',
'images/puntuacion/5.gif',
'Excelente :beso: :beso: :beso: '
);

insert into tb_cliente values (null,'Luis','Alayo Salazar','M','luis1','luis1');
insert into tb_cliente values (null,'Charo','Camargo Salazar','M','aaaa1','bbbb1');
insert into tb_cliente values (null,'Esther','Villar Dezza','M','cccc1','cccc1');
insert into tb_cliente values (null,'Ruby','Canturin Sandoval','F','bbbb1','bbbb1');
insert into tb_cliente values (null,'Alejandro','Turin Urquizo','M','mmmm','mmmm');

insert into tb_pedido values (null,'2006-01-03',2,'P');
insert into tb_pedido values (null,'2006-01-04',1,'P');
insert into tb_pedido values (null,'2006-01-10',1,'P');
insert into tb_pedido values (null,'2006-01-20',1,'P');
insert into tb_pedido values (null,'2006-02-01',1,'P');
insert into tb_pedido values (null,'2006-02-10',2,'P');
insert into tb_pedido values (null,'2006-02-10',2,'P');
insert into tb_pedido values (null,'2006-02-18',2,'P');
insert into tb_pedido values (null,'2006-03-01',2,'P');
insert into tb_pedido values (null,'2006-03-07',1,'P');
insert into tb_pedido values (null,'2006-03-10',1,'P');
insert into tb_pedido values (null,'2006-03-15',1,'P');
insert into tb_pedido values (null,'2006-04-01',2,'P');
insert into tb_pedido values (null,'2006-04-07',2,'P');
insert into tb_pedido values (null,'2006-04-10',1,'P');
insert into tb_pedido values (null,'2006-04-15',1,'P');
insert into tb_pedido values (null,'2006-05-01',1,'P');
insert into tb_pedido values (null,'2006-05-07',2,'P');
insert into tb_pedido values (null,'2006-05-10',1,'P');
insert into tb_pedido values (null,'2006-05-15',1,'P');
insert into tb_pedido values (null,'2006-06-01',2,'P');
insert into tb_pedido values (null,'2006-06-07',2,'P');
insert into tb_pedido values (null,'2006-06-10',1,'P');
insert into tb_pedido values (null,'2006-06-15',1,'P');
insert into tb_pedido values (null,'2006-07-01',1,'P');
insert into tb_pedido values (null,'2006-07-07',2,'P');
insert into tb_pedido values (null,'2006-07-10',2,'P');
insert into tb_pedido values (null,'2006-07-15',1,'P');
insert into tb_pedido values (null,'2006-08-01',1,'P');
insert into tb_pedido values (null,'2006-08-07',1,'P');
insert into tb_pedido values (null,'2006-08-10',2,'P');
insert into tb_pedido values (null,'2006-08-15',2,'P');
insert into tb_pedido values (null,'2006-09-01',1,'P');
insert into tb_pedido values (null,'2006-09-07',1,'P');
insert into tb_pedido values (null,'2006-09-10',3,'P');
insert into tb_pedido values (null,'2006-09-15',3,'P');
insert into tb_pedido values (null,'2006-10-01',1,'P');
insert into tb_pedido values (null,'2006-10-07',3,'P');
insert into tb_pedido values (null,'2006-10-10',3,'P');
insert into tb_pedido values (null,'2006-10-15',1,'P');
insert into tb_pedido values (null,'2006-11-01',1,'P');
insert into tb_pedido values (null,'2006-11-07',3,'P');
insert into tb_pedido values (null,'2006-11-10',1,'P');
insert into tb_pedido values (null,'2006-11-15',3,'P');
insert into tb_pedido values (null,'2006-12-01',1,'P');
insert into tb_pedido values (null,'2006-12-07',3,'P');
insert into tb_pedido values (null,'2006-12-10',2,'P');
insert into tb_pedido values (null,'2006-12-15',2,'P');


insert into tb_detalle_pedido values (1,1,320,3);
insert into tb_detalle_pedido values (1,2,150,2);
insert into tb_detalle_pedido values (1,3,470,1);
insert into tb_detalle_pedido values (1,4,640,1);

insert into tb_detalle_pedido values (2,1,320,2);
insert into tb_detalle_pedido values (2,2,150,2);
insert into tb_detalle_pedido values (2,3,470,1);
insert into tb_detalle_pedido values (2,4,640,1);

insert into tb_detalle_pedido values (3,1,320,3);
insert into tb_detalle_pedido values (3,2,150,3);
insert into tb_detalle_pedido values (3,3,470,2);
insert into tb_detalle_pedido values (3,4,640,1);

insert into tb_detalle_pedido values (4,1,320,2);
insert into tb_detalle_pedido values (4,2,150,1);
insert into tb_detalle_pedido values (4,3,470,2);
insert into tb_detalle_pedido values (4,4,640,1);

insert into tb_detalle_pedido values (5,1,320,2);
insert into tb_detalle_pedido values (5,2,150,3);
insert into tb_detalle_pedido values (5,3,470,3);
insert into tb_detalle_pedido values (5,4,640,1);

insert into tb_detalle_pedido values (6,1,320,1);
insert into tb_detalle_pedido values (6,2,150,2);
insert into tb_detalle_pedido values (6,3,470,2);
insert into tb_detalle_pedido values (6,4,640,1);

insert into tb_detalle_pedido values (7,1,320,3);
insert into tb_detalle_pedido values (7,2,150,3);
insert into tb_detalle_pedido values (7,3,470,3);
insert into tb_detalle_pedido values (7,4,640,2);

insert into tb_detalle_pedido values (8,1,320,1);
insert into tb_detalle_pedido values (8,2,150,2);
insert into tb_detalle_pedido values (8,3,470,1);
insert into tb_detalle_pedido values (8,4,640,2);

insert into tb_detalle_pedido values (9,1,320,1);
insert into tb_detalle_pedido values (9,2,150,3);
insert into tb_detalle_pedido values (9,3,470,3);
insert into tb_detalle_pedido values (9,4,640,1);

insert into tb_detalle_pedido values (10,1,320,2);
insert into tb_detalle_pedido values (10,2,150,3);
insert into tb_detalle_pedido values (10,3,470,1);
insert into tb_detalle_pedido values (10,4,640,2);

insert into tb_detalle_pedido values (11,1,320,1);
insert into tb_detalle_pedido values (11,2,150,2);
insert into tb_detalle_pedido values (11,3,470,3);
insert into tb_detalle_pedido values (11,4,640,3);

insert into tb_detalle_pedido values (12,1,320,1);
insert into tb_detalle_pedido values (12,2,150,2);
insert into tb_detalle_pedido values (12,3,470,1);
insert into tb_detalle_pedido values (12,4,640,3);

insert into tb_detalle_pedido values (13,1,320,1);
insert into tb_detalle_pedido values (13,2,150,2);
insert into tb_detalle_pedido values (13,3,470,1);
insert into tb_detalle_pedido values (13,4,640,3);

insert into tb_detalle_pedido values (14,1,320,1);
insert into tb_detalle_pedido values (14,2,150,2);
insert into tb_detalle_pedido values (14,3,470,1);
insert into tb_detalle_pedido values (14,4,640,3);

insert into tb_detalle_pedido values (15,1,320,2);
insert into tb_detalle_pedido values (15,2,150,1);
insert into tb_detalle_pedido values (15,3,470,2);
insert into tb_detalle_pedido values (15,4,640,1);

insert into tb_detalle_pedido values (16,1,320,3);
insert into tb_detalle_pedido values (16,2,150,3);
insert into tb_detalle_pedido values (16,3,470,1);
insert into tb_detalle_pedido values (16,4,640,2);

insert into tb_detalle_pedido values (17,1,320,1);
insert into tb_detalle_pedido values (17,2,150,1);
insert into tb_detalle_pedido values (17,3,470,3);
insert into tb_detalle_pedido values (17,4,640,1);

insert into tb_detalle_pedido values (18,1,320,2);
insert into tb_detalle_pedido values (18,2,150,1);
insert into tb_detalle_pedido values (18,3,470,1);
insert into tb_detalle_pedido values (18,4,640,3);

insert into tb_detalle_pedido values (19,1,320,2);
insert into tb_detalle_pedido values (19,2,150,1);
insert into tb_detalle_pedido values (19,3,470,3);
insert into tb_detalle_pedido values (19,4,640,1);

insert into tb_detalle_pedido values (20,1,320,2);
insert into tb_detalle_pedido values (20,2,150,3);
insert into tb_detalle_pedido values (20,3,470,1);
insert into tb_detalle_pedido values (20,4,640,1);

insert into tb_detalle_pedido values (21,1,320,3);
insert into tb_detalle_pedido values (21,2,150,1);
insert into tb_detalle_pedido values (21,3,470,2);
insert into tb_detalle_pedido values (21,4,640,3);

insert into tb_detalle_pedido values (22,1,320,1);
insert into tb_detalle_pedido values (22,2,150,1);
insert into tb_detalle_pedido values (22,3,470,3);
insert into tb_detalle_pedido values (22,4,640,2);

insert into tb_detalle_pedido values (23,1,320,1);
insert into tb_detalle_pedido values (23,2,150,3);
insert into tb_detalle_pedido values (23,3,470,1);
insert into tb_detalle_pedido values (23,4,640,3);

insert into tb_detalle_pedido values (24,1,320,2);
insert into tb_detalle_pedido values (24,2,150,1);
insert into tb_detalle_pedido values (24,3,470,3);
insert into tb_detalle_pedido values (24,4,640,1);

insert into tb_detalle_pedido values (25,1,320,2);
insert into tb_detalle_pedido values (25,2,150,3);
insert into tb_detalle_pedido values (25,3,470,1);
insert into tb_detalle_pedido values (25,4,640,1);

insert into tb_detalle_pedido values (26,1,320,2);
insert into tb_detalle_pedido values (26,2,150,3);
insert into tb_detalle_pedido values (26,3,470,1);
insert into tb_detalle_pedido values (26,4,640,1);

insert into tb_detalle_pedido values (27,1,320,3);
insert into tb_detalle_pedido values (27,2,150,2);
insert into tb_detalle_pedido values (27,3,470,1);
insert into tb_detalle_pedido values (27,4,640,3);

insert into tb_detalle_pedido values (28,1,320,1);
insert into tb_detalle_pedido values (28,2,150,2);
insert into tb_detalle_pedido values (28,3,470,3);
insert into tb_detalle_pedido values (28,4,640,1);

insert into tb_detalle_pedido values (29,1,320,1);
insert into tb_detalle_pedido values (29,2,150,3);
insert into tb_detalle_pedido values (29,3,470,2);
insert into tb_detalle_pedido values (29,4,640,1);

insert into tb_detalle_pedido values (30,1,320,3);
insert into tb_detalle_pedido values (30,2,150,3);
insert into tb_detalle_pedido values (30,3,470,1);
insert into tb_detalle_pedido values (30,4,640,2);

insert into tb_detalle_pedido values (31,1,320,3);
insert into tb_detalle_pedido values (31,2,150,3);
insert into tb_detalle_pedido values (31,3,470,1);
insert into tb_detalle_pedido values (31,4,640,1);

insert into tb_detalle_pedido values (32,1,320,2);
insert into tb_detalle_pedido values (32,2,150,1);
insert into tb_detalle_pedido values (32,3,470,3);
insert into tb_detalle_pedido values (32,4,640,3);

insert into tb_detalle_pedido values (33,1,320,1);
insert into tb_detalle_pedido values (33,2,150,2);
insert into tb_detalle_pedido values (33,3,470,3);
insert into tb_detalle_pedido values (33,4,640,3);

insert into tb_detalle_pedido values (34,1,320,1);
insert into tb_detalle_pedido values (34,2,150,3);
insert into tb_detalle_pedido values (34,3,470,1);
insert into tb_detalle_pedido values (34,4,640,3);

insert into tb_detalle_pedido values (35,1,320,2);
insert into tb_detalle_pedido values (35,2,150,1);
insert into tb_detalle_pedido values (35,3,470,3);
insert into tb_detalle_pedido values (35,4,640,2);

insert into tb_detalle_pedido values (36,1,320,2);
insert into tb_detalle_pedido values (36,2,150,3);
insert into tb_detalle_pedido values (36,3,470,1);
insert into tb_detalle_pedido values (36,4,640,1);

insert into tb_detalle_pedido values (37,1,320,3);
insert into tb_detalle_pedido values (37,2,150,2);
insert into tb_detalle_pedido values (37,3,470,1);
insert into tb_detalle_pedido values (37,4,640,3);

insert into tb_detalle_pedido values (38,1,320,2);
insert into tb_detalle_pedido values (38,2,150,1);
insert into tb_detalle_pedido values (38,3,470,3);
insert into tb_detalle_pedido values (38,4,640,3);

insert into tb_detalle_pedido values (39,1,320,2);
insert into tb_detalle_pedido values (39,2,150,1);
insert into tb_detalle_pedido values (39,3,470,3);
insert into tb_detalle_pedido values (39,4,640,2);

insert into tb_detalle_pedido values (40,1,320,3);
insert into tb_detalle_pedido values (40,2,150,1);
insert into tb_detalle_pedido values (40,3,470,3);
insert into tb_detalle_pedido values (40,4,640,2);

insert into tb_detalle_pedido values (41,1,320,1);
insert into tb_detalle_pedido values (41,2,150,3);
insert into tb_detalle_pedido values (41,3,470,1);
insert into tb_detalle_pedido values (41,4,640,3);

insert into tb_detalle_pedido values (42,1,320,2);
insert into tb_detalle_pedido values (42,2,150,1);
insert into tb_detalle_pedido values (42,3,470,3);
insert into tb_detalle_pedido values (42,4,640,2);

insert into tb_detalle_pedido values (43,1,320,3);
insert into tb_detalle_pedido values (43,2,150,1);
insert into tb_detalle_pedido values (43,3,470,2);
insert into tb_detalle_pedido values (43,4,640,1);

insert into tb_detalle_pedido values (44,1,320,3);
insert into tb_detalle_pedido values (44,2,150,1);
insert into tb_detalle_pedido values (44,3,470,2);
insert into tb_detalle_pedido values (44,4,640,1);

insert into tb_detalle_pedido values (45,1,320,3);
insert into tb_detalle_pedido values (45,2,150,1);
insert into tb_detalle_pedido values (45,3,470,2);
insert into tb_detalle_pedido values (45,4,640,3);

insert into tb_detalle_pedido values (46,1,320,1);
insert into tb_detalle_pedido values (46,2,150,2);
insert into tb_detalle_pedido values (46,3,470,3);
insert into tb_detalle_pedido values (46,4,640,1);

insert into tb_detalle_pedido values (47,1,320,3);
insert into tb_detalle_pedido values (47,2,150,1);
insert into tb_detalle_pedido values (47,3,470,3);
insert into tb_detalle_pedido values (47,4,640,2);

insert into tb_detalle_pedido values (48,1,320,1);
insert into tb_detalle_pedido values (48,2,150,3);
insert into tb_detalle_pedido values (48,3,470,2);
insert into tb_detalle_pedido values (48,4,640,3);

insert into tb_usuario values (null,'pepe','pepe','Juan','Perez',30,1);
insert into tb_usuario values (null,'maria','maria','Maria','Fernandez',28,1);
insert into tb_usuario values (null,'sonia','sonia','Sonia','Fabiola',35,1);
insert into tb_usuario values (null,'pedro','pedro','Pedro','Ayala',40,1);

create table tb_menu(
cod_men  smallint not null auto_increment,
des_men  varchar(30),
url_men  varchar(400),
primary key(cod_men)
);


create table tb_acceso(
cod_men      smallint,
cod_usu      smallint,
primary key (cod_men,cod_usu),
foreign key (cod_men) references tb_menu(cod_men),
foreign key (cod_usu) references tb_usuario(cod_usu)
);


insert into tb_menu values (null,'Producto','intranetProducto.jsp');
insert into tb_menu values (null,'Categoria','intranetCategoria.jsp');
insert into tb_menu values (null,'Usuario','intranetUsuario.jsp');
insert into tb_menu values (null,'Pedido','intranetPedido.jsp');



insert into tb_acceso values (1,1);
insert into tb_acceso values (1,2);
insert into tb_acceso values (2,1);
insert into tb_acceso values (2,2);
insert into tb_acceso values (2,3);
insert into tb_acceso values (2,4);
insert into tb_acceso values (3,1);
insert into tb_acceso values (3,2);
insert into tb_acceso values (4,1);
insert into tb_acceso values (4,2);
insert into tb_acceso values (4,3);
insert into tb_acceso values (4,4);