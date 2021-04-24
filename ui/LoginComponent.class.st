"
application := WAAdmin register: LoginComponent asApplicationAt: 'cuoora'.
application sessionClass: SessionWithUser.

CuOOra clearUniqueInstance.
"
Class {
	#name : #LoginComponent,
	#superclass : #WAComponent,
	#instVars : [
		'username',
		'password'
	],
	#category : #'CuOOra-ui'
}

{ #category : #private }
LoginComponent >> login [
	(self model loginWithUsername: username password: password)
		ifNotNil: [ :it | self proceedWith: it ].
	username := nil.
	password := nil
]

{ #category : #private }
LoginComponent >> model [
	^ CuOOra uniqueInstance.
]

{ #category : #private }
LoginComponent >> password [
	^ password
]

{ #category : #private }
LoginComponent >> password: anObject [
	password := anObject
]

{ #category : #private }
LoginComponent >> proceedWith: aUser [
	self session user: aUser.
	self call: HomeComponent new.
]

{ #category : #private }
LoginComponent >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.
]

{ #category : #private }
LoginComponent >> renderContentOn: aCanvas [
	aCanvas
		div: [ self renderHeaderOn: aCanvas ].
		
	aCanvas div class: 'wrapper'; style: 'top: 30%; text-align: center'; with: [
		aCanvas heading level2 with: 'Iniciar Sesion'.
		aCanvas div class: 'new-question-form'; with: [ 
			aCanvas
				form: [ self renderInputElementsOn: aCanvas.
				self renderButtonsOn: aCanvas ].
		].
	].
]

{ #category : #private }
LoginComponent >> renderHeaderOn: aCanvas [
	aCanvas
		heading level1 class: 'header-title'; with: 'CuOOra'.
]

{ #category : #private }
LoginComponent >> renderInputElementsOn: aCanvas [
	aCanvas div class: 'input-fields'; with: [
		aCanvas textInput class: 'input'; on: #username of: self; placeholder: 'Nombre de usuario'.
		aCanvas passwordInput class: 'input'; on: #password of: self; placeholder: 'Contraseña'.
	].
]

{ #category : #private }
LoginComponent >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton class: 'btn-accept';
		callback: [ self login ];
		with: 'Sign In'
]

{ #category : #private }
LoginComponent >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
   anHtmlRoot stylesheet url: (MyFileLibrary urlOf: #stylesCss).
]

{ #category : #private }
LoginComponent >> username [
	^ username
]

{ #category : #private }
LoginComponent >> username: anObject [
	username := anObject
]
