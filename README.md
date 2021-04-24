# ORIENTACIÓN A OBJETOS 2 - AÑO 2021 - Facultad de Informatica - UNLP - MODELADO E IMPLEMENTACIÓN DE SISTEMA CUOORA, WEB DE PREGUNTAS Y RESPUESTAS.

### Dependencias
* Pharo 8.0
* Seaside3

### Instalación
1. Hacer filein del .st
2. Desplegar un ZnZincServerAdaptor en puerto 8080
3. Evaluar la siguiente expresión en el playground:
    * application := WAAdmin register: LoginComponent asApplicationAt: 'cuoora'.
application sessionClass: SessionWithUser.
CuOOra clearUniqueInstance.
