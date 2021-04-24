"
.
"
Class {
	#name : #Answer,
	#superclass : #Post,
	#instVars : [
		'question'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Answer class >> newWithAuthor: anUser question: aQuestion text: aText [
	^ self new initializeWithAuthor: anUser question: aQuestion  text: aText.
]

{ #category : #'instance creation' }
Answer >> initializeWithAuthor: anUser question: aQuestion text: aText [
	self initializeWithAuthor: anUser text: aText.
	question:=aQuestion.
]

{ #category : #accessing }
Answer >> question [
	^question.
]

{ #category : #removing }
Answer >> remove [
	author removeAnswer: self.
	question removeAnswer: self.
	
	
]
