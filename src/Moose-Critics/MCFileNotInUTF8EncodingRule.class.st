"
I check that files shoud be in UTF8 encoding
"
Class {
	#name : #MCFileNotInUTF8EncodingRule,
	#superclass : #MCBrowserAbstractRule,
	#category : #'Moose-Critics-DefaultRules'
}

{ #category : #testing }
MCFileNotInUTF8EncodingRule class >> acceptedEntityTypes [
"class or instance side?"
	^ {FAMIXModule . FAMIXFunction . FAMIXProgram}
]

{ #category : #testing }
MCFileNotInUTF8EncodingRule class >> isVisible [
	^ true
]

{ #category : #checking }
MCFileNotInUTF8EncodingRule >> check: anEntity [
	"entity has source anchor with enoding not equls utf8"
	^ (anEntity sourceAnchor isNotNil) and: [ (anEntity sourceAnchor encoding = #utf8 ) not ]

]

{ #category : #visiting }
MCFileNotInUTF8EncodingRule >> name [
	^ 'File not in UTF-8 encoding'
]

{ #category : #visiting }
MCFileNotInUTF8EncodingRule >> rationale [
	^ 'Files should not be encoded in UTF-8'
]
