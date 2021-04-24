Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		't1',
		't2',
		't3'
	],
	#category : #'CuOOra-tests'
}

{ #category : #running }
CuOOraTest >> setUp [
	CuOOra clearUniqueInstance.
	t1 := Topic newWithName: 'Cocina' description: 'SuperCocina'.
	
]

{ #category : #tests }
CuOOraTest >> testFindTopics [
	| lTopics |
	lTopics := OrderedCollection new.
	lTopics add: 'COCINA'.
	CuOOra uniqueInstance addTopic: t1.
	self assert: ((CuOOra uniqueInstance findTopics: lTopics) at: 1) equals: t1.
	CuOOra clearUniqueInstance.

	
]
