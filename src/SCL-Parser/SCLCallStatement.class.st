Class {
	#name : 'SCLCallStatement',
	#superclass : 'SCLNode',
	#instVars : [
		'call'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLCallStatement >> call [
	^ call
]

{ #category : 'accessing' }
SCLCallStatement >> call: anObject [
	call := anObject
]
