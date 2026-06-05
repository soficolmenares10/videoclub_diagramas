# Modelo Relacional del Videoclub

## ARCHIVADOR

PK: num_serie

Atributos:

* num_serie
* ubicacion
* num_estanterias
* fecha_compra

---

## PELICULA

PK:

* titulo
* director
* anio

FK:

* num_serie_archivador → ARCHIVADOR(num_serie)

Atributos:

* genero

---

## SOCIO

PK:

* id_socio

Atributos:

* nombre
* direccion
* telefono

---

## DIRECTOR_FAVORITO

PK:

* id_director_favorito

Atributos:

* nombre_director

---

## SOCIO_DIRECTOR_FAVORITO

PK:

* id_socio
* id_director_favorito

FK:

* id_socio → SOCIO(id_socio)
* id_director_favorito → DIRECTOR_FAVORITO(id_director_favorito)

---

## ACTOR

PK:

* id_actor

Atributos:

* nombre_actor

---

## REPARTO_PELICULA

PK:

* titulo_pelicula
* director_pelicula
* anio_pelicula
* id_actor

FK:

* (titulo_pelicula, director_pelicula, anio_pelicula)
  → PELICULA(titulo, director, anio)

* id_actor
  → ACTOR(id_actor)

---

## ALQUILER

PK:

* id_socio
* titulo_pelicula
* director_pelicula
* anio_pelicula
* fecha_alquiler

FK:

* id_socio → SOCIO(id_socio)

* (titulo_pelicula, director_pelicula, anio_pelicula)
  → PELICULA(titulo, director, anio)

Atributos:

* fecha_devolucion
