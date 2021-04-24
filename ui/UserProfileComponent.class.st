Class {
	#name : #UserProfileComponent,
	#superclass : #ComponentWithHeaderAndBack,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
UserProfileComponent class >> user: anUser parent: aParent [
	self initialize.
	^ ( self new user: anUser parent: aParent).
]

{ #category : #private }
UserProfileComponent >> followUser [
	self session user follow: user.
]

{ #category : #private }
UserProfileComponent >> renderContentOn: aCanvas [
	self renderHeaderOn: aCanvas.
	self renderBackButtonOn: aCanvas.
	aCanvas div class: 'body-container'; with: [
		aCanvas heading level1 with: 'Preguntas de ', user username.
		self renderFollowButtonOn: aCanvas.
		aCanvas div class: 'posts-container'; with: [ 
			self renderQuestions: aCanvas.
		]
	].
]

{ #category : #private }
UserProfileComponent >> renderFollowButtonOn: aCanvas [
	(user = self session user)
		ifTrue: [ ^ self ].
	(self session user followingAt: user)
		ifTrue: [
			aCanvas anchor class: 'btn-follow-unfollow'; style: 'background-color: #dc3545';
				callback: [ self unfollowUser ];
				with: 'unfollow'.
		]
		ifFalse: [ 
			aCanvas anchor class: 'btn-follow-unfollow'; style: 'background-color: #007bff';
				callback: [ self followUser ];
				with: 'follow'.
		].

]

{ #category : #private }
UserProfileComponent >> renderQuestions: aCanvas [
	user questions do: [ :q | aCanvas render: (QuestionComponent question: q parent: self canRemove: true) ].
]

{ #category : #private }
UserProfileComponent >> unfollowUser [
	self session user unfollow: user.
]

{ #category : #'instance creation' }
UserProfileComponent >> user: anUser parent: aParent [
	self parent: aParent.
	user := anUser.
]
