!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'JEO 4/13/2022 18:01:00'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertExecute: [customerBook addCustomerNamed: 'John Lennon'.] inLessThanMilliseconds: 50.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JEO 4/13/2022 18:01:07'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	customerBook := self newCustomerBookWithCustomerNamed: 'Paul McCartney'.
	self assertExecute: [customerBook removeCustomerNamed: 'Paul McCartney'] inLessThanMilliseconds: 100.
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JEO 4/13/2022 19:04:38'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	self executeFail: [ customerBook addCustomerNamed: ''.] 
		on: Error 
		do:[ :anError | 			
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JEO 4/13/2022 19:04:56'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
	
	johnLennon := 'John Lennon'.
	customerBook := self newCustomerBookWithCustomerNamed: johnLennon.
	
	self executeFail: 	[ customerBook removeCustomerNamed: 'Paul McCartney'.]
		on: Error
		do: [ :anError |			self assertCustomerBook: customerBook includesOnly: johnLennon.]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JEO 4/13/2022 18:40:39'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookWithSuspendedCustomerNamed: paulMcCartney.
	
	self assertCustomerBook: customerBook withNumberOfActiveCustomers: 0 withNumberOfSuspendedCustomers: 1 withNumberOfCustomers: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JEO 4/13/2022 18:31:54'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	customerBook := self newCustomerBookWithSuspendedCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertCustomerBook: customerBook withNumberOfActiveCustomers: 0 withNumberOfSuspendedCustomers: 0 withNumberOfCustomers: 0. 
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JEO 4/13/2022 19:03:11'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self newCustomerBookWithCustomerNamed: johnLennon.
	
	self executeFail: [ customerBook suspendCustomerNamed: 'George Harrison'.]
		on: CantSuspend 
		do: [ :anError | 			self assertCustomerBook: customerBook includesOnly: johnLennon. ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'JEO 4/13/2022 19:06:40'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook := self newCustomerBookWithSuspendedCustomerNamed: johnLennon.
	
	self executeFail: [ customerBook suspendCustomerNamed: johnLennon.]
		on: CantSuspend 
		do: [ :anError |			self assertCustomerBook: customerBook includesOnly: johnLennon. ]
! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'JEO 4/13/2022 18:55:57'!
assertCustomerBook: aCustomerBook includesOnly: aCustomerName.
	self assert: aCustomerBook numberOfCustomers = 1.
	self assert: (aCustomerBook includesCustomerNamed: aCustomerName).
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'JEO 4/13/2022 18:30:32'!
assertCustomerBook: aCustomerBook withNumberOfActiveCustomers: numberOfActiveCustomers withNumberOfSuspendedCustomers: numberOfSuspendedCustomers withNumberOfCustomers: numberOfCustomers 
	self assert: numberOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: numberOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: numberOfCustomers equals: aCustomerBook numberOfCustomers.
	

	
! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'JEO 4/13/2022 18:00:09'!
assertExecute: aClosure inLessThanMilliseconds: milliseconds
	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (milliseconds * millisecond)! !


!CustomerBookTest methodsFor: 'failing' stamp: 'JEO 4/13/2022 18:59:53'!
executeFail: aBlock on: anError do: aBlockToRunOnError
	[aBlock value. self fail.] on: anError 		do: aBlockToRunOnError! !


!CustomerBookTest methodsFor: 'customerBook' stamp: 'JEO 4/13/2022 17:43:51'!
newCustomerBookWithCustomerNamed: customerName 
	| customerBook|
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: customerName.
	^customerBook.! !

!CustomerBookTest methodsFor: 'customerBook' stamp: 'JEO 4/13/2022 18:17:04'!
newCustomerBookWithSuspendedCustomerNamed: aCustomerName
	| customerBook |
	customerBook := self newCustomerBookWithCustomerNamed: aCustomerName.
	customerBook suspendCustomerNamed: aCustomerName.
	^customerBook.
	
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 9/17/2020 07:23:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'edrr 4/13/2022 19:23:10'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName ) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'edrr 4/13/2022 19:26:14'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'edrr 4/13/2022 20:17:48'!
removeCustomerNamed: aName 
 
	self removeCustomerNamed: aName from: active ifRemovedThenExecute: [^aName].
	self removeCustomerNamed: aName from: suspended ifRemovedThenExecute: [^aName].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'edrr 4/13/2022 20:16:48'!
removeCustomerNamed: aName from: aCollection ifRemovedThenExecute: aBlockToExecute
 
	aCollection detect: [:currentName | aName = currentName ] 
		ifFound: [:foundName |aCollection remove: foundName. aBlockToExecute value] 
		ifNone: [].
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:12'!
customerAlreadyExistsErrorMessage

	^'Customer already exists!!!!!!'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/11/2022 07:18:16'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty!!!!!!'! !
