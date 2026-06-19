USE catalog;

-- ============================================
-- 1. INSERTAR 12 CATEGORÍAS
-- ============================================
INSERT INTO categories (name, description) VALUES
('Sexología', 'Libros sobre educación sexual, relaciones y salud sexual'),
('Psicología', 'Psicología clínica, cognitiva, del desarrollo y bienestar mental'),
('Romance', 'Novelas de romance, amor y relaciones humanas'),
('Historia', 'Libros de historia, biografías y eventos históricos'),
('Autoayuda', 'Desarrollo personal, productividad y crecimiento emocional'),
('Postapocalíptico', 'Ficción sobre mundos devastados y supervivencia'),
('Ficción Científica', 'Ciencia ficción, futuros distópicos y tecnología avanzada'),
('Terror', 'Horror, suspenso y novelas de miedo'),
('Misterio', 'Novelas de detectives, crímenes y misterios por resolver'),
('Fantasía', 'Mundos mágicos, épicas fantásticas y aventuras'),
('Aventura', 'Historias de exploración, acción y adrenalina'),
('Drama', 'Dramas emocionales, conflictos humanos y transformaciones');

-- ============================================
-- 3. INSERTAR 110 SUPPLIES (LIBROS)
-- ============================================
INSERT INTO supplies (title, isbn, description, author, format, price, discount_pct, stock, is_active) VALUES
('El Placer de Entender', '9781234567890', 'Introducción completa a la sexología moderna', 'Dr. Fernando Ruiz', 'PHYSICAL', 24.99, 0.00, 15, TRUE),
('Guía de Relaciones Saludables', '9781234567891', 'Cómo construir relaciones significativas', 'Dra. Elena Sánchez', 'PHYSICAL', 19.99, 10.00, 22, TRUE),
('La Psicología del Ser Humano', '9781234567892', 'Un viaje por la mente y el comportamiento', 'Prof. Miguel Torres', 'DIGITAL_PDF', 14.99, 0.00, 50, TRUE),
('Corazones Entrecruzados', '9781234567893', 'Una historia de amor en tiempos modernos', 'Isabella Ramírez', 'PHYSICAL', 16.99, 15.00, 30, TRUE),
('Los Secretos de la Historia', '9781234567894', 'Verdades ocultas en los eventos históricos', 'Historiador Juan Moreno', 'PHYSICAL', 28.99, 5.00, 12, TRUE),
('Cambia Tu Vida en 30 Días', '9781234567895', 'Técnicas probadas de transformación personal', 'Coach Andrés Vega', 'DIGITAL_EPUB', 12.99, 20.00, 100, TRUE),
('Después del Apocalipsis', '9781234567896', 'Supervivencia en un mundo devastado', 'Robert Davidson', 'PHYSICAL', 21.99, 0.00, 18, TRUE),
('Mentes Brillantes', '9781234567897', 'Estudios sobre inteligencia y cognición', 'Dra. Sofia Blanc', 'DIGITAL_PDF', 17.99, 0.00, 40, TRUE),
('El Último Viajero', '9781234567898', 'Un romance intergaláctico futurista', 'Cristina Luz', 'PHYSICAL', 18.99, 12.00, 25, TRUE),
('Crecer con Propósito', '9781234567899', 'Desarrollo emocional para todas las edades', 'Psic. Daniel Green', 'PHYSICAL', 22.99, 8.00, 20, TRUE),
('Noche de Terror', '9781234567900', 'Historias de horror que te mantendrán despierto', 'Marcus Noir', 'DIGITAL_EPUB', 11.99, 0.00, 60, TRUE),
('El Caso del Detective Perdido', '9781234567901', 'Un misterio de crimen clásico', 'Agatha Miller', 'PHYSICAL', 19.99, 0.00, 16, TRUE),
('Reinos de Magia', '9781234567902', 'Épica fantástica con dragones y hechiceros', 'J.R. Tolkien Jr.', 'PHYSICAL', 25.99, 10.00, 14, TRUE),
('Exploradores del Abismo', '9781234567903', 'Aventuras en las profundidades oceanográficas', 'Captain Marcus Wells', 'PHYSICAL', 23.99, 0.00, 19, TRUE),
('Lágrimas en la Lluvia', '9781234567904', 'Drama de traiciones y redención', 'Esperanza Ruiz', 'DIGITAL_PDF', 13.99, 15.00, 45, TRUE),
('El Códice Perdido', '9781234567905', 'Misterio histórico en la antigüedad', 'Profesor Alejandro Guzmán', 'PHYSICAL', 26.99, 0.00, 11, TRUE),
('Amor en el Caos', '9781234567906', 'Romance en medio de una guerra civil', 'Sofía Valentina', 'PHYSICAL', 17.99, 18.00, 28, TRUE),
('Terapia Cognitivo-Conductual', '9781234567907', 'Manual práctico de tratamientos psicológicos', 'Dr. Hans Mueller', 'PHYSICAL', 32.99, 0.00, 8, TRUE),
('Resurrección del Mundo', '9781234567908', 'Novela de ciencia ficción postapocalíptica', 'Nathan Stone', 'DIGITAL_EPUB', 15.99, 0.00, 55, TRUE),
('Secretos del Corazón', '9781234567909', 'Guía de inteligencia emocional', 'Dra. Patricia López', 'PHYSICAL', 20.99, 12.00, 23, TRUE),
('La Bruja del Bosque Negro', '9781234567910', 'Fantasía oscura con giros sorprendentes', 'Helena Shadows', 'PHYSICAL', 22.99, 0.00, 17, TRUE),
('Viajes Peligrosos', '9781234567911', 'Aventuras extremas en lugares remotos', 'Bear Grylls Jr.', 'PHYSICAL', 24.99, 8.00, 13, TRUE),
('Confesiones de una Alma', '9781234567912', 'Drama emocional de transformación personal', 'Lucy Monroe', 'DIGITAL_PDF', 14.99, 10.00, 48, TRUE),
('Sexo y Relaciones en la Modernidad', '9781234567913', 'Un análisis contemporáneo de la sexología', 'Dra. Carmen Alba', 'PHYSICAL', 27.99, 0.00, 10, TRUE),
('El Psicólogo Interior', '9781234567914', 'Autoayuda psicológica para el bienestar', 'Prof. Viktor Frankl Jr.', 'DIGITAL_EPUB', 16.99, 15.00, 52, TRUE),
('Novela de Pasión', '9781234567915', 'Una historia de amor prohibido', 'Marco Dante', 'PHYSICAL', 18.99, 0.00, 26, TRUE),
('Crónicas de la Antigüedad', '9781234567916', 'Relatos históricos del Imperio Romano', 'Historiador Lucio Valerio', 'PHYSICAL', 29.99, 5.00, 9, TRUE),
('Hábitos de Éxito', '9781234567917', 'Construye tu mejor versión en 90 días', 'Coach James Miller', 'DIGITAL_PDF', 11.99, 25.00, 70, TRUE),
('Mundo Post-Humano', '9781234567918', 'Ficción científica sobre la evolución humana', 'Dr. Isaac Chen', 'PHYSICAL', 23.99, 0.00, 15, TRUE),
('Nachtmahr: El Demonio Nocturno', '9781234567919', 'Terror gótico alemán', 'Klaus Richter', 'DIGITAL_EPUB', 12.99, 0.00, 58, TRUE),
('Investigación del Crimen Perfecto', '9781234567920', 'Misterio donde el asesino está entre nosotros', 'James Thomson', 'PHYSICAL', 21.99, 10.00, 20, TRUE),
('La Reina de Avalón', '9781234567921', 'Fantasía épica basada en leyendas artúricas', 'Marion Zimmer Bradley Jr.', 'PHYSICAL', 26.99, 0.00, 12, TRUE),
('Expedición a lo Desconocido', '9781234567922', 'Aventuras en territorios inexplorados', 'Ernest Adventure', 'PHYSICAL', 22.99, 6.00, 18, TRUE),
('Silencio Ensordecedor', '9781234567923', 'Drama familiar con secretos oscuros', 'Claire Denton', 'DIGITAL_PDF', 15.99, 12.00, 44, TRUE),
('Ciencia Erótica', '9781234567924', 'Ensayo sobre sexología científica', 'Dra. Rosita Gold', 'PHYSICAL', 25.99, 0.00, 14, TRUE),
('La Mente Resiliente', '9781234567925', 'Psicología de la superación personal', 'Prof. Elizabeth Wong', 'PHYSICAL', 21.99, 8.00, 24, TRUE),
('Pasión Celestial', '9781234567926', 'Romance épico entre seres celestiales', 'Anna Celestine', 'PHYSICAL', 19.99, 14.00, 29, TRUE),
('Batallas Históricas que Cambiaron el Mundo', '9781234567927', 'Análisis profundo de conflictos históricos', 'General Marcus Stone', 'PHYSICAL', 31.99, 0.00, 7, TRUE),
('30 Días para la Felicidad', '9781234567928', 'Programa de transformación emocional', 'Coach Patricia Green', 'DIGITAL_EPUB', 13.99, 22.00, 65, TRUE),
('Ashes of Tomorrow', '9781234567929', 'Novela de supervivencia en era nuclear', 'David Nuclear', 'PHYSICAL', 24.99, 0.00, 16, TRUE),
('Malibu Horror Show', '9781234567930', 'Historias de terror en la playa californiana', 'Sandy Screams', 'DIGITAL_PDF', 10.99, 0.00, 62, TRUE),
('El Asesinato de Martes', '9781234567931', 'Misterio psicológico de suspense intenso', 'Walter Gray', 'PHYSICAL', 20.99, 11.00, 21, TRUE),
('Espadas de Cristal', '9781234567932', 'Fantasía con magia antigua y guerreros', 'Sylvanus Eldwood', 'PHYSICAL', 23.99, 5.00, 19, TRUE),
('La Última Frontera', '9781234567933', 'Aventura espacial sin límites', 'Astronaut Jane Cosmo', 'PHYSICAL', 25.99, 0.00, 13, TRUE),
('Corazón Destrozado', '9781234567934', 'Drama de pérdida y reconciliación', 'Charles Heartwood', 'DIGITAL_EPUB', 14.99, 13.00, 50, TRUE),
('Sexualidad Consciente', '9781234567935', 'Guía moderna de educación sexual integral', 'Dra. Valentina Rossi', 'PHYSICAL', 26.99, 0.00, 11, TRUE),
('Emociones y Comportamiento', '9781234567936', 'Fundamentos de psicología conductual', 'Prof. Arnold Rogers', 'PHYSICAL', 23.99, 7.00, 22, TRUE),
('Besos Bajo la Luna', '9781234567937', 'Romance juvenil en un pueblo costero', 'Jenna Summer', 'PHYSICAL', 16.99, 16.00, 35, TRUE),
('El Legado del Emperador', '9781234567938', 'Crónica histórica de dinastías asiáticas', 'Historiador Wei Chen', 'PHYSICAL', 28.99, 3.00, 10, TRUE),
('Transforma Tu Mentalidad', '9781234567939', 'Técnicas neurocientíficas de cambio personal', 'Dr. Brian Foster', 'DIGITAL_PDF', 12.99, 21.00, 75, TRUE),
('Años Oscuros', '9781234567940', 'Ficción postapocalíptica con zombies', 'Z. Walker', 'PHYSICAL', 22.99, 0.00, 17, TRUE),
('Midnight in the Graveyard', '9781234567941', 'Horror sobrenatural e inquietante', 'Phantom Writer', 'DIGITAL_EPUB', 11.99, 0.00, 61, TRUE),
('Enigma del Tiempo', '9781234567942', 'Misterio de viajes en el tiempo', 'Dr. Chronos Time', 'PHYSICAL', 21.99, 9.00, 20, TRUE),
('El Reino Perdido', '9781234567943', 'Fantasía aventurera en mundo subterráneo', 'Cavern Master', 'PHYSICAL', 24.99, 0.00, 15, TRUE),
('Escalada a la Cima', '9781234567944', 'Aventura montañera en el Himalaya', 'Mount Climber', 'PHYSICAL', 23.99, 4.00, 18, TRUE),
('Noches Sin Retorno', '9781234567945', 'Drama noir de crimen y política', 'Noir Writer', 'DIGITAL_PDF', 15.99, 11.00, 46, TRUE),
('Hombres y Mujeres: Diferencias Biológicas', '9781234567946', 'Estudio científico de sexología', 'Dra. Bianca Green', 'PHYSICAL', 27.99, 0.00, 9, TRUE),
('Cuando la Mente Se Quiebra', '9781234567947', 'Psicología clínica de trastornos mentales', 'Prof. Ivan Pavlov Jr.', 'PHYSICAL', 25.99, 6.00, 13, TRUE),
('Promesa de Eternidad', '9781234567948', 'Romance épico con reencarnación', 'Eternal Love', 'PHYSICAL', 19.99, 13.00, 27, TRUE),
('Secretos de Cleopatra', '9781234567949', 'Novela histórica de Egipto antiguo', 'Historiador Ancient', 'PHYSICAL', 27.99, 2.00, 11, TRUE),
('Vive tu Mejor Vida Ahora', '9781234567950', 'Guía práctica de realización personal', 'Oprah Junior', 'DIGITAL_EPUB', 14.99, 23.00, 80, TRUE),
('Ruinas del Futuro', '9781234567951', 'Ciencia ficción sobre colapso civilizacional', 'Future Ruins', 'PHYSICAL', 23.99, 0.00, 14, TRUE),
('The Howling Darkness', '9781234567952', 'Terror psicológico y locura', 'Sanity Killer', 'DIGITAL_PDF', 12.99, 0.00, 59, TRUE),
('El Testigo Silencioso', '9781234567953', 'Misterio donde un testigo anónimo confesa', 'Silent Observer', 'PHYSICAL', 20.99, 10.00, 22, TRUE),
('Imperio de Dragones', '9781234567954', 'Fantasía épica con múltiples reinos', 'Dragon Master', 'PHYSICAL', 25.99, 0.00, 13, TRUE),
('Sobre Volcanes Activos', '9781234567955', 'Aventura en ambientes extremos', 'Extreme Adventurer', 'PHYSICAL', 22.99, 5.00, 19, TRUE),
('El Vacio Interior', '9781234567956', 'Drama introspectivo y existencial', 'Empty Soul', 'DIGITAL_EPUB', 14.99, 14.00, 49, TRUE),
('Tantra y Placer', '9781234567957', 'Guía práctica de sexología tántrica', 'Dra. Kama Sutra', 'PHYSICAL', 26.99, 0.00, 10, TRUE),
('La Psique Humana', '9781234567958', 'Compendio de teorías psicológicas', 'Prof. Freud Junior', 'PHYSICAL', 24.99, 8.00, 16, TRUE),
('Amor Prohibido', '9781234567959', 'Romance entre enemigos históricos', 'Romeo Montague', 'PHYSICAL', 18.99, 15.00, 31, TRUE),
('Los Zares de Rusia', '9781234567960', 'Historia de las dinastías rusas', 'Historiador Tolstoy', 'PHYSICAL', 29.99, 4.00, 8, TRUE),
('Crea Tu Destino', '9781234567961', 'Autoayuda basada en psicología positiva', 'Coach Destiny', 'DIGITAL_PDF', 11.99, 24.00, 78, TRUE),
('Planeta Muerto', '9781234567962', 'Ciencia ficción sobre colonias marcianas', 'Mars Explorer', 'PHYSICAL', 24.99, 0.00, 15, TRUE),
('Whispers of Death', '9781234567963', 'Horror atmosférico y misterioso', 'Whisper Master', 'DIGITAL_EPUB', 11.99, 0.00, 63, TRUE),
('Crimen Perfecto', '9781234567964', 'Misterio donde nadie conoce la verdad', 'Perfect Crime', 'PHYSICAL', 21.99, 9.00, 21, TRUE),
('La Torre de Marfil', '9781234567965', 'Fantasía de torres mágicas y secretos', 'Tower Keeper', 'PHYSICAL', 23.99, 0.00, 17, TRUE),
('Viaje al Centro de la Tierra', '9781234567966', 'Aventura de exploración subterránea', 'Jules Verne Jr.', 'PHYSICAL', 22.99, 6.00, 20, TRUE),
('Memorias Olvidadas', '9781234567967', 'Drama de memoria y reconocimiento', 'Forgotten Souls', 'DIGITAL_PDF', 15.99, 12.00, 47, TRUE),
('Más Allá del Placer', '9781234567968', 'Ensayo sobre sexología y satisfacción', 'Dra. Beyond Pleasure', 'PHYSICAL', 25.99, 0.00, 12, TRUE),
('Neuropsicología Aplicada', '9781234567969', 'Manual de psicología del cerebro', 'Prof. Neuron', 'PHYSICAL', 23.99, 7.00, 19, TRUE),
('Corazones Gemelos', '9781234567970', 'Romance de almas gemelas en tiempo paralelo', 'Twin Hearts', 'PHYSICAL', 19.99, 12.00, 28, TRUE),
('Alejandro Magno: El Conquistador', '9781234567971', 'Biografía histórica de Alejandro', 'Historiador Plutarco', 'PHYSICAL', 28.99, 3.00, 9, TRUE),
('Maestría en 21 Días', '9781234567972', 'Programa acelerado de educación personal', 'Coach Mastery', 'DIGITAL_EPUB', 13.99, 20.00, 72, TRUE),
('Último Refugio', '9781234567973', 'Ficción postapocalíptica en bunkers', 'Bunker Survivor', 'PHYSICAL', 23.99, 0.00, 16, TRUE),
('The Shade Calls', '9781234567974', 'Horror paranormal y posesiones', 'Shade Caller', 'DIGITAL_PDF', 12.99, 0.00, 60, TRUE),
('El Culpable Desconocido', '9781234567975', 'Misterio de identidad criminal', 'Unknown Culprit', 'PHYSICAL', 20.99, 10.00, 23, TRUE),
('El Culpable Desconocido 2', '9789994567976', 'Misterio de identidad criminal', 'Unknown Culprit', 'PHYSICAL', 20.99, 10.00, 23, TRUE),
('El Culpable Desconocido 3', '9789994567977', 'Misterio de identidad criminal', 'Unknown Culprit', 'PHYSICAL', 20.99, 10.00, 23, TRUE),
('Mundos Entrelazados', '9781234567976', 'Fantasía multidimensional y viajes', 'Multiverse Master', 'PHYSICAL', 24.99, 0.00, 14, TRUE),
('Expedición Ártica', '9781234567977', 'Aventura en el Ártico extremo', 'Arctic Explorer', 'PHYSICAL', 23.99, 5.00, 18, TRUE),
('Sueños Rotos', '9781234567978', 'Drama de esperanza y desespero', 'Broken Dreams', 'DIGITAL_EPUB', 14.99, 13.00, 51, TRUE),
('Sueños Rotos 2', '9789994567979', 'Drama de esperanza y desespero', 'Broken Dreams', 'DIGITAL_EPUB', 14.99, 13.00, 51, TRUE),
('Intimidad Consciente', '9781234567979', 'Guía de sexología y consciencia corporal', 'Dra. Conscious Love', 'PHYSICAL', 26.99, 0.00, 11, TRUE),
('Depresión y Recuperación', '9781234567980', 'Psicología del tratamiento de depresión', 'Prof. Recovery', 'PHYSICAL', 24.99, 8.00, 17, TRUE),
('Depresión y Recuperación 2', '9789999567980', 'Psicología del tratamiento de depresión', 'Prof. Recovery', 'PHYSICAL', 24.99, 8.00, 17, TRUE),
('Verano de Pasión', '9781234567981', 'Romance estival en una isla exótica', 'Summer Passion', 'PHYSICAL', 17.99, 17.00, 32, TRUE),
('Los Califatos del Islam', '9781234567982', 'Historia de los imperios islámicos', 'Historiador Islamic', 'PHYSICAL', 29.99, 2.00, 10, TRUE),
('Voluntad de Acero', '9781234567983', 'Autoayuda sobre disciplina y persistencia', 'Coach Iron Will', 'DIGITAL_PDF', 11.99, 23.00, 76, TRUE),
('Naves Perdidas', '9781234567984', 'Ciencia ficción sobre naos intergalácticas', 'Space Captain', 'PHYSICAL', 23.99, 0.00, 15, TRUE),
('Scream Into the Void', '9781234567985', 'Horror cósmico lovecraftiano', 'Cosmic Horror', 'DIGITAL_EPUB', 12.99, 0.00, 64, TRUE),
('La Corbata del Asesino', '9781234567986', 'Misterio de un serial killer metodológico', 'Killer Tie', 'PHYSICAL', 21.99, 9.00, 21, TRUE),
('Reinos de Poder 1', '9781234567988', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 2', '9781234567989', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 3', '9781234567990', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 4', '9781234567991', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 5', '9781234567992', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 6', '9781234567993', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 7', '9781234567994', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 8', '9781234567995', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 9', '9781234567996', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 10', '9781234567997', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 11', '9781234567998', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 12', '9781234567999', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 13', '9781234568000', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 14', '9781234568001', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 15', '9781234568002', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 16', '9781234568003', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE),
('Reinos de Poder 17', '9781234568004', 'Fantasía de intriga política y magia', 'Kingdoms Master', 'PHYSICAL', 24.99, 0.00, 13, TRUE);

-- ============================================
-- 4. INSERTAR SPECS PARA CADA LIBRO (50 specs variados)
-- ============================================
INSERT INTO specs (supply_id, spec_key, spec_value) VALUES
(1, 'pages', '320'),
(1, 'language', 'Español'),
(1, 'publish_date', '2023-01-15'),
(2, 'pages', '280'),
(2, 'language', 'Español'),
(2, 'publish_date', '2022-06-10'),
(3, 'pages', '450'),
(3, 'language', 'Español'),
(3, 'publish_date', '2023-03-22'),
(4, 'pages', '320'),
(4, 'language', 'Español'),
(4, 'publish_date', '2023-02-14'),
(5, 'pages', '512'),
(5, 'language', 'Español'),
(5, 'publish_date', '2021-11-08'),
(6, 'pages', '240'),
(6, 'language', 'Español'),
(6, 'publish_date', '2024-01-30'),
(7, 'pages', '380'),
(7, 'language', 'Español'),
(7, 'publish_date', '2023-05-12'),
(8, 'pages', '520'),
(8, 'language', 'Español'),
(8, 'publish_date', '2022-09-03'),
(9, 'pages', '300'),
(9, 'language', 'Español'),
(9, 'publish_date', '2023-07-20'),
(10, 'pages', '370'),
(10, 'language', 'Español'),
(10, 'publish_date', '2023-04-05'),
(11, 'pages', '410'),
(11, 'language', 'Español'),
(11, 'publish_date', '2023-10-18'),
(12, 'pages', '340'),
(12, 'language', 'Español'),
(12, 'publish_date', '2022-12-01'),
(13, 'pages', '580'),
(13, 'language', 'Español'),
(13, 'publish_date', '2023-08-09'),
(14, 'pages', '360'),
(14, 'language', 'Español'),
(14, 'publish_date', '2023-06-14'),
(15, 'pages', '420'),
(15, 'language', 'Español'),
(15, 'publish_date', '2023-03-11'),
(16, 'pages', '500'),
(16, 'language', 'Español'),
(16, 'publish_date', '2021-10-27'),
(17, 'pages', '310'),
(17, 'language', 'Español'),
(17, 'publish_date', '2023-09-06'),
(18, 'pages', '480'),
(18, 'language', 'Español'),
(18, 'publish_date', '2022-05-19');

-- Agregar specs para los siguientes 92 libros (del 19 al 110)
INSERT INTO specs (supply_id, spec_key, spec_value) VALUES
(19, 'pages', '292'), (19, 'language', 'Español'), (19, 'publish_date', '2023-11-23'),
(20, 'pages', '315'), (20, 'language', 'Español'), (20, 'publish_date', '2023-08-17'),
(21, 'pages', '375'), (21, 'language', 'Español'), (21, 'publish_date', '2023-12-01'),
(22, 'pages', '440'), (22, 'language', 'Español'), (22, 'publish_date', '2023-02-28'),
(23, 'pages', '265'), (23, 'language', 'Español'), (23, 'publish_date', '2024-01-15'),
(24, 'pages', '385'), (24, 'language', 'Español'), (24, 'publish_date', '2023-07-10'),
(25, 'pages', '320'), (25, 'language', 'Español'), (25, 'publish_date', '2023-09-22'),
(26, 'pages', '495'), (26, 'language', 'Español'), (26, 'publish_date', '2022-11-14'),
(27, 'pages', '340'), (27, 'language', 'Español'), (27, 'publish_date', '2023-10-05'),
(28, 'pages', '360'), (28, 'language', 'Español'), (28, 'publish_date', '2023-04-19'),
(29, 'pages', '410'), (29, 'language', 'Español'), (29, 'publish_date', '2023-01-30'),
(30, 'pages', '370'), (30, 'language', 'Español'), (30, 'publish_date', '2023-06-08'),
(31, 'pages', '520'), (31, 'language', 'Español'), (31, 'publish_date', '2022-08-25'),
(32, 'pages', '305'), (32, 'language', 'Español'), (32, 'publish_date', '2023-11-02'),
(33, 'pages', '380'), (33, 'language', 'Español'), (33, 'publish_date', '2023-05-28'),
(34, 'pages', '430'), (34, 'language', 'Español'), (34, 'publish_date', '2023-09-11'),
(35, 'pages', '295'), (35, 'language', 'Español'), (35, 'publish_date', '2023-12-16'),
(36, 'pages', '370'), (36, 'language', 'Español'), (36, 'publish_date', '2023-03-09'),
(37, 'pages', '400'), (37, 'language', 'Español'), (37, 'publish_date', '2022-10-20'),
(38, 'pages', '510'), (38, 'language', 'Español'), (38, 'publish_date', '2023-02-12'),
(39, 'pages', '330'), (39, 'language', 'Español'), (39, 'publish_date', '2023-08-04'),
(40, 'pages', '375'), (40, 'language', 'Español'), (40, 'publish_date', '2023-07-21'),
(41, 'pages', '420'), (41, 'language', 'Español'), (41, 'publish_date', '2023-01-18'),
(42, 'pages', '290'), (42, 'language', 'Español'), (42, 'publish_date', '2024-02-07'),
(43, 'pages', '365'), (43, 'language', 'Español'), (43, 'publish_date', '2023-10-25'),
(44, 'pages', '440'), (44, 'language', 'Español'), (44, 'publish_date', '2023-04-14'),
(45, 'pages', '315'), (45, 'language', 'Español'), (45, 'publish_date', '2023-11-30'),
(46, 'pages', '495'), (46, 'language', 'Español'), (46, 'publish_date', '2022-09-06'),
(47, 'pages', '380'), (47, 'language', 'Español'), (47, 'publish_date', '2023-06-27'),
(48, 'pages', '350'), (48, 'language', 'Español'), (48, 'publish_date', '2023-08-13'),
(49, 'pages', '405'), (49, 'language', 'Español'), (49, 'publish_date', '2023-03-02'),
(50, 'pages', '520'), (50, 'language', 'Español'), (50, 'publish_date', '2022-12-10'),
(51, 'pages', '285'), (51, 'language', 'Español'), (51, 'publish_date', '2024-01-03'),
(52, 'pages', '370'), (52, 'language', 'Español'), (52, 'publish_date', '2023-05-09'),
(53, 'pages', '445'), (53, 'language', 'Español'), (53, 'publish_date', '2023-02-21'),
(54, 'pages', '310'), (54, 'language', 'Español'), (54, 'publish_date', '2023-09-18'),
(55, 'pages', '390'), (55, 'language', 'Español'), (55, 'publish_date', '2023-07-06'),
(56, 'pages', '425'), (56, 'language', 'Español'), (56, 'publish_date', '2023-11-13'),
(57, 'pages', '300'), (57, 'language', 'Español'), (57, 'publish_date', '2023-04-04'),
(58, 'pages', '480'), (58, 'language', 'Español'), (58, 'publish_date', '2022-10-31'),
(59, 'pages', '340'), (59, 'language', 'Español'), (59, 'publish_date', '2023-08-22'),
(60, 'pages', '380'), (60, 'language', 'Español'), (60, 'publish_date', '2023-01-10'),
(61, 'pages', '415'), (61, 'language', 'Español'), (61, 'publish_date', '2023-06-16'),
(62, 'pages', '500'), (62, 'language', 'Español'), (62, 'publish_date', '2022-11-29'),
(63, 'pages', '295'), (63, 'language', 'Español'), (63, 'publish_date', '2023-12-08'),
(64, 'pages', '365'), (64, 'language', 'Español'), (64, 'publish_date', '2023-03-15'),
(65, 'pages', '435'), (65, 'language', 'Español'), (65, 'publish_date', '2023-09-02'),
(66, 'pages', '320'), (66, 'language', 'Español'), (66, 'publish_date', '2023-05-14'),
(67, 'pages', '490'), (67, 'language', 'Español'), (67, 'publish_date', '2022-08-17'),
(68, 'pages', '375'), (68, 'language', 'Español'), (68, 'publish_date', '2023-10-29'),
(69, 'pages', '345'), (69, 'language', 'Español'), (69, 'publish_date', '2023-07-11'),
(70, 'pages', '410'), (70, 'language', 'Español'), (70, 'publish_date', '2023-02-03'),
(71, 'pages', '525'), (71, 'language', 'Español'), (71, 'publish_date', '2022-09-24'),
(72, 'pages', '280'), (72, 'language', 'Español'), (72, 'publish_date', '2024-02-20'),
(73, 'pages', '370'), (73, 'language', 'Español'), (73, 'publish_date', '2023-04-26'),
(74, 'pages', '440'), (74, 'language', 'Español'), (74, 'publish_date', '2023-11-05'),
(75, 'pages', '315'), (75, 'language', 'Español'), (75, 'publish_date', '2023-08-31'),
(76, 'pages', '395'), (76, 'language', 'Español'), (76, 'publish_date', '2023-01-22'),
(77, 'pages', '420'), (77, 'language', 'Español'), (77, 'publish_date', '2023-06-10'),
(78, 'pages', '510'), (78, 'language', 'Español'), (78, 'publish_date', '2022-12-17'),
(79, 'pages', '330'), (79, 'language', 'Español'), (79, 'publish_date', '2023-10-12'),
(80, 'pages', '365'), (80, 'language', 'Español'), (80, 'publish_date', '2023-05-19'),
(81, 'pages', '450'), (81, 'language', 'Español'), (81, 'publish_date', '2023-02-08'),
(82, 'pages', '290'), (82, 'language', 'Español'), (82, 'publish_date', '2023-12-03'),
(83, 'pages', '385'), (83, 'language', 'Español'), (83, 'publish_date', '2023-03-27'),
(84, 'pages', '530'), (84, 'language', 'Español'), (84, 'publish_date', '2022-07-19'),
(85, 'pages', '340'), (85, 'language', 'Español'), (85, 'publish_date', '2023-09-07'),
(86, 'pages', '415'), (86, 'language', 'Español'), (86, 'publish_date', '2023-04-30'),
(87, 'pages', '370'), (87, 'language', 'Español'), (87, 'publish_date', '2023-11-14'),
(88, 'pages', '480'), (88, 'language', 'Español'), (88, 'publish_date', '2022-10-05'),
(89, 'pages', '305'), (89, 'language', 'Español'), (89, 'publish_date', '2023-08-20'),
(90, 'pages', '395'), (90, 'language', 'Español'), (90, 'publish_date', '2023-01-25'),
(91, 'pages', '435'), (91, 'language', 'Español'), (91, 'publish_date', '2023-07-13'),
(92, 'pages', '515'), (92, 'language', 'Español'), (92, 'publish_date', '2022-11-02'),
(93, 'pages', '320'), (93, 'language', 'Español'), (93, 'publish_date', '2023-10-08'),
(94, 'pages', '360'), (94, 'language', 'Español'), (94, 'publish_date', '2023-06-21'),
(95, 'pages', '420'), (95, 'language', 'Español'), (95, 'publish_date', '2023-02-14'),
(96, 'pages', '500'), (96, 'language', 'Español'), (96, 'publish_date', '2022-09-11'),
(97, 'pages', '285'), (97, 'language', 'Español'), (97, 'publish_date', '2023-12-26'),
(98, 'pages', '375'), (98, 'language', 'Español'), (98, 'publish_date', '2023-05-02'),
(99, 'pages', '445'), (99, 'language', 'Español'), (99, 'publish_date', '2023-03-17'),
(100, 'pages', '310'), (100, 'language', 'Español'), (100, 'publish_date', '2023-08-28'),
(101, 'pages', '390'), (101, 'language', 'Español'), (101, 'publish_date', '2023-04-12'),
(102, 'pages', '420'), (102, 'language', 'Español'), (102, 'publish_date', '2023-09-05'),
(103, 'pages', '505'), (103, 'language', 'Español'), (103, 'publish_date', '2022-12-28'),
(104, 'pages', '335'), (104, 'language', 'Español'), (104, 'publish_date', '2023-07-31'),
(105, 'pages', '385'), (105, 'language', 'Español'), (105, 'publish_date', '2023-01-06'),
(106, 'pages', '460'), (106, 'language', 'Español'), (106, 'publish_date', '2023-10-17'),
(107, 'pages', '300'), (107, 'language', 'Español'), (107, 'publish_date', '2023-11-09'),
(108, 'pages', '380'), (108, 'language', 'Español'), (108, 'publish_date', '2023-06-03'),
(109, 'pages', '425'), (109, 'language', 'Español'), (109, 'publish_date', '2023-02-20'),
(110, 'pages', '495'), (110, 'language', 'Español'), (110, 'publish_date', '2022-08-08');

-- ============================================
-- 5. INSERTAR IMÁGENES PARA CADA LIBRO (1-2 imágenes por libro)
-- ============================================
INSERT INTO images (supply_id, image_url) VALUES
(1, 'https://picsum.photos/seed/book-3/639/955'),
(1, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(2, 'https://picsum.photos/seed/book-4/639/956'),
(2, 'https://picsum.photos/seed/book-5/639/957'),
(3, 'https://picsum.photos/seed/book-3/639/955'),
(4, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(5, 'https://picsum.photos/seed/book-3/639/955'),
(6, 'https://picsum.photos/seed/book-4/639/956'),
(7, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(8, 'https://picsum.photos/seed/book-5/639/957'),
(9, 'https://picsum.photos/seed/book-3/639/955'),
(10, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(11, 'https://picsum.photos/seed/book-4/639/956'),
(12, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(13, 'https://picsum.photos/seed/book-5/639/957'),
(14, 'https://picsum.photos/seed/book-3/639/955'),
(15, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(16, 'https://picsum.photos/seed/book-4/639/956'),
(17, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(18, 'https://picsum.photos/seed/book-5/639/957'),
(19, 'https://picsum.photos/seed/book-3/639/955'),
(20, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(21, 'https://picsum.photos/seed/book-4/639/956'),
(22, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(23, 'https://picsum.photos/seed/book-5/639/957'),
(24, 'https://picsum.photos/seed/book-3/639/955'),
(25, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(26, 'https://picsum.photos/seed/book-4/639/956'),
(27, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(28, 'https://picsum.photos/seed/book-5/639/957'),
(29, 'https://picsum.photos/seed/book-3/639/955'),
(30, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(31, 'https://picsum.photos/seed/book-4/639/956'),
(32, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(33, 'https://picsum.photos/seed/book-5/639/957'),
(34, 'https://picsum.photos/seed/book-3/639/955'),
(35, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(36, 'https://picsum.photos/seed/book-4/639/956'),
(37, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(38, 'https://picsum.photos/seed/book-5/639/957'),
(39, 'https://picsum.photos/seed/book-3/639/955'),
(40, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(41, 'https://picsum.photos/seed/book-4/639/956'),
(42, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(43, 'https://picsum.photos/seed/book-5/639/957'),
(44, 'https://picsum.photos/seed/book-3/639/955'),
(45, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(46, 'https://picsum.photos/seed/book-4/639/956'),
(47, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(48, 'https://picsum.photos/seed/book-5/639/957'),
(49, 'https://picsum.photos/seed/book-3/639/955'),
(50, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(51, 'https://picsum.photos/seed/book-4/639/956'),
(52, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(53, 'https://picsum.photos/seed/book-5/639/957'),
(54, 'https://picsum.photos/seed/book-3/639/955'),
(55, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(56, 'https://picsum.photos/seed/book-4/639/956'),
(57, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(58, 'https://picsum.photos/seed/book-5/639/957'),
(59, 'https://picsum.photos/seed/book-3/639/955'),
(60, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(61, 'https://picsum.photos/seed/book-4/639/956'),
(62, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(63, 'https://picsum.photos/seed/book-5/639/957'),
(64, 'https://picsum.photos/seed/book-3/639/955'),
(65, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(66, 'https://picsum.photos/seed/book-4/639/956'),
(67, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(68, 'https://picsum.photos/seed/book-5/639/957'),
(69, 'https://picsum.photos/seed/book-3/639/955'),
(70, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(71, 'https://picsum.photos/seed/book-4/639/956'),
(72, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(73, 'https://picsum.photos/seed/book-5/639/957'),
(74, 'https://picsum.photos/seed/book-3/639/955'),
(75, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(76, 'https://picsum.photos/seed/book-4/639/956'),
(77, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(78, 'https://picsum.photos/seed/book-5/639/957'),
(79, 'https://picsum.photos/seed/book-3/639/955'),
(80, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(81, 'https://picsum.photos/seed/book-4/639/956'),
(82, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(83, 'https://picsum.photos/seed/book-5/639/957'),
(84, 'https://picsum.photos/seed/book-3/639/955'),
(85, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(86, 'https://picsum.photos/seed/book-4/639/956'),
(87, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(88, 'https://picsum.photos/seed/book-5/639/957'),
(89, 'https://picsum.photos/seed/book-3/639/955'),
(90, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(91, 'https://picsum.photos/seed/book-4/639/956'),
(92, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(93, 'https://picsum.photos/seed/book-5/639/957'),
(94, 'https://picsum.photos/seed/book-3/639/955'),
(95, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(96, 'https://picsum.photos/seed/book-4/639/956'),
(97, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(98, 'https://picsum.photos/seed/book-5/639/957'),
(99, 'https://picsum.photos/seed/book-3/639/955'),
(100, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(101, 'https://picsum.photos/seed/book-4/639/956'),
(102, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(103, 'https://picsum.photos/seed/book-5/639/957'),
(104, 'https://picsum.photos/seed/book-3/639/955'),
(105, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400'),
(106, 'https://picsum.photos/seed/book-4/639/956'),
(107, 'https://images.unsplash.com/photo-1512820790803-83ca734da794?w=400'),
(108, 'https://picsum.photos/seed/book-5/639/957'),
(109, 'https://picsum.photos/seed/book-3/639/955'),
(110, 'https://images.unsplash.com/photo-1516979187457-637abb4f9353?w=400');

-- ============================================
-- 6. INSERTAR SUPPLY_CATEGORY (Asignaciones de libros a categorías)
-- ============================================
-- Cada libro tendrá entre 1 y 3 categorías
INSERT INTO supply_category (supply_id, category_id) VALUES
-- Sexología (1)
(1, 1), (2, 1), (23, 1), (34, 1), (46, 1), (57, 1), (68, 1), (79, 1), (91, 1),
-- Psicología (2)
(3, 2), (8, 2), (10, 2), (25, 2), (35, 2), (47, 2), (58, 2), (69, 2), (80, 2),
-- Romance (3)
(4, 3), (9, 3), (16, 3), (26, 3), (36, 3), (48, 3), (59, 3), (71, 3), (82, 3), (92, 3),
-- Historia (4)
(5, 4), (15, 4), (27, 4), (38, 4), (49, 4), (60, 4), (72, 4), (83, 4),
-- Autoayuda (5)
(6, 5), (10, 5), (24, 5), (39, 5), (50, 5), (61, 5), (73, 5), (84, 5), (95, 5),
-- Postapocalíptico (6)
(7, 6), (18, 6), (28, 6), (40, 6), (51, 6), (62, 6), (74, 6), (87, 6),
-- Ficción Científica (7)
(9, 7), (19, 7), (29, 7), (41, 7), (52, 7), (64, 7), (75, 7), (88, 7),
-- Terror (8)
(11, 8), (20, 8), (30, 8), (42, 8), (63, 8), (76, 8), (89, 8),
-- Misterio (9)
(12, 9), (21, 9), (31, 9), (43, 9), (65, 9), (77, 9), (90, 9), (102, 9),
-- Fantasía (10)
(13, 10), (22, 10), (32, 10), (44, 10), (54, 10), (66, 10), (78, 10), (93, 10), (103, 10),
-- Aventura (11)
(14, 11), (33, 11), (45, 11), (55, 11), (67, 11), (85, 11), (98, 11),
-- Drama (12)
(15, 12), (22, 12), (37, 12), (56, 12), (70, 12), (81, 12), (94, 12),
-- Asociaciones adicionales para libros sin categoría
(17, 3), (37, 7), (52, 2), (63, 7), (74, 10), (85, 9), (96, 4), (107, 1),
(18, 11), (27, 5), (38, 12), (48, 9), (69, 3), (80, 6);

-- ============================================
-- 7. INSERTAR 50 REVIEWS (Sobre 20 libros específicos)
-- ============================================
-- Libros con reviews: 1, 4, 7, 9, 13, 16, 20, 25, 31, 37, 43, 49, 55, 61, 68, 75, 82, 88, 95, 102
-- Reviews para Libro 1 (5 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(1, 1, 4.50, 'Excelente introducción, muy clara y práctica.'),
(1, 2, 4.00, 'Buen contenido, recomendado para principiantes.'),
(1, 3, 5.00, 'Libro impresionante, cambió mi perspectiva sobre el tema.'),
(1, 4, 3.50, 'Útil pero podría profundizar más en ciertos temas.'),
(1, 5, 4.50, 'Muy recomendable, escriben con profesionalismo.');

-- Reviews para Libro 4 (3 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(4, 1, 5.00, 'Una historia de amor hermosa y emocionante.'),
(4, 2, 4.50, 'Prosa romántica muy bien lograda.'),
(4, 3, 4.00, 'Buena trama, aunque algo predecible.');

-- Reviews para Libro 7 (2 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(7, 1, 4.00, 'Escenarios post-apocalípticos muy bien descritos.'),
(7, 2, 4.50, 'Novela de supervivencia intensa y emocionante.');

-- Reviews para Libro 9 (3 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(9, 3, 5.00, 'Romance y ciencia ficción perfectamente combinados.'),
(9, 4, 4.50, 'Amor entre mundos, Historia fascinante.'),
(9, 5, 4.00, 'Buena aventura galáctica con romance.');

-- Reviews para Libro 13 (4 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(13, 1, 5.00, 'Épica fantástica de primer nivel.'),
(13, 2, 4.50, 'Mundo mágico bien construido, muy detallado.'),
(13, 3, 4.50, 'Los dragones son espectaculares en la narración.'),
(13, 4, 5.00, 'Mejor libro de fantasía que he leído.');

-- Reviews para Libro 16 (2 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(16, 2, 4.00, 'Excelente libro de misterio histórico.'),
(16, 5, 4.50, 'Intriga que no te deja dormir.');

-- Reviews para Libro 20 (3 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(20, 1, 4.50, 'Terror auténtico y bien ejecutado.'),
(20, 3, 4.00, 'Historias escalofriantes que persisten en la mente.'),
(20, 4, 5.00, 'Miedo puro, muy recomendado para amantes del terror.');

-- Reviews para Libro 25 (2 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(25, 2, 4.00, 'Buena guía de autoayuda, práctica y útil.'),
(25, 5, 4.50, 'Técnicas efectivas para mejorar la vida personal.');

-- Reviews para Libro 31 (3 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(31, 1, 4.50, 'Misterio inteligente, muy bien tramado.'),
(31, 3, 5.00, 'No puedo creer el giro final, excelente.'),
(31, 4, 4.00, 'Buen misterio, aunque algo lento al principio.');

-- Reviews para Libro 37 (4 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(37, 2, 4.50, 'Drama emocional muy potente.'),
(37, 3, 5.00, 'Historias que tocan el corazón profundamente.'),
(37, 4, 4.00, 'Buen desarrollo de personajes y conflictos.'),
(37, 5, 4.50, 'Transformación personal magistralmente narrada.');

-- Reviews para Libro 43 (2 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(43, 1, 4.00, 'Fantasia con trama política muy entretenida.'),
(43, 2, 4.50, 'Batalla por el poder en un mundo mágico.');

-- Reviews para Libro 49 (3 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(49, 1, 5.00, 'Historia antigua vívidamente recreada.'),
(49, 4, 4.50, 'Crónica de un imperio fascinante.'),
(49, 5, 4.00, 'Buena investigación histórica.');

-- Reviews para Libro 55 (2 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(55, 2, 4.50, 'Aventura de exploración extremadamente emocionante.'),
(55, 3, 4.00, 'Buenas descripiones de lugares remotos.');

-- Reviews para Libro 61 (3 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(61, 1, 4.50, 'Técnica de autoayuda muy bien explicada.'),
(61, 4, 4.00, 'Útil para cambiar mentalidad negativa.'),
(61, 5, 4.50, 'Ejercicios prácticos y efectivos.');

-- Reviews para Libro 68 (2 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(68, 2, 5.00, 'Romance en contexto de desastre, muy emotivo.'),
(68, 3, 4.50, 'Amor en tiempos de apocalipsis, hermoso.');

-- Reviews para Libro 75 (3 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(75, 1, 4.00, 'Aventura espacial emocionante y bien paced.'),
(75, 4, 4.50, 'Exploración del cosmos fascinante.'),
(75, 5, 4.00, 'Buena ciencia ficción de aventura.');

-- Reviews para Libro 82 (2 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(82, 2, 4.50, 'Romance juvenil tocador del corazón.'),
(82, 3, 4.00, 'Primer amor recordado con nostalgia.');

-- Reviews para Libro 88 (4 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(88, 1, 5.00, 'Terror sobrenatural magistralmente ejecutado.'),
(88, 2, 4.50, 'Miedo que se siente en cada página.'),
(88, 4, 4.50, 'Atmósfera terrorífica perfecta.'),
(88, 5, 4.00, 'Buen horror, recomendado.');

-- Reviews para Libro 95 (2 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(95, 1, 4.50, 'Guía de realización personal efectiva.'),
(95, 3, 4.00, 'Pasos claros para mejorar la vida.');

-- Reviews para Libro 102 (2 reviews)
INSERT INTO reviews (book_id, user_id, rating, comment) VALUES
(102, 2, 5.00, 'Misterio de identidad muy intrigante.'),
(102, 5, 4.50, 'Giros sorprendentes en cada capítulo.');

-- Actualizar average_rating y review_count en tabla supplies (esto debería hacerse con triggers o aplicación)
UPDATE supplies SET average_rating = 4.30, review_count = 5 WHERE id = 1;
UPDATE supplies SET average_rating = 4.50, review_count = 3 WHERE id = 4;
UPDATE supplies SET average_rating = 4.25, review_count = 2 WHERE id = 7;
UPDATE supplies SET average_rating = 4.50, review_count = 3 WHERE id = 9;
UPDATE supplies SET average_rating = 4.75, review_count = 4 WHERE id = 13;
UPDATE supplies SET average_rating = 4.25, review_count = 2 WHERE id = 16;
UPDATE supplies SET average_rating = 4.50, review_count = 3 WHERE id = 20;
UPDATE supplies SET average_rating = 4.25, review_count = 2 WHERE id = 25;
UPDATE supplies SET average_rating = 4.50, review_count = 3 WHERE id = 31;
UPDATE supplies SET average_rating = 4.50, review_count = 4 WHERE id = 37;
UPDATE supplies SET average_rating = 4.25, review_count = 2 WHERE id = 43;
UPDATE supplies SET average_rating = 4.50, review_count = 3 WHERE id = 49;
UPDATE supplies SET average_rating = 4.25, review_count = 2 WHERE id = 55;
UPDATE supplies SET average_rating = 4.33, review_count = 3 WHERE id = 61;
UPDATE supplies SET average_rating = 4.75, review_count = 2 WHERE id = 68;
UPDATE supplies SET average_rating = 4.17, review_count = 3 WHERE id = 75;
UPDATE supplies SET average_rating = 4.25, review_count = 2 WHERE id = 82;
UPDATE supplies SET average_rating = 4.50, review_count = 4 WHERE id = 88;
UPDATE supplies SET average_rating = 4.25, review_count = 2 WHERE id = 95;
UPDATE supplies SET average_rating = 4.75, review_count = 2 WHERE id = 102;