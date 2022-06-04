!classDefinition: #CartTest category: 'TusLibros'!
TestCase subclass: #CartTest
	instanceVariableNames: 'testCatalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'creations' stamp: 'jeo 6/4/2022 18:57:46'!
createCart

	^ Cart withCatalog: testCatalog.! !

!CartTest methodsFor: 'creations' stamp: 'jeo 6/4/2022 17:37:47'!
createCatalog

	^ Set with: 'book1' with: 'book2'.! !


!CartTest methodsFor: 'setUp/tearDown' stamp: 'jeo 6/4/2022 18:50:05'!
setUp
	
	testCatalog := self createCatalog.! !


!CartTest methodsFor: 'tests' stamp: 'jeo 6/4/2022 18:50:31'!
test01NewCartIsEmpty
	self assert: (self createCart) isEmpty.
	! !

!CartTest methodsFor: 'tests' stamp: 'jeo 6/4/2022 18:51:18'!
test02CartWithOneBook
	| cart |
	cart := self createCart.
	cart add: 'book1' quantity: 1.

	self assert: 1 equals: (cart addedQuantityOfBook: 'book1')	.! !

!CartTest methodsFor: 'tests' stamp: 'jeo 6/4/2022 18:51:44'!
test03CartWithTwoBooks
	| cart |
	cart := self createCart.
	cart add: 'book1' quantity: 1.
	cart add: 'book2' quantity: 1.
	
	self assert: 2 equals: (cart size).
	self assert: 1 equals: (cart addedQuantityOfBook: 'book1').
	self assert: 1 equals: (cart addedQuantityOfBook: 'book2').! !

!CartTest methodsFor: 'tests' stamp: 'jeo 6/4/2022 18:58:31'!
test04AddInvalidBookToCartRaisesError
	| cart |
	cart := self createCart.
	self should: [cart add: 'not valid' quantity: 1.] 
		raise: Error  
		withMessageText: Cart cannotAddBookNotRegisteredInCatalogErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'jeo 6/4/2022 18:52:03'!
test05CartAddTwoOfTheSameBook
	| cart |
	cart := self createCart.
	cart add: 'book1' quantity: 2.
	
	self assert: 2 equals: (cart addedQuantityOfBook: 'book1').! !

!CartTest methodsFor: 'tests' stamp: 'jeo 6/4/2022 18:52:10'!
test06CartAddsZeroQuantityRaisesError
	| cart |
	cart := self createCart.
	self should: [cart add: 'book1' quantity: 0.]
		raise: Error
		withMessageText: Cart cannotAddBookWithInvalidQuantityToCartErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'jeo 6/4/2022 18:52:16'!
test07CartAddsNegativeQuantityRaisesError
	| cart |
	cart := self createCart.
	self should: [cart add: 'book1' quantity: -1.]
		raise: Error
		withMessageText: Cart cannotAddBookWithInvalidQuantityToCartErrorDescription.! !

!CartTest methodsFor: 'tests' stamp: 'jeo 6/4/2022 18:52:25'!
test08NewCartListsNoAddedBooks
	| cart |
	cart := self createCart.
	self assert: (OrderedCollection new) equals: (cart addedBooks).! !

!CartTest methodsFor: 'tests' stamp: 'jeo 6/4/2022 18:57:46'!
test09CartListsAddedBooks
	| cart |
	cart := self createCart.
	cart add: 'book1' quantity: 1.
	self assert: (OrderedCollection withCatalog: 'book1') equals: (cart addedBooks).! !


!classDefinition: #Cart category: 'TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'content catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'accessing' stamp: 'jeo 6/4/2022 18:30:48'!
addedBooks
	^ content.! !

!Cart methodsFor: 'accessing' stamp: 'edrr 6/2/2022 20:55:25'!
isEmpty
	^content isEmpty.! !

!Cart methodsFor: 'accessing' stamp: 'jeo 6/4/2022 18:18:54'!
size
	^content size.! !


!Cart methodsFor: 'operations' stamp: 'jeo 6/4/2022 18:40:17'!
add: aBook quantity: aQuantity 
	self assertBookIsRegisteredInCatalog: aBook.
	self assertBookQuantityIsValid: aQuantity.
	content add: aBook withOccurrences: aQuantity.! !

!Cart methodsFor: 'operations' stamp: 'jeo 6/4/2022 18:36:47'!
addedQuantityOfBook: aBook
	^ content occurrencesOf: aBook.! !

!Cart methodsFor: 'operations' stamp: 'jeo 6/4/2022 18:33:59'!
containsBook: aBook
	^ content includes: aBook.! !


!Cart methodsFor: 'assertions' stamp: 'jeo 6/4/2022 18:58:31'!
assertBookIsRegisteredInCatalog: aBook

	^ (catalog includes: aBook) ifFalse: [self error: self class cannotAddBookNotRegisteredInCatalogErrorDescription]! !

!Cart methodsFor: 'assertions' stamp: 'jeo 6/4/2022 18:09:21'!
assertBookQuantityIsValid: aQuantity

	^ (aQuantity < 1) ifTrue: [self error: self class cannotAddBookWithInvalidQuantityToCartErrorDescription]! !


!Cart methodsFor: 'initialization' stamp: 'jeo 6/4/2022 18:58:03'!
initializeWithCatalog: aCatalog 
	content := OrderedCollection new.
	catalog := aCatalog.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: 'TusLibros'!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'jeo 6/4/2022 18:58:03'!
withCatalog: aCatalog
	^self new initializeWithCatalog: aCatalog ! !


!Cart class methodsFor: 'error description' stamp: 'jeo 6/4/2022 18:58:31'!
cannotAddBookNotRegisteredInCatalogErrorDescription
	^ 'cannot add a book that is not included in the catalog'.! !

!Cart class methodsFor: 'error description' stamp: 'jeo 6/4/2022 18:08:33'!
cannotAddBookWithInvalidQuantityToCartErrorDescription
	^ 'cannot add book with invalid quantity'! !
