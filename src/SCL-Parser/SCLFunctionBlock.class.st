Class {
	#name : 'SCLFunctionBlock',
	#superclass : 'SCLNode',
	#instVars : [
		'name',
		'header',
		'varSections',
		'body'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLFunctionBlock >> body [
	^ body
]

{ #category : 'accessing' }
SCLFunctionBlock >> body: anObject [
	body := anObject
]

{ #category : 'accessing' }
SCLFunctionBlock >> header [
	^ header
]

{ #category : 'accessing' }
SCLFunctionBlock >> header: anObject [
	header := anObject
]

{ #category : 'accessing' }
SCLFunctionBlock >> name [
	^ name
]

{ #category : 'accessing' }
SCLFunctionBlock >> name: anObject [
	name := anObject
]

{ #category : 'printing' }
SCLFunctionBlock >> printOn: aStream [
	aStream nextPutAll: 'FUNCTION_BLOCK '.
	aStream nextPutAll: name
]

{ #category : 'accessing' }
SCLFunctionBlock >> varSections [
	^ varSections
]

{ #category : 'accessing' }
SCLFunctionBlock >> varSections: anObject [
	varSections := anObject
]
