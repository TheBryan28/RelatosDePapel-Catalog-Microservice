# Documentación de la API - Microservicio de Catálogo (Catalog)

Este microservicio se encarga de la gestión del catálogo de suministros (libros) de la librería **Relatos de Papel**, incluyendo el CRUD de libros, filtros de búsqueda dinámicos, paginación y la gestión de opiniones (reseñas) de los usuarios.

---

## Endpoints de la API

A continuación se detallan todos los endpoints disponibles en el microservicio. Todas las rutas locales tienen el prefijo base `/api/v1/` (si accedes a través del Gateway, debes anteponer `/catalog/api/v1/`).

### 1. Gestión de Libros (Supplies)

| Método | Endpoint | Descripción | Request Body | Response |
| :--- | :--- | :--- | :--- | :--- |
| **GET** | `/api/v1/supplies` | Obtener listado de libros (con soporte para filtros de búsqueda y paginación). | Ninguno | `GetSuppliesResponseDto` (Lista de `SupplyDto`) |
| **GET** | `/api/v1/supplies/{id}` | Obtener el detalle completo de un libro específico (incluye imágenes y especificaciones). | Ninguno | `GetSupplyResponseDto` (Detalle de libro) |
| **POST** | `/api/v1/supplies` | Crear y registrar un nuevo libro en el catálogo. | `WriteSupplyRequestDto` (JSON con datos del libro) | `GetSupplyResponseDto` (Libro creado, HTTP 200 OK) |
| **PUT** | `/api/v1/supplies/{id}` | Reemplazar y actualizar completamente los datos de un libro existente. | `WriteSupplyRequestDto` (JSON completo) | `GetSupplyResponseDto` (Libro modificado) |
| **PATCH** | `/api/v1/supplies/{id}` | Modificar parcialmente uno o varios atributos de un libro (ej: stock). | JSON parcial (ej: `{"stock": 10}`) | `GetSupplyResponseDto` (Libro actualizado) |
| **DELETE** | `/api/v1/supplies/{id}` | Eliminar de forma lógica/física un libro del catálogo. | Ninguno | Vacío (HTTP 244 No Content) |

### 2. Gestión de Opiniones (Reviews)

| Método | Endpoint | Descripción | Request Body | Response |
| :--- | :--- | :--- | :--- | :--- |
| **GET** | `/api/v1/supplies/{supplyId}/reviews` | Obtener todas las opiniones y valoraciones dejadas por los usuarios para un libro específico. | Ninguno | Lista de `ReviewDto` |
| **POST** | `/api/v1/supplies/{supplyId}/reviews` | Agregar una nueva opinión y valoración (de 0 a 5 estrellas) para un libro. | `CreateReviewRequestDto` (JSON con rating, comment, userId) | `ReviewDto` (Opinión creada, HTTP 201 Created) |
| **PUT** | `/api/v1/reviews/{reviewId}` | Modificar el comentario o la puntuación de una opinión previamente realizada. | `CreateReviewRequestDto` (JSON parcial/completo) | `ReviewDto` (Opinión modificada) |
| **DELETE** | `/api/v1/reviews/{reviewId}` | Eliminar una opinión y recalcular el promedio de calificaciones del libro. | Ninguno | Vacío (HTTP 204 No Content) |

---

## Modelos de Datos (DTOs)

### `WriteSupplyRequestDto` (Ejemplo de creación de suministro)
```json
{
  "title": "Cien años de soledad",
  "isbn": "9780307474728",
  "description": "Una obra maestra de la literatura hispanoamericana.",
  "author": "Gabriel García Márquez",
  "format": "PHYSICAL",
  "price": 18.50,
  "stock": 25,
  "isActive": true,
  "specificationDtos": [
    {
      "specKey": "pages",
      "specValue": "496"
    },
    {
      "specKey": "language",
      "specValue": "Español"
    }
  ],
  "images": [
    "https://example.com/portada.jpg"
  ]
}
```

### `CreateReviewRequestDto` (Ejemplo de creación de opinión)
```json
{
  "rating": 4.5,
  "comment": "Un libro fascinante, sumamente recomendado.",
  "userId": 1
}
```

### `ReviewDto` (Ejemplo de respuesta de opinión)
```json
{
  "id": 1,
  "bookId": 5,
  "rating": 4.50,
  "comment": "Un libro fascinante, sumamente recomendado.",
  "userId": 1,
  "createdAt": "2026-05-26T17:50:00",
  "updatedAt": "2026-05-26T17:50:00"
}
```

