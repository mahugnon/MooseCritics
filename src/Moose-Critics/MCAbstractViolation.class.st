"
I am a rule  violation.
I associate a rule  and the entity which violates it
"
Class {
	#name : #MCAbstractViolation,
	#superclass : #Object,
	#category : #'Moose-Critics-Core'
}

{ #category : #accessing }
MCAbstractViolation >> violations [
	^ self subclassResponsibility.
]
