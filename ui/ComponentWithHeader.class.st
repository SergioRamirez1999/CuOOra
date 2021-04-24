Class {
	#name : #ComponentWithHeader,
	#superclass : #WAComponent,
	#instVars : [
		'parent'
	],
	#category : #'CuOOra-ui'
}

{ #category : #initialization }
ComponentWithHeader >> initialize [
	super initialize.
	parent := self.
]

{ #category : #protected }
ComponentWithHeader >> logout [
	self session logout.
	self call: LoginComponent new.
]

{ #category : #protected }
ComponentWithHeader >> renderHeaderMenuOn: aCanvas [
	aCanvas anchor style: 'margin-right: 15px';
		callback: [ self renderUserProfileComponent ];
		with: self session user username.
	
	aCanvas anchor class: 'btn-logout';
		callback: [ self logout ];
		with: [ aCanvas span: 'Logout' ].
]

{ #category : #protected }
ComponentWithHeader >> renderHeaderOn: aCanvas [
	aCanvas div class: 'header-container'; with: [ 
		aCanvas
			div class: 'header-left-content'; with: [ self renderHeaderTitleOn: aCanvas ].
		aCanvas
			div class: 'header-right-content'; with: [ self renderHeaderMenuOn: aCanvas ].
	].	
]

{ #category : #protected }
ComponentWithHeader >> renderHeaderTitleOn: aCanvas [
	aCanvas
		anchor style: 'text-decoration: none';
			callback: [ self renderHomeComponent ];
			with: [ aCanvas heading level1 class: 'header-title'; with: 'CuOOra' ].
]

{ #category : #protected }
ComponentWithHeader >> renderHomeComponent [
	parent call: HomeComponent new.
]

{ #category : #protected }
ComponentWithHeader >> renderUserProfileComponent [
	parent call: (UserProfileComponent user: self session user parent: self).
]

{ #category : #updating }
ComponentWithHeader >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
   anHtmlRoot stylesheet url: (MyFileLibrary urlOf: #stylesCss).
]
