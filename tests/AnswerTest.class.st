Class {
	#name : #AnswerTest,
	#superclass : #TestCase,
	#instVars : [
		'u1',
		'q1',
		'a1'
	],
	#category : #'CuOOra-tests'
}

{ #category : #running }
AnswerTest >> setUp [
	u1 := User newWithUsername: 'SuperUsuario' password: '1234'.
	q1 := Question newWithAuthor: u1 title: 'SuperPregunta'  text: 'SuperTexto de SuperPregunta'  topics: OrderedCollection new.
	a1 := Answer newWithAuthor: u1 question: q1 text: 'SuperTexto de SuperRespuesta de SuperPregunta'.
	

]

{ #category : #tests }
AnswerTest >> testRemove [
	u1 addAnswer: a1.
	q1 addAnswer: a1.
	self assert: (u1 answers at: 1) equals: a1.
	self assert: (q1 answers at: 1) equals: a1.
	a1 remove.
	self assert: u1 answers isEmpty.
	self assert: q1 answers isEmpty.
	
]
