"
Root class for all SCL AST nodes. Provides accept: for visitors.
"
Class {
	#name : 'SCLNode',
	#superclass : 'Object',
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'visiting' }
SCLNode >> accept: aVisitor [

	^ aVisitor visit: self
]
