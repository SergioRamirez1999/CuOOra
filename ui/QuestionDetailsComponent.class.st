Class {
	#name : #QuestionDetailsComponent,
	#superclass : #ComponentWithHeaderAndBack,
	#instVars : [
		'question'
	],
	#category : #'CuOOra-ui'
}

{ #category : #services }
QuestionDetailsComponent class >> question: aQuestion parent: aParent [
	self initialize.
	^ (self new question: aQuestion parent: aParent).
]

{ #category : #'instance creation' }
QuestionDetailsComponent >> question: aQuestion parent: aParent [
	self parent: aParent.
	question := aQuestion.
]

{ #category : #private }
QuestionDetailsComponent >> renderAnswersOn: aCanvas [
	aCanvas div: [
		aCanvas horizontalRule.
		question answers 
			do: [ :an | 
				aCanvas render: (AnswerComponent answer: an parent: self canRemove: true).
				aCanvas horizontalRule.
			].
		aCanvas div style: 'text-align: center'; with: [ 
			aCanvas span style: 'color: #fff'; with: 'No hay más respuestas.'.
		].
		self renderNewAnswerButtonOn: aCanvas.
	]
		
]

{ #category : #private }
QuestionDetailsComponent >> renderContentOn: aCanvas [
	self renderHeaderOn: aCanvas.
	self renderBackButtonOn: aCanvas.
	aCanvas render: (QuestionComponent question: question parent: self canRemove: false).
	self renderAnswersOn: aCanvas.
]

{ #category : #private }
QuestionDetailsComponent >> renderNewAnswerButtonOn: aCanvas [
	aCanvas anchor class: 'btn-new-post'; style: 'text-decoration: none';
		callback: [ self renderNewAnswerComponent ];
		with: '+'.
	
	
]

{ #category : #private }
QuestionDetailsComponent >> renderNewAnswerComponent [
	self call: (NewAnswerComponent question: question parent: self).
]
