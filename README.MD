# Sistema de Gestión de Videoclub

## Descripción General

El presente proyecto consiste en el diseño de una base de datos para la gestión de un videoclub. El sistema permite administrar la información de los socios, las películas disponibles, los actores que participan en cada película, los directores favoritos de los socios, los archivadores donde se almacenan físicamente las películas y el historial de alquileres realizados.

El objetivo principal es garantizar una adecuada organización de la información y mantener la integridad de los datos mediante la implementación de claves primarias y foráneas.

---

# 1. Interpretación del Problema

El videoclub necesita almacenar y gestionar información relacionada con:

* Los socios registrados.
* Las películas disponibles para alquiler.
* Los directores favoritos de cada socio.
* Los actores que forman parte del reparto de las películas.
* Los archivadores donde se almacenan las películas.
* El historial de alquileres realizados por los socios.

La base de datos debe permitir consultar fácilmente esta información y garantizar que las relaciones entre las entidades sean consistentes.

---

# 2. Identificación de Entidades y Atributos

## Entidad: Socio

### Atributos

* id_socio (PK)
* nombre
* direccion
* telefono

---

## Entidad: Pelicula

### Atributos

* titulo (PK)
* director (PK)
* anio (PK)
* genero
* num_serie_archivador (FK)

---

## Entidad: Archivador

### Atributos

* num_serie (PK)
* ubicacion
* num_estanterias
* fecha_compra

---

## Entidad: Actor

### Atributos

* id_actor (PK)
* nombre_actor

---

## Entidad: Director_Favorito

### Atributos

* id_director_favorito (PK)
* nombre_director

---

# 3. Relaciones y Cardinalidades

## Archivador – Pelicula

### Cardinalidad

1 : N

### Justificación

Un archivador puede almacenar muchas películas, pero cada película pertenece únicamente a un archivador.

---

## Pelicula – Actor

### Cardinalidad

N : M

### Justificación

Una película puede tener varios actores y un actor puede participar en varias películas.

Esta relación se resuelve mediante la tabla intermedia Reparto_Pelicula.

---

## Socio – Director Favorito

### Cardinalidad

N : M

### Justificación

Un socio puede tener varios directores favoritos y un director puede ser favorito de varios socios.

Esta relación se resuelve mediante la tabla intermedia Socio_Director_Favorito.

---

## Socio – Pelicula

### Cardinalidad

N : M

### Justificación

Un socio puede alquilar muchas películas y una misma película puede ser alquilada por distintos socios a lo largo del tiempo.

Esta relación se resuelve mediante la tabla Alquiler.

---

# 4. Transformación al Modelo Relacional

Las relaciones de muchos a muchos fueron transformadas en tablas intermedias:

* Reparto_Pelicula
* Socio_Director_Favorito
* Alquiler

Los atributos multivaluados fueron normalizados para cumplir con la Primera Forma Normal (1FN).

---

# 5. Decisiones de Diseño

## Uso de Clave Primaria Compuesta en Pelicula

La entidad Pelicula utiliza una clave primaria compuesta por:

* titulo
* director
* anio

Esta decisión se tomó porque pueden existir películas con el mismo título. La combinación de estos tres atributos permite identificar de forma única cada película.

---

## Uso de Tablas Intermedias

Se crearon tablas asociativas para representar relaciones N:M:

* Reparto_Pelicula
* Socio_Director_Favorito
* Alquiler

---

## Integridad Referencial

Se implementaron claves foráneas para garantizar la consistencia entre las entidades relacionadas.

Esto evita:

* Películas asociadas a archivadores inexistentes.
* Alquileres de películas no registradas.
* Relaciones con actores inexistentes.
* Relaciones con directores inexistentes.

---

# Resultado Final

La base de datos diseñada cumple con los requerimientos planteados para la gestión de un videoclub y mantiene una estructura normalizada que facilita el almacenamiento y consulta eficiente de la información.
