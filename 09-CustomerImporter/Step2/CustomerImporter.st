!classDefinition: #ImportTest category: 'CustomerImporter'!
TestCase subclass: #ImportTest
	instanceVariableNames: 'session'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:06:45'!
test01Import

	CustomerImporter valueFrom: self validImportData into: session.

	self assertImportedRightNumberOfCustomers.
	self assertPepeSanchezWasImportedCorrecty.
	self assertJuanPerezWasImportedCorrectly ! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:16:39'!
test02InvalidCustomerType
		
	self assertCustomerImporterWithData: self invalidCustomerImportData 
		messageError: CustomerImporter invalidRecordTypeErrorDescription 
		then: [self assert: (session selectAllOfType: Customer) isEmpty].! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:17:34'!
test03InvalidAddressType

	self assertCustomerImporterWithData: self invalidAddressImportData
		messageError: CustomerImporter invalidRecordTypeErrorDescription
		then: [self assert: (session selectAllOfType: Address) isEmpty]! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:18:34'!
test04EmptyRecord
	
	self assertCustomerImporterWithData: self emptyLineImportData
		messageError: CustomerImporter emptyRecordErrorDescription
		then: [self assert: (session selectAllOfType: Customer) isEmpty]! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:19:26'!
test05IncompleteCustomer
	
	self assertCustomerImporterWithData: self incompleteCustomerImportData
		messageError: CustomerImporter invalidCustomerRegisterErrorDescription
		then: [self assert: (session selectAllOfType: Customer) isEmpty]! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:22:45'!
test06IncompleteAddress
	
	self assertCustomerImporterWithData: self incompleteAddressImportData
		messageError: CustomerImporter invalidAddressRegisterErrorDescription
		then: [self assert: (session selectAllOfType: Address) isEmpty].! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:23:29'!
test07TooManyCustomerFields
	
	self assertCustomerImporterWithData: self exceedCustomerImportData
		messageError: CustomerImporter invalidCustomerRegisterErrorDescription
		then: [self assert: (session selectAllOfType: Customer) isEmpty].! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:24:17'!
test08TooManyAddressFields
	
	self assertCustomerImporterWithData: self exceedAddressImportData
		messageError: CustomerImporter invalidAddressRegisterErrorDescription
		then: [self assert: (session selectAllOfType: Address) isEmpty].! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:25:11'!
test09CustomerWithEmptyFields
	
	self assertCustomerImporterWithData: self customerEmptyFieldsImportData
		messageError: CustomerImporter emptyFieldsErrorDescription
		then: [self assert: (session selectAllOfType: Customer) isEmpty].! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:25:54'!
test10AddressWithEmptyFields
	
	self assertCustomerImporterWithData: self addressEmptyFieldsImportData
		messageError: CustomerImporter emptyFieldsErrorDescription
		then: [self assert: (session selectAllOfType: Address) isEmpty]. ! !

!ImportTest methodsFor: 'tests' stamp: 'edrr 6/25/2022 20:26:36'!
test11AddressWithoutCustomer
	
	self assertCustomerImporterWithData: self onlyAddressImportData
		messageError: CustomerImporter addressWithoutCustomerErrorDescription
		then: [self assert: (session selectAllOfType: Customer) isEmpty].! !


!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:22:05'!
assertAddressOf: importedCustomer at: aStreetName hasNumber: aNumber town: aTown zipCode: aZipCode province: aProvince

	| importedAddress |

	importedAddress := importedCustomer addressAt: aStreetName ifNone: [ self fail ].
	self assert: aStreetName equals: importedAddress streetName.
	self assert: aNumber equals: importedAddress streetNumber.
	self assert: aTown equals: importedAddress town.
	self assert: aZipCode equals: importedAddress zipCode.
	self assert: aProvince equals: importedAddress province.

	! !

!ImportTest methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:15:18'!
assertCustomerImporterWithData: data messageError: aMessageError then: aBlock

	^ self should: [CustomerImporter valueFrom: data into: session.] 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [:anError | self assert: anError messageText = aMessageError.
			aBlock value]! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:27:57'!
assertCustomerWithIdentificationType: anIdType number: anIdNumber hasFirstName: aFirstName lastName: aLastName

	| importedCustomer |

	importedCustomer := self customerWithIdentificationType: anIdType number: anIdNumber.

	self assert: aFirstName equals: importedCustomer firstName.
	self assert: aLastName equals: importedCustomer lastName.
	self assert: anIdType equals: importedCustomer identificationType.
	self assert: anIdNumber equals: importedCustomer identificationNumber.

	^importedCustomer

	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:12:18'!
assertImportedRightNumberOfCustomers

	^ self assert: 2 equals: (session selectAllOfType: Customer) size! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:45'!
assertJuanPerezWasImportedCorrectly

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'C' number: '23-25666777-9' hasFirstName: 'Juan' lastName: 'Perez'.
	self assertAddressOf: importedCustomer at: 'Alem' hasNumber: 1122 town: 'CABA' zipCode: 1001 province: 'CABA'
	! !

!ImportTest methodsFor: 'assertions' stamp: 'HAW 5/22/2022 18:28:05'!
assertPepeSanchezWasImportedCorrecty

	| importedCustomer |

	importedCustomer := self assertCustomerWithIdentificationType: 'D' number: '22333444' hasFirstName: 'Pepe' lastName: 'Sanchez'.
	self assertAddressOf: importedCustomer at: 'San Martin' hasNumber: 3322 town: 'Olivos' zipCode: 1636 province: 'BsAs'.
	self assertAddressOf: importedCustomer at: 'Maipu' hasNumber: 888 town: 'Florida' zipCode: 1122 province: 'Buenos Aires'.


	! !


!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:27:50'!
setUp

	session := DataBaseSession for: (Array with: Address with: Customer).
	session beginTransaction.
! !

!ImportTest methodsFor: 'setUp/tearDown' stamp: 'HAW 5/22/2022 00:28:23'!
tearDown

	session commit.
	session close.
	! !


!ImportTest methodsFor: 'customer' stamp: 'HAW 5/22/2022 18:14:22'!
customerWithIdentificationType: anIdType number: anIdNumber

	^ (session
		select: [ :aCustomer | aCustomer identificationType = anIdType and: [ aCustomer identificationNumber = anIdNumber ]]
		ofType: Customer) anyOne! !


!ImportTest methodsFor: 'test data' stamp: 'edrr 6/25/2022 20:03:53'!
addressEmptyFieldsImportData

	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,,,San Martin,3322,Olivos,1636,BsAs'! !

!ImportTest methodsFor: 'test data' stamp: 'edrr 6/25/2022 20:02:30'!
customerEmptyFieldsImportData

	^ ReadStream on:
'C,,,Pepe,Sanchez,D,22333444'! !

!ImportTest methodsFor: 'test data' stamp: 'edrr 6/23/2022 20:08:22'!
emptyLineImportData

	^ ReadStream on:
'
'! !

!ImportTest methodsFor: 'test data' stamp: 'edrr 6/23/2022 20:48:21'!
exceedAddressImportData
	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs,yyy'! !

!ImportTest methodsFor: 'test data' stamp: 'edrr 6/23/2022 20:39:00'!
exceedCustomerImportData

	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444,zzz'! !

!ImportTest methodsFor: 'test data' stamp: 'edrr 6/23/2022 20:29:39'!
incompleteAddressImportData

	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636'! !

!ImportTest methodsFor: 'test data' stamp: 'edrr 6/23/2022 20:27:57'!
incompleteCustomerImportData
	^ ReadStream on: 'C,Pepe,Sanchez,D'! !

!ImportTest methodsFor: 'test data' stamp: 'edrr 6/23/2022 19:54:33'!
invalidAddressImportData

	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
Aa,San Martin,3322,Olivos,1636,BsAs'! !

!ImportTest methodsFor: 'test data' stamp: 'edrr 6/23/2022 19:54:48'!
invalidCustomerImportData

	^ ReadStream on: 'Cc,Pepe,Sanchez,D,22333444'! !

!ImportTest methodsFor: 'test data' stamp: 'edrr 6/23/2022 20:56:59'!
onlyAddressImportData

	^ ReadStream on:
'A,San Martin,3322,Olivos,1636,BsAs'! !

!ImportTest methodsFor: 'test data' stamp: 'HAW 5/22/2022 18:08:08'!
validImportData

	^ ReadStream on:
'C,Pepe,Sanchez,D,22333444
A,San Martin,3322,Olivos,1636,BsAs
A,Maipu,888,Florida,1122,Buenos Aires
C,Juan,Perez,C,23-25666777-9
A,Alem,1122,CABA,1001,CABA'! !


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


!Address methodsFor: 'street' stamp: 'HAW 5/22/2022 17:55:46'!
isAt: aStreetName

	^streetName = aStreetName ! !

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


!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
town

	^town! !

!Address methodsFor: 'twon' stamp: 'HAW 5/22/2022 00:19:29'!
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

!Customer methodsFor: 'addresses' stamp: 'HAW 5/22/2022 17:55:17'!
addressAt: aStreetName ifNone: aNoneBlock

	^addresses detect: [ :address | address isAt: aStreetName ] ifNone: aNoneBlock ! !

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


!classDefinition: #CustomerImporter category: 'CustomerImporter'!
Object subclass: #CustomerImporter
	instanceVariableNames: 'session readStream record line newCustomer newAddress'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CustomerImporter'!

!CustomerImporter methodsFor: 'initialization' stamp: 'HAW 5/22/2022 18:06:47'!
initializeFrom: aReadStream into: aSession
	session := aSession.
	readStream := aReadStream.! !


!CustomerImporter methodsFor: 'evaluating' stamp: 'jeo 6/25/2022 19:20:30'!
value

	[ self hasRecordToImport ] whileTrue: [ 
		self createRecord.
		self importRecord.].

	! !


!CustomerImporter methodsFor: 'evaluating-private' stamp: 'edrr 6/25/2022 20:42:38'!
createRecord

	record := line findTokens: $,.
	
	self assertRecordNotEmpty.
	self assertCustomerRecordIsValid.
	self assertAddressRecordIsValid.! !

!CustomerImporter methodsFor: 'evaluating-private' stamp: 'edrr 6/23/2022 19:38:25'!
hasRecordToImport

	line := readStream nextLine. 
	^line notNil! !

!CustomerImporter methodsFor: 'evaluating-private' stamp: 'edrr 6/23/2022 19:37:30'!
importAddress

	newAddress := Address new.
			newCustomer addAddress: newAddress.
			newAddress streetName: record second.
			newAddress streetNumber: record third asNumber .
			newAddress town: record fourth.
			newAddress zipCode: record fifth asNumber .
			newAddress province: record sixth! !

!CustomerImporter methodsFor: 'evaluating-private' stamp: 'edrr 6/23/2022 19:36:10'!
importCustomer

	newCustomer := Customer new.
			newCustomer firstName: record second.
			newCustomer lastName: record third.
			newCustomer identificationType: record fourth.
			newCustomer identificationNumber: record fifth.
			session persist: newCustomer! !

!CustomerImporter methodsFor: 'evaluating-private' stamp: 'edrr 6/25/2022 20:39:21'!
importRecord
	
	self isCustomer ifTrue: [^self importCustomer].
	
	self isAddress ifTrue: [
		self assertAddressHasCustomer.
		^self importAddress].
	
	self raiseInvalidTypeError.! !

!CustomerImporter methodsFor: 'evaluating-private' stamp: 'edrr 6/25/2022 20:37:06'!
isAddress

	^record first = 'A'.! !

!CustomerImporter methodsFor: 'evaluating-private' stamp: 'edrr 6/25/2022 20:37:41'!
isCustomer

	^record first = 'C'.! !

!CustomerImporter methodsFor: 'evaluating-private' stamp: 'edrr 6/25/2022 20:39:21'!
raiseInvalidTypeError

	^ self error: self class invalidRecordTypeErrorDescription! !


!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:38:36'!
assertAddressHasCustomer

	^ newCustomer isNil ifTrue: [self error: self class addressWithoutCustomerErrorDescription]! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:50:38'!
assertAddressRecordFormat

	^ (self isAddress and: (	self hasValidAddressRecordFormat not)) ifTrue: [self error: self class emptyFieldsErrorDescription]! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:47:50'!
assertAddressRecordIsValid

	self assertAddressRecordSize.
	self assertAddressRecordFormat! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:50:22'!
assertAddressRecordSize

	^ (self isAddress and: (self hasValidAddressRecordSize not)) ifTrue: [self error: self class invalidAddressRegisterErrorDescription]! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:51:41'!
assertCustomerRecordFormat

	^ (self isCustomer and: (	self hasValidCustomerRecordFormat not)) ifTrue: [self error: self class emptyFieldsErrorDescription]! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:51:41'!
assertCustomerRecordIsValid

	self assertCustomerRecordSize.
	self assertCustomerRecordFormat! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:51:19'!
assertCustomerRecordSize

	^ (self isCustomer and: (self hasValidCustomerRecordSize not)) ifTrue: [self error: self class invalidCustomerRegisterErrorDescription]! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:40:59'!
assertRecordNotEmpty

	^ record isEmpty ifTrue: [self error: self class emptyRecordErrorDescription]! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:50:38'!
hasValidAddressRecordFormat

	^ (line asBag occurrencesOf: $,) = 5! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:50:22'!
hasValidAddressRecordSize

	^ record size = 6! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:49:57'!
hasValidCustomerRecordFormat

	^ (line asBag occurrencesOf: $,) = 4! !

!CustomerImporter methodsFor: 'assertions' stamp: 'edrr 6/25/2022 20:49:18'!
hasValidCustomerRecordSize

	^ record size = 5! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerImporter class' category: 'CustomerImporter'!
CustomerImporter class
	instanceVariableNames: ''!

!CustomerImporter class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 18:06:47'!
from: aReadStream into: aSession
	^self new initializeFrom: aReadStream into: aSession! !


!CustomerImporter class methodsFor: 'importing' stamp: 'HAW 5/22/2022 18:11:27'!
valueFrom: aReadStream into: aSession

	^(self from: aReadStream into: aSession) value! !


!CustomerImporter class methodsFor: 'error descriptions' stamp: 'edrr 6/23/2022 21:02:34'!
addressWithoutCustomerErrorDescription
	^'address without customer'! !

!CustomerImporter class methodsFor: 'error descriptions' stamp: 'jeo 6/25/2022 19:19:09'!
emptyFieldsErrorDescription
	^'empty fields'! !

!CustomerImporter class methodsFor: 'error descriptions' stamp: 'edrr 6/23/2022 20:17:59'!
emptyRecordErrorDescription
	^'empty record'! !

!CustomerImporter class methodsFor: 'error descriptions' stamp: 'edrr 6/23/2022 20:49:58'!
invalidAddressRegisterErrorDescription
	^'invalid address register'! !

!CustomerImporter class methodsFor: 'error descriptions' stamp: 'edrr 6/23/2022 20:45:11'!
invalidCustomerRegisterErrorDescription
	^'invalid customer register'! !

!CustomerImporter class methodsFor: 'error descriptions' stamp: 'edrr 6/23/2022 19:49:34'!
invalidRecordTypeErrorDescription
	'invalid record type'! !


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

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataBaseSession class' category: 'CustomerImporter'!
DataBaseSession class
	instanceVariableNames: ''!

!DataBaseSession class methodsFor: 'instance creation' stamp: 'HAW 5/22/2022 00:19:29'!
for: aConfiguration

	^self new initializeFor: aConfiguration! !
