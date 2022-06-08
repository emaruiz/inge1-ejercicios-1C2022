!classDefinition: #TusLibrosTest category: 'TusLibros'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!TusLibrosTest methodsFor: 'cart creation' stamp: 'jeo 6/7/2022 20:07:51'!
bookWithInvalidPrice

	^ 'invalidPriceBook'! !

!TusLibrosTest methodsFor: 'cart creation' stamp: 'jeo 6/7/2022 19:58:17'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!TusLibrosTest methodsFor: 'cart creation' stamp: 'jeo 6/7/2022 20:08:04'!
defaultCatalog
	
	| catalog |
	catalog := Dictionary new.
	catalog at: self itemSellByTheStore put: 10.
	catalog at: self bookWithInvalidPrice put: 1000000000000000.
	^catalog! !

!TusLibrosTest methodsFor: 'cart creation' stamp: 'jeo 6/7/2022 19:58:31'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!TusLibrosTest methodsFor: 'cart creation' stamp: 'jeo 6/7/2022 19:58:37'!
itemSellByTheStore
	
	^ 'validBook'! !


!TusLibrosTest methodsFor: 'credit card creation' stamp: 'jeo 6/7/2022 20:02:31'!
createCreditCardWithInvalidOwner
	^ CreditCard withNumber: 1111111111111111 expirationDate: Date tomorrow owner: '1234567891123456789212345678931' ! !

!TusLibrosTest methodsFor: 'credit card creation' stamp: 'jeo 6/7/2022 19:59:49'!
createExpiredCreditCard
	^ CreditCard withNumber: 1111111111111111 expirationDate: Date yesterday owner: 'H' ! !

!TusLibrosTest methodsFor: 'credit card creation' stamp: 'jeo 6/7/2022 20:04:27'!
createValidCreditCard
	^ CreditCard withNumber: 1111111111111111 expirationDate: Date tomorrow owner: 'H'. ! !


!TusLibrosTest methodsFor: 'cashier creation' stamp: 'jeo 6/7/2022 20:00:35'!
createCashierWithMerchantProcessorSimulatingDisabledCard
	^ Cashier withMerchant: MerchantProcessorDisabledCreditCard new.! !

!TusLibrosTest methodsFor: 'cashier creation' stamp: 'jeo 6/7/2022 20:03:10'!
createCashierWithMerchantProcessorSimulatingEnabledCard

	^ Cashier withMerchant: MerchantProcessorEnabledCreditCard new.! !


!classDefinition: #CartTest category: 'TusLibros'!
TusLibrosTest subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !


!classDefinition: #CashierTest category: 'TusLibros'!
TusLibrosTest subclass: #CashierTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CashierTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 20:04:32'!
test01CheckoutEmptyCartRaisesError
	| cart cashier creditCard |
	cart := self createCart.
	cashier := self createCashierWithMerchantProcessorSimulatingEnabledCard.
	creditCard := self createValidCreditCard.
	
	self should: [cashier checkout: cart creditCard: creditCard]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = Cashier cannotCheckoutEmptyCartErrorDescription.
			self assert: cashier sales isEmpty].! !

!CashierTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 20:43:11'!
test02CheckoutCartWithOneBook
	| cart cashier total creditCard |
	cart := self createCart.
	cart add: self itemSellByTheStore.
	cashier := self createCashierWithMerchantProcessorSimulatingEnabledCard.
	creditCard := self createValidCreditCard.
	
	total := cashier checkout: cart creditCard: creditCard.
	
	self assert: 10 equals: total.
	self assert: cashier sales includes: cart.
	self assert: 1 equals: cashier sales size.
	! !

!CashierTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 20:44:13'!
test03CheckoutCartWithTwoBooks
	| cart cashier total creditCard |
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore .
	cashier := self createCashierWithMerchantProcessorSimulatingEnabledCard.
	creditCard := self createValidCreditCard.
	
	total := cashier checkout: cart creditCard: creditCard.
	
	self assert: 20 equals: total.
	self assert: cashier sales includes: cart.
	self assert: 1 equals: cashier sales size.! !

!CashierTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 20:05:42'!
test04CheckoutCartWithExpiredCreditCardRaisesError
	| cart cashier creditCard |
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.
	cashier := self createCashierWithMerchantProcessorSimulatingEnabledCard.
	creditCard := self createExpiredCreditCard.
	
	self should: [cashier checkout: cart creditCard: creditCard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = Cashier cannotCheckoutExpiredCreditCardErrorDescription.
			self assert: cashier sales isEmpty].! !


!classDefinition: #CreditCardTest category: 'TusLibros'!
TusLibrosTest subclass: #CreditCardTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCardTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 18:16:59'!
test01CreditCardWithLessDigitNumbersRaisesError
	
	self should: [CreditCard withNumber: 1 expirationDate: Date today owner: 'H'.]
		raise: Error 
	 	withExceptionDo: [:anError | self assert: anError messageText = CreditCard cannotCreateCreditCardWithInvalidNumberErrorDescription]! !

!CreditCardTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 18:05:39'!
test02CreditCardWithNoOwnerRaisesError
	
	self should: [CreditCard withNumber: 1111111111111111 expirationDate: Date today owner: ''.]
		raise: Error 
	 	withExceptionDo: [:anError | self assert: anError messageText = CreditCard cannotCreateCreditCardWithInvalidOwnerErrorDescription]! !

!CreditCardTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 19:51:29'!
test03CreditCardWithBlankOwnerRaisesError
	
	self should: [CreditCard withNumber: 1111111111111111 expirationDate: Date today owner: ' '.]
		raise: Error 
	 	withExceptionDo: [:anError | self assert: anError messageText = CreditCard cannotCreateCreditCardWithInvalidOwnerErrorDescription]! !

!CreditCardTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 18:16:47'!
test04CreditCardWithMoreDigitNumbersRaisesError
	
	self should: [CreditCard withNumber: 11111111111111111 expirationDate: Date today owner: 'H'.]
		raise: Error 
	 	withExceptionDo: [:anError | self assert: anError messageText = CreditCard cannotCreateCreditCardWithInvalidNumberErrorDescription]! !


!classDefinition: #MerchantProcessorTest category: 'TusLibros'!
TusLibrosTest subclass: #MerchantProcessorTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 20:11:04'!
test01MerchantProcessorWithDisabledCreditCardRaisesError
	| cart cashier creditCard |
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.
	cashier := self createCashierWithMerchantProcessorSimulatingDisabledCard.
	creditCard := self createValidCreditCard.
	
	self should: [cashier checkout: cart creditCard: creditCard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = MerchantProcessor cannotDebitDisabledCreditCardErrorDescription.
			self assert: cashier sales isEmpty].! !

!MerchantProcessorTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 20:45:49'!
test02MerchantProcessorWithInvalidCreditCardOwnerRaisesError
	| cart cashier creditCard |
	cart := self createCart.
	cart add: 2 of: self itemSellByTheStore.
	cashier := self createCashierWithMerchantProcessorSimulatingEnabledCard.
	creditCard := self createCreditCardWithInvalidOwner.
	
	self should: [cashier checkout: cart creditCard: creditCard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = MerchantProcessor cannotCheckoutInvalidCreditCardOwnerErrorDescription.
			self assert: cashier sales isEmpty].! !

!MerchantProcessorTest methodsFor: 'tests' stamp: 'jeo 6/7/2022 20:46:45'!
test03MerchantProcessorWithInvalidTotalRaisesError
	| cart cashier creditCard |
	cart := self createCart.
	cart add: 1 of: self bookWithInvalidPrice.
	cashier := self createCashierWithMerchantProcessorSimulatingEnabledCard.
	creditCard := self createValidCreditCard.
	
	self should: [cashier checkout: cart creditCard: creditCard.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | 
			self assert: anError messageText = MerchantProcessor cannotCheckoutInvalidTotalErrorDescription.
			self assert: cashier sales isEmpty].! !


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


!Cart methodsFor: 'assertions' stamp: 'edrr 6/6/2022 21:31:59'!
assertIsValidItem: anItem

	(catalog includesKey: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'operations' stamp: 'edrr 6/6/2022 21:32:58'!
calculateTotal
	^items sum: [:book | catalog at: book].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: 'TusLibros'!
Object subclass: #Cashier
	instanceVariableNames: 'sales merchantProcessor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'initialization' stamp: 'jeo 6/7/2022 20:11:55'!
initializeWithMerchant: aMerchantProcessor 
	
	merchantProcessor := aMerchantProcessor.
	sales := OrderedCollection new.! !


!Cashier methodsFor: 'accessing' stamp: 'jeo 6/7/2022 17:49:32'!
sales

	^ sales copy.! !


!Cashier methodsFor: 'operations' stamp: 'jeo 6/7/2022 20:48:29'!
checkout: aCart creditCard: aCreditCard 
	
	self assertCartIsNotEmpty: aCart.
	self assertCreditCardIsNotExpired: aCreditCard.
	
	merchantProcessor debitForCart: aCart creditCard: aCreditCard cashier: self.
	
	^aCart calculateTotal.! !

!Cashier methodsFor: 'operations' stamp: 'jeo 6/7/2022 20:29:35'!
registerSale: aTotal 
	
	sales add: aTotal.! !


!Cashier methodsFor: 'assertions' stamp: 'jeo 6/7/2022 18:24:41'!
assertCartIsNotEmpty: aCart

	^ aCart isEmpty ifTrue: [self error: self class cannotCheckoutEmptyCartErrorDescription]! !

!Cashier methodsFor: 'assertions' stamp: 'jeo 6/7/2022 18:24:56'!
assertCreditCardIsNotExpired: aCreditCard

	^ (aCreditCard isExpiredOn: Date today) ifTrue: [self error: self class cannotCheckoutExpiredCreditCardErrorDescription ]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: 'TusLibros'!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'error descriptions' stamp: 'edrr 6/6/2022 18:42:41'!
cannotCheckoutEmptyCartErrorDescription
	^'cannot checkout empty cart'! !

!Cashier class methodsFor: 'error descriptions' stamp: 'edrr 6/6/2022 19:36:00'!
cannotCheckoutExpiredCreditCardErrorDescription
	'cannot checkput expired credit card'! !


!Cashier class methodsFor: 'instance creation' stamp: 'jeo 6/7/2022 18:29:03'!
withMerchant: aMerchantProcessor 

	^self new initializeWithMerchant: aMerchantProcessor ! !


!classDefinition: #CreditCard category: 'TusLibros'!
Object subclass: #CreditCard
	instanceVariableNames: 'creditCardNumber expirationDate owner'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'initialization' stamp: 'jeo 6/7/2022 18:23:46'!
initializeWithNumber: aCreditCardNumber expirationDate: anExpirationDate owner: aOwner 
	
	self assertCreditCardNumberIsValid: aCreditCardNumber.
	self assertCreditCardOwnerIsValid: aOwner.
	
	creditCardNumber := aCreditCardNumber.
	expirationDate := anExpirationDate.
	owner := aOwner.! !


!CreditCard methodsFor: 'operations' stamp: 'edrr 6/6/2022 21:46:37'!
isExpiredOn: aDate 
	^expirationDate < aDate.! !

!CreditCard methodsFor: 'operations' stamp: 'jeo 6/7/2022 20:13:17'!
isOwnerLengthGreaterThan: aLength
	
	^ owner size > aLength.! !


!CreditCard methodsFor: 'assertions' stamp: 'jeo 6/7/2022 18:23:32'!
assertCreditCardNumberIsValid: aCreditCardNumber

	^ (aCreditCardNumber between: 1000000000000000 and: 9999999999999999) ifFalse: [self error: self class cannotCreateCreditCardWithInvalidNumberErrorDescription]! !

!CreditCard methodsFor: 'assertions' stamp: 'jeo 6/7/2022 18:23:46'!
assertCreditCardOwnerIsValid: aOwner

	^ (aOwner withBlanksTrimmed = '') ifTrue: [self error: self class cannotCreateCreditCardWithInvalidOwnerErrorDescription]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: 'TusLibros'!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'instance creation' stamp: 'edrr 6/6/2022 21:41:17'!
withNumber: aCreditCardNumber expirationDate: anExpirationDate owner: aOwner 
	
	^self new initializeWithNumber: aCreditCardNumber expirationDate: anExpirationDate owner: aOwner ! !


!CreditCard class methodsFor: 'error descriptions' stamp: 'jeo 6/7/2022 17:42:24'!
cannotCreateCreditCardWithInvalidNumberErrorDescription
	^ 'invalid credit card number'! !

!CreditCard class methodsFor: 'error descriptions' stamp: 'jeo 6/7/2022 18:06:56'!
cannotCreateCreditCardWithInvalidOwnerErrorDescription
	^ 'invalid owner'! !


!classDefinition: #MerchantProcessor category: 'TusLibros'!
Object subclass: #MerchantProcessor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessor methodsFor: 'operations' stamp: 'jeo 6/7/2022 20:38:35'!
debitForCart: aCart creditCard: aCreditCard cashier: aCashier
	
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MerchantProcessor class' category: 'TusLibros'!
MerchantProcessor class
	instanceVariableNames: ''!

!MerchantProcessor class methodsFor: 'error descriptions' stamp: 'jeo 6/7/2022 20:41:54'!
cannotCheckoutInvalidCreditCardOwnerErrorDescription
	^ 'invalid credit card owner'! !

!MerchantProcessor class methodsFor: 'error descriptions' stamp: 'jeo 6/7/2022 20:41:21'!
cannotCheckoutInvalidTotalErrorDescription
	^'invalid total'! !

!MerchantProcessor class methodsFor: 'error descriptions' stamp: 'jeo 6/7/2022 19:46:39'!
cannotDebitDisabledCreditCardErrorDescription
	^ 'disabled credit card'! !


!classDefinition: #MerchantProcessorDisabledCreditCard category: 'TusLibros'!
MerchantProcessor subclass: #MerchantProcessorDisabledCreditCard
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorDisabledCreditCard methodsFor: 'operations' stamp: 'jeo 6/7/2022 20:38:25'!
debitForCart: aCart creditCard: aCreditCard cashier: aCashier

	self error: self class cannotDebitDisabledCreditCardErrorDescription ! !


!classDefinition: #MerchantProcessorEnabledCreditCard category: 'TusLibros'!
MerchantProcessor subclass: #MerchantProcessorEnabledCreditCard
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!MerchantProcessorEnabledCreditCard methodsFor: 'operations' stamp: 'jeo 6/7/2022 20:40:30'!
assertCreditCardOwner: aCreditCard 
	
	(aCreditCard isOwnerLengthGreaterThan: 30) ifTrue: [self error: self class cannotCheckoutInvalidCreditCardOwnerErrorDescription].! !

!MerchantProcessorEnabledCreditCard methodsFor: 'operations' stamp: 'jeo 6/7/2022 20:40:51'!
assertTotalIsValid: aTotal

	(aTotal integerPart decimalDigitLength > 15) ifTrue: [self error: self class cannotCheckoutInvalidTotalErrorDescription].
! !

!MerchantProcessorEnabledCreditCard methodsFor: 'operations' stamp: 'jeo 6/7/2022 20:38:02'!
debit: aTotal creditCard: aCreditCard
! !

!MerchantProcessorEnabledCreditCard methodsFor: 'operations' stamp: 'jeo 6/7/2022 20:38:17'!
debitForCart: aCart creditCard: aCreditCard cashier: aCashier
	| total |
	total := aCart calculateTotal.
	self assertCreditCardOwner: aCreditCard.
	self assertTotalIsValid: total.
	
	self debit: total creditCard: aCreditCard.
	
	aCashier registerSale: aCart.! !
