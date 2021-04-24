Class {
	#name : #User,
	#superclass : #Object,
	#instVars : [
		'username',
		'password',
		'answers',
		'questions',
		'createAt',
		'following',
		'interestTopics'
	],
	#category : #'CuOOra-model'
}

{ #category : #'instance creation' }
User class >> newWithUsername: anUsername password: aPassword [
	^self new initializeWithUsername: anUsername password: aPassword.
]

{ #category : #adding }
User >> addAnswer: answer [
	answers add: answer.
	^ answer.
]

{ #category : #adding }
User >> addInterestTopic: topic [
	interestTopics add: topic.
	^ topic.
]

{ #category : #adding }
User >> addQuestion: question [
	questions add: question.
	^ question.
]

{ #category : #accessing }
User >> answers [
	^ answers
]

{ #category : #private }
User >> answersScore [
	^(answers select: [ :each | each question author ~= self ]) size * 50.
]

{ #category : #accessing }
User >> createAt [
	^ createAt
]

{ #category : #accessing }
User >> determineScore [
	^(self questionsScore + self answersScore)	
		+ (questions sumNumbers: [ :q | q determineScore ]) 
		+ (answers sumNumbers: [ :a | a determineScore ]).
]

{ #category : #adding }
User >> follow: user [
	following add: user.
	^ user.
]

{ #category : #accessing }
User >> following [
	^ following
]

{ #category : #accessing }
User >> followingAt: user [
	^ following includes: user.
]

{ #category : #accessing }
User >> getRelevantQuestions [
	| relevantQuestions |
	relevantQuestions := OrderedCollection new.
	interestTopics do: [ :topic | relevantQuestions addAll: topic questions ].
	following do: [ :user | relevantQuestions addAll: user questions ].
	^ relevantQuestions removeDuplicates.
]

{ #category : #initialization }
User >> initialize [
	createAt := DateAndTime now.
	following := OrderedCollection new.
	answers := OrderedCollection new.
	questions := OrderedCollection new.
	interestTopics := OrderedCollection new.
]

{ #category : #'instance creation' }
User >> initializeWithUsername: anUsername password: aPassword [
	username := anUsername.
	password := aPassword.
	
	
	
]

{ #category : #accessing }
User >> interestTopics [
	^ interestTopics
]

{ #category : #accessing }
User >> password [
	^ password
]

{ #category : #accessing }
User >> password: anObject [
	password := anObject
]

{ #category : #accessing }
User >> questions [
	^ questions
]

{ #category : #private }
User >> questionsScore [
	^ (questions size * 20)
	
]

{ #category : #removing }
User >> removeAnswer: anAnswer [
	answers remove: anAnswer.
	^ anAnswer.
]

{ #category : #removing }
User >> removeQuestion: aQuestion [
	questions remove: aQuestion.
	^ aQuestion.
]

{ #category : #accessing }
User >> unfollow: user [
	(self followingAt: user)
		ifFalse: [ ^ self ].
	following remove: user.
	^ user.
]

{ #category : #accessing }
User >> username [
	^ username
]
