"
I run Rules over MooseModels
"
Class {
	#name : #MCRulesRunner,
	#superclass : #Object,
	#instVars : [
		'violations',
		'rules',
		'model',
		'violationsGroup'
	],
	#category : #'Moose-Critics'
}

{ #category : #'instance creation' }
MCRulesRunner class >> on: aModel [
	^ self new model: aModel; yourself.
]

{ #category : #validation }
MCRulesRunner >> check: aMooseEntiy [
	"check an entity if accepted by a rule then collect the violations"

	(self coherentRulesFor: aMooseEntiy)
		collect: [ :rule | 
			rule
				makeGreenIfEmpty;
				check: aMooseEntiy
				forViolationDo: [ :aViolation | 
					rule addEntity: aViolation target.
					
					self collectViolation: aViolation.
					self collectRule: rule ] ]
]

{ #category : #'model-checking' }
MCRulesRunner >> checkEntities [
	"Check all the entities of the model if it is not nil."
	self model ifNotNil: [ :m |
		self entities
			do: [ :entity | self check: entity ] ]
]

{ #category : #'model-checking' }
MCRulesRunner >> coherentRulesFor: anEntity [
	"Selects rules applicable on the entity and returns them."
	^ self rules select: [ :rule | rule acceptEntity: anEntity ]
]

{ #category : #accessing }
MCRulesRunner >> collectRule: anObject [
	violationsGroup addRule: anObject
]

{ #category : #accessing }
MCRulesRunner >> collectViolation: anObject [
	violationsGroup addViolation: anObject
]

{ #category : #validation }
MCRulesRunner >> entities [
	^ self model entities
]

{ #category : #initialization }
MCRulesRunner >> initialize [
	super initialize.
	violationsGroup := MCViolationGroup new.
]

{ #category : #accessing }
MCRulesRunner >> model [
	^ model
]

{ #category : #accessing }
MCRulesRunner >> model: anObject [
	model := anObject
]

{ #category : #accessing }
MCRulesRunner >> rules [
	"default rules for now"
	^ rules ifNil: [
		rules := MCRulesManager allRules]
]

{ #category : #accessing }
MCRulesRunner >> rules: aSet [
	rules := aSet
]

{ #category : #accessing }
MCRulesRunner >> violations [
	^ violationsGroup violations
]

{ #category : #accessing }
MCRulesRunner >> violations: anObject [
	violationsGroup violations: anObject
]
