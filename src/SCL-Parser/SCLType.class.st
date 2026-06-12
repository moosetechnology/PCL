Class {
	#name : 'SCLType',
	#superclass : 'SCLNode',
	#instVars : [
		'name'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLType >> name [
	^ name
]

{ #category : 'accessing' }
SCLType >> name: anObject [
	name := anObject
]

{ #category : 'printing' }
SCLType >> printOn: aStream [
	aStream nextPutAll: name
]
