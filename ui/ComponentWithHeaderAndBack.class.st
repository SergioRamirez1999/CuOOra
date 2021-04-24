Class {
	#name : #ComponentWithHeaderAndBack,
	#superclass : #ComponentWithHeader,
	#category : #'CuOOra-ui'
}

{ #category : #protected }
ComponentWithHeaderAndBack >> back [
	self answer.
]

{ #category : #protected }
ComponentWithHeaderAndBack >> parent: aParent [
	parent := aParent.
]

{ #category : #protected }
ComponentWithHeaderAndBack >> renderBackButtonOn: aCanvas [
	aCanvas anchor class: 'btn-back-button';
		callback: [ self back ];
		with: 'Regresar'.
]
