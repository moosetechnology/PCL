Class {
	#name : 'SCLProject',
	#superclass : 'Object',
	#instVars : [
		'root',
		'files'
	],
	#category : 'SCL-Parser',
	#package : 'SCL-Parser'
}

{ #category : 'instance creation' }
SCLProject class >> on: aPath [
    ^ self new parseDirectory: aPath; yourself
]

{ #category : 'accessing' }
SCLProject >> files [
    ^ files
]

{ #category : 'initialization' }
SCLProject >> parseDirectory: aPath [
    | parser |
    root := aPath asFileReference.
    parser := SCLParser new.
    files := Dictionary new.
    (root allChildrenMatching: '*.scl') do: [:f |
        | relPath result |
        relPath := (f relativeTo: root) pathString.
        result := parser parse: f contents.
        files at: relPath put: result]
]

{ #category : 'printing' }
SCLProject >> printOn: aStream [
    aStream
        nextPutAll: 'SCLProject(';
        print: root fullName;
        nextPutAll: ' — ';
        print: files size;
        nextPutAll: ' files)'
]

{ #category : 'accessing' }
SCLProject >> root [
    ^ root
]
