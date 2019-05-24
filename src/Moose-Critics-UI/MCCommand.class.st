Class {
	#name : #MCCommand,
	#superclass : #Object,
	#instVars : [
		'receiver'
	],
	#category : #'Moose-Critics-UI'
}

{ #category : #accessing }
MCCommand class >> availableCommands [
	"Returns command classes available for the UI."
	^ self allSubclasses select: #isAvailable
]

{ #category : #accessing }
MCCommand class >> commandName [
	^ self subclassResponsibility
]

{ #category : #testing }
MCCommand class >> isAvailable [
	^ false
]

{ #category : #accessing }
MCCommand class >> newReceiver: aReceiver [
	^ self new receiver: aReceiver; yourself .
]

{ #category : #hooks }
MCCommand >> execute [
	self subclassResponsibility
]

{ #category : #accessing }
MCCommand >> receiver [
	^ receiver
]

{ #category : #accessing }
MCCommand >> receiver: anObject [
	receiver := anObject
]
