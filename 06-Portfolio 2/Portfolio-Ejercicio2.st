!classDefinition: #AccountSummaryTest category: 'Portfolio-Ejercicio2'!
TestCase subclass: #AccountSummaryTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!AccountSummaryTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:14:47'!
test01AccountWithoutTransactionsPrintsBalanceZero
	| account accountSummary |
	account := ReceptiveAccount new.
	accountSummary := AccountSummary for: account.
	
	self assert: accountSummary process equals: 'Balance = 0.'.
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:34:42'!
test02AccountWithDeposit
	| account accountSummary |
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	
	accountSummary := AccountSummary for: account.
	
	self assert: 'Deposito por 100.Balance = 100.' equals: accountSummary process.
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:35:33'!
test03AccountWithWithdraw
	| account accountSummary |
	account := ReceptiveAccount new.
	Withdraw register: 50 on: account.
	 
	accountSummary := AccountSummary for: account.
	
	self assert: 'Extraccion por 50.Balance = -50.' equals: accountSummary process.
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:36:00'!
test04AccountWithOutboundTransfer
	| account1 account2 accountSummary |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer from: account1 to: account2 withValue: 20. 
	 
	accountSummary := AccountSummary for: account1.
	
	self assert: 'Salida por transferencia de 20.Balance = -20.' equals: accountSummary process.
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:36:15'!
test05AccountWithInboundTransfer
	| account1 account2 accountSummary |
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer from: account1 to: account2 withValue: 30. 
	 
	accountSummary := AccountSummary for: account2.
	
	self assert: 'Entrada por transferencia de 30.Balance = 30.' equals: accountSummary process.
	! !

!AccountSummaryTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:36:51'!
test06AccountWithTwoTransactions
	| account  accountSummary |
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account. 	 

	accountSummary := AccountSummary for: account.
	
	self assert: 	'Deposito por 100.Extraccion por 50.Balance = 50.' equals: accountSummary process.
	! !


!classDefinition: #PortfolioTest category: 'Portfolio-Ejercicio2'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 5/27/2021 17:36:04'!
test02BalanceOfPortfolioWithAccountsIsSumOfAccountsBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:23:25'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:15'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100))! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:43:11'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:06'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'NR 6/22/2020 07:31:19'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit anotherAccount portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 on: account.
	anotherAccount := ReceptiveAccount new.
	anotherAccountWithdraw := Withdraw register: 100 on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:32'!
test12PortfolioCanNotIncludeItself

	| account simplePortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: simplePortfolio accountsSize.
			self assert: (simplePortfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'Portfolio-Ejercicio2'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:48'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:19:54'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:02'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance .
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:32'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:46'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:20:54'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 5/23/2019 15:21:24'!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 100 on: account1.
		
	self assert: 1 equals: account1 transactions size .
	self assert: (account1 transactions includes: deposit1).
! !


!classDefinition: #TransferNetTest category: 'Portfolio-Ejercicio2'!
TestCase subclass: #TransferNetTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!TransferNetTest methodsFor: 'tests' stamp: 'jeo 5/28/2022 19:29:53'!
test01AccountWithoutTransactionsTransferNet
	| account transferNet |
	
	account := ReceptiveAccount new.
	transferNet := TransferNet for: account.
	
	self assert: 0 equals: transferNet process.
	
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'jeo 5/28/2022 19:29:53'!
test02AccountWithTransferTransferNet
	| account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer from: account1 to: account2 withValue: 10. 
	
	self assert: -10 equals: (TransferNet for: account1) process.
	self assert: 10 equals: (TransferNet for: account2) process.
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'jeo 5/28/2022 19:29:53'!
test03AccountWithTransferAndDepositTransferNet
	| account1 account2 transferNet |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Deposit register: 10 on: account1. 
	Transfer from: account1 to: account2 withValue: 10. 
	
	transferNet := (TransferNet for: account1) process.
	
	self assert: -10 equals: transferNet.
	
	! !

!TransferNetTest methodsFor: 'tests' stamp: 'jeo 5/28/2022 19:29:53'!
test04AccountWithTransferAndWithdrawTransferNet
	| account1 account2 transferNet |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Withdraw register: 10 on: account1. 
	Transfer from: account1 to: account2 withValue: 10. 
	
	transferNet := (TransferNet for: account1) process.
	
	self assert: -10 equals: transferNet.
	
	! !


!classDefinition: #TransferTest category: 'Portfolio-Ejercicio2'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!TransferTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:27:49'!
test01TransferZeroFromAToBRaiseError
	|accountA accountB|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	self should: [Transfer from: accountA to: accountB withValue: 0.] 
		raise: Error 
		withExceptionDo: [:anError | self assert: (Transfer canNotTransferZeroErrorMessage) equals: anError messageText.].! !

!TransferTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:22:26'!
test02TransferOneFromAToB
	|accountA accountB|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	Deposit register: 5 on: accountA.
	
	Transfer from: accountA to: accountB withValue: 1.
	
	self assert: 4 equals: accountA balance.
	self assert: 1 equals: accountB balance.! !

!TransferTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:29:37'!
test03TransferFromAToBDeposit
	|accountA accountB transfer|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	Deposit register: 5 on: accountA.
	
	transfer := Transfer from: accountA to: accountB withValue: 1.
	
	self assert: (transfer deposit isKindOf: TransferDeposit).
	self assert: (accountB hasRegistered: transfer deposit).! !

!TransferTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:29:51'!
test04TransferFromAToBWithdraw
	|accountA accountB transfer|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	Deposit register: 5 on: accountA.
	
	transfer := Transfer from: accountA to: accountB withValue: 1.
	
	self assert: (transfer withdraw isKindOf: TransferWithdraw).
	self assert: (accountA hasRegistered: transfer withdraw).! !

!TransferTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:23:20'!
test05TransferFromAToBValue
	|accountA accountB transfer|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	Deposit register: 5 on: accountA.
	
	transfer := Transfer from: accountA to: accountB withValue: 1.
	
	self assert: (transfer value) equals: 1.! !

!TransferTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:23:40'!
test06TransferFromAToBDepositTransfer
	|accountA accountB transfer|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	Deposit register: 5 on: accountA.
	
	transfer := Transfer from: accountA to: accountB withValue: 1.
	
	self assert: (transfer deposit transfer) equals: transfer.! !

!TransferTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:24:00'!
test07TransferFromAToBWithdrawTransfer
	|accountA accountB transfer|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	Deposit register: 5 on: accountA.
	
	transfer := Transfer from: accountA to: accountB withValue: 1.
	
	self assert: (transfer withdraw transfer) equals: transfer.! !

!TransferTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:21:24'!
test08TransferNegativeValueFromAToBRaiseError
	|accountA accountB|
	
	accountA := ReceptiveAccount new.
	accountB := ReceptiveAccount new.
	
	self should: [Transfer from: accountA to: accountB withValue: -1.] 
		raise: Error 
		withExceptionDo: [:anError | self assert: (Transfer canNotTransferNegativeValueErrorMessage) equals: anError messageText.].! !

!TransferTest methodsFor: 'tests' stamp: 'edrr 5/29/2022 18:44:40'!
test09TransferBetweenSameAccountRaiseError
	|accountA |
	
	accountA := ReceptiveAccount new.
	
	self should: [Transfer from: accountA to: accountA withValue: 1.] 
		raise: Error 
		withExceptionDo: [:anError | self assert: (Transfer canNotTransferBetweenSameAccountErrorMessage) equals: anError messageText.].! !


!classDefinition: #Account category: 'Portfolio-Ejercicio2'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:24:25'!
isComposedBy: anAccount

	self subclassResponsibility ! !


!Account methodsFor: 'balance' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !


!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !

!Account methodsFor: 'transactions' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:24:04'!
addedTo: aPortfolio

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'Portfolio-Ejercicio2'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !


!Portfolio methodsFor: 'initialization' stamp: 'HAW 5/25/2019 12:03:18'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.! !


!Portfolio methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:19:36'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 ]! !


!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !

!Portfolio methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !


!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'testing' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !


!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'account management - private' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'Portfolio-Ejercicio2'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'jeo 5/25/2022 17:21:37'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !


!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'instance creation' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'Portfolio-Ejercicio2'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions lastTransaction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'jeo 5/28/2022 21:02:19'!
initialize

	super initialize.
	transactions := OrderedCollection new.
	lastTransaction := NullTransaction new.! !


!ReceptiveAccount methodsFor: 'process' stamp: 'jeo 5/28/2022 21:01:23'!
processTransactionsFor: anAccountOperation
	lastTransaction processFor: anAccountOperation.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'jeo 5/28/2022 20:23:44'!
lastTransaction

	^ lastTransaction! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'jeo 5/28/2022 20:25:43'!
register: aTransaction

	transactions add: aTransaction.
	aTransaction addPrev: lastTransaction.
	lastTransaction := aTransaction.
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:24:46'!
balance

	^transactions 
		inject: 0
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'testing' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReceptiveAccount class' category: 'Portfolio-Ejercicio2'!
ReceptiveAccount class
	instanceVariableNames: ''!

!ReceptiveAccount class methodsFor: 'error descriptions' stamp: 'edrr 5/23/2022 21:33:59'!
canNotTransferZeroErrorMessage
	^'can not transfer zero'! !


!classDefinition: #AccountOperations category: 'Portfolio-Ejercicio2'!
Object subclass: #AccountOperations
	instanceVariableNames: 'account'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!AccountOperations methodsFor: 'initialization' stamp: 'jeo 5/28/2022 20:00:09'!
initializeFor: aReceptiveAccount 
	
	account := aReceptiveAccount.! !


!AccountOperations methodsFor: 'process' stamp: 'jeo 5/28/2022 19:30:21'!
process
	self subclassResponsibility.! !


!AccountOperations methodsFor: 'process-private' stamp: 'jeo 5/28/2022 20:18:49'!
initializeProcess
	self subclassResponsibility.! !

!AccountOperations methodsFor: 'process-private' stamp: 'jeo 5/28/2022 19:30:35'!
processForDeposit: aDeposit 
	self subclassResponsibility.! !

!AccountOperations methodsFor: 'process-private' stamp: 'jeo 5/28/2022 19:30:51'!
processForTransferDeposit: aTransferDeposit
	self subclassResponsibility.! !

!AccountOperations methodsFor: 'process-private' stamp: 'jeo 5/28/2022 19:31:04'!
processForTransferWithdraw: aTransferWithdraw 
	self subclassResponsibility.! !

!AccountOperations methodsFor: 'process-private' stamp: 'jeo 5/28/2022 19:31:20'!
processForWithdraw: aWithdraw 
	self subclassResponsibility.! !


!classDefinition: #AccountSummary category: 'Portfolio-Ejercicio2'!
AccountOperations subclass: #AccountSummary
	instanceVariableNames: 'summary'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!AccountSummary methodsFor: 'process' stamp: 'jeo 5/28/2022 21:19:03'!
process

	self initializeProcess.
	
	account processTransactionsFor: self.
	
	^ self createSummary.! !


!AccountSummary methodsFor: 'process-private' stamp: 'jeo 5/28/2022 21:24:27'!
createSummary
	| summaryString | 
	summaryString := summary inject: '' into: [:aSummaryString :aTransactionString | aTransactionString , aSummaryString		].
	summaryString := summaryString , 'Balance = ' , (account balance) asString , '.'.
	^summaryString.! !

!AccountSummary methodsFor: 'process-private' stamp: 'jeo 5/28/2022 21:22:40'!
initializeProcess

	summary := OrderedCollection new! !

!AccountSummary methodsFor: 'process-private' stamp: 'jeo 5/28/2022 20:03:51'!
processForDeposit: aDeposit 
	
	summary add: 'Deposito por ' , aDeposit value asString , '.'.! !

!AccountSummary methodsFor: 'process-private' stamp: 'jeo 5/28/2022 20:03:51'!
processForTransferDeposit: aTransferDeposit 
	
	summary add: 'Entrada por transferencia de ' , aTransferDeposit value asString , '.'.! !

!AccountSummary methodsFor: 'process-private' stamp: 'jeo 5/28/2022 20:03:52'!
processForTransferWithdraw: aTransferWithdraw 

	summary add: 'Salida por transferencia de ' , aTransferWithdraw value asString , '.'.! !

!AccountSummary methodsFor: 'process-private' stamp: 'jeo 5/28/2022 20:03:52'!
processForWithdraw: aWithdraw 
	
	summary add: 'Extraccion por ' , aWithdraw value asString , '.'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'Portfolio-Ejercicio2'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'instance creation' stamp: 'jeo 5/28/2022 18:48:47'!
for: aReceptiveAccount 
	
	^self new initializeFor: aReceptiveAccount ! !


!classDefinition: #TransferNet category: 'Portfolio-Ejercicio2'!
AccountOperations subclass: #TransferNet
	instanceVariableNames: 'transferNet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!TransferNet methodsFor: 'process' stamp: 'jeo 5/28/2022 21:19:09'!
process
	
	self initializeProcess.
	
	account processTransactionsFor: self.
	
	^transferNet.! !


!TransferNet methodsFor: 'process-private' stamp: 'jeo 5/28/2022 21:22:31'!
initializeProcess

	transferNet := 0! !

!TransferNet methodsFor: 'process-private' stamp: 'jeo 5/28/2022 21:22:22'!
processForDeposit: aDeposit 
	! !

!TransferNet methodsFor: 'process-private' stamp: 'jeo 5/28/2022 21:21:53'!
processForTransfer: aTransfer

	transferNet := aTransfer affectBalance: transferNet! !

!TransferNet methodsFor: 'process-private' stamp: 'jeo 5/28/2022 21:22:03'!
processForTransferDeposit: aTransferDeposit 
	self processForTransfer: aTransferDeposit.
! !

!TransferNet methodsFor: 'process-private' stamp: 'jeo 5/28/2022 21:22:09'!
processForTransferWithdraw: aTransferWithdraw 
	self processForTransfer: aTransferWithdraw.! !

!TransferNet methodsFor: 'process-private' stamp: 'jeo 5/28/2022 21:22:13'!
processForWithdraw: aWithdraw 
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferNet class' category: 'Portfolio-Ejercicio2'!
TransferNet class
	instanceVariableNames: ''!

!TransferNet class methodsFor: 'instance creation' stamp: 'jeo 5/28/2022 18:55:36'!
for: aReceptiveAccount 
	
	^self new initializeFor: aReceptiveAccount ! !


!classDefinition: #AccountTransaction category: 'Portfolio-Ejercicio2'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'operations' stamp: 'jeo 5/28/2022 21:08:41'!
processFor: anAccountOperation

	self subclassResponsibility! !


!classDefinition: #NullTransaction category: 'Portfolio-Ejercicio2'!
AccountTransaction subclass: #NullTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!NullTransaction methodsFor: 'balance' stamp: 'jeo 5/28/2022 21:25:30'!
affectBalance: aBalance
	! !


!NullTransaction methodsFor: 'operations' stamp: 'jeo 5/28/2022 21:25:00'!
processFor: anAccountOperation
	! !


!classDefinition: #StandardTransaction category: 'Portfolio-Ejercicio2'!
AccountTransaction subclass: #StandardTransaction
	instanceVariableNames: 'previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!StandardTransaction methodsFor: 'accessing' stamp: 'jeo 5/28/2022 21:15:12'!
previous

	^ previous! !

!StandardTransaction methodsFor: 'accessing' stamp: 'jeo 5/28/2022 21:17:24'!
value
	
	self subclassResponsibility ! !


!StandardTransaction methodsFor: 'register' stamp: 'jeo 5/28/2022 21:15:19'!
addPrev: anTransaction 
	previous := anTransaction! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StandardTransaction class' category: 'Portfolio-Ejercicio2'!
StandardTransaction class
	instanceVariableNames: ''!

!StandardTransaction class methodsFor: 'instance creation' stamp: 'edrr 5/29/2022 18:13:33'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'Portfolio-Ejercicio2'!
StandardTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'accessing' stamp: 'jeo 5/25/2022 19:44:29'!
value
	^ value! !


!Deposit methodsFor: 'balance' stamp: 'jeo 5/25/2022 17:13:16'!
affectBalance: aBalance

	^aBalance + self value ! !


!Deposit methodsFor: 'operations' stamp: 'jeo 5/28/2022 20:55:57'!
processFor: anAccountOperation 
	
	anAccountOperation processForDeposit: self.
	previous processFor: anAccountOperation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'Portfolio-Ejercicio2'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'Portfolio-Ejercicio2'!
StandardTransaction subclass: #TransferDeposit
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!TransferDeposit methodsFor: 'initialization' stamp: 'jeo 5/25/2022 19:33:01'!
initializeRegisterOn: aReceptiveAccount forTransfer: aTransfer 

	transfer := aTransfer.
	aReceptiveAccount register: self.! !


!TransferDeposit methodsFor: 'accessing' stamp: 'jeo 5/25/2022 19:36:09'!
transfer
	^transfer! !

!TransferDeposit methodsFor: 'accessing' stamp: 'jeo 5/25/2022 19:34:06'!
value

	^transfer value! !


!TransferDeposit methodsFor: 'balance' stamp: 'jeo 5/25/2022 19:35:04'!
affectBalance: aBalance

	^aBalance + self value ! !


!TransferDeposit methodsFor: 'operations' stamp: 'jeo 5/28/2022 21:06:23'!
processFor: anAccountOperation 
	
	anAccountOperation processForTransferDeposit: self.
	previous processFor: anAccountOperation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'Portfolio-Ejercicio2'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'instance creation' stamp: 'jeo 5/25/2022 19:37:28'!
registerOn: aReceptiveAccount forTransfer: aTransfer 
	
	^ self new initializeRegisterOn: aReceptiveAccount forTransfer: aTransfer.
! !


!classDefinition: #TransferWithdraw category: 'Portfolio-Ejercicio2'!
StandardTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!TransferWithdraw methodsFor: 'initialization' stamp: 'jeo 5/25/2022 19:33:38'!
initializeRegisterOn: aReceptiveAccount forTransfer: aTransfer 

	transfer := aTransfer.
	aReceptiveAccount register: self.! !


!TransferWithdraw methodsFor: 'accessing' stamp: 'jeo 5/25/2022 19:36:24'!
transfer
	^transfer! !

!TransferWithdraw methodsFor: 'accessing' stamp: 'jeo 5/25/2022 19:34:16'!
value
	
	^ transfer value! !


!TransferWithdraw methodsFor: 'balance' stamp: 'jeo 5/25/2022 19:35:17'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdraw methodsFor: 'operations' stamp: 'jeo 5/28/2022 21:06:57'!
processFor: anAccountOperation 
	
	anAccountOperation processForTransferWithdraw: self.
	previous processFor: anAccountOperation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'Portfolio-Ejercicio2'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'instance creation' stamp: 'jeo 5/25/2022 19:38:04'!
registerOn: aReceptiveAccount forTransfer: aTransfer 
	
	^ self new initializeRegisterOn: aReceptiveAccount forTransfer: aTransfer.
! !


!classDefinition: #Withdraw category: 'Portfolio-Ejercicio2'!
StandardTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'accessing' stamp: 'jeo 5/25/2022 19:44:36'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'jeo 5/25/2022 17:13:41'!
affectBalance: aBalance

	^aBalance - self value! !


!Withdraw methodsFor: 'operations' stamp: 'jeo 5/28/2022 21:11:44'!
processFor: anAccountOperation 
	
	anAccountOperation processForWithdraw: self.
	previous processFor: anAccountOperation.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'Portfolio-Ejercicio2'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Transfer category: 'Portfolio-Ejercicio2'!
Object subclass: #Transfer
	instanceVariableNames: 'value deposit withdraw'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio2'!

!Transfer methodsFor: 'initialization' stamp: 'edrr 5/29/2022 18:50:32'!
initializeFrom: aSourceReceptiveAccount to: aDestinationReceptiveAccount withValue: aValueToTransfer 
	
	self assertTransferValueIsNotZero: aValueToTransfer.
	self assertTransferValueIsNotNegative: aValueToTransfer.
	self assertSourceAccount: aSourceReceptiveAccount isDifferentThanDestinationAccount: aDestinationReceptiveAccount.
	deposit := TransferDeposit registerOn: aDestinationReceptiveAccount forTransfer: self.
	withdraw := TransferWithdraw registerOn: aSourceReceptiveAccount forTransfer: self.
	value := aValueToTransfer.! !


!Transfer methodsFor: 'assertions' stamp: 'edrr 5/29/2022 18:50:32'!
assertSourceAccount: aSourceReceptiveAccount isDifferentThanDestinationAccount: aDestinationReceptiveAccount

	^ aSourceReceptiveAccount == aDestinationReceptiveAccount ifTrue: [self error: self class canNotTransferBetweenSameAccountErrorMessage]! !

!Transfer methodsFor: 'assertions' stamp: 'edrr 5/29/2022 18:25:51'!
assertTransferValueIsNotNegative: aValueToTransfer

	^ aValueToTransfer < 0 ifTrue: [self error: self class canNotTransferNegativeValueErrorMessage]! !

!Transfer methodsFor: 'assertions' stamp: 'edrr 5/29/2022 18:25:19'!
assertTransferValueIsNotZero: aValueToTransfer

	^ aValueToTransfer = 0 ifTrue: [self error: self class canNotTransferZeroErrorMessage]! !


!Transfer methodsFor: 'accessing' stamp: 'jeo 5/25/2022 16:39:55'!
deposit
	
	^deposit! !

!Transfer methodsFor: 'accessing' stamp: 'jeo 5/25/2022 16:59:10'!
value
	
	^ value.! !

!Transfer methodsFor: 'accessing' stamp: 'jeo 5/25/2022 16:43:08'!
withdraw

	^withdraw! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'Portfolio-Ejercicio2'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'jeo 5/25/2022 16:59:55'!
from: aSourceReceptiveAccount to: aDestinationReceptiveAccount withValue: aValueToTransfer
	
	^self new initializeFrom: aSourceReceptiveAccount to: aDestinationReceptiveAccount withValue: aValueToTransfer ! !


!Transfer class methodsFor: 'error messages' stamp: 'edrr 5/29/2022 18:47:52'!
canNotTransferBetweenSameAccountErrorMessage
	'cannot transfer between same account'! !

!Transfer class methodsFor: 'error messages' stamp: 'edrr 5/29/2022 18:20:27'!
canNotTransferNegativeValueErrorMessage
	'cannot transfer negative value'! !

!Transfer class methodsFor: 'error messages' stamp: 'jeo 5/25/2022 16:32:51'!
canNotTransferZeroErrorMessage
	^'can not transfer zero'! !
