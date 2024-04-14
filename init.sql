-- Llenar la tabla Auctions con datos de ejemplo
INSERT INTO Auctions (auction_name, auction_description, start_date, end_date, status)
VALUES
    ('Subasta de Primavera', 'Subasta de obras de arte contemporáneo', '2024-03-15', '2024-04-30', 'active'),
    ('Subasta de Verano', 'Subasta de obras de arte moderno', '2024-06-01', '2024-07-31', 'active'),
    ('Subasta de Otoño', 'Subasta de pinturas clásicas', '2024-09-01', '2024-10-31', 'active'),
    ('Subasta de Invierno', 'Subasta de arte abstracto', '2024-12-01', '2024-12-31', 'active'),
    ('Subasta de Renacimiento', 'Subasta de obras de arte renacentistas', '2024-04-01', '2024-05-15', 'active'),
    ('Subasta de Fotografía', 'Subasta de fotografías famosas', '2024-07-01', '2024-08-30', 'active'),
    ('Subasta de Esculturas', 'Subasta de esculturas modernas', '2024-10-01', '2024-11-15', 'active'),
    ('Subasta de Arte Contemporáneo', 'Subasta de arte contemporáneo internacional', '2024-12-01', '2024-12-15', 'active'),
    ('Subasta de Clásicos Modernos', 'Subasta de obras maestras modernas', '2024-06-01', '2024-06-30', 'active'),
    ('Subasta de Arte Oriental', 'Subasta de arte oriental antiguo y contemporáneo', '2024-09-01', '2024-09-30', 'active');

-- Llenar la tabla Artworks con datos de ejemplo
INSERT INTO Artworks (auction_id, title, artist, year_created, dimensions, material, genre, description, minimum_bid, status)
VALUES
    (1, 'Paisaje en Primavera', 'Juan Pérez', 2005, '80 cm × 60 cm', 'Óleo sobre lienzo', 'Paisaje', 'Hermoso paisaje primaveral con árboles en flor', 1000.00, 'active'),
    (1, 'Retrato de una Dama', 'María García', 1990, '50 cm × 40 cm', 'Acuarela sobre papel', 'Retrato', 'Retrato de una dama con vestido rojo', 800.00, 'active'),
    (2, 'Flores en el Jardín', 'Ana Martínez', 2018, '70 cm × 50 cm', 'Acrílico sobre lienzo', 'Naturaleza muerta', 'Pintura de flores coloridas en un jardín', 1200.00, 'active'),
    (2, 'Abstracción Primaveral', 'David Rodríguez', 2009, '100 cm × 80 cm', 'Mixta sobre tabla', 'Abstracto', 'Pintura abstracta que evoca la frescura y el renacer de la primavera', 1500.00, 'active'),
    (3, 'El Grito', 'Edvard Munch', 1893, '91 cm × 73.5 cm', 'Óleo, tempera y pastel sobre cartón', 'Expresionismo', 'Una de las obras de arte más famosas y reconocibles del mundo', 1000000.00, 'active'),
    (4, 'Aurora Boreal', 'Sofía Fernández', 2021, '120 cm × 90 cm', 'Acrílico sobre lienzo', 'Abstracto', 'Representación artística de la aurora boreal en colores vivos', 2000.00, 'active'),
    (4, 'La Persistencia de la Memoria', 'Salvador Dalí', 1931, '24 cm × 33 cm', 'Óleo sobre lienzo', 'Surrealismo', 'Famosa pintura de Dalí con relojes derretidos en un paisaje surrealista', 5000000.00, 'active'),
    (5, 'La Última Cena', 'Leonardo da Vinci', 1495, '460 cm × 880 cm', 'Óleo sobre yeso', 'Renacimiento', 'Pintura mural que representa la última cena de Jesús con sus apóstoles', 50000000.00, 'active'),
    (5, 'La Venus de Milo', 'Alejandro de Antioquía', -100, '202 cm × 50 cm × 50 cm', 'Mármol', 'Escultura clásica', 'Una de las esculturas más famosas de la antigua Grecia', 8000000.00, 'active'),
    (6, 'Niño con Juguete de Hand Grenade', 'Diane Arbus', 1962, '39.4 cm × 39.4 cm', 'Impresión de gelatina de plata', 'Fotografía', 'Fotografía icónica de Arbus de un niño sosteniendo una granada de mano inerte', 50000.00, 'active'),
    (7, 'Mujer Sentada', 'Henry Moore', 1957, '123 cm × 71 cm × 83 cm', 'Bronce', 'Escultura abstracta', 'Escultura de bronce abstracta de una mujer sentada', 100000.00, 'active'),
    (8, 'Sin Título I', 'Mark Rothko', 1969, '262 cm × 323 cm', 'Óleo sobre lienzo', 'Expresionismo abstracto', 'Obra maestra del expresionismo abstracto de Rothko', 5000000.00, 'active'),
    (9, 'Puente Japonés', 'Claude Monet', 1899, '81 cm × 101 cm', 'Óleo sobre lienzo', 'Impresionismo', 'Pintura impresionista de Monet del famoso puente japonés en su jardín de Giverny', 1500000.00, 'active'),
    (9, 'La Joven de la Perla', 'Johannes Vermeer', 1665, '46.5 cm × 40 cm', 'Óleo sobre lienzo', 'Barroco', 'Famoso retrato de Vermeer de una mujer con una perla en su oreja', 20000000.00, 'active'),
    (10, 'Buda Sentado', 'Anonymus', 600, '78 cm × 47 cm × 32 cm', 'Mármol', 'Arte Budista', 'Escultura antigua de Buda en posición de meditación', 500000.00, 'active');

-- Llenar la tabla Customers con datos de ejemplo
INSERT INTO Customers (full_name, email, phone, document_type, document_number)
VALUES
    ('Roberto Sánchez', 'roberto@example.com', '123456789', 'DNI', '12345678A'),
    ('Laura López', 'laura@example.com', '987654321', 'DNI', '87654321B'),
    ('Carlos Martínez', 'carlos@example.com', '555666777', 'Pasaporte', 'AB123456'),
    ('Sofía Fernández', 'sofia@example.com', '333444555', 'NIE', 'XYZ987654'),
    ('Ana García', 'ana@example.com', '111222333', 'DNI', '98765432C'),
    ('Pablo Rodríguez', 'pablo@example.com', '444555666', 'NIE', 'ABC123456'),
    ('Elena Martín', 'elena@example.com', '777888999', 'DNI', '45678901D'),
    ('Andrea Gómez', 'andrea@example.com', '222333444', 'Pasaporte', 'CD456789'),
    ('Javier Ruiz', 'javier@example.com', '666777888', 'DNI', '78901234E'),
    ('Lucía Hernández', 'lucia@example.com', '999000111', 'NIE', 'EFG123456');

-- Llenar la tabla Bids con datos de ejemplo
INSERT INTO Bids (auction_id, artwork_id, customer_id, bid_value, bid_timestamp)
VALUES
    (1, 1, 1, 1200.00, '2024-03-18 10:00:00'),
    (1, 2, 2, 1000.00, '2024-03-18 11:00:00'),
    (2, 3, 1, 1500.00, '2024-03-18 12:00:00'),
    (3, 5, 3, 100000.00, '2024-03-18 13:00:00'),
    (4, 6, 4, 2500.00, '2024-03-18 14:00:00'),
    (5, 7, 5, 50000000.00, '2024-03-18 15:00:00'),
    (6, 8, 6, 60000.00, '2024-03-18 16:00:00'),
    (7, 9, 7, 120000.00, '2024-03-18 17:00:00'),
    (8, 10, 8, 5000000.00, '2024-03-18 18:00:00'),
    (9, 11, 9, 2000000.00, '2024-03-18 19:00:00');

-- Llenar la tabla Admins con datos de ejemplo
INSERT INTO Admins (email, password)
VALUES 
    ('admin1@example.com', 'password1'),
    ('admin2@example.com', 'password2'),
    ('admin3@example.com', 'password3'),
    ('admin4@example.com', 'password4'),
    ('admin5@example.com', 'password5'),
    ('admin6@example.com', 'password6'),
    ('admin7@example.com', 'password7'),
    ('admin8@example.com', 'password8'),
    ('admin9@example.com', 'password9'),
    ('admin10@example.com', 'password10');

