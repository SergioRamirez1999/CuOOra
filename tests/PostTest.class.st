Class {
	#name : #PostTest,
	#superclass : #TestCase,
	#instVars : [
		'p1',
		'p2',
		'qa1',
		'qa2',
		'qa3',
		'u1',
		'u2',
		'u3'
	],
	#category : #'CuOOra-tests'
}

{ #category : #running }
PostTest >> setUp [
	p1 := Post newWithAuthor: nil text: 'Super Publicacion'.
	qa1 := Qualification newWithCondition: true author: u1.
	qa2 := Qualification newWithCondition: true author: u2.
	qa3 := Qualification newWithCondition: false author: nil.

]

{ #category : #tests }
PostTest >> testAddQualification [
	self assert: p1 qualifications isEmpty.
	self assert: (p1 addQualification: qa1) equals: qa1.
	self assert: (p1 addQualification: qa2) equals: qa2.
	self deny: p1 qualifications isEmpty.
	self assert: p1 qualifications size equals: 2.
	
]

{ #category : #tests }
PostTest >> testDetermineScore [
	p1 addQualification: qa1.
	p1 addQualification: qa2.
	p1 addQualification: qa3.
	self assert: p1 determineScore equals: 1.
	
]

{ #category : #tests }
PostTest >> testGetDislikes [
	p1 addQualification: qa1.
	p1 addQualification: qa2.
	p1 addQualification: qa3.
	self assert: p1 getDislikes equals: 1.
	
]

{ #category : #tests }
PostTest >> testGetLikes [
	p1 addQualification: qa1.
	p1 addQualification: qa2.
	p1 addQualification: qa3.
	self assert: p1 getLikes equals: 2.
	
]

{ #category : #tests }
PostTest >> testIsQualifiedBy [
	p1 addQualification: qa1.
	p1 addQualification: qa2.
	p1 addQualification: qa3.
	self assert: (p1 isQualifiedBy: u1) notNil.
	self assert: (p1 isQualifiedBy: u1) author equals: u1.
	self assert: (p1 isQualifiedBy: u2) notNil.
	self assert: (p1 isQualifiedBy: u2) author equals: u2.
	self assert: (p1 isQualifiedBy: u3) author isNil.
]
