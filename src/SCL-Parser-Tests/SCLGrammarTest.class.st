Class {
	#name : 'SCLGrammarTest',
	#superclass : 'PP2CompositeNodeTest',
	#category : 'SCL-Parser-Tests',
	#package : 'SCL-Parser-Tests'
}

{ #category : 'accessing' }
SCLGrammarTest >> parserClass [

	^ SCLGrammar
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testAddExpression [

	self parse: 'a + b' rule: #addExpression
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testAndExpression [

	self parse: 'a AND b' rule: #andExpression
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testAssignmentStmt [

	self parse: 'x := 42;' rule: #assignmentStmt
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testAssignmentStmtExpression [

	self parse: 'x := a + b;' rule: #assignmentStmt
]

{ #category : 'tests-declarations' }
SCLGrammarTest >> testAttrBlock [

	self parse: '{ S7_SetPoint := ''False'' }' rule: #attrBlock
]

{ #category : 'tests-declarations' }
SCLGrammarTest >> testAttrPair [

	self parse: 'S7_SetPoint := ''False''' rule: #attrPair
]

{ #category : 'tests-whitespace' }
SCLGrammarTest >> testBlockComment [

	self parse: '(* this is a block comment *)' rule: #blockComment
]

{ #category : 'tests-literals' }
SCLGrammarTest >> testBoolLiteralFalse [

	self parse: 'FALSE' rule: #boolLiteral
]

{ #category : 'tests-literals' }
SCLGrammarTest >> testBoolLiteralTrue [

	self parse: 'TRUE' rule: #boolLiteral
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testCallExpressionNamedInputArg [

	self parse: 'foo(x := 1)' rule: #callExpression
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testCallExpressionNoArgs [

	self parse: 'foo()' rule: #callExpression
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testCallExpressionOutputArg [

	self parse: 'foo(y => z)' rule: #callExpression
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testCallStatement [

	self parse: 'foo();' rule: #callStatement
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testCaseStatement [

	self
		parse: 'CASE x OF 1: y := 1; 2: y := 2; END_CASE'
		rule: #caseStatement
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testCaseStatementRangeLabel [

	self parse: 'CASE x OF 1..5: y := 1; END_CASE' rule: #caseStatement
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testCaseStatementWithElse [

	self
		parse: 'CASE x OF 1: y := 1; ELSE y := 0; END_CASE'
		rule: #caseStatement
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testCompareLess [

	self parse: 'a < b' rule: #compareExpression
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testCompareNotEqual [

	self parse: 'a <> b' rule: #compareExpression
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testDivExpression [

	self parse: 'a / b' rule: #mulExpression
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testExitStatement [

	self parse: 'EXIT;' rule: #exitStatement
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testForByStatement [

	self
		parse: 'FOR i := 0 TO 100 BY 5 DO x := i; END_FOR'
		rule: #forStatement
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testForStatement [

	self
		parse: 'FOR i := 1 TO 10 DO x := x + 1; END_FOR'
		rule: #forStatement
]

{ #category : 'tests-program' }
SCLGrammarTest >> testFunction [

	self
		parse: 'FUNCTION myFunc : INT
BEGIN
END_FUNCTION'
		rule: #function
]

{ #category : 'tests-program' }
SCLGrammarTest >> testFunctionBlock [

	self
		parse: 'FUNCTION_BLOCK myFB
BEGIN
END_FUNCTION_BLOCK'
		rule: #functionBlock
]

{ #category : 'tests-program' }
SCLGrammarTest >> testFunctionWithVarSection [

	self
		parse: 'FUNCTION myFunc : INT
VAR_INPUT x : INT; END_VAR
BEGIN
RETURN;
END_FUNCTION'
		rule: #function
]

{ #category : 'tests-terminals' }
SCLGrammarTest >> testIdentifier [

	self parse: 'myVar' rule: #identifier
]

{ #category : 'tests-terminals' }
SCLGrammarTest >> testIdentifierWithUnderscore [

	self parse: 'my_Var_1' rule: #identifier
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testIfElseStatement [

	self
		parse: 'IF x > 0 THEN y := 1; ELSE y := 0; END_IF'
		rule: #ifStatement
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testIfElsifStatement [

	self
		parse: 'IF x > 0 THEN y := 1; ELSIF x < 0 THEN y := -1; END_IF'
		rule: #ifStatement
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testIfStatement [

	self parse: 'IF x > 0 THEN y := 1; END_IF' rule: #ifStatement
]

{ #category : 'tests-literals' }
SCLGrammarTest >> testIntLiteralDecimal [

	self parse: '42' rule: #intLiteral
]

{ #category : 'tests-literals' }
SCLGrammarTest >> testIntLiteralHex [

	self parse: '16#FF' rule: #intLiteral
]

{ #category : 'tests-whitespace' }
SCLGrammarTest >> testLineComment [

	self parse: '// this is a comment' rule: #lineComment
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testModExpression [

	self parse: 'a MOD b' rule: #mulExpression
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testMulExpression [

	self parse: 'a * b' rule: #mulExpression
]

{ #category : 'tests-whitespace' }
SCLGrammarTest >> testNestedBlockComment [

	self parse: '(* outer (* inner *) outer *)' rule: #blockComment
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testOrExpression [

	self parse: 'a OR b' rule: #orExpression
]

{ #category : 'tests-program' }
SCLGrammarTest >> testOrganizationBlock [

	self
		parse: 'ORGANIZATION_BLOCK MAIN
BEGIN
END_ORGANIZATION_BLOCK'
		rule: #organizationBlock
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testPowerExpression [

	self parse: 'a ** b' rule: #powerExpression
]

{ #category : 'tests-terminals' }
SCLGrammarTest >> testQuotedIdentifier [

	self parse: '"My Quoted Var"' rule: #quotedIdentifier
]

{ #category : 'tests-literals' }
SCLGrammarTest >> testRealLiteral [

	self parse: '3.14' rule: #realLiteral
]

{ #category : 'tests-literals' }
SCLGrammarTest >> testRealLiteralWithExponent [

	self parse: '1.5E+3' rule: #realLiteral
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testRepeatStatement [

	self
		parse: 'REPEAT x := x - 1; UNTIL x = 0 END_REPEAT'
		rule: #repeatStatement
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testReturnStatement [

	self parse: 'RETURN;' rule: #returnStatement
]

{ #category : 'tests-program' }
SCLGrammarTest >> testStart [

	self
		parse: 'FUNCTION_BLOCK myFB
BEGIN
x := 1;
END_FUNCTION_BLOCK'
		rule: #start
]

{ #category : 'tests-literals' }
SCLGrammarTest >> testStringLiteral [

	self parse: '''hello''' rule: #stringLiteral
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testSubExpression [

	self parse: 'a - b' rule: #addExpression
]

{ #category : 'tests-literals' }
SCLGrammarTest >> testTimeLiteral [

	self parse: 'T#1s' rule: #timeLiteral
]

{ #category : 'tests-literals' }
SCLGrammarTest >> testTimeLiteralLongPrefix [

	self parse: 'TIME#1h30m' rule: #timeLiteral
]

{ #category : 'tests-declarations' }
SCLGrammarTest >> testTypeName [

	self parse: 'INT' rule: #typeName
]

{ #category : 'tests-declarations' }
SCLGrammarTest >> testTypeNameArray [

	self parse: 'ARRAY [1..10] OF INT' rule: #typeName
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testUnaryNeg [

	self parse: '-42' rule: #unaryExpression
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testUnaryNot [

	self parse: 'NOT x' rule: #unaryExpression
]

{ #category : 'tests-declarations' }
SCLGrammarTest >> testVarDecl [

	self parse: 'x : INT;' rule: #varDecl
]

{ #category : 'tests-declarations' }
SCLGrammarTest >> testVarDeclWithDefault [

	self parse: 'x : INT := 0;' rule: #varDecl
]

{ #category : 'tests-declarations' }
SCLGrammarTest >> testVarInputSection [

	self parse: 'VAR_INPUT x : INT; END_VAR' rule: #varSection
]

{ #category : 'tests-declarations' }
SCLGrammarTest >> testVarOutputSection [

	self parse: 'VAR_OUTPUT y : BOOL; END_VAR' rule: #varSection
]

{ #category : 'tests-declarations' }
SCLGrammarTest >> testVarSection [

	self parse: 'VAR x : INT; END_VAR' rule: #varSection
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testVariableRef [

	self parse: 'x' rule: #variableRef
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testVariableRefMemberAccess [

	self parse: 'a.b' rule: #variableRef
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testVariableRefSubscript [

	self parse: 'arr[0]' rule: #variableRef
]

{ #category : 'tests-statements' }
SCLGrammarTest >> testWhileStatement [

	self
		parse: 'WHILE x > 0 DO x := x - 1; END_WHILE'
		rule: #whileStatement
]

{ #category : 'tests-expressions' }
SCLGrammarTest >> testXorExpression [

	self parse: 'a XOR b' rule: #xorExpression
]
