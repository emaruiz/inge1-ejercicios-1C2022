!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 9/16/2021 17:40:17'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'firstSomething'.
	secondPushedObject := 'secondSomething'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: 'emptyStack stackWithOneSentence stackWithTwoSentences stackWithThreeSentences collectionWithSentenceOne collectionWithSentenceOneAndTwo collectionWithSentenceOneTwoAndThree emptyCollection collectionWithSentenceTwo stackWithIdenticalSentences collectionWithIdenticalSentences'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'JEO 4/26/2022 20:26:19'!
setUp
	| sentenceOne sentenceTwo sentenceThree |
	
	sentenceOne := '1Sentence one'.
	sentenceTwo := '2Sentence two'.
	sentenceThree := '3Sentence three'.
	
	emptyStack := OOStack new.
	stackWithOneSentence := OOStack new push: sentenceOne.
	stackWithTwoSentences := (OOStack new push: sentenceOne) push: sentenceTwo.
	stackWithThreeSentences := ((OOStack new push: sentenceOne) push: sentenceTwo) push: sentenceThree.
	stackWithIdenticalSentences := ((OOStack new push: sentenceOne) push: sentenceOne) push: sentenceOne.
	
	emptyCollection := OrderedCollection new.
	collectionWithSentenceOne := OrderedCollection with: sentenceOne.
	collectionWithSentenceTwo := OrderedCollection with: sentenceTwo.
	collectionWithSentenceOneAndTwo := OrderedCollection with: sentenceOne with: sentenceTwo.
	collectionWithSentenceOneTwoAndThree := OrderedCollection with: sentenceOne with: sentenceTwo with: sentenceThree.
	collectionWithIdenticalSentences := OrderedCollection with: sentenceOne with: sentenceOne with: sentenceOne.! !


!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:52:49'!
test01EmptyStack
	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new initializeWith: emptyStack.
	self assert: (sentenceFinder find: 'Sent') equals: emptyCollection.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:16:11'!
test02FoundInStackWithOneSentence
	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stackWithOneSentence.
	self assert: (sentenceFinder find: '1Sent') equals: collectionWithSentenceOne.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:17:36'!
test03NotFoundInStackWithOneSentence
	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stackWithOneSentence.
	self assert: (sentenceFinder find: 'Two') equals: emptyCollection.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:18:15'!
test04FoundIsFirstInStackWithTwoSentences
	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stackWithTwoSentences.
	self assert: (sentenceFinder find: '1Sentence') equals: collectionWithSentenceOne.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:18:52'!
test05FoundIsLastInStackWithTwoSentences
	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stackWithTwoSentences.
	self assert: (sentenceFinder find: '2Sentence') equals: collectionWithSentenceTwo.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:19:29'!
test06FoundAllInStackWithThreeSentences
	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stackWithIdenticalSentences.
	self assert: (sentenceFinder find: '1Sent') equals: collectionWithIdenticalSentences.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:20:06'!
test07NotFoundBecauseCaseSensitive
	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stackWithThreeSentences.
	self assert: (sentenceFinder find: '1sentence') equals: emptyCollection.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:21:20'!
test08EmptyPrefixRaisesError

	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stackWithThreeSentences.
	self
		should: [ sentenceFinder find: ''. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription ]
		
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:22:02'!
test09PrefixWithSpacesRaisesError

	| sentenceFinder |
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stackWithThreeSentences.
	self
		should: [ sentenceFinder find: '1Sentence one'. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithSpacesErrorDescription ]
		
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:22:40'!
test10FindMatchesAllAndMantainsSameOrderAsStack

	| stack collection sentenceFinder |
	stack := ((OOStack new push: '-Hola'	) push: '-Que') push: '-Tal'.
	collection := OrderedCollection with: '-Hola' with: '-Que' with: '-Tal'.
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stack.
	
	self assert: (sentenceFinder find: '-') equals: collection. 	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'edrr 4/27/2022 18:23:12'!
test11FindDoesntMatchAllAndMantainsSameOrderAsStack

	| stack collection sentenceFinder |
	stack := ((OOStack new push: '-Hola'	) push: 'Que') push: '-Tal'.
	collection := OrderedCollection with: '-Hola' with: '-Tal'.
	sentenceFinder := SentenceFinderByPrefix new initializeWith: stack.
	
	self assert: (sentenceFinder find: '-') equals: collection. 	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefixTest class' category: 'Stack-Exercise'!
SentenceFinderByPrefixTest class
	instanceVariableNames: 'stackWithOneSentence'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'testing' stamp: 'JEO 4/26/2022 18:00:26'!
isEmpty
	^content isEmpty.! !

!OOStack methodsFor: 'testing' stamp: 'JEO 4/26/2022 18:23:16'!
isNotEmpty
	^content size > 0.! !


!OOStack methodsFor: 'initialization' stamp: 'JEO 4/26/2022 18:00:26'!
initialize
	content := OrderedCollection new.! !


!OOStack methodsFor: 'error handling' stamp: 'edrr 4/27/2022 18:37:24'!
raiseErrorEmptyStack
	self error: self class stackEmptyErrorDescription.! !


!OOStack methodsFor: 'dispatch' stamp: 'edrr 4/27/2022 18:37:24'!
popWithEmptyContent
	self raiseErrorEmptyStack.! !

!OOStack methodsFor: 'dispatch' stamp: 'JEO 4/26/2022 18:29:41'!
popWithNotEmptyContent
	^ content removeLast.! !

!OOStack methodsFor: 'dispatch' stamp: 'edrr 4/27/2022 18:37:24'!
topWithEmptyContent
	self raiseErrorEmptyStack.! !

!OOStack methodsFor: 'dispatch' stamp: 'JEO 4/26/2022 18:30:20'!
topWithNotEmptyContent
	^ content last.! !


!OOStack methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:02:45'!
pop
	^(OOStackTopPopDispatcher newForStack: self) doPopInStack.! !

!OOStack methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:09:45'!
push: elementToPush 
	content add: elementToPush.! !

!OOStack methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:00:26'!
size
	^content size.! !

!OOStack methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:02:45'!
top
	^(OOStackTopPopDispatcher newForStack: self) doTopInStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #OOStackTopPopDispatcher category: 'Stack-Exercise'!
Object subclass: #OOStackTopPopDispatcher
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTopPopDispatcher methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:00:27'!
doPopInStack
	self subclassResponsibility.! !

!OOStackTopPopDispatcher methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:00:43'!
doTopInStack
	self subclassResponsibility.! !


!OOStackTopPopDispatcher methodsFor: 'initialization' stamp: 'JEO 4/26/2022 18:05:45'!
initializeWith: anOOStack
	stack := anOOStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackTopPopDispatcher class' category: 'Stack-Exercise'!
OOStackTopPopDispatcher class
	instanceVariableNames: ''!

!OOStackTopPopDispatcher class methodsFor: 'class initialization' stamp: 'JEO 4/26/2022 18:47:05'!
isTypeOfStackState: anOOStack
	self subclassResponsibility.! !

!OOStackTopPopDispatcher class methodsFor: 'class initialization' stamp: 'edrr 4/27/2022 19:02:45'!
newForStack: anOOStack
	| subclass |
	subclass := self subclasses detect: [:aSubclass | aSubclass isTypeOfStackState: anOOStack].
	
	^ subclass new initializeWith: anOOStack.! !


!classDefinition: #OOStackTopPopDispatcherForEmpty category: 'Stack-Exercise'!
OOStackTopPopDispatcher subclass: #OOStackTopPopDispatcherForEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTopPopDispatcherForEmpty methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:00:27'!
doPopInStack
	^stack popWithEmptyContent.! !

!OOStackTopPopDispatcherForEmpty methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:00:44'!
doTopInStack
	^stack topWithEmptyContent.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackTopPopDispatcherForEmpty class' category: 'Stack-Exercise'!
OOStackTopPopDispatcherForEmpty class
	instanceVariableNames: ''!

!OOStackTopPopDispatcherForEmpty class methodsFor: 'class initialization' stamp: 'JEO 4/26/2022 18:47:05'!
isTypeOfStackState: anOOStack
	^ anOOStack isEmpty.! !


!classDefinition: #OOStackTopPopDispatcherForNotEmpty category: 'Stack-Exercise'!
OOStackTopPopDispatcher subclass: #OOStackTopPopDispatcherForNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTopPopDispatcherForNotEmpty methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:00:27'!
doPopInStack
	^ stack popWithNotEmptyContent.! !

!OOStackTopPopDispatcherForNotEmpty methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:00:44'!
doTopInStack
	^ stack topWithNotEmptyContent.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackTopPopDispatcherForNotEmpty class' category: 'Stack-Exercise'!
OOStackTopPopDispatcherForNotEmpty class
	instanceVariableNames: ''!

!OOStackTopPopDispatcherForNotEmpty class methodsFor: 'class initialization' stamp: 'JEO 4/26/2022 18:47:05'!
isTypeOfStackState: anOOStack
	^ anOOStack isNotEmpty.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:35:53'!
find: aPrefix
	
	self raiseErrorIfPrefixNotEmpty: aPrefix.
	self raiseErrorIfPrefixHasSpaces: aPrefix.
	
	^self select: [:anElement | anElement beginsWith: aPrefix].! !

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'edrr 4/27/2022 19:35:42'!
select: aConditionBlock 
	| element results stackElements |
	results := OrderedCollection new.
	stackElements := OrderedCollection new.
	
	[stack isNotEmpty] whileTrue: 
		[element := stack pop.
		 (aConditionBlock value: element) ifTrue: [results addFirst: element].
		stackElements addFirst: element.
		].
	stackElements do: [:anElement | stack push: anElement ].
	^results.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'JEO 4/26/2022 19:01:21'!
initializeWith: anOOStack

	stack := anOOStack! !


!SentenceFinderByPrefix methodsFor: 'validation' stamp: 'edrr 4/27/2022 17:43:46'!
raiseErrorIfPrefixHasSpaces: aPrefix

	^ (aPrefix findString: ' ') > 0 ifTrue: [self error: self class prefixWithSpacesErrorDescription]! !

!SentenceFinderByPrefix methodsFor: 'validation' stamp: 'edrr 4/27/2022 17:43:05'!
raiseErrorIfPrefixNotEmpty: aPrefix

	^ aPrefix = '' ifTrue: [self error: self class prefixEmptyErrorDescription]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'JEO 4/26/2022 20:10:47'!
prefixEmptyErrorDescription
	^ 'empty prefix not allowed'.! !

!SentenceFinderByPrefix class methodsFor: 'error descriptions' stamp: 'JEO 4/26/2022 20:15:35'!
prefixWithSpacesErrorDescription
	^ 'prefix with empty spaces not allowed'.! !
