"
.
"
Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'users',
		'topics'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
CuOOra class >> clearUniqueInstance [
	uniqueInstance := nil.
]

{ #category : #'instance creation' }
CuOOra class >> uniqueInstance [
	uniqueInstance ifNil: [ uniqueInstance := self new ].
	^ uniqueInstance.
]

{ #category : #adding }
CuOOra >> addTopic: aTopic [
	topics add: aTopic.
	^ aTopic.
	
]

{ #category : #adding }
CuOOra >> addUser: aUser [
	users add: aUser.
	^ aUser.
	
]

{ #category : #accessing }
CuOOra >> clamp: aValue min: aMin max: aMax [
	((aValue > aMin) & (aValue < aMax))
		ifTrue: [ ^ aValue ].
	(aValue <= aMin)
		ifTrue: [ ^ aMin ].
	(aValue >= aMax)
		ifTrue: [ ^ aMax ].
]

{ #category : #find }
CuOOra >> findTopics: aCollection [
	"los topicos de la coleccion por parametro son los que se ingresan, tengo que ver si efectivamente estan en topicos"
	^topics select: [ :each | aCollection includes: each name asUppercase ]
]

{ #category : #initialization }
CuOOra >> initialize [
	topics:= OrderedCollection new.
	users:= OrderedCollection new.
	self initializeState.
]

{ #category : #private }
CuOOra >> initializeState [
	| u1 u2 u3 q1 q2 t1 t2 t3 a1 a2 lt|
	
	" CREACION DE USERS "
	u1 := User newWithUsername: 'pedro@cuoora.com' password: 'pedro@cuoora.com'.
	u2 := User newWithUsername: 'diego@cuoora.com' password: 'diego@cuoora.com'.
	u3 := User newWithUsername: 'juan@cuoora.com' password: 'juan@cuoora.com'.
	
	" SEGUIMIENTO DE USERS "
	u1 follow: u3.
	u3 follow: u2.
	
	" CREACION DE TOPICS "
	t1 := Topic newWithName: 'OO1' description: 'OO1'.
	t2 := Topic newWithName: 'Test de unidad' description: 'Test de unidad'.
	t3 := Topic newWithName: 'Smalltalk' description: 'Smalltalk'.
	
	
	" CREACION DE QUESTIONS "
	
	lt := OrderedCollection new.
	lt add: t1.
	lt add: t2.
	
	q1 := Question 
				newWithAuthor: u1 
				title: '¿Para qué sirve el método SetUp?' 
				text: '¿Para qué sirve el método SetUp?'
				topics:  lt.
	
	lt := OrderedCollection new.
	lt add: t1.
	lt add: t3.	
		
	q2 := Question 
				newWithAuthor: u2 
				title: '¿Qué significa #messageNotUnderstood?' 
				text: '¿Qué significa #messageNotUnderstood?'
				topics:  lt.
	
	
	" CREACION DE ANSWERS "
	
	a1 := Answer 
				newWithAuthor: u2
				question: q1
				text: 'Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test'.

	a2 := Answer 
				newWithAuthor: u1
				question: q2
				text: 'Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta'.

	

	" REFERENCIAS USERS -> TOPICS "
	
	u1 addInterestTopic: t1.
	u1 addInterestTopic: t2.
	
	u2 addInterestTopic: t1.
	u2 addInterestTopic: t3.
	
	
	" REFERENCIAS USERS -> QUESTIONS "
	
	u1 addQuestion: q1.
	u2 addQuestion: q2.
	
	
	" REFERENCIAS USERS -> ANSWERS "
	
	u2 addAnswer: a1.
	u1 addAnswer: a2.
	

	" REFERENCIAS USERS -> ANSWERS "
	
	q1 addAnswer: a1.
	q2 addAnswer: a2.
	
	self users add: u1.
	self users add: u2.
	self users add: u3.
	
	self topics add: t1.
	self topics add: t2.
	self topics add: t3.
	
]

{ #category : #accessing }
CuOOra >> loginWithUsername: anUsername password: aPassword [
	^ users
		detect: [ :each | each username = anUsername & (each password = aPassword) ]
		ifNone: [ nil ]
]

{ #category : #accessing }
CuOOra >> topics [
	^ topics
]

{ #category : #accessing }
CuOOra >> users [
	^ users
]
