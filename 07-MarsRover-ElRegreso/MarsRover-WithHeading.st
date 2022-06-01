!classDefinition: #MarsRoverLoggerTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverLoggerTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:36:35'!
test01MarsRoverLoggerNoCommands
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	
	marsRover process: ''.
	
	logStream := logger readStream.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:48'!
test02MarsRoverLoggerMoveNorth
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followPosition.
	
	marsRover process: 'f'.
	
	logStream := logger readStream.
	self assert: '1@2' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:45'!
test03MarsRoverLoggerMoveSouth
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followPosition.
	
	marsRover process: 'b'.
	
	logStream := logger readStream.
	self assert: '1@0' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:39'!
test04MarsRoverLoggerMoveEast
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followPosition.
	
	marsRover process: 'f'.
	
	logStream := logger readStream.
	self assert: '2@1' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:35'!
test05MarsRoverLoggerMoveWest
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followPosition.
	
	marsRover process: 'b'.
	
	logStream := logger readStream.
	self assert: '0@1' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:29'!
test06MarsRoverLoggerHeadingEast
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followHeading.
	
	marsRover process: 'r'.
	
	logStream := logger readStream.
	self assert: 'East' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:25'!
test07MarsRoverLoggerHeadingSouth
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followHeading.
	
	marsRover process: 'r'.
	
	logStream := logger readStream.
	self assert: 'South' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:21'!
test08MarsRoverLoggerHeadingWest
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingSouth.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followHeading.
	
	marsRover process: 'r'.
	
	logStream := logger readStream.
	self assert: 'West' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:17'!
test09MarsRoverLoggerHeadingNorth
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingWest.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followHeading.
	
	marsRover process: 'r'.
	
	logStream := logger readStream.
	self assert: 'North' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:10'!
test10MarsRoverLoggerOnlyPositions
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followPosition.
	
	marsRover process: 'fr'.
	
	logStream := logger readStream.
	self assert: '1@2' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 18:46:05'!
test11MarsRoverLoggerOnlyHeadings
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followHeading.
	
	marsRover process: 'fr'.
	
	logStream := logger readStream.
	self assert: 'East' equals: logStream nextLine.
	self assert: logStream atEnd.! !

!MarsRoverLoggerTest methodsFor: 'test' stamp: 'edrr 6/1/2022 20:34:38'!
test12MarsRoverLoggerBothOptions
	|marsRover logger logStream |
	
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	
	logger := MarsRoverLogger followChangesOn: marsRover.
	logger followPosition.
	logger followHeading.
	
	marsRover process: 'fr'.
	
	logStream := logger readStream.
	self assert: '1@2' equals: logStream nextLine.
	self assert: 'East' equals: logStream nextLine.
	self assert: logStream atEnd.! !


!classDefinition: #MarsRoverTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:21:23'!
test01DoesNotMoveWhenNoCommand

	self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: '' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:12'!
test02IsAtFailsForDifferentPosition

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@2 heading: self north)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:31'!
test03IsAtFailsForDifferentHeading

	| marsRover |
	
	marsRover := MarsRover at: 1@1 heading: self north . 
	
	self deny: (marsRover isAt: 1@1 heading: self south)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:17'!
test04IncrementsYAfterMovingForwardWhenHeadingNorth

	self 
		assertIsAt: 1@3 
		heading: self north 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:30:11'!
test06DecrementsYAfterMovingBackwardsWhenHeadingNorth

	self 
		assertIsAt: 1@1 
		heading: self north 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:59'!
test07PointToEashAfterRotatingRightWhenHeadingNorth

	self 
		assertIsAt: 1@2 
		heading: self east 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:51'!
test08PointsToWestAfterRotatingLeftWhenPointingNorth

	self 
		assertIsAt: 1@2 
		heading: self west 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:45'!
test09DoesNotProcessInvalidCommand

	| marsRover |
	
	marsRover := MarsRover at: 1@2 heading: self north.
	
	self 
		should: [ marsRover process: 'x' ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: marsRover invalidCommandErrorDescription.
			self assert: (marsRover isAt: 1@2 heading: self north) ]! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:39'!
test10CanProcessMoreThanOneCommand

	self 
		assertIsAt: 1@4 
		heading: self north 
		afterProcessing: 'ff' 
		whenStartingAt: 1@2 
		heading: self north 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:31'!
test11IncrementsXAfterMovingForwareWhenHeadingEast

	self 
		assertIsAt: 2@2 
		heading: self east 
		afterProcessing: 'f' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:19'!
test12DecrementsXAfterMovingBackwardWhenHeadingEast

	self 
		assertIsAt: 0@2 
		heading: self east 
		afterProcessing: 'b' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:14'!
test13PointsToSouthAfterRotatingRightWhenHeadingEast

		self 
		assertIsAt: 1@2 
		heading: self south 
		afterProcessing: 'r' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:05'!
test14PointsToNorthAfterRotatingLeftWhenPointingEast

		self 
		assertIsAt: 1@2 
		heading: self north 
		afterProcessing: 'l' 
		whenStartingAt: 1@2 
		heading: self east 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:29:00'!
test15ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingSouth

	self 
		assertIsAt: 1@1 
		heading: self west 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self south 
! !

!MarsRoverTest methodsFor: 'tests' stamp: 'HAW 10/7/2021 20:28:52'!
test16ForwardBackwardsAndRotateRightWorkAsExpectedWhenPointingWest

	self 
		assertIsAt: 0@2 
		heading: self north 
		afterProcessing: 'ffblrr' 
		whenStartingAt: 1@2 
		heading: self west 
! !


!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:31'!
east

	^ MarsRoverHeadingEast ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:38'!
north

	^ MarsRoverHeadingNorth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:45'!
south

	^ MarsRoverHeadingSouth ! !

!MarsRoverTest methodsFor: 'headings' stamp: 'HAW 10/7/2021 20:09:54'!
west

	^ MarsRoverHeadingWest ! !


!MarsRoverTest methodsFor: 'assertions' stamp: 'HAW 10/7/2021 20:20:47'!
assertIsAt: newPosition heading: newHeadingType afterProcessing: commands whenStartingAt: startPosition heading: startHeadingType

	| marsRover |
	
	marsRover := MarsRover at: startPosition heading: startHeadingType. 
	
	marsRover process: commands.
	
	self assert: (marsRover isAt: newPosition heading: newHeadingType)! !


!classDefinition: #MarsRoverVisitorsTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverVisitorsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverVisitorsTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:31:41'!
test01MarsRoverTwoVisitors
	| marsRover window1 window2 |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window1 := MarsRoverWindow followChangesOn: marsRover.
	window2 := MarsRoverWindow followChangesOn: marsRover.
	window1 followHeading.
	window1 followPosition.
	window2 followHeading.
	window2 followPosition.
	
	marsRover process: 'fr'.
	
	self assert: '1@2' equals: window1 position.
	self assert: 'East' equals: window1 heading.
	self assert: window1 position equals: window2 position.
	self assert: window1 heading equals: window2 heading.! !


!classDefinition: #MarsRoverWindowTest category: 'MarsRover-WithHeading'!
TestCase subclass: #MarsRoverWindowTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 5/31/2022 21:00:14'!
test01MarsRoverWindowNoCommands
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := MarsRoverWindow followChangesOn: marsRover.
	
	marsRover process: ''.
	
	self assert: '' equals: window position.
	self assert: '' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:14:08'!
test02MarsRoverWindowMoveNorth
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followPosition.
	
	marsRover process: 'f'.
	
	self assert: '1@2' equals: window position.
	self assert: '' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:14:20'!
test03MarsRoverWindowMoveSouth
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followPosition.
	
	marsRover process: 'b'.
	
	self assert: '1@0' equals: window position.
	self assert: '' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:14:28'!
test04MarsRoverWindowMoveEast
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followPosition.
	
	marsRover process: 'f'.
	
	self assert: '2@1' equals: window position.
	self assert: '' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:14:36'!
test05MarsRoverWindowMoveWest
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followPosition.
	
	marsRover process: 'b'.
	
	self assert: '0@1' equals: window position.
	self assert: '' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:14:50'!
test06MarsRoverWindowHeadingEast
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followHeading.
	
	marsRover process: 'r'.
	
	self assert: '' equals: window position.
	self assert: 'East' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:15:03'!
test07MarsRoverWindowHeadingSouth
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingEast.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followHeading.
	
	marsRover process: 'r'.
	
	self assert: '' equals: window position.
	self assert: 'South' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:15:09'!
test08MarsRoverWindowHeadingWest
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingSouth.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followHeading.
	
	marsRover process: 'r'.
	
	self assert: '' equals: window position.
	self assert: 'West' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:15:17'!
test09MarsRoverWindowHeadingNorth
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingWest.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followHeading.
	
	marsRover process: 'r'.
	
	self assert: '' equals: window position.
	self assert: 'North' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:15:32'!
test10MarsRoverWindowOnlyPosition
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followPosition.
	
	marsRover process: 'fr'.
	
	self assert: '1@2' equals: window position.
	self assert: '' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 19:15:42'!
test11MarsRoverWindowOnlyHeading
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followHeading.
	
	marsRover process: 'fr'.
	
	self assert: '' equals: window position.
	self assert: 'East' equals: window heading.! !

!MarsRoverWindowTest methodsFor: 'test' stamp: 'edrr 6/1/2022 20:34:19'!
test12MarsRoverWindowBothOptions
	| marsRover window |
	marsRover := MarsRover at: 1@1 heading: MarsRoverHeadingNorth.
	window := MarsRoverWindow followChangesOn: marsRover.
	window followPosition.
	window followHeading.
	
	marsRover process: 'fr'.
	
	self assert: '1@2' equals: window position.
	self assert: 'East' equals: window heading.! !


!classDefinition: #MarsRover category: 'MarsRover-WithHeading'!
Object subclass: #MarsRover
	instanceVariableNames: 'position head visitors'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:48:45'!
invalidCommandErrorDescription
	
	^'Invalid command'! !

!MarsRover methodsFor: 'exceptions' stamp: 'HAW 6/30/2018 19:50:26'!
signalInvalidCommand
	
	self error: self invalidCommandErrorDescription ! !


!MarsRover methodsFor: 'initialization' stamp: 'edrr 5/31/2022 20:14:42'!
initializeAt: aPosition heading: aHeadingType

	position := aPosition.
	head := aHeadingType for: self.
	visitors := OrderedCollection new.! !


!MarsRover methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:04:06'!
headEast
	
	self updateHeadingTo: (MarsRoverHeadingEast for: self)! !

!MarsRover methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:03:57'!
headNorth
	
	self updateHeadingTo: (MarsRoverHeadingNorth for: self)! !

!MarsRover methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:03:49'!
headSouth
	
	self updateHeadingTo: (MarsRoverHeadingSouth for: self)! !

!MarsRover methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:02:46'!
headWest
	
	self updateHeadingTo: (MarsRoverHeadingWest for: self).! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	head rotateLeft! !

!MarsRover methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	head rotateRight! !

!MarsRover methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:14:42'!
updateHeadingTo: aMarsRoverHeading

	head := aMarsRoverHeading.
	visitors do: [:aVisitor | aVisitor changeHeadingTo: head label]! !


!MarsRover methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:16:32'!
isAt: aPosition heading: aHeadingType

	^position = aPosition and: [ head isHeading: aHeadingType ]! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:51'!
isBackwardCommand: aCommand

	^aCommand = $b! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:16:19'!
isForwardCommand: aCommand

	^aCommand = $f ! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:51'!
isRotateLeftCommand: aCommand

	^aCommand = $l! !

!MarsRover methodsFor: 'testing' stamp: 'HAW 7/6/2018 18:17:21'!
isRotateRightCommand: aCommand

	^aCommand = $r! !


!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	head moveBackward! !

!MarsRover methodsFor: 'moving' stamp: 'edrr 5/31/2022 19:55:17'!
moveEast
	
	self updatePositionByAdding: 1@0.! !

!MarsRover methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	head moveForward! !

!MarsRover methodsFor: 'moving' stamp: 'edrr 5/31/2022 19:52:38'!
moveNorth
	
	self updatePositionByAdding: 0@1.! !

!MarsRover methodsFor: 'moving' stamp: 'edrr 5/31/2022 19:55:03'!
moveSouth
	
	self updatePositionByAdding: 0@-1.! !

!MarsRover methodsFor: 'moving' stamp: 'edrr 5/31/2022 19:54:45'!
moveWest
	
	self updatePositionByAdding: -1@0.! !

!MarsRover methodsFor: 'moving' stamp: 'edrr 5/31/2022 20:14:42'!
updatePositionByAdding: aPositionDelta

	position := position + aPositionDelta.
	visitors do: [:aVisitor | aVisitor changePositionTo: position]! !


!MarsRover methodsFor: 'command processing' stamp: 'HAW 6/30/2018 19:48:26'!
process: aSequenceOfCommands

	aSequenceOfCommands do: [:aCommand | self processCommand: aCommand ]
! !

!MarsRover methodsFor: 'command processing' stamp: 'HAW 8/22/2019 12:08:50'!
processCommand: aCommand

	(self isForwardCommand: aCommand) ifTrue: [ ^ self moveForward ].
	(self isBackwardCommand: aCommand) ifTrue: [ ^ self moveBackward ].
	(self isRotateRightCommand: aCommand) ifTrue: [ ^ self rotateRight ].
	(self isRotateLeftCommand: aCommand) ifTrue: [ ^ self rotateLeft ].

	self signalInvalidCommand.! !


!MarsRover methodsFor: 'visitor' stamp: 'edrr 5/31/2022 20:14:42'!
acceptVisitor: aMarsRoverVisitor 
	visitors add: aMarsRoverVisitor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover-WithHeading'!
MarsRover class
	instanceVariableNames: 'headings'!

!MarsRover class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:10:30'!
at: aPosition heading: aHeadingType
	
	^self new initializeAt: aPosition heading: aHeadingType! !


!classDefinition: #MarsRoverHeading category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverHeading
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeading methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:36:05'!
label
	self subclassResponsibility.! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'testing' stamp: 'HAW 10/7/2021 20:15:38'!
isHeading: aHeadingType

	^self isKindOf: aHeadingType ! !


!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	self subclassResponsibility ! !

!MarsRoverHeading methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward

	self subclassResponsibility ! !


!MarsRoverHeading methodsFor: 'initialization' stamp: 'HAW 10/7/2021 20:11:59'!
initializeFor: aMarsRover 
	
	marsRover := aMarsRover.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverHeading class' category: 'MarsRover-WithHeading'!
MarsRoverHeading class
	instanceVariableNames: ''!

!MarsRoverHeading class methodsFor: 'instance creation' stamp: 'HAW 10/7/2021 20:11:35'!
for: aMarsRover 
	
	^self new initializeFor: aMarsRover ! !


!classDefinition: #MarsRoverHeadingEast category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingEast
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveWest! !

!MarsRoverHeadingEast methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveEast! !


!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:04:48'!
label
	^'East'! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headNorth! !

!MarsRoverHeadingEast methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headSouth! !


!classDefinition: #MarsRoverHeadingNorth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingNorth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveSouth! !

!MarsRoverHeadingNorth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveNorth! !


!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:06:21'!
label
	^'North'! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headWest! !

!MarsRoverHeadingNorth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headEast! !


!classDefinition: #MarsRoverHeadingSouth category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingSouth
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward
	
	^marsRover moveNorth! !

!MarsRoverHeadingSouth methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveSouth! !


!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:05:44'!
label
	^'South'! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headEast! !

!MarsRoverHeadingSouth methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headWest! !


!classDefinition: #MarsRoverHeadingWest category: 'MarsRover-WithHeading'!
MarsRoverHeading subclass: #MarsRoverHeadingWest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:24'!
moveBackward

	^marsRover moveEast! !

!MarsRoverHeadingWest methodsFor: 'moving' stamp: 'HAW 10/7/2021 20:13:53'!
moveForward
	
	^marsRover moveWest! !


!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'edrr 5/31/2022 20:06:04'!
label
	^'West'! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:20'!
rotateLeft
	
	^marsRover headSouth! !

!MarsRoverHeadingWest methodsFor: 'heading' stamp: 'HAW 10/7/2021 20:14:44'!
rotateRight
	
	^marsRover headNorth! !


!classDefinition: #MarsRoverVisitors category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverVisitors
	instanceVariableNames: 'options'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverVisitors methodsFor: 'followings' stamp: 'edrr 6/1/2022 19:57:46'!
followHeading
	options add: (MarsRoverVisitorHeading for: self).! !

!MarsRoverVisitors methodsFor: 'followings' stamp: 'edrr 6/1/2022 19:57:54'!
followPosition
	options add: (MarsRoverVisitorPositions for: self).! !


!MarsRoverVisitors methodsFor: 'initialization' stamp: 'edrr 6/1/2022 19:59:53'!
initializeFor: aMarsRover
	aMarsRover acceptVisitor: self.
	options := OrderedCollection new.! !


!MarsRoverVisitors methodsFor: 'operations' stamp: 'edrr 6/1/2022 20:19:55'!
changeHeadingTo: aHeading 
	options do: [:option | option processForChangeHeadingTo: aHeading].! !

!MarsRoverVisitors methodsFor: 'operations' stamp: 'edrr 6/1/2022 20:20:06'!
changePositionTo: aPosition 
	options do: [:option | option processForChangePositionTo: aPosition].! !


!MarsRoverVisitors methodsFor: 'operations-private' stamp: 'edrr 6/1/2022 20:15:37'!
processForHeadingOptionWith: aHeading
	self subclassResponsibility.! !

!MarsRoverVisitors methodsFor: 'operations-private' stamp: 'edrr 6/1/2022 20:15:16'!
processForPositionOptionWith: aPosition 
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverVisitors class' category: 'MarsRover-WithHeading'!
MarsRoverVisitors class
	instanceVariableNames: ''!

!MarsRoverVisitors class methodsFor: 'instance creation' stamp: 'edrr 6/1/2022 18:42:43'!
followChangesOn: aMarsRover 
	
	^self new initializeFollowChangesOn: aMarsRover ! !


!classDefinition: #MarsRoverLogger category: 'MarsRover-WithHeading'!
MarsRoverVisitors subclass: #MarsRoverLogger
	instanceVariableNames: 'stream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverLogger methodsFor: 'initialization' stamp: 'edrr 6/1/2022 20:00:34'!
initializeFollowChangesOn: aMarsRover 
	
	stream := WriteStream on: ''.
	super initializeFor: aMarsRover.! !


!MarsRoverLogger methodsFor: 'accessing' stamp: 'edrr 5/30/2022 21:19:39'!
readStream
	^ReadStream on: stream contents.! !


!MarsRoverLogger methodsFor: 'operations-private' stamp: 'edrr 6/1/2022 20:15:37'!
processForHeadingOptionWith: aHeading
	stream nextPutAll: aHeading.
	stream newLine.! !

!MarsRoverLogger methodsFor: 'operations-private' stamp: 'edrr 6/1/2022 20:15:16'!
processForPositionOptionWith: aPosition
	stream print: aPosition.
	stream newLine. 
	! !


!classDefinition: #MarsRoverWindow category: 'MarsRover-WithHeading'!
MarsRoverVisitors subclass: #MarsRoverWindow
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverWindow methodsFor: 'initialization' stamp: 'edrr 6/1/2022 20:00:20'!
initializeFollowChangesOn: aMarsRover 
	
	position := ''.
	heading := ''.
	super initializeFor: aMarsRover.! !


!MarsRoverWindow methodsFor: 'accessing' stamp: 'edrr 5/31/2022 18:24:47'!
heading
	^heading.! !

!MarsRoverWindow methodsFor: 'accessing' stamp: 'edrr 5/31/2022 20:59:17'!
position
	^position asString.! !


!MarsRoverWindow methodsFor: 'operations-private' stamp: 'edrr 6/1/2022 20:15:37'!
processForHeadingOptionWith: aHeading 
	heading := aHeading.! !

!MarsRoverWindow methodsFor: 'operations-private' stamp: 'edrr 6/1/2022 20:15:16'!
processForPositionOptionWith: aPosition 
	position := aPosition.! !


!classDefinition: #MarsRoverVisitorsOptions category: 'MarsRover-WithHeading'!
Object subclass: #MarsRoverVisitorsOptions
	instanceVariableNames: 'visitor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverVisitorsOptions methodsFor: 'operations' stamp: 'edrr 6/1/2022 20:22:01'!
processForChangeHeadingTo: aHeading 
	self subclassResponsibility.! !

!MarsRoverVisitorsOptions methodsFor: 'operations' stamp: 'edrr 6/1/2022 20:22:31'!
processForChangePositionTo: aPosition 
	self subclassResponsibility.! !


!classDefinition: #MarsRoverVisitorHeading category: 'MarsRover-WithHeading'!
MarsRoverVisitorsOptions subclass: #MarsRoverVisitorHeading
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverVisitorHeading methodsFor: 'operations' stamp: 'edrr 6/1/2022 20:21:01'!
processForChangeHeadingTo: aHeading 
	visitor processForHeadingOptionWith: aHeading.! !

!MarsRoverVisitorHeading methodsFor: 'operations' stamp: 'edrr 6/1/2022 20:40:44'!
processForChangePositionTo: aPosition 
	! !


!MarsRoverVisitorHeading methodsFor: 'initialization' stamp: 'edrr 6/1/2022 20:08:47'!
initializeFor: aMarsRoverLogger 
	
	visitor := aMarsRoverLogger.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverVisitorHeading class' category: 'MarsRover-WithHeading'!
MarsRoverVisitorHeading class
	instanceVariableNames: ''!

!MarsRoverVisitorHeading class methodsFor: 'instance creation' stamp: 'edrr 6/1/2022 19:06:04'!
for: aMarsRoverLogger 

	^self new initializeFor: aMarsRoverLogger ! !


!classDefinition: #MarsRoverVisitorPositions category: 'MarsRover-WithHeading'!
MarsRoverVisitorsOptions subclass: #MarsRoverVisitorPositions
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover-WithHeading'!

!MarsRoverVisitorPositions methodsFor: 'operations' stamp: 'edrr 6/1/2022 20:40:51'!
processForChangeHeadingTo: aHeading 
	! !

!MarsRoverVisitorPositions methodsFor: 'operations' stamp: 'edrr 6/1/2022 20:47:15'!
processForChangePositionTo: aPosition 
	visitor processForPositionOptionWith: aPosition.! !


!MarsRoverVisitorPositions methodsFor: 'initialization' stamp: 'edrr 6/1/2022 20:47:15'!
initializeFor: aMarsRoverLogger 
	
	visitor := aMarsRoverLogger.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverVisitorPositions class' category: 'MarsRover-WithHeading'!
MarsRoverVisitorPositions class
	instanceVariableNames: ''!

!MarsRoverVisitorPositions class methodsFor: 'instance creation' stamp: 'edrr 6/1/2022 19:04:42'!
for: aMarsRoverLogger 

	^self new initializeFor: aMarsRoverLogger ! !
