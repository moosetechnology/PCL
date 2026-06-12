Class {
	#name : 'SCLBinaryOp',
	#superclass : 'SCLNode',
	#instVars : [
		'operator',
		'left',
		'right'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLBinaryOp >> left [
	^ left
]

{ #category : 'accessing' }
SCLBinaryOp >> left: anObject [
	left := anObject
]

{ #category : 'accessing' }
SCLBinaryOp >> operator [
	^ operator
]

{ #category : 'accessing' }
SCLBinaryOp >> operator: anObject [
	operator := anObject
]

{ #category : 'printing' }
SCLBinaryOp >> printOn: aStream [
	aStream nextPut: $(.
	left printOn: aStream.
	aStream nextPutAll: ' ', operator, ' '.
	right printOn: aStream.
	aStream nextPut: $)
]

{ #category : 'accessing' }
SCLBinaryOp >> right [
	^ right
]

{ #category : 'accessing' }
SCLBinaryOp >> right: anObject [
	right := anObject
]
