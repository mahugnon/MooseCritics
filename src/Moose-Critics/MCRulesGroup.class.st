"
I am group of MCRules. I can check an entity with all my elements with the method #check:
"
Class {
	#name : #MCRulesGroup,
	#superclass : #MCAbstractRule,
	#instVars : [
		'rules'
	],
	#category : #'Moose-Critics-Core'
}

{ #category : #testing }
MCRulesGroup class >> isVisible [
	^ false
]

{ #category : #visiting }
MCRulesGroup >> acceptEntity: anEntity [
	^ true.
]

{ #category : #'entity-checking' }
MCRulesGroup >> check: anEntity [
	^ MCViolationGroup new
		violations:
			(self rules
				select: [ :rule | rule acceptEntity: anEntity ]
				thenCollect: [ :rule | rule check: anEntity ]);
				yourself.
]

{ #category : #accessing }
MCRulesGroup >> rules [
	^ rules
]

{ #category : #accessing }
MCRulesGroup >> rules: anObject [
	rules := anObject
]
