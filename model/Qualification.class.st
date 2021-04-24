Class {
	#name : #Qualification,
	#superclass : #Object,
	#instVars : [
		'condition',
		'createAt',
		'author'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Qualification class >> newWithCondition: aCondition author: anAuthor [
	^ self new initializeWithCondition: aCondition author: anAuthor.
]

{ #category : #accessing }
Qualification >> author [
	^ author
]

{ #category : #accessing }
Qualification >> condition [
	^ condition
]

{ #category : #accessing }
Qualification >> createAt [
	^ createAt
]

{ #category : #initialization }
Qualification >> initialize [
	createAt := DateAndTime now.
]

{ #category : #'instance creation' }
Qualification >> initializeWithCondition: aCondition author: anAuthor [
	condition := aCondition.
	author := anAuthor.
	
]

{ #category : #accessing }
Qualification >> toggleCondition [
	"Metodo para alternar la condicion. Funcionalidad cambiar de like a dislike o viceversa."
	condition := condition not.
	createAt := DateAndTime now.
	^ condition.
]
