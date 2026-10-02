BEGIN TRANSACTION;
CREATE TABLE historial (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                ejercicio TEXT NOT NULL,
                entrada TEXT NOT NULL,
                resultado TEXT NOT NULL,
                fecha TEXT NOT NULL
            );
INSERT INTO "historial" VALUES(1,'Par o impar','9','9 es impar.','2026-09-30 14:38:13');
INSERT INTO "historial" VALUES(2,'Tabla de multiplicar','-6','-6 x 1 = -6; -6 x 2 = -12; -6 x 3 = -18; -6 x 4 = -24; -6 x 5 = -30; -6 x 6 = -36; -6 x 7 = -42; -6 x 8 = -48; -6 x 9 = -54; -6 x 10 = -60','2026-09-30 14:38:27');
INSERT INTO "historial" VALUES(3,'Adivina el número','5','El número secreto es mayor.','2026-09-30 14:38:42');
INSERT INTO "historial" VALUES(4,'Adivina el número','9','El número secreto es mayor.','2026-09-30 14:38:58');
INSERT INTO "historial" VALUES(5,'Tabla de multiplicar','67','67 x 1 = 67; 67 x 2 = 134; 67 x 3 = 201; 67 x 4 = 268; 67 x 5 = 335; 67 x 6 = 402; 67 x 7 = 469; 67 x 8 = 536; 67 x 9 = 603; 67 x 10 = 670','2026-09-30 14:40:34');
INSERT INTO "historial" VALUES(6,'Par o impar','89','89 es impar.','2026-09-30 17:11:22');
INSERT INTO "historial" VALUES(7,'Tabla de multiplicar','7','7 x 1 = 7; 7 x 2 = 14; 7 x 3 = 21; 7 x 4 = 28; 7 x 5 = 35; 7 x 6 = 42; 7 x 7 = 49; 7 x 8 = 56; 7 x 9 = 63; 7 x 10 = 70','2026-09-30 17:11:40');
INSERT INTO "historial" VALUES(8,'Adivina el número','3','El número secreto es mayor.','2026-09-30 17:11:51');
INSERT INTO "historial" VALUES(9,'Adivina el número','67','El número secreto es menor.','2026-09-30 17:12:07');
INSERT INTO "historial" VALUES(10,'Adivina el número','50','El número secreto es menor.','2026-09-30 17:12:14');
INSERT INTO "historial" VALUES(11,'Adivina el número','40','El número secreto es mayor.','2026-09-30 17:12:19');
INSERT INTO "historial" VALUES(12,'Adivina el número','45','El número secreto es menor.','2026-09-30 17:12:25');
INSERT INTO "historial" VALUES(13,'Adivina el número','43','El número secreto es menor.','2026-09-30 17:12:31');
INSERT INTO "historial" VALUES(14,'Adivina el número','42','¡Adivinaste! Lo lograste en 9 intentos. Se eligió un nuevo número.','2026-09-30 17:12:37');
INSERT INTO "historial" VALUES(15,'Adivina el número','50','El número secreto es menor.','2026-09-30 17:13:04');
INSERT INTO "historial" VALUES(16,'Adivina el número','40','El número secreto es menor.','2026-09-30 17:13:09');
INSERT INTO "historial" VALUES(17,'Adivina el número','30','El número secreto es menor.','2026-09-30 17:13:13');
INSERT INTO "historial" VALUES(18,'Adivina el número','20','El número secreto es menor.','2026-09-30 17:13:19');
INSERT INTO "historial" VALUES(19,'Adivina el número','10','El número secreto es menor.','2026-09-30 17:13:23');
INSERT INTO "historial" VALUES(20,'Adivina el número','5','El número secreto es mayor.','2026-09-30 17:13:28');
INSERT INTO "historial" VALUES(21,'Adivina el número','6','El número secreto es mayor.','2026-09-30 17:13:33');
INSERT INTO "historial" VALUES(22,'Adivina el número','7','¡Adivinaste! Lo lograste en 8 intentos. Se eligió un nuevo número.','2026-09-30 17:13:36');
INSERT INTO "historial" VALUES(23,'Adivina el número','50','El número secreto es menor.','2026-09-30 17:13:46');
INSERT INTO "historial" VALUES(24,'Adivina el número','30','El número secreto es menor.','2026-09-30 17:13:52');
INSERT INTO "historial" VALUES(25,'Adivina el número','20','El número secreto es menor.','2026-09-30 17:14:00');
INSERT INTO "historial" VALUES(26,'Adivina el número','10','El número secreto es mayor.','2026-09-30 17:14:05');
INSERT INTO "historial" VALUES(27,'Adivina el número','15','El número secreto es mayor.','2026-09-30 17:14:10');
INSERT INTO "historial" VALUES(28,'Adivina el número','17','¡Adivinaste! Lo lograste en 6 intentos. Se eligió un nuevo número.','2026-09-30 17:14:19');
INSERT INTO "historial" VALUES(29,'Adivina el número','67','El número secreto es mayor.','2026-09-30 17:18:21');
INSERT INTO "historial" VALUES(30,'Adivina el número','77','El número secreto es mayor.','2026-09-30 17:18:29');
INSERT INTO "historial" VALUES(31,'Adivina el número','100','El número secreto es menor.','2026-09-30 17:18:35');
INSERT INTO "historial" VALUES(32,'Adivina el número','80','El número secreto es mayor.','2026-09-30 17:18:39');
INSERT INTO "historial" VALUES(33,'Adivina el número','90','El número secreto es mayor.','2026-09-30 17:18:54');
INSERT INTO "historial" VALUES(34,'Adivina el número','95','El número secreto es menor.','2026-09-30 17:18:59');
INSERT INTO "historial" VALUES(35,'Adivina el número','93','El número secreto es menor.','2026-09-30 17:19:06');
INSERT INTO "historial" VALUES(36,'Adivina el número','91','¡Adivinaste! Lo lograste en 8 intentos. Se eligió un nuevo número.','2026-09-30 17:19:10');
DELETE FROM "sqlite_sequence";
INSERT INTO "sqlite_sequence" VALUES('historial',36);
COMMIT;
