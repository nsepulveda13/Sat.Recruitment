# SAT Recruitment

El objetivo de esta prueba es refactorizar el código de este proyecto.
Se puede realizar cualquier cambio que considere necesario en el código y en los test.


## Requisitos 

- Todos los test deben pasar.
- El código debe seguir los principios de la programación orientada a objetos (SOLID, DRY, etc...).
- El código resultante debe ser mantenible y extensible.


## Modifaciones 

- Se agregaron mas unit test.
- Se dividio el codigo en 4 capas - DOMINIO - BUSSINES - DATA - API.
- Se uso patrones de diseño como strategy , factory .
- Se uso DTO pattern como buena practica para que el response y request se independiente del dominio.
- Se trato de usar DDD mediante el mediator .
- Se uso FluentValidation para las validacioens de campos.
- Se utulizo funcion para normalizar email.
- Se utilizo LINQ para hacer la consulta de campos duplicados.
