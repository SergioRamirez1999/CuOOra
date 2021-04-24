Class {
	#name : #SessionWithUser,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'CuOOra-ui'
}

{ #category : #accessing }
SessionWithUser >> logout [
	user := nil.
   self unregistered.
	self requestContext redirectTo: 'http://localhost:8080/cuoora'.
]

{ #category : #accessing }
SessionWithUser >> user [
	^ user
]

{ #category : #accessing }
SessionWithUser >> user: anObject [
	user := anObject
]
