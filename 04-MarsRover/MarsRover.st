!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/13/2022 20:12:44'!
test01MarsRoverStaysStillWhenRecivesEmptyComand
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: ''.
	
	self assert: (marsrover isAt: 0@0 heading: self southOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:01:58'!
test02MarsRoverMovesForwardWhenRecivesFComand
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'f'.
	
	self assert: (marsrover isAt: 0@-1 heading: self southOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:02:12'!
test03MarsRoverMovesForwardTwoTimesWhenRecivesTwoFComand
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'ff'.
	
	self assert: (marsrover isAt: 0@-2 heading: self southOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:02:22'!
test04MarsRoverMovesBackwardsWhenRecivesBComand
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'b'.
	
	self assert: (marsrover isAt: 0@1 heading: self southOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:02:28'!
test05MarsRoverMovesBackwardsTwoTimesWhenRecivesTwoBComand
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'bb'.
	
	self assert: (marsrover isAt: 0@2 heading: self southOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:02:36'!
test06MarsRoverRotatesLeftWhenRecivesLComand
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'l'.
	
	self assert: (marsrover isAt: 0@0 heading: self eastOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:02:42'!
test07MarsRoverRotatesTwoTimesLeftWhenRecivesTwoLComand
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'll'.
	
	self assert: (marsrover isAt: 0@0 heading: self northOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:02:48'!
test08MarsRoverRotatesRightWhenRecivesRComand
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'r'.
	
	self assert: (marsrover isAt: 0@0 heading: self westOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:02:55'!
test09MarsRoverRotatesTwoTimesRightWhenRecivesTwoRComand
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'rr'.
	
	self assert: (marsrover isAt: 0@0 heading: self northOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:03:02'!
test10MarsRoverRotateLeftThenMovesForward
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'lf'.
	
	self assert: (marsrover isAt: 1@0 heading: self eastOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:03:09'!
test11MarsRoverRotateLeftThenMovesBackwards
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'lb'.
	
	self assert: (marsrover isAt: -1@0 heading: self eastOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:03:17'!
test12MarsRoverRotateRightThenMovesForward
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'rf'.
	
	self assert: (marsrover isAt: -1@0 heading: self westOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:03:24'!
test13MarsRoverRotateRightThenMovesBackwards
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'rb'.
	
	self assert: (marsrover isAt: 1@0 heading: self westOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:03:30'!
test14MarsRoverRotateLeftThenMovesForwardTwoTimes
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'lff'.
	
	self assert: (marsrover isAt: 2@0 heading: self eastOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:03:38'!
test15MarsRoverRotateLeftThenMovesBackwardsTwoTimes
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'lbb'.
	
	self assert: (marsrover isAt: -2@0 heading: self eastOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:03:45'!
test16MarsRoverRotateRightThenMovesForwardTwoTimes
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'rff'.
	
	self assert: (marsrover isAt: -2@0 heading: self westOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:03:53'!
test17MarsRoverRotateRightThenMovesBackwardsTwoTimes
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'rbb'.
	
	self assert: (marsrover isAt: 2@0 heading: self westOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:04:02'!
test18MarsRoverRotatesThreeTimesLeft
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'lll'.
	
	self assert: (marsrover isAt: 0@0 heading: self westOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:04:07'!
test19MarsRoverRotatesFourTimesLeft
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'llll'.
	
	self assert: (marsrover isAt: 0@0 heading: self southOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:04:16'!
test20MarsRoverRotatesThreeTimesRight
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'rrr'.
	
	self assert: (marsrover isAt: 0@0 heading: self eastOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:04:21'!
test21MarsRoverRotatesFourTimesRight
	|marsrover|
	
	marsrover := self createMarsRoverHeadingSouth.
	marsrover processCommand: 'rrrr'.
	
	self assert: (marsrover isAt: 0@0 heading: self southOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:04:27'!
test22MarsRoverHeadingNorthThenMovesBackwards
	|marsrover|
	
	marsrover := self createMarsRoverHeadingNorth.
	marsrover processCommand: 'b'.
	
	self assert: (marsrover isAt: 0@-1 heading: self northOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:04:32'!
test23MarsRoverHeadingNorthThenMovesForward
	|marsrover|
	
	marsrover := self createMarsRoverHeadingNorth.
	marsrover processCommand: 'f'.
	
	self assert: (marsrover isAt: 0@1 heading: self northOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:04:37'!
test24MarsRoverRecievesInvalidCommandThenStops
	|marsrover|
	
	marsrover := self createMarsRoverHeadingNorth.
	marsrover processCommand: 'qf'.
	
	self assert: (marsrover isAt: 0@0 heading: self northOrientation).! !

!MarsRoverTest methodsFor: 'tests' stamp: 'jeo 5/14/2022 16:04:42'!
test25MarsRoverRecievesAnotherInvalidCommandStops
	|marsrover|
	
	marsrover := self createMarsRoverHeadingNorth.
	marsrover processCommand: '-f'.
	
	self assert: (marsrover isAt: 0@0 heading: self northOrientation).! !


!MarsRoverTest methodsFor: 'setUp' stamp: 'jeo 5/14/2022 15:48:07'!
createMarsRoverHeadingNorth

	^ MarsRover at: 0@0 heading: NorthOrientation.! !

!MarsRoverTest methodsFor: 'setUp' stamp: 'jeo 5/14/2022 15:48:13'!
createMarsRoverHeadingSouth

	^ MarsRover at: 0@0 heading: SouthOrientation.! !


!MarsRoverTest methodsFor: 'orientations' stamp: 'jeo 5/13/2022 20:13:35'!
eastOrientation

	^ EastOrientation! !

!MarsRoverTest methodsFor: 'orientations' stamp: 'jeo 5/13/2022 20:14:04'!
northOrientation

	^ NorthOrientation ! !

!MarsRoverTest methodsFor: 'orientations' stamp: 'jeo 5/13/2022 20:12:56'!
southOrientation

	^ SouthOrientation! !

!MarsRoverTest methodsFor: 'orientations' stamp: 'jeo 5/13/2022 20:31:48'!
westOrientation

	^ WestOrientation ! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position heading'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:46:31'!
headingEast

	^ heading:=EastOrientation new! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:46:44'!
headingNorth

	^ heading:=NorthOrientation new! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:46:55'!
headingSouth

	^ heading:=SouthOrientation new! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:47:08'!
headingWest

	^ heading:=WestOrientation new! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:38:00'!
moveBackwardsFromEast
	
	self moveWest! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:37:48'!
moveBackwardsFromNorth
	self moveSouth! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:37:08'!
moveBackwardsFromSouth
	
	self moveNorth! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:37:34'!
moveBackwardsFromWest
	
	self moveEast! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:37:34'!
moveEast

	^ position := (position x + 1) @ position y! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:37:34'!
moveForwardFromEast
	
	self moveEast! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:37:08'!
moveForwardFromNorth
	self moveNorth! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:37:48'!
moveForwardFromSouth
	
	self moveSouth! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:38:00'!
moveForwardFromWest
	
	self moveWest! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:37:08'!
moveNorth

	^ position := position x @ (position y+1)! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:37:48'!
moveSouth
	position := position x @ (position y-1)! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:38:00'!
moveWest

	^ position := (position x - 1) @ position y! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:46:44'!
rotateLeftFromEast
	
	self headingNorth.! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:47:08'!
rotateLeftFromNorth
	self headingWest! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:46:31'!
rotateLeftFromSouth
	
	self headingEast! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:46:55'!
rotateLeftFromWest
	
	self headingSouth! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:46:55'!
rotateRightFromEast
	self headingSouth.! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:46:31'!
rotateRightFromNorth
	
	self headingEast.! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:47:08'!
rotateRightFromSouth
	self headingWest! !

!MarsRover methodsFor: 'commands-private' stamp: 'jeo 5/14/2022 15:46:44'!
rotateRightFromWest
	self headingNorth! !


!MarsRover methodsFor: 'commands' stamp: 'jeo 5/14/2022 15:44:24'!
executeValidCommandSequence: validCommandSequence

	validCommandSequence do: [:aSingleCommand | 	 
		aSingleCommand = $f ifTrue: [self moveForward].
		aSingleCommand = $b ifTrue: [self moveBackwards].
		aSingleCommand = $l 		ifTrue: [self rotateLeft].
		aSingleCommand = $r ifTrue: [self rotateRight].]! !

!MarsRover methodsFor: 'commands' stamp: 'jeo 5/14/2022 15:53:20'!
isValidCommand: aSingleCommand
	
	^ self validCommands anySatisfy: [:aCommand | aSingleCommand = aCommand].! !

!MarsRover methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:50:00'!
moveBackwards
	
	heading moveBackwardsWithMarsRover: self.! !

!MarsRover methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:47:16'!
moveForward
	
	heading moveForwardWithMarsRover: self.! !

!MarsRover methodsFor: 'commands' stamp: 'jeo 5/14/2022 15:44:07'!
processCommand: aCommandSequence 
	| validCommandSequence |
	validCommandSequence := self processValidCommandSequence: aCommandSequence.
	self executeValidCommandSequence: validCommandSequence.! !

!MarsRover methodsFor: 'commands' stamp: 'edrr 5/14/2022 16:20:22'!
processValidCommandSequence: aCommandSequence 

	^aCommandSequence inject: '' into: [:validCommandSequence :aSingleCommand |
		(self isValidCommand: aSingleCommand)
			ifTrue: [validCommandSequence , aSingleCommand asString.]
			ifFalse: [^validCommandSequence]].! !

!MarsRover methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:47:28'!
rotateLeft

	heading rotateLeftWithMarsRover: self.! !

!MarsRover methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:47:34'!
rotateRight

	heading rotateRightWithMarsRover: self.! !

!MarsRover methodsFor: 'commands' stamp: 'jeo 5/14/2022 15:53:03'!
validCommands

	^ #($f $b $l $r)! !


!MarsRover methodsFor: 'position' stamp: 'jeo 5/14/2022 15:56:21'!
isAt: aPosition heading: aOrientationClass 
	
	^position = aPosition and: (heading isKindOf: aOrientationClass).! !


!MarsRover methodsFor: 'initialization' stamp: 'jeo 5/14/2022 15:56:48'!
initializeAt: aPosition heading: aOrientationClass 
	
	position := aPosition.
	heading := aOrientationClass new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'MarsRover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'jeo 5/14/2022 15:56:36'!
at: aPosition heading: aOrientationClass 
	
	^self new initializeAt: aPosition heading: aOrientationClass ! !


!classDefinition: #MarsRoverOrientation category: 'MarsRover'!
Object subclass: #MarsRoverOrientation
	instanceVariableNames: 'marsRover'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:44:25'!
moveBackwardsWithMarsRover: aMarsRover 

	self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:45:06'!
moveForwardWithMarsRover: aMarsRover
	
	self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:45:24'!
rotateLeftWithMarsRover: aMarsRover 

	self subclassResponsibility ! !

!MarsRoverOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:45:46'!
rotateRightWithMarsRover: aMarsRover 

	self subclassResponsibility ! !


!classDefinition: #EastOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #EastOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!EastOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:33:59'!
moveBackwardsWithMarsRover: aMarsRover 
	
	aMarsRover moveBackwardsFromEast! !

!EastOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:18:36'!
moveForwardWithMarsRover: aMarsRover
	
	aMarsRover moveForwardFromEast.! !

!EastOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:29:31'!
rotateLeftWithMarsRover: aMarsRover 
	
	aMarsRover rotateLeftFromEast! !

!EastOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:40:09'!
rotateRightWithMarsRover: aMarsRover 
	
	aMarsRover rotateRightFromEast! !


!classDefinition: #NorthOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #NorthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!NorthOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:41:02'!
moveBackwardsWithMarsRover: aMarsRover 
	
	aMarsRover moveBackwardsFromNorth! !

!NorthOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:41:58'!
moveForwardWithMarsRover: aMarsRover 
	
	aMarsRover moveForwardFromNorth! !

!NorthOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:37:26'!
rotateLeftWithMarsRover: aMarsRover 
	
	aMarsRover rotateLeftFromNorth! !

!NorthOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:39:18'!
rotateRightWithMarsRover: aMarsRover 
	
	aMarsRover rotateRightFromNorth! !


!classDefinition: #SouthOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #SouthOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!SouthOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:27:05'!
moveBackwardsWithMarsRover: aMarsRover 
	
	aMarsRover moveBackwardsFromSouth! !

!SouthOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:25:20'!
moveForwardWithMarsRover: aMarsRover 
	
	aMarsRover moveForwardFromSouth.! !

!SouthOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:27:48'!
rotateLeftWithMarsRover: aMarsRover 
	
	aMarsRover rotateLeftFromSouth! !

!SouthOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:30:31'!
rotateRightWithMarsRover: aMarsRover 
	
	aMarsRover rotateRightFromSouth.! !


!classDefinition: #WestOrientation category: 'MarsRover'!
MarsRoverOrientation subclass: #WestOrientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!WestOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:36:36'!
moveBackwardsWithMarsRover: aMarsRover 
	
	aMarsRover moveBackwardsFromWest! !

!WestOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:35:27'!
moveForwardWithMarsRover: aMarsRover 
	
	aMarsRover moveForwardFromWest! !

!WestOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:38:20'!
rotateLeftWithMarsRover: aMarsRover 
	
	aMarsRover rotateLeftFromWest! !

!WestOrientation methodsFor: 'commands' stamp: 'jeo 5/13/2022 20:32:18'!
rotateRightWithMarsRover: aMarsRover 
	
	aMarsRover rotateRightFromWest.! !
