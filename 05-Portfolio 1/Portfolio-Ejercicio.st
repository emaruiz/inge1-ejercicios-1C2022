!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/16/2022 20:48:19'!
test01NewPortfolioBalanceIsZero
	self assert: (Portfolio new balance) equals: 0.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 19:05:13'!
test02PortfolioWithReceptiveAccountCalculatesBalance
	
	| portfolio account |
	portfolio := Portfolio new.
	account := 	self createReceptiveAccountWithDepositValue: 100.
	
	portfolio register: account.
	
	self assert: (portfolio balance) equals: 100.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 19:07:47'!
test03PortfolioWithTwoReceptiveAccountCalculatesBalance
	
	| portfolio firstAccount secondAccount |
	portfolio := Portfolio new.
	
	firstAccount := self createReceptiveAccountWithDepositValue: 100.
	secondAccount := self createReceptiveAccountWithDepositValue: 100.
	
	portfolio register: firstAccount.
	portfolio register: secondAccount.
	
	self assert: (portfolio balance) equals: 200.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/19/2022 20:36:45'!
test04PortfolioWithEmptyPortfolioBalanceIsZero
	
	| firstPortfolio secondPortfolio |
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	
	firstPortfolio register: secondPortfolio.
	
	self assert: (firstPortfolio balance) equals: 0.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 19:08:16'!
test05PortfolioWithPortfolioCalculatesBalance
	
	| firstPortfolio secondPortfolio account |
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := self createReceptiveAccountWithDepositValue: 100.
	
	secondPortfolio register: account.
	firstPortfolio register: secondPortfolio.
	
	self assert: (firstPortfolio balance) equals: 100.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 19:08:52'!
test06PortfolioWithTwoPortfoliosCalculatesBalance
	
	| firstPortfolio secondPortfolio thirdPortfolio firstAccount  secondAccount |
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	thirdPortfolio := Portfolio new.
	firstAccount := self createReceptiveAccountWithDepositValue: 100.
	secondAccount := self createReceptiveAccountWithDepositValue: 100.
	
	secondPortfolio register: firstAccount.
	thirdPortfolio register: secondAccount.
	firstPortfolio register: secondPortfolio.
	firstPortfolio register: thirdPortfolio.
	
	self assert: (firstPortfolio balance) equals: 200.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/16/2022 21:53:03'!
test07NewPortfolioTransactionsIsEmpty
	self assert: (Portfolio new transactions) equals: OrderedCollection new.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/19/2022 20:37:15'!
test08PortfolioWithReceptiveAccountTransactions
	
	| portfolio account transaction transactions|
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transactions := OrderedCollection new.
	transaction := Deposit register: 100 on: account.
	transactions add: transaction.
	
	portfolio register: account.
	
	self assert: (portfolio transactions) equals: transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/19/2022 20:37:26'!
test09PortfolioTransactionsWithTwoReceptiveAccounts
	
	| portfolio firstAccount secondAccount firstTransaction secondTransaction transactions|
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	transactions := OrderedCollection new.
	firstTransaction := Deposit register: 100 on: firstAccount.
	secondTransaction := Deposit register: 100 on: secondAccount.
	transactions add: firstTransaction.
	transactions add: secondTransaction.
	
	portfolio register: firstAccount.
	portfolio register: secondAccount.
	
	self assert: (portfolio transactions) equals: transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/19/2022 20:37:36'!
test10PortfolioTransactionsWithPortfolioWithReceptiveAccount
	
	| firstPortfolio secondPortfolio account transactions transaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	transactions := OrderedCollection new.
	
	transaction := Deposit register: 100 on: account.

	transactions add: transaction.
	
	secondPortfolio register: account.
	firstPortfolio register: secondPortfolio.
	
	self assert: (firstPortfolio transactions) equals: transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 19:21:01'!
test11PortfolioTransactionsWithTwoPortfolioWithReceptiveAccounts
	
	| firstPortfolio secondPortfolio thirdPortfolio firstAccount secondAccount transactions firstTransaction secondTransaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	thirdPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	transactions := OrderedCollection new.
	firstTransaction := Deposit register: 100 on: firstAccount.
	secondTransaction := Deposit register: 100 on: secondAccount.
	transactions add: firstTransaction.
	transactions add: secondTransaction.
	
	secondPortfolio register: firstAccount.
	thirdPortfolio register: secondAccount.
	firstPortfolio register: secondPortfolio.
	firstPortfolio register: thirdPortfolio.
	
	self assert: (firstPortfolio transactions) equals: transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:03:35'!
test12NewPortfolioHasNotRegisteredTransaction
	
	| portfolio account transaction |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transaction := Deposit register: 100 on: account.
	
	self deny: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/19/2022 20:37:53'!
test13PortfolioWithReceptiveAccountHasRegisteredTransaction
	
	| portfolio account transaction |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transaction := Deposit register: 100 on: account.
	portfolio register: account.
	
	self assert: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/19/2022 20:38:02'!
test14PortfolioWithTwoReceptiveAccountHasRegisteredTransactions
	
	| portfolio firstAccount secondAccount firstTransaction secondTransaction |
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	firstTransaction := Deposit register: 100 on: firstAccount.
	secondTransaction := Deposit register: 200 on: secondAccount.
	portfolio register: firstAccount.
	portfolio register: secondAccount.
	
	self assert: (portfolio hasRegistered: firstTransaction).
	self assert: (portfolio hasRegistered: secondTransaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/19/2022 20:38:10'!
test15PortfolioWithEmptyPortfolioHasNotRegisteredTransaction
	
	| firstPortfolio secondPortfolio account transaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transaction := Deposit register: 100 on: account.
	
	firstPortfolio register: secondPortfolio.
	
	self deny: (firstPortfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/19/2022 20:38:17'!
test16PortfolioWithPortfolioHasRegisteredTransaction
	
	| firstPortfolio secondPortfolio account transaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transaction := Deposit register: 100 on: account.
	
	secondPortfolio register: account.
	firstPortfolio register: secondPortfolio.
	
	self assert: (firstPortfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/19/2022 20:38:30'!
test17PortfolioWithTwoPortfolioHasRegisteredTransactions
	
	| firstPortfolio secondPortfolio thirdPortfolio firstAccount secondAccount firstTransaction secondTransaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	thirdPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.	
	firstTransaction := Deposit register: 100 on: firstAccount.
	secondTransaction := Deposit register: 200 on: secondAccount.	
	
	secondPortfolio register: firstAccount.
	thirdPortfolio register: secondAccount.
	
	firstPortfolio register: secondPortfolio.
	firstPortfolio register: thirdPortfolio.
	
	self assert: (firstPortfolio hasRegistered: firstTransaction).
	self assert: (firstPortfolio hasRegistered: secondTransaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 19:00:11'!
test18PortfolioCannotRegisterDuplicatedReceptiveAccount
	
	| portfolio account |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	portfolio register: account.
	
	self should: [portfolio register: account.] 
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio canNotRegisterDuplicatedPortfolioItemErrorDescription]. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 19:00:22'!
test19PortfolioWithPortfolioCannotRegisterDuplicatedReceptiveAccount
	
	| firstPortfolio secondPortfolio account |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	firstPortfolio register: secondPortfolio.
	secondPortfolio register: account.
	
	self should: [firstPortfolio register: account.] 
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio canNotRegisterDuplicatedPortfolioItemErrorDescription]. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 19:00:35'!
test20PortfolioCannotRegisterPortfolioThatContainsDuplicatedReceptiveAccount
	
	| firstPortfolio secondPortfolio account |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	firstPortfolio register: account.
	secondPortfolio register: account.
	
	self should: [firstPortfolio register: secondPortfolio.] 
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio canNotRegisterDuplicatedPortfolioItemErrorDescription]. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 18:21:16'!
test21LevelOneNonRootPortfolioCannotRegisterDuplicatedReceptiveAccount
	
	| firstPortfolio secondPortfolio account |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	firstPortfolio register: account.
	firstPortfolio register: secondPortfolio.
	
	self should: [secondPortfolio register: account.] 
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio canNotRegisterDuplicatedPortfolioItemErrorDescription]. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 18:21:16'!
test22LevelTwoNonRootPortfolioCannotRegisterDuplicatedReceptiveAccount
	
	| firstPortfolio secondPortfolio account thirdPortfolio |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	thirdPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	firstPortfolio register: account.
	firstPortfolio register: secondPortfolio.
	secondPortfolio register: thirdPortfolio.
	
	self should: [thirdPortfolio register: account.] 
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio canNotRegisterDuplicatedPortfolioItemErrorDescription]. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 18:29:36'!
test23PortfolioCannotRegisterItself
	
	| firstPortfolio |
	
	firstPortfolio := Portfolio new.
	
	self should: [firstPortfolio register: firstPortfolio.] 
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio canNotRegisterDuplicatedPortfolioItemErrorDescription]. ! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/22/2022 18:27:56'!
test24PortfolioCannotRegisterRootPortfolio
	
	| firstPortfolio secondPortfolio |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	
	firstPortfolio register: secondPortfolio.
	
	self should: [secondPortfolio register: firstPortfolio.] 
		raise: Error 
		withExceptionDo: [ :anError | self assert: anError messageText equals: Portfolio canNotRegisterDuplicatedPortfolioItemErrorDescription]. ! !


!PortfolioTest methodsFor: 'portfolio item creation' stamp: 'edrr 5/22/2022 19:06:50'!
createReceptiveAccountWithDepositValue: aDepositValue 
	|account|
	account := ReceptiveAccount new.
	Deposit register: aDepositValue on: account.
	^account ! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:44'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:48'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:13:52'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/16/2022 16:18:39'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 5/16/2022 16:19:11'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
	
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 11/2/2020 17:14:01'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'edrr 5/21/2022 20:38:28'!
value 

	^ value! !


!AccountTransaction methodsFor: 'operations' stamp: 'edrr 5/16/2022 20:25:30'!
processInto: aBalance 
	self subclassResponsibility.! !


!AccountTransaction methodsFor: 'initialization' stamp: 'edrr 5/21/2022 20:39:51'!
initializeFor: aValue

	value := aValue ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'edrr 5/21/2022 20:40:47'!
for: aValue

	^ self new initializeFor: aValue ! !

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'operations' stamp: 'edrr 5/16/2022 20:25:30'!
processInto: aBalance
	 ^aBalance + value.! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'operations' stamp: 'edrr 5/16/2022 20:25:30'!
processInto: aBalance 
	^aBalance - value.! !


!classDefinition: #PortfolioItem category: 'Portfolio-Ejercicio'!
Object subclass: #PortfolioItem
	instanceVariableNames: 'parent'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioItem methodsFor: 'balance' stamp: 'edrr 5/19/2022 20:30:52'!
balance
	self subclassResponsibility.! !



!PortfolioItem methodsFor: 'register' stamp: 'edrr 5/19/2022 21:22:02'!
register: aPortfolioItem 
	self subclassResponsibility.! !


!PortfolioItem methodsFor: 'register-private' stamp: 'edrr 5/21/2022 19:11:05'!
addParent: aPortfolio 
	parent := aPortfolio.! !

!PortfolioItem methodsFor: 'register-private' stamp: 'edrr 5/21/2022 19:46:27'!
getRootPortfolio
	self subclassResponsibility.! !

!PortfolioItem methodsFor: 'register-private' stamp: 'edrr 5/22/2022 18:58:13'!
includes: aPortfolioItem
	self subclassResponsibility.! !


!PortfolioItem methodsFor: 'testing' stamp: 'edrr 5/19/2022 20:31:16'!
hasRegistered: aAccountTransaction 
	self subclassResponsibility.! !


!PortfolioItem methodsFor: 'transactions' stamp: 'edrr 5/19/2022 20:32:52'!
transactions
	self subclassResponsibility.! !


!classDefinition: #NullPortfolio category: 'Portfolio-Ejercicio'!
PortfolioItem subclass: #NullPortfolio
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!NullPortfolio methodsFor: 'register-private' stamp: 'edrr 5/21/2022 19:56:49'!
getRootPortfolioFor: aPortfolioItem
	
	^aPortfolioItem.! !

!NullPortfolio methodsFor: 'register-private' stamp: 'edrr 5/21/2022 19:49:00'!
includes: aPortfolioItem 
	^false.! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
PortfolioItem subclass: #Portfolio
	instanceVariableNames: 'portfolioItems'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'edrr 5/19/2022 21:19:39'!
balance

	^portfolioItems sum:[:aPortfolioItem | aPortfolioItem balance] ifEmpty: [0].! !


!Portfolio methodsFor: 'initialization' stamp: 'edrr 5/21/2022 19:46:52'!
initialize
	portfolioItems := OrderedCollection new.
	parent := NullPortfolio new.! !


!Portfolio methodsFor: 'assertions' stamp: 'edrr 5/22/2022 18:25:24'!
assertPortfolioItemIsNotDuplicated: aPortfolioItem

	|portfolioRoot|
	portfolioRoot := self getRootPortfolio.
	(portfolioRoot == aPortfolioItem or: 	(portfolioRoot includes: aPortfolioItem)) 
		ifTrue: [self error: self class canNotRegisterDuplicatedPortfolioItemErrorDescription].! !


!Portfolio methodsFor: 'register' stamp: 'edrr 5/22/2022 18:29:56'!
register: aPortfolioItem 
	self assertPortfolioItemIsNotDuplicated: aPortfolioItem.
	
	aPortfolioItem addParent: self.
	portfolioItems add: aPortfolioItem! !


!Portfolio methodsFor: 'register-private' stamp: 'edrr 5/21/2022 19:57:46'!
getRootPortfolio
	
	^parent getRootPortfolioFor: self.! !

!Portfolio methodsFor: 'register-private' stamp: 'edrr 5/21/2022 19:54:36'!
getRootPortfolioFor: aPortfolioItem
	
	^parent getRootPortfolioFor: self.! !

!Portfolio methodsFor: 'register-private' stamp: 'edrr 5/22/2022 18:52:44'!
includes: aNewPortfolioItem 
	^portfolioItems anySatisfy: [:portfolioItem | 
		portfolioItem == aNewPortfolioItem or: 
		(portfolioItem includes: aNewPortfolioItem) or: 
		(aNewPortfolioItem includes: portfolioItem)].! !


!Portfolio methodsFor: 'testing' stamp: 'edrr 5/21/2022 20:32:21'!
hasRegistered: aAccountTransaction 
	^portfolioItems anySatisfy: [:aPortfolioItem | aPortfolioItem hasRegistered: aAccountTransaction.].! !


!Portfolio methodsFor: 'transactions' stamp: 'edrr 5/21/2022 20:34:02'!
transactions
	| transactions |
	transactions := OrderedCollection new.
	portfolioItems do: [:aPortfolioItem | transactions addAllLast: aPortfolioItem transactions.		].
	^transactions.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'edrr 5/22/2022 18:54:23'!
canNotRegisterDuplicatedPortfolioItemErrorDescription
	^'portfolio item already exists'! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
PortfolioItem subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'balance' stamp: 'edrr 5/16/2022 20:25:30'!
balance

	^transactions inject: 0 into: [:balance :aTransaction | 		aTransaction processInto: balance].! !


!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'register-private' stamp: 'edrr 5/22/2022 18:42:12'!
includes: aPortfolioItem 
	^false! !
