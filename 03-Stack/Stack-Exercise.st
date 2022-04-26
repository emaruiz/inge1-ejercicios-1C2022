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

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:23:53'!
test02FoundInStackWithOneSentence
	self assert: ((SentenceFinderByPrefix new initializeWith: stackWithOneSentence) find: '1Sent') equals: collectionWithSentenceOne.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 19:48:41'!
test03NotFoundInStackWithOneSentence
	self assert: ((SentenceFinderByPrefix new initializeWith: stackWithOneSentence) find: 'Two') equals: emptyCollection.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:24:08'!
test04FoundIsFirstInStackWithTwoSentences
	self assert: ((SentenceFinderByPrefix new initializeWith: stackWithTwoSentences) find: '1Sentence') equals: collectionWithSentenceOne.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:24:17'!
test05FoundIsLastInStackWithTwoSentences
	self assert: ((SentenceFinderByPrefix new initializeWith: stackWithTwoSentences) find: '2Sentence') equals: collectionWithSentenceTwo.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:26:54'!
test06FoundAllInStackWithThreeSentences
	self assert: ((SentenceFinderByPrefix new initializeWith: stackWithIdenticalSentences) find: '1Sent') equals: collectionWithIdenticalSentences.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:27:14'!
test07NotFoundBecauseCaseSensitive
	self assert: ((SentenceFinderByPrefix new initializeWith: stackWithThreeSentences) find: '1sentence') equals: emptyCollection.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:11:07'!
test08EmptyPrefixRaisesError

	self
		should: [ (SentenceFinderByPrefix new initializeWith: stackWithThreeSentences) find: ''. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixEmptyErrorDescription ]
		
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:28:06'!
test09PrefixWithSpacesRaisesError

	self
		should: [ (SentenceFinderByPrefix new initializeWith: stackWithThreeSentences) find: '1Sentence one'. ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix prefixWithSpacesErrorDescription ]
		
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:41:37'!
test10FindMatchesAllAndMantainsSameOrderAsStack

	| stack collection |
	stack := ((OOStack new push: '-Hola'	) push: '-Que') push: '-Tal'.
	collection := OrderedCollection with: '-Hola' with: '-Que' with: '-Tal'.
	
	self assert: ((SentenceFinderByPrefix new initializeWith: stack) find: '-') equals: collection. 	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'JEO 4/26/2022 20:45:01'!
test11FindDoesntMatchAllAndMantainsSameOrderAsStack

	| stack collection |
	stack := ((OOStack new push: '-Hola'	) push: 'Que') push: '-Tal'.
	collection := OrderedCollection with: '-Hola' with: '-Tal'.
	
	self assert: ((SentenceFinderByPrefix new initializeWith: stack) find: '-') equals: collection. 	! !

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


!OOStack methodsFor: 'error handling' stamp: 'JEO 4/26/2022 18:51:21'!
stackEmptyError
	self error: self class stackEmptyErrorDescription.! !


!OOStack methodsFor: 'dispatch' stamp: 'JEO 4/26/2022 18:45:37'!
createPopTopExecutor
	^PopTopExecutor selectForStack: self.! !

!OOStack methodsFor: 'dispatch' stamp: 'JEO 4/26/2022 18:52:07'!
popWithEmptyContent
	self stackEmptyError.! !

!OOStack methodsFor: 'dispatch' stamp: 'JEO 4/26/2022 18:29:41'!
popWithNotEmptyContent
	^ content removeLast.! !

!OOStack methodsFor: 'dispatch' stamp: 'JEO 4/26/2022 18:52:14'!
topWithEmptyContent
	self stackEmptyError.! !

!OOStack methodsFor: 'dispatch' stamp: 'JEO 4/26/2022 18:30:20'!
topWithNotEmptyContent
	^ content last.! !


!OOStack methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:45:37'!
pop
	^(PopTopExecutor selectForStack: self) executePopInStack.! !

!OOStack methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:00:26'!
push: elementToPush 
	content add: elementToPush.! !

!OOStack methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:00:26'!
size
	^content size.! !

!OOStack methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:45:37'!
top
	^(PopTopExecutor selectForStack: self) executeTopInStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'NR 9/16/2021 17:39:43'!
stackEmptyErrorDescription
	
	^ 'stack is empty!!!!!!'! !


!classDefinition: #PopTopExecutor category: 'Stack-Exercise'!
Object subclass: #PopTopExecutor
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PopTopExecutor methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:54:30'!
executePopInStack
	self subclassResponsibility.! !

!PopTopExecutor methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:54:38'!
executeTopInStack
	self subclassResponsibility.! !


!PopTopExecutor methodsFor: 'initialization' stamp: 'JEO 4/26/2022 18:05:45'!
initializeWith: anOOStack
	stack := anOOStack.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PopTopExecutor class' category: 'Stack-Exercise'!
PopTopExecutor class
	instanceVariableNames: ''!

!PopTopExecutor class methodsFor: 'class initialization' stamp: 'JEO 4/26/2022 18:47:05'!
isTypeOfStackState: anOOStack
	self subclassResponsibility.! !

!PopTopExecutor class methodsFor: 'class initialization' stamp: 'JEO 4/26/2022 18:47:05'!
selectForStack: anOOStack
	| subclass |
	subclass := self subclasses detect: [:aSubclass | aSubclass isTypeOfStackState: anOOStack].
	
	^ subclass new initializeWith: anOOStack.! !


!classDefinition: #PopTopExecutorStateEmpty category: 'Stack-Exercise'!
PopTopExecutor subclass: #PopTopExecutorStateEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PopTopExecutorStateEmpty methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:35:30'!
executePopInStack
	^stack popWithEmptyContent.! !

!PopTopExecutorStateEmpty methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:35:57'!
executeTopInStack
	^stack topWithEmptyContent.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PopTopExecutorStateEmpty class' category: 'Stack-Exercise'!
PopTopExecutorStateEmpty class
	instanceVariableNames: ''!

!PopTopExecutorStateEmpty class methodsFor: 'class initialization' stamp: 'JEO 4/26/2022 18:47:05'!
isTypeOfStackState: anOOStack
	^ anOOStack isEmpty.! !


!classDefinition: #PopTopExecutorStateNotEmpty category: 'Stack-Exercise'!
PopTopExecutor subclass: #PopTopExecutorStateNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!PopTopExecutorStateNotEmpty methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:35:30'!
executePopInStack
	^ stack popWithNotEmptyContent.! !

!PopTopExecutorStateNotEmpty methodsFor: 'operations' stamp: 'JEO 4/26/2022 18:35:57'!
executeTopInStack
	^ stack topWithNotEmptyContent.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PopTopExecutorStateNotEmpty class' category: 'Stack-Exercise'!
PopTopExecutorStateNotEmpty class
	instanceVariableNames: ''!

!PopTopExecutorStateNotEmpty class methodsFor: 'class initialization' stamp: 'JEO 4/26/2022 18:47:05'!
isTypeOfStackState: anOOStack
	^ anOOStack isNotEmpty.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'operations' stamp: 'JEO 4/26/2022 20:49:57'!
find: aPrefix
	| results element |
	results := OrderedCollection new.
	
	aPrefix = '' ifTrue: [self error: self class prefixEmptyErrorDescription].
	(aPrefix findString: ' ') > 0 ifTrue: [self error: self class prefixWithSpacesErrorDescription].
	
	[stack isNotEmpty] whileTrue: 
		[element := stack pop.
		 (element beginsWith: aPrefix) ifTrue: [results addFirst: element].
		].
	
	^results.! !


!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'JEO 4/26/2022 19:01:21'!
initializeWith: anOOStack

	stack := anOOStack! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'JEO 4/26/2022 20:10:47'!
prefixEmptyErrorDescription
	^ 'empty prefix not allowed'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'JEO 4/26/2022 20:15:35'!
prefixWithSpacesErrorDescription
	^ 'prefix with empty spaces not allowed'.! !
