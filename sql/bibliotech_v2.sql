-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-10-2024 a las 02:37:00
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `bibliotech_v2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `CategoriaID` int(11) NOT NULL,
  `NombreCategoria` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`CategoriaID`, `NombreCategoria`) VALUES
(1, 'Ficción'),
(2, 'No Ficción'),
(3, 'Ciencia'),
(4, 'Historia'),
(5, 'Romántico'),
(6, 'Thriller'),
(7, 'Fantástico'),
(8, 'Biografía'),
(9, 'Tecnología'),
(10, 'Cultura'),
(11, 'Misterio'),
(12, 'Aventura'),
(13, 'Infantil'),
(14, 'Juvenil'),
(15, 'Clásico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `ComentarioID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `LibroID` int(11) NOT NULL,
  `Comentario` text NOT NULL,
  `FechaComentario` datetime DEFAULT current_timestamp(),
  `Editado` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`ComentarioID`, `UsuarioID`, `LibroID`, `Comentario`, `FechaComentario`, `Editado`) VALUES
(1, 3, 4, 'hola', '2024-08-24 15:26:51', 0),
(2, 3, 4, 'elpepe', '2024-08-24 16:36:19', 0),
(3, 3, 4, 'muy buen libro, me gusto mucho', '2024-08-24 18:18:43', 0),
(4, 3, 4, 'el pepe', '2024-08-24 18:27:20', 0),
(5, 3, 4, 'hola\r\n', '2024-08-24 18:28:06', 0),
(6, 3, 4, 'sddfsfsdfsd', '2024-08-24 18:54:39', 0),
(9, 3, 4, 'daskjasdasd', '2024-08-24 18:56:14', 0),
(15, 3, 12, 'muy bueno', '2024-08-24 22:20:36', 0),
(27, 3, 1, 'muy bueno me gusto', '2024-08-25 16:48:48', 0),
(30, 3, 2, 'como que ahora ponen si editaron los comentarios', '2024-08-27 12:03:34', 1),
(31, 3, 3, 'jajaja', '2024-08-27 12:49:11', 1),
(35, 3, 3, 'elpepe', '2024-08-29 19:06:02', 0),
(36, 3, 4, 'el pepe', '2024-08-29 19:48:37', 0),
(37, 3, 4, 'dsadas', '2024-08-29 19:49:31', 0),
(38, 3, 4, 'dsadas', '2024-08-29 19:51:42', 0),
(39, 3, 4, 'fddsffsd', '2024-08-29 19:53:32', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favoritos`
--

CREATE TABLE `favoritos` (
  `FavoritoID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `LibroID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `favoritos`
--

INSERT INTO `favoritos` (`FavoritoID`, `UsuarioID`, `LibroID`) VALUES
(1, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gustados`
--

CREATE TABLE `gustados` (
  `GustadoID` int(11) NOT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `LibroID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `gustados`
--

INSERT INTO `gustados` (`GustadoID`, `UsuarioID`, `LibroID`) VALUES
(17, 3, 1),
(19, 3, 165),
(39, 3, 166),
(42, 10, 167),
(43, 11, 166);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `HistorialID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `LibroID` int(11) NOT NULL,
  `FechaAccion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial`
--

INSERT INTO `historial` (`HistorialID`, `UsuarioID`, `LibroID`, `FechaAccion`) VALUES
(29, 3, 4, '2024-08-29 22:19:35'),
(30, 3, 1, '2024-08-29 22:19:44'),
(31, 3, 2, '2024-09-20 11:14:14'),
(32, 3, 3, '2024-09-20 11:23:08'),
(51, 3, 15, '2024-10-21 19:06:29'),
(53, 3, 186, '2024-10-26 19:26:57'),
(54, 3, 176, '2024-10-26 19:27:40'),
(55, 3, 188, '2024-10-27 22:06:02'),
(56, 3, 187, '2024-10-27 22:06:02'),
(57, 3, 185, '2024-10-27 22:06:04'),
(58, 3, 184, '2024-10-27 22:06:05'),
(59, 3, 183, '2024-10-27 22:06:06'),
(60, 3, 182, '2024-10-27 22:06:07'),
(61, 3, 180, '2024-10-27 22:06:08'),
(62, 3, 179, '2024-10-27 22:06:09'),
(63, 3, 178, '2024-10-27 22:06:10'),
(64, 3, 177, '2024-10-27 22:06:10'),
(65, 3, 175, '2024-10-27 22:06:12'),
(66, 3, 174, '2024-10-27 22:06:13'),
(67, 3, 173, '2024-10-27 22:06:13'),
(69, 3, 12, '2024-10-27 22:06:16'),
(70, 3, 11, '2024-10-27 22:06:17'),
(71, 3, 10, '2024-10-27 22:06:17'),
(73, 3, 7, '2024-10-27 22:06:20'),
(74, 3, 6, '2024-10-27 22:06:20'),
(75, 3, 5, '2024-10-27 22:06:21'),
(77, 3, 9, '2024-10-27 22:22:04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `LibroID` int(11) NOT NULL,
  `Titulo` varchar(255) DEFAULT NULL,
  `Autor` varchar(255) DEFAULT NULL,
  `ISBN` varchar(30) DEFAULT NULL,
  `FechaLanzamiento` date DEFAULT current_timestamp(),
  `FechaPublicacion` datetime NOT NULL DEFAULT current_timestamp(),
  `CantidadPaginas` int(11) DEFAULT NULL,
  `Editorial` varchar(255) DEFAULT NULL,
  `Sinopsis` text DEFAULT NULL,
  `imagen` varchar(10000) DEFAULT NULL,
  `pdf_link` varchar(255) DEFAULT NULL,
  `Idioma` varchar(50) DEFAULT NULL,
  `Estado` enum('Disponible','Prestado','Reservado') DEFAULT NULL,
  `Visitas` int(11) NOT NULL DEFAULT 0,
  `Gustados` int(11) NOT NULL DEFAULT 0,
  `Original` tinyint(1) NOT NULL DEFAULT 0,
  `Tipo` enum('manga','manwha','manhua','novela') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`LibroID`, `Titulo`, `Autor`, `ISBN`, `FechaLanzamiento`, `FechaPublicacion`, `CantidadPaginas`, `Editorial`, `Sinopsis`, `imagen`, `pdf_link`, `Idioma`, `Estado`, `Visitas`, `Gustados`, `Original`, `Tipo`) VALUES
(1, 'El Gran Gatsby', 'F. Scott Fitzgerald', '9780743273565', '0000-00-00', '2024-09-25 20:45:26', 128, 'Scribner', 'Un retrato de la era del jazz en los Estados Unidos', 'https://www.anagrama-ed.es/uploads/media/portadas/0001/15/b2834bc4ea71357c8b549dfccdd16d611c6586ea.jpeg', 'https://web.seducoahuila.gob.mx/biblioweb/upload/el_gran_gatsby.pdf', 'Español', 'Disponible', 113, 50, 0, 'novela'),
(2, 'Cien Años de Soledad', 'Gabriel García Márquez', '9780060883287', '0000-00-00', '2024-09-25 20:45:26', 173, 'Harper & Row', 'La historia de la familia Buendía en el pueblo ficticio de Macondo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSUgsUCPHp3SOTsijY_tNLp8zOiGxJCUZ0yEA&s', 'https://www.secst.cl/upfiles/documentos/19072016_1207am_578dc39115fe9.pdf', 'Español', 'Disponible', 207, 120, 0, 'novela'),
(3, 'El Código Da Vinci ', 'Dan Brown', '9780307474278', '0000-00-00', '2024-09-25 20:45:26', 425, '	Doubleday Transworld Publishers Bantam Books Qanun', 'Un thriller sobre la búsqueda del Santo Grial ', '/uploads/27aa681e-7d38-4631-ba77-4f55b9b37647.webp', 'https://usercontent.one/wp/www.puro-geek.com/wp-content/uploads/2021/11/El-codigo-Da-Vinci-Dan-Brown.pdf?media=1630018077', 'Español', 'Disponible', 160, 80, 0, 'novela'),
(4, 'Orgullo y Prejuicio', 'Jane Austen', '9780141439518', '0000-00-00', '2024-09-25 20:45:26', 260, 'T. Egerton', 'Una novela sobre el amor y las relaciones en la Inglaterra del siglo XIX', 'https://images.cdn3.buscalibre.com/fit-in/360x360/46/6b/466b0b47e932561b186c56358acbe55e.jpg', 'https://web.seducoahuila.gob.mx/biblioweb/upload/orgullo_y_prejuicio.pdf', 'Español', 'Disponible', 194, 60, 0, 'novela'),
(5, '1984', 'George Orwell', '9780451524935', '0000-00-00', '2024-09-25 20:45:26', 394, 'Secker & Warburg', 'Una novela distópica sobre un régimen totalitario', 'https://images.cdn1.buscalibre.com/fit-in/360x360/b0/39/b039af065268818b7bd3b0e016f8db65.jpg', 'https://rauterberg.employee.id.tue.nl/lecturenotes/DDM110%20CAS/Orwell-1949%201984.pdf', 'Inglés', 'Disponible', 260, 100, 0, NULL),
(6, 'La Sombra del Viento', 'Carlos Ruiz Zafón', '9788408093498', '0000-00-00', '2024-09-25 20:45:26', 288, 'Planeta', 'Un joven descubre un libro misterioso en la Barcelona de la posguerra', 'https://www.planetadelibros.com.ar/usuaris/libros/fotos/48/m_libros/47856_portada___201609051317.jpg', 'https://cel.edu.py/v2/wp-content/uploads/2020/10/Ruiz-Zafon-Carlos-La-Sombra-Del-Viento_54Y.pdf', 'Español', 'Disponible', 134, 90, 0, NULL),
(7, 'Harry Potter y la Piedra Filosofal', 'J.K. Rowling', '9780747532699', '0000-00-00', '2024-09-25 20:45:26', 178, 'Bloomsbury', 'El primer libro de la famosa serie sobre el joven mago', 'https://images.cdn3.buscalibre.com/fit-in/360x360/ce/e6/cee6ef96dad70d3f599b953f0e50afc7.jpg', 'https://fecolsa.com.co/upload/Actividades%20Equilibrio%20Total/Rowling,%20J.%20K.%20-%20%20Harry%20Potter%20y%20la%20piedra%20filosofal.pdf', 'Español', 'Disponible', 304, 150, 0, NULL),
(9, 'Matar a un Ruiseñor', 'Harper Lee', '9780061120084', '0000-00-00', '2024-09-25 20:45:26', 257, 'J.B. Lippincott & Co.', 'Una novela sobre la injusticia racial en el sur de los Estados Unidos', 'https://images.cdn3.buscalibre.com/fit-in/360x360/1b/d7/1bd7b432c94ccdcf816c917d8abe8e83.jpg', 'https://giove.isti.cnr.it/demo/eread/libri/angry/mockingbird.pdf', 'Inglés', 'Disponible', 213, 80, 0, NULL),
(10, 'El Señor de los Anillos', 'J.R.R. Tolkien', '9780261103573', '0000-00-00', '2024-09-25 20:45:26', 183, 'Allen & Unwin', 'Una épica aventura en un mundo de fantasía', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIr1UuugXCIim35lyIBMaHQXLXtZqUQnnxDg&s', 'https://web.seducoahuila.gob.mx/biblioweb/upload/J.R.R.%20Tolkien%20La%20Comunidad%20del%20anillo%20I.pdf', 'Español', 'Disponible', 184, 110, 0, NULL),
(11, 'Don Quijote de la Mancha', 'Miguel de Cervantes', '9788420463306', '0000-00-00', '2024-09-25 20:45:26', 225, 'Francisco de Robles', 'La famosa novela sobre un caballero loco y su fiel escudero', 'https://images.cdn1.buscalibre.com/fit-in/360x360/a6/18/a618be10eae5c2a608ec6e22e6917e29.jpg', 'https://cvc.cervantes.es/literatura/lee/coleccion/pdf/quijote.pdf', 'Español', 'Disponible', 193, 95, 0, NULL),
(12, 'El Alquimista', 'Paulo Coelho', '9780061122415', '0000-00-00', '2024-09-25 20:45:26', 118, 'Rocco', 'La historia de un joven pastor que busca su leyenda personal', 'https://www.planetadelibros.com/usuaris/libros/fotos/201/original/portada_el-alquimista_paulo-coelho_201612191218.jpg', 'https://mep.janium.net/janium/Documentos/286143.pdf', 'Portugués', 'Disponible', 143, 65, 0, NULL),
(15, 'La Casa de los Espíritus', 'Isabel Allende', '9781501116960', '0000-00-00', '2024-09-25 20:45:26', 331, 'Plaza & Janés', 'Una novela épica sobre la vida de una familia chilena', 'https://cdn.zendalibros.com/wp-content/uploads/2022/10/eal43438_la-casa-de-los-espiritus-scaled.jpg', 'https://www.suneo.mx/literatura/subidas/Isabel%20Allende%20La%20Casa%20de%20los%20Esp%C3%ADritus.pdf', 'Español', 'Disponible', 202, 90, 0, NULL),
(173, 'El Amor en los Tiempos del Cólera', 'Gabriel García Márquez', '9780307389732', '1985-09-05', '2024-10-21 19:01:03', 188, 'Penguin Books', 'Una historia de amor que trasciende el tiempo', 'https://images.cdn1.buscalibre.com/fit-in/360x360/b0/3e/b03e98118b9e2cf5b94bb0548bfa59c5.jpg', 'https://web.seducoahuila.gob.mx/biblioweb/upload/Garc%C3%ADa%20Gabriel%20-%20El%20amor%20en.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(174, 'Rayuela', 'Julio Cortázar', '9780140264753', '1963-06-28', '2024-10-21 19:01:03', 457, 'Pantheon Books', 'Una novela que desafía las convenciones de la narrativa tradicional', 'https://acdn.mitiendanube.com/stores/001/029/689/products/rayuela1-70d4301f60dc01384c16171187155984-640-0.png', 'https://web.seducoahuila.gob.mx/biblioweb/upload/Cortazar,%20Julio%20-%20Rayuela.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(175, 'Pedro Páramo', 'Juan Rulfo', '9788420469285', '1955-03-27', '2024-10-21 19:01:03', 115, 'Fondo de Cultura Económica', 'Una obra maestra de la literatura mexicana sobre la búsqueda de un padre', 'https://images.cdn3.buscalibre.com/fit-in/520x520/4b/7e/4b7ee861b9f473b4dcd55bbea2893916.jpg', 'https://web.seducoahuila.gob.mx/biblioweb/upload/Juan%20Rulfo%20-%20Pedro%20P%C3%A1ramo.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(176, 'La Ciudad y los Perros', 'Mario Vargas Llosa', '9788420471837', '1963-07-10', '2024-10-21 19:01:03', 153, 'Seix Barral', 'Un retrato de la vida en una academia militar peruana', 'https://www.rae.es/sites/default/files/la_ciudad_y_los_perros.jpg', 'https://www.guao.org/sites/default/files/biblioteca/La%20ciudad%20y%20los%20perros%20Vargas%20LLosa.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(177, 'El Tunel', 'Ernesto Sabato', '9788432231164', '0000-00-00', '2024-10-21 19:01:03', 95, 'Editorial Planeta', 'Una exploración psicológica de la obsesión y el crimen', 'https://cdn11.bigcommerce.com/s-3stx4pub31/images/stencil/1280x1280/products/4834/12907/el-tunel-ernesto-sabato-booket-book__41392.1637347969.jpg?c=2', 'https://www.ues.mx/movilidad/Docs/MovilidadAcademica/Libro_El_Tunel.pdf', 'Español', 'Disponible', 3, 0, 0, 'novela'),
(178, 'Ficciones', 'Jorge Luis Borges', '9788420415275', '1944-01-01', '2024-10-21 19:01:03', 86, 'Editorial Sur', 'Una colección de cuentos que exploran temas de filosofía y metafísica', 'https://images.cdn3.buscalibre.com/fit-in/360x360/46/85/4685286dbc1ec2013245afe1d537acfb.jpg', 'https://ddooss.org/libros/Jorge_Luis_Borges_ficciones.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(179, 'Los Detectives Salvajes', 'Roberto Bolaño', '9788433966799', '1998-11-25', '2024-10-21 19:01:03', 561, 'Anagrama', 'Una novela sobre un grupo de poetas en busca del realismo visceral', 'https://www.clarin.com/2023/11/20/tfPa2tgSo_720x0__1.jpg', 'https://www.derechopenalenlared.com/libros/los-detectives-salvajes-roberto-bolano.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(180, '2666', 'Roberto Bolaño', '9788433967314', '2004-10-22', '2024-10-21 19:01:03', 576, 'Anagrama', 'Una novela épica que explora el mal en el mundo moderno', 'https://www.anagrama-ed.es/uploads/media/portadas/0001/19/286f5f73995431acccf11d83cabbaadda7ae638b.jpeg', 'https://biblioteca.choapa.cl/Libros/roberto%202666.pdf', 'Español', 'Disponible', 3, 0, 0, 'novela'),
(182, 'El Aleph', 'Jorge Luis Borges', '9788420423225', '1949-01-01', '2024-10-21 19:01:03', 18, 'Editorial Sur', 'Una colección de cuentos que exploran la infinitud y el tiempo', 'https://luisbermer.com/wp-content/uploads/2017/07/El-Aleph-de-Jorge-Luis-Borges.jpg', 'https://www.ucm.es/data/cont/docs/119-2014-02-11-Borges.El%20Aleph76.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(183, 'La Tregua', 'Mario Benedetti', '9788420408741', '1960-01-01', '2024-10-21 19:01:03', 157, 'Editorial Sudamericana', 'Una novela epistolar sobre la vida de un oficinista en Montevideo', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhkmVlZIsXmWx3oZaL7HmOj-eDNEPMtXTxeFK82iv8rTHSi0YcVjDVGVI82MxauCkVV6c8YULvainu7HykKpiRTswaqv3NYq6Kt78XJ-tIfq6tnXzGAszvVnloaMdM2anoIgVTfZrB38_Vo/w1200-h630-p-k-no-nu/portada-tregua_grande.jpg', 'https://www.tomasdeaquino.cl/upfiles/documentos/04012018_516am_5a4e1b36bb7f6.pdf', 'Español', 'Disponible', 3, 0, 0, 'novela'),
(184, 'Cuentos de la Selva', 'Horacio Quiroga', '9788497611081', '1918-01-01', '2024-10-21 19:01:03', 24, 'Editorial Losada', 'Una colección de cuentos sobre la vida en la selva', 'https://laestacioneditora.com/wp-content/uploads/2019/02/L107-CtosSelv_Tapa.jpg', 'https://web.seducoahuila.gob.mx/biblioweb/upload/Quiroga%20Horacio%20-%20Cuentos%20de%20la%20selva.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(185, 'El Llano en Llamas', 'Juan Rulfo', '9788420469285', '1953-01-01', '2024-10-21 19:01:03', 80, 'Fondo de Cultura Económica', 'Una colección de cuentos sobre la vida rural en México', 'https://www.anagrama-ed.es/uploads/media/portadas/0001/20/d6bc016cd5e245ee7a3175ab91acae14f8321368.jpeg', 'https://ens9004-infd.mendoza.edu.ar/sitio/literatura-latinoamericana/upload/Juan_Rulfo._Llano_en_llamas..pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(186, 'Crónica de una Muerte Anunciada', 'Gabriel García Márquez', '9780307388940', '1981-04-12', '2024-10-21 19:01:03', 62, 'Vintage Books', 'Una historia sobre el asesinato de Santiago Nasar', 'https://images.cdn2.buscalibre.com/fit-in/360x360/13/97/1397a4f28df5ed21f99177884f3276bd.jpg', 'https://unisinucartagena.edu.co/wp-content/uploads/2020/07/Cronica_de_una_Muerte_Anunciada-Gabriel_Garcia_Marquez.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela'),
(187, 'La Fiesta del Chivo', 'Mario Vargas Llosa', '9788408103527', '2000-04-04', '2024-10-21 19:01:03', 396, 'Alfaguara', 'Una novela sobre la dictadura de Trujillo en la República Dominicana', 'https://images.cdn2.buscalibre.com/fit-in/360x360/eb/f3/ebf312ad01be9e04367852a8203a83f3.jpg', 'https://web.seducoahuila.gob.mx/biblioweb/upload/Mario%20Vargas%20Llosa%20-%20La%20fiesta%20del%20chivo.pdf', 'Español', 'Disponible', 3, 0, 0, 'novela'),
(188, 'La Casa de Bernarda Alba', 'Federico García Lorca', '9788437622677', '1936-06-19', '2024-10-21 19:01:03', 51, 'Cátedra', 'Un drama sobre la represión y la pasión en una familia española', 'https://images.cdn1.buscalibre.com/fit-in/360x360/97/6b/976b3f7fd974b9b56b26e0ca70c000cf.jpg', 'https://biblioteca.org.ar/libros/157286.pdf', 'Español', 'Disponible', 2, 0, 0, 'novela');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros_categorias`
--

CREATE TABLE `libros_categorias` (
  `LibroID` int(11) NOT NULL,
  `CategoriaID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros_categorias`
--

INSERT INTO `libros_categorias` (`LibroID`, `CategoriaID`) VALUES
(1, 5),
(1, 15),
(2, 4),
(2, 15),
(3, 6),
(3, 11),
(4, 5),
(4, 15),
(5, 6),
(5, 11),
(6, 4),
(6, 7),
(7, 7),
(7, 9),
(9, 5),
(9, 12),
(10, 7),
(10, 12),
(11, 13),
(11, 15),
(12, 7),
(12, 14),
(15, 4),
(15, 14),
(173, 1),
(173, 5),
(174, 2),
(174, 4),
(175, 4),
(175, 5),
(176, 3),
(176, 4),
(177, 1),
(177, 4),
(178, 1),
(178, 4),
(179, 1),
(179, 4),
(180, 1),
(180, 4),
(182, 1),
(182, 4),
(183, 2),
(183, 4),
(184, 1),
(184, 4),
(185, 1),
(185, 4),
(186, 1),
(186, 5),
(187, 1),
(187, 4),
(188, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `RollID` int(11) NOT NULL,
  `NombreRol` enum('propietario','admin','mod','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`RollID`, `NombreRol`) VALUES
(1, 'user'),
(2, 'mod'),
(3, 'admin'),
(4, 'propietario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `UsuarioID` int(11) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `CorreoElectronico` varchar(255) NOT NULL,
  `Imagen` varchar(255) NOT NULL DEFAULT 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
  `Contrasenia` varchar(255) NOT NULL,
  `RollID` int(11) NOT NULL DEFAULT 1,
  `Autor` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`UsuarioID`, `Nombre`, `CorreoElectronico`, `Imagen`, `Contrasenia`, `RollID`, `Autor`) VALUES
(1, 'dsaasd', 'ow@gmail.com', '	https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png	', '123', 1, 0),
(3, 'admin', 'oww@gmail.com', 'https://i.pinimg.com/736x/0a/d7/e4/0ad7e46b6c54a02a4a9e05563b35bf77.jpg', '$2b$10$ha2A16xWuw0zleP0e2T6qet5jQ85zgSEBNZtIvGywAv9V436JBFE6', 3, 0),
(4, 'exaedro', 'elpepe@gmail.com', 'https://pbs.twimg.com/media/Gan4AmLWUAA3NIX.jpg', '$2b$10$KKSaDN3FgjCqRDuiBLJMT.ivLBqN7wFtZdqxVNZqN.uUq/K1PJhCq', 3, 0),
(7, 'dasasddas', 'dasdas@gmail.com', 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png', '$2b$10$ZaRGgVda.C4ae7TDnNboeeth/6/CV.Bt3/0zVRq/GqoRkWJQBbwzK', 1, 0),
(8, 'holaaa', 'elpopencio123@gmail.com', 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png', '$2b$10$JSQrRWH1MFa8pFZTofdP/.3WBSeSnfsi5IlFYlvUupM9IjsMyB6xa', 1, 0),
(11, 'NOMELEAS', 'escritor@gmail.com', 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png', '$2b$10$aJqh6omBSdLPbwNTJkR5Q.YKU38ZMSuFzthCgKkk78c2qIV48XeKG', 1, 0),
(12, 'Cuadrilatero', 'owomolo123@gmail.com', 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png', '$2b$10$9pN6v/LqAFsPhq7Pp6OWCuK9eKUfVuCRRnQNs6z.H/X/.GPMztKSe', 1, 1),
(13, 'pruebinha', 'pruebinha@gmail.com', 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png', '$2b$10$MisxZKDgBzlYkh429c4WI.Rj1n.xSc63CpqN9dJID3t7E4i9btV62', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ver_mas_tarde`
--

CREATE TABLE `ver_mas_tarde` (
  `TardeID` int(11) NOT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `LibroID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ver_mas_tarde`
--

INSERT INTO `ver_mas_tarde` (`TardeID`, `UsuarioID`, `LibroID`) VALUES
(8, 3, 4),
(10, 3, 3),
(11, 3, 152);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`CategoriaID`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ComentarioID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `LibroID` (`LibroID`);

--
-- Indices de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD PRIMARY KEY (`FavoritoID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `LibroID` (`LibroID`);

--
-- Indices de la tabla `gustados`
--
ALTER TABLE `gustados`
  ADD PRIMARY KEY (`GustadoID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `LibroID` (`LibroID`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`HistorialID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `LibroID` (`LibroID`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`LibroID`);

--
-- Indices de la tabla `libros_categorias`
--
ALTER TABLE `libros_categorias`
  ADD PRIMARY KEY (`LibroID`,`CategoriaID`),
  ADD KEY `CategoriaID` (`CategoriaID`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`RollID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsuarioID`),
  ADD KEY `RollID` (`RollID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `ComentarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `favoritos`
--
ALTER TABLE `favoritos`
  MODIFY `FavoritoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `gustados`
--
ALTER TABLE `gustados`
  MODIFY `GustadoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `HistorialID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `LibroID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `RollID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`LibroID`) REFERENCES `libros` (`LibroID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `favoritos`
--
ALTER TABLE `favoritos`
  ADD CONSTRAINT `favoritos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  ADD CONSTRAINT `favoritos_ibfk_2` FOREIGN KEY (`LibroID`) REFERENCES `libros` (`LibroID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`) ON DELETE CASCADE,
  ADD CONSTRAINT `historial_ibfk_2` FOREIGN KEY (`LibroID`) REFERENCES `libros` (`LibroID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `libros_categorias`
--
ALTER TABLE `libros_categorias`
  ADD CONSTRAINT `libros_categorias_ibfk_1` FOREIGN KEY (`LibroID`) REFERENCES `libros` (`LibroID`) ON DELETE CASCADE,
  ADD CONSTRAINT `libros_categorias_ibfk_2` FOREIGN KEY (`CategoriaID`) REFERENCES `categorias` (`CategoriaID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`RollID`) REFERENCES `roles` (`RollID`) ON DELETE CASCADE;
COMMIT;
