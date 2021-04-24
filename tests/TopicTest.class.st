Class {
	#name : #TopicTest,
	#superclass : #TestCase,
	#instVars : [
		't1',
		'q1',
		'q2'
	],
	#category : #'CuOOra-tests'
}

{ #category : #running }
TopicTest >> setUp [
	| ls |
	t1 := Topic newWithName: 'Cocina' description: 'Preguntas sobre cocina en general'.
	ls := OrderedCollection new.
	ls add: t1.
	q1 := Question newWithAuthor: nil title: 'Su mejor receta de yakisoba?' text: 'necesito que me den sus recetas y tips para preparar el plato' topics: ls.
	q2 := Question newWithAuthor: nil title: 'Su mejor receta de pizzas?' text: 'necesito que me den sus recetas y tips para preparar el plato' topics: ls.

]

{ #category : #running }
TopicTest >> testAddQuestion [
	self deny: t1 questions isEmpty.
	self assert: (t1 questions last) equals: q2.
	self assert: t1 questions size equals: 2.
	self assert: (t1 questions last) equals: q2.
]

{ #category : #tests }
TopicTest >> testRemoveQuestion [
	self assert: (t1 removeQuestion: q1) equals: q1.
	self assert: t1 questions size equals: 1.
	self assert: t1 questions last equals: q2.
]
