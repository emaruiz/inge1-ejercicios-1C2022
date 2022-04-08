!classDefinition: #I category: 'NumerosNaturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'NumerosNaturales'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'next & prev' stamp: 'JEO 4/2/2022 19:13:39'!
next
	^II! !

!I class methodsFor: 'next & prev' stamp: 'JEO 4/2/2022 20:22:58'!
previous
	^nil! !


!I class methodsFor: 'arithmetic operations' stamp: 'JEO 4/2/2022 18:34:27'!
* unNumeroNatural
	^ unNumeroNatural.! !

!I class methodsFor: 'arithmetic operations' stamp: 'JEO 4/1/2022 18:51:37'!
+ unNumeroNatural
	^unNumeroNatural next.! !

!I class methodsFor: 'arithmetic operations' stamp: 'JEO 4/2/2022 20:22:45'!
- unNumeroNatural 
	^nil! !

!I class methodsFor: 'arithmetic operations' stamp: 'JEO 4/2/2022 18:33:09'!
/ unNumeroNatural
	unNumeroNatural = I ifTrue: [^unNumeroNatural].! !


!I class methodsFor: 'auxiliary operations' stamp: 'edrr 4/3/2022 13:51:41'!
isSubtractedFrom: unNumeroMayorOIgualADos
	^unNumeroMayorOIgualADos previous.! !


!I class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.! !


!classDefinition: #II category: 'NumerosNaturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'NumerosNaturales'!
II class
	instanceVariableNames: 'next prev'!

!II class methodsFor: 'next & prev' stamp: 'edrr 4/8/2022 19:17:47'!
nameOfNext

	(self name endsWith: 'CMXCIX') ifTrue: [^(self name withoutSuffix: 'CMXCIX'), 'M'].
	(self name endsWith: 'DCCCXCIX') ifTrue: [^(self name withoutSuffix: 'DCCCXCIX'), 'CM'].
	(self name endsWith: 'CDXCIX') ifTrue: [^(self name withoutSuffix: 'CDXCIX'), 'D'].
	(self name endsWith: 'CCCXCIX') ifTrue: [^(self name withoutSuffix: 'CCCXCIX'), 'CD'].
	(self name endsWith: 'XCIX') ifTrue: [^(self name withoutSuffix: 'XCIX'), 'C'].
	(self name endsWith: 'LXXXIX') ifTrue: [^(self name withoutSuffix: 'LXXXIX'), 'XC'].
	(self name endsWith: 'XLIX') ifTrue: [^(self name withoutSuffix: 'XLIX'), 'L'].
	(self name endsWith: 'XXXIX') ifTrue: [^(self name withoutSuffix: 'XXXIX'), 'XL'].
	(self name endsWith: 'VIII') ifTrue: [^(self name withoutSuffix: 'VIII'), 'IX'].
	(self name endsWith: 'IV') ifTrue: [^(self name withoutSuffix: 'IV'), 'V'].
	(self name endsWith: 'IX') ifTrue: [^(self name withoutSuffix: 'IX'), 'X'].
	(self name endsWith: 'III') ifTrue: [^(self name withoutSuffix: 'III'), 'IV'].
	^self name, 'I'.! !

!II class methodsFor: 'next & prev' stamp: 'edrr 4/4/2022 21:02:14'!
next
	next ifNotNil: [^next].
	next := II createChildNamed: (self nameOfNext).
	next previous: self.
	^next.
	! !

!II class methodsFor: 'next & prev' stamp: 'JEO 4/1/2022 18:44:57'!
previous
	^prev! !

!II class methodsFor: 'next & prev' stamp: 'JEO 4/1/2022 18:44:16'!
previous: unNumeroNatural
	prev := unNumeroNatural.! !


!II class methodsFor: 'arithmetic operations' stamp: 'JEO 4/2/2022 18:04:49'!
* unNumeroNatural
	unNumeroNatural = I ifTrue: [^self].
	^ self + (self * unNumeroNatural previous).! !

!II class methodsFor: 'arithmetic operations' stamp: 'JEO 4/1/2022 18:50:39'!
+ unNumeroNatural
	^ prev + unNumeroNatural next.! !

!II class methodsFor: 'arithmetic operations' stamp: 'edrr 4/3/2022 14:39:22'!
- unNumeroNatural
	^unNumeroNatural isSubtractedFrom: self.! !

!II class methodsFor: 'arithmetic operations' stamp: 'JEO 4/2/2022 20:30:12'!
/ unNumeroNatural
	unNumeroNatural = I ifTrue: [^self].
	self = unNumeroNatural ifTrue: [^I].
	(self ~= (unNumeroNatural * II)) & (self - (unNumeroNatural * II)) = nil ifTrue: [^I].
	^I + ((self - unNumeroNatural) / unNumeroNatural).
	! !


!II class methodsFor: 'auxiliary operations' stamp: 'edrr 4/3/2022 13:52:04'!
isSubtractedFrom: unNumeroMayorOIgualADos
	^unNumeroMayorOIgualADos previous - prev.! !


!II class methodsFor: 'as yet unclassified' stamp: 'edrr 4/4/2022 21:24:39'!
removeAllNext

	next ifNotNil: 
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil.
	].! !


!II class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := III.
	prev := I.! !


!classDefinition: #C category: 'NumerosNaturales'!
II subclass: #C
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'C class' category: 'NumerosNaturales'!
C class
	instanceVariableNames: ''!

!C class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CI.
	prev := XCIX.! !


!classDefinition: #CC category: 'NumerosNaturales'!
II subclass: #CC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CC class' category: 'NumerosNaturales'!
CC class
	instanceVariableNames: ''!

!CC class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCI.
	prev := CXCIX.! !


!classDefinition: #CCC category: 'NumerosNaturales'!
II subclass: #CCC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCC class' category: 'NumerosNaturales'!
CCC class
	instanceVariableNames: ''!

!CCC class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCI.
	prev := CCXCIX.! !


!classDefinition: #CCCI category: 'NumerosNaturales'!
II subclass: #CCCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCI class' category: 'NumerosNaturales'!
CCCI class
	instanceVariableNames: ''!

!CCCI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCII.
	prev := CCC.! !


!classDefinition: #CCCII category: 'NumerosNaturales'!
II subclass: #CCCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCII class' category: 'NumerosNaturales'!
CCCII class
	instanceVariableNames: ''!

!CCCII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCIII.
	prev := CCCI.! !


!classDefinition: #CCCIII category: 'NumerosNaturales'!
II subclass: #CCCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIII class' category: 'NumerosNaturales'!
CCCIII class
	instanceVariableNames: ''!

!CCCIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCIV.
	prev := CCCII.! !


!classDefinition: #CCCIV category: 'NumerosNaturales'!
II subclass: #CCCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIV class' category: 'NumerosNaturales'!
CCCIV class
	instanceVariableNames: ''!

!CCCIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCV.
	prev := CCCIII.! !


!classDefinition: #CCCIX category: 'NumerosNaturales'!
II subclass: #CCCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCIX class' category: 'NumerosNaturales'!
CCCIX class
	instanceVariableNames: ''!

!CCCIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCX.
	prev := CCCVIII.! !


!classDefinition: #CCCL category: 'NumerosNaturales'!
II subclass: #CCCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCL class' category: 'NumerosNaturales'!
CCCL class
	instanceVariableNames: ''!

!CCCL class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLI.
	prev := CCCXLIX.! !


!classDefinition: #CCCLI category: 'NumerosNaturales'!
II subclass: #CCCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLI class' category: 'NumerosNaturales'!
CCCLI class
	instanceVariableNames: ''!

!CCCLI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:26'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLII.
	prev := CCCL.! !


!classDefinition: #CCCLII category: 'NumerosNaturales'!
II subclass: #CCCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLII class' category: 'NumerosNaturales'!
CCCLII class
	instanceVariableNames: ''!

!CCCLII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLIII.
	prev := CCCLI.! !


!classDefinition: #CCCLIII category: 'NumerosNaturales'!
II subclass: #CCCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIII class' category: 'NumerosNaturales'!
CCCLIII class
	instanceVariableNames: ''!

!CCCLIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLIV.
	prev := CCCLII.! !


!classDefinition: #CCCLIV category: 'NumerosNaturales'!
II subclass: #CCCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIV class' category: 'NumerosNaturales'!
CCCLIV class
	instanceVariableNames: ''!

!CCCLIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLV.
	prev := CCCLIII.! !


!classDefinition: #CCCLIX category: 'NumerosNaturales'!
II subclass: #CCCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLIX class' category: 'NumerosNaturales'!
CCCLIX class
	instanceVariableNames: ''!

!CCCLIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLX.
	prev := CCCLVIII.! !


!classDefinition: #CCCLV category: 'NumerosNaturales'!
II subclass: #CCCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLV class' category: 'NumerosNaturales'!
CCCLV class
	instanceVariableNames: ''!

!CCCLV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLVI.
	prev := CCCLIV.! !


!classDefinition: #CCCLVI category: 'NumerosNaturales'!
II subclass: #CCCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVI class' category: 'NumerosNaturales'!
CCCLVI class
	instanceVariableNames: ''!

!CCCLVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLVII.
	prev := CCCLV.! !


!classDefinition: #CCCLVII category: 'NumerosNaturales'!
II subclass: #CCCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVII class' category: 'NumerosNaturales'!
CCCLVII class
	instanceVariableNames: ''!

!CCCLVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLVIII.
	prev := CCCLVI.! !


!classDefinition: #CCCLVIII category: 'NumerosNaturales'!
II subclass: #CCCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLVIII class' category: 'NumerosNaturales'!
CCCLVIII class
	instanceVariableNames: ''!

!CCCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLIX.
	prev := CCCLVII.! !


!classDefinition: #CCCLX category: 'NumerosNaturales'!
II subclass: #CCCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLX class' category: 'NumerosNaturales'!
CCCLX class
	instanceVariableNames: ''!

!CCCLX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXI.
	prev := CCCLIX.! !


!classDefinition: #CCCLXI category: 'NumerosNaturales'!
II subclass: #CCCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXI class' category: 'NumerosNaturales'!
CCCLXI class
	instanceVariableNames: ''!

!CCCLXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXII.
	prev := CCCLX.! !


!classDefinition: #CCCLXII category: 'NumerosNaturales'!
II subclass: #CCCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXII class' category: 'NumerosNaturales'!
CCCLXII class
	instanceVariableNames: ''!

!CCCLXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXIII.
	prev := CCCLXI.! !


!classDefinition: #CCCLXIII category: 'NumerosNaturales'!
II subclass: #CCCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIII class' category: 'NumerosNaturales'!
CCCLXIII class
	instanceVariableNames: ''!

!CCCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXIV.
	prev := CCCLXII.! !


!classDefinition: #CCCLXIV category: 'NumerosNaturales'!
II subclass: #CCCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIV class' category: 'NumerosNaturales'!
CCCLXIV class
	instanceVariableNames: ''!

!CCCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXV.
	prev := CCCLXIII.! !


!classDefinition: #CCCLXIX category: 'NumerosNaturales'!
II subclass: #CCCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXIX class' category: 'NumerosNaturales'!
CCCLXIX class
	instanceVariableNames: ''!

!CCCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXX.
	prev := CCCLXVIII.! !


!classDefinition: #CCCLXV category: 'NumerosNaturales'!
II subclass: #CCCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXV class' category: 'NumerosNaturales'!
CCCLXV class
	instanceVariableNames: ''!

!CCCLXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXVI.
	prev := CCCLXIV.! !


!classDefinition: #CCCLXVI category: 'NumerosNaturales'!
II subclass: #CCCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVI class' category: 'NumerosNaturales'!
CCCLXVI class
	instanceVariableNames: ''!

!CCCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXVII.
	prev := CCCLXV.! !


!classDefinition: #CCCLXVII category: 'NumerosNaturales'!
II subclass: #CCCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVII class' category: 'NumerosNaturales'!
CCCLXVII class
	instanceVariableNames: ''!

!CCCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXVIII.
	prev := CCCLXVI.! !


!classDefinition: #CCCLXVIII category: 'NumerosNaturales'!
II subclass: #CCCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXVIII class' category: 'NumerosNaturales'!
CCCLXVIII class
	instanceVariableNames: ''!

!CCCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXIX.
	prev := CCCLXVII.! !


!classDefinition: #CCCLXX category: 'NumerosNaturales'!
II subclass: #CCCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXX class' category: 'NumerosNaturales'!
CCCLXX class
	instanceVariableNames: ''!

!CCCLXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXI.
	prev := CCCLXIX.! !


!classDefinition: #CCCLXXI category: 'NumerosNaturales'!
II subclass: #CCCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXI class' category: 'NumerosNaturales'!
CCCLXXI class
	instanceVariableNames: ''!

!CCCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXII.
	prev := CCCLXX.! !


!classDefinition: #CCCLXXII category: 'NumerosNaturales'!
II subclass: #CCCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXII class' category: 'NumerosNaturales'!
CCCLXXII class
	instanceVariableNames: ''!

!CCCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXIII.
	prev := CCCLXXI.! !


!classDefinition: #CCCLXXIII category: 'NumerosNaturales'!
II subclass: #CCCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIII class' category: 'NumerosNaturales'!
CCCLXXIII class
	instanceVariableNames: ''!

!CCCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXIV.
	prev := CCCLXXII.! !


!classDefinition: #CCCLXXIV category: 'NumerosNaturales'!
II subclass: #CCCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIV class' category: 'NumerosNaturales'!
CCCLXXIV class
	instanceVariableNames: ''!

!CCCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXV.
	prev := CCCLXXIII.! !


!classDefinition: #CCCLXXIX category: 'NumerosNaturales'!
II subclass: #CCCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXIX class' category: 'NumerosNaturales'!
CCCLXXIX class
	instanceVariableNames: ''!

!CCCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXX.
	prev := CCCLXXVIII.! !


!classDefinition: #CCCLXXV category: 'NumerosNaturales'!
II subclass: #CCCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXV class' category: 'NumerosNaturales'!
CCCLXXV class
	instanceVariableNames: ''!

!CCCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXVI.
	prev := CCCLXXIV.! !


!classDefinition: #CCCLXXVI category: 'NumerosNaturales'!
II subclass: #CCCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVI class' category: 'NumerosNaturales'!
CCCLXXVI class
	instanceVariableNames: ''!

!CCCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXVII.
	prev := CCCLXXV.! !


!classDefinition: #CCCLXXVII category: 'NumerosNaturales'!
II subclass: #CCCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVII class' category: 'NumerosNaturales'!
CCCLXXVII class
	instanceVariableNames: ''!

!CCCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXVIII.
	prev := CCCLXXVI.! !


!classDefinition: #CCCLXXVIII category: 'NumerosNaturales'!
II subclass: #CCCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXVIII class' category: 'NumerosNaturales'!
CCCLXXVIII class
	instanceVariableNames: ''!

!CCCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXIX.
	prev := CCCLXXVII.! !


!classDefinition: #CCCLXXX category: 'NumerosNaturales'!
II subclass: #CCCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXX class' category: 'NumerosNaturales'!
CCCLXXX class
	instanceVariableNames: ''!

!CCCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXI.
	prev := CCCLXXIX.! !


!classDefinition: #CCCLXXXI category: 'NumerosNaturales'!
II subclass: #CCCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXI class' category: 'NumerosNaturales'!
CCCLXXXI class
	instanceVariableNames: ''!

!CCCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXII.
	prev := CCCLXXX.! !


!classDefinition: #CCCLXXXII category: 'NumerosNaturales'!
II subclass: #CCCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXII class' category: 'NumerosNaturales'!
CCCLXXXII class
	instanceVariableNames: ''!

!CCCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXIII.
	prev := CCCLXXXI.! !


!classDefinition: #CCCLXXXIII category: 'NumerosNaturales'!
II subclass: #CCCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIII class' category: 'NumerosNaturales'!
CCCLXXXIII class
	instanceVariableNames: ''!

!CCCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXIV.
	prev := CCCLXXXII.! !


!classDefinition: #CCCLXXXIV category: 'NumerosNaturales'!
II subclass: #CCCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIV class' category: 'NumerosNaturales'!
CCCLXXXIV class
	instanceVariableNames: ''!

!CCCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXV.
	prev := CCCLXXXIII.! !


!classDefinition: #CCCLXXXIX category: 'NumerosNaturales'!
II subclass: #CCCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXIX class' category: 'NumerosNaturales'!
CCCLXXXIX class
	instanceVariableNames: ''!

!CCCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXC.
	prev := CCCLXXXVIII.! !


!classDefinition: #CCCLXXXV category: 'NumerosNaturales'!
II subclass: #CCCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXV class' category: 'NumerosNaturales'!
CCCLXXXV class
	instanceVariableNames: ''!

!CCCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXVI.
	prev := CCCLXXXIV.! !


!classDefinition: #CCCLXXXVI category: 'NumerosNaturales'!
II subclass: #CCCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVI class' category: 'NumerosNaturales'!
CCCLXXXVI class
	instanceVariableNames: ''!

!CCCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXVII.
	prev := CCCLXXXV.! !


!classDefinition: #CCCLXXXVII category: 'NumerosNaturales'!
II subclass: #CCCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVII class' category: 'NumerosNaturales'!
CCCLXXXVII class
	instanceVariableNames: ''!

!CCCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXVIII.
	prev := CCCLXXXVI.! !


!classDefinition: #CCCLXXXVIII category: 'NumerosNaturales'!
II subclass: #CCCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCLXXXVIII class' category: 'NumerosNaturales'!
CCCLXXXVIII class
	instanceVariableNames: ''!

!CCCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCLXXXIX.
	prev := CCCLXXXVII.! !


!classDefinition: #CCCV category: 'NumerosNaturales'!
II subclass: #CCCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCV class' category: 'NumerosNaturales'!
CCCV class
	instanceVariableNames: ''!

!CCCV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCVI.
	prev := CCCIV.! !


!classDefinition: #CCCVI category: 'NumerosNaturales'!
II subclass: #CCCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVI class' category: 'NumerosNaturales'!
CCCVI class
	instanceVariableNames: ''!

!CCCVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCVII.
	prev := CCCV.! !


!classDefinition: #CCCVII category: 'NumerosNaturales'!
II subclass: #CCCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVII class' category: 'NumerosNaturales'!
CCCVII class
	instanceVariableNames: ''!

!CCCVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCVIII.
	prev := CCCVI.! !


!classDefinition: #CCCVIII category: 'NumerosNaturales'!
II subclass: #CCCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCVIII class' category: 'NumerosNaturales'!
CCCVIII class
	instanceVariableNames: ''!

!CCCVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCIX.
	prev := CCCVII.! !


!classDefinition: #CCCX category: 'NumerosNaturales'!
II subclass: #CCCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCX class' category: 'NumerosNaturales'!
CCCX class
	instanceVariableNames: ''!

!CCCX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXI.
	prev := CCCIX.! !


!classDefinition: #CCCXC category: 'NumerosNaturales'!
II subclass: #CCCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXC class' category: 'NumerosNaturales'!
CCCXC class
	instanceVariableNames: ''!

!CCCXC class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCI.
	prev := CCCLXXXIX.! !


!classDefinition: #CCCXCI category: 'NumerosNaturales'!
II subclass: #CCCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCI class' category: 'NumerosNaturales'!
CCCXCI class
	instanceVariableNames: ''!

!CCCXCI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCII.
	prev := CCCXC.! !


!classDefinition: #CCCXCII category: 'NumerosNaturales'!
II subclass: #CCCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCII class' category: 'NumerosNaturales'!
CCCXCII class
	instanceVariableNames: ''!

!CCCXCII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCIII.
	prev := CCCXCI.! !


!classDefinition: #CCCXCIII category: 'NumerosNaturales'!
II subclass: #CCCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIII class' category: 'NumerosNaturales'!
CCCXCIII class
	instanceVariableNames: ''!

!CCCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCIV.
	prev := CCCXCII.! !


!classDefinition: #CCCXCIV category: 'NumerosNaturales'!
II subclass: #CCCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIV class' category: 'NumerosNaturales'!
CCCXCIV class
	instanceVariableNames: ''!

!CCCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCV.
	prev := CCCXCIII.! !


!classDefinition: #CCCXCIX category: 'NumerosNaturales'!
II subclass: #CCCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCIX class' category: 'NumerosNaturales'!
CCCXCIX class
	instanceVariableNames: ''!

!CCCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CD.
	prev := CCCXCVIII.! !


!classDefinition: #CCCXCV category: 'NumerosNaturales'!
II subclass: #CCCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCV class' category: 'NumerosNaturales'!
CCCXCV class
	instanceVariableNames: ''!

!CCCXCV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCVI.
	prev := CCCXCIV.! !


!classDefinition: #CCCXCVI category: 'NumerosNaturales'!
II subclass: #CCCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVI class' category: 'NumerosNaturales'!
CCCXCVI class
	instanceVariableNames: ''!

!CCCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCVII.
	prev := CCCXCV.! !


!classDefinition: #CCCXCVII category: 'NumerosNaturales'!
II subclass: #CCCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVII class' category: 'NumerosNaturales'!
CCCXCVII class
	instanceVariableNames: ''!

!CCCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCVIII.
	prev := CCCXCVI.! !


!classDefinition: #CCCXCVIII category: 'NumerosNaturales'!
II subclass: #CCCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXCVIII class' category: 'NumerosNaturales'!
CCCXCVIII class
	instanceVariableNames: ''!

!CCCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXCIX.
	prev := CCCXCVII.! !


!classDefinition: #CCCXI category: 'NumerosNaturales'!
II subclass: #CCCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXI class' category: 'NumerosNaturales'!
CCCXI class
	instanceVariableNames: ''!

!CCCXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXII.
	prev := CCCX.! !


!classDefinition: #CCCXII category: 'NumerosNaturales'!
II subclass: #CCCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXII class' category: 'NumerosNaturales'!
CCCXII class
	instanceVariableNames: ''!

!CCCXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXIII.
	prev := CCCXI.! !


!classDefinition: #CCCXIII category: 'NumerosNaturales'!
II subclass: #CCCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIII class' category: 'NumerosNaturales'!
CCCXIII class
	instanceVariableNames: ''!

!CCCXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXIV.
	prev := CCCXII.! !


!classDefinition: #CCCXIV category: 'NumerosNaturales'!
II subclass: #CCCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIV class' category: 'NumerosNaturales'!
CCCXIV class
	instanceVariableNames: ''!

!CCCXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXV.
	prev := CCCXIII.! !


!classDefinition: #CCCXIX category: 'NumerosNaturales'!
II subclass: #CCCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXIX class' category: 'NumerosNaturales'!
CCCXIX class
	instanceVariableNames: ''!

!CCCXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXX.
	prev := CCCXVIII.! !


!classDefinition: #CCCXL category: 'NumerosNaturales'!
II subclass: #CCCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXL class' category: 'NumerosNaturales'!
CCCXL class
	instanceVariableNames: ''!

!CCCXL class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLI.
	prev := CCCXXXIX.! !


!classDefinition: #CCCXLI category: 'NumerosNaturales'!
II subclass: #CCCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLI class' category: 'NumerosNaturales'!
CCCXLI class
	instanceVariableNames: ''!

!CCCXLI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLII.
	prev := CCCXL.! !


!classDefinition: #CCCXLII category: 'NumerosNaturales'!
II subclass: #CCCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLII class' category: 'NumerosNaturales'!
CCCXLII class
	instanceVariableNames: ''!

!CCCXLII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLIII.
	prev := CCCXLI.! !


!classDefinition: #CCCXLIII category: 'NumerosNaturales'!
II subclass: #CCCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIII class' category: 'NumerosNaturales'!
CCCXLIII class
	instanceVariableNames: ''!

!CCCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLIV.
	prev := CCCXLII.! !


!classDefinition: #CCCXLIV category: 'NumerosNaturales'!
II subclass: #CCCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIV class' category: 'NumerosNaturales'!
CCCXLIV class
	instanceVariableNames: ''!

!CCCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLV.
	prev := CCCXLIII.! !


!classDefinition: #CCCXLIX category: 'NumerosNaturales'!
II subclass: #CCCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLIX class' category: 'NumerosNaturales'!
CCCXLIX class
	instanceVariableNames: ''!

!CCCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCL.
	prev := CCCXLVIII.! !


!classDefinition: #CCCXLV category: 'NumerosNaturales'!
II subclass: #CCCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLV class' category: 'NumerosNaturales'!
CCCXLV class
	instanceVariableNames: ''!

!CCCXLV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLVI.
	prev := CCCXLIV.! !


!classDefinition: #CCCXLVI category: 'NumerosNaturales'!
II subclass: #CCCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVI class' category: 'NumerosNaturales'!
CCCXLVI class
	instanceVariableNames: ''!

!CCCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLVII.
	prev := CCCXLV.! !


!classDefinition: #CCCXLVII category: 'NumerosNaturales'!
II subclass: #CCCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVII class' category: 'NumerosNaturales'!
CCCXLVII class
	instanceVariableNames: ''!

!CCCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLVIII.
	prev := CCCXLVI.! !


!classDefinition: #CCCXLVIII category: 'NumerosNaturales'!
II subclass: #CCCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXLVIII class' category: 'NumerosNaturales'!
CCCXLVIII class
	instanceVariableNames: ''!

!CCCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXLIX.
	prev := CCCXLVII.! !


!classDefinition: #CCCXV category: 'NumerosNaturales'!
II subclass: #CCCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXV class' category: 'NumerosNaturales'!
CCCXV class
	instanceVariableNames: ''!

!CCCXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:27'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXVI.
	prev := CCCXIV.! !


!classDefinition: #CCCXVI category: 'NumerosNaturales'!
II subclass: #CCCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVI class' category: 'NumerosNaturales'!
CCCXVI class
	instanceVariableNames: ''!

!CCCXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXVII.
	prev := CCCXV.! !


!classDefinition: #CCCXVII category: 'NumerosNaturales'!
II subclass: #CCCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVII class' category: 'NumerosNaturales'!
CCCXVII class
	instanceVariableNames: ''!

!CCCXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXVIII.
	prev := CCCXVI.! !


!classDefinition: #CCCXVIII category: 'NumerosNaturales'!
II subclass: #CCCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXVIII class' category: 'NumerosNaturales'!
CCCXVIII class
	instanceVariableNames: ''!

!CCCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXIX.
	prev := CCCXVII.! !


!classDefinition: #CCCXX category: 'NumerosNaturales'!
II subclass: #CCCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXX class' category: 'NumerosNaturales'!
CCCXX class
	instanceVariableNames: ''!

!CCCXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXI.
	prev := CCCXIX.! !


!classDefinition: #CCCXXI category: 'NumerosNaturales'!
II subclass: #CCCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXI class' category: 'NumerosNaturales'!
CCCXXI class
	instanceVariableNames: ''!

!CCCXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXII.
	prev := CCCXX.! !


!classDefinition: #CCCXXII category: 'NumerosNaturales'!
II subclass: #CCCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXII class' category: 'NumerosNaturales'!
CCCXXII class
	instanceVariableNames: ''!

!CCCXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXIII.
	prev := CCCXXI.! !


!classDefinition: #CCCXXIII category: 'NumerosNaturales'!
II subclass: #CCCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIII class' category: 'NumerosNaturales'!
CCCXXIII class
	instanceVariableNames: ''!

!CCCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXIV.
	prev := CCCXXII.! !


!classDefinition: #CCCXXIV category: 'NumerosNaturales'!
II subclass: #CCCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIV class' category: 'NumerosNaturales'!
CCCXXIV class
	instanceVariableNames: ''!

!CCCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXV.
	prev := CCCXXIII.! !


!classDefinition: #CCCXXIX category: 'NumerosNaturales'!
II subclass: #CCCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXIX class' category: 'NumerosNaturales'!
CCCXXIX class
	instanceVariableNames: ''!

!CCCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXX.
	prev := CCCXXVIII.! !


!classDefinition: #CCCXXV category: 'NumerosNaturales'!
II subclass: #CCCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXV class' category: 'NumerosNaturales'!
CCCXXV class
	instanceVariableNames: ''!

!CCCXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXVI.
	prev := CCCXXIV.! !


!classDefinition: #CCCXXVI category: 'NumerosNaturales'!
II subclass: #CCCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVI class' category: 'NumerosNaturales'!
CCCXXVI class
	instanceVariableNames: ''!

!CCCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXVII.
	prev := CCCXXV.! !


!classDefinition: #CCCXXVII category: 'NumerosNaturales'!
II subclass: #CCCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVII class' category: 'NumerosNaturales'!
CCCXXVII class
	instanceVariableNames: ''!

!CCCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXVIII.
	prev := CCCXXVI.! !


!classDefinition: #CCCXXVIII category: 'NumerosNaturales'!
II subclass: #CCCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXVIII class' category: 'NumerosNaturales'!
CCCXXVIII class
	instanceVariableNames: ''!

!CCCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXIX.
	prev := CCCXXVII.! !


!classDefinition: #CCCXXX category: 'NumerosNaturales'!
II subclass: #CCCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXX class' category: 'NumerosNaturales'!
CCCXXX class
	instanceVariableNames: ''!

!CCCXXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXI.
	prev := CCCXXIX.! !


!classDefinition: #CCCXXXI category: 'NumerosNaturales'!
II subclass: #CCCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXI class' category: 'NumerosNaturales'!
CCCXXXI class
	instanceVariableNames: ''!

!CCCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXII.
	prev := CCCXXX.! !


!classDefinition: #CCCXXXII category: 'NumerosNaturales'!
II subclass: #CCCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXII class' category: 'NumerosNaturales'!
CCCXXXII class
	instanceVariableNames: ''!

!CCCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXIII.
	prev := CCCXXXI.! !


!classDefinition: #CCCXXXIII category: 'NumerosNaturales'!
II subclass: #CCCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIII class' category: 'NumerosNaturales'!
CCCXXXIII class
	instanceVariableNames: ''!

!CCCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXIV.
	prev := CCCXXXII.! !


!classDefinition: #CCCXXXIV category: 'NumerosNaturales'!
II subclass: #CCCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIV class' category: 'NumerosNaturales'!
CCCXXXIV class
	instanceVariableNames: ''!

!CCCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXV.
	prev := CCCXXXIII.! !


!classDefinition: #CCCXXXIX category: 'NumerosNaturales'!
II subclass: #CCCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXIX class' category: 'NumerosNaturales'!
CCCXXXIX class
	instanceVariableNames: ''!

!CCCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXL.
	prev := CCCXXXVIII.! !


!classDefinition: #CCCXXXV category: 'NumerosNaturales'!
II subclass: #CCCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXV class' category: 'NumerosNaturales'!
CCCXXXV class
	instanceVariableNames: ''!

!CCCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXVI.
	prev := CCCXXXIV.! !


!classDefinition: #CCCXXXVI category: 'NumerosNaturales'!
II subclass: #CCCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVI class' category: 'NumerosNaturales'!
CCCXXXVI class
	instanceVariableNames: ''!

!CCCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXVII.
	prev := CCCXXXV.! !


!classDefinition: #CCCXXXVII category: 'NumerosNaturales'!
II subclass: #CCCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVII class' category: 'NumerosNaturales'!
CCCXXXVII class
	instanceVariableNames: ''!

!CCCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXVIII.
	prev := CCCXXXVI.! !


!classDefinition: #CCCXXXVIII category: 'NumerosNaturales'!
II subclass: #CCCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCCXXXVIII class' category: 'NumerosNaturales'!
CCCXXXVIII class
	instanceVariableNames: ''!

!CCCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCCXXXIX.
	prev := CCCXXXVII.! !


!classDefinition: #CCI category: 'NumerosNaturales'!
II subclass: #CCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCI class' category: 'NumerosNaturales'!
CCI class
	instanceVariableNames: ''!

!CCI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCII.
	prev := CC.! !


!classDefinition: #CCII category: 'NumerosNaturales'!
II subclass: #CCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCII class' category: 'NumerosNaturales'!
CCII class
	instanceVariableNames: ''!

!CCII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCIII.
	prev := CCI.! !


!classDefinition: #CCIII category: 'NumerosNaturales'!
II subclass: #CCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIII class' category: 'NumerosNaturales'!
CCIII class
	instanceVariableNames: ''!

!CCIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCIV.
	prev := CCII.! !


!classDefinition: #CCIV category: 'NumerosNaturales'!
II subclass: #CCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIV class' category: 'NumerosNaturales'!
CCIV class
	instanceVariableNames: ''!

!CCIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCV.
	prev := CCIII.! !


!classDefinition: #CCIX category: 'NumerosNaturales'!
II subclass: #CCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCIX class' category: 'NumerosNaturales'!
CCIX class
	instanceVariableNames: ''!

!CCIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCX.
	prev := CCVIII.! !


!classDefinition: #CCL category: 'NumerosNaturales'!
II subclass: #CCL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCL class' category: 'NumerosNaturales'!
CCL class
	instanceVariableNames: ''!

!CCL class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLI.
	prev := CCXLIX.! !


!classDefinition: #CCLI category: 'NumerosNaturales'!
II subclass: #CCLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLI class' category: 'NumerosNaturales'!
CCLI class
	instanceVariableNames: ''!

!CCLI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLII.
	prev := CCL.! !


!classDefinition: #CCLII category: 'NumerosNaturales'!
II subclass: #CCLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLII class' category: 'NumerosNaturales'!
CCLII class
	instanceVariableNames: ''!

!CCLII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLIII.
	prev := CCLI.! !


!classDefinition: #CCLIII category: 'NumerosNaturales'!
II subclass: #CCLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIII class' category: 'NumerosNaturales'!
CCLIII class
	instanceVariableNames: ''!

!CCLIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLIV.
	prev := CCLII.! !


!classDefinition: #CCLIV category: 'NumerosNaturales'!
II subclass: #CCLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIV class' category: 'NumerosNaturales'!
CCLIV class
	instanceVariableNames: ''!

!CCLIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLV.
	prev := CCLIII.! !


!classDefinition: #CCLIX category: 'NumerosNaturales'!
II subclass: #CCLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLIX class' category: 'NumerosNaturales'!
CCLIX class
	instanceVariableNames: ''!

!CCLIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLX.
	prev := CCLVIII.! !


!classDefinition: #CCLV category: 'NumerosNaturales'!
II subclass: #CCLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLV class' category: 'NumerosNaturales'!
CCLV class
	instanceVariableNames: ''!

!CCLV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLVI.
	prev := CCLIV.! !


!classDefinition: #CCLVI category: 'NumerosNaturales'!
II subclass: #CCLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVI class' category: 'NumerosNaturales'!
CCLVI class
	instanceVariableNames: ''!

!CCLVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLVII.
	prev := CCLV.! !


!classDefinition: #CCLVII category: 'NumerosNaturales'!
II subclass: #CCLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVII class' category: 'NumerosNaturales'!
CCLVII class
	instanceVariableNames: ''!

!CCLVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLVIII.
	prev := CCLVI.! !


!classDefinition: #CCLVIII category: 'NumerosNaturales'!
II subclass: #CCLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLVIII class' category: 'NumerosNaturales'!
CCLVIII class
	instanceVariableNames: ''!

!CCLVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLIX.
	prev := CCLVII.! !


!classDefinition: #CCLX category: 'NumerosNaturales'!
II subclass: #CCLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLX class' category: 'NumerosNaturales'!
CCLX class
	instanceVariableNames: ''!

!CCLX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXI.
	prev := CCLIX.! !


!classDefinition: #CCLXI category: 'NumerosNaturales'!
II subclass: #CCLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXI class' category: 'NumerosNaturales'!
CCLXI class
	instanceVariableNames: ''!

!CCLXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXII.
	prev := CCLX.! !


!classDefinition: #CCLXII category: 'NumerosNaturales'!
II subclass: #CCLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXII class' category: 'NumerosNaturales'!
CCLXII class
	instanceVariableNames: ''!

!CCLXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXIII.
	prev := CCLXI.! !


!classDefinition: #CCLXIII category: 'NumerosNaturales'!
II subclass: #CCLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIII class' category: 'NumerosNaturales'!
CCLXIII class
	instanceVariableNames: ''!

!CCLXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXIV.
	prev := CCLXII.! !


!classDefinition: #CCLXIV category: 'NumerosNaturales'!
II subclass: #CCLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIV class' category: 'NumerosNaturales'!
CCLXIV class
	instanceVariableNames: ''!

!CCLXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXV.
	prev := CCLXIII.! !


!classDefinition: #CCLXIX category: 'NumerosNaturales'!
II subclass: #CCLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXIX class' category: 'NumerosNaturales'!
CCLXIX class
	instanceVariableNames: ''!

!CCLXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXX.
	prev := CCLXVIII.! !


!classDefinition: #CCLXV category: 'NumerosNaturales'!
II subclass: #CCLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXV class' category: 'NumerosNaturales'!
CCLXV class
	instanceVariableNames: ''!

!CCLXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXVI.
	prev := CCLXIV.! !


!classDefinition: #CCLXVI category: 'NumerosNaturales'!
II subclass: #CCLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVI class' category: 'NumerosNaturales'!
CCLXVI class
	instanceVariableNames: ''!

!CCLXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXVII.
	prev := CCLXV.! !


!classDefinition: #CCLXVII category: 'NumerosNaturales'!
II subclass: #CCLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVII class' category: 'NumerosNaturales'!
CCLXVII class
	instanceVariableNames: ''!

!CCLXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXVIII.
	prev := CCLXVI.! !


!classDefinition: #CCLXVIII category: 'NumerosNaturales'!
II subclass: #CCLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXVIII class' category: 'NumerosNaturales'!
CCLXVIII class
	instanceVariableNames: ''!

!CCLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXIX.
	prev := CCLXVII.! !


!classDefinition: #CCLXX category: 'NumerosNaturales'!
II subclass: #CCLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXX class' category: 'NumerosNaturales'!
CCLXX class
	instanceVariableNames: ''!

!CCLXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXI.
	prev := CCLXIX.! !


!classDefinition: #CCLXXI category: 'NumerosNaturales'!
II subclass: #CCLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXI class' category: 'NumerosNaturales'!
CCLXXI class
	instanceVariableNames: ''!

!CCLXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXII.
	prev := CCLXX.! !


!classDefinition: #CCLXXII category: 'NumerosNaturales'!
II subclass: #CCLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXII class' category: 'NumerosNaturales'!
CCLXXII class
	instanceVariableNames: ''!

!CCLXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXIII.
	prev := CCLXXI.! !


!classDefinition: #CCLXXIII category: 'NumerosNaturales'!
II subclass: #CCLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIII class' category: 'NumerosNaturales'!
CCLXXIII class
	instanceVariableNames: ''!

!CCLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXIV.
	prev := CCLXXII.! !


!classDefinition: #CCLXXIV category: 'NumerosNaturales'!
II subclass: #CCLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIV class' category: 'NumerosNaturales'!
CCLXXIV class
	instanceVariableNames: ''!

!CCLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXV.
	prev := CCLXXIII.! !


!classDefinition: #CCLXXIX category: 'NumerosNaturales'!
II subclass: #CCLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXIX class' category: 'NumerosNaturales'!
CCLXXIX class
	instanceVariableNames: ''!

!CCLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXX.
	prev := CCLXXVIII.! !


!classDefinition: #CCLXXV category: 'NumerosNaturales'!
II subclass: #CCLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXV class' category: 'NumerosNaturales'!
CCLXXV class
	instanceVariableNames: ''!

!CCLXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXVI.
	prev := CCLXXIV.! !


!classDefinition: #CCLXXVI category: 'NumerosNaturales'!
II subclass: #CCLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVI class' category: 'NumerosNaturales'!
CCLXXVI class
	instanceVariableNames: ''!

!CCLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXVII.
	prev := CCLXXV.! !


!classDefinition: #CCLXXVII category: 'NumerosNaturales'!
II subclass: #CCLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVII class' category: 'NumerosNaturales'!
CCLXXVII class
	instanceVariableNames: ''!

!CCLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXVIII.
	prev := CCLXXVI.! !


!classDefinition: #CCLXXVIII category: 'NumerosNaturales'!
II subclass: #CCLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXVIII class' category: 'NumerosNaturales'!
CCLXXVIII class
	instanceVariableNames: ''!

!CCLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXIX.
	prev := CCLXXVII.! !


!classDefinition: #CCLXXX category: 'NumerosNaturales'!
II subclass: #CCLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXX class' category: 'NumerosNaturales'!
CCLXXX class
	instanceVariableNames: ''!

!CCLXXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXI.
	prev := CCLXXIX.! !


!classDefinition: #CCLXXXI category: 'NumerosNaturales'!
II subclass: #CCLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXI class' category: 'NumerosNaturales'!
CCLXXXI class
	instanceVariableNames: ''!

!CCLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXII.
	prev := CCLXXX.! !


!classDefinition: #CCLXXXII category: 'NumerosNaturales'!
II subclass: #CCLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXII class' category: 'NumerosNaturales'!
CCLXXXII class
	instanceVariableNames: ''!

!CCLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXIII.
	prev := CCLXXXI.! !


!classDefinition: #CCLXXXIII category: 'NumerosNaturales'!
II subclass: #CCLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIII class' category: 'NumerosNaturales'!
CCLXXXIII class
	instanceVariableNames: ''!

!CCLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXIV.
	prev := CCLXXXII.! !


!classDefinition: #CCLXXXIV category: 'NumerosNaturales'!
II subclass: #CCLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIV class' category: 'NumerosNaturales'!
CCLXXXIV class
	instanceVariableNames: ''!

!CCLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXV.
	prev := CCLXXXIII.! !


!classDefinition: #CCLXXXIX category: 'NumerosNaturales'!
II subclass: #CCLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXIX class' category: 'NumerosNaturales'!
CCLXXXIX class
	instanceVariableNames: ''!

!CCLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXC.
	prev := CCLXXXVIII.! !


!classDefinition: #CCLXXXV category: 'NumerosNaturales'!
II subclass: #CCLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXV class' category: 'NumerosNaturales'!
CCLXXXV class
	instanceVariableNames: ''!

!CCLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXVI.
	prev := CCLXXXIV.! !


!classDefinition: #CCLXXXVI category: 'NumerosNaturales'!
II subclass: #CCLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVI class' category: 'NumerosNaturales'!
CCLXXXVI class
	instanceVariableNames: ''!

!CCLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:28'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXVII.
	prev := CCLXXXV.! !


!classDefinition: #CCLXXXVII category: 'NumerosNaturales'!
II subclass: #CCLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVII class' category: 'NumerosNaturales'!
CCLXXXVII class
	instanceVariableNames: ''!

!CCLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXVIII.
	prev := CCLXXXVI.! !


!classDefinition: #CCLXXXVIII category: 'NumerosNaturales'!
II subclass: #CCLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCLXXXVIII class' category: 'NumerosNaturales'!
CCLXXXVIII class
	instanceVariableNames: ''!

!CCLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCLXXXIX.
	prev := CCLXXXVII.! !


!classDefinition: #CCV category: 'NumerosNaturales'!
II subclass: #CCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCV class' category: 'NumerosNaturales'!
CCV class
	instanceVariableNames: ''!

!CCV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCVI.
	prev := CCIV.! !


!classDefinition: #CCVI category: 'NumerosNaturales'!
II subclass: #CCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVI class' category: 'NumerosNaturales'!
CCVI class
	instanceVariableNames: ''!

!CCVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCVII.
	prev := CCV.! !


!classDefinition: #CCVII category: 'NumerosNaturales'!
II subclass: #CCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVII class' category: 'NumerosNaturales'!
CCVII class
	instanceVariableNames: ''!

!CCVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCVIII.
	prev := CCVI.! !


!classDefinition: #CCVIII category: 'NumerosNaturales'!
II subclass: #CCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCVIII class' category: 'NumerosNaturales'!
CCVIII class
	instanceVariableNames: ''!

!CCVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCIX.
	prev := CCVII.! !


!classDefinition: #CCX category: 'NumerosNaturales'!
II subclass: #CCX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCX class' category: 'NumerosNaturales'!
CCX class
	instanceVariableNames: ''!

!CCX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXI.
	prev := CCIX.! !


!classDefinition: #CCXC category: 'NumerosNaturales'!
II subclass: #CCXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXC class' category: 'NumerosNaturales'!
CCXC class
	instanceVariableNames: ''!

!CCXC class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCI.
	prev := CCLXXXIX.! !


!classDefinition: #CCXCI category: 'NumerosNaturales'!
II subclass: #CCXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCI class' category: 'NumerosNaturales'!
CCXCI class
	instanceVariableNames: ''!

!CCXCI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCII.
	prev := CCXC.! !


!classDefinition: #CCXCII category: 'NumerosNaturales'!
II subclass: #CCXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCII class' category: 'NumerosNaturales'!
CCXCII class
	instanceVariableNames: ''!

!CCXCII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCIII.
	prev := CCXCI.! !


!classDefinition: #CCXCIII category: 'NumerosNaturales'!
II subclass: #CCXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIII class' category: 'NumerosNaturales'!
CCXCIII class
	instanceVariableNames: ''!

!CCXCIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCIV.
	prev := CCXCII.! !


!classDefinition: #CCXCIV category: 'NumerosNaturales'!
II subclass: #CCXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIV class' category: 'NumerosNaturales'!
CCXCIV class
	instanceVariableNames: ''!

!CCXCIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCV.
	prev := CCXCIII.! !


!classDefinition: #CCXCIX category: 'NumerosNaturales'!
II subclass: #CCXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCIX class' category: 'NumerosNaturales'!
CCXCIX class
	instanceVariableNames: ''!

!CCXCIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCC.
	prev := CCXCVIII.! !


!classDefinition: #CCXCV category: 'NumerosNaturales'!
II subclass: #CCXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCV class' category: 'NumerosNaturales'!
CCXCV class
	instanceVariableNames: ''!

!CCXCV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCVI.
	prev := CCXCIV.! !


!classDefinition: #CCXCVI category: 'NumerosNaturales'!
II subclass: #CCXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVI class' category: 'NumerosNaturales'!
CCXCVI class
	instanceVariableNames: ''!

!CCXCVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCVII.
	prev := CCXCV.! !


!classDefinition: #CCXCVII category: 'NumerosNaturales'!
II subclass: #CCXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVII class' category: 'NumerosNaturales'!
CCXCVII class
	instanceVariableNames: ''!

!CCXCVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCVIII.
	prev := CCXCVI.! !


!classDefinition: #CCXCVIII category: 'NumerosNaturales'!
II subclass: #CCXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXCVIII class' category: 'NumerosNaturales'!
CCXCVIII class
	instanceVariableNames: ''!

!CCXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXCIX.
	prev := CCXCVII.! !


!classDefinition: #CCXI category: 'NumerosNaturales'!
II subclass: #CCXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXI class' category: 'NumerosNaturales'!
CCXI class
	instanceVariableNames: ''!

!CCXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXII.
	prev := CCX.! !


!classDefinition: #CCXII category: 'NumerosNaturales'!
II subclass: #CCXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXII class' category: 'NumerosNaturales'!
CCXII class
	instanceVariableNames: ''!

!CCXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXIII.
	prev := CCXI.! !


!classDefinition: #CCXIII category: 'NumerosNaturales'!
II subclass: #CCXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIII class' category: 'NumerosNaturales'!
CCXIII class
	instanceVariableNames: ''!

!CCXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXIV.
	prev := CCXII.! !


!classDefinition: #CCXIV category: 'NumerosNaturales'!
II subclass: #CCXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIV class' category: 'NumerosNaturales'!
CCXIV class
	instanceVariableNames: ''!

!CCXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXV.
	prev := CCXIII.! !


!classDefinition: #CCXIX category: 'NumerosNaturales'!
II subclass: #CCXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXIX class' category: 'NumerosNaturales'!
CCXIX class
	instanceVariableNames: ''!

!CCXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXX.
	prev := CCXVIII.! !


!classDefinition: #CCXL category: 'NumerosNaturales'!
II subclass: #CCXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXL class' category: 'NumerosNaturales'!
CCXL class
	instanceVariableNames: ''!

!CCXL class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLI.
	prev := CCXXXIX.! !


!classDefinition: #CCXLI category: 'NumerosNaturales'!
II subclass: #CCXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLI class' category: 'NumerosNaturales'!
CCXLI class
	instanceVariableNames: ''!

!CCXLI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLII.
	prev := CCXL.! !


!classDefinition: #CCXLII category: 'NumerosNaturales'!
II subclass: #CCXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLII class' category: 'NumerosNaturales'!
CCXLII class
	instanceVariableNames: ''!

!CCXLII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLIII.
	prev := CCXLI.! !


!classDefinition: #CCXLIII category: 'NumerosNaturales'!
II subclass: #CCXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIII class' category: 'NumerosNaturales'!
CCXLIII class
	instanceVariableNames: ''!

!CCXLIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLIV.
	prev := CCXLII.! !


!classDefinition: #CCXLIV category: 'NumerosNaturales'!
II subclass: #CCXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIV class' category: 'NumerosNaturales'!
CCXLIV class
	instanceVariableNames: ''!

!CCXLIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLV.
	prev := CCXLIII.! !


!classDefinition: #CCXLIX category: 'NumerosNaturales'!
II subclass: #CCXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLIX class' category: 'NumerosNaturales'!
CCXLIX class
	instanceVariableNames: ''!

!CCXLIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCL.
	prev := CCXLVIII.! !


!classDefinition: #CCXLV category: 'NumerosNaturales'!
II subclass: #CCXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLV class' category: 'NumerosNaturales'!
CCXLV class
	instanceVariableNames: ''!

!CCXLV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLVI.
	prev := CCXLIV.! !


!classDefinition: #CCXLVI category: 'NumerosNaturales'!
II subclass: #CCXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVI class' category: 'NumerosNaturales'!
CCXLVI class
	instanceVariableNames: ''!

!CCXLVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLVII.
	prev := CCXLV.! !


!classDefinition: #CCXLVII category: 'NumerosNaturales'!
II subclass: #CCXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVII class' category: 'NumerosNaturales'!
CCXLVII class
	instanceVariableNames: ''!

!CCXLVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLVIII.
	prev := CCXLVI.! !


!classDefinition: #CCXLVIII category: 'NumerosNaturales'!
II subclass: #CCXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXLVIII class' category: 'NumerosNaturales'!
CCXLVIII class
	instanceVariableNames: ''!

!CCXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXLIX.
	prev := CCXLVII.! !


!classDefinition: #CCXV category: 'NumerosNaturales'!
II subclass: #CCXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXV class' category: 'NumerosNaturales'!
CCXV class
	instanceVariableNames: ''!

!CCXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXVI.
	prev := CCXIV.! !


!classDefinition: #CCXVI category: 'NumerosNaturales'!
II subclass: #CCXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVI class' category: 'NumerosNaturales'!
CCXVI class
	instanceVariableNames: ''!

!CCXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXVII.
	prev := CCXV.! !


!classDefinition: #CCXVII category: 'NumerosNaturales'!
II subclass: #CCXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVII class' category: 'NumerosNaturales'!
CCXVII class
	instanceVariableNames: ''!

!CCXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXVIII.
	prev := CCXVI.! !


!classDefinition: #CCXVIII category: 'NumerosNaturales'!
II subclass: #CCXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXVIII class' category: 'NumerosNaturales'!
CCXVIII class
	instanceVariableNames: ''!

!CCXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXIX.
	prev := CCXVII.! !


!classDefinition: #CCXX category: 'NumerosNaturales'!
II subclass: #CCXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXX class' category: 'NumerosNaturales'!
CCXX class
	instanceVariableNames: ''!

!CCXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXI.
	prev := CCXIX.! !


!classDefinition: #CCXXI category: 'NumerosNaturales'!
II subclass: #CCXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXI class' category: 'NumerosNaturales'!
CCXXI class
	instanceVariableNames: ''!

!CCXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXII.
	prev := CCXX.! !


!classDefinition: #CCXXII category: 'NumerosNaturales'!
II subclass: #CCXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXII class' category: 'NumerosNaturales'!
CCXXII class
	instanceVariableNames: ''!

!CCXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXIII.
	prev := CCXXI.! !


!classDefinition: #CCXXIII category: 'NumerosNaturales'!
II subclass: #CCXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIII class' category: 'NumerosNaturales'!
CCXXIII class
	instanceVariableNames: ''!

!CCXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXIV.
	prev := CCXXII.! !


!classDefinition: #CCXXIV category: 'NumerosNaturales'!
II subclass: #CCXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIV class' category: 'NumerosNaturales'!
CCXXIV class
	instanceVariableNames: ''!

!CCXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXV.
	prev := CCXXIII.! !


!classDefinition: #CCXXIX category: 'NumerosNaturales'!
II subclass: #CCXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXIX class' category: 'NumerosNaturales'!
CCXXIX class
	instanceVariableNames: ''!

!CCXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXX.
	prev := CCXXVIII.! !


!classDefinition: #CCXXV category: 'NumerosNaturales'!
II subclass: #CCXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXV class' category: 'NumerosNaturales'!
CCXXV class
	instanceVariableNames: ''!

!CCXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXVI.
	prev := CCXXIV.! !


!classDefinition: #CCXXVI category: 'NumerosNaturales'!
II subclass: #CCXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVI class' category: 'NumerosNaturales'!
CCXXVI class
	instanceVariableNames: ''!

!CCXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXVII.
	prev := CCXXV.! !


!classDefinition: #CCXXVII category: 'NumerosNaturales'!
II subclass: #CCXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVII class' category: 'NumerosNaturales'!
CCXXVII class
	instanceVariableNames: ''!

!CCXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXVIII.
	prev := CCXXVI.! !


!classDefinition: #CCXXVIII category: 'NumerosNaturales'!
II subclass: #CCXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXVIII class' category: 'NumerosNaturales'!
CCXXVIII class
	instanceVariableNames: ''!

!CCXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXIX.
	prev := CCXXVII.! !


!classDefinition: #CCXXX category: 'NumerosNaturales'!
II subclass: #CCXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXX class' category: 'NumerosNaturales'!
CCXXX class
	instanceVariableNames: ''!

!CCXXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXI.
	prev := CCXXIX.! !


!classDefinition: #CCXXXI category: 'NumerosNaturales'!
II subclass: #CCXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXI class' category: 'NumerosNaturales'!
CCXXXI class
	instanceVariableNames: ''!

!CCXXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXII.
	prev := CCXXX.! !


!classDefinition: #CCXXXII category: 'NumerosNaturales'!
II subclass: #CCXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXII class' category: 'NumerosNaturales'!
CCXXXII class
	instanceVariableNames: ''!

!CCXXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXIII.
	prev := CCXXXI.! !


!classDefinition: #CCXXXIII category: 'NumerosNaturales'!
II subclass: #CCXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIII class' category: 'NumerosNaturales'!
CCXXXIII class
	instanceVariableNames: ''!

!CCXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXIV.
	prev := CCXXXII.! !


!classDefinition: #CCXXXIV category: 'NumerosNaturales'!
II subclass: #CCXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIV class' category: 'NumerosNaturales'!
CCXXXIV class
	instanceVariableNames: ''!

!CCXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXV.
	prev := CCXXXIII.! !


!classDefinition: #CCXXXIX category: 'NumerosNaturales'!
II subclass: #CCXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXIX class' category: 'NumerosNaturales'!
CCXXXIX class
	instanceVariableNames: ''!

!CCXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXL.
	prev := CCXXXVIII.! !


!classDefinition: #CCXXXV category: 'NumerosNaturales'!
II subclass: #CCXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXV class' category: 'NumerosNaturales'!
CCXXXV class
	instanceVariableNames: ''!

!CCXXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXVI.
	prev := CCXXXIV.! !


!classDefinition: #CCXXXVI category: 'NumerosNaturales'!
II subclass: #CCXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVI class' category: 'NumerosNaturales'!
CCXXXVI class
	instanceVariableNames: ''!

!CCXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXVII.
	prev := CCXXXV.! !


!classDefinition: #CCXXXVII category: 'NumerosNaturales'!
II subclass: #CCXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVII class' category: 'NumerosNaturales'!
CCXXXVII class
	instanceVariableNames: ''!

!CCXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXVIII.
	prev := CCXXXVI.! !


!classDefinition: #CCXXXVIII category: 'NumerosNaturales'!
II subclass: #CCXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CCXXXVIII class' category: 'NumerosNaturales'!
CCXXXVIII class
	instanceVariableNames: ''!

!CCXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CCXXXIX.
	prev := CCXXXVII.! !


!classDefinition: #CD category: 'NumerosNaturales'!
II subclass: #CD
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CD class' category: 'NumerosNaturales'!
CD class
	instanceVariableNames: ''!

!CD class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDI.
	prev := CCCXCIX.! !


!classDefinition: #CDI category: 'NumerosNaturales'!
II subclass: #CDI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDI class' category: 'NumerosNaturales'!
CDI class
	instanceVariableNames: ''!

!CDI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDII.
	prev := CD.! !


!classDefinition: #CDII category: 'NumerosNaturales'!
II subclass: #CDII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDII class' category: 'NumerosNaturales'!
CDII class
	instanceVariableNames: ''!

!CDII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDIII.
	prev := CDI.! !


!classDefinition: #CDIII category: 'NumerosNaturales'!
II subclass: #CDIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIII class' category: 'NumerosNaturales'!
CDIII class
	instanceVariableNames: ''!

!CDIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDIV.
	prev := CDII.! !


!classDefinition: #CDIV category: 'NumerosNaturales'!
II subclass: #CDIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIV class' category: 'NumerosNaturales'!
CDIV class
	instanceVariableNames: ''!

!CDIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDV.
	prev := CDIII.! !


!classDefinition: #CDIX category: 'NumerosNaturales'!
II subclass: #CDIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDIX class' category: 'NumerosNaturales'!
CDIX class
	instanceVariableNames: ''!

!CDIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDX.
	prev := CDVIII.! !


!classDefinition: #CDL category: 'NumerosNaturales'!
II subclass: #CDL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDL class' category: 'NumerosNaturales'!
CDL class
	instanceVariableNames: ''!

!CDL class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLI.
	prev := CDXLIX.! !


!classDefinition: #CDLI category: 'NumerosNaturales'!
II subclass: #CDLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLI class' category: 'NumerosNaturales'!
CDLI class
	instanceVariableNames: ''!

!CDLI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLII.
	prev := CDL.! !


!classDefinition: #CDLII category: 'NumerosNaturales'!
II subclass: #CDLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLII class' category: 'NumerosNaturales'!
CDLII class
	instanceVariableNames: ''!

!CDLII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:29'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLIII.
	prev := CDLI.! !


!classDefinition: #CDLIII category: 'NumerosNaturales'!
II subclass: #CDLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIII class' category: 'NumerosNaturales'!
CDLIII class
	instanceVariableNames: ''!

!CDLIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLIV.
	prev := CDLII.! !


!classDefinition: #CDLIV category: 'NumerosNaturales'!
II subclass: #CDLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIV class' category: 'NumerosNaturales'!
CDLIV class
	instanceVariableNames: ''!

!CDLIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLV.
	prev := CDLIII.! !


!classDefinition: #CDLIX category: 'NumerosNaturales'!
II subclass: #CDLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLIX class' category: 'NumerosNaturales'!
CDLIX class
	instanceVariableNames: ''!

!CDLIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLX.
	prev := CDLVIII.! !


!classDefinition: #CDLV category: 'NumerosNaturales'!
II subclass: #CDLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLV class' category: 'NumerosNaturales'!
CDLV class
	instanceVariableNames: ''!

!CDLV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLVI.
	prev := CDLIV.! !


!classDefinition: #CDLVI category: 'NumerosNaturales'!
II subclass: #CDLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVI class' category: 'NumerosNaturales'!
CDLVI class
	instanceVariableNames: ''!

!CDLVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLVII.
	prev := CDLV.! !


!classDefinition: #CDLVII category: 'NumerosNaturales'!
II subclass: #CDLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVII class' category: 'NumerosNaturales'!
CDLVII class
	instanceVariableNames: ''!

!CDLVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLVIII.
	prev := CDLVI.! !


!classDefinition: #CDLVIII category: 'NumerosNaturales'!
II subclass: #CDLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLVIII class' category: 'NumerosNaturales'!
CDLVIII class
	instanceVariableNames: ''!

!CDLVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLIX.
	prev := CDLVII.! !


!classDefinition: #CDLX category: 'NumerosNaturales'!
II subclass: #CDLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLX class' category: 'NumerosNaturales'!
CDLX class
	instanceVariableNames: ''!

!CDLX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXI.
	prev := CDLIX.! !


!classDefinition: #CDLXI category: 'NumerosNaturales'!
II subclass: #CDLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXI class' category: 'NumerosNaturales'!
CDLXI class
	instanceVariableNames: ''!

!CDLXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXII.
	prev := CDLX.! !


!classDefinition: #CDLXII category: 'NumerosNaturales'!
II subclass: #CDLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXII class' category: 'NumerosNaturales'!
CDLXII class
	instanceVariableNames: ''!

!CDLXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXIII.
	prev := CDLXI.! !


!classDefinition: #CDLXIII category: 'NumerosNaturales'!
II subclass: #CDLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIII class' category: 'NumerosNaturales'!
CDLXIII class
	instanceVariableNames: ''!

!CDLXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXIV.
	prev := CDLXII.! !


!classDefinition: #CDLXIV category: 'NumerosNaturales'!
II subclass: #CDLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIV class' category: 'NumerosNaturales'!
CDLXIV class
	instanceVariableNames: ''!

!CDLXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXV.
	prev := CDLXIII.! !


!classDefinition: #CDLXIX category: 'NumerosNaturales'!
II subclass: #CDLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXIX class' category: 'NumerosNaturales'!
CDLXIX class
	instanceVariableNames: ''!

!CDLXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXX.
	prev := CDLXVIII.! !


!classDefinition: #CDLXV category: 'NumerosNaturales'!
II subclass: #CDLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXV class' category: 'NumerosNaturales'!
CDLXV class
	instanceVariableNames: ''!

!CDLXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXVI.
	prev := CDLXIV.! !


!classDefinition: #CDLXVI category: 'NumerosNaturales'!
II subclass: #CDLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVI class' category: 'NumerosNaturales'!
CDLXVI class
	instanceVariableNames: ''!

!CDLXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXVII.
	prev := CDLXV.! !


!classDefinition: #CDLXVII category: 'NumerosNaturales'!
II subclass: #CDLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVII class' category: 'NumerosNaturales'!
CDLXVII class
	instanceVariableNames: ''!

!CDLXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXVIII.
	prev := CDLXVI.! !


!classDefinition: #CDLXVIII category: 'NumerosNaturales'!
II subclass: #CDLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXVIII class' category: 'NumerosNaturales'!
CDLXVIII class
	instanceVariableNames: ''!

!CDLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXIX.
	prev := CDLXVII.! !


!classDefinition: #CDLXX category: 'NumerosNaturales'!
II subclass: #CDLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXX class' category: 'NumerosNaturales'!
CDLXX class
	instanceVariableNames: ''!

!CDLXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXI.
	prev := CDLXIX.! !


!classDefinition: #CDLXXI category: 'NumerosNaturales'!
II subclass: #CDLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXI class' category: 'NumerosNaturales'!
CDLXXI class
	instanceVariableNames: ''!

!CDLXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXII.
	prev := CDLXX.! !


!classDefinition: #CDLXXII category: 'NumerosNaturales'!
II subclass: #CDLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXII class' category: 'NumerosNaturales'!
CDLXXII class
	instanceVariableNames: ''!

!CDLXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXIII.
	prev := CDLXXI.! !


!classDefinition: #CDLXXIII category: 'NumerosNaturales'!
II subclass: #CDLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIII class' category: 'NumerosNaturales'!
CDLXXIII class
	instanceVariableNames: ''!

!CDLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXIV.
	prev := CDLXXII.! !


!classDefinition: #CDLXXIV category: 'NumerosNaturales'!
II subclass: #CDLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIV class' category: 'NumerosNaturales'!
CDLXXIV class
	instanceVariableNames: ''!

!CDLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXV.
	prev := CDLXXIII.! !


!classDefinition: #CDLXXIX category: 'NumerosNaturales'!
II subclass: #CDLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXIX class' category: 'NumerosNaturales'!
CDLXXIX class
	instanceVariableNames: ''!

!CDLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXX.
	prev := CDLXXVIII.! !


!classDefinition: #CDLXXV category: 'NumerosNaturales'!
II subclass: #CDLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXV class' category: 'NumerosNaturales'!
CDLXXV class
	instanceVariableNames: ''!

!CDLXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXVI.
	prev := CDLXXIV.! !


!classDefinition: #CDLXXVI category: 'NumerosNaturales'!
II subclass: #CDLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVI class' category: 'NumerosNaturales'!
CDLXXVI class
	instanceVariableNames: ''!

!CDLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXVII.
	prev := CDLXXV.! !


!classDefinition: #CDLXXVII category: 'NumerosNaturales'!
II subclass: #CDLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVII class' category: 'NumerosNaturales'!
CDLXXVII class
	instanceVariableNames: ''!

!CDLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXVIII.
	prev := CDLXXVI.! !


!classDefinition: #CDLXXVIII category: 'NumerosNaturales'!
II subclass: #CDLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXVIII class' category: 'NumerosNaturales'!
CDLXXVIII class
	instanceVariableNames: ''!

!CDLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXIX.
	prev := CDLXXVII.! !


!classDefinition: #CDLXXX category: 'NumerosNaturales'!
II subclass: #CDLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXX class' category: 'NumerosNaturales'!
CDLXXX class
	instanceVariableNames: ''!

!CDLXXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXI.
	prev := CDLXXIX.! !


!classDefinition: #CDLXXXI category: 'NumerosNaturales'!
II subclass: #CDLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXI class' category: 'NumerosNaturales'!
CDLXXXI class
	instanceVariableNames: ''!

!CDLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXII.
	prev := CDLXXX.! !


!classDefinition: #CDLXXXII category: 'NumerosNaturales'!
II subclass: #CDLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXII class' category: 'NumerosNaturales'!
CDLXXXII class
	instanceVariableNames: ''!

!CDLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXIII.
	prev := CDLXXXI.! !


!classDefinition: #CDLXXXIII category: 'NumerosNaturales'!
II subclass: #CDLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIII class' category: 'NumerosNaturales'!
CDLXXXIII class
	instanceVariableNames: ''!

!CDLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXIV.
	prev := CDLXXXII.! !


!classDefinition: #CDLXXXIV category: 'NumerosNaturales'!
II subclass: #CDLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIV class' category: 'NumerosNaturales'!
CDLXXXIV class
	instanceVariableNames: ''!

!CDLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXV.
	prev := CDLXXXIII.! !


!classDefinition: #CDLXXXIX category: 'NumerosNaturales'!
II subclass: #CDLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXIX class' category: 'NumerosNaturales'!
CDLXXXIX class
	instanceVariableNames: ''!

!CDLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXC.
	prev := CDLXXXVIII.! !


!classDefinition: #CDLXXXV category: 'NumerosNaturales'!
II subclass: #CDLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXV class' category: 'NumerosNaturales'!
CDLXXXV class
	instanceVariableNames: ''!

!CDLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXVI.
	prev := CDLXXXIV.! !


!classDefinition: #CDLXXXVI category: 'NumerosNaturales'!
II subclass: #CDLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVI class' category: 'NumerosNaturales'!
CDLXXXVI class
	instanceVariableNames: ''!

!CDLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXVII.
	prev := CDLXXXV.! !


!classDefinition: #CDLXXXVII category: 'NumerosNaturales'!
II subclass: #CDLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVII class' category: 'NumerosNaturales'!
CDLXXXVII class
	instanceVariableNames: ''!

!CDLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXVIII.
	prev := CDLXXXVI.! !


!classDefinition: #CDLXXXVIII category: 'NumerosNaturales'!
II subclass: #CDLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDLXXXVIII class' category: 'NumerosNaturales'!
CDLXXXVIII class
	instanceVariableNames: ''!

!CDLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDLXXXIX.
	prev := CDLXXXVII.! !


!classDefinition: #CDV category: 'NumerosNaturales'!
II subclass: #CDV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDV class' category: 'NumerosNaturales'!
CDV class
	instanceVariableNames: ''!

!CDV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDVI.
	prev := CDIV.! !


!classDefinition: #CDVI category: 'NumerosNaturales'!
II subclass: #CDVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVI class' category: 'NumerosNaturales'!
CDVI class
	instanceVariableNames: ''!

!CDVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDVII.
	prev := CDV.! !


!classDefinition: #CDVII category: 'NumerosNaturales'!
II subclass: #CDVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVII class' category: 'NumerosNaturales'!
CDVII class
	instanceVariableNames: ''!

!CDVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDVIII.
	prev := CDVI.! !


!classDefinition: #CDVIII category: 'NumerosNaturales'!
II subclass: #CDVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDVIII class' category: 'NumerosNaturales'!
CDVIII class
	instanceVariableNames: ''!

!CDVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDIX.
	prev := CDVII.! !


!classDefinition: #CDX category: 'NumerosNaturales'!
II subclass: #CDX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDX class' category: 'NumerosNaturales'!
CDX class
	instanceVariableNames: ''!

!CDX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXI.
	prev := CDIX.! !


!classDefinition: #CDXC category: 'NumerosNaturales'!
II subclass: #CDXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXC class' category: 'NumerosNaturales'!
CDXC class
	instanceVariableNames: ''!

!CDXC class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCI.
	prev := CDLXXXIX.! !


!classDefinition: #CDXCI category: 'NumerosNaturales'!
II subclass: #CDXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCI class' category: 'NumerosNaturales'!
CDXCI class
	instanceVariableNames: ''!

!CDXCI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCII.
	prev := CDXC.! !


!classDefinition: #CDXCII category: 'NumerosNaturales'!
II subclass: #CDXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCII class' category: 'NumerosNaturales'!
CDXCII class
	instanceVariableNames: ''!

!CDXCII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCIII.
	prev := CDXCI.! !


!classDefinition: #CDXCIII category: 'NumerosNaturales'!
II subclass: #CDXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIII class' category: 'NumerosNaturales'!
CDXCIII class
	instanceVariableNames: ''!

!CDXCIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCIV.
	prev := CDXCII.! !


!classDefinition: #CDXCIV category: 'NumerosNaturales'!
II subclass: #CDXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIV class' category: 'NumerosNaturales'!
CDXCIV class
	instanceVariableNames: ''!

!CDXCIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCV.
	prev := CDXCIII.! !


!classDefinition: #CDXCIX category: 'NumerosNaturales'!
II subclass: #CDXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCIX class' category: 'NumerosNaturales'!
CDXCIX class
	instanceVariableNames: ''!

!CDXCIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := D.
	prev := CDXCVIII.! !


!classDefinition: #CDXCV category: 'NumerosNaturales'!
II subclass: #CDXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCV class' category: 'NumerosNaturales'!
CDXCV class
	instanceVariableNames: ''!

!CDXCV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCVI.
	prev := CDXCIV.! !


!classDefinition: #CDXCVI category: 'NumerosNaturales'!
II subclass: #CDXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVI class' category: 'NumerosNaturales'!
CDXCVI class
	instanceVariableNames: ''!

!CDXCVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCVII.
	prev := CDXCV.! !


!classDefinition: #CDXCVII category: 'NumerosNaturales'!
II subclass: #CDXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVII class' category: 'NumerosNaturales'!
CDXCVII class
	instanceVariableNames: ''!

!CDXCVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCVIII.
	prev := CDXCVI.! !


!classDefinition: #CDXCVIII category: 'NumerosNaturales'!
II subclass: #CDXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXCVIII class' category: 'NumerosNaturales'!
CDXCVIII class
	instanceVariableNames: ''!

!CDXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXCIX.
	prev := CDXCVII.! !


!classDefinition: #CDXI category: 'NumerosNaturales'!
II subclass: #CDXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXI class' category: 'NumerosNaturales'!
CDXI class
	instanceVariableNames: ''!

!CDXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXII.
	prev := CDX.! !


!classDefinition: #CDXII category: 'NumerosNaturales'!
II subclass: #CDXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXII class' category: 'NumerosNaturales'!
CDXII class
	instanceVariableNames: ''!

!CDXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXIII.
	prev := CDXI.! !


!classDefinition: #CDXIII category: 'NumerosNaturales'!
II subclass: #CDXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIII class' category: 'NumerosNaturales'!
CDXIII class
	instanceVariableNames: ''!

!CDXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXIV.
	prev := CDXII.! !


!classDefinition: #CDXIV category: 'NumerosNaturales'!
II subclass: #CDXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIV class' category: 'NumerosNaturales'!
CDXIV class
	instanceVariableNames: ''!

!CDXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXV.
	prev := CDXIII.! !


!classDefinition: #CDXIX category: 'NumerosNaturales'!
II subclass: #CDXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXIX class' category: 'NumerosNaturales'!
CDXIX class
	instanceVariableNames: ''!

!CDXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXX.
	prev := CDXVIII.! !


!classDefinition: #CDXL category: 'NumerosNaturales'!
II subclass: #CDXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXL class' category: 'NumerosNaturales'!
CDXL class
	instanceVariableNames: ''!

!CDXL class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLI.
	prev := CDXXXIX.! !


!classDefinition: #CDXLI category: 'NumerosNaturales'!
II subclass: #CDXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLI class' category: 'NumerosNaturales'!
CDXLI class
	instanceVariableNames: ''!

!CDXLI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLII.
	prev := CDXL.! !


!classDefinition: #CDXLII category: 'NumerosNaturales'!
II subclass: #CDXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLII class' category: 'NumerosNaturales'!
CDXLII class
	instanceVariableNames: ''!

!CDXLII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLIII.
	prev := CDXLI.! !


!classDefinition: #CDXLIII category: 'NumerosNaturales'!
II subclass: #CDXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIII class' category: 'NumerosNaturales'!
CDXLIII class
	instanceVariableNames: ''!

!CDXLIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLIV.
	prev := CDXLII.! !


!classDefinition: #CDXLIV category: 'NumerosNaturales'!
II subclass: #CDXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIV class' category: 'NumerosNaturales'!
CDXLIV class
	instanceVariableNames: ''!

!CDXLIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:30'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLV.
	prev := CDXLIII.! !


!classDefinition: #CDXLIX category: 'NumerosNaturales'!
II subclass: #CDXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLIX class' category: 'NumerosNaturales'!
CDXLIX class
	instanceVariableNames: ''!

!CDXLIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDL.
	prev := CDXLVIII.! !


!classDefinition: #CDXLV category: 'NumerosNaturales'!
II subclass: #CDXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLV class' category: 'NumerosNaturales'!
CDXLV class
	instanceVariableNames: ''!

!CDXLV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLVI.
	prev := CDXLIV.! !


!classDefinition: #CDXLVI category: 'NumerosNaturales'!
II subclass: #CDXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVI class' category: 'NumerosNaturales'!
CDXLVI class
	instanceVariableNames: ''!

!CDXLVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLVII.
	prev := CDXLV.! !


!classDefinition: #CDXLVII category: 'NumerosNaturales'!
II subclass: #CDXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVII class' category: 'NumerosNaturales'!
CDXLVII class
	instanceVariableNames: ''!

!CDXLVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLVIII.
	prev := CDXLVI.! !


!classDefinition: #CDXLVIII category: 'NumerosNaturales'!
II subclass: #CDXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXLVIII class' category: 'NumerosNaturales'!
CDXLVIII class
	instanceVariableNames: ''!

!CDXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXLIX.
	prev := CDXLVII.! !


!classDefinition: #CDXV category: 'NumerosNaturales'!
II subclass: #CDXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXV class' category: 'NumerosNaturales'!
CDXV class
	instanceVariableNames: ''!

!CDXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXVI.
	prev := CDXIV.! !


!classDefinition: #CDXVI category: 'NumerosNaturales'!
II subclass: #CDXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVI class' category: 'NumerosNaturales'!
CDXVI class
	instanceVariableNames: ''!

!CDXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXVII.
	prev := CDXV.! !


!classDefinition: #CDXVII category: 'NumerosNaturales'!
II subclass: #CDXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVII class' category: 'NumerosNaturales'!
CDXVII class
	instanceVariableNames: ''!

!CDXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXVIII.
	prev := CDXVI.! !


!classDefinition: #CDXVIII category: 'NumerosNaturales'!
II subclass: #CDXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXVIII class' category: 'NumerosNaturales'!
CDXVIII class
	instanceVariableNames: ''!

!CDXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXIX.
	prev := CDXVII.! !


!classDefinition: #CDXX category: 'NumerosNaturales'!
II subclass: #CDXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXX class' category: 'NumerosNaturales'!
CDXX class
	instanceVariableNames: ''!

!CDXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXI.
	prev := CDXIX.! !


!classDefinition: #CDXXI category: 'NumerosNaturales'!
II subclass: #CDXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXI class' category: 'NumerosNaturales'!
CDXXI class
	instanceVariableNames: ''!

!CDXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXII.
	prev := CDXX.! !


!classDefinition: #CDXXII category: 'NumerosNaturales'!
II subclass: #CDXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXII class' category: 'NumerosNaturales'!
CDXXII class
	instanceVariableNames: ''!

!CDXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXIII.
	prev := CDXXI.! !


!classDefinition: #CDXXIII category: 'NumerosNaturales'!
II subclass: #CDXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIII class' category: 'NumerosNaturales'!
CDXXIII class
	instanceVariableNames: ''!

!CDXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXIV.
	prev := CDXXII.! !


!classDefinition: #CDXXIV category: 'NumerosNaturales'!
II subclass: #CDXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIV class' category: 'NumerosNaturales'!
CDXXIV class
	instanceVariableNames: ''!

!CDXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXV.
	prev := CDXXIII.! !


!classDefinition: #CDXXIX category: 'NumerosNaturales'!
II subclass: #CDXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXIX class' category: 'NumerosNaturales'!
CDXXIX class
	instanceVariableNames: ''!

!CDXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXX.
	prev := CDXXVIII.! !


!classDefinition: #CDXXV category: 'NumerosNaturales'!
II subclass: #CDXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXV class' category: 'NumerosNaturales'!
CDXXV class
	instanceVariableNames: ''!

!CDXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXVI.
	prev := CDXXIV.! !


!classDefinition: #CDXXVI category: 'NumerosNaturales'!
II subclass: #CDXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVI class' category: 'NumerosNaturales'!
CDXXVI class
	instanceVariableNames: ''!

!CDXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXVII.
	prev := CDXXV.! !


!classDefinition: #CDXXVII category: 'NumerosNaturales'!
II subclass: #CDXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVII class' category: 'NumerosNaturales'!
CDXXVII class
	instanceVariableNames: ''!

!CDXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXVIII.
	prev := CDXXVI.! !


!classDefinition: #CDXXVIII category: 'NumerosNaturales'!
II subclass: #CDXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXVIII class' category: 'NumerosNaturales'!
CDXXVIII class
	instanceVariableNames: ''!

!CDXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXIX.
	prev := CDXXVII.! !


!classDefinition: #CDXXX category: 'NumerosNaturales'!
II subclass: #CDXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXX class' category: 'NumerosNaturales'!
CDXXX class
	instanceVariableNames: ''!

!CDXXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXI.
	prev := CDXXIX.! !


!classDefinition: #CDXXXI category: 'NumerosNaturales'!
II subclass: #CDXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXI class' category: 'NumerosNaturales'!
CDXXXI class
	instanceVariableNames: ''!

!CDXXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXII.
	prev := CDXXX.! !


!classDefinition: #CDXXXII category: 'NumerosNaturales'!
II subclass: #CDXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXII class' category: 'NumerosNaturales'!
CDXXXII class
	instanceVariableNames: ''!

!CDXXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXIII.
	prev := CDXXXI.! !


!classDefinition: #CDXXXIII category: 'NumerosNaturales'!
II subclass: #CDXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIII class' category: 'NumerosNaturales'!
CDXXXIII class
	instanceVariableNames: ''!

!CDXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXIV.
	prev := CDXXXII.! !


!classDefinition: #CDXXXIV category: 'NumerosNaturales'!
II subclass: #CDXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIV class' category: 'NumerosNaturales'!
CDXXXIV class
	instanceVariableNames: ''!

!CDXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXV.
	prev := CDXXXIII.! !


!classDefinition: #CDXXXIX category: 'NumerosNaturales'!
II subclass: #CDXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXIX class' category: 'NumerosNaturales'!
CDXXXIX class
	instanceVariableNames: ''!

!CDXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXL.
	prev := CDXXXVIII.! !


!classDefinition: #CDXXXV category: 'NumerosNaturales'!
II subclass: #CDXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXV class' category: 'NumerosNaturales'!
CDXXXV class
	instanceVariableNames: ''!

!CDXXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXVI.
	prev := CDXXXIV.! !


!classDefinition: #CDXXXVI category: 'NumerosNaturales'!
II subclass: #CDXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVI class' category: 'NumerosNaturales'!
CDXXXVI class
	instanceVariableNames: ''!

!CDXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXVII.
	prev := CDXXXV.! !


!classDefinition: #CDXXXVII category: 'NumerosNaturales'!
II subclass: #CDXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVII class' category: 'NumerosNaturales'!
CDXXXVII class
	instanceVariableNames: ''!

!CDXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXVIII.
	prev := CDXXXVI.! !


!classDefinition: #CDXXXVIII category: 'NumerosNaturales'!
II subclass: #CDXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CDXXXVIII class' category: 'NumerosNaturales'!
CDXXXVIII class
	instanceVariableNames: ''!

!CDXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CDXXXIX.
	prev := CDXXXVII.! !


!classDefinition: #CI category: 'NumerosNaturales'!
II subclass: #CI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CI class' category: 'NumerosNaturales'!
CI class
	instanceVariableNames: ''!

!CI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CII.
	prev := C.! !


!classDefinition: #CII category: 'NumerosNaturales'!
II subclass: #CII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CII class' category: 'NumerosNaturales'!
CII class
	instanceVariableNames: ''!

!CII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CIII.
	prev := CI.! !


!classDefinition: #CIII category: 'NumerosNaturales'!
II subclass: #CIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIII class' category: 'NumerosNaturales'!
CIII class
	instanceVariableNames: ''!

!CIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CIV.
	prev := CII.! !


!classDefinition: #CIV category: 'NumerosNaturales'!
II subclass: #CIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIV class' category: 'NumerosNaturales'!
CIV class
	instanceVariableNames: ''!

!CIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CV.
	prev := CIII.! !


!classDefinition: #CIX category: 'NumerosNaturales'!
II subclass: #CIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CIX class' category: 'NumerosNaturales'!
CIX class
	instanceVariableNames: ''!

!CIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CX.
	prev := CVIII.! !


!classDefinition: #CL category: 'NumerosNaturales'!
II subclass: #CL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CL class' category: 'NumerosNaturales'!
CL class
	instanceVariableNames: ''!

!CL class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLI.
	prev := CXLIX.! !


!classDefinition: #CLI category: 'NumerosNaturales'!
II subclass: #CLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLI class' category: 'NumerosNaturales'!
CLI class
	instanceVariableNames: ''!

!CLI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLII.
	prev := CL.! !


!classDefinition: #CLII category: 'NumerosNaturales'!
II subclass: #CLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLII class' category: 'NumerosNaturales'!
CLII class
	instanceVariableNames: ''!

!CLII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLIII.
	prev := CLI.! !


!classDefinition: #CLIII category: 'NumerosNaturales'!
II subclass: #CLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIII class' category: 'NumerosNaturales'!
CLIII class
	instanceVariableNames: ''!

!CLIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLIV.
	prev := CLII.! !


!classDefinition: #CLIV category: 'NumerosNaturales'!
II subclass: #CLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIV class' category: 'NumerosNaturales'!
CLIV class
	instanceVariableNames: ''!

!CLIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLV.
	prev := CLIII.! !


!classDefinition: #CLIX category: 'NumerosNaturales'!
II subclass: #CLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLIX class' category: 'NumerosNaturales'!
CLIX class
	instanceVariableNames: ''!

!CLIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLX.
	prev := CLVIII.! !


!classDefinition: #CLV category: 'NumerosNaturales'!
II subclass: #CLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLV class' category: 'NumerosNaturales'!
CLV class
	instanceVariableNames: ''!

!CLV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLVI.
	prev := CLIV.! !


!classDefinition: #CLVI category: 'NumerosNaturales'!
II subclass: #CLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVI class' category: 'NumerosNaturales'!
CLVI class
	instanceVariableNames: ''!

!CLVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLVII.
	prev := CLV.! !


!classDefinition: #CLVII category: 'NumerosNaturales'!
II subclass: #CLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVII class' category: 'NumerosNaturales'!
CLVII class
	instanceVariableNames: ''!

!CLVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLVIII.
	prev := CLVI.! !


!classDefinition: #CLVIII category: 'NumerosNaturales'!
II subclass: #CLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLVIII class' category: 'NumerosNaturales'!
CLVIII class
	instanceVariableNames: ''!

!CLVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLIX.
	prev := CLVII.! !


!classDefinition: #CLX category: 'NumerosNaturales'!
II subclass: #CLX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLX class' category: 'NumerosNaturales'!
CLX class
	instanceVariableNames: ''!

!CLX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXI.
	prev := CLIX.! !


!classDefinition: #CLXI category: 'NumerosNaturales'!
II subclass: #CLXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXI class' category: 'NumerosNaturales'!
CLXI class
	instanceVariableNames: ''!

!CLXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXII.
	prev := CLX.! !


!classDefinition: #CLXII category: 'NumerosNaturales'!
II subclass: #CLXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXII class' category: 'NumerosNaturales'!
CLXII class
	instanceVariableNames: ''!

!CLXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXIII.
	prev := CLXI.! !


!classDefinition: #CLXIII category: 'NumerosNaturales'!
II subclass: #CLXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIII class' category: 'NumerosNaturales'!
CLXIII class
	instanceVariableNames: ''!

!CLXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXIV.
	prev := CLXII.! !


!classDefinition: #CLXIV category: 'NumerosNaturales'!
II subclass: #CLXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIV class' category: 'NumerosNaturales'!
CLXIV class
	instanceVariableNames: ''!

!CLXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXV.
	prev := CLXIII.! !


!classDefinition: #CLXIX category: 'NumerosNaturales'!
II subclass: #CLXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXIX class' category: 'NumerosNaturales'!
CLXIX class
	instanceVariableNames: ''!

!CLXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXX.
	prev := CLXVIII.! !


!classDefinition: #CLXV category: 'NumerosNaturales'!
II subclass: #CLXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXV class' category: 'NumerosNaturales'!
CLXV class
	instanceVariableNames: ''!

!CLXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXVI.
	prev := CLXIV.! !


!classDefinition: #CLXVI category: 'NumerosNaturales'!
II subclass: #CLXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVI class' category: 'NumerosNaturales'!
CLXVI class
	instanceVariableNames: ''!

!CLXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXVII.
	prev := CLXV.! !


!classDefinition: #CLXVII category: 'NumerosNaturales'!
II subclass: #CLXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVII class' category: 'NumerosNaturales'!
CLXVII class
	instanceVariableNames: ''!

!CLXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXVIII.
	prev := CLXVI.! !


!classDefinition: #CLXVIII category: 'NumerosNaturales'!
II subclass: #CLXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXVIII class' category: 'NumerosNaturales'!
CLXVIII class
	instanceVariableNames: ''!

!CLXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXIX.
	prev := CLXVII.! !


!classDefinition: #CLXX category: 'NumerosNaturales'!
II subclass: #CLXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXX class' category: 'NumerosNaturales'!
CLXX class
	instanceVariableNames: ''!

!CLXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXI.
	prev := CLXIX.! !


!classDefinition: #CLXXI category: 'NumerosNaturales'!
II subclass: #CLXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXI class' category: 'NumerosNaturales'!
CLXXI class
	instanceVariableNames: ''!

!CLXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXII.
	prev := CLXX.! !


!classDefinition: #CLXXII category: 'NumerosNaturales'!
II subclass: #CLXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXII class' category: 'NumerosNaturales'!
CLXXII class
	instanceVariableNames: ''!

!CLXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXIII.
	prev := CLXXI.! !


!classDefinition: #CLXXIII category: 'NumerosNaturales'!
II subclass: #CLXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIII class' category: 'NumerosNaturales'!
CLXXIII class
	instanceVariableNames: ''!

!CLXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXIV.
	prev := CLXXII.! !


!classDefinition: #CLXXIV category: 'NumerosNaturales'!
II subclass: #CLXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIV class' category: 'NumerosNaturales'!
CLXXIV class
	instanceVariableNames: ''!

!CLXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXV.
	prev := CLXXIII.! !


!classDefinition: #CLXXIX category: 'NumerosNaturales'!
II subclass: #CLXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXIX class' category: 'NumerosNaturales'!
CLXXIX class
	instanceVariableNames: ''!

!CLXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXX.
	prev := CLXXVIII.! !


!classDefinition: #CLXXV category: 'NumerosNaturales'!
II subclass: #CLXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXV class' category: 'NumerosNaturales'!
CLXXV class
	instanceVariableNames: ''!

!CLXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:31'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXVI.
	prev := CLXXIV.! !


!classDefinition: #CLXXVI category: 'NumerosNaturales'!
II subclass: #CLXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVI class' category: 'NumerosNaturales'!
CLXXVI class
	instanceVariableNames: ''!

!CLXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXVII.
	prev := CLXXV.! !


!classDefinition: #CLXXVII category: 'NumerosNaturales'!
II subclass: #CLXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVII class' category: 'NumerosNaturales'!
CLXXVII class
	instanceVariableNames: ''!

!CLXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXVIII.
	prev := CLXXVI.! !


!classDefinition: #CLXXVIII category: 'NumerosNaturales'!
II subclass: #CLXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXVIII class' category: 'NumerosNaturales'!
CLXXVIII class
	instanceVariableNames: ''!

!CLXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXIX.
	prev := CLXXVII.! !


!classDefinition: #CLXXX category: 'NumerosNaturales'!
II subclass: #CLXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXX class' category: 'NumerosNaturales'!
CLXXX class
	instanceVariableNames: ''!

!CLXXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXI.
	prev := CLXXIX.! !


!classDefinition: #CLXXXI category: 'NumerosNaturales'!
II subclass: #CLXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXI class' category: 'NumerosNaturales'!
CLXXXI class
	instanceVariableNames: ''!

!CLXXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXII.
	prev := CLXXX.! !


!classDefinition: #CLXXXII category: 'NumerosNaturales'!
II subclass: #CLXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXII class' category: 'NumerosNaturales'!
CLXXXII class
	instanceVariableNames: ''!

!CLXXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXIII.
	prev := CLXXXI.! !


!classDefinition: #CLXXXIII category: 'NumerosNaturales'!
II subclass: #CLXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIII class' category: 'NumerosNaturales'!
CLXXXIII class
	instanceVariableNames: ''!

!CLXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXIV.
	prev := CLXXXII.! !


!classDefinition: #CLXXXIV category: 'NumerosNaturales'!
II subclass: #CLXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIV class' category: 'NumerosNaturales'!
CLXXXIV class
	instanceVariableNames: ''!

!CLXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXV.
	prev := CLXXXIII.! !


!classDefinition: #CLXXXIX category: 'NumerosNaturales'!
II subclass: #CLXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXIX class' category: 'NumerosNaturales'!
CLXXXIX class
	instanceVariableNames: ''!

!CLXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXC.
	prev := CLXXXVIII.! !


!classDefinition: #CLXXXV category: 'NumerosNaturales'!
II subclass: #CLXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXV class' category: 'NumerosNaturales'!
CLXXXV class
	instanceVariableNames: ''!

!CLXXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXVI.
	prev := CLXXXIV.! !


!classDefinition: #CLXXXVI category: 'NumerosNaturales'!
II subclass: #CLXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVI class' category: 'NumerosNaturales'!
CLXXXVI class
	instanceVariableNames: ''!

!CLXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXVII.
	prev := CLXXXV.! !


!classDefinition: #CLXXXVII category: 'NumerosNaturales'!
II subclass: #CLXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVII class' category: 'NumerosNaturales'!
CLXXXVII class
	instanceVariableNames: ''!

!CLXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXVIII.
	prev := CLXXXVI.! !


!classDefinition: #CLXXXVIII category: 'NumerosNaturales'!
II subclass: #CLXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CLXXXVIII class' category: 'NumerosNaturales'!
CLXXXVIII class
	instanceVariableNames: ''!

!CLXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CLXXXIX.
	prev := CLXXXVII.! !


!classDefinition: #CV category: 'NumerosNaturales'!
II subclass: #CV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CV class' category: 'NumerosNaturales'!
CV class
	instanceVariableNames: ''!

!CV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CVI.
	prev := CIV.! !


!classDefinition: #CVI category: 'NumerosNaturales'!
II subclass: #CVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVI class' category: 'NumerosNaturales'!
CVI class
	instanceVariableNames: ''!

!CVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CVII.
	prev := CV.! !


!classDefinition: #CVII category: 'NumerosNaturales'!
II subclass: #CVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVII class' category: 'NumerosNaturales'!
CVII class
	instanceVariableNames: ''!

!CVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CVIII.
	prev := CVI.! !


!classDefinition: #CVIII category: 'NumerosNaturales'!
II subclass: #CVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CVIII class' category: 'NumerosNaturales'!
CVIII class
	instanceVariableNames: ''!

!CVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CIX.
	prev := CVII.! !


!classDefinition: #CX category: 'NumerosNaturales'!
II subclass: #CX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CX class' category: 'NumerosNaturales'!
CX class
	instanceVariableNames: ''!

!CX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXI.
	prev := CIX.! !


!classDefinition: #CXC category: 'NumerosNaturales'!
II subclass: #CXC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXC class' category: 'NumerosNaturales'!
CXC class
	instanceVariableNames: ''!

!CXC class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCI.
	prev := CLXXXIX.! !


!classDefinition: #CXCI category: 'NumerosNaturales'!
II subclass: #CXCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCI class' category: 'NumerosNaturales'!
CXCI class
	instanceVariableNames: ''!

!CXCI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCII.
	prev := CXC.! !


!classDefinition: #CXCII category: 'NumerosNaturales'!
II subclass: #CXCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCII class' category: 'NumerosNaturales'!
CXCII class
	instanceVariableNames: ''!

!CXCII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCIII.
	prev := CXCI.! !


!classDefinition: #CXCIII category: 'NumerosNaturales'!
II subclass: #CXCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIII class' category: 'NumerosNaturales'!
CXCIII class
	instanceVariableNames: ''!

!CXCIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCIV.
	prev := CXCII.! !


!classDefinition: #CXCIV category: 'NumerosNaturales'!
II subclass: #CXCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIV class' category: 'NumerosNaturales'!
CXCIV class
	instanceVariableNames: ''!

!CXCIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCV.
	prev := CXCIII.! !


!classDefinition: #CXCIX category: 'NumerosNaturales'!
II subclass: #CXCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCIX class' category: 'NumerosNaturales'!
CXCIX class
	instanceVariableNames: ''!

!CXCIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CC.
	prev := CXCVIII.! !


!classDefinition: #CXCV category: 'NumerosNaturales'!
II subclass: #CXCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCV class' category: 'NumerosNaturales'!
CXCV class
	instanceVariableNames: ''!

!CXCV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCVI.
	prev := CXCIV.! !


!classDefinition: #CXCVI category: 'NumerosNaturales'!
II subclass: #CXCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVI class' category: 'NumerosNaturales'!
CXCVI class
	instanceVariableNames: ''!

!CXCVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCVII.
	prev := CXCV.! !


!classDefinition: #CXCVII category: 'NumerosNaturales'!
II subclass: #CXCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVII class' category: 'NumerosNaturales'!
CXCVII class
	instanceVariableNames: ''!

!CXCVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCVIII.
	prev := CXCVI.! !


!classDefinition: #CXCVIII category: 'NumerosNaturales'!
II subclass: #CXCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXCVIII class' category: 'NumerosNaturales'!
CXCVIII class
	instanceVariableNames: ''!

!CXCVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXCIX.
	prev := CXCVII.! !


!classDefinition: #CXI category: 'NumerosNaturales'!
II subclass: #CXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXI class' category: 'NumerosNaturales'!
CXI class
	instanceVariableNames: ''!

!CXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXII.
	prev := CX.! !


!classDefinition: #CXII category: 'NumerosNaturales'!
II subclass: #CXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXII class' category: 'NumerosNaturales'!
CXII class
	instanceVariableNames: ''!

!CXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXIII.
	prev := CXI.! !


!classDefinition: #CXIII category: 'NumerosNaturales'!
II subclass: #CXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIII class' category: 'NumerosNaturales'!
CXIII class
	instanceVariableNames: ''!

!CXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXIV.
	prev := CXII.! !


!classDefinition: #CXIV category: 'NumerosNaturales'!
II subclass: #CXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIV class' category: 'NumerosNaturales'!
CXIV class
	instanceVariableNames: ''!

!CXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXV.
	prev := CXIII.! !


!classDefinition: #CXIX category: 'NumerosNaturales'!
II subclass: #CXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXIX class' category: 'NumerosNaturales'!
CXIX class
	instanceVariableNames: ''!

!CXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXX.
	prev := CXVIII.! !


!classDefinition: #CXL category: 'NumerosNaturales'!
II subclass: #CXL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXL class' category: 'NumerosNaturales'!
CXL class
	instanceVariableNames: ''!

!CXL class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLI.
	prev := CXXXIX.! !


!classDefinition: #CXLI category: 'NumerosNaturales'!
II subclass: #CXLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLI class' category: 'NumerosNaturales'!
CXLI class
	instanceVariableNames: ''!

!CXLI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLII.
	prev := CXL.! !


!classDefinition: #CXLII category: 'NumerosNaturales'!
II subclass: #CXLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLII class' category: 'NumerosNaturales'!
CXLII class
	instanceVariableNames: ''!

!CXLII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLIII.
	prev := CXLI.! !


!classDefinition: #CXLIII category: 'NumerosNaturales'!
II subclass: #CXLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIII class' category: 'NumerosNaturales'!
CXLIII class
	instanceVariableNames: ''!

!CXLIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLIV.
	prev := CXLII.! !


!classDefinition: #CXLIV category: 'NumerosNaturales'!
II subclass: #CXLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIV class' category: 'NumerosNaturales'!
CXLIV class
	instanceVariableNames: ''!

!CXLIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLV.
	prev := CXLIII.! !


!classDefinition: #CXLIX category: 'NumerosNaturales'!
II subclass: #CXLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLIX class' category: 'NumerosNaturales'!
CXLIX class
	instanceVariableNames: ''!

!CXLIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CL.
	prev := CXLVIII.! !


!classDefinition: #CXLV category: 'NumerosNaturales'!
II subclass: #CXLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLV class' category: 'NumerosNaturales'!
CXLV class
	instanceVariableNames: ''!

!CXLV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLVI.
	prev := CXLIV.! !


!classDefinition: #CXLVI category: 'NumerosNaturales'!
II subclass: #CXLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVI class' category: 'NumerosNaturales'!
CXLVI class
	instanceVariableNames: ''!

!CXLVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLVII.
	prev := CXLV.! !


!classDefinition: #CXLVII category: 'NumerosNaturales'!
II subclass: #CXLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVII class' category: 'NumerosNaturales'!
CXLVII class
	instanceVariableNames: ''!

!CXLVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLVIII.
	prev := CXLVI.! !


!classDefinition: #CXLVIII category: 'NumerosNaturales'!
II subclass: #CXLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXLVIII class' category: 'NumerosNaturales'!
CXLVIII class
	instanceVariableNames: ''!

!CXLVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXLIX.
	prev := CXLVII.! !


!classDefinition: #CXV category: 'NumerosNaturales'!
II subclass: #CXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXV class' category: 'NumerosNaturales'!
CXV class
	instanceVariableNames: ''!

!CXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXVI.
	prev := CXIV.! !


!classDefinition: #CXVI category: 'NumerosNaturales'!
II subclass: #CXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVI class' category: 'NumerosNaturales'!
CXVI class
	instanceVariableNames: ''!

!CXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXVII.
	prev := CXV.! !


!classDefinition: #CXVII category: 'NumerosNaturales'!
II subclass: #CXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVII class' category: 'NumerosNaturales'!
CXVII class
	instanceVariableNames: ''!

!CXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXVIII.
	prev := CXVI.! !


!classDefinition: #CXVIII category: 'NumerosNaturales'!
II subclass: #CXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXVIII class' category: 'NumerosNaturales'!
CXVIII class
	instanceVariableNames: ''!

!CXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXIX.
	prev := CXVII.! !


!classDefinition: #CXX category: 'NumerosNaturales'!
II subclass: #CXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXX class' category: 'NumerosNaturales'!
CXX class
	instanceVariableNames: ''!

!CXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXI.
	prev := CXIX.! !


!classDefinition: #CXXI category: 'NumerosNaturales'!
II subclass: #CXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXI class' category: 'NumerosNaturales'!
CXXI class
	instanceVariableNames: ''!

!CXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXII.
	prev := CXX.! !


!classDefinition: #CXXII category: 'NumerosNaturales'!
II subclass: #CXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXII class' category: 'NumerosNaturales'!
CXXII class
	instanceVariableNames: ''!

!CXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXIII.
	prev := CXXI.! !


!classDefinition: #CXXIII category: 'NumerosNaturales'!
II subclass: #CXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIII class' category: 'NumerosNaturales'!
CXXIII class
	instanceVariableNames: ''!

!CXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXIV.
	prev := CXXII.! !


!classDefinition: #CXXIV category: 'NumerosNaturales'!
II subclass: #CXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIV class' category: 'NumerosNaturales'!
CXXIV class
	instanceVariableNames: ''!

!CXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXV.
	prev := CXXIII.! !


!classDefinition: #CXXIX category: 'NumerosNaturales'!
II subclass: #CXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXIX class' category: 'NumerosNaturales'!
CXXIX class
	instanceVariableNames: ''!

!CXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXX.
	prev := CXXVIII.! !


!classDefinition: #CXXV category: 'NumerosNaturales'!
II subclass: #CXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXV class' category: 'NumerosNaturales'!
CXXV class
	instanceVariableNames: ''!

!CXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXVI.
	prev := CXXIV.! !


!classDefinition: #CXXVI category: 'NumerosNaturales'!
II subclass: #CXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVI class' category: 'NumerosNaturales'!
CXXVI class
	instanceVariableNames: ''!

!CXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXVII.
	prev := CXXV.! !


!classDefinition: #CXXVII category: 'NumerosNaturales'!
II subclass: #CXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVII class' category: 'NumerosNaturales'!
CXXVII class
	instanceVariableNames: ''!

!CXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXVIII.
	prev := CXXVI.! !


!classDefinition: #CXXVIII category: 'NumerosNaturales'!
II subclass: #CXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXVIII class' category: 'NumerosNaturales'!
CXXVIII class
	instanceVariableNames: ''!

!CXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXIX.
	prev := CXXVII.! !


!classDefinition: #CXXX category: 'NumerosNaturales'!
II subclass: #CXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXX class' category: 'NumerosNaturales'!
CXXX class
	instanceVariableNames: ''!

!CXXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXI.
	prev := CXXIX.! !


!classDefinition: #CXXXI category: 'NumerosNaturales'!
II subclass: #CXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXI class' category: 'NumerosNaturales'!
CXXXI class
	instanceVariableNames: ''!

!CXXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXII.
	prev := CXXX.! !


!classDefinition: #CXXXII category: 'NumerosNaturales'!
II subclass: #CXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXII class' category: 'NumerosNaturales'!
CXXXII class
	instanceVariableNames: ''!

!CXXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:32'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXIII.
	prev := CXXXI.! !


!classDefinition: #CXXXIII category: 'NumerosNaturales'!
II subclass: #CXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIII class' category: 'NumerosNaturales'!
CXXXIII class
	instanceVariableNames: ''!

!CXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXIV.
	prev := CXXXII.! !


!classDefinition: #CXXXIV category: 'NumerosNaturales'!
II subclass: #CXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIV class' category: 'NumerosNaturales'!
CXXXIV class
	instanceVariableNames: ''!

!CXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXV.
	prev := CXXXIII.! !


!classDefinition: #CXXXIX category: 'NumerosNaturales'!
II subclass: #CXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXIX class' category: 'NumerosNaturales'!
CXXXIX class
	instanceVariableNames: ''!

!CXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXL.
	prev := CXXXVIII.! !


!classDefinition: #CXXXV category: 'NumerosNaturales'!
II subclass: #CXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXV class' category: 'NumerosNaturales'!
CXXXV class
	instanceVariableNames: ''!

!CXXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXVI.
	prev := CXXXIV.! !


!classDefinition: #CXXXVI category: 'NumerosNaturales'!
II subclass: #CXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVI class' category: 'NumerosNaturales'!
CXXXVI class
	instanceVariableNames: ''!

!CXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXVII.
	prev := CXXXV.! !


!classDefinition: #CXXXVII category: 'NumerosNaturales'!
II subclass: #CXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVII class' category: 'NumerosNaturales'!
CXXXVII class
	instanceVariableNames: ''!

!CXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXVIII.
	prev := CXXXVI.! !


!classDefinition: #CXXXVIII category: 'NumerosNaturales'!
II subclass: #CXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CXXXVIII class' category: 'NumerosNaturales'!
CXXXVIII class
	instanceVariableNames: ''!

!CXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := CXXXIX.
	prev := CXXXVII.! !


!classDefinition: #D category: 'NumerosNaturales'!
II subclass: #D
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'D class' category: 'NumerosNaturales'!
D class
	instanceVariableNames: ''!

!D class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := nil.
	prev := CDXCIX.! !


!classDefinition: #III category: 'NumerosNaturales'!
II subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: 'NumerosNaturales'!
III class
	instanceVariableNames: ''!

!III class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IV.
	prev := II.! !


!classDefinition: #IV category: 'NumerosNaturales'!
II subclass: #IV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IV class' category: 'NumerosNaturales'!
IV class
	instanceVariableNames: ''!

!IV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := V.
	prev := III.! !


!classDefinition: #IX category: 'NumerosNaturales'!
II subclass: #IX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IX class' category: 'NumerosNaturales'!
IX class
	instanceVariableNames: ''!

!IX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := X.
	prev := VIII.! !


!classDefinition: #L category: 'NumerosNaturales'!
II subclass: #L
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'L class' category: 'NumerosNaturales'!
L class
	instanceVariableNames: ''!

!L class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LI.
	prev := XLIX.! !


!classDefinition: #LI category: 'NumerosNaturales'!
II subclass: #LI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LI class' category: 'NumerosNaturales'!
LI class
	instanceVariableNames: ''!

!LI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LII.
	prev := L.! !


!classDefinition: #LII category: 'NumerosNaturales'!
II subclass: #LII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LII class' category: 'NumerosNaturales'!
LII class
	instanceVariableNames: ''!

!LII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIII.
	prev := LI.! !


!classDefinition: #LIII category: 'NumerosNaturales'!
II subclass: #LIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIII class' category: 'NumerosNaturales'!
LIII class
	instanceVariableNames: ''!

!LIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIV.
	prev := LII.! !


!classDefinition: #LIV category: 'NumerosNaturales'!
II subclass: #LIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIV class' category: 'NumerosNaturales'!
LIV class
	instanceVariableNames: ''!

!LIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LV.
	prev := LIII.! !


!classDefinition: #LIX category: 'NumerosNaturales'!
II subclass: #LIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LIX class' category: 'NumerosNaturales'!
LIX class
	instanceVariableNames: ''!

!LIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LX.
	prev := LVIII.! !


!classDefinition: #LV category: 'NumerosNaturales'!
II subclass: #LV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LV class' category: 'NumerosNaturales'!
LV class
	instanceVariableNames: ''!

!LV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVI.
	prev := LIV.! !


!classDefinition: #LVI category: 'NumerosNaturales'!
II subclass: #LVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVI class' category: 'NumerosNaturales'!
LVI class
	instanceVariableNames: ''!

!LVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVII.
	prev := LV.! !


!classDefinition: #LVII category: 'NumerosNaturales'!
II subclass: #LVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVII class' category: 'NumerosNaturales'!
LVII class
	instanceVariableNames: ''!

!LVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LVIII.
	prev := LVI.! !


!classDefinition: #LVIII category: 'NumerosNaturales'!
II subclass: #LVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LVIII class' category: 'NumerosNaturales'!
LVIII class
	instanceVariableNames: ''!

!LVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LIX.
	prev := LVII.! !


!classDefinition: #LX category: 'NumerosNaturales'!
II subclass: #LX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LX class' category: 'NumerosNaturales'!
LX class
	instanceVariableNames: ''!

!LX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXI.
	prev := LIX.! !


!classDefinition: #LXI category: 'NumerosNaturales'!
II subclass: #LXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXI class' category: 'NumerosNaturales'!
LXI class
	instanceVariableNames: ''!

!LXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXII.
	prev := LX.! !


!classDefinition: #LXII category: 'NumerosNaturales'!
II subclass: #LXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXII class' category: 'NumerosNaturales'!
LXII class
	instanceVariableNames: ''!

!LXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIII.
	prev := LXI.! !


!classDefinition: #LXIII category: 'NumerosNaturales'!
II subclass: #LXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIII class' category: 'NumerosNaturales'!
LXIII class
	instanceVariableNames: ''!

!LXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIV.
	prev := LXII.! !


!classDefinition: #LXIV category: 'NumerosNaturales'!
II subclass: #LXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIV class' category: 'NumerosNaturales'!
LXIV class
	instanceVariableNames: ''!

!LXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXV.
	prev := LXIII.! !


!classDefinition: #LXIX category: 'NumerosNaturales'!
II subclass: #LXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXIX class' category: 'NumerosNaturales'!
LXIX class
	instanceVariableNames: ''!

!LXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXX.
	prev := LXVIII.! !


!classDefinition: #LXV category: 'NumerosNaturales'!
II subclass: #LXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXV class' category: 'NumerosNaturales'!
LXV class
	instanceVariableNames: ''!

!LXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVI.
	prev := LXIV.! !


!classDefinition: #LXVI category: 'NumerosNaturales'!
II subclass: #LXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVI class' category: 'NumerosNaturales'!
LXVI class
	instanceVariableNames: ''!

!LXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVII.
	prev := LXV.! !


!classDefinition: #LXVII category: 'NumerosNaturales'!
II subclass: #LXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVII class' category: 'NumerosNaturales'!
LXVII class
	instanceVariableNames: ''!

!LXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXVIII.
	prev := LXVI.! !


!classDefinition: #LXVIII category: 'NumerosNaturales'!
II subclass: #LXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXVIII class' category: 'NumerosNaturales'!
LXVIII class
	instanceVariableNames: ''!

!LXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXIX.
	prev := LXVII.! !


!classDefinition: #LXX category: 'NumerosNaturales'!
II subclass: #LXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXX class' category: 'NumerosNaturales'!
LXX class
	instanceVariableNames: ''!

!LXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXI.
	prev := LXIX.! !


!classDefinition: #LXXI category: 'NumerosNaturales'!
II subclass: #LXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXI class' category: 'NumerosNaturales'!
LXXI class
	instanceVariableNames: ''!

!LXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXII.
	prev := LXX.! !


!classDefinition: #LXXII category: 'NumerosNaturales'!
II subclass: #LXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXII class' category: 'NumerosNaturales'!
LXXII class
	instanceVariableNames: ''!

!LXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIII.
	prev := LXXI.! !


!classDefinition: #LXXIII category: 'NumerosNaturales'!
II subclass: #LXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIII class' category: 'NumerosNaturales'!
LXXIII class
	instanceVariableNames: ''!

!LXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIV.
	prev := LXXII.! !


!classDefinition: #LXXIV category: 'NumerosNaturales'!
II subclass: #LXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIV class' category: 'NumerosNaturales'!
LXXIV class
	instanceVariableNames: ''!

!LXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXV.
	prev := LXXIII.! !


!classDefinition: #LXXIX category: 'NumerosNaturales'!
II subclass: #LXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXIX class' category: 'NumerosNaturales'!
LXXIX class
	instanceVariableNames: ''!

!LXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXX.
	prev := LXXVIII.! !


!classDefinition: #LXXV category: 'NumerosNaturales'!
II subclass: #LXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXV class' category: 'NumerosNaturales'!
LXXV class
	instanceVariableNames: ''!

!LXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVI.
	prev := LXXIV.! !


!classDefinition: #LXXVI category: 'NumerosNaturales'!
II subclass: #LXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVI class' category: 'NumerosNaturales'!
LXXVI class
	instanceVariableNames: ''!

!LXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVII.
	prev := LXXV.! !


!classDefinition: #LXXVII category: 'NumerosNaturales'!
II subclass: #LXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVII class' category: 'NumerosNaturales'!
LXXVII class
	instanceVariableNames: ''!

!LXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXVIII.
	prev := LXXVI.! !


!classDefinition: #LXXVIII category: 'NumerosNaturales'!
II subclass: #LXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXVIII class' category: 'NumerosNaturales'!
LXXVIII class
	instanceVariableNames: ''!

!LXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXIX.
	prev := LXXVII.! !


!classDefinition: #LXXX category: 'NumerosNaturales'!
II subclass: #LXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXX class' category: 'NumerosNaturales'!
LXXX class
	instanceVariableNames: ''!

!LXXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXI.
	prev := LXXIX.! !


!classDefinition: #LXXXI category: 'NumerosNaturales'!
II subclass: #LXXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXI class' category: 'NumerosNaturales'!
LXXXI class
	instanceVariableNames: ''!

!LXXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXII.
	prev := LXXX.! !


!classDefinition: #LXXXII category: 'NumerosNaturales'!
II subclass: #LXXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXII class' category: 'NumerosNaturales'!
LXXXII class
	instanceVariableNames: ''!

!LXXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIII.
	prev := LXXXI.! !


!classDefinition: #LXXXIII category: 'NumerosNaturales'!
II subclass: #LXXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIII class' category: 'NumerosNaturales'!
LXXXIII class
	instanceVariableNames: ''!

!LXXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIV.
	prev := LXXXII.! !


!classDefinition: #LXXXIV category: 'NumerosNaturales'!
II subclass: #LXXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIV class' category: 'NumerosNaturales'!
LXXXIV class
	instanceVariableNames: ''!

!LXXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXV.
	prev := LXXXIII.! !


!classDefinition: #LXXXIX category: 'NumerosNaturales'!
II subclass: #LXXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXIX class' category: 'NumerosNaturales'!
LXXXIX class
	instanceVariableNames: ''!

!LXXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XC.
	prev := LXXXVIII.! !


!classDefinition: #LXXXV category: 'NumerosNaturales'!
II subclass: #LXXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXV class' category: 'NumerosNaturales'!
LXXXV class
	instanceVariableNames: ''!

!LXXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVI.
	prev := LXXXIV.! !


!classDefinition: #LXXXVI category: 'NumerosNaturales'!
II subclass: #LXXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVI class' category: 'NumerosNaturales'!
LXXXVI class
	instanceVariableNames: ''!

!LXXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVII.
	prev := LXXXV.! !


!classDefinition: #LXXXVII category: 'NumerosNaturales'!
II subclass: #LXXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVII class' category: 'NumerosNaturales'!
LXXXVII class
	instanceVariableNames: ''!

!LXXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXVIII.
	prev := LXXXVI.! !


!classDefinition: #LXXXVIII category: 'NumerosNaturales'!
II subclass: #LXXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'LXXXVIII class' category: 'NumerosNaturales'!
LXXXVIII class
	instanceVariableNames: ''!

!LXXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := LXXXIX.
	prev := LXXXVII.! !


!classDefinition: #V category: 'NumerosNaturales'!
II subclass: #V
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'V class' category: 'NumerosNaturales'!
V class
	instanceVariableNames: ''!

!V class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VI.
	prev := IV.! !


!classDefinition: #VI category: 'NumerosNaturales'!
II subclass: #VI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VI class' category: 'NumerosNaturales'!
VI class
	instanceVariableNames: ''!

!VI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VII.
	prev := V.! !


!classDefinition: #VII category: 'NumerosNaturales'!
II subclass: #VII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VII class' category: 'NumerosNaturales'!
VII class
	instanceVariableNames: ''!

!VII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := VIII.
	prev := VI.! !


!classDefinition: #VIII category: 'NumerosNaturales'!
II subclass: #VIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'VIII class' category: 'NumerosNaturales'!
VIII class
	instanceVariableNames: ''!

!VIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := IX.
	prev := VII.! !


!classDefinition: #X category: 'NumerosNaturales'!
II subclass: #X
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'X class' category: 'NumerosNaturales'!
X class
	instanceVariableNames: ''!

!X class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XI.
	prev := IX.! !


!classDefinition: #XC category: 'NumerosNaturales'!
II subclass: #XC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XC class' category: 'NumerosNaturales'!
XC class
	instanceVariableNames: ''!

!XC class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCI.
	prev := LXXXIX.! !


!classDefinition: #XCI category: 'NumerosNaturales'!
II subclass: #XCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCI class' category: 'NumerosNaturales'!
XCI class
	instanceVariableNames: ''!

!XCI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCII.
	prev := XC.! !


!classDefinition: #XCII category: 'NumerosNaturales'!
II subclass: #XCII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCII class' category: 'NumerosNaturales'!
XCII class
	instanceVariableNames: ''!

!XCII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:33'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCIII.
	prev := XCI.! !


!classDefinition: #XCIII category: 'NumerosNaturales'!
II subclass: #XCIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIII class' category: 'NumerosNaturales'!
XCIII class
	instanceVariableNames: ''!

!XCIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCIV.
	prev := XCII.! !


!classDefinition: #XCIV category: 'NumerosNaturales'!
II subclass: #XCIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIV class' category: 'NumerosNaturales'!
XCIV class
	instanceVariableNames: ''!

!XCIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCV.
	prev := XCIII.! !


!classDefinition: #XCIX category: 'NumerosNaturales'!
II subclass: #XCIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCIX class' category: 'NumerosNaturales'!
XCIX class
	instanceVariableNames: ''!

!XCIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := C.
	prev := XCVIII.! !


!classDefinition: #XCV category: 'NumerosNaturales'!
II subclass: #XCV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCV class' category: 'NumerosNaturales'!
XCV class
	instanceVariableNames: ''!

!XCV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCVI.
	prev := XCIV.! !


!classDefinition: #XCVI category: 'NumerosNaturales'!
II subclass: #XCVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVI class' category: 'NumerosNaturales'!
XCVI class
	instanceVariableNames: ''!

!XCVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCVII.
	prev := XCV.! !


!classDefinition: #XCVII category: 'NumerosNaturales'!
II subclass: #XCVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVII class' category: 'NumerosNaturales'!
XCVII class
	instanceVariableNames: ''!

!XCVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCVIII.
	prev := XCVI.! !


!classDefinition: #XCVIII category: 'NumerosNaturales'!
II subclass: #XCVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XCVIII class' category: 'NumerosNaturales'!
XCVIII class
	instanceVariableNames: ''!

!XCVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XCIX.
	prev := XCVII.! !


!classDefinition: #XI category: 'NumerosNaturales'!
II subclass: #XI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XI class' category: 'NumerosNaturales'!
XI class
	instanceVariableNames: ''!

!XI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XII.
	prev := X.! !


!classDefinition: #XII category: 'NumerosNaturales'!
II subclass: #XII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XII class' category: 'NumerosNaturales'!
XII class
	instanceVariableNames: ''!

!XII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIII.
	prev := XI.! !


!classDefinition: #XIII category: 'NumerosNaturales'!
II subclass: #XIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIII class' category: 'NumerosNaturales'!
XIII class
	instanceVariableNames: ''!

!XIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIV.
	prev := XII.! !


!classDefinition: #XIV category: 'NumerosNaturales'!
II subclass: #XIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIV class' category: 'NumerosNaturales'!
XIV class
	instanceVariableNames: ''!

!XIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XV.
	prev := XIII.! !


!classDefinition: #XIX category: 'NumerosNaturales'!
II subclass: #XIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XIX class' category: 'NumerosNaturales'!
XIX class
	instanceVariableNames: ''!

!XIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XX.
	prev := XVIII.! !


!classDefinition: #XL category: 'NumerosNaturales'!
II subclass: #XL
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XL class' category: 'NumerosNaturales'!
XL class
	instanceVariableNames: ''!

!XL class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLI.
	prev := XXXIX.! !


!classDefinition: #XLI category: 'NumerosNaturales'!
II subclass: #XLI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLI class' category: 'NumerosNaturales'!
XLI class
	instanceVariableNames: ''!

!XLI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLII.
	prev := XL.! !


!classDefinition: #XLII category: 'NumerosNaturales'!
II subclass: #XLII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLII class' category: 'NumerosNaturales'!
XLII class
	instanceVariableNames: ''!

!XLII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIII.
	prev := XLI.! !


!classDefinition: #XLIII category: 'NumerosNaturales'!
II subclass: #XLIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIII class' category: 'NumerosNaturales'!
XLIII class
	instanceVariableNames: ''!

!XLIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIV.
	prev := XLII.! !


!classDefinition: #XLIV category: 'NumerosNaturales'!
II subclass: #XLIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIV class' category: 'NumerosNaturales'!
XLIV class
	instanceVariableNames: ''!

!XLIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLV.
	prev := XLIII.! !


!classDefinition: #XLIX category: 'NumerosNaturales'!
II subclass: #XLIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLIX class' category: 'NumerosNaturales'!
XLIX class
	instanceVariableNames: ''!

!XLIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := L.
	prev := XLVIII.! !


!classDefinition: #XLV category: 'NumerosNaturales'!
II subclass: #XLV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLV class' category: 'NumerosNaturales'!
XLV class
	instanceVariableNames: ''!

!XLV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVI.
	prev := XLIV.! !


!classDefinition: #XLVI category: 'NumerosNaturales'!
II subclass: #XLVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVI class' category: 'NumerosNaturales'!
XLVI class
	instanceVariableNames: ''!

!XLVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVII.
	prev := XLV.! !


!classDefinition: #XLVII category: 'NumerosNaturales'!
II subclass: #XLVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVII class' category: 'NumerosNaturales'!
XLVII class
	instanceVariableNames: ''!

!XLVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLVIII.
	prev := XLVI.! !


!classDefinition: #XLVIII category: 'NumerosNaturales'!
II subclass: #XLVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XLVIII class' category: 'NumerosNaturales'!
XLVIII class
	instanceVariableNames: ''!

!XLVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XLIX.
	prev := XLVII.! !


!classDefinition: #XV category: 'NumerosNaturales'!
II subclass: #XV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XV class' category: 'NumerosNaturales'!
XV class
	instanceVariableNames: ''!

!XV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVI.
	prev := XIV.! !


!classDefinition: #XVI category: 'NumerosNaturales'!
II subclass: #XVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVI class' category: 'NumerosNaturales'!
XVI class
	instanceVariableNames: ''!

!XVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVII.
	prev := XV.! !


!classDefinition: #XVII category: 'NumerosNaturales'!
II subclass: #XVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVII class' category: 'NumerosNaturales'!
XVII class
	instanceVariableNames: ''!

!XVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XVIII.
	prev := XVI.! !


!classDefinition: #XVIII category: 'NumerosNaturales'!
II subclass: #XVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XVIII class' category: 'NumerosNaturales'!
XVIII class
	instanceVariableNames: ''!

!XVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XIX.
	prev := XVII.! !


!classDefinition: #XX category: 'NumerosNaturales'!
II subclass: #XX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XX class' category: 'NumerosNaturales'!
XX class
	instanceVariableNames: ''!

!XX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXI.
	prev := XIX.! !


!classDefinition: #XXI category: 'NumerosNaturales'!
II subclass: #XXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXI class' category: 'NumerosNaturales'!
XXI class
	instanceVariableNames: ''!

!XXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXII.
	prev := XX.! !


!classDefinition: #XXII category: 'NumerosNaturales'!
II subclass: #XXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXII class' category: 'NumerosNaturales'!
XXII class
	instanceVariableNames: ''!

!XXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIII.
	prev := XXI.! !


!classDefinition: #XXIII category: 'NumerosNaturales'!
II subclass: #XXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIII class' category: 'NumerosNaturales'!
XXIII class
	instanceVariableNames: ''!

!XXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIV.
	prev := XXII.! !


!classDefinition: #XXIV category: 'NumerosNaturales'!
II subclass: #XXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIV class' category: 'NumerosNaturales'!
XXIV class
	instanceVariableNames: ''!

!XXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXV.
	prev := XXIII.! !


!classDefinition: #XXIX category: 'NumerosNaturales'!
II subclass: #XXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXIX class' category: 'NumerosNaturales'!
XXIX class
	instanceVariableNames: ''!

!XXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXX.
	prev := XXVIII.! !


!classDefinition: #XXV category: 'NumerosNaturales'!
II subclass: #XXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXV class' category: 'NumerosNaturales'!
XXV class
	instanceVariableNames: ''!

!XXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVI.
	prev := XXIV.! !


!classDefinition: #XXVI category: 'NumerosNaturales'!
II subclass: #XXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVI class' category: 'NumerosNaturales'!
XXVI class
	instanceVariableNames: ''!

!XXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVII.
	prev := XXV.! !


!classDefinition: #XXVII category: 'NumerosNaturales'!
II subclass: #XXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVII class' category: 'NumerosNaturales'!
XXVII class
	instanceVariableNames: ''!

!XXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXVIII.
	prev := XXVI.! !


!classDefinition: #XXVIII category: 'NumerosNaturales'!
II subclass: #XXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXVIII class' category: 'NumerosNaturales'!
XXVIII class
	instanceVariableNames: ''!

!XXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXIX.
	prev := XXVII.! !


!classDefinition: #XXX category: 'NumerosNaturales'!
II subclass: #XXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXX class' category: 'NumerosNaturales'!
XXX class
	instanceVariableNames: ''!

!XXX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXI.
	prev := XXIX.! !


!classDefinition: #XXXI category: 'NumerosNaturales'!
II subclass: #XXXI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXI class' category: 'NumerosNaturales'!
XXXI class
	instanceVariableNames: ''!

!XXXI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXII.
	prev := XXX.! !


!classDefinition: #XXXII category: 'NumerosNaturales'!
II subclass: #XXXII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXII class' category: 'NumerosNaturales'!
XXXII class
	instanceVariableNames: ''!

!XXXII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIII.
	prev := XXXI.! !


!classDefinition: #XXXIII category: 'NumerosNaturales'!
II subclass: #XXXIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIII class' category: 'NumerosNaturales'!
XXXIII class
	instanceVariableNames: ''!

!XXXIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIV.
	prev := XXXII.! !


!classDefinition: #XXXIV category: 'NumerosNaturales'!
II subclass: #XXXIV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIV class' category: 'NumerosNaturales'!
XXXIV class
	instanceVariableNames: ''!

!XXXIV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXV.
	prev := XXXIII.! !


!classDefinition: #XXXIX category: 'NumerosNaturales'!
II subclass: #XXXIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXIX class' category: 'NumerosNaturales'!
XXXIX class
	instanceVariableNames: ''!

!XXXIX class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XL.
	prev := XXXVIII.! !


!classDefinition: #XXXV category: 'NumerosNaturales'!
II subclass: #XXXV
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXV class' category: 'NumerosNaturales'!
XXXV class
	instanceVariableNames: ''!

!XXXV class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVI.
	prev := XXXIV.! !


!classDefinition: #XXXVI category: 'NumerosNaturales'!
II subclass: #XXXVI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVI class' category: 'NumerosNaturales'!
XXXVI class
	instanceVariableNames: ''!

!XXXVI class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVII.
	prev := XXXV.! !


!classDefinition: #XXXVII category: 'NumerosNaturales'!
II subclass: #XXXVII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVII class' category: 'NumerosNaturales'!
XXXVII class
	instanceVariableNames: ''!

!XXXVII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXVIII.
	prev := XXXVI.! !


!classDefinition: #XXXVIII category: 'NumerosNaturales'!
II subclass: #XXXVIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'NumerosNaturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'XXXVIII class' category: 'NumerosNaturales'!
XXXVIII class
	instanceVariableNames: ''!

!XXXVIII class methodsFor: '--** private fileout/in **--' stamp: 'edrr 4/8/2022 20:33:34'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	next := XXXIX.
	prev := XXXVII.! !

I initializeAfterFileIn!
II initializeAfterFileIn!
C initializeAfterFileIn!
CC initializeAfterFileIn!
CCC initializeAfterFileIn!
CCCI initializeAfterFileIn!
CCCII initializeAfterFileIn!
CCCIII initializeAfterFileIn!
CCCIV initializeAfterFileIn!
CCCIX initializeAfterFileIn!
CCCL initializeAfterFileIn!
CCCLI initializeAfterFileIn!
CCCLII initializeAfterFileIn!
CCCLIII initializeAfterFileIn!
CCCLIV initializeAfterFileIn!
CCCLIX initializeAfterFileIn!
CCCLV initializeAfterFileIn!
CCCLVI initializeAfterFileIn!
CCCLVII initializeAfterFileIn!
CCCLVIII initializeAfterFileIn!
CCCLX initializeAfterFileIn!
CCCLXI initializeAfterFileIn!
CCCLXII initializeAfterFileIn!
CCCLXIII initializeAfterFileIn!
CCCLXIV initializeAfterFileIn!
CCCLXIX initializeAfterFileIn!
CCCLXV initializeAfterFileIn!
CCCLXVI initializeAfterFileIn!
CCCLXVII initializeAfterFileIn!
CCCLXVIII initializeAfterFileIn!
CCCLXX initializeAfterFileIn!
CCCLXXI initializeAfterFileIn!
CCCLXXII initializeAfterFileIn!
CCCLXXIII initializeAfterFileIn!
CCCLXXIV initializeAfterFileIn!
CCCLXXIX initializeAfterFileIn!
CCCLXXV initializeAfterFileIn!
CCCLXXVI initializeAfterFileIn!
CCCLXXVII initializeAfterFileIn!
CCCLXXVIII initializeAfterFileIn!
CCCLXXX initializeAfterFileIn!
CCCLXXXI initializeAfterFileIn!
CCCLXXXII initializeAfterFileIn!
CCCLXXXIII initializeAfterFileIn!
CCCLXXXIV initializeAfterFileIn!
CCCLXXXIX initializeAfterFileIn!
CCCLXXXV initializeAfterFileIn!
CCCLXXXVI initializeAfterFileIn!
CCCLXXXVII initializeAfterFileIn!
CCCLXXXVIII initializeAfterFileIn!
CCCV initializeAfterFileIn!
CCCVI initializeAfterFileIn!
CCCVII initializeAfterFileIn!
CCCVIII initializeAfterFileIn!
CCCX initializeAfterFileIn!
CCCXC initializeAfterFileIn!
CCCXCI initializeAfterFileIn!
CCCXCII initializeAfterFileIn!
CCCXCIII initializeAfterFileIn!
CCCXCIV initializeAfterFileIn!
CCCXCIX initializeAfterFileIn!
CCCXCV initializeAfterFileIn!
CCCXCVI initializeAfterFileIn!
CCCXCVII initializeAfterFileIn!
CCCXCVIII initializeAfterFileIn!
CCCXI initializeAfterFileIn!
CCCXII initializeAfterFileIn!
CCCXIII initializeAfterFileIn!
CCCXIV initializeAfterFileIn!
CCCXIX initializeAfterFileIn!
CCCXL initializeAfterFileIn!
CCCXLI initializeAfterFileIn!
CCCXLII initializeAfterFileIn!
CCCXLIII initializeAfterFileIn!
CCCXLIV initializeAfterFileIn!
CCCXLIX initializeAfterFileIn!
CCCXLV initializeAfterFileIn!
CCCXLVI initializeAfterFileIn!
CCCXLVII initializeAfterFileIn!
CCCXLVIII initializeAfterFileIn!
CCCXV initializeAfterFileIn!
CCCXVI initializeAfterFileIn!
CCCXVII initializeAfterFileIn!
CCCXVIII initializeAfterFileIn!
CCCXX initializeAfterFileIn!
CCCXXI initializeAfterFileIn!
CCCXXII initializeAfterFileIn!
CCCXXIII initializeAfterFileIn!
CCCXXIV initializeAfterFileIn!
CCCXXIX initializeAfterFileIn!
CCCXXV initializeAfterFileIn!
CCCXXVI initializeAfterFileIn!
CCCXXVII initializeAfterFileIn!
CCCXXVIII initializeAfterFileIn!
CCCXXX initializeAfterFileIn!
CCCXXXI initializeAfterFileIn!
CCCXXXII initializeAfterFileIn!
CCCXXXIII initializeAfterFileIn!
CCCXXXIV initializeAfterFileIn!
CCCXXXIX initializeAfterFileIn!
CCCXXXV initializeAfterFileIn!
CCCXXXVI initializeAfterFileIn!
CCCXXXVII initializeAfterFileIn!
CCCXXXVIII initializeAfterFileIn!
CCI initializeAfterFileIn!
CCII initializeAfterFileIn!
CCIII initializeAfterFileIn!
CCIV initializeAfterFileIn!
CCIX initializeAfterFileIn!
CCL initializeAfterFileIn!
CCLI initializeAfterFileIn!
CCLII initializeAfterFileIn!
CCLIII initializeAfterFileIn!
CCLIV initializeAfterFileIn!
CCLIX initializeAfterFileIn!
CCLV initializeAfterFileIn!
CCLVI initializeAfterFileIn!
CCLVII initializeAfterFileIn!
CCLVIII initializeAfterFileIn!
CCLX initializeAfterFileIn!
CCLXI initializeAfterFileIn!
CCLXII initializeAfterFileIn!
CCLXIII initializeAfterFileIn!
CCLXIV initializeAfterFileIn!
CCLXIX initializeAfterFileIn!
CCLXV initializeAfterFileIn!
CCLXVI initializeAfterFileIn!
CCLXVII initializeAfterFileIn!
CCLXVIII initializeAfterFileIn!
CCLXX initializeAfterFileIn!
CCLXXI initializeAfterFileIn!
CCLXXII initializeAfterFileIn!
CCLXXIII initializeAfterFileIn!
CCLXXIV initializeAfterFileIn!
CCLXXIX initializeAfterFileIn!
CCLXXV initializeAfterFileIn!
CCLXXVI initializeAfterFileIn!
CCLXXVII initializeAfterFileIn!
CCLXXVIII initializeAfterFileIn!
CCLXXX initializeAfterFileIn!
CCLXXXI initializeAfterFileIn!
CCLXXXII initializeAfterFileIn!
CCLXXXIII initializeAfterFileIn!
CCLXXXIV initializeAfterFileIn!
CCLXXXIX initializeAfterFileIn!
CCLXXXV initializeAfterFileIn!
CCLXXXVI initializeAfterFileIn!
CCLXXXVII initializeAfterFileIn!
CCLXXXVIII initializeAfterFileIn!
CCV initializeAfterFileIn!
CCVI initializeAfterFileIn!
CCVII initializeAfterFileIn!
CCVIII initializeAfterFileIn!
CCX initializeAfterFileIn!
CCXC initializeAfterFileIn!
CCXCI initializeAfterFileIn!
CCXCII initializeAfterFileIn!
CCXCIII initializeAfterFileIn!
CCXCIV initializeAfterFileIn!
CCXCIX initializeAfterFileIn!
CCXCV initializeAfterFileIn!
CCXCVI initializeAfterFileIn!
CCXCVII initializeAfterFileIn!
CCXCVIII initializeAfterFileIn!
CCXI initializeAfterFileIn!
CCXII initializeAfterFileIn!
CCXIII initializeAfterFileIn!
CCXIV initializeAfterFileIn!
CCXIX initializeAfterFileIn!
CCXL initializeAfterFileIn!
CCXLI initializeAfterFileIn!
CCXLII initializeAfterFileIn!
CCXLIII initializeAfterFileIn!
CCXLIV initializeAfterFileIn!
CCXLIX initializeAfterFileIn!
CCXLV initializeAfterFileIn!
CCXLVI initializeAfterFileIn!
CCXLVII initializeAfterFileIn!
CCXLVIII initializeAfterFileIn!
CCXV initializeAfterFileIn!
CCXVI initializeAfterFileIn!
CCXVII initializeAfterFileIn!
CCXVIII initializeAfterFileIn!
CCXX initializeAfterFileIn!
CCXXI initializeAfterFileIn!
CCXXII initializeAfterFileIn!
CCXXIII initializeAfterFileIn!
CCXXIV initializeAfterFileIn!
CCXXIX initializeAfterFileIn!
CCXXV initializeAfterFileIn!
CCXXVI initializeAfterFileIn!
CCXXVII initializeAfterFileIn!
CCXXVIII initializeAfterFileIn!
CCXXX initializeAfterFileIn!
CCXXXI initializeAfterFileIn!
CCXXXII initializeAfterFileIn!
CCXXXIII initializeAfterFileIn!
CCXXXIV initializeAfterFileIn!
CCXXXIX initializeAfterFileIn!
CCXXXV initializeAfterFileIn!
CCXXXVI initializeAfterFileIn!
CCXXXVII initializeAfterFileIn!
CCXXXVIII initializeAfterFileIn!
CD initializeAfterFileIn!
CDI initializeAfterFileIn!
CDII initializeAfterFileIn!
CDIII initializeAfterFileIn!
CDIV initializeAfterFileIn!
CDIX initializeAfterFileIn!
CDL initializeAfterFileIn!
CDLI initializeAfterFileIn!
CDLII initializeAfterFileIn!
CDLIII initializeAfterFileIn!
CDLIV initializeAfterFileIn!
CDLIX initializeAfterFileIn!
CDLV initializeAfterFileIn!
CDLVI initializeAfterFileIn!
CDLVII initializeAfterFileIn!
CDLVIII initializeAfterFileIn!
CDLX initializeAfterFileIn!
CDLXI initializeAfterFileIn!
CDLXII initializeAfterFileIn!
CDLXIII initializeAfterFileIn!
CDLXIV initializeAfterFileIn!
CDLXIX initializeAfterFileIn!
CDLXV initializeAfterFileIn!
CDLXVI initializeAfterFileIn!
CDLXVII initializeAfterFileIn!
CDLXVIII initializeAfterFileIn!
CDLXX initializeAfterFileIn!
CDLXXI initializeAfterFileIn!
CDLXXII initializeAfterFileIn!
CDLXXIII initializeAfterFileIn!
CDLXXIV initializeAfterFileIn!
CDLXXIX initializeAfterFileIn!
CDLXXV initializeAfterFileIn!
CDLXXVI initializeAfterFileIn!
CDLXXVII initializeAfterFileIn!
CDLXXVIII initializeAfterFileIn!
CDLXXX initializeAfterFileIn!
CDLXXXI initializeAfterFileIn!
CDLXXXII initializeAfterFileIn!
CDLXXXIII initializeAfterFileIn!
CDLXXXIV initializeAfterFileIn!
CDLXXXIX initializeAfterFileIn!
CDLXXXV initializeAfterFileIn!
CDLXXXVI initializeAfterFileIn!
CDLXXXVII initializeAfterFileIn!
CDLXXXVIII initializeAfterFileIn!
CDV initializeAfterFileIn!
CDVI initializeAfterFileIn!
CDVII initializeAfterFileIn!
CDVIII initializeAfterFileIn!
CDX initializeAfterFileIn!
CDXC initializeAfterFileIn!
CDXCI initializeAfterFileIn!
CDXCII initializeAfterFileIn!
CDXCIII initializeAfterFileIn!
CDXCIV initializeAfterFileIn!
CDXCIX initializeAfterFileIn!
CDXCV initializeAfterFileIn!
CDXCVI initializeAfterFileIn!
CDXCVII initializeAfterFileIn!
CDXCVIII initializeAfterFileIn!
CDXI initializeAfterFileIn!
CDXII initializeAfterFileIn!
CDXIII initializeAfterFileIn!
CDXIV initializeAfterFileIn!
CDXIX initializeAfterFileIn!
CDXL initializeAfterFileIn!
CDXLI initializeAfterFileIn!
CDXLII initializeAfterFileIn!
CDXLIII initializeAfterFileIn!
CDXLIV initializeAfterFileIn!
CDXLIX initializeAfterFileIn!
CDXLV initializeAfterFileIn!
CDXLVI initializeAfterFileIn!
CDXLVII initializeAfterFileIn!
CDXLVIII initializeAfterFileIn!
CDXV initializeAfterFileIn!
CDXVI initializeAfterFileIn!
CDXVII initializeAfterFileIn!
CDXVIII initializeAfterFileIn!
CDXX initializeAfterFileIn!
CDXXI initializeAfterFileIn!
CDXXII initializeAfterFileIn!
CDXXIII initializeAfterFileIn!
CDXXIV initializeAfterFileIn!
CDXXIX initializeAfterFileIn!
CDXXV initializeAfterFileIn!
CDXXVI initializeAfterFileIn!
CDXXVII initializeAfterFileIn!
CDXXVIII initializeAfterFileIn!
CDXXX initializeAfterFileIn!
CDXXXI initializeAfterFileIn!
CDXXXII initializeAfterFileIn!
CDXXXIII initializeAfterFileIn!
CDXXXIV initializeAfterFileIn!
CDXXXIX initializeAfterFileIn!
CDXXXV initializeAfterFileIn!
CDXXXVI initializeAfterFileIn!
CDXXXVII initializeAfterFileIn!
CDXXXVIII initializeAfterFileIn!
CI initializeAfterFileIn!
CII initializeAfterFileIn!
CIII initializeAfterFileIn!
CIV initializeAfterFileIn!
CIX initializeAfterFileIn!
CL initializeAfterFileIn!
CLI initializeAfterFileIn!
CLII initializeAfterFileIn!
CLIII initializeAfterFileIn!
CLIV initializeAfterFileIn!
CLIX initializeAfterFileIn!
CLV initializeAfterFileIn!
CLVI initializeAfterFileIn!
CLVII initializeAfterFileIn!
CLVIII initializeAfterFileIn!
CLX initializeAfterFileIn!
CLXI initializeAfterFileIn!
CLXII initializeAfterFileIn!
CLXIII initializeAfterFileIn!
CLXIV initializeAfterFileIn!
CLXIX initializeAfterFileIn!
CLXV initializeAfterFileIn!
CLXVI initializeAfterFileIn!
CLXVII initializeAfterFileIn!
CLXVIII initializeAfterFileIn!
CLXX initializeAfterFileIn!
CLXXI initializeAfterFileIn!
CLXXII initializeAfterFileIn!
CLXXIII initializeAfterFileIn!
CLXXIV initializeAfterFileIn!
CLXXIX initializeAfterFileIn!
CLXXV initializeAfterFileIn!
CLXXVI initializeAfterFileIn!
CLXXVII initializeAfterFileIn!
CLXXVIII initializeAfterFileIn!
CLXXX initializeAfterFileIn!
CLXXXI initializeAfterFileIn!
CLXXXII initializeAfterFileIn!
CLXXXIII initializeAfterFileIn!
CLXXXIV initializeAfterFileIn!
CLXXXIX initializeAfterFileIn!
CLXXXV initializeAfterFileIn!
CLXXXVI initializeAfterFileIn!
CLXXXVII initializeAfterFileIn!
CLXXXVIII initializeAfterFileIn!
CV initializeAfterFileIn!
CVI initializeAfterFileIn!
CVII initializeAfterFileIn!
CVIII initializeAfterFileIn!
CX initializeAfterFileIn!
CXC initializeAfterFileIn!
CXCI initializeAfterFileIn!
CXCII initializeAfterFileIn!
CXCIII initializeAfterFileIn!
CXCIV initializeAfterFileIn!
CXCIX initializeAfterFileIn!
CXCV initializeAfterFileIn!
CXCVI initializeAfterFileIn!
CXCVII initializeAfterFileIn!
CXCVIII initializeAfterFileIn!
CXI initializeAfterFileIn!
CXII initializeAfterFileIn!
CXIII initializeAfterFileIn!
CXIV initializeAfterFileIn!
CXIX initializeAfterFileIn!
CXL initializeAfterFileIn!
CXLI initializeAfterFileIn!
CXLII initializeAfterFileIn!
CXLIII initializeAfterFileIn!
CXLIV initializeAfterFileIn!
CXLIX initializeAfterFileIn!
CXLV initializeAfterFileIn!
CXLVI initializeAfterFileIn!
CXLVII initializeAfterFileIn!
CXLVIII initializeAfterFileIn!
CXV initializeAfterFileIn!
CXVI initializeAfterFileIn!
CXVII initializeAfterFileIn!
CXVIII initializeAfterFileIn!
CXX initializeAfterFileIn!
CXXI initializeAfterFileIn!
CXXII initializeAfterFileIn!
CXXIII initializeAfterFileIn!
CXXIV initializeAfterFileIn!
CXXIX initializeAfterFileIn!
CXXV initializeAfterFileIn!
CXXVI initializeAfterFileIn!
CXXVII initializeAfterFileIn!
CXXVIII initializeAfterFileIn!
CXXX initializeAfterFileIn!
CXXXI initializeAfterFileIn!
CXXXII initializeAfterFileIn!
CXXXIII initializeAfterFileIn!
CXXXIV initializeAfterFileIn!
CXXXIX initializeAfterFileIn!
CXXXV initializeAfterFileIn!
CXXXVI initializeAfterFileIn!
CXXXVII initializeAfterFileIn!
CXXXVIII initializeAfterFileIn!
D initializeAfterFileIn!
III initializeAfterFileIn!
IV initializeAfterFileIn!
IX initializeAfterFileIn!
L initializeAfterFileIn!
LI initializeAfterFileIn!
LII initializeAfterFileIn!
LIII initializeAfterFileIn!
LIV initializeAfterFileIn!
LIX initializeAfterFileIn!
LV initializeAfterFileIn!
LVI initializeAfterFileIn!
LVII initializeAfterFileIn!
LVIII initializeAfterFileIn!
LX initializeAfterFileIn!
LXI initializeAfterFileIn!
LXII initializeAfterFileIn!
LXIII initializeAfterFileIn!
LXIV initializeAfterFileIn!
LXIX initializeAfterFileIn!
LXV initializeAfterFileIn!
LXVI initializeAfterFileIn!
LXVII initializeAfterFileIn!
LXVIII initializeAfterFileIn!
LXX initializeAfterFileIn!
LXXI initializeAfterFileIn!
LXXII initializeAfterFileIn!
LXXIII initializeAfterFileIn!
LXXIV initializeAfterFileIn!
LXXIX initializeAfterFileIn!
LXXV initializeAfterFileIn!
LXXVI initializeAfterFileIn!
LXXVII initializeAfterFileIn!
LXXVIII initializeAfterFileIn!
LXXX initializeAfterFileIn!
LXXXI initializeAfterFileIn!
LXXXII initializeAfterFileIn!
LXXXIII initializeAfterFileIn!
LXXXIV initializeAfterFileIn!
LXXXIX initializeAfterFileIn!
LXXXV initializeAfterFileIn!
LXXXVI initializeAfterFileIn!
LXXXVII initializeAfterFileIn!
LXXXVIII initializeAfterFileIn!
V initializeAfterFileIn!
VI initializeAfterFileIn!
VII initializeAfterFileIn!
VIII initializeAfterFileIn!
X initializeAfterFileIn!
XC initializeAfterFileIn!
XCI initializeAfterFileIn!
XCII initializeAfterFileIn!
XCIII initializeAfterFileIn!
XCIV initializeAfterFileIn!
XCIX initializeAfterFileIn!
XCV initializeAfterFileIn!
XCVI initializeAfterFileIn!
XCVII initializeAfterFileIn!
XCVIII initializeAfterFileIn!
XI initializeAfterFileIn!
XII initializeAfterFileIn!
XIII initializeAfterFileIn!
XIV initializeAfterFileIn!
XIX initializeAfterFileIn!
XL initializeAfterFileIn!
XLI initializeAfterFileIn!
XLII initializeAfterFileIn!
XLIII initializeAfterFileIn!
XLIV initializeAfterFileIn!
XLIX initializeAfterFileIn!
XLV initializeAfterFileIn!
XLVI initializeAfterFileIn!
XLVII initializeAfterFileIn!
XLVIII initializeAfterFileIn!
XV initializeAfterFileIn!
XVI initializeAfterFileIn!
XVII initializeAfterFileIn!
XVIII initializeAfterFileIn!
XX initializeAfterFileIn!
XXI initializeAfterFileIn!
XXII initializeAfterFileIn!
XXIII initializeAfterFileIn!
XXIV initializeAfterFileIn!
XXIX initializeAfterFileIn!
XXV initializeAfterFileIn!
XXVI initializeAfterFileIn!
XXVII initializeAfterFileIn!
XXVIII initializeAfterFileIn!
XXX initializeAfterFileIn!
XXXI initializeAfterFileIn!
XXXII initializeAfterFileIn!
XXXIII initializeAfterFileIn!
XXXIV initializeAfterFileIn!
XXXIX initializeAfterFileIn!
XXXV initializeAfterFileIn!
XXXVI initializeAfterFileIn!
XXXVII initializeAfterFileIn!
XXXVIII initializeAfterFileIn!