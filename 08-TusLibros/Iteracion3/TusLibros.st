!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test01NewCartsAreCreatedEmpty

	self assert: testObjectsFactory createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [ cart add: testObjectsFactory itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 0 of: testObjectsFactory itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:10'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self 
		should: [cart add: 2 of: testObjectsFactory itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test06CartRemembersAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: testObjectsFactory itemSellByTheStore.
	self assert: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	self deny: (cart includes: testObjectsFactory itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:11'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := testObjectsFactory createCart.
	
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	self assert: (cart occurrencesOf: testObjectsFactory itemSellByTheStore) = 2! !


!CartTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 18:09'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.! !


!classDefinition: #CashierTest category: 'TusLibros'!
TestCase subclass: #CashierTest
	instanceVariableNames: 'testObjectsFactory debitBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:50'!
test01CanNotCheckoutAnEmptyCart

	| salesBook |
	
	salesBook := OrderedCollection new.
	self 
		should: [ Cashier 
			toCheckout: testObjectsFactory createCart 
			charging: testObjectsFactory notExpiredCreditCard 
			throught: self
			on: testObjectsFactory today
			registeringOn:  salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: OrderedCollection new.
		
	self assert: cashier checkOut = (testObjectsFactory itemSellByTheStorePrice * 2)! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:51'!
test03CanNotCheckoutWithAnExpiredCreditCart

	| cart salesBook |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
	
	self
		should: [ Cashier 
				toCheckout: cart 
				charging: testObjectsFactory expiredCreditCard 
				throught: self
				on: testObjectsFactory today
				registeringOn: salesBook ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError | 
			self assert: anError messageText = Cashier canNotChargeAnExpiredCreditCardErrorMessage.
			self assert: salesBook isEmpty ]! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:04'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: salesBook size = 1.
	self assert: salesBook first total = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 19:00'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	debitBehavior := [ :anAmount :aCreditCard | 
		debitedAmout := anAmount.
		debitedCreditCard := aCreditCard ].
	total := cashier checkOut.
					
	self assert: debitedCreditCard = creditCard.
	self assert: debitedAmout = total.! !

!CashierTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 18:59'!
test06CashierDoesNotSaleWhenTheCreditCardHasNoCredit

	| cart cashier salesBook creditCard |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := OrderedCollection new.
 	debitBehavior := [ :anAmount :aCreditCard | self error: Cashier creditCardHasNoCreditErrorMessage].
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: creditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	self 
		should: [cashier checkOut ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = Cashier creditCardHasNoCreditErrorMessage.
			self assert: salesBook isEmpty ]! !


!CashierTest methodsFor: 'setup' stamp: 'HernanWilkinson 6/17/2013 19:03'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	debitBehavior := [ :anAmount :aCreditCard | ]! !


!CashierTest methodsFor: 'merchant processor protocol' stamp: 'HernanWilkinson 6/17/2013 19:02'!
debit: anAmount from: aCreditCard 

	^debitBehavior value: anAmount value: aCreditCard ! !


!classDefinition: #InterfaceTest category: 'TusLibros'!
TestCase subclass: #InterfaceTest
	instanceVariableNames: 'authBehavior testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:50:40'!
assertCartId: aCartId includesBook: aBook quantity: aQuantity forInterface: aInteface
	| cartContent |
	
	cartContent := aInteface listCart: aCartId.
	self assert: cartContent includes: aBook.
	self assert: aQuantity equals: (cartContent occurrencesOf: aBook).
	self assert: aQuantity equals: cartContent size.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:32:06'!
createCartWithInterface: interface

	^ interface createCartForClientId: self validClientId password: self validPassword! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/9/2022 20:59:32'!
createInterface

	^ Interface withLoginService: self withCatalog: testObjectsFactory defaultCatalog! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:34:57'!
invalidCartId

	^ 'a'! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:33:06'!
invalidClientId

	^ 'clienteNoValido'! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:35:10'!
invalidPassword
	'passwordNoValido'! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:36:47'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	authBehavior := [ :aClientId :aPassword | aClientId = self validClientId and: (aPassword = self validPassword)].! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:38:14'!
test01NewCartListsNoBooks
	
	| cartId interface |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	
	self assert: (interface listCart: cartId) isEmpty.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:37:18'!
test02CreateCartWithInvalidClientId
	
	| interface cartId |
	interface := self createInterface.
	
	self should: [cartId := interface createCartForClientId: self invalidClientId password: self validPassword.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Interface invalidAuthenticationErrorMessage.
			self assert: cartId isNil].! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:37:25'!
test03CreateCartWithInvalidPassword
	
	| interface cartId |
	interface := self createInterface.
	
	self should: [cartId := interface createCartForClientId: self validClientId password: self invalidPassword.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Interface invalidAuthenticationErrorMessage.
			self assert: cartId isNil].! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:11:56'!
test04TwoCreatedCartsHaveDiffentCardId
	
	| cartId1 interface cartId2 |
	interface := self createInterface.
	cartId1 := self createCartWithInterface: interface.
	cartId2 := self createCartWithInterface: interface.
	
	self deny: cartId1 = cartId2.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:51:18'!
test05AddBookToValidCart
	
	| cartId interface book |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	self assertCartId: cartId includesBook: book quantity: 1 forInterface: interface.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:51:38'!
test06AddBookToTwoValidCarts
	
	| cartId1 interface book cartId2 |
	interface := self createInterface.
	cartId1 := self createCartWithInterface: interface.
	cartId2 := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	
	interface addToCart: cartId1 bookIsbn: book bookQuantity: 1.
	interface addToCart: cartId2 bookIsbn: book bookQuantity: 1.
	
	self assertCartId: cartId1 includesBook: book quantity: 1 forInterface: interface.
	self assertCartId: cartId2 includesBook: book quantity: 1 forInterface: interface.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:49:38'!
test06AddTwoBookToValidCart
	
	| cartId interface book |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	
	interface addToCart: cartId bookIsbn: book bookQuantity: 2.
	
	self assertCartId: cartId includesBook: book quantity: 2 forInterface: interface.! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:37:38'!
test07AddBookToInvalidCart
	
	| cartId interface book |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	
	self should: [interface addToCart: self invalidCartId bookIsbn: book bookQuantity: 1.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Interface invalidCartIdErrorMessage.
			self assert: (interface listCart: cartId) isEmpty]. ! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:55:48'!
test08AddInvalidBookToCart
	
	| cartId interface book |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemNotSellByTheStore.
	
	self should: [interface addToCart: cartId bookIsbn: book bookQuantity: 1.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Cart new invalidItemErrorMessage.
			self assert: (interface listCart: cartId) isEmpty]. ! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:56:49'!
test09AddBookWithInvalidQuantity
	
	| cartId interface book |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	
	self should: [interface addToCart: cartId bookIsbn: book bookQuantity: 1.1.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Cart new invalidQuantityErrorMessage.
			self assert: (interface listCart: cartId) isEmpty]. ! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:34:57'!
test10ListCartWithInvalidCartId
	
	| interface |
	interface := self createInterface.
	
	self should: [interface listCart: self invalidCartId.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Interface invalidCartIdErrorMessage.]. ! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:32:06'!
test11CheckOutEmptyCartRaisesError
	
	| cartId interface |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	
	self should: [interface checkOutCart: cartId 
		creditCardNumber: 1111111111111111
		creditCardExpirationMonth: testObjectsFactory today monthIndex
		creditCardExpirationYear: testObjectsFactory today yearNumber + 1
		creditCardOwner: 'A'.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: (interface listCart: cartId) isEmpty.
			self assert: (interface listPurchasesClientId: self validClientId password: self validPassword) isEmpty]. 
	! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 21:24:36'!
test12CheckOutCartWithOneBook
	
	| cartId interface book purchaseList |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	interface checkOutCart: cartId 
		creditCardNumber: 1111111111111111
		creditCardExpirationMonth: testObjectsFactory today monthIndex
		creditCardExpirationYear: testObjectsFactory today yearNumber + 1
		creditCardOwner: 'A'.
		
	purchaseList := interface listPurchasesClientId: self validClientId password: self validPassword.
	self assert: (purchaseList includes: book).
	self assert: 1 equals: (purchaseList occurrencesOf: book).
	self assert: 1 equals: purchaseList size.
	! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:57:40'!
testXCheckOutCartRaisesTransactionId
	
	
	! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:57:59'!
testZCheckOutTwoCartsRaisesTransactionId
	
	! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:31:39'!
validClientId

	^ 'clienteValido'! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 20:32:06'!
validPassword

	^ 'passwordValido'! !

!InterfaceTest methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 18:49:51'!
validateClientId: aClientId password: aPassword 
	^authBehavior value: aClientId  value: aPassword.! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:06'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'edrr 6/11/2022 20:02:18'!
assertIsValidQuantity: aQuantity

	(aQuantity isInteger and: [aQuantity strictlyPositive]) ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'edrr 6/11/2022 18:58:34'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := Bag new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 19:09'!
total

	^ items sum: [ :anItem | catalog at: anItem ]! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'as yet unclassified' stamp: 'edrr 6/9/2022 20:58:02'!
items
	^items copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'cart salesBook merchantProcessor creditCard total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:08'!
calculateTotal

	total := cart total.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:07'!
createSale

	^ Sale of: total
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
registerSale

	salesBook add: self createSale! !


!Cashier methodsFor: 'checkout' stamp: 'HernanWilkinson 6/17/2013 19:06'!
checkOut

	self calculateTotal.
	self debitTotal.
	self registerSale.

	^ total! !


!Cashier methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:53'!
initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook
	
	cart := aCart.
	creditCard := aCreditCard.
	merchantProcessor := aMerchantProcessor.
	salesBook := aSalesBook! !


"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:22'!
assertIsNotEmpty: aCart 
	
	aCart isEmpty ifTrue: [self error: self cartCanNotBeEmptyErrorMessage ]! !

!Cashier class methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 18:23'!
assertIsNotExpired: aCreditCard on: aDate
	
	(aCreditCard isExpiredOn: aDate) ifTrue: [ self error: self canNotChargeAnExpiredCreditCardErrorMessage ]! !


!Cashier class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:51'!
toCheckout: aCart charging: aCreditCard throught: aMerchantProcessor on: aDate registeringOn: aSalesBook
	
	self assertIsNotEmpty: aCart.
	self assertIsNotExpired: aCreditCard on: aDate.
	
	^self new initializeToCheckout: aCart charging: aCreditCard throught: aMerchantProcessor registeringOn: aSalesBook! !


!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 18:21'!
canNotChargeAnExpiredCreditCardErrorMessage
	
	^'Can not charge an expired credit card'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:56'!
cartCanNotBeEmptyErrorMessage
	
	^'Can not check out an empty cart'! !

!Cashier class methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 19:02'!
creditCardHasNoCreditErrorMessage
	
	^'Credit card has no credit'! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'expiration ccNumber month owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 18:39'!
isExpiredOn: aDate 
	
	^expiration start < (Month month: aDate monthIndex year: aDate yearNumber) start ! !


!CreditCard methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:38'!
initializeExpiringOn: aMonth 
	
	expiration := aMonth ! !

!CreditCard methodsFor: 'initialization' stamp: 'edrr 6/11/2022 21:16:29'!
initializeWithCCNumber: aCCNumber expiringOn: aDate withOwner: aOwner 
	
	ccNumber := aCCNumber.
	expiration := aDate.
	owner := aOwner.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:38'!
expiringOn: aMonth 
	
	^self new initializeExpiringOn: aMonth! !

!CreditCard class methodsFor: 'instance creation' stamp: 'edrr 6/11/2022 21:16:40'!
withCCNumber: aCCNumber expiringOn: aDate withOwner: aOwner 
	
	^self new initializeWithCCNumber: aCCNumber expiringOn: aDate withOwner: aOwner ! !


!classDefinition: #Interface category: 'TusLibros'!
Object subclass: #Interface
	instanceVariableNames: 'authService currentCartId catalog carts salesBook purchases'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Interface methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:34:16'!
addToCart: aCartId bookIsbn: aBookIsbn bookQuantity: aQuantity 
	self assertCartIdIsValid: aCartId.
	(carts at: aCartId) add: aQuantity of: aBookIsbn.! !

!Interface methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:34:16'!
assertCartIdIsValid: aCartId

	^ (carts includesKey: aCartId) ifFalse: [self error: self class invalidCartIdErrorMessage]! !

!Interface methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 21:29:26'!
checkOutCart: aCartId creditCardNumber: aCCNumber creditCardExpirationMonth: aCCEMonth creditCardExpirationYear: aCCEYear creditCardOwner: aCCOwner
	| cashier creditCard |
	creditCard := CreditCard withCCNumber: aCCNumber expiringOn: (Month month: aCCEMonth year: aCCEYear) withOwner: aCCOwner.
	 
	cashier := Cashier
		toCheckout: (carts at: aCartId) 
		charging: creditCard 
		throught: CashierTest new setUp
		on: DateAndTime now 
		registeringOn: salesBook.
	
	cashier checkOut.! !

!Interface methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:07:38'!
createCartForClientId: aClientId password: aPassword 
	(authService validateClientId: aClientId password: aPassword) ifFalse: [self error: self class invalidAuthenticationErrorMessage ].
	
	currentCartId := currentCartId + 1.
	
	carts at: currentCartId put: (Cart acceptingItemsOf: catalog).
	
	^currentCartId.
	! !

!Interface methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 19:34:16'!
listCart: aCartId
	self assertCartIdIsValid: aCartId.
	^(carts at: aCartId) items.! !

!Interface methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 21:20:40'!
listPurchasesClientId: aClientId password: aPassword
	^salesBook.! !


!Interface methodsFor: 'initialization' stamp: 'edrr 6/11/2022 21:26:48'!
initializeWithLoginService: aLoginService withCatalog: aCatalog  
	
	authService := aLoginService.
	currentCartId := 0.
	catalog := aCatalog.
	carts := Dictionary new.
	salesBook := OrderedCollection new.
	purchases := Dictionary new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Interface class' category: 'TusLibros'!
Interface class
	instanceVariableNames: ''!

!Interface class methodsFor: 'as yet unclassified' stamp: 'edrr 6/11/2022 18:52:47'!
invalidAuthenticationErrorMessage
	^'authentication error'! !

!Interface class methodsFor: 'as yet unclassified' stamp: 'edrr 6/9/2022 21:25:24'!
invalidCartIdErrorMessage
	^'invalid cart id'! !


!Interface class methodsFor: 'instance creation' stamp: 'edrr 6/9/2022 20:52:22'!
withLoginService: aLoginService withCatalog: aCatalog  
	
	^self new initializeWithLoginService: aLoginService withCatalog: aCatalog. ! !


!classDefinition: #Sale category: 'TusLibros'!
Object subclass: #Sale
	instanceVariableNames: 'total'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'total' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:47'!
initializeTotal: aTotal

	total := aTotal ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 18:47'!
of: aTotal

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal ! !


!classDefinition: #StoreTestObjectsFactory category: 'TusLibros'!
Object subclass: #StoreTestObjectsFactory
	instanceVariableNames: 'today'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStore
	
	^ 'validBook'! !

!StoreTestObjectsFactory methodsFor: 'items' stamp: 'HernanWilkinson 6/17/2013 18:08'!
itemSellByTheStorePrice
	
	^10! !


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:37'!
expiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber - 1)! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'HernanWilkinson 6/17/2013 18:36'!
notExpiredCreditCard
	
	^CreditCard expiringOn: (Month month: today monthIndex year: today yearNumber + 1)! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !
