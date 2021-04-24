"
application := WAAdmin register: LoginComponent asApplicationAt: 'cuoora'.
application sessionClass: SessionWithUser.

CuOOra clearUniqueInstance.
"
Class {
	#name : #HomeComponent,
	#superclass : #ComponentWithHeader,
	#instVars : [
		'latestQuestions'
	],
	#category : #'CuOOra-ui'
}

{ #category : #private }
HomeComponent >> createNewQuestion [
	self call: (NewQuestionComponent parent: self).
]

{ #category : #initialization }
HomeComponent >> initialize [
	| max |
	super initialize.
	max := self session user getRelevantQuestions size.
	latestQuestions := (self session user getRelevantQuestions) first: (CuOOra uniqueInstance clamp: 5 min: 0 max: max).
	latestQuestions sort: [ :q1 :q2 | q1 createAt > q2 createAt ].
]

{ #category : #private }
HomeComponent >> model [
	^ CuOOra uniqueInstance.
]

{ #category : #private }
HomeComponent >> renderContentOn: aCanvas [
	self renderHeaderOn: aCanvas.
	aCanvas div class: 'body-container'; with: [
		aCanvas 
			heading level1 with: 'Ultimas Preguntas'.
		aCanvas div class: 'posts-container'; with: [ 
			self renderLatestQuestionsOn: aCanvas.
		].
		self renderNewQuestionButtonOn: aCanvas.
	].
]

{ #category : #private }
HomeComponent >> renderLatestQuestionsOn: aCanvas [
	latestQuestions do: [ :q | aCanvas render: (QuestionComponent question: q parent: self canRemove: false) ].
				
		

	
]

{ #category : #private }
HomeComponent >> renderNewQuestionButtonOn: aCanvas [
	aCanvas anchor class: 'btn-new-post'; style: 'text-decoration: none';
		callback: [ self createNewQuestion ];
		with: '+'.
	
]
