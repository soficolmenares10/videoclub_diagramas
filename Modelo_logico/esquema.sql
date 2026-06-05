CREATE TABLE Archivador (
num_serie VARCHAR(50) PRIMARY KEY,
ubicacion VARCHAR(100) NOT NULL,
num_estanterias INT NOT NULL,
fecha_compra DATE NOT NULL
);

CREATE TABLE Socio (
id_socio INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(150) NOT NULL,
telefono VARCHAR(20) NOT NULL
);

CREATE TABLE Director_Favorito (
id_director_favorito INT PRIMARY KEY,
nombre_director VARCHAR(100) NOT NULL
);

CREATE TABLE Actor (
id_actor INT PRIMARY KEY,
nombre_actor VARCHAR(100) NOT NULL
);

CREATE TABLE Pelicula (
titulo VARCHAR(150),
director VARCHAR(100),
anio INT,
genero VARCHAR(50),
num_serie_archivador VARCHAR(50),

```
PRIMARY KEY (titulo, director, anio),

FOREIGN KEY (num_serie_archivador)
REFERENCES Archivador(num_serie)
```

);

CREATE TABLE Socio_Director_Favorito (
id_socio INT,
id_director_favorito INT,

```
PRIMARY KEY (
    id_socio,
    id_director_favorito
),

FOREIGN KEY (id_socio)
REFERENCES Socio(id_socio),

FOREIGN KEY (id_director_favorito)
REFERENCES Director_Favorito(id_director_favorito)
```

);

CREATE TABLE Reparto_Pelicula (
titulo_pelicula VARCHAR(150),
director_pelicula VARCHAR(100),
anio_pelicula INT,
id_actor INT,

```
PRIMARY KEY (
    titulo_pelicula,
    director_pelicula,
    anio_pelicula,
    id_actor
),

FOREIGN KEY (
    titulo_pelicula,
    director_pelicula,
    anio_pelicula
)
REFERENCES Pelicula(
    titulo,
    director,
    anio
),

FOREIGN KEY (id_actor)
REFERENCES Actor(id_actor)
```

);

CREATE TABLE Alquiler (
id_socio INT,
titulo_pelicula VARCHAR(150),
director_pelicula VARCHAR(100),
anio_pelicula INT,
fecha_alquiler DATETIME,
fecha_devolucion DATETIME,

```
PRIMARY KEY (
    id_socio,
    titulo_pelicula,
    director_pelicula,
    anio_pelicula,
    fecha_alquiler
),

FOREIGN KEY (id_socio)
REFERENCES Socio(id_socio),

FOREIGN KEY (
    titulo_pelicula,
    director_pelicula,
    anio_pelicula
)
REFERENCES Pelicula(
    titulo,
    director,
    anio
)
```

);
