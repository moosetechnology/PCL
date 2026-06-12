Class {
	#name : 'SCLUnaryOp',
	#superclass : 'SCLNode',
	#instVars : [
		'operator',
		'operand'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLUnaryOp >> operand [
	^ operand
]

{ #category : 'accessing' }
SCLUnaryOp >> operand: anObject [
	operand := anObject
]

{ #category : 'accessing' }
SCLUnaryOp >> operator [
	^ operator
]

{ #category : 'accessing' }
SCLUnaryOp >> operator: anObject [
	operator := anObject
]
