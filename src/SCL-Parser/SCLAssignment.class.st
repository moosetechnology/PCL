Class {
	#name : 'SCLAssignment',
	#superclass : 'SCLNode',
	#instVars : [
		'target',
		'value'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLAssignment >> target [
	^ target
]

{ #category : 'accessing' }
SCLAssignment >> target: anObject [
	target := anObject
]

{ #category : 'accessing' }
SCLAssignment >> value [
	^ value
]

{ #category : 'accessing' }
SCLAssignment >> value: anObject [
	value := anObject
]
