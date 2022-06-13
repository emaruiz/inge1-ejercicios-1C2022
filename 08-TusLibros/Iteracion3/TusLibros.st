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

!CashierTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 16:57:55'!
test02CalculatedTotalIsCorrect

	| cart cashier |
	
	cart := testObjectsFactory createCart.
	cart add: 2 of: testObjectsFactory itemSellByTheStore.
	
	cashier :=  Cashier
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard 
		throught: self
		on: testObjectsFactory today 
		registeringOn: testObjectsFactory createSalesBook.
		
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

!CashierTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 19:11:42'!
test04CheckoutRegistersASale

	| cart cashier salesBook total |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
 	salesBook := 	testObjectsFactory createSalesBook.
	
	cashier:= Cashier 
		toCheckout: cart 
		charging: testObjectsFactory notExpiredCreditCard
		throught: self
		on: testObjectsFactory today
		registeringOn: salesBook.
		
	total := cashier checkOut.
					
	self assert: (salesBook itemsForClientId: cart clientId) size = 1.
	self assert: total equals: (salesBook totalForClientId: cart clientId).! !

!CashierTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 17:01:36'!
test05CashierChargesCreditCardUsingMerchantProcessor

	| cart cashier salesBook total creditCard debitedAmout debitedCreditCard  |

	cart := testObjectsFactory createCart.
	cart add: testObjectsFactory itemSellByTheStore.
	creditCard := testObjectsFactory notExpiredCreditCard.
	salesBook := testObjectsFactory createSalesBook.
 
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


!classDefinition: #CreditCardTest category: 'TusLibros'!
TestCase subclass: #CreditCardTest
	instanceVariableNames: 'testObjectsFactory'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 17:37:50'!
test01CreditCardWithInvalidDigitNumbersRaisesError
	
	self should: [CreditCard withCCNumber: testObjectsFactory invalidCCNumber expiringOn: testObjectsFactory validCCExpDate withOwner: testObjectsFactory validCCOwner.]
		raise: Error - MessageNotUnderstood
	 	withExceptionDo: [:anError | self assert: anError messageText = CreditCard invalidCCNumberErrorDescription]! !

!CreditCardTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 17:38:36'!
test02CreditCardWithFloatNumbersRaisesError
	
	self should: [CreditCard withCCNumber: 1.1 expiringOn: testObjectsFactory validCCExpDate withOwner: testObjectsFactory validCCOwner.]
		raise: Error - MessageNotUnderstood
	 	withExceptionDo: [:anError | self assert: anError messageText = CreditCard invalidCCNumberErrorDescription]! !

!CreditCardTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 17:42:09'!
test03CreditCardWithBlankOwnerRaisesError
	
	self should: [CreditCard withCCNumber: testObjectsFactory validCCNumber expiringOn: testObjectsFactory validCCExpDate withOwner: ' '.]
		raise: Error - MessageNotUnderstood
	 	withExceptionDo: [:anError | self assert: anError messageText = CreditCard invalidCCOwnerErrorDescription]! !

!CreditCardTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 18:01:42'!
test04CreditCardWithInvalidCharsInOwnerRaisesError
	
	self should: [CreditCard withCCNumber: testObjectsFactory validCCNumber expiringOn: testObjectsFactory validCCExpDate withOwner: 'a123'.]
		raise: Error - MessageNotUnderstood
	 	withExceptionDo: [:anError | self assert: anError messageText = CreditCard invalidCCOwnerErrorDescription]! !


!CreditCardTest methodsFor: 'setUp/tearDown' stamp: 'jeo 6/12/2022 17:27:32'!
setUp

	testObjectsFactory :=  StoreTestObjectsFactory new.! !


!classDefinition: #InterfaceTest category: 'TusLibros'!
TestCase subclass: #InterfaceTest
	instanceVariableNames: 'authBehavior testObjectsFactory lifetimeBehavior'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!InterfaceTest methodsFor: 'tests' stamp: 'edrr 6/11/2022 19:38:14'!
test01NewCartListsNoBooks
	
	| cartId interface |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	
	self assert: (interface listCart: cartId) isEmpty.! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 19:12:10'!
test02CreateCartWithInvalidClientId
	
	| interface cartId |
	interface := self createInterface.
	
	self should: [cartId := interface createCartForClientId: testObjectsFactory invalidClientId password: testObjectsFactory validPassword.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Interface invalidAuthenticationErrorMessage.
			self assert: cartId isNil].! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 19:12:32'!
test03CreateCartWithInvalidPassword
	
	| interface cartId |
	interface := self createInterface.
	
	self should: [cartId := interface createCartForClientId: testObjectsFactory validClientId password: testObjectsFactory invalidPassword.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Interface invalidAuthenticationErrorMessage.
			self assert: cartId isNil].! !

!InterfaceTest methodsFor: 'tests' stamp: 'edrr 6/11/2022 19:11:56'!
test04TwoCreatedCartsHaveDiffentCardId
	
	| cartId1 interface cartId2 |
	interface := self createInterface.
	cartId1 := self createCartWithInterface: interface.
	cartId2 := self createCartWithInterface: interface.
	
	self deny: cartId1 = cartId2.! !

!InterfaceTest methodsFor: 'tests' stamp: 'edrr 6/11/2022 19:51:18'!
test05AddBookToValidCart
	
	| cartId interface book |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	self assertCartId: cartId includesBook: book quantity: 1 forInterface: interface.! !

!InterfaceTest methodsFor: 'tests' stamp: 'edrr 6/11/2022 19:51:38'!
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

!InterfaceTest methodsFor: 'tests' stamp: 'edrr 6/11/2022 19:49:38'!
test06AddTwoBookToValidCart
	
	| cartId interface book |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	
	interface addToCart: cartId bookIsbn: book bookQuantity: 2.
	
	self assertCartId: cartId includesBook: book quantity: 2 forInterface: interface.! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 19:17:05'!
test07AddBookToInvalidCart
	
	| cartId interface book |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	
	self should: [interface addToCart: testObjectsFactory invalidCartId bookIsbn: book bookQuantity: 1.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Interface invalidCartIdErrorDescription.
			self assert: (interface listCart: cartId) isEmpty]. ! !

!InterfaceTest methodsFor: 'tests' stamp: 'edrr 6/11/2022 19:55:48'!
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

!InterfaceTest methodsFor: 'tests' stamp: 'edrr 6/11/2022 19:56:49'!
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

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 19:17:05'!
test10ListCartWithInvalidCartId
	
	| interface |
	interface := self createInterface.
	
	self should: [interface listCart: testObjectsFactory invalidCartId.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Interface invalidCartIdErrorDescription.]. ! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 20:59:40'!
test11CheckOutEmptyCartRaisesError
	
	| cartId interface |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	
	self should: [self checkoutCartId: cartId withInterface: interface] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError |
			self assert: anError messageText = Cashier cartCanNotBeEmptyErrorMessage.
			self assert: (interface listCart: cartId) isEmpty.
	]. 
	! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:01:30'!
test12CheckOutCartWithOneBook
	
	| cartId interface book purchaseList |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	self checkoutCartId: cartId withInterface: interface. 
		
	purchaseList := interface listPurchasesClientId: testObjectsFactory validClientId password: testObjectsFactory validPassword.
	self assert: (purchaseList items includes: book).
	self assert: 1 equals: (purchaseList items occurrencesOf: book).
	self assert: 1 equals: purchaseList items size.
	! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:02:00'!
test13CheckOutCartWithTwoBooks
	
	| cartId interface book purchaseList |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId bookIsbn: book bookQuantity: 2.
	
	self checkoutCartId: cartId withInterface: interface.
		
	purchaseList := interface listPurchasesClientId: testObjectsFactory validClientId password: testObjectsFactory validPassword.
	self assert: (purchaseList items includes: book).
	self assert: 2 equals: (purchaseList items occurrencesOf: book).
	self assert: 2 equals: purchaseList items size.
	! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:02:41'!
test14CheckOutInvalidCartRaisesError
	
	| interface |
	interface := self createInterface.

	self should: [self checkoutCartId: testObjectsFactory invalidCartId withInterface: interface.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = Interface invalidCartIdErrorDescription.
	].! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:07:48'!
test15CheckOutSameCartTwiceRaisesError
	
	| interface book cartId purchaseList |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	self checkoutCartId: cartId withInterface: interface.
	
	self should: [self checkoutCartId: cartId withInterface: interface.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = Interface invalidCartIdErrorDescription.
			purchaseList := interface listPurchasesClientId: testObjectsFactory validClientId password: testObjectsFactory validPassword.
			self assert: (purchaseList items includes: book).
			self assert: 1 equals: (purchaseList items occurrencesOf: book).
			self assert: 1 equals: purchaseList items size.
	].! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 20:53:13'!
test16CheckOutWithInvalidCCNumberRaisesError
	
	| interface book cartId |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	self should: [interface checkOutCart: cartId
		creditCardNumber: testObjectsFactory invalidCCNumber
		creditCardExpirationMonth: testObjectsFactory today monthIndex
		creditCardExpirationYear: testObjectsFactory today yearNumber + 1
		creditCardOwner: testObjectsFactory validCCOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = CreditCard invalidCCNumberErrorDescription.
	].! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 20:53:36'!
test17CheckOutWithInvalidExpirationMonthRaisesError
	
	| interface book cartId |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	self should: [interface checkOutCart: cartId
		creditCardNumber: testObjectsFactory validCCNumber
		creditCardExpirationMonth: 13
		creditCardExpirationYear: testObjectsFactory today yearNumber + 1
		creditCardOwner: testObjectsFactory validCCOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = Interface invalidCCExpirationMonthDescription.
	].! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 20:53:55'!
test18CheckOutWithInvalidExpirationYearRaisesError
	
	| interface book cartId |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	self should: [interface checkOutCart: cartId
		creditCardNumber: testObjectsFactory validCCNumber
		creditCardExpirationMonth: testObjectsFactory today monthIndex
		creditCardExpirationYear: 1950
		creditCardOwner: testObjectsFactory validCCOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = Interface invalidCCExpirationYearDescription.
	].! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 20:54:16'!
test19CheckOutWithInvalidOwnerRaisesError
	
	| interface book cartId |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	self should: [interface checkOutCart: cartId
		creditCardNumber: testObjectsFactory validCCNumber
		creditCardExpirationMonth: testObjectsFactory today monthIndex
		creditCardExpirationYear: testObjectsFactory today yearNumber + 1
		creditCardOwner: testObjectsFactory invalidCCOwner]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = CreditCard invalidCCOwnerErrorDescription.
	].! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:03:54'!
test20CheckOutCartRaisesTransactionId
	| interface book cartId1 cartId2 transaction1 transaction2 |
	interface := self createInterface.
	cartId1 := self createCartWithInterface: interface.
	cartId2 := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId1 bookIsbn: book bookQuantity: 1.
	interface addToCart: cartId2 bookIsbn: book bookQuantity: 1.
	
	transaction1 := self checkoutCartId: cartId1 withInterface: interface.
	transaction2 := self checkoutCartId: cartId2 withInterface: interface.
	
	self assert: transaction1 + 1 = transaction2.! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:04:04'!
test21ListPurchasesForClientWithOneSale
	| interface book cartId listPurchases |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId bookIsbn: book bookQuantity: 1.
	
	self checkoutCartId: cartId withInterface: interface.
	
	listPurchases := interface listPurchasesClientId: testObjectsFactory validClientId password: testObjectsFactory validPassword.
	self assert: listPurchases items includes: book.
	self assert: 1 equals: (listPurchases items occurrencesOf: book).
	self assert: 10 equals: listPurchases total.! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:04:25'!
test22ListPurchasesForClientWithTwoSales
	| interface book listPurchases cartId1 cartId2 |
	interface := self createInterface.
	cartId1 := self createCartWithInterface: interface.
	cartId2 := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	 
	interface addToCart: cartId1 bookIsbn: book bookQuantity: 1.
	interface addToCart: cartId2 bookIsbn: book bookQuantity: 1.
	
	self checkoutCartId: cartId1 withInterface: interface.
	self checkoutCartId: cartId2 withInterface: interface.
	
	listPurchases := interface listPurchasesClientId: testObjectsFactory validClientId password: testObjectsFactory validPassword.
	self assert: listPurchases items includes: book.
	self assert: 2 equals: (listPurchases items occurrencesOf: book).
	self assert: 20 equals: listPurchases total.! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:10:49'!
test23ListPurchasesForInvalidClientIdRaisesError
	| interface |
	interface := self createInterface.
	
	self should: [interface listPurchasesClientId: testObjectsFactory invalidClientId password: testObjectsFactory validPassword]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | 
			self assert: anError messageText = Interface invalidAuthenticationErrorMessage
			]! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:11:03'!
test24ListPurchasesForInvalidPasswordRaisesError
	| interface |
	interface := self createInterface.
	
	self should: [interface listPurchasesClientId: testObjectsFactory validClientId password: testObjectsFactory invalidPassword]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | 
			self assert: anError messageText = Interface invalidAuthenticationErrorMessage
			]! !

!InterfaceTest methodsFor: 'tests' stamp: 'jeo 6/12/2022 21:13:36'!
test25CartDiesHalfHourAfterLastOperation
	| interface book cartId |
	interface := self createInterface.
	cartId := self createCartWithInterface: interface.
	book := testObjectsFactory itemSellByTheStore.
	
	lifetimeBehavior := [:aCartId | false].
	self should: [interface addToCart: cartId bookIsbn: book bookQuantity: 1.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | 
			self assert: anError messageText = Interface cartExpiredErrorDescription.
			]! !


!InterfaceTest methodsFor: 'simulations' stamp: 'edrr 6/11/2022 18:49:51'!
validateClientId: aClientId password: aPassword 
	^authBehavior value: aClientId  value: aPassword.! !

!InterfaceTest methodsFor: 'simulations' stamp: 'jeo 6/12/2022 20:12:44'!
validateLifetimeCartId: aCartId
	^lifetimeBehavior value: aCartId! !


!InterfaceTest methodsFor: 'assertions' stamp: 'edrr 6/11/2022 19:50:40'!
assertCartId: aCartId includesBook: aBook quantity: aQuantity forInterface: aInteface
	| cartContent |
	
	cartContent := aInteface listCart: aCartId.
	self assert: cartContent includes: aBook.
	self assert: aQuantity equals: (cartContent occurrencesOf: aBook).
	self assert: aQuantity equals: cartContent size.! !


!InterfaceTest methodsFor: 'creations' stamp: 'jeo 6/12/2022 18:59:08'!
createCartWithInterface: interface

	^ interface createCartForClientId: testObjectsFactory validClientId password: testObjectsFactory validPassword! !

!InterfaceTest methodsFor: 'creations' stamp: 'jeo 6/12/2022 20:13:41'!
createInterface

	^ Interface withAuthService: self withCatalog: testObjectsFactory defaultCatalog withCartLifetimeMonitor: self. ! !


!InterfaceTest methodsFor: 'setup' stamp: 'jeo 6/12/2022 20:27:18'!
setUp 

	testObjectsFactory := StoreTestObjectsFactory new.
	authBehavior := [ :aClientId :aPassword | aClientId = testObjectsFactory validClientId and: (aPassword = testObjectsFactory validPassword)].
	lifetimeBehavior := [:aCartId | true].! !


!InterfaceTest methodsFor: 'tests-private' stamp: 'jeo 6/12/2022 21:00:06'!
checkoutCartId: cartId withInterface: interface

	^ interface checkOutCart: cartId
		creditCardNumber: testObjectsFactory validCCNumber
		creditCardExpirationMonth: testObjectsFactory today monthIndex
		creditCardExpirationYear: testObjectsFactory today yearNumber + 1
		creditCardOwner: testObjectsFactory validCCOwner! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'catalog items clientId'
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


!Cart methodsFor: 'initialization' stamp: 'jeo 6/12/2022 16:51:21'!
initializeAcceptingItemsOf: aCatalog clientId: aClientId

	catalog := aCatalog.
	items := Bag new.
	clientId := aClientId.! !


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


!Cart methodsFor: 'accessing' stamp: 'jeo 6/12/2022 16:50:43'!
clientId
	^clientId.! !

!Cart methodsFor: 'accessing' stamp: 'edrr 6/9/2022 20:58:02'!
items
	^items copy.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'jeo 6/12/2022 16:52:47'!
acceptingItemsOf: aCatalog clientId: aClientId

	^self new initializeAcceptingItemsOf: aCatalog clientId: aClientId.! !


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

!Cashier methodsFor: 'checkout - private' stamp: 'jeo 6/12/2022 16:41:20'!
createSale

	^ Sale of: total items: cart items.
! !

!Cashier methodsFor: 'checkout - private' stamp: 'HernanWilkinson 6/17/2013 19:06'!
debitTotal

	merchantProcessor debit: total from: creditCard.
	! !

!Cashier methodsFor: 'checkout - private' stamp: 'jeo 6/12/2022 18:46:29'!
registerSale
	
	(salesBook includesClientId: cart clientId) ifFalse: [salesBook initializeClientId: cart clientId].
	salesBook registerSale: self createSale forClientId: cart clientId.! !


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


!CreditCard methodsFor: 'initialization' stamp: 'jeo 6/12/2022 17:46:30'!
initializeWithCCNumber: aCCNumber expiringOn: aDate withOwner: aOwner 
	
	((aCCNumber isInteger) and: [aCCNumber decimalDigitLength = 16]) ifFalse: [self error: self class invalidCCNumberErrorDescription].
	(aOwner withBlanksTrimmed = '') ifTrue: [self error: self class invalidCCOwnerErrorDescription].
	(aOwner anySatisfy: [:char | char isLetter not]) ifTrue: [self error: self class invalidCCOwnerErrorDescription].
	
	ccNumber := aCCNumber.
	expiration := aDate.
	owner := aOwner.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'edrr 6/11/2022 21:16:40'!
withCCNumber: aCCNumber expiringOn: aDate withOwner: aOwner 
	
	^self new initializeWithCCNumber: aCCNumber expiringOn: aDate withOwner: aOwner ! !


!CreditCard class methodsFor: 'error descriptions' stamp: 'jeo 6/12/2022 17:34:30'!
invalidCCNumberErrorDescription
	^ 'invalid credit card number'! !

!CreditCard class methodsFor: 'error descriptions' stamp: 'jeo 6/12/2022 17:42:53'!
invalidCCOwnerErrorDescription
	^ 'invalid credit card owner'! !


!classDefinition: #Interface category: 'TusLibros'!
Object subclass: #Interface
	instanceVariableNames: 'authService currentCartId catalog carts salesBook currentTransaction cartLifeStatus auth lifetimeMonitor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Interface methodsFor: 'operations-private' stamp: 'jeo 6/12/2022 20:33:37'!
nextCartId

	^ currentCartId := currentCartId + 1! !

!Interface methodsFor: 'operations-private' stamp: 'jeo 6/12/2022 20:37:43'!
nextTransaction

	^ currentTransaction := currentTransaction + 1! !

!Interface methodsFor: 'operations-private' stamp: 'jeo 6/12/2022 20:32:59'!
removeCartId: aCartId
	self unregisterCart: aCartId.! !

!Interface methodsFor: 'operations-private' stamp: 'jeo 6/12/2022 20:32:59'!
unregisterCart: aCartId

	^ carts removeKey: aCartId! !


!Interface methodsFor: 'initialization' stamp: 'jeo 6/12/2022 20:24:23'!
initializeWithAuthService: anAuth withCatalog: aCatalog withCartLifetimeMonitor: aLifetimeMonitor 
	authService := anAuth.
	currentCartId := 0.
	catalog := aCatalog.
	carts := Dictionary new.
	salesBook := SalesBook new.
	currentTransaction := 0.
	cartLifeStatus := aLifetimeMonitor.! !


!Interface methodsFor: 'assertions' stamp: 'jeo 6/12/2022 20:31:44'!
assertCartIdIsValid: aCartId

	^ (carts includesKey: aCartId) ifFalse: [self error: self class invalidCartIdErrorDescription]! !

!Interface methodsFor: 'assertions' stamp: 'jeo 6/12/2022 20:21:04'!
assertCartLifetimeIsValid: aCartId

	^ (cartLifeStatus validateLifetimeCartId: aCartId) ifFalse: [
		self removeCartId: aCartId.
		self error: self class cartExpiredErrorDescription]! !

!Interface methodsFor: 'assertions' stamp: 'jeo 6/12/2022 20:32:18'!
assertCreditCardExpYearIsValid: aCCEYear

	^ (aCCEYear >= 1970) ifFalse: [self error: self class invalidCCExpirationYearDescription]! !

!Interface methodsFor: 'assertions' stamp: 'jeo 6/12/2022 20:32:01'!
assertCreditCartExpMonthIsValid: aCCEMonth

	^ (aCCEMonth between: 1 and: 12) ifFalse: [self error: self class invalidCCExpirationMonthDescription]! !

!Interface methodsFor: 'assertions' stamp: 'jeo 6/12/2022 18:56:22'!
assertValidAuthenticationForClientId: aPassword password: aClientId

	^ (authService validateClientId: aClientId password: aPassword) ifFalse: [self error: self class invalidAuthenticationErrorMessage ]! !


!Interface methodsFor: 'createCart' stamp: 'jeo 6/12/2022 20:41:07'!
createCartForClientId: aClientId

	carts at: currentCartId put: (Cart acceptingItemsOf: catalog clientId: aClientId).
	^ currentCartId.! !

!Interface methodsFor: 'createCart' stamp: 'jeo 6/12/2022 20:40:51'!
createCartForClientId: aClientId password: aPassword 
	self assertValidAuthenticationForClientId: aPassword password: aClientId.
	
	self nextCartId.
	^self createCartForClientId: aClientId.
	! !


!Interface methodsFor: 'addToCart' stamp: 'jeo 6/12/2022 20:20:15'!
addToCart: aCartId bookIsbn: aBookIsbn bookQuantity: aQuantity 
	self assertCartLifetimeIsValid: aCartId.
	self assertCartIdIsValid: aCartId.
	(carts at: aCartId) add: aQuantity of: aBookIsbn.! !


!Interface methodsFor: 'checkout' stamp: 'jeo 6/12/2022 20:46:13'!
checkOutCart: aCartId creditCardNumber: aCCNumber creditCardExpirationMonth: aCCEMonth creditCardExpirationYear: aCCEYear creditCardOwner: aCCOwner
	| cashier creditCard |
	self assertCartLifetimeIsValid: aCartId.
	self assertCartIdIsValid: aCartId. 
	self assertCreditCartExpMonthIsValid: aCCEMonth.
	self assertCreditCardExpYearIsValid: aCCEYear.
	
	creditCard := self createCCWithNumber: aCCEMonth expMonth: aCCEYear expYear: aCCOwner owner: aCCNumber.
	cashier := self createCahsierForCart: aCartId creditCard: creditCard.
	cashier checkOut.
	
	self unregisterCart: aCartId.
	^ self nextTransaction.! !

!Interface methodsFor: 'checkout' stamp: 'jeo 6/12/2022 20:45:29'!
createCCWithNumber: aCCEMonth expMonth: aCCEYear expYear: aCCOwner owner: aCCNumber

	^ CreditCard withCCNumber: aCCNumber expiringOn: (Month month: aCCEMonth year: aCCEYear) withOwner: aCCOwner! !

!Interface methodsFor: 'checkout' stamp: 'jeo 6/12/2022 20:46:06'!
createCahsierForCart: aCartId creditCard: creditCard

	^ Cashier
		toCheckout: (carts at: aCartId) 
		charging: creditCard 
		throught: CashierTest new setUp
		on: DateAndTime now 
		registeringOn: salesBook! !


!Interface methodsFor: 'listCart' stamp: 'jeo 6/12/2022 20:20:10'!
listCart: aCartId
	self assertCartLifetimeIsValid: aCartId.
	self assertCartIdIsValid: aCartId.
	^(carts at: aCartId) items.! !


!Interface methodsFor: 'listPurchases' stamp: 'jeo 6/12/2022 20:36:27'!
listPurchasesClientId: aClientId password: aPassword
	
	self assertValidAuthenticationForClientId: aPassword password: aClientId.
	^ Sale of: (salesBook totalForClientId: aClientId) items: (salesBook itemsForClientId: aClientId).! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Interface class' category: 'TusLibros'!
Interface class
	instanceVariableNames: ''!

!Interface class methodsFor: 'error description' stamp: 'jeo 6/12/2022 20:28:40'!
cartExpiredErrorDescription
	^'cart lifetime expired'! !

!Interface class methodsFor: 'error description' stamp: 'edrr 6/11/2022 18:52:47'!
invalidAuthenticationErrorMessage
	^'authentication error'! !

!Interface class methodsFor: 'error description' stamp: 'jeo 6/12/2022 17:52:15'!
invalidCCExpirationMonthDescription
	^'invalid expiration month'! !

!Interface class methodsFor: 'error description' stamp: 'jeo 6/12/2022 17:57:40'!
invalidCCExpirationYearDescription
	^'invalid expiration year'! !

!Interface class methodsFor: 'error description' stamp: 'jeo 6/12/2022 19:17:04'!
invalidCartIdErrorDescription
	^'invalid cart id'! !


!Interface class methodsFor: 'instance creation' stamp: 'jeo 6/12/2022 20:22:15'!
withAuthService: anAuth withCatalog: aCatalog withCartLifetimeMonitor: aLifetimeMonitor 

	^self new initializeWithAuthService: anAuth withCatalog: aCatalog withCartLifetimeMonitor: aLifetimeMonitor. ! !


!classDefinition: #Sale category: 'TusLibros'!
Object subclass: #Sale
	instanceVariableNames: 'total items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Sale methodsFor: 'accessing' stamp: 'jeo 6/12/2022 16:43:39'!
items
	
	^ items! !

!Sale methodsFor: 'accessing' stamp: 'HernanWilkinson 6/17/2013 18:48'!
total
	
	^ total! !


!Sale methodsFor: 'initialization' stamp: 'jeo 6/12/2022 16:43:10'!
initializeTotal: aTotal items: aCartContent

	total := aTotal.
	items := aCartContent.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Sale class' category: 'TusLibros'!
Sale class
	instanceVariableNames: ''!

!Sale class methodsFor: 'instance creation' stamp: 'jeo 6/12/2022 16:42:48'!
of: aTotal items: aCartContent

	"should assert total is not negative or 0!!"
	^self new initializeTotal: aTotal items: aCartContent! !


!classDefinition: #SalesBook category: 'TusLibros'!
Object subclass: #SalesBook
	instanceVariableNames: 'content'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!SalesBook methodsFor: 'operations' stamp: 'jeo 6/12/2022 18:42:00'!
includesClientId: aClientId
	^content includesKey: aClientId.! !

!SalesBook methodsFor: 'operations' stamp: 'jeo 6/12/2022 18:28:47'!
itemsForClientId: aClientId
	| items |
	items := OrderedCollection new.
	(content at: aClientId) do: [:sale | items addAllLast: sale items].
	^items.! !

!SalesBook methodsFor: 'operations' stamp: 'jeo 6/12/2022 18:47:38'!
registerSale: aSale forClientId: aClientId
	(content at: aClientId) add: aSale.! !

!SalesBook methodsFor: 'operations' stamp: 'jeo 6/12/2022 18:30:04'!
totalForClientId: aClientId

	^ (content at: aClientId) sum: [:sale | sale total] ifEmpty: [0].
	! !


!SalesBook methodsFor: 'initialization' stamp: 'jeo 6/12/2022 18:26:07'!
initialize
	content := Dictionary new.! !

!SalesBook methodsFor: 'initialization' stamp: 'jeo 6/12/2022 18:45:04'!
initializeClientId: aClientId
	content at: aClientId put: OrderedCollection new.! !


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


!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'jeo 6/12/2022 16:54:46'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog clientId: self validClientId.! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'HernanWilkinson 6/17/2013 18:08'!
defaultCatalog
	
	^ Dictionary new
		at: self itemSellByTheStore put: self itemSellByTheStorePrice;
		yourself ! !

!StoreTestObjectsFactory methodsFor: 'cart' stamp: 'jeo 6/12/2022 19:13:08'!
invalidCartId
	^'a'.! !


!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jeo 6/12/2022 19:07:08'!
expiredCreditCard
	
	^CreditCard withCCNumber: self validCCNumber expiringOn: self invalidCCEDate  withOwner: self validCCOwner ! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jeo 6/12/2022 19:07:22'!
invalidCCEDate
	^Month month: today monthIndex year: today yearNumber - 1! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jeo 6/12/2022 17:33:56'!
invalidCCNumber
	^1! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jeo 6/12/2022 20:54:33'!
invalidCCOwner
	^'a123'! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jeo 6/12/2022 19:06:00'!
notExpiredCreditCard
	
	^CreditCard withCCNumber: self validCCNumber expiringOn: self validCCExpDate withOwner: self validCCOwner.
! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jeo 6/12/2022 17:30:54'!
validCCExpDate
	^Month month: today monthIndex year: today yearNumber + 1! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jeo 6/12/2022 17:42:34'!
validCCNumber
	^1111111111111111! !

!StoreTestObjectsFactory methodsFor: 'credit card' stamp: 'jeo 6/12/2022 17:31:07'!
validCCOwner
	^'H'! !


!StoreTestObjectsFactory methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 18:37'!
initialize

	today := DateAndTime now! !


!StoreTestObjectsFactory methodsFor: 'date' stamp: 'HernanWilkinson 6/17/2013 18:37'!
today
	
	^ today! !


!StoreTestObjectsFactory methodsFor: 'auth' stamp: 'jeo 6/12/2022 18:55:36'!
invalidClientId
	^'invalidClient'! !

!StoreTestObjectsFactory methodsFor: 'auth' stamp: 'jeo 6/12/2022 19:01:20'!
invalidPassword
	^'invalidPassword'! !

!StoreTestObjectsFactory methodsFor: 'auth' stamp: 'jeo 6/12/2022 18:58:24'!
validClientId

	^ 'validClientId'! !

!StoreTestObjectsFactory methodsFor: 'auth' stamp: 'jeo 6/12/2022 18:17:36'!
validPassword
	^'validPassword'! !


!StoreTestObjectsFactory methodsFor: 'sales' stamp: 'jeo 6/12/2022 18:26:21'!
createSalesBook
	^ SalesBook new.! !
