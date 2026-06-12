Class {
	#name : 'SCLFunction',
	#superclass : 'SCLNode',
	#instVars : [
		'name',
		'returnType',
		'header',
		'varSections',
		'body'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLFunction >> body [
	^ body
]

{ #category : 'accessing' }
SCLFunction >> body: anObject [
	body := anObject
]

{ #category : 'accessing' }
SCLFunction >> header [
	^ header
]

{ #category : 'accessing' }
SCLFunction >> header: anObject [
	header := anObject
]

{ #category : 'accessing' }
SCLFunction >> name [
	^ name
]

{ #category : 'accessing' }
SCLFunction >> name: anObject [
	name := anObject
]

{ #category : 'printing' }
SCLFunction >> printOn: aStream [
	aStream nextPutAll: 'FUNCTION '.
	aStream nextPutAll: name.
	aStream nextPutAll: ' : '.
	returnType printOn: aStream
]

{ #category : 'accessing' }
SCLFunction >> returnType [
	^ returnType
]

{ #category : 'accessing' }
SCLFunction >> returnType: anObject [
	returnType := anObject
]

{ #category : 'accessing' }
SCLFunction >> varSections [
	^ varSections
]

{ #category : 'accessing' }
SCLFunction >> varSections: anObject [
	varSections := anObject
]
