"
A rule never raised 
"
Class {
	#name : #MCGreenRule,
	#superclass : #MCBrowserAbstractRule,
	#category : #'Moose-Critics-DefaultRules'
}

{ #category : #testing }
MCGreenRule class >> acceptedEntityTypes [
"class or instance side?"
	^ { FAMIXModule }
]

{ #category : #testing }
MCGreenRule class >> isVisible [
	^ true
]

{ #category : #checking }
MCGreenRule >> check: anEntity [
	^ false
]

{ #category : #visiting }
MCGreenRule >> name [
^ 'Green rule'
]

{ #category : #visiting }
MCGreenRule >> rationale [
^ 'I am never raised'
]
