"
I am a Rule. All my subclasses should implement #check: to check an entity in a Moose model

#checkModel: will check all entities in the model
"
Class {
	#name : #MCAbstractRule,
	#superclass : #Object,
	#category : #'Moose-Critics-Core'
}

{ #category : #checking }
MCAbstractRule class >> acceptedEntityTypes [
"class or instance side?"
	self subclassResponsibility.
]

{ #category : #testing }
MCAbstractRule class >> isVisible [
	^ false
]

{ #category : #visiting }
MCAbstractRule >> acceptEntity: anEntity [
	"Returns true if the entity can be accepted by the rule. Else returns false."
	^ self acceptEntityClass: anEntity class
]

{ #category : #visiting }
MCAbstractRule >> acceptEntityClass: anEntityClass [
	"Returns true if the class correspond to the entity accepted by the rule. Else returns false."
	
	^ self class acceptedEntityTypes includes: anEntityClass
]

{ #category : #'entity-checking' }
MCAbstractRule >> check: anEntity [
	^ self subclassResponsibility
]

{ #category : #checking }
MCAbstractRule >> check: anEntity forViolationDo: aCriticBlock [

	(self check: anEntity)
		ifTrue: [ aCriticBlock cull: (self violationFor: anEntity) ]
]

{ #category : #'entity-checking' }
MCAbstractRule >> checkModel: aModel [
	"aModel should implement #entities."
	^ self subclassResponsibility
]

{ #category : #visiting }
MCAbstractRule >> name [
	"Answer a human readable name of the rule."

	self subclassResponsibility
]

{ #category : #visiting }
MCAbstractRule >> rationale [
	"Answer an explanation of the rule, usually in one line. Long description can be obtained using longDescription."

	^ self class comment
]

{ #category : #visiting }
MCAbstractRule >> violationFor: anEntity [
	"I build a basic violation for an entity"
	^ MCViolation 
		of: self
		by: anEntity 
]
