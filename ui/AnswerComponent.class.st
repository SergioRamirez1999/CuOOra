Class {
	#name : #AnswerComponent,
	#superclass : #PostComponent,
	#category : #'CuOOra-ui'
}

{ #category : #'instance creation' }
AnswerComponent class >> answer: anAnswer parent: aParent canRemove: aCondition [
	^ ( self new answer: anAnswer parent: aParent canRemove: aCondition ).
]

{ #category : #'instance creation' }
AnswerComponent >> answer: anAnswer parent: aParent canRemove: aCondition [
	self post: anAnswer parent: aParent canRemove: aCondition.
]

{ #category : #private }
AnswerComponent >> renderAuthorOn: aCanvas [
	aCanvas 
		div: [
			aCanvas span: 'Respuesta de '. 
			aCanvas anchor
				callback: [ self renderUserProfileComponent ];
				with: ( post author username ).
		]
			
]

{ #category : #private }
AnswerComponent >> renderContentOn: aCanvas [
	aCanvas div class: 'post-container'; style: 'margin-left: 40px; background-color: rgba(217, 0, 36, 0.8)'; with: [
		canRemove
		ifTrue: [ self renderRemoveButtonOn: aCanvas. ].
		self renderAuthorOn: aCanvas.
		self renderTextOn: aCanvas.
		self renderQualificationsOn: aCanvas.
		self renderQualificationButtonsOn: aCanvas.
	].

]

{ #category : #private }
AnswerComponent >> renderTextOn: aCanvas [
	aCanvas div: [ 
		aCanvas span: (post text).
	]
	

]
