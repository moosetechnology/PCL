Class {
	#name : 'SCLParserTest',
	#superclass : 'PP2CompositeNodeTest',
	#category : 'SCL-Parser-Tests',
	#package : 'SCL-Parser-Tests'
}

{ #category : 'accessing' }
SCLParserTest >> parserClass [

	^ SCLParser
]

{ #category : 'tests-expressions' }
SCLParserTest >> testAddExpressionNode [

	self parse: 'a + b' rule: #addExpression.
	self assert: result class equals: SCLBinaryOp.
	self assert: result operator equals: '+'.
	self assert: result left class equals: SCLVariableRef.
	self assert: result right class equals: SCLVariableRef
]

{ #category : 'tests-expressions' }
SCLParserTest >> testAndExpressionNode [

	self parse: 'a AND b' rule: #andExpression.
	self assert: result class equals: SCLBinaryOp.
	self assert: result operator equals: 'AND'
]

{ #category : 'tests-statements' }
SCLParserTest >> testAssignmentStmtNode [

	self parse: 'x := 42;' rule: #assignmentStmt.
	self assert: result class equals: SCLAssignment.
	self assert: result target class equals: SCLVariableRef.
	self assert: result target name equals: 'x'.
	self assert: result value class equals: SCLLiteral.
	self assert: result value kind equals: #integer
]

{ #category : 'tests-declarations' }
SCLParserTest >> testAttrBlockNode [

	self parse: '{ key := ''val'' }' rule: #attrBlock.
	self assert: result class equals: OrderedCollection.
	self assert: result size equals: 1.
	self assert: result first class equals: SCLAttrPair
]

{ #category : 'tests-declarations' }
SCLParserTest >> testAttrPairNode [

	self parse: 'S7_SetPoint := ''False''' rule: #attrPair.
	self assert: result class equals: SCLAttrPair.
	self assert: result key equals: 'S7_SetPoint'.
	self assert: result value class equals: SCLLiteral
]

{ #category : 'tests-literals' }
SCLParserTest >> testBoolLiteralNode [

	self parse: 'TRUE' rule: #boolLiteral.
	self assert: result class equals: SCLLiteral.
	self assert: result kind equals: #bool.
	self assert: result value equals: 'TRUE'
]

{ #category : 'tests-expressions' }
SCLParserTest >> testCallArgumentOutputDirectionNode [

	self parse: 'y => z' rule: #callArgument.
	self assert: result class equals: SCLCallArgument.
	self assert: result parameter equals: 'y'.
	self assert: result direction equals: '=>'.
	self assert: result value class equals: SCLVariableRef
]

{ #category : 'tests-expressions' }
SCLParserTest >> testCallArgumentPositionalNode [
	"A positional argument has nil parameter and nil direction"

	self parse: '42' rule: #callArgument.
	self assert: result class equals: SCLCallArgument.
	self assert: result parameter isNil.
	self assert: result direction isNil.
	self assert: result value class equals: SCLLiteral
]

{ #category : 'tests-expressions' }
SCLParserTest >> testCallExpressionNamedInputArgNode [

	self parse: 'foo(x := 1)' rule: #callExpression.
	self assert: result class equals: SCLCallExpression.
	self assert: result arguments size equals: 1.
	self assert: result arguments first class equals: SCLCallArgument.
	self assert: result arguments first parameter equals: 'x'.
	self assert: result arguments first direction equals: ':='
]

{ #category : 'tests-expressions' }
SCLParserTest >> testCallExpressionNoArgsNode [

	self parse: 'foo()' rule: #callExpression.
	self assert: result class equals: SCLCallExpression.
	self assert: result name equals: 'foo'.
	self assert: result arguments isEmpty
]

{ #category : 'tests-statements' }
SCLParserTest >> testCallStatementNode [

	self parse: 'foo();' rule: #callStatement.
	self assert: result class equals: SCLCallStatement.
	self assert: result call class equals: SCLCallExpression.
	self assert: result call name equals: 'foo'
]

{ #category : 'tests-statements' }
SCLParserTest >> testCaseStatementElseNode [

	self
		parse: 'CASE x OF 1: y := 1; ELSE y := 0; END_CASE'
		rule: #caseStatement.
	self assert: result class equals: SCLCaseStatement.
	self assert: result elseClause size equals: 1.
	self assert: result elseClause first class equals: SCLAssignment
]

{ #category : 'tests-statements' }
SCLParserTest >> testCaseStatementNode [

	self parse: 'CASE x OF 1: y := 1; END_CASE' rule: #caseStatement.
	self assert: result class equals: SCLCaseStatement.
	self assert: result expression class equals: SCLVariableRef.
	self assert: result clauses size equals: 1.
	self assert: result elseClause isNil
]

{ #category : 'tests-expressions' }
SCLParserTest >> testCompareExpressionNode [

	self parse: 'a < b' rule: #compareExpression.
	self assert: result class equals: SCLBinaryOp.
	self assert: result operator equals: '<'.
	self assert: result left class equals: SCLVariableRef.
	self assert: result right class equals: SCLVariableRef
]

{ #category : 'tests-expressions' }
SCLParserTest >> testComparePassThroughNode [
	"compareExpression with no operator passes the operand through"

	self parse: '42' rule: #compareExpression.
	self assert: result class equals: SCLLiteral
]

{ #category : 'tests-expressions' }
SCLParserTest >> testDivExpressionNode [

	self parse: 'a / b' rule: #mulExpression.
	self assert: result class equals: SCLBinaryOp.
	self assert: result operator equals: '/'
]

{ #category : 'tests-statements' }
SCLParserTest >> testElsifClauseNode [

	self parse: 'ELSIF x > 0 THEN y := 1;' rule: #elsifClause.
	self assert: result class equals: SCLElsifClause.
	self assert: result condition class equals: SCLBinaryOp.
	self assert: result body size equals: 1.
	self assert: result body first class equals: SCLAssignment
]

{ #category : 'tests-statements' }
SCLParserTest >> testExitStatementNode [

	self parse: 'EXIT;' rule: #exitStatement.
	self assert: result class equals: SCLExitStatement
]

{ #category : 'tests-statements' }
SCLParserTest >> testForByStepNode [

	self
		parse: 'FOR i := 0 TO 100 BY 5 DO x := i; END_FOR'
		rule: #forStatement.
	self assert: result class equals: SCLForStatement.
	self assert: result by class equals: SCLLiteral.
	self assert: result by value equals: '5'
]

{ #category : 'tests-statements' }
SCLParserTest >> testForStatementNode [

	self
		parse: 'FOR i := 1 TO 10 DO x := x + 1; END_FOR'
		rule: #forStatement.
	self assert: result class equals: SCLForStatement.
	self assert: result variable class equals: SCLVariableRef.
	self assert: result variable name equals: 'i'.
	self assert: result from class equals: SCLLiteral.
	self assert: result to class equals: SCLLiteral.
	self assert: result by isNil.
	self assert: result body size equals: 1
]

{ #category : 'tests-program' }
SCLParserTest >> testFunctionBlockNode [

	self
		parse: 'FUNCTION_BLOCK myFB
BEGIN
END_FUNCTION_BLOCK'
		rule: #functionBlock.
	self assert: result class equals: SCLFunctionBlock.
	self assert: result name equals: 'myFB'.
	self assert: result varSections isEmpty.
	self assert: result body isEmpty
]

{ #category : 'tests-program' }
SCLParserTest >> testFunctionBodyNode [

	self
		parse: 'FUNCTION myFunc : INT
BEGIN
x := 1;
END_FUNCTION'
		rule: #function.
	self assert: result body size equals: 1.
	self assert: result body first class equals: SCLAssignment
]

{ #category : 'tests-program' }
SCLParserTest >> testFunctionNode [

	self
		parse: 'FUNCTION myFunc : INT
BEGIN
END_FUNCTION'
		rule: #function.
	self assert: result class equals: SCLFunction.
	self assert: result name equals: 'myFunc'.
	self assert: result returnType class equals: SCLType.
	self assert: result returnType name equals: 'INT'.
	self assert: result varSections isEmpty.
	self assert: result body isEmpty
]

{ #category : 'tests-program' }
SCLParserTest >> testFunctionVarSectionsNode [

	self
		parse: 'FUNCTION myFunc : INT
VAR_INPUT x : INT; END_VAR
BEGIN
RETURN;
END_FUNCTION'
		rule: #function.
	self assert: result class equals: SCLFunction.
	self assert: result varSections size equals: 1.
	self assert: result varSections first class equals: SCLVarSection.
	self assert: result varSections first kind equals: 'VAR_INPUT'
]

{ #category : 'tests-declarations' }
SCLParserTest >> testHeaderMetaLineNode [

	self parse: 'version = 1.0' rule: #headerMetaLine.
	self assert: result class equals: Association.
	self assert: result key equals: #version.
	self assert: result value equals: '1.0'
]

{ #category : 'tests-declarations' }
SCLParserTest >> testHeaderSectionNode [

	self parse: 'version = 1.0' rule: #headerSection.
	self assert: result class equals: SCLHeader.
	self assert: result rawItems size equals: 1
]

{ #category : 'tests-statements' }
SCLParserTest >> testIfElseStatementNode [

	self
		parse: 'IF x > 0 THEN y := 1; ELSE y := 0; END_IF'
		rule: #ifStatement.
	self assert: result class equals: SCLIfStatement.
	self assert: result elsePart size equals: 1.
	self assert: result elsePart first class equals: SCLAssignment
]

{ #category : 'tests-statements' }
SCLParserTest >> testIfElsifClauseNode [

	self
		parse: 'IF x > 0 THEN y := 1; ELSIF x < 0 THEN y := -1; END_IF'
		rule: #ifStatement.
	self assert: result elsifClauses size equals: 1.
	self assert: result elsifClauses first class equals: SCLElsifClause.
	self
		assert: result elsifClauses first condition class
		equals: SCLBinaryOp
]

{ #category : 'tests-statements' }
SCLParserTest >> testIfStatementNode [

	self parse: 'IF x > 0 THEN y := 1; END_IF' rule: #ifStatement.
	self assert: result class equals: SCLIfStatement.
	self assert: result condition class equals: SCLBinaryOp.
	self assert: result thenPart size equals: 1.
	self assert: result thenPart first class equals: SCLAssignment.
	self assert: result elsifClauses isEmpty.
	self assert: result elsePart isEmpty
]

{ #category : 'tests-literals' }
SCLParserTest >> testIntLiteralNode [

	self parse: '42' rule: #intLiteral.
	self assert: result class equals: SCLLiteral.
	self assert: result kind equals: #integer.
	self assert: result value equals: '42'
]

{ #category : 'tests-expressions' }
SCLParserTest >> testMulExpressionNode [

	self parse: 'a * b' rule: #mulExpression.
	self assert: result class equals: SCLBinaryOp.
	self assert: result operator equals: '*'
]

{ #category : 'tests-expressions' }
SCLParserTest >> testOrExpressionNode [

	self parse: 'a OR b' rule: #orExpression.
	self assert: result class equals: SCLBinaryOp.
	self assert: result operator equals: 'OR'
]

{ #category : 'tests-program' }
SCLParserTest >> testOrganizationBlockNode [

	self
		parse: 'ORGANIZATION_BLOCK MAIN
BEGIN
END_ORGANIZATION_BLOCK'
		rule: #organizationBlock.
	self assert: result class equals: SCLOrganizationBlock.
	self assert: result name equals: 'MAIN'.
	self assert: result varSections isEmpty.
	self assert: result body isEmpty
]

{ #category : 'tests-expressions' }
SCLParserTest >> testPowerExpressionNode [

	self parse: 'a ** b' rule: #powerExpression.
	self assert: result class equals: SCLBinaryOp.
	self assert: result operator equals: '**'.
	self assert: result left class equals: SCLVariableRef.
	self assert: result right class equals: SCLVariableRef
]

{ #category : 'tests-literals' }
SCLParserTest >> testRealLiteralNode [

	self parse: '3.14' rule: #realLiteral.
	self assert: result class equals: SCLLiteral.
	self assert: result kind equals: #real.
	self assert: result value equals: '3.14'
]

{ #category : 'tests-statements' }
SCLParserTest >> testRepeatStatementNode [

	self
		parse: 'REPEAT x := x - 1; UNTIL x = 0 END_REPEAT'
		rule: #repeatStatement.
	self assert: result class equals: SCLRepeatStatement.
	self assert: result body size equals: 1.
	self assert: result body first class equals: SCLAssignment.
	self assert: result condition class equals: SCLBinaryOp
]

{ #category : 'tests-statements' }
SCLParserTest >> testReturnStatementNode [

	self parse: 'RETURN;' rule: #returnStatement.
	self assert: result class equals: SCLReturnStatement
]

{ #category : 'tests-program' }
SCLParserTest >> testStartMultipleUnitsNode [

	self
		parse: 'FUNCTION myFunc : INT
BEGIN
END_FUNCTION
FUNCTION_BLOCK myFB
BEGIN
END_FUNCTION_BLOCK'
		rule: #start.
	self assert: result class equals: SCLFile.
	self assert: result units size equals: 2.
	self assert: result units first class equals: SCLFunction.
	self assert: result units second class equals: SCLFunctionBlock
]

{ #category : 'tests-program' }
SCLParserTest >> testStartNode [

	self
		parse: 'FUNCTION_BLOCK myFB
BEGIN
x := 1;
END_FUNCTION_BLOCK'
		rule: #start.
	self assert: result class equals: SCLFile.
	self assert: result units size equals: 1.
	self assert: result units first class equals: SCLFunctionBlock.
	self assert: result units first name equals: 'myFB'
]

{ #category : 'tests-literals' }
SCLParserTest >> testStringLiteralNode [

	self parse: '''hello''' rule: #stringLiteral.
	self assert: result class equals: SCLLiteral.
	self assert: result kind equals: #string.
	self assert: result value equals: '''hello'''
]

{ #category : 'tests-expressions' }
SCLParserTest >> testSubExpressionNode [

	self parse: 'a - b' rule: #addExpression.
	self assert: result class equals: SCLBinaryOp.
	self assert: result operator equals: '-'
]

{ #category : 'tests-literals' }
SCLParserTest >> testTimeLiteralNode [

	self parse: 'T#1s' rule: #timeLiteral.
	self assert: result class equals: SCLLiteral.
	self assert: result kind equals: #time.
	self assert: result value equals: 'T#1s'
]

{ #category : 'tests-declarations' }
SCLParserTest >> testTypeNameArrayNode [

	self parse: 'ARRAY [1..10] OF INT' rule: #typeName.
	self assert: result class equals: SCLType.
	self assert: result name equals: 'Array'
]

{ #category : 'tests-declarations' }
SCLParserTest >> testTypeNameNode [

	self parse: 'INT' rule: #typeName.
	self assert: result class equals: SCLType.
	self assert: result name equals: 'INT'
]

{ #category : 'tests-expressions' }
SCLParserTest >> testUnaryNotNode [

	self parse: 'NOT x' rule: #unaryExpression.
	self assert: result class equals: SCLUnaryOp.
	self assert: result operator equals: 'NOT'.
	self assert: result operand class equals: SCLVariableRef
]

{ #category : 'tests-declarations' }
SCLParserTest >> testVarDeclNode [

	self parse: 'x : INT;' rule: #varDecl.
	self assert: result class equals: SCLVarDecl.
	self assert: result name equals: 'x'.
	self assert: result type class equals: SCLType.
	self assert: result type name equals: 'INT'.
	self assert: result defaultValue isNil
]

{ #category : 'tests-declarations' }
SCLParserTest >> testVarDeclWithDefaultNode [

	self parse: 'x : INT := 0;' rule: #varDecl.
	self assert: result class equals: SCLVarDecl.
	self assert: result defaultValue class equals: SCLLiteral.
	self assert: result defaultValue kind equals: #integer
]

{ #category : 'tests-declarations' }
SCLParserTest >> testVarRetainSectionNode [

	self parse: 'VAR RETAIN x : INT; END_VAR' rule: #varSection.
	self assert: result class equals: SCLVarSection.
	self assert: result retain equals: true
]

{ #category : 'tests-declarations' }
SCLParserTest >> testVarSectionNode [

	self parse: 'VAR x : INT; END_VAR' rule: #varSection.
	self assert: result class equals: SCLVarSection.
	self assert: result kind equals: 'VAR'.
	self assert: result retain equals: false.
	self assert: result declarations size equals: 1.
	self assert: result declarations first class equals: SCLVarDecl
]

{ #category : 'tests-expressions' }
SCLParserTest >> testVariableRefMemberAccessNode [

	self parse: 'a.b' rule: #variableRef.
	self assert: result class equals: SCLVariableRef.
	self assert: result name equals: 'a'.
	self assert: result members size equals: 1.
	self assert: result members first equals: 'b'
]

{ #category : 'tests-expressions' }
SCLParserTest >> testVariableRefNode [

	self parse: 'x' rule: #variableRef.
	self assert: result class equals: SCLVariableRef.
	self assert: result name equals: 'x'.
	self assert: result members isEmpty
]

{ #category : 'tests-statements' }
SCLParserTest >> testWhileStatementNode [

	self
		parse: 'WHILE x > 0 DO x := x - 1; END_WHILE'
		rule: #whileStatement.
	self assert: result class equals: SCLWhileStatement.
	self assert: result condition class equals: SCLBinaryOp.
	self assert: result body size equals: 1.
	self assert: result body first class equals: SCLAssignment
]

{ #category : 'tests-expressions' }
SCLParserTest >> testXorExpressionNode [

	self parse: 'a XOR b' rule: #xorExpression.
	self assert: result class equals: SCLBinaryOp.
	self assert: result operator equals: 'XOR'
]
