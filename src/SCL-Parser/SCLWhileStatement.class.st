Class {
	#name : 'SCLWhileStatement',
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
SCLWhileStatement >> body [
	^ body
]

{ #category : 'accessing' }
SCLWhileStatement >> body: anObject [
	body := anObject
]

{ #category : 'accessing' }
SCLWhileStatement >> condition [
	^ condition
]

{ #category : 'accessing' }
SCLWhileStatement >> condition: anObject [
	condition := anObject
]
