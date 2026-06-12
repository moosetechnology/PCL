"
A variable reference. name is the head (#local, ""DB"", or plain). members is an OrderedCollection of field names.
"
Class {
	#name : 'SCLVariableRef',
	#superclass : 'SCLNode',
	#instVars : [
		'name',
		'members'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLVariableRef >> members [
	^ members
]

{ #category : 'accessing' }
SCLVariableRef >> members: anObject [
	members := anObject
]

{ #category : 'accessing' }
SCLVariableRef >> name [
	^ name
]

{ #category : 'accessing' }
SCLVariableRef >> name: anObject [
	name := anObject
]

{ #category : 'printing' }
SCLVariableRef >> printOn: aStream [
	aStream nextPutAll: name.
	members do: [:m | aStream nextPut: $.. aStream nextPutAll: m]
]
