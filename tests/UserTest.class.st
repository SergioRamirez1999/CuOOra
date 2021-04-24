Class {
	#name : #UserTest,
	#superclass : #TestCase,
	#instVars : [
		'u1',
		'u2',
		'u3',
		'q1',
		'q2',
		'q3',
		'q4',
		'q5',
		'a1',
		'a2',
		'a3',
		'a4',
		't1',
		't2',
		't3',
		'lt',
		'qa1',
		'qa2',
		'qa3',
		'qa4'
	],
	#category : #'CuOOra-tests'
}

{ #category : #running }
UserTest >> setUp [
	
	u1 := User newWithUsername: 'user1' password: '1234'.
	u2 := User newWithUsername: 'user2' password: '1234'.
	u3 := User newWithUsername: 'user3' password: '1234'.
	
	t1 := Topic newWithName: 'Mecanina' description: 'Consulte aqui sobre mecanica'.
	t2 := Topic newWithName: 'Electricidad' description: 'Consulte aqui sobre electricidad'.
	t3 := Topic newWithName: 'Reparacion PC' description: 'Consulte aqui sobre computadoras'.

	
	lt := OrderedCollection new.
	lt add: t1.
	
	q1 := Question newWithAuthor: u1 title: 'Problema homocinetica'  text: 'tengo un problema en la homocinetica: hace cla cla cli cli xdd' topics: lt.
	
	lt := OrderedCollection new.
	lt add: t2.
	
	q2 := Question newWithAuthor: u2 title: 'Problema con la luz'  text: 'tengo un problema en la casa' topics: lt.
	
	a1 := Answer newWithAuthor: u1 question: q1  text: 'Flaco te tenes que arrepentir'.
	a2 := Answer newWithAuthor: u1 question: q2  text: 'Flaco no me podes decir eso'.
	a3 := Answer newWithAuthor: u1 question: q2  text: 'Vos te tenes que arrepentir.'.
	a4 := Answer newWithAuthor: u3 question: q2  text: 'Vos te tenes que arrepentir.'.
	
	lt := OrderedCollection new.
	lt add: t3.	
	
	q3 := Question newWithAuthor: u3 title: 'Problema de video'  text: 'tengo un problema con la tarjeta grafica.' topics: lt.
	
	lt := OrderedCollection new.
	lt add: t3.	
	
	q4 := Question newWithAuthor: u3 title: 'Problema con el audio'  text: 'tengo un problema con el audio en linux' topics: lt.
	
	lt := OrderedCollection new.
	lt add: t3.	
		
	q5 := Question newWithAuthor: u3 title: 'Como listar inodos en linux?'  text: 'necesito listar los inodos en linux' topics: lt.
	
	qa1 := Qualification newWithCondition: true author: u3.
	qa2 := Qualification newWithCondition: true author: u3.
	qa3 := Qualification newWithCondition: true author: u3.
	qa4 := Qualification newWithCondition: false author: u3.



]

{ #category : #tests }
UserTest >> testAddAnswer [
	self assert: u1 answers isEmpty.
	self assert: (u1 addAnswer: a1) equals: a1.
	self deny: u1 answers isEmpty.
]

{ #category : #tests }
UserTest >> testAddInterestTopic [
	self assert: u1 interestTopics isEmpty.
	self assert: (u1 addInterestTopic: t1) equals: t1.
	self deny: u1 interestTopics isEmpty.
]

{ #category : #tests }
UserTest >> testAddQuestion [
	self assert: u1 questions isEmpty.
	self assert: (u1 addQuestion: q1) equals: q1.
	self deny: u1 questions isEmpty.
]

{ #category : #tests }
UserTest >> testAnswersScore [
	self assert: u1 answersScore equals: 0.
	u1 addAnswer: a1.
	u1 addAnswer: a2.
	u1 addAnswer: a3.
	self assert: u1 answersScore equals: 100.
]

{ #category : #tests }
UserTest >> testDetermineScore [
	q3 addQualification: qa1.
	q3 addQualification: qa2.
	q3 addQualification: qa3.
	q3 addQualification: qa4.
	u3 addQuestion: q3.
	u3 addQuestion: q4.
	u3 addQuestion: q5.
	q2 addAnswer: a4.
	u3 addAnswer: a4.
	self assert: u3 determineScore equals: 112.
]

{ #category : #tests }
UserTest >> testFollow [
	self assert: u1 following isEmpty.
	self assert: (u1 follow: u2) equals: u2.
	self assert: u1 following size equals: 1.
	self assert: u1 following first equals: u2.
]

{ #category : #tests }
UserTest >> testFollowingAt [
	u1 follow: u2.
	self assert: (u1 followingAt: u2).
	
]

{ #category : #tests }
UserTest >> testGetRelevantQuestions [
	u1 addQuestion: q1.
	u2 addQuestion: q2.
	u3 addQuestion: q3.
	u3 addQuestion: q4.
	u3 addQuestion: q5.
	t2 addQuestion: q2.
	u1 addInterestTopic: t2.
	u1 follow: u3.
	self assert: u1 getRelevantQuestions size equals: 4.
	
]

{ #category : #tests }
UserTest >> testQuestionsScore [
	self assert: u1 questionsScore equals: 0.
	u1 addQuestion: q1.
	u1 addQuestion: q2.
	self assert: u1 questionsScore equals: 40.
]

{ #category : #tests }
UserTest >> testRemoveAnswer [
	u1 addAnswer: a1.
	self assert: (u1 removeAnswer: a1) equals: a1.
	self assert: u1 answers isEmpty.
	
]
