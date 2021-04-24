Class {
	#name : #PostComponent,
	#superclass : #WAComponent,
	#instVars : [
		'post',
		'qualification',
		'parent',
		'canRemove'
	],
	#category : #'CuOOra-ui'
}

{ #category : #protected }
PostComponent >> addDislike [
	qualification isNotNil 
		ifTrue: [ 
			"EXISTE CALIFICACION DEL USUARIO"
			qualification condition
				ifFalse: [ 
					"HAY UN DISLIKE, QUITO LA CALIFICACION"
					post removeQualification: qualification.
				]
				ifTrue: [ 
					"HAY UN LIKE, CAMBIO LA CONDICION"
					qualification toggleCondition.
				]
		 ]
		ifFalse: [ 
			"NO EXISTE CALIFICACION DEL USUARIO"
			post addQualification: (Qualification newWithCondition: false author: self session user).
		].
]

{ #category : #protected }
PostComponent >> addLike [
	qualification isNotNil 
		ifTrue: [ 
			"EXISTE CALIFICACION DEL USUARIO"
			qualification condition
				ifTrue: [ 
					"HAY UN LIKE, QUITO LA CALIFICACION"
					post removeQualification: qualification.
				]
				ifFalse: [ 
					"HAY UN DISLIKE, CAMBIO LA CONDICION"
					qualification toggleCondition.
				]
		]
		ifFalse: [ 
			"NO EXISTE CALIFICACION DEL USUARIO"
			post addQualification: (Qualification newWithCondition: true author: self session user).

		].
]

{ #category : #'instance creation' }
PostComponent >> post: aPost parent: aParent canRemove: aCondition [
	post := aPost.
	parent := aParent.
	canRemove := aCondition.
	qualification := post isQualifiedBy: self session user.
]

{ #category : #protected }
PostComponent >> remove [
	(post author = self session user)
		ifFalse: [ ^ self ].
	post remove.
	self renderUserProfileComponent.
]

{ #category : #protected }
PostComponent >> renderAuthorOn: aCanvas [
	^ self subclassResponsibility.
]

{ #category : #protected }
PostComponent >> renderContentOn: aCanvas [
	^ self subclassResponsibility.
]

{ #category : #protected }
PostComponent >> renderQualificationButtonsOn: aCanvas [
	aCanvas
		div: [
			aCanvas anchor
				callback: [ self addLike ];
				with: [ aCanvas button class: 'btn-lk-dlk'; with: 'Like' ].
			aCanvas anchor
				callback: [ self addDislike ];
				with: [ aCanvas button class: 'btn-lk-dlk'; with: 'Dislike' ] 
		] 
]

{ #category : #protected }
PostComponent >> renderQualificationsOn: aCanvas [
	aCanvas span: post getLikes asString , ' likes | ' , post getDislikes asString , ' dislikes'.
]

{ #category : #protected }
PostComponent >> renderRemoveButtonOn: aCanvas [
	(post author = self session user)
		ifFalse: [ ^ self ].
	aCanvas anchor class: 'btn-remove-post';
		callback: [ self remove ];
		with: 'X'.
]

{ #category : #protected }
PostComponent >> renderUserProfileComponent [
	parent call: (UserProfileComponent user: post author parent: parent).
]

{ #category : #private }
PostComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
   anHtmlRoot stylesheet url: (MyFileLibrary urlOf: #stylesCss).
]
