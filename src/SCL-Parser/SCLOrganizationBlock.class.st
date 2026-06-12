Class {
	#name : 'SCLOrganizationBlock',
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
SCLOrganizationBlock >> body [
	^ body
]

{ #category : 'accessing' }
SCLOrganizationBlock >> body: anObject [
	body := anObject
]

{ #category : 'accessing' }
SCLOrganizationBlock >> header [
	^ header
]

{ #category : 'accessing' }
SCLOrganizationBlock >> header: anObject [
	header := anObject
]

{ #category : 'accessing' }
SCLOrganizationBlock >> name [
	^ name
]

{ #category : 'accessing' }
SCLOrganizationBlock >> name: anObject [
	name := anObject
]

{ #category : 'printing' }
SCLOrganizationBlock >> printOn: aStream [
	aStream nextPutAll: 'ORGANIZATION_BLOCK '.
	aStream nextPutAll: name
]

{ #category : 'accessing' }
SCLOrganizationBlock >> varSections [
	^ varSections
]

{ #category : 'accessing' }
SCLOrganizationBlock >> varSections: anObject [
	varSections := anObject
]
