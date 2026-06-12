"
PEG parser for Siemens SCL (IEC 61131-3 Structured Control Language).
Each instance variable is a PP2 production. Build with: SCLParser new.
"
Class {
	#name : 'SCLParser',
	#superclass : 'SCLGrammar',
	#category : 'SCL-Parser-Grammar',
	#package : 'SCL-Parser',
	#tag : 'Grammar'
}

{ #category : 'grammar-expressions' }
SCLParser >> addExpression [
    ^ super addExpression ==> [:r |
        r second inject: r first into: [:acc :each |
            SCLBinaryOp new operator: each first; left: acc; right: each second; yourself]]
]

{ #category : 'grammar-expressions' }
SCLParser >> andExpression [
    ^ super andExpression ==> [:r |
        r second inject: r first into: [:acc :each |
            SCLBinaryOp new operator: 'AND'; left: acc; right: each second; yourself]]
]

{ #category : 'grammar-statements' }
SCLParser >> assignmentStmt [
    ^ super assignmentStmt ==> [:r | SCLAssignment new target: r first; value: r third; yourself]
]

{ #category : 'grammar-declarations' }
SCLParser >> attrBlock [
    ^ super attrBlock ==> [:r | OrderedCollection with: r second withAll: r third]
]

{ #category : 'grammar-declarations' }
SCLParser >> attrPair [
    ^ super attrPair ==> [:r | SCLAttrPair new key: r first; value: r third; yourself]
]

{ #category : 'grammar-literals' }
SCLParser >> boolLiteral [
    ^ super boolLiteral ==> [:s | SCLLiteral new value: s; kind: #bool; yourself]
]

{ #category : 'grammar-expressions' }
SCLParser >> callArgument [
    ^ super callArgument ==> [:r |
        (r isKindOf: Array)
            ifTrue: [SCLCallArgument new parameter: r first; direction: r second; value: r third; yourself]
            ifFalse: [SCLCallArgument new parameter: nil; direction: nil; value: r; yourself]]
]

{ #category : 'grammar-expressions' }
SCLParser >> callArguments [
    ^ super callArguments ==> [:r | OrderedCollection with: r first withAll: r second]
]

{ #category : 'grammar-expressions' }
SCLParser >> callExpression [
    ^ super callExpression ==> [:r |
        SCLCallExpression new
            name: r first;
            arguments: (r third ifNil: [#()]);
            yourself]
]

{ #category : 'grammar-statements' }
SCLParser >> callStatement [
    ^ super callStatement ==> [:r | SCLCallStatement new call: r first; yourself]
]

{ #category : 'grammar-statements' }
SCLParser >> caseStatement [
    ^ super caseStatement ==> [:r |
        SCLCaseStatement new
            expression: r second;
            clauses: r fourth;
            elseClause: r fifth;
            yourself]
]

{ #category : 'grammar-expressions' }
SCLParser >> compareExpression [
    ^ super compareExpression ==> [:r |
        r second isNil
            ifTrue: [r first]
            ifFalse: [SCLBinaryOp new operator: r second first; left: r first; right: r second second; yourself]]
]

{ #category : 'grammar-statements' }
SCLParser >> elsifClause [
    ^ super elsifClause ==> [:r | SCLElsifClause new condition: r second; body: r fourth; yourself]
]

{ #category : 'grammar-statements' }
SCLParser >> exitStatement [
    ^ super exitStatement ==> [:_ | SCLExitStatement new]
]

{ #category : 'grammar-statements' }
SCLParser >> forStatement [
    ^ super forStatement ==> [:r |
        SCLForStatement new
            variable: (r at: 2);
            from: (r at: 4);
            to: (r at: 6);
            by: (r at: 7);
            body: (r at: 9);
            yourself]
]

{ #category : 'grammar-program' }
SCLParser >> function [
    ^ super function ==> [:r |
        SCLFunction new
            name: r second; returnType: r fourth; header: r fifth;
            varSections: r sixth; body: r seventh; yourself]
]

{ #category : 'grammar-program' }
SCLParser >> functionBlock [
    ^ super functionBlock ==> [:r |
        SCLFunctionBlock new
            name: r second; header: r third;
            varSections: r fourth; body: r fifth; yourself]
]

{ #category : 'grammar-declarations' }
SCLParser >> headerMetaLine [
    ^ super headerMetaLine ==> [:r | Association key: r first asLowercase asSymbol value: r third trimmed]
]

{ #category : 'grammar-declarations' }
SCLParser >> headerSection [
    ^ super headerSection ==> [:items | SCLHeader new rawItems: items; yourself]
]

{ #category : 'grammar-statements' }
SCLParser >> ifStatement [
    ^ super ifStatement ==> [:r |
        SCLIfStatement new
            condition: (r at: 2);
            thenPart: (r at: 4);
            elsifClauses: (r at: 5);
            elsePart: ((r at: 6) ifNil: [#()]);
            yourself]
]

{ #category : 'grammar-literals' }
SCLParser >> intLiteral [
    ^ super intLiteral ==> [:s | SCLLiteral new value: s; kind: #integer; yourself]
]

{ #category : 'grammar-expressions' }
SCLParser >> mulExpression [
    ^ super mulExpression ==> [:r |
        r second inject: r first into: [:acc :each |
            SCLBinaryOp new operator: each first; left: acc; right: each second; yourself]]
]

{ #category : 'grammar-expressions' }
SCLParser >> orExpression [
    ^ super orExpression ==> [:r |
        r second inject: r first into: [:acc :each |
            SCLBinaryOp new operator: 'OR'; left: acc; right: each second; yourself]]
]

{ #category : 'grammar-program' }
SCLParser >> organizationBlock [
    ^ super organizationBlock ==> [:r |
        SCLOrganizationBlock new
            name: r second; header: r third;
            varSections: r fourth; body: r fifth; yourself]
]

{ #category : 'grammar-expressions' }
SCLParser >> powerExpression [
    ^ super powerExpression ==> [:r |
        r second isNil
            ifTrue: [r first]
            ifFalse: [SCLBinaryOp new operator: '**'; left: r first; right: r second second; yourself]]
]

{ #category : 'grammar-expressions' }
SCLParser >> primary [
    ^ super primary ==> [:r |
        (r isKindOf: Array)
            ifTrue: [r second]
            ifFalse: [r]]
]

{ #category : 'grammar-literals' }
SCLParser >> realLiteral [
    ^ super realLiteral ==> [:s | SCLLiteral new value: s; kind: #real; yourself]
]

{ #category : 'grammar-statements' }
SCLParser >> repeatStatement [
    ^ super repeatStatement ==> [:r | SCLRepeatStatement new body: r second; condition: r fourth; yourself]
]

{ #category : 'grammar-statements' }
SCLParser >> returnStatement [
    ^ super returnStatement ==> [:_ | SCLReturnStatement new]
]

{ #category : 'grammar-program' }
SCLParser >> start [
    ^ super start ==> [:r | SCLFile new units: r; yourself]
]

{ #category : 'grammar-literals' }
SCLParser >> stringLiteral [
    ^ super stringLiteral ==> [:s | SCLLiteral new value: s; kind: #string; yourself]
]

{ #category : 'grammar-literals' }
SCLParser >> timeLiteral [
    ^ super timeLiteral ==> [:s | SCLLiteral new value: s; kind: #time; yourself]
]

{ #category : 'grammar-declarations' }
SCLParser >> typeName [
    ^ super typeName ==> [:r |
        | n |
        n := (r isKindOf: String)
            ifTrue: [r]
            ifFalse: [(r first asLowercase = 'array') ifTrue: ['Array'] ifFalse: ['Struct']].
        SCLType new name: n; yourself]
]

{ #category : 'grammar-expressions' }
SCLParser >> unaryExpression [
    ^ super unaryExpression ==> [:r |
        (r isKindOf: Array)
            ifTrue: [SCLUnaryOp new operator: r first; operand: r second; yourself]
            ifFalse: [r]]
]

{ #category : 'grammar-declarations' }
SCLParser >> varDecl [
    ^ super varDecl ==> [:r |
        SCLVarDecl new
            name: r first;
            attributes: (r third ifNil: [#()]);
            type: r fifth;
            defaultValue: r sixth;
            yourself]
]

{ #category : 'grammar-declarations' }
SCLParser >> varSection [
    ^ super varSection ==> [:r | SCLVarSection new kind: r first; retain: (r second = 'RETAIN'); declarations: r third; yourself]
]

{ #category : 'grammar-expressions' }
SCLParser >> variableRef [
    ^ super variableRef ==> [:r | SCLVariableRef new name: r first; members: r second; yourself]
]

{ #category : 'grammar-statements' }
SCLParser >> whileStatement [
    ^ super whileStatement ==> [:r | SCLWhileStatement new condition: r second; body: r fourth; yourself]
]

{ #category : 'grammar-expressions' }
SCLParser >> xorExpression [
    ^ super xorExpression ==> [:r |
        r second inject: r first into: [:acc :each |
            SCLBinaryOp new operator: 'XOR'; left: acc; right: each second; yourself]]
]
