Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'name',
		'description',
		'questions'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Topic class >> newWithName: aName description: aDescription [
	^self new initializeWithName: aName description: aDescription.
	 
]

{ #category : #adding }
Topic >> addQuestion: question [ 
	questions add: question.
	^question.
	
	
	
]

{ #category : #accessing }
Topic >> description [ 	
	^description.
]

{ #category : #initialization }
Topic >> initialize [
	questions := OrderedCollection new.
]

{ #category : #initialization }
Topic >> initializeWithName:aName description:aDescription [
	name:=aName.
	description:=aDescription.
]

{ #category : #accessing }
Topic >> name [
	^name.
]

{ #category : #accessing }
Topic >> questions [ 	
	^questions.
]

{ #category : #removing }
Topic >> removeQuestion: aQuestion [
	questions remove: aQuestion.
	^ aQuestion.

]
