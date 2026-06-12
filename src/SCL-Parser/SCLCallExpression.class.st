Class {
	#name : 'SCLCallExpression',
	#superclass : 'SCLNode',
	#instVars : [
		'name',
		'arguments'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLCallExpression >> arguments [
	^ arguments
]

{ #category : 'accessing' }
SCLCallExpression >> arguments: anObject [
	arguments := anObject
]

{ #category : 'accessing' }
SCLCallExpression >> name [
	^ name
]

{ #category : 'accessing' }
SCLCallExpression >> name: anObject [
	name := anObject
]

{ #category : 'printing' }
SCLCallExpression >> printOn: aStream [
	aStream nextPutAll: name.
	aStream nextPut: $(.
	arguments do: [:a | a printOn: aStream] separatedBy: [aStream nextPutAll: ', '].
	aStream nextPut: $)
]
