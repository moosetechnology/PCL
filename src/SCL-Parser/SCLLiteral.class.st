"
A literal value. kind is one of: #bool #integer #real #time #string.
"
Class {
	#name : 'SCLLiteral',
	#superclass : 'SCLNode',
	#instVars : [
		'value',
		'kind'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLLiteral >> kind [
	^ kind
]

{ #category : 'accessing' }
SCLLiteral >> kind: anObject [
	kind := anObject
]

{ #category : 'printing' }
SCLLiteral >> printOn: aStream [
	aStream nextPutAll: '('.
	aStream nextPutAll: kind.
	aStream nextPutAll: ': '.
	aStream nextPutAll: value.
	aStream nextPut: $)
]

{ #category : 'accessing' }
SCLLiteral >> value [
	^ value
]

{ #category : 'accessing' }
SCLLiteral >> value: anObject [
	value := anObject
]
