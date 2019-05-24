"
I am a MCRule...or MooseRule
I implement a check on a MooseEntity.
"
Class {
	#name : #MCTooManyFunctionsRule,
	#superclass : #MCBrowserAbstractRule,
	#category : #'Moose-Critics-DefaultRules'
}

{ #category : #testing }
MCTooManyFunctionsRule class >> acceptedEntityTypes [
"class or instance side?"
	^ { FAMIXModule }
]

{ #category : #testing }
MCTooManyFunctionsRule class >> isVisible [
	^ true
]

{ #category : #checking }
MCTooManyFunctionsRule >> check: anEntity [
	^ (anEntity functions size > 30)
]

{ #category : #visiting }
MCTooManyFunctionsRule >> name [
^ 'Too Many Functions'
]

{ #category : #visiting }
MCTooManyFunctionsRule >> rationale [
^ 'Module should have less than 5 functions'
]
