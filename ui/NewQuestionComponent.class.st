Class {
	#name : #NewQuestionComponent,
	#superclass : #ComponentWithHeaderAndBack,
	#instVars : [
		'question',
		'nqTitle',
		'nqText',
		'nqTopics'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
NewQuestionComponent class >> parent: aParent [
	self initialize.
	^ (self new parent: aParent).
]

{ #category : #private }
NewQuestionComponent >> accept [
	nqTitle isNotEmpty & nqText isNotEmpty
		& (self topics: nqTopics) isNotEmpty
		ifFalse: [ ^ self ].
	question := Question newWithAuthor: self session user title: nqTitle text: nqText topics: (self topics: nqTopics).
	self session user addQuestion: question.
	self call: HomeComponent new.
]

{ #category : #private }
NewQuestionComponent >> model [
	^ CuOOra uniqueInstance.
]

{ #category : #private }
NewQuestionComponent >> nqText [
	^ nqText
]

{ #category : #private }
NewQuestionComponent >> nqText: anObject [
	nqText := anObject
]

{ #category : #private }
NewQuestionComponent >> nqTitle [
	^ nqTitle
]

{ #category : #private }
NewQuestionComponent >> nqTitle: anObject [
	nqTitle := anObject
]

{ #category : #private }
NewQuestionComponent >> nqTopics [
	^ nqTopics
]

{ #category : #private }
NewQuestionComponent >> nqTopics: anObject [
	nqTopics := anObject
]

{ #category : #private }
NewQuestionComponent >> renderAcceptButtonOn: aCanvas [
	aCanvas button class: 'btn-accept';
		callback: [ self accept ];
		with: 'Aceptar'
]

{ #category : #private }
NewQuestionComponent >> renderButtonsOn: aCanvas [ 
	self renderAcceptButtonOn: aCanvas.

]

{ #category : #private }
NewQuestionComponent >> renderContentOn: aCanvas [
	self renderHeaderOn: aCanvas.
	self renderBackButtonOn: aCanvas.
	aCanvas div style: 'text-align: center'; with: [
		aCanvas heading level1 with: 'Nueva pregunta'.	
	].
	aCanvas div class: 'wrapper'; with: [
		aCanvas div class: 'new-question-form'; with: [ 
			aCanvas form: [ 
				self renderInputElementsOn: aCanvas.
				self renderButtonsOn: aCanvas
			].
		].
	].
]

{ #category : #private }
NewQuestionComponent >> renderInputElementsOn: aCanvas [
	aCanvas div class: 'input-fields'; with: [
		(aCanvas textInput class: 'input'; on: #nqTitle of: self) 
			placeholder: 'Escriba aqui el titulo de su pregunta'.

		(aCanvas textInput class: 'input'; on: #nqTopics of: self) 
			placeholder: 'Topicos: ', (', ' join: (self model topics collect: [:t | t name])).
	].
	aCanvas div class: 'msg'; with: [
		(aCanvas textArea on: #nqText of: self) placeholder: 'Escriba aqui el desarrollo de su pregunta'.
	].
]

{ #category : #private }
NewQuestionComponent >> topics: topicsNames [
	^self model findTopics: (((topicsNames asUppercase)trim) findTokens: ',')
]
