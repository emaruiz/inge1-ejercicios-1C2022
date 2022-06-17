!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'setUp/tearDown' stamp: 'edrr 6/16/2022 20:35:04'!
setUp

	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction! !

!ImportTest methodsFor: 'setUp/tearDown' stamp: 'edrr 6/16/2022 20:35:50'!
tearDown

	session commit.
	session close! !


!ImportTest methodsFor: 'test' stamp: 'edrr 6/17/2022 19:39:49'!
test01Import

	self importCustomers. 
	
	self assertCustomersQuantityIs: 2.
	
	self assertPepeSanchezWasImportedCorrectly.
	
	self assertJuanPerezWasImportedCorrectly.
	! !


!ImportTest methodsFor: 'inputs' stamp: 'edrr 6/17/2022 20:15:21'!
inputFileForTesting
	^ReadStream on: 'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires
C,Juan,Perez,C,23-25666777-9
A,Alem,1122,CABA,1001,CABA'.! !

!ImportTest methodsFor: 'inputs' stamp: 'edrr 6/16/2022 21:24:42'!
standardtInputFile

	^ StandardFileStream new open: 'input.txt' forWrite: false! !


!ImportTest methodsFor: 'assertions' stamp: 'edrr 6/17/2022 18:59:37'!
assertAddressWithProvince: aProvince withStreetName: aStreetName withStreetNumber: aStreetNumber withTown: aTown withZipCode: aZipCode forCustomer: aCustomer      

	| address |
	address := aCustomer selectAddressWithStreetName: aStreetName.
	self assert: aProvince equals: address province.
	self assert: aStreetName equals: address streetName.
	self assert: aStreetNumber equals: address streetNumber.
	self assert: aTown equals: address town.
	self assert: aZipCode equals: address zipCode! !

!ImportTest methodsFor: 'assertions' stamp: 'edrr 6/17/2022 19:37:49'!
assertAddressesForJuanPerez: customer

	self assert: 1 equals: customer addresses size.
	self assertAddressWithProvince: 'CABA' withStreetName: 'Alem' withStreetNumber: 1122 withTown: 'CABA' withZipCode: 1001 forCustomer: customer! !

!ImportTest methodsFor: 'assertions' stamp: 'edrr 6/17/2022 19:36:19'!
assertAddressesForPepeSanchez: aCustomer

	self assert: 2 equals: aCustomer addresses size.
	self assertAddressWithProvince: 'BsAs' withStreetName: 'San Martin' withStreetNumber: 3322 withTown: 'Olivos' withZipCode: 1636 forCustomer: aCustomer.
	self assertAddressWithProvince: 'Buenos Aires' withStreetName: 'Maipu' withStreetNumber: 888 withTown: 'Florida' withZipCode: 1122 forCustomer: aCustomer! !

!ImportTest methodsFor: 'assertions' stamp: 'edrr 6/17/2022 20:02:33'!
assertCustomerForJuanPerez: aCustomer
	
	self assert: 'Juan' equals: aCustomer firstName.
	self assert: 'Perez' equals: aCustomer lastName.
	self assert: 'C' equals: aCustomer identificationType.
	self assert: '23-25666777-9' equals: aCustomer identificationNumber.! !

!ImportTest methodsFor: 'assertions' stamp: 'edrr 6/17/2022 20:02:43'!
assertCustomerForPepeSanchez: aCustomer
	
	self assert: 'Pepe' equals: aCustomer firstName.
	self assert: 'Sanchez' equals: aCustomer lastName.
	self assert: 'D' equals: aCustomer identificationType.
	self assert: '22333444' equals: aCustomer identificationNumber.! !

!ImportTest methodsFor: 'assertions' stamp: 'edrr 6/17/2022 19:30:18'!
assertCustomersQuantityIs: aQuantity

	^ self assert: aQuantity equals: (session selectAllOfType: Customer) size! !

!ImportTest methodsFor: 'assertions' stamp: 'edrr 6/17/2022 20:02:33'!
assertJuanPerezWasImportedCorrectly

	| customer |
	customer := session selectCustomerWithIdentificationNumber: '23-25666777-9'.
	self assertCustomerForJuanPerez: customer.
	
	self assertAddressesForJuanPerez: customer.! !

!ImportTest methodsFor: 'assertions' stamp: 'edrr 6/17/2022 20:02:43'!
assertPepeSanchezWasImportedCorrectly

	| customer |
	customer := session selectCustomerWithIdentificationNumber: '22333444'.
	self assertCustomerForPepeSanchez: customer.
	
	self assertAddressesForPepeSanchez: customer.! !


!ImportTest methodsFor: 'import' stamp: 'edrr 6/17/2022 20:15:21'!
importCustomers

	^ (ImportCustomers forSession: session withStream: self inputFileForTesting) value! !


!classDefinition: #Address category: 'CustomerImporter'!
Object subclass: #Address
	instanceVariableNames: 'id streetName streetNumber town zipCode province'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province

	^province! !

!Address methodsFor: 'province' stamp: 'HAW 5/22/2022 00:19:29'!
province: aProvince

	province := aProvince
	! !


!Address methodsFor: 'street' stamp: 'edrr 6/16/2022 21:40:20'!
hasStreetName: aStreetName 
	^streetName = aStreetName.! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName

	^streetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetName: aStreetName

	streetName := aStreetName ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber

	^streetNumber ! !

!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 00:19:29'!
streetNumber: aStreetNumber

	streetNumber := aStreetNumber ! !


!Address methodsFor: 'town' stamp: 'HAW 5/22/2022 00:19:29'!
town

	^town! !

!Address methodsFor: 'town' stamp: 'HAW 5/22/2022 00:19:29'!
town: aTown

	town := aTown! !


!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode

	^zipCode! !

!Address methodsFor: 'zip code' stamp: 'HAW 5/22/2022 00:19:29'!
zipCode: aZipCode

	zipCode := aZipCode! !


!classDefinition: #Customer category: 'CustomerImporter'!
Object subclass: #Customer
	instanceVariableNames: 'id firstName lastName identificationType identificationNumber addresses'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addAddress: anAddress

	addresses add: anAddress ! !

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 00:19:29'!
addresses

	^ addresses! !


!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName

	^firstName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
firstName: aName

	firstName := aName! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName

	^lastName ! !

!Customer methodsFor: 'name' stamp: 'HAW 5/22/2022 00:19:29'!
lastName: aLastName

	lastName := aLastName
! !


!Customer methodsFor: 'identification' stamp: 'edrr 6/16/2022 21:38:39'!
hasIdentificationNumber: anIdentificationNumber 
	^identificationNumber = anIdentificationNumber.! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber

	^identificationNumber ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationNumber: anIdentificationNumber

	identificationNumber := anIdentificationNumber! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType

	^identificationType ! !

!Customer methodsFor: 'identification' stamp: 'HAW 5/22/2022 00:19:29'!
identificationType: anIdentificationType

	identificationType := anIdentificationType! !


!Customer methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initialize

	super initialize.
	addresses := OrderedCollection new.! !


!Customer methodsFor: 'select' stamp: 'edrr 6/17/2022 17:45:46'!
selectAddressWithStreetName: aStreetName
	^(addresses select: [:anAddress | anAddress hasStreetName: aStreetName]) anyOne.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Customer class' category: 'CustomerImporter'!
Customer class
	instanceVariableNames: ''!

!Customer class methodsFor: 'importing' stamp: 'HAW 5/22/2022 00:25:18'!
importCustomers

	"
	self importCustomers
	"
	| inputStream session newCustomer line |

	inputStream := StandardFileStream new open: 'input.txt' forWrite: false.
	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction.

	line := inputStream nextLine.
	[ line notNil ] whileTrue: [
		(line beginsWith: 'C') ifTrue: [ | customerData |
			customerData := line findTokens: $,.
			newCustomer := Customer new.
			newCustomer firstName: customerData second.
			newCustomer lastName: customerData third.
			newCustomer identificationType: customerData fourth.
			newCustomer identificationNumber: customerData fourth.
			session persist: newCustomer ].

		(line beginsWith: 'A') ifTrue: [ | addressData newAddress |
			addressData := line findTokens: $,.
			newAddress := Address new.
			newCustomer addAddress: newAddress.
			newAddress streetName: addressData second.
			newAddress streetNumber: addressData third asNumber .
			newAddress town: addressData fourth.
			newAddress zipCode: addressData fifth asNumber .
			newAddress province: addressData fourth ].

		line := inputStream nextLine. ].

	session commit.
	session close.

	inputStream close.
	! !


!classDefinition: #DataBaseSession category: 'CustomerImporter'!
Object subclass: #DataBaseSession
	instanceVariableNames: 'configuration tables id'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 00:19:29'!
beginTransaction

	! !

!DataBaseSession methodsFor: 'transaction management' stamp: 'HAW 5/22/2022 19:17:36'!
commit

	(tables at: Customer ifAbsent: [#()]) do: [ :aCustomer | self persistAddressesOf: aCustomer ]
	! !


!DataBaseSession methodsFor: 'closing' stamp: 'HAW 5/22/2022 00:19:29'!
close

	! !


!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
defineIdOf: anObject

	anObject instVarNamed: 'id' put: (self newIdFor: anObject).! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
delay

	(Delay forMilliseconds: 100) wait! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 19:29:06'!
objectsOfType: aType

	^ tables at: aType ifAbsent: [ #() ]! !

!DataBaseSession methodsFor: 'persistence - private' stamp: 'HAW 5/22/2022 00:19:29'!
persistAddressesOf: anObjectWithAddresses

	anObjectWithAddresses addresses do: [ :anAddress | self persist: anAddress ]
	! !


!DataBaseSession methodsFor: 'initialization' stamp: 'HAW 5/22/2022 00:19:29'!
initializeFor: aConfiguration

	configuration := aConfiguration.
	tables := Dictionary new.
	id := 0.! !


!DataBaseSession methodsFor: 'id' stamp: 'HAW 5/22/2022 00:19:29'!
newIdFor: anObject

	id := id + 1.
	^id! !


!DataBaseSession methodsFor: 'persistance' stamp: 'HAW 5/22/2022 00:19:29'!
persist: anObject

	| table |

	self delay.
	table := tables at: anObject class ifAbsentPut: [ Set new ].

	self defineIdOf: anObject.
	table add: anObject.

	(anObject isKindOf: Customer) ifTrue: [ self persistAddressesOf: anObject ].! !


!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
select: aCondition ofType: aType

	self delay.
	^(self objectsOfType: aType) select: aCondition ! !

!DataBaseSession methodsFor: 'selecting' stamp: 'HAW 5/22/2022 19:29:06'!
selectAllOfType: aType

	self delay.
	^(self objectsOfType: aType) copy ! !

!DataBaseSession methodsFor: 'selecting' stamp: 'edrr 6/17/2022 17:59:14'!
selectCustomerWithIdentificationNumber: anIdentificationNumber
	^(self select: [:customer | customer hasIdentificationNumber: anIdentificationNumber] ofType: Customer) anyOne.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataBaseSession class' category: 'CustomerImporter'!
DataBaseSession class
	instanceVariableNames: ''!

!DataBaseSession class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 00:19:29'!
for: aConfiguration

	^self new initializeFor: aConfiguration! !


!classDefinition: #ImportCustomers category: 'CustomerImporter'!
Object subclass: #ImportCustomers
	instanceVariableNames: 'session stream'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportCustomers methodsFor: 'initialization' stamp: 'edrr 6/16/2022 21:34:10'!
initializeForSession: aSession withStream: aStream
	session := aSession.
	stream := aStream.! !


!ImportCustomers methodsFor: 'evaluating' stamp: 'edrr 6/17/2022 20:14:00'!
value

	| newCustomer line |

	line := stream nextLine.
	[ line notNil ] whileTrue: [
		(line beginsWith: 'C') ifTrue: [ | customerData |
			customerData := line findTokens: $,.
			newCustomer := Customer new.
			newCustomer firstName: customerData second.
			newCustomer lastName: customerData third.
			newCustomer identificationType: customerData fourth.
			newCustomer identificationNumber: customerData fifth.
			session persist: newCustomer ].

		(line beginsWith: 'A') ifTrue: [ | addressData newAddress |
			addressData := line findTokens: $,.
			newAddress := Address new.
			newCustomer addAddress: newAddress.
			newAddress streetName: addressData second.
			newAddress streetNumber: addressData third asNumber .
			newAddress town: addressData fourth.
			newAddress zipCode: addressData fifth asNumber .
			newAddress province: addressData sixth ].

		line := stream nextLine. ].

	stream close.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ImportCustomers class' category: 'CustomerImporter'!
ImportCustomers class
	instanceVariableNames: ''!

!ImportCustomers class methodsFor: 'instance creation' stamp: 'edrr 6/16/2022 21:34:10'!
forSession: aSession withStream: aStream
	^self new initializeForSession: aSession withStream: aStream! !
