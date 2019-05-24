Class {
	#name : #MCOpenRulesChooserCommand,
	#superclass : #MCCommand,
	#category : #'Moose-Critics-UI'
}

{ #category : #accessing }
MCOpenRulesChooserCommand class >> commandName [
	^ 'Choose Rules'
]

{ #category : #accessing }
MCOpenRulesChooserCommand class >> isAvailable [
	^ true
]

{ #category : #hooks }
MCOpenRulesChooserCommand >> execute [
	self receiver openRulesChooser.
]
