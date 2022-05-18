!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/16/2022 20:48:19'!
test01NewPortfolioBalanceIsZero
	self assert: (Portfolio new balance) equals: 0.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:11'!
test02PortfolioWithReceptiveAccountCalculatesBalance
	
	| portfolio account |
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	portfolio registerAccount: account.
	
	self assert: (portfolio balance) equals: 100.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:11'!
test03PortfolioWithTwoReceptiveAccountCalculatesBalance
	
	| portfolio firstAccount secondAccount |
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	Deposit register: 100 on: firstAccount.
	secondAccount := ReceptiveAccount new.
	Deposit register: 100 on: secondAccount.
	
	portfolio registerAccount: firstAccount.
	portfolio registerAccount: secondAccount.
	
	self assert: (portfolio balance) equals: 200.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:25'!
test04PortfolioWithEmptyPortfolioBalanceIsZero
	
	| firstPortfolio secondPortfolio |
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	
	firstPortfolio registerPortfolio: secondPortfolio.
	
	self assert: (firstPortfolio balance) equals: 0.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:25'!
test05PortfolioWithPortfolioCalculatesBalance
	
	| firstPortfolio secondPortfolio account |
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	secondPortfolio registerAccount: account.
	firstPortfolio registerPortfolio: secondPortfolio.
	
	self assert: (firstPortfolio balance) equals: 100.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:25'!
test06PortfolioWithTwoPortfoliosCalculatesBalance
	
	| firstPortfolio secondPortfolio thirdPortfolio firstAccount  secondAccount |
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	thirdPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	Deposit register: 100 on: firstAccount.
	secondAccount := ReceptiveAccount new.
	Deposit register: 100 on: secondAccount.
	
	secondPortfolio registerAccount: firstAccount.
	thirdPortfolio registerAccount: secondAccount.
	firstPortfolio registerPortfolio: secondPortfolio.
	firstPortfolio registerPortfolio: thirdPortfolio.
	
	self assert: (firstPortfolio balance) equals: 200.! !

!PortfolioTest methodsFor: 'tests' stamp: 'edrr 5/16/2022 21:53:03'!
test07NewPortfolioTransactionsIsEmpty
	self assert: (Portfolio new transactions) equals: OrderedCollection new.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:11'!
test08PortfolioWithReceptiveAccountTransactions
	
	| portfolio account transaction transactions|
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transactions := OrderedCollection new.
	transaction := Deposit register: 100 on: account.
	transactions add: transaction.
	
	portfolio registerAccount: account.
	
	self assert: (portfolio transactions) equals: transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:11'!
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
	
	portfolio registerAccount: firstAccount.
	portfolio registerAccount: secondAccount.
	
	self assert: (portfolio transactions) equals: transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:25'!
test10PortfolioTransactionsWithPortfolioWithReceptiveAccount
	
	| firstPortfolio secondPortfolio account transactions transaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	transactions := OrderedCollection new.
	
	transaction := Deposit register: 100 on: account.

	transactions add: transaction.
	
	secondPortfolio registerAccount: account.
	firstPortfolio registerPortfolio: secondPortfolio.
	
	self assert: (firstPortfolio transactions) equals: transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:25'!
test11PortfolioTransactionsWithTwoPortfolioWithReceptiveAccounts
	
	| firstPortfolio secondPortfolio thirdPortfolio firstAccount secondAccount transactions transaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	thirdPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	transactions := OrderedCollection new.
	
	transaction := Deposit register: 100 on: firstAccount.
	transactions add: transaction.
	transaction := Deposit register: 100 on: secondAccount.
	transactions add: transaction.
	
	secondPortfolio registerAccount: firstAccount.
	thirdPortfolio registerAccount: secondAccount.
	firstPortfolio registerPortfolio: secondPortfolio.
	firstPortfolio registerPortfolio: thirdPortfolio.
	
	self assert: (firstPortfolio transactions) equals: transactions.! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:03:35'!
test12NewPortfolioHasNotRegisteredTransaction
	
	| portfolio account transaction |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transaction := Deposit register: 100 on: account.
	
	self deny: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:11'!
test13PortfolioWithReceptiveAccountHasRegisteredTransaction
	
	| portfolio account transaction |
	
	portfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transaction := Deposit register: 100 on: account.
	portfolio registerAccount: account.
	
	self assert: (portfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:11'!
test14PortfolioWithTwoReceptiveAccountHasRegisteredTransactions
	
	| portfolio firstAccount secondAccount firstTransaction secondTransaction |
	
	portfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.
	
	firstTransaction := Deposit register: 100 on: firstAccount.
	secondTransaction := Deposit register: 200 on: secondAccount.
	portfolio registerAccount: firstAccount.
	portfolio registerAccount: secondAccount.
	
	self assert: (portfolio hasRegistered: firstTransaction).
	self assert: (portfolio hasRegistered: secondTransaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:25'!
test15PortfolioWithEmptyPortfolioHasNotRegisteredTransaction
	
	| firstPortfolio secondPortfolio account transaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transaction := Deposit register: 100 on: account.
	
	firstPortfolio registerPortfolio: secondPortfolio.
	
	self deny: (firstPortfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:25'!
test16PortfolioWithPortfolioHasRegisteredTransaction
	
	| firstPortfolio secondPortfolio account transaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	account := ReceptiveAccount new.
	
	transaction := Deposit register: 100 on: account.
	
	secondPortfolio registerAccount: account.
	firstPortfolio registerPortfolio: secondPortfolio.
	
	self assert: (firstPortfolio hasRegistered: transaction).! !

!PortfolioTest methodsFor: 'tests' stamp: 'jeo 5/18/2022 19:32:25'!
test17PortfolioWithTwoPortfolioHasRegisteredTransactions
	
	| firstPortfolio secondPortfolio thirdPortfolio firstAccount secondAccount firstTransaction secondTransaction |
	
	firstPortfolio := Portfolio new.
	secondPortfolio := Portfolio new.
	thirdPortfolio := Portfolio new.
	firstAccount := ReceptiveAccount new.
	secondAccount := ReceptiveAccount new.	
	firstTransaction := Deposit register: 100 on: firstAccount.
	secondTransaction := Deposit register: 200 on: secondAccount.	
	
	secondPortfolio registerAccount: firstAccount.
	thirdPortfolio registerAccount: secondAccount.
	
	firstPortfolio registerPortfolio: secondPortfolio.
	firstPortfolio registerPortfolio: thirdPortfolio.
	
	self assert: (firstPortfolio hasRegistered: firstTransaction).
	self assert: (firstPortfolio hasRegistered: secondTransaction).! !


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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'operations' stamp: 'edrr 5/16/2022 20:25:30'!
processInto: aBalance 
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'operations' stamp: 'edrr 5/16/2022 20:25:30'!
processInto: aBalance
	 ^aBalance + value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'operations' stamp: 'edrr 5/16/2022 20:25:30'!
processInto: aBalance 
	^aBalance - value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts portfolios'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'balance' stamp: 'jeo 5/18/2022 17:52:01'!
balance

	^(accounts sum: [:anAccount | anAccount balance] ifEmpty: [0]) + (portfolios sum: [:aPortfolio | aPortfolio balance] ifEmpty: [0]).! !


!Portfolio methodsFor: 'initialization' stamp: 'edrr 5/16/2022 21:40:51'!
initialize
	accounts := OrderedCollection new.
	portfolios := OrderedCollection new.! !


!Portfolio methodsFor: 'register' stamp: 'jeo 5/18/2022 19:32:11'!
registerAccount: aReceptiveAccount 
	accounts add: aReceptiveAccount.! !

!Portfolio methodsFor: 'register' stamp: 'jeo 5/18/2022 19:32:25'!
registerPortfolio: aPortfolio
	portfolios add: aPortfolio.! !


!Portfolio methodsFor: 'transactions' stamp: 'jeo 5/18/2022 19:27:16'!
hasRegistered: aAccountTransaction 
	| hasRegisteredInAccount hasRegisteredInPortfolio |
	(accounts isEmpty and: (portfolios isEmpty)) ifTrue: [^false].
	hasRegisteredInAccount := accounts anySatisfy: [:account | account hasRegistered: aAccountTransaction.].
	hasRegisteredInPortfolio := portfolios anySatisfy: [:portfolio | portfolio hasRegistered: aAccountTransaction.]..
	^ hasRegisteredInAccount or: hasRegisteredInPortfolio.
	! !

!Portfolio methodsFor: 'transactions' stamp: 'jeo 5/18/2022 18:53:31'!
transactions
	| transactions |
	transactions := OrderedCollection new.
	((accounts isEmpty) and: (portfolios isEmpty)) ifTrue: [^ transactions].
	(accounts isEmpty not) ifTrue: [
		accounts do: [:account | transactions addAllLast: account transactions.		].].
	(portfolios isEmpty not) ifTrue: [ 
		portfolios do: [:portfolio | transactions addAllLast: portfolio transactions.		].].
	^transactions.! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'edrr 5/16/2022 20:25:30'!
balance

	^transactions inject: 0 into: [:balance :aTransaction | 		aTransaction processInto: balance].! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !
