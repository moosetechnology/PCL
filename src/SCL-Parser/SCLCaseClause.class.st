Class {
	#name : 'SCLCaseClause',
	#superclass : 'SCLNode',
	#instVars : [
		'labels',
		'statements'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLCaseClause >> labels [
	^ labels
]

{ #category : 'accessing' }
SCLCaseClause >> labels: anObject [
	labels := anObject
]

{ #category : 'accessing' }
SCLCaseClause >> statements [
	^ statements
]

{ #category : 'accessing' }
SCLCaseClause >> statements: anObject [
	statements := anObject
]
