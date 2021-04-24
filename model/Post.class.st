Class {
	#name : #Post,
	#superclass : #Object,
	#instVars : [
		'text',
		'createAt',
		'author',
		'qualifications'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
Post class >> newWithAuthor: anUser text: aText [
	^self new initializeWithAuthor: anUser text: aText.
]

{ #category : #adding }
Post >> addQualification: aQualification [
	qualifications add: aQualification.
	^ aQualification.
]

{ #category : #accessing }
Post >> author [
	^ author
]

{ #category : #accessing }
Post >> createAt [
	^ createAt
]

{ #category : #accessing }
Post >> determineScore [
	^(self getLikes - self getDislikes).
]

{ #category : #accessing }
Post >> getDislikes [
	^(qualifications reject: [ :each | each condition]) size.
]

{ #category : #accessing }
Post >> getLikes [
	^(qualifications select: [ :each | each condition ]) size.
]

{ #category : #initialization }
Post >> initialize [
	createAt := DateAndTime now.
	qualifications := OrderedCollection new.
]

{ #category : #'instance creation' }
Post >> initializeWithAuthor: anUser text: aText [
	author := anUser.
	text := aText.
	
]

{ #category : #accessing }
Post >> isQualifiedBy: anUser [
	| qTemp |
	qTemp :=	qualifications detect: [ :q | q author = anUser ] ifNone: [ qTemp := nil ].
	^ qTemp.
	
		
]

{ #category : #accessing }
Post >> qualifications [
	^ qualifications
]

{ #category : #removing }
Post >> remove [
	self subclassResponsibility.
]

{ #category : #removing }
Post >> removeQualification: qualification [
	qualifications remove: qualification.
	
]

{ #category : #accessing }
Post >> text [
	^ text
]

{ #category : #accessing }
Post >> text: anObject [
	text := anObject
]
