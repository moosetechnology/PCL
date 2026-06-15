Class {
	#name : 'BaselineOfSCLParser',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfSCLParser',
	#package : 'BaselineOfSCLParser'
}

{ #category : 'baselines' }
BaselineOfSCLParser >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec description: 'SCL Parser for PLC programs'.
			self petitParser: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : 'baselines' }
BaselineOfSCLParser >> defineGroups: spec [

	spec
		group: 'default' with: #( 'core' );
		group: 'core' with: #( 'SCL-Parser' )
]

{ #category : 'baselines' }
BaselineOfSCLParser >> definePackages: spec [

	spec
		package: 'SCL-Parser'
		with: [ spec requires: #( 'PetitParser2Core' ) ]
]

{ #category : 'baselines' }
BaselineOfSCLParser >> petitParser: spec [

	spec
		baseline: 'PetitParser2Core'
		with: [ spec repository: 'github://kursjan/petitparser2:master' ]
]
