Class {
	#name : #NewAnswerComponent,
	#superclass : #ComponentWithHeaderAndBack,
	#instVars : [
		'question',
		'answer',
		'nqText'
	],
	#category : #'CuOOra-ui'
}

{ #category : #services }
NewAnswerComponent class >> question: aQuestion parent: aParent [
	self initialize.
	^ (self new question: aQuestion parent: aParent).
]

{ #category : #private }
NewAnswerComponent >> accept [
	nqText isEmpty
		ifTrue: [ ^ self ].
	answer := Answer newWithAuthor: self session user question: question text: nqText.
	"ver de automatizar las ligaduras"
	self session user addAnswer: answer.
	question addAnswer: answer.
	self answer.
]

{ #category : #private }
NewAnswerComponent >> cancel [
	self answer.
]

{ #category : #private }
NewAnswerComponent >> nqText [
	^ nqText
]

{ #category : #private }
NewAnswerComponent >> nqText: anObject [
	nqText := anObject
]

{ #category : #'instance creation' }
NewAnswerComponent >> question: aQuestion parent: aParent [
	self parent: aParent.
	question := aQuestion.
]

{ #category : #private }
NewAnswerComponent >> renderContentOn: aCanvas [
	self renderHeaderOn: aCanvas.
	self renderBackButtonOn: aCanvas.
	aCanvas render: (QuestionComponent question: question parent: self canRemove: false).
	aCanvas horizontalRule.
	aCanvas heading level2 with: 'Agregar respuesta'.
	aCanvas form: [ self renderNewAnswerForm: aCanvas ].

]

{ #category : #private }
NewAnswerComponent >> renderNewAnswerForm: aCanvas [
	
	aCanvas div style: 'background: rgba(0,0,0,0.8); padding: 30px; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.3);'; with: [
		aCanvas div class: 'msg'; with: [  
			(aCanvas textArea style: 'height: 100px'; on: #nqText of: self) placeholder: 'Escriba aqui el contenido'.
		].
	
		aCanvas button class: 'btn-accept'; style: 'width: 200px';
			callback: [ self accept ];
			with: 'Aceptar'.
	].

		

]
