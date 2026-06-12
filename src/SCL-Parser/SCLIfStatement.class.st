Class {
	#name : 'SCLIfStatement',
	#superclass : 'SCLNode',
	#instVars : [
		'condition',
		'thenPart',
		'elsifClauses',
		'elsePart'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLIfStatement >> condition [
	^ condition
]

{ #category : 'accessing' }
SCLIfStatement >> condition: anObject [
	condition := anObject
]

{ #category : 'accessing' }
SCLIfStatement >> elsePart [
	^ elsePart
]

{ #category : 'accessing' }
SCLIfStatement >> elsePart: anObject [
	elsePart := anObject
]

{ #category : 'accessing' }
SCLIfStatement >> elsifClauses [
	^ elsifClauses
]

{ #category : 'accessing' }
SCLIfStatement >> elsifClauses: anObject [
	elsifClauses := anObject
]

{ #category : 'accessing' }
SCLIfStatement >> thenPart [
	^ thenPart
]

{ #category : 'accessing' }
SCLIfStatement >> thenPart: anObject [
	thenPart := anObject
]
