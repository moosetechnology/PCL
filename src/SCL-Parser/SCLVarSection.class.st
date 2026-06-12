Class {
	#name : 'SCLVarSection',
	#superclass : 'SCLNode',
	#instVars : [
		'kind',
		'retain',
		'declarations'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'accessing' }
SCLVarSection >> declarations [
	^ declarations
]

{ #category : 'accessing' }
SCLVarSection >> declarations: anObject [
	declarations := anObject
]

{ #category : 'accessing' }
SCLVarSection >> kind [
	^ kind
]

{ #category : 'accessing' }
SCLVarSection >> kind: anObject [
	kind := anObject
]

{ #category : 'accessing' }
SCLVarSection >> retain [
	^ retain
]

{ #category : 'accessing' }
SCLVarSection >> retain: anObject [
	retain := anObject
]
