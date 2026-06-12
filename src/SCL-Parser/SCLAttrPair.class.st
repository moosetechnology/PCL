Class {
	#name : 'SCLAttrPair',
	#superclass : 'SCLNode',
	#instVars : [
		'key',
		'value'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLAttrPair >> key [
	^ key
]

{ #category : 'accessing' }
SCLAttrPair >> key: anObject [
	key := anObject
]

{ #category : 'accessing' }
SCLAttrPair >> value [
	^ value
]

{ #category : 'accessing' }
SCLAttrPair >> value: anObject [
	value := anObject
]
