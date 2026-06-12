Class {
	#name : 'SCLVarDecl',
	#superclass : 'SCLNode',
	#instVars : [
		'name',
		'attributes',
		'type',
		'defaultValue'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLVarDecl >> attributes [
	^ attributes
]

{ #category : 'accessing' }
SCLVarDecl >> attributes: anObject [
	attributes := anObject
]

{ #category : 'accessing' }
SCLVarDecl >> defaultValue [
	^ defaultValue
]

{ #category : 'accessing' }
SCLVarDecl >> defaultValue: anObject [
	defaultValue := anObject
]

{ #category : 'accessing' }
SCLVarDecl >> name [
	^ name
]

{ #category : 'accessing' }
SCLVarDecl >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
SCLVarDecl >> type [
	^ type
]

{ #category : 'accessing' }
SCLVarDecl >> type: anObject [
	type := anObject
]
