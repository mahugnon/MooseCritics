Class {
	#name : #MCRunAnalysisCommand,
	#superclass : #MCCommand,
	#category : #'Moose-Critics-UI'
}

{ #category : #accessing }
MCRunAnalysisCommand class >> commandName [
	^ 'Run analysis'
]

{ #category : #testing }
MCRunAnalysisCommand class >> isAvailable [
	^ true
]

{ #category : #hooks }
MCRunAnalysisCommand >> execute [
	self receiver runAnalysis.
]
