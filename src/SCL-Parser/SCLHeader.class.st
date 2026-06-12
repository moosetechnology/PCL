"
Holds raw header metadata (title, version, author, etc.) as Associations.
"
Class {
	#name : 'SCLHeader',
	#superclass : 'SCLNode',
	#instVars : [
		'rawItems'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLHeader >> rawItems [
	^ rawItems
]

{ #category : 'accessing' }
SCLHeader >> rawItems: anObject [
	rawItems := anObject
]
