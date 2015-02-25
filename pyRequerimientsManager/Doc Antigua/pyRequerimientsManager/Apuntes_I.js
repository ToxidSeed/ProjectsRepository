Agregar o Quitar Flujos

1.- Cuando se agrega, se necesita conocer la información
	- Tipo de Flujo
	- Numero de Flujo
	- Cantidad de Pasos
	- Ultimo Indice
2.- Cuando se Quita un paso, se necesita conocer la informacion
	- Tipo de Flujo
	- Numero de Flujo
	- Cantidad de Pasos
	- Ultimo Indice
	
	2.1.- Se necesita actualizar la informacion
		2.1.- Reducir en 1 el ultimo indice
		2.2.- Reducir en 1 el Numero de Pasos
		2.3.- Reenumerar los Pasos (de ser requerido)		
		2.4.- Si se elimina un paso y en la agrupacion de Flujo + Numero de Flujo ya no hay ningun paso, entonces:
			2.4.1.- Reenumerar los numero de flujos para el tipo de Flujo Eliminado
			2.4.2.- Renombrar los flujos pertenecientes al tipo de flujo eliminado
			
			
WorkFloInfo:[
	{
		TipoFlujoId: 0,
		NumeroFlujo: 0,
		CtdPasos: 0,
		UltimoIndice: -1
	}
]			

Caso 1: Agregar Flujo Principal

WorkFloInfo:[
	{
		TipoFlujoId: 1,
		NumeroFlujo: 1,
		CtdPasos: 1,
		UltimoIndice: 0
	}
]

Caso 2: Agregar Flujo Alternativo en el paso 1 al Flujo Principal

WorkFloInfo:[
	{
		TipoFlujoId: 1,
		NumeroFlujo: 1,
		CtdPasos: 1,
		UltimoIndice: 0
	},
	{
		TipoFlujoId: 2,
		NumeroFlujo: 1,
		CtdPasos: 1,
		UltimoIndice: 1
	}
]

Caso 3: Quitar Paso del Flujo Alternativo en el paso 1 al Flujo Principal
Si CtdPasos = 0; 

1.- Reenumerar los flujos del tipo de flujo eliminado
2.- Renombrar el nombre de los flujos
3.- Quitar de WorkFlowInfo la agrupación

Caso 4: No se puede quitar aquellos pasos en los que haya otro flujo relacionado al mismo
Caso 5: Si existen Flujos de Excepcion o Alternativos tiene que existir al menos un flujo principal(No puede ser eliminado)

Algoritmo:
1.- Si se elimina un tipo de Flujo 2:
1.- Para todos aquellos Tipos de Flujo 2 Reenumerar.

Reenumerado:








			
