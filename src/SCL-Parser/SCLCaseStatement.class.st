Class {
	#name : 'SCLCaseStatement',
	#superclass : 'SCLNode',
	#instVars : [
		'expression',
		'clauses',
		'elseClause'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLCaseStatement >> clauses [
	^ clauses
]

{ #category : 'accessing' }
SCLCaseStatement >> clauses: anObject [
	clauses := anObject
]

{ #category : 'accessing' }
SCLCaseStatement >> elseClause [
	^ elseClause
]

{ #category : 'accessing' }
SCLCaseStatement >> elseClause: anObject [
	elseClause := anObject
]

{ #category : 'accessing' }
SCLCaseStatement >> expression [
	^ expression
]

{ #category : 'accessing' }
SCLCaseStatement >> expression: anObject [
	expression := anObject
]
