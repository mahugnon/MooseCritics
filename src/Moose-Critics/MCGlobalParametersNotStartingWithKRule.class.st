"
Check for Global parameters not starting with ''k''
"
Class {
	#name : #MCGlobalParametersNotStartingWithKRule,
	#superclass : #MCBrowserAbstractRule,
	#category : #'Moose-Critics-DefaultRules'
}

{ #category : #testing }
MCGlobalParametersNotStartingWithKRule class >> acceptedEntityTypes [
"class or instance side?"
	^ { FAMIXGlobalVariable }
]

{ #category : #testing }
MCGlobalParametersNotStartingWithKRule class >> isVisible [
	^ true
]

{ #category : #checking }
MCGlobalParametersNotStartingWithKRule >> check: anEntity [

	^ anEntity isDeclaredFortranParameter and: [ (anEntity name first = $k) not ]

]

{ #category : #visiting }
MCGlobalParametersNotStartingWithKRule >> name [
	^ 'Global parameters not starting with ''k'''
]

{ #category : #visiting }
MCGlobalParametersNotStartingWithKRule >> rationale [
	^ 'Parameters accessed from all over the program should have their name starting with ''k'''
]
