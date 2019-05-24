Class {
	#name : #MCLoadModelCommand,
	#superclass : #MCCommand,
	#category : #'Moose-Critics-UI'
}

{ #category : #accessing }
MCLoadModelCommand class >> commandName [
	^ 'Load Model'
]

{ #category : #testing }
MCLoadModelCommand class >> isAvailable [
	^ true
]

{ #category : #hooks }
MCLoadModelCommand >> execute [
	self receiver loadMooseModel.
]
