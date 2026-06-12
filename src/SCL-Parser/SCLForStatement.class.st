Class {
	#name : 'SCLForStatement',
	#superclass : 'SCLNode',
	#instVars : [
		'variable',
		'from',
		'to',
		'by',
		'body'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLForStatement >> body [
	^ body
]

{ #category : 'accessing' }
SCLForStatement >> body: anObject [
	body := anObject
]

{ #category : 'accessing' }
SCLForStatement >> by [
	^ by
]

{ #category : 'accessing' }
SCLForStatement >> by: anObject [
	by := anObject
]

{ #category : 'accessing' }
SCLForStatement >> from [
	^ from
]

{ #category : 'accessing' }
SCLForStatement >> from: anObject [
	from := anObject
]

{ #category : 'accessing' }
SCLForStatement >> to [
	^ to
]

{ #category : 'accessing' }
SCLForStatement >> to: anObject [
	to := anObject
]

{ #category : 'accessing' }
SCLForStatement >> variable [
	^ variable
]

{ #category : 'accessing' }
SCLForStatement >> variable: anObject [
	variable := anObject
]
