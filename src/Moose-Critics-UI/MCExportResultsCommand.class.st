Class {
	#name : #MCExportResultsCommand,
	#superclass : #MCCommand,
	#category : #'Moose-Critics-UI'
}

{ #category : #accessing }
MCExportResultsCommand class >> commandName [
	^ 'Export Results'
]

{ #category : #testing }
MCExportResultsCommand class >> isAvailable [
	^ false
]

{ #category : #hooks }
MCExportResultsCommand >> execute [
	UIManager default inform: 'This should export results'
]
