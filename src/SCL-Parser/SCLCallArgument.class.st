"
A call argument. parameter is the named param (nil for positional). direction is ':=' or '=>' (nil for positional).
"
Class {
	#name : 'SCLCallArgument',
	#superclass : 'SCLNode',
	#instVars : [
		'parameter',
		'direction',
		'value'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLCallArgument >> direction [
	^ direction
]

{ #category : 'accessing' }
SCLCallArgument >> direction: anObject [
	direction := anObject
]

{ #category : 'accessing' }
SCLCallArgument >> parameter [
	^ parameter
]

{ #category : 'accessing' }
SCLCallArgument >> parameter: anObject [
	parameter := anObject
]

{ #category : 'accessing' }
SCLCallArgument >> value [
	^ value
]

{ #category : 'accessing' }
SCLCallArgument >> value: anObject [
	value := anObject
]
