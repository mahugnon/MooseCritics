"
I am raised for a MCRule on a MooseEntity

- rule: the DCRule which is violated
- target: the entity which raises the violation


- #
"
Class {
	#name : #MCViolation,
	#superclass : #MCAbstractViolation,
	#instVars : [
		'rule',
		'target',
		'resolution'
	],
	#category : #'Moose-Critics-Core'
}

{ #category : #'instance creation' }
MCViolation class >> of: aRule by: anEntity [
	^ self new
		rule: aRule;
		target: anEntity;
		yourself
]

{ #category : #testing }
MCViolation >> isFalsePositive [
	^ self resolution = MCAbstractViolationResolution falsePositive.
]

{ #category : #'as yet unclassified' }
MCViolation >> makeFalsePositive [
	self resolution: MCAbstractViolationResolution falsePositive.
]

{ #category : #accessing }
MCViolation >> resolution [
	^ resolution
]

{ #category : #accessing }
MCViolation >> resolution: anObject [
	resolution := anObject
]

{ #category : #accessing }
MCViolation >> rule [
	^ rule
]

{ #category : #accessing }
MCViolation >> rule: anObject [
	rule := anObject
]

{ #category : #accessing }
MCViolation >> target [
	^ target
]

{ #category : #accessing }
MCViolation >> target: anObject [
	target := anObject
]

{ #category : #accessing }
MCViolation >> violations [
	^ { self }
]
