Class {
	#name : 'SCLElsifClause',
	#superclass : 'SCLNode',
	#instVars : [
		'condition',
		'body'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLElsifClause >> body [
	^ body
]

{ #category : 'accessing' }
SCLElsifClause >> body: anObject [
	body := anObject
]

{ #category : 'accessing' }
SCLElsifClause >> condition [
	^ condition
]

{ #category : 'accessing' }
SCLElsifClause >> condition: anObject [
	condition := anObject
]
