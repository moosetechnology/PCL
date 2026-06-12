Class {
	#name : 'SCLFile',
	#superclass : 'SCLNode',
	#instVars : [
		'units'
	],
	#category : 'SCL-Parser-AST',
	#package : 'SCL-Parser',
	#tag : 'AST'
}

{ #category : 'printing' }
SCLFile >> printOn: aStream [
	aStream nextPutAll: 'SCLFile('.
	units do: [:u | u printOn: aStream] separatedBy: [aStream nextPutAll: ', '].
	aStream nextPut: $)
]

{ #category : 'accessing' }
SCLFile >> units [

	^ units
]

{ #category : 'accessing' }
SCLFile >> units: aCollection [

	units := aCollection
]
