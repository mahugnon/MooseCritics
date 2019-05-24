Class {
	#name : #MCRulesManager,
	#superclass : #Object,
	#category : #'Moose-Critics'
}

{ #category : #accessing }
MCRulesManager class >> allRules [
	^ self visibleMooseRuleClasses
			collect: #new 
]

{ #category : #utility }
MCRulesManager class >> visibleMooseRuleClasses [

	^ MCAbstractRule withAllSubclasses select: #isVisible
]
