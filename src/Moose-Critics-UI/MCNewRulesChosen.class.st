"
I announce the fact that a new list of rules has been chosen.
"
Class {
	#name : #MCNewRulesChosen,
	#superclass : #DCBAnnouncement,
	#instVars : [
		'rules'
	],
	#category : #'Moose-Critics-UI'
}

{ #category : #'instance creation' }
MCNewRulesChosen class >> rules: aListOfRules [
	^ self new
		rules: aListOfRules;
		yourself
]

{ #category : #accessing }
MCNewRulesChosen >> rules [
	^ rules
]

{ #category : #accessing }
MCNewRulesChosen >> rules: anObject [
	rules := anObject
]
