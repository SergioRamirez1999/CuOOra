Class {
	#name : #QualificationTest,
	#superclass : #TestCase,
	#instVars : [
		'q1'
	],
	#category : #'CuOOra-tests'
}

{ #category : #running }
QualificationTest >> setUp [
	q1 := Qualification newWithCondition: true author: nil.

]

{ #category : #tests }
QualificationTest >> testToggleCondition [
	self assert: q1 condition.
	self assert: q1 toggleCondition equals: false.
	self assert: q1 toggleCondition equals: true.
]
