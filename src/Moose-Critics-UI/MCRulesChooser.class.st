Class {
	#name : #MCRulesChooser,
	#superclass : #DCBAllAddableChooser,
	#category : #'Moose-Critics-UI'
}

{ #category : #'DCB help' }
MCRulesChooser class >> help [
	<dcbHelp: 'Rules chooser'>
	<dcbIcon: #icon>
	<dcbOpen: #openRulesChooser>
	^ 'I am the widget used to choose the rules to test the database schema.

The left list contains available rules. The right list the rules chosen to analyse the database schema.
''Add all'' and ''Remove all'' buttons functions are explicit.

You can add/remove rules by moving items from a list to another using the buttons under the lists.

' , self doNotForgetHelp
]

{ #category : #accessing }
MCRulesChooser class >> icon [
	^ DCBIcons current listIcon
]

{ #category : #announcing }
MCRulesChooser >> announceNewRulesSelected [
	"self rightItems do: #clearEntitiesViolatingTheRule."
	self
		announce: (MCNewRulesChosen rules: self rightItems)
]

{ #category : #'private-helpers' }
MCRulesChooser >> anyListElementClassIs: class [
	^ (leftItems anySatisfy: [ :any | any class = class ])
			or: [ rightItems anySatisfy: [ :any | any class = class ] ].
]

{ #category : #'buttons-actions' }
MCRulesChooser >> applyAction [
	super applyAction.
	self announceNewRulesSelected
]

{ #category : #initialization }
MCRulesChooser >> initializeArrows [
	super initializeArrows.
	addRemoveWidget
		addButtonHelp: 'Add rule to the selection.';
		addAllButtonHelp: 'Add all rules to the selection.';
		removeButtonHelp: 'Remove rule from the selection.';
		removeAllButtonHelp: 'Remove all rules from the selection.'
]

{ #category : #initialization }
MCRulesChooser >> initializePresenter [
	super initializePresenter.
	self listsChooser
		displayBlock: [ :rule | rule name ];
		sortingBlock: [ :ruleA :ruleB | ruleA name < ruleB name ]
]

{ #category : #accessing }
MCRulesChooser >> leftListInitialItems [
	1 halt.
	^ MCRulesManager allRules
]

{ #category : #accessing }
MCRulesChooser >> leftListLabel [
	^ 'Available rules'
]

{ #category : #listening }
MCRulesChooser >> listenToThresholdsEditor: aDCBThresholdsEditor [
	aDCBThresholdsEditor announcer weak
		when: DCBThresholdChanged send: #thresholdChanged: to: self
]

{ #category : #'private-helpers' }
MCRulesChooser >> refreshList: list withItems: items [
	list
		items: items;
		sortingBlock: list sortingBlock;
		refreshListItems;
		updateList
]

{ #category : #'private-helpers' }
MCRulesChooser >> refreshLists [
	self refreshList: self listsChooser leftList withItems: self leftItems.
	self refreshList: self listsChooser rightList withItems: self rightItems.
]

{ #category : #accessing }
MCRulesChooser >> rightListLabel [
	^ 'Chosen rules'
]

{ #category : #'announcement handling' }
MCRulesChooser >> thresholdChanged: aDCBThresholdChanged [
	aDCBThresholdChanged newThreshold
		ifNil: [
			leftItems := leftItems reject: [ :rule | rule class = aDCBThresholdChanged rule class ].
			rightItems := rightItems reject: [ :rule | rule class = aDCBThresholdChanged rule class ] ]
		ifNotNil: [ 
			(self anyListElementClassIs: aDCBThresholdChanged rule class)
					ifFalse: [ leftItems add: aDCBThresholdChanged rule ] ].
	self refreshLists.
	self announceNewRulesSelected.
	self enableDisableButtons.
]

{ #category : #api }
MCRulesChooser >> title [
	^ 'Choose rules to use'
]
