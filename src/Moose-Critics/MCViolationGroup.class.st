"
I contain violations for grouped actions.

I may be a  subclass of Collection.

TODO:
- #violationsByRule : a collection of Rules containing the entities violating them
- #violationsByEntity: a colleciton of Entities containing the rules  the vilate
"
Class {
	#name : #MCViolationGroup,
	#superclass : #MCAbstractViolation,
	#instVars : [
		'violations',
		'rules',
		'entities'
	],
	#category : #'Moose-Critics-Core'
}

{ #category : #'as yet unclassified' }
MCViolationGroup >> addRule: aRule [ 
	self rules add: aRule.
]

{ #category : #adding }
MCViolationGroup >> addViolation: aViolation [ 
	self violations add: aViolation.
]

{ #category : #accessing }
MCViolationGroup >> entities [
	^ entities
]

{ #category : #accessing }
MCViolationGroup >> entities: anObject [
	entities := anObject
]

{ #category : #accessing }
MCViolationGroup >> falsePositives [
	^ self violations collect: [ :aViolation | aViolation entity isFalsePositive ]
]

{ #category : #accessing }
MCViolationGroup >> rules [
	^ rules ifNil: [ rules := OrderedCollection empty ]
]

{ #category : #accessing }
MCViolationGroup >> rules: anObject [
	rules := anObject
]

{ #category : #accessing }
MCViolationGroup >> violations [
	^ violations ifNil: [ violations := OrderedCollection empty ]
]

{ #category : #accessing }
MCViolationGroup >> violations: anObject [
	violations := anObject
]
