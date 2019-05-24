"
self open model inspect
"
Class {
	#name : #MooseCriticsBrowser,
	#superclass : #ComposablePresenter,
	#instVars : [
		'ruleRunner',
		'toolbar',
		'rulesLabel',
		'rulesTree',
		'entitiesLabel',
		'entitiesTree',
		'statusLabel',
		'rulesChooser',
		'classifier'
	],
	#category : #'Moose-Critics-UI'
}

{ #category : #specs }
MooseCriticsBrowser class >> defaultSpec [
	^ SpecLayout composed
		newColumn: [ :mainColumn | 
			mainColumn
				newRow: #toolbar height: self toolbarHeight;
				newRow: [ :labelsRow | 
					labelsRow
						newColumn: #rulesLabel;
						newColumn: #entitiesLabel ]
					height: self labelHeight ;
				newRow: [ :treesRow |
					treesRow
						newColumn: #rulesTree;
						newColumn: #entitiesTree ];
				newRow: #statusLabel height: self labelHeight ];
		yourself
]

{ #category : #defaults }
MooseCriticsBrowser class >> labelHeight [
	^ StandardFonts defaultFont height
]

{ #category : #'instance creation' }
MooseCriticsBrowser class >> open [
	<script>
	^ self new 
		openWithSpec
]

{ #category : #initialization }
MooseCriticsBrowser >> baseTitle [
	^ 'Moose Critics Browser'
]

{ #category : #api }
MooseCriticsBrowser >> entities: aCollectionOfREntities [
	self entitiesTree 
		roots: aCollectionOfREntities
]

{ #category : #accessing }
MooseCriticsBrowser >> entitiesLabel [
	^ entitiesLabel
]

{ #category : #accessing }
MooseCriticsBrowser >> entitiesTree [
	^ entitiesTree
]

{ #category : #'as yet unclassified' }
MooseCriticsBrowser >> informStatusLabel: aString [
	^ self statusLabel
		clearAndDisplay: aString
		during: 3 seconds
]

{ #category : #initialization }
MooseCriticsBrowser >> initialize [
	super initialize.
	self title: self baseTitle.
	self extent: 800@500.
	
	rulesChooser := MCRulesChooser new.
	rulesChooser announcer weak
		when: MCNewRulesChosen send: #updateRulesAccordingTo: to: self.
]

{ #category : #'as yet unclassified' }
MooseCriticsBrowser >> initializeBrowserRulesForRuleRunner [
	self rules: self ruleRunner rules
]

{ #category : #initialization }
MooseCriticsBrowser >> initializeRulesTree [
	rulesTree := self newTree.
	
	rulesTree
		childrenBlock: [ :node | #() ]; flag: 'TODO, If use classification';
		iconBlock: [ :node | node iconInBrowser  ];
		displayBlock: [ :node | node nameInBrowser ]; 
		whenSelectedItemChanged: [ :rule |
			self updateEntitiesForRuleOrNil: rule ].
]

{ #category : #initialization }
MooseCriticsBrowser >> initializeToolbar [
	toolbar := self instantiate: MenuModel.
	toolbar
		addGroup: [ :group |
			MCCommand availableCommands do: [ :commandClass |
				group
					addItem: [ :item |
						item
							enabled:true;
							name: commandClass commandName;
							action: [ (commandClass newReceiver: self) execute ] ] ] ]
]

{ #category : #initialization }
MooseCriticsBrowser >> initializeWidgets [
	entitiesLabel := self newLabel.
	entitiesLabel label: 'Violators:'.
	entitiesTree := self newTree.
	rulesLabel := self newLabel.
	rulesLabel label: 'Rules:'.
	self initializeRulesTree.
	statusLabel := InformationLabelModel new.
	self initializeToolbar
]

{ #category : #'as yet unclassified' }
MooseCriticsBrowser >> loadMooseModel [
	| file fileReference |
	file := UIManager default
		chooseExistingFileReference: 'Load a Moose model'
		extensions: #('mse')
		path: FileSystem workingDirectory
		preview: nil.	"UIManager default
		fileOpen: 'Load a Moose model'
		extensions: #('mse')
		path: FileSystem workingDirectory."
	file
		ifNotNil: [ | model |
			
			fileReference :=file.
			fileReference
				readStreamDo: [ :readStream | 
					model := MooseModel new
						name: file basename;
						importFromMSEStream: readStream.
					model rootFolder: fileReference parent.
					model install ].
			self ruleRunner: (MCRulesRunner on: model).
			self initializeBrowserRulesForRuleRunner.
			"self updateConfigurationWidgets."
			self title: self baseTitle , ' - ' , file basename.
			self informStatusLabel: 'Moose model loaded correctly.' ]
]

{ #category : #opening }
MooseCriticsBrowser >> openRulesChooser [
	rulesChooser openWithSpec
]

{ #category : #accessing }
MooseCriticsBrowser >> ruleRunner [
	^ ruleRunner
]

{ #category : #accessing }
MooseCriticsBrowser >> ruleRunner: anObject [
	ruleRunner := anObject
]

{ #category : #api }
MooseCriticsBrowser >> rules: aCollectionOfRules [
	self rulesTree
		roots: aCollectionOfRules
]

{ #category : #accessing }
MooseCriticsBrowser >> rulesLabel [
	^ rulesLabel
]

{ #category : #accessing }
MooseCriticsBrowser >> rulesTree [
	^ rulesTree
]

{ #category : #'as yet unclassified' }
MooseCriticsBrowser >> runAnalysis [
	self ruleRunner ifNotNil: #checkEntities.
	self rulesTree updateTree.
	
]

{ #category : #accessing }
MooseCriticsBrowser >> statusLabel [
	^ statusLabel
]

{ #category : #accessing }
MooseCriticsBrowser >> toolbar [
	^ toolbar
]

{ #category : #api }
MooseCriticsBrowser >> updateEntitiesForRuleOrNil: rule [
	rule ifNil: [
		self entities: #().
		^ self ].
	
	self entities: rule entities.
	self updateStatus: rule rationale.
]

{ #category : #'announcements handling' }
MooseCriticsBrowser >> updateRules: aCollectionOfRules [
	self ruleRunner
		ifNotNil: [ 
			self ruleRunner rules: aCollectionOfRules.
			self initializeBrowserRulesForRuleRunner.
			
			entitiesTree roots: OrderedCollection empty.
			self informStatusLabel: 'Rules updated.'. 
			].
		
	self informStatusLabel: 'No model loaded'. 
]

{ #category : #'announcements handling' }
MooseCriticsBrowser >> updateRulesAccordingTo: anAnnouncement [
	self updateRules: anAnnouncement rules.
	
	"classifier rules: self modelChecker rules." "no classifier"
	
]

{ #category : #api }
MooseCriticsBrowser >> updateStatus: aString [
	self statusLabel
		label: aString
]
