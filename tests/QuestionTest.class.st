Class {
	#name : #QuestionTest,
	#superclass : #TestCase,
	#instVars : [
		'topic1',
		'answer1',
		'answer2',
		'question1',
		'user1',
		'user2',
		'user3'
	],
	#category : #'CuOOra-tests'
}

{ #category : #running }
QuestionTest >> setUp [
	| topics1 |
	
	topic1:= (Topic newWithName: 'Cocina' description: 'Consulte aqui sobre cocina').
	
	topics1 := OrderedCollection new.
	topics1 add: topic1.
	
	user1 := (User newWithUsername: 'andres00' password: '123456').
	user2 := (User newWithUsername: 'mario9' password: '1234567').
	user3 := (User newWithUsername: 'lara12' password: '123432').
	
	question1 := (Question
		newWithAuthor: user1
		title: 'Temperatura del horno'
		text:
			'Quisiera saber ¿a que temperatura tiene que estar el horno para cocinar una torta de chocolate?'
		topics: topics1).
		
	answer1:= (Answer newWithAuthor: user2 question: question1 text: 'Debe estar precalentado por 10 minutos a 180º.'). 
	
	answer2:= (Answer newWithAuthor: user3 question: question1 text: 'Lo podes precalentar antes a 180º o podes dejar el fuego bajo hasta que se cocina.').
	
	
	
	
	
	
]

{ #category : #tests }
QuestionTest >> testAddAnswer [
	self assert: question1 answers isEmpty.
	question1 addAnswer: answer1.
	self deny: question1 answers isEmpty.
]

{ #category : #tests }
QuestionTest >> testAnswersSorted [
	answer1 addQualification: (Qualification newWithCondition: true author: nil).
	answer1 addQualification: (Qualification newWithCondition: false author: nil).
	answer1 addQualification: (Qualification newWithCondition: false author: nil).
	
	answer2 addQualification: (Qualification newWithCondition: false author: nil).
	answer2 addQualification: (Qualification newWithCondition: false author: nil).
	answer2 addQualification: (Qualification newWithCondition: false author: nil).
	
	question1 addAnswer: answer1.
	question1 addAnswer: answer2.
	
	self assert: answer1 determineScore equals: -1.
	self assert: answer2 determineScore equals: -3.
	self assert: (question1 answersSorted first) equals: answer1.
	
]

{ #category : #tests }
QuestionTest >> testRemove [
	user1 addQuestion: question1.
	
	question1 addAnswer: answer1.
	question1 addAnswer: answer2.

	
	user2 addAnswer: answer1.
	user3 addAnswer: answer2.
	
	question1 remove.
	
	self assert: question1 answers isEmpty.
	self assert: topic1 questions isEmpty.
	self assert: user1 questions isEmpty.
	

]

{ #category : #tests }
QuestionTest >> testTopics [
	self deny: question1 topics isEmpty.
	self assert: question1 topics size equals:1.
]
