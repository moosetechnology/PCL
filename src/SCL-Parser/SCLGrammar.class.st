Class {
	#name : 'SCLGrammar',
	#superclass : 'PP2CompositeNode',
	#instVars : [
		'whitespace',
		'lineComment',
		'blockComment',
		'rawIdentifier',
		'identifier',
		'quotedIdentifier',
		'boolLiteral',
		'timeLiteral',
		'intLiteral',
		'realLiteral',
		'stringLiteral',
		'variableRef',
		'callExpression',
		'callArguments',
		'callArgument',
		'primary',
		'unaryExpression',
		'powerExpression',
		'mulExpression',
		'addExpression',
		'compareExpression',
		'andExpression',
		'xorExpression',
		'orExpression',
		'expression',
		'returnStatement',
		'exitStatement',
		'callStatement',
		'assignmentStmt',
		'caseLabel',
		'caseClause',
		'caseStatement',
		'repeatStatement',
		'whileStatement',
		'forStatement',
		'elsifClause',
		'ifStatement',
		'statement',
		'body',
		'typeName',
		'varDecl',
		'varSectionKind',
		'varSection',
		'varSections',
		'attrPair',
		'attrBlock',
		'headerMetaLine',
		'headerSection',
		'unitName',
		'function',
		'functionBlock',
		'organizationBlock',
		'programUnit',
		'start'
	],
	#category : 'SCL-Parser-Grammar',
	#package : 'SCL-Parser',
	#tag : 'Grammar'
}

{ #category : 'grammar-expressions' }
SCLGrammar >> addExpression [
    | op |
    op := (self tok: $+ asPParser) / (self tok: $- asPParser).
    ^ mulExpression , (op , mulExpression) star
]

{ #category : 'grammar-expressions' }
SCLGrammar >> andExpression [
    | op |
    op := (self keyword: 'AND') / (self tok: $& asPParser).
    ^ compareExpression , (op , compareExpression) star
]

{ #category : 'grammar-statements' }
SCLGrammar >> assignmentStmt [
    ^ variableRef , (self tok: ':=' asPParser) , expression , (self tok: $; asPParser)
]

{ #category : 'grammar-declarations' }
SCLGrammar >> attrBlock [
    | openB closeB semi |
    openB := self tok: ${ asPParser.
    closeB := self tok: $} asPParser.
    semi := self tok: $; asPParser.
    ^ openB , attrPair , (semi , attrPair ==> #second) star , closeB
]

{ #category : 'grammar-declarations' }
SCLGrammar >> attrPair [
    ^ identifier , (self tok: ':=' asPParser) , stringLiteral
]

{ #category : 'grammar-whitespace' }
SCLGrammar >> blockComment [
	| open close |
	open := (String with: $( with: $*) asPParser.
	close := (String with: $* with: $)) asPParser.
	^ open , (blockComment / close negate) star , close
]

{ #category : 'grammar-declarations' }
SCLGrammar >> body [
    ^ (self keyword: 'BEGIN') , statement star ==> #second
]

{ #category : 'grammar-literals' }
SCLGrammar >> boolLiteral [
	^ (self keyword: 'TRUE') / (self keyword: 'FALSE')
]

{ #category : 'grammar-expressions' }
SCLGrammar >> callArgument [
    | dir named positional |
    dir := (self tok: ':=' asPParser) / (self tok: '=>' asPParser).
    named := identifier , dir , expression.
    positional := expression.
    ^ named / positional
]

{ #category : 'grammar-expressions' }
SCLGrammar >> callArguments [
    | comma |
    comma := self tok: $, asPParser.
    ^ callArgument , (comma , callArgument ==> #second) star
]

{ #category : 'grammar-expressions' }
SCLGrammar >> callExpression [
    | dq rawQuotedId localHead head openP closeP |
    dq := Character value: 34.
    rawQuotedId := (dq asPParser , dq asPParser negate star , dq asPParser) flatten.
    localHead := ($# asPParser , (rawQuotedId / rawIdentifier)) flatten trim: whitespace.
    head := localHead / quotedIdentifier / identifier.
    openP := self tok: $( asPParser.
    closeP := self tok: $) asPParser.
    ^ head , openP , callArguments optional , closeP
]

{ #category : 'grammar-statements' }
SCLGrammar >> callStatement [
    ^ callExpression , (self tok: $; asPParser)
]

{ #category : 'grammar-statements' }
SCLGrammar >> caseClause [
    | comma colon |
    comma := self tok: $, asPParser.
    colon := self tok: $: asPParser.
    ^ caseLabel , (comma , caseLabel ==> #second) star , colon , statement star
]

{ #category : 'grammar-statements' }
SCLGrammar >> caseLabel [
    ^ intLiteral , (self tok: '..' asPParser) , intLiteral / intLiteral
]

{ #category : 'grammar-statements' }
SCLGrammar >> caseStatement [
    | elseColon elseClause |
    elseColon := self tok: $: asPParser.
    elseClause := (self keyword: 'ELSE') , elseColon optional , statement star
        ==> [:r | r third].
    ^ (self keyword: 'CASE') , expression , (self keyword: 'OF')
      , caseClause star
      , elseClause optional
      , (self keyword: 'END_CASE') , (self tok: $; asPParser) optional
]

{ #category : 'grammar-expressions' }
SCLGrammar >> compareExpression [
    | op |
    op := (self tok: '<>' asPParser) / (self tok: '<=' asPParser)
          / (self tok: '>=' asPParser) / (self tok: $< asPParser)
          / (self tok: $> asPParser) / (self tok: $= asPParser).
    ^ addExpression , (op , addExpression) optional
]

{ #category : 'grammar-statements' }
SCLGrammar >> elsifClause [
    ^ (self keyword: 'ELSIF') , expression , (self keyword: 'THEN') , statement star
]

{ #category : 'grammar-statements' }
SCLGrammar >> exitStatement [
    ^ (self keyword: 'EXIT') , (self tok: $; asPParser)
]

{ #category : 'grammar-expressions' }
SCLGrammar >> expression [
    ^ orExpression
]

{ #category : 'grammar-statements' }
SCLGrammar >> forStatement [
    | assignOp |
    assignOp := ':=' asPParser trim: whitespace.
    ^ (self keyword: 'FOR') , variableRef , assignOp ,
      expression , (self keyword: 'TO') , expression ,
      ((self keyword: 'BY') , expression ==> #second) optional ,
      (self keyword: 'DO') , statement star , (self keyword: 'END_FOR') ,
      (self tok: $; asPParser) optional
]

{ #category : 'grammar-program' }
SCLGrammar >> function [
    ^ (self keyword: 'FUNCTION') , unitName , (self tok: $: asPParser)
      , typeName , headerSection , varSections , body
      , (self keyword: 'END_FUNCTION')
]

{ #category : 'grammar-program' }
SCLGrammar >> functionBlock [
    ^ (self keyword: 'FUNCTION_BLOCK') , unitName , headerSection
      , varSections , body , (self keyword: 'END_FUNCTION_BLOCK')
]

{ #category : 'grammar-program' }
SCLGrammar >> headerMetaLine [
    | sep nonNewline |
    sep := (self tok: $= asPParser) / (self tok: $: asPParser).
    nonNewline := PP2PredicateObjectNode
        on: [:c | (c = Character lf) not and: [(c = Character cr) not]]
        message: 'non-newline'.
    ^ identifier , sep , nonNewline star flatten
]

{ #category : 'grammar-program' }
SCLGrammar >> headerSection [
    ^ (attrBlock / headerMetaLine) star
]

{ #category : 'grammar-terminals' }
SCLGrammar >> identifier [
	^ rawIdentifier trim: whitespace
]

{ #category : 'grammar-statements' }
SCLGrammar >> ifStatement [
    ^ (self keyword: 'IF') , expression , (self keyword: 'THEN')
      , statement star , elsifClause star
      , ((self keyword: 'ELSE') , statement star ==> #second) optional
      , (self keyword: 'END_IF') , (self tok: $; asPParser) optional
]

{ #category : 'grammar-literals' }
SCLGrammar >> intLiteral [
    | hexDigit hexLit decLit typedLit hashChar letterChar |
    hashChar := Character value: 35.
    hexDigit := PP2PredicateObjectNode
        on: [:c | c isDigit or: [c isLetter and: ['abcdef' includes: c asLowercase]]]
        message: 'hex digit'.
    letterChar := PP2PredicateObjectNode
        on: [:c | c isLetter]
        message: 'letter'.
    typedLit := (letterChar plus , hashChar asPParser , #digit asPParser plus ,
        hashChar asPParser , (PP2PredicateObjectNode
            on: [:c | c isAlphaNumeric]
            message: 'alphanum') plus)
        flatten trim: whitespace.
    hexLit := (#digit asPParser plus , hashChar asPParser , hexDigit plus)
        flatten trim: whitespace.
    decLit := #digit asPParser plus flatten trim: whitespace.
    ^ typedLit / hexLit / decLit
]

{ #category : 'parsing' }
SCLGrammar >> keyword: aString [
	^ (aString asPParser , (PP2PredicateObjectNode
		on: [:c | c isAlphaNumeric or: [c = $_]]
		message: 'word char') negate and) flatten trim: whitespace
]

{ #category : 'parsing' }
SCLGrammar >> keywordCI: aString [
	| wordChar kwParser |
	wordChar := PP2PredicateObjectNode
		on: [:c | c isAlphaNumeric or: [c = $_]]
		message: 'word char'.
	kwParser := nil.
	aString do: [:ch |
		| charParser |
		charParser := PP2PredicateObjectNode
			on: [:c | c asLowercase = ch asLowercase]
			message: ch asString.
		kwParser := kwParser isNil
			ifTrue: [charParser]
			ifFalse: [kwParser , charParser]].
	^ (kwParser , wordChar negate and) flatten trim: whitespace
]

{ #category : 'grammar-whitespace' }
SCLGrammar >> lineComment [
	^ (String with: $/ with: $/) asPParser , (PP2PredicateObjectNode
		on: [:c | c ~= Character lf and: [c ~= Character cr]]
		message: 'non-newline') star
]

{ #category : 'grammar-expressions' }
SCLGrammar >> mulExpression [
    | op |
    op := (self tok: $* asPParser) / (self tok: $/ asPParser) / (self keyword: 'MOD').
    ^ powerExpression , (op , powerExpression) star
]

{ #category : 'grammar-expressions' }
SCLGrammar >> orExpression [
    | op |
    op := self keyword: 'OR'.
    ^ xorExpression , (op , xorExpression) star
]

{ #category : 'grammar-program' }
SCLGrammar >> organizationBlock [
    ^ (self keyword: 'ORGANIZATION_BLOCK') , unitName , headerSection
      , varSections , body , (self keyword: 'END_ORGANIZATION_BLOCK')
]

{ #category : 'grammar-expressions' }
SCLGrammar >> powerExpression [
    | op |
    op := self tok: '**' asPParser.
    ^ unaryExpression , (op , unaryExpression) optional
]

{ #category : 'grammar-expressions' }
SCLGrammar >> primary [
    | openP closeP parenExpr |
    openP := self tok: $( asPParser.
    closeP := self tok: $) asPParser.
    parenExpr := openP , expression , closeP.
    ^ parenExpr / boolLiteral / timeLiteral / realLiteral / intLiteral / stringLiteral
        / callExpression / variableRef
]

{ #category : 'grammar-program' }
SCLGrammar >> programUnit [

    ^ organizationBlock / functionBlock / function
]

{ #category : 'grammar-terminals' }
SCLGrammar >> quotedIdentifier [
	| dq |
	dq := Character value: 34.
	^ (dq asPParser , dq asPParser negate star , dq asPParser) flatten trim: whitespace
]

{ #category : 'grammar-terminals' }
SCLGrammar >> rawIdentifier [
	^ ((PP2PredicateObjectNode
		on: [:c | c isLetter or: [c = $_]]
		message: 'letter or underscore') ,
		(PP2PredicateObjectNode
			on: [:c | c isAlphaNumeric or: [c = $_]]
			message: 'alphanumeric or underscore') star) flatten
]

{ #category : 'grammar-literals' }
SCLGrammar >> realLiteral [
	^ ($- asPParser optional , #digit asPParser plus , $. asPParser
	   , #digit asPParser plus
	   , ($E asPParser / $e asPParser
	      , ($+ asPParser / $- asPParser) optional , #digit asPParser plus)
	      optional) flatten trim: whitespace
]

{ #category : 'grammar-statements' }
SCLGrammar >> repeatStatement [
    ^ (self keyword: 'REPEAT') , statement star , (self keyword: 'UNTIL')
      , expression , (self keyword: 'END_REPEAT')
      , (self tok: $; asPParser) optional
]

{ #category : 'grammar-statements' }
SCLGrammar >> returnStatement [
    ^ (self keyword: 'RETURN') , (self tok: $; asPParser)
]

{ #category : 'grammar-program' }
SCLGrammar >> start [

	^ (programUnit plus) end
]

{ #category : 'grammar-statements' }
SCLGrammar >> statement [
    | emptyStmt regionStmt nonNewline |
    emptyStmt := (self tok: $; asPParser) ==> [:_ | nil].
    nonNewline := PP2PredicateObjectNode
        on: [:c | (c = Character lf) not and: [(c = Character cr) not]]
        message: 'non-newline'.
    regionStmt := (self keyword: 'REGION') , nonNewline star ,
        statement star , (self keyword: 'END_REGION') ,
        (self tok: $; asPParser) optional
        ==> [:_ | nil].
    ^ ifStatement / forStatement / whileStatement / repeatStatement /
      caseStatement / returnStatement / exitStatement / callStatement / assignmentStmt /
      regionStmt / emptyStmt
]

{ #category : 'grammar-literals' }
SCLGrammar >> stringLiteral [
	^ ($' asPParser , $' asPParser negate star , $' asPParser) flatten trim: whitespace
]

{ #category : 'grammar-literals' }
SCLGrammar >> timeLiteral [
	| timeChar prefix |
	timeChar := PP2PredicateObjectNode
		on: [:c | c isAlphaNumeric or: ['_.' includes: c]]
		message: 'time value char'.
	prefix := 'TIME#' asPParser / 'T#' asPParser trim: whitespace.
	^ (prefix , timeChar plus) flatten
]

{ #category : 'parsing' }
SCLGrammar >> tok: aParser [
	^ aParser trim: whitespace
]

{ #category : 'grammar-declarations' }
SCLGrammar >> typeName [
    | simpleType arrayType structType dot2 |
    simpleType := quotedIdentifier / identifier.
    dot2 := '..' asPParser trim: whitespace.
    arrayType := (self keywordCI: 'ARRAY') , (self tok: $[ asPParser) ,
        expression , dot2 , expression ,
        (self tok: $] asPParser) , (self keywordCI: 'OF') , typeName.
    structType := (self keywordCI: 'Struct') , varDecl star , (self keywordCI: 'End_Struct').
    ^ arrayType / structType / simpleType
]

{ #category : 'grammar-expressions' }
SCLGrammar >> unaryExpression [
    | notCase negCase |
    notCase := (self keyword: 'NOT') , unaryExpression.
    negCase := (self tok: $- asPParser) , unaryExpression.
    ^ notCase / negCase / primary
]

{ #category : 'grammar-program' }
SCLGrammar >> unitName [
    ^ quotedIdentifier / identifier
]

{ #category : 'grammar-declarations' }
SCLGrammar >> varDecl [
    | name localHead atAlias assignOp anyChar rawInit defaultVal |
    localHead := ($# asPParser , rawIdentifier) flatten trim: whitespace.
    name := quotedIdentifier / localHead / identifier.
    atAlias := (self keyword: 'AT') , name.
    assignOp := self tok: ':=' asPParser.
    anyChar := PP2PredicateObjectNode
        on: [:c | c ~= $;]
        message: 'non-semicolon'.
    rawInit := anyChar plus flatten trim: whitespace.
    defaultVal := (assignOp , (expression / rawInit) ==> #second) optional.
    ^ name , atAlias optional , attrBlock optional , (self tok: $: asPParser) ,
      typeName , defaultVal , (self tok: $; asPParser)
]

{ #category : 'grammar-declarations' }
SCLGrammar >> varSection [
    | modifier |
    modifier := (self keyword: 'RETAIN') / (self keyword: 'CONSTANT') / (self keyword: 'PERSISTENT').
    ^ varSectionKind , modifier optional , varDecl star , (self keyword: 'END_VAR')
]

{ #category : 'grammar-declarations' }
SCLGrammar >> varSectionKind [
    ^ (self keyword: 'VAR_INPUT') / (self keyword: 'VAR_OUTPUT')
      / (self keyword: 'VAR_IN_OUT') / (self keyword: 'VAR_TEMP')
      / (self keyword: 'VAR_EXTERNAL') / (self keyword: 'VAR')
]

{ #category : 'grammar-declarations' }
SCLGrammar >> varSections [
    ^ varSection star
]

{ #category : 'grammar-expressions' }
SCLGrammar >> variableRef [
    | dq rawQuotedId localHead percentAccess memberAccess subscriptAccess accessor |
    dq := Character value: 34.
    rawQuotedId := (dq asPParser , dq asPParser negate star , dq asPParser) flatten.
    localHead := ($# asPParser , (rawQuotedId / rawIdentifier)) flatten trim: whitespace.
    percentAccess := ($% asPParser , rawIdentifier) flatten trim: whitespace.
    memberAccess := (self tok: $. asPParser) ,
        (localHead / quotedIdentifier / percentAccess / (rawIdentifier trim: whitespace))
        ==> #second.
    subscriptAccess := (self tok: $[ asPParser) ,
        expression , ((self tok: $, asPParser) , expression ==> #second) star ,
        (self tok: $] asPParser)
        ==> [:r | Array with: r second withAll: r third].
    accessor := memberAccess / subscriptAccess.
    ^ (localHead / quotedIdentifier / identifier) , accessor star
]

{ #category : 'grammar-statements' }
SCLGrammar >> whileStatement [
    ^ (self keyword: 'WHILE') , expression , (self keyword: 'DO')
      , statement star , (self keyword: 'END_WHILE')
      , (self tok: $; asPParser) optional
]

{ #category : 'grammar-whitespace' }
SCLGrammar >> whitespace [
	^ (lineComment / blockComment / #space asPParser) star
]

{ #category : 'grammar-expressions' }
SCLGrammar >> xorExpression [
    | op |
    op := self keyword: 'XOR'.
    ^ andExpression , (op , andExpression) star
]
