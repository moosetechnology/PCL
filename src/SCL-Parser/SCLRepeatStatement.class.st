Class {
	#name : 'SCLRepeatStatement',
	#superclass : 'SCLNode',
	#instVars : [
		'body',
		'condition'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLRepeatStatement >> body [
	^ body
]

{ #category : 'accessing' }
SCLRepeatStatement >> body: anObject [
	body := anObject
]

{ #category : 'accessing' }
SCLRepeatStatement >> condition [
	^ condition
]

{ #category : 'accessing' }
SCLRepeatStatement >> condition: anObject [
	condition := anObject
]
