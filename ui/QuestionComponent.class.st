Class {
	#name : #QuestionComponent,
	#superclass : #PostComponent,
	#category : #'CuOOra-ui'
}

{ #category : #'instance creation' }
QuestionComponent class >> question: aQuestion parent: aParent canRemove: aCondition [
	^ (self new
			question: aQuestion
			parent: aParent
			canRemove: aCondition;
			yourself).
]

{ #category : #'instance creation' }
QuestionComponent >> question: aQuestion parent: aParent canRemove: aCondition [
	self post: aQuestion parent: aParent canRemove: aCondition.
]

{ #category : #private }
QuestionComponent >> renderAuthorOn: aCanvas [
	aCanvas 
		div: [
			aCanvas span: 'Realizada por '. 
			aCanvas anchor
				callback: [ self renderUserProfileComponent ];
				with: ( post author username ).
			aCanvas span:  ( ' | ' , post answers size asString, ' respuestas' ).
		]
			
]

{ #category : #private }
QuestionComponent >> renderContentOn: aCanvas [
	aCanvas div class: 'post-container'; with: [
		canRemove
			ifTrue: [ self renderRemoveButtonOn: aCanvas. ].
		self renderTitleOn: aCanvas.
		self renderTopicsOn: aCanvas.
		self renderAuthorOn: aCanvas.
		self renderQualificationsOn: aCanvas.
		self renderQualificationButtonsOn: aCanvas.
	].
	
]

{ #category : #private }
QuestionComponent >> renderQuestionDetailsComponent [
	parent call: (QuestionDetailsComponent question: post parent: parent).
]

{ #category : #private }
QuestionComponent >> renderTitleOn: aCanvas [
	aCanvas anchor
		callback: [ self renderQuestionDetailsComponent ];
		with: [ aCanvas heading level3 with: post title ].
		
		
]

{ #category : #private }
QuestionComponent >> renderTopicsOn: aCanvas [
	aCanvas div: [ 
			aCanvas span with: 'Topicos: ' , (', ' join: (post topics collect: [ :t | t name ])).
	]
]
