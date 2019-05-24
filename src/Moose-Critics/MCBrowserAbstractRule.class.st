"
i have a reference to all entities violating me for easy rendering
"
Class {
	#name : #MCBrowserAbstractRule,
	#superclass : #MCAbstractRule,
	#instVars : [
		'entities',
		'iconInBrowser'
	],
	#category : #'Moose-Critics-Core'
}

{ #category : #accessing }
MCBrowserAbstractRule >> addEntity: anEntity [
	self entities add: anEntity.
	self makeRed
]

{ #category : #accessing }
MCBrowserAbstractRule >> entities [
	^ entities ifNil: [ OrderedCollection empty ]
]

{ #category : #accessing }
MCBrowserAbstractRule >> entities: anObject [
	entities := anObject
]

{ #category : #accessing }
MCBrowserAbstractRule >> iconInBrowser [
	^ iconInBrowser
		ifNil: [ iconInBrowser := self iconNamed: #testNotRun ]
]

{ #category : #accessing }
MCBrowserAbstractRule >> iconInBrowser: anIcon [

	iconInBrowser := anIcon
]

{ #category : #initialization }
MCBrowserAbstractRule >> initialize [
	super initialize.
	entities := Set new.
]

{ #category : #accessing }
MCBrowserAbstractRule >> makeGreen [
	self iconInBrowser: #testGreen asIcon
]

{ #category : #accessing }
MCBrowserAbstractRule >> makeGreenIfEmpty [
	self entities isEmpty
		ifTrue: [ self iconInBrowser: #testGreen asIcon ]
]

{ #category : #accessing }
MCBrowserAbstractRule >> makeRed [
	self iconInBrowser: #testRed asIcon
]

{ #category : #'as yet unclassified' }
MCBrowserAbstractRule >> nameInBrowser [
	^ self name ,' (', self entities size asString, ')'. 
]
