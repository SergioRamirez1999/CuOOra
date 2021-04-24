"
.
"
Class {
	#name : #Question,
	#superclass : #Post,
	#instVars : [
		'title',
		'topics',
		'answers'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Question class >> newWithAuthor: anUser title: aTitle text: aText topics: aTopics [
	^self new initializeWithAuthor: anUser title: aTitle text: aText topics: aTopics.
]

{ #category : #adding }
Question >> addAnswer: answer [
	answers add: answer.
	^answer.
]

{ #category : #accessing }
Question >> answers [ 
	^answers.
]

{ #category : #accessing }
Question >> answersSorted [
	 ^ answers sort: [ :a1 :a2 | a1 determineScore > a2 determineScore ].
]

{ #category : #initialization }
Question >> initialize [
	super initialize.
	topics := OrderedCollection new.
	answers := OrderedCollection new.
]

{ #category : #'instance creation' }
Question >> initializeWithAuthor: anUser title: aTitle text: aText topics: aTopics [
	self initializeWithAuthor: anUser text: aTitle.
	title := aTitle.
	topics:= aTopics.
	topics do: [ :each | each addQuestion: self ].
]

{ #category : #removing }
Question >> remove [ 	 
	self removeQuestionFromTopic.
	self removeUserAnswers.
	author removeQuestion: self.
	
	
]

{ #category : #removing }
Question >> removeAnswer: anAnswer [
	answers remove: anAnswer.
]

{ #category : #private }
Question >> removeQuestionFromTopic [
	topics do: [:each|each removeQuestion:self].
]

{ #category : #private }
Question >> removeUserAnswers [
	| lst |
	lst := OrderedCollection newFrom: answers.
	lst do: [ :each | each remove ].

]

{ #category : #accessing }
Question >> title [ 
	^title.
]

{ #category : #accessing }
Question >> title: aTitle [
	title:=aTitle.
]

{ #category : #accessing }
Question >> topics [
	^topics.
]
