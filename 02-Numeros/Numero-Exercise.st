!classDefinition: #NumeroTest category: 'Numero-Exercise'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:11'!
test01isCeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:12'!
test02isCeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:14'!
test05EnteroAddsWithEnteroCorrectly

	self assert: one + one equals: two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:18'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: two * two equals: four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:20'!
test07EnteroDividesEnteroCorrectly

	self assert: two / two equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:38'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: oneFifth + oneHalf equals: sevenTenths! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:52'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: oneFifth * twoFifth equals: twoTwentyfifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:56'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: oneHalf / oneFifth equals: fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: one + oneFifth equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:07'!
test12FraccionAddsEnteroCorrectly

	self assert: oneFifth + one equals: (Entero with: 6) / (Entero with: 5)! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:50'!
test13EnteroMultipliesFraccionCorrectly

	self assert: two * oneFifth equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:52'!
test14FraccionMultipliesEnteroCorrectly

	self assert: oneFifth * two equals: twoFifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:57'!
test15EnteroDividesFraccionCorrectly

	self assert: one / twoFifth equals: fiveHalfs  ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 21:59'!
test16FraccionDividesEnteroCorrectly

	self assert: twoFifth / five equals: twoTwentyfifth ! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:40'!
test19AddingFraccionesCanReturnAnEntero

	self assert: oneHalf + oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: (two/five) * (five/two) equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:42'!
test21DividingFraccionesCanReturnAnEntero

	self assert: oneHalf / oneHalf equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:43'!
test22DividingEnterosCanReturnAFraccion

	self assert: two / four equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:46'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Numero canNotDivideByZeroErrorDescription ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 4/15/2021 16:45:35'!
test27EnteroSubstractsEnteroCorrectly

	self assert: four - one equals: three! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:47:41'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: twoFifth - oneFifth equals: oneFifth.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:00'!
test29EnteroSubstractsFraccionCorrectly

	self assert: one - oneHalf equals: oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:05'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: sixFifth - one equals: oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:08'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: threeHalfs - oneHalf equals: one.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:48:48'!
test32SubstractingSameEnterosReturnsZero

	self assert: one - one equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:01'!
test33SubstractingSameFraccionesReturnsZero

	self assert: oneHalf - oneHalf equals: zero.! !

!NumeroTest methodsFor: 'tests' stamp: 'HAW 9/24/2018 08:48:14'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: one - fiveHalfs equals: negativeThreeHalfs.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:23'!
test35FibonacciZeroIsOne

	self assert: zero fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:32'!
test36FibonacciOneIsOne

	self assert: one fibonacci equals: one! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:39'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: four fibonacci equals: five.
	self assert: three fibonacci equals: three. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:47'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: anError messageText equals: Entero negativeFibonacciErrorDescription ].! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:49:55'!
test39NegationOfEnteroIsCorrect

	self assert: two negated equals: negativeTwo.
		! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:03'!
test40NegationOfFraccionIsCorrect

	self assert: oneHalf negated equals: negativeOne / two.! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #CalculadorFibonacci category: 'Numero-Exercise'!
Object subclass: #CalculadorFibonacci
	instanceVariableNames: 'entero'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!CalculadorFibonacci methodsFor: 'operations' stamp: 'JEO 4/23/2022 20:53:54'!
calcular

	self subclassResponsibility.! !


!CalculadorFibonacci methodsFor: 'initialization' stamp: 'JEO 4/23/2022 20:46:18'!
initializePara: anEntero 

	entero := anEntero! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalculadorFibonacci class' category: 'Numero-Exercise'!
CalculadorFibonacci class
	instanceVariableNames: ''!

!CalculadorFibonacci class methodsFor: 'calculador subclass search' stamp: 'JEO 4/23/2022 21:01:25'!
calculadorPara: anEntero
	| calculadorClass |
	calculadorClass _ self subclasses detect: [ :unCalculadorClass | unCalculadorClass delTipoDe: anEntero ].
	
	^ calculadorClass para: anEntero.! !

!CalculadorFibonacci class methodsFor: 'calculador subclass search' stamp: 'JEO 4/23/2022 20:50:18'!
delTipoDe: anEntero
	self subclassResponsibility.! !


!CalculadorFibonacci class methodsFor: 'instance creation' stamp: 'JEO 4/23/2022 20:50:29'!
para: anEntero
	^self new initializePara: anEntero! !


!classDefinition: #CalculadorFibonacciNegative category: 'Numero-Exercise'!
CalculadorFibonacci subclass: #CalculadorFibonacciNegative
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!CalculadorFibonacciNegative methodsFor: 'operations' stamp: 'JEO 4/23/2022 20:53:54'!
calcular
	^ self error: Entero negativeFibonacciErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalculadorFibonacciNegative class' category: 'Numero-Exercise'!
CalculadorFibonacciNegative class
	instanceVariableNames: ''!

!CalculadorFibonacciNegative class methodsFor: 'calculador subclass search' stamp: 'JEO 4/23/2022 20:50:49'!
delTipoDe: anEntero
	^ anEntero isNegative.! !


!classDefinition: #CalculadorFibonacciPositiveGreaterThanOne category: 'Numero-Exercise'!
CalculadorFibonacci subclass: #CalculadorFibonacciPositiveGreaterThanOne
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!CalculadorFibonacciPositiveGreaterThanOne methodsFor: 'operations' stamp: 'JEO 4/23/2022 20:53:54'!
calcular
	| one two |
	one := Entero with: 1.
	two := Entero with: 2.
	^ (CalculadorFibonacci calculadorPara: (entero - one)) calcular + (CalculadorFibonacci calculadorPara: (entero - two)) calcular. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalculadorFibonacciPositiveGreaterThanOne class' category: 'Numero-Exercise'!
CalculadorFibonacciPositiveGreaterThanOne class
	instanceVariableNames: ''!

!CalculadorFibonacciPositiveGreaterThanOne class methodsFor: 'calculador subclass search' stamp: 'JEO 4/23/2022 20:52:23'!
delTipoDe: anEntero
	^ anEntero isPositiveGreaterThanOne.! !


!classDefinition: #CalculadorFibonacciZeroOrOne category: 'Numero-Exercise'!
CalculadorFibonacci subclass: #CalculadorFibonacciZeroOrOne
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!CalculadorFibonacciZeroOrOne methodsFor: 'operations' stamp: 'JEO 4/23/2022 20:53:54'!
calcular
	^ Entero with: 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CalculadorFibonacciZeroOrOne class' category: 'Numero-Exercise'!
CalculadorFibonacciZeroOrOne class
	instanceVariableNames: ''!

!CalculadorFibonacciZeroOrOne class methodsFor: 'calculador subclass search' stamp: 'JEO 4/23/2022 20:52:01'!
delTipoDe: anEntero
	^ anEntero isOne or: anEntero isZero.! !


!classDefinition: #Numero category: 'Numero-Exercise'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !


!Numero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:35:06'!
addToEntero: anEntero
	self subclassResponsibility.! !

!Numero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:35:29'!
addToFraccion: aFraccion
	self subclassResponsibility.! !

!Numero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:35:50'!
divideAFraccion: aFraccion
	self subclassResponsibility.! !

!Numero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:36:18'!
divideAnEntero: anEntero
	self subclassResponsibility.! !

!Numero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:38:48'!
multiplyToEntero: anEntero
	self subclassResponsibility.! !

!Numero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:38:40'!
multiplyToFraccion: aFraccion
	self subclassResponsibility.! !

!Numero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:39:52'!
substractFromEntero: anEntero
	self subclassResponsibility! !

!Numero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:40:20'!
substractFromFraccion: aFraccion
	self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isZero

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numero-Exercise'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:02'!
canNotDivideByZeroErrorDescription

	^'No se puede dividir por cero!!!!!!'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 4/15/2021 16:42:09'!
invalidNumberTypeErrorDescription
	
	^ 'Tipo de n�mero inv�lido!!!!!!'! !


!classDefinition: #Entero category: 'Numero-Exercise'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Entero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 17:40:22'!
addToEntero: anEntero
	^anEntero class with: anEntero integerValue + self integerValue.! !

!Entero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 17:41:03'!
addToFraccion: aFraccion
	^aFraccion numerator + (self * aFraccion denominator) / aFraccion denominator! !

!Entero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 18:15:39'!
divideAFraccion: aFraccion
	^aFraccion numerator / (aFraccion denominator * self).! !

!Entero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 18:08:26'!
divideAnEntero: anEntero

	^Fraccion with: anEntero over: self.! !

!Entero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:39:14'!
multiplyToEntero: anEntero
	^anEntero class with: (anEntero integerValue * self integerValue).! !

!Entero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:07:22'!
multiplyToFraccion: aFraccion
	^aFraccion numerator * self / aFraccion denominator.! !

!Entero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 17:59:22'!
substractFromEntero: anEntero
	^ anEntero class with: (anEntero integerValue - self integerValue).! !

!Entero methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 17:53:07'!
substractFromFraccion: aFraccion
	^ aFraccion numerator - (self * aFraccion denominator) / aFraccion denominator.! !


!Entero methodsFor: 'arithmetic operations' stamp: 'JEO 4/23/2022 17:41:56'!
* aMultiplier 
	
	^aMultiplier multiplyToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEO 4/23/2022 17:40:22'!
+ anAdder 
	
	^anAdder addToEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEO 4/23/2022 18:03:36'!
- aSubtrahend 
	^ aSubtrahend substractFromEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEO 4/23/2022 18:12:10'!
/ aDivisor 
	^ aDivisor divideAnEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:55'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'JEO 4/23/2022 21:03:41'!
fibonacci
	^ (CalculadorFibonacci calculadorPara: self) calcular.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 20:09'!
initalizeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'value' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'NR 9/23/2018 22:17:55'!
isNegative
	
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'JEO 4/23/2022 20:52:52'!
isPositiveGreaterThanOne
	^ value > 1.! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numero-Exercise'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/15/2021 16:42:24'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no est� definido aqu� para Enteros Negativos!!!!!!'! !

!Entero class methodsFor: 'instance creation' stamp: 'HernanWilkinson 5/7/2016 22:53'!
with: aValue 
	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	^self new initalizeWith: aValue! !


!classDefinition: #Fraccion category: 'Numero-Exercise'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numero-Exercise'!

!Fraccion methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:18:52'!
addToEntero: anEntero
	^ self + anEntero.! !

!Fraccion methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 17:41:03'!
addToFraccion: aFraccion
	| newNumerator newDenominator |
	newNumerator := (aFraccion numerator * self denominator) + (aFraccion denominator * self numerator).
	newDenominator := aFraccion denominator * self denominator.
	
	^newNumerator / newDenominator! !

!Fraccion methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 18:14:38'!
divideAFraccion: aFraccion
	^(aFraccion numerator * self denominator) / (aFraccion denominator * self numerator).! !

!Fraccion methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 18:10:11'!
divideAnEntero: anEntero

	^Fraccion with: (self denominator * anEntero) over: self numerator.! !

!Fraccion methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 21:17:02'!
multiplyToEntero: anEntero
	^ self * anEntero.! !

!Fraccion methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 17:42:22'!
multiplyToFraccion: aFraccion
	^(aFraccion numerator * self numerator) / (aFraccion denominator * self denominator)! !

!Fraccion methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 17:47:51'!
substractFromEntero: anEntero
	^anEntero * self denominator - self numerator / self denominator.! !

!Fraccion methodsFor: 'dispatch' stamp: 'JEO 4/23/2022 17:53:24'!
substractFromFraccion: aFraccion
	| newNumerator newDenominator |

	newNumerator := (aFraccion numerator * self denominator) - (aFraccion denominator * self numerator).
	newDenominator := aFraccion denominator * self denominator.
		
	^newNumerator / newDenominator.! !


!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEO 4/23/2022 17:42:22'!
* aMultiplier 
	
	^aMultiplier multiplyToFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEO 4/23/2022 17:41:03'!
+ anAdder 
	
	^anAdder addToFraccion: self.
	! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEO 4/23/2022 18:02:06'!
- aSubtrahend 
	^ aSubtrahend substractFromFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'JEO 4/23/2022 18:16:02'!
/ aDivisor 
	^ aDivisor divideAFraccion: self.! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: 'HernanWilkinson 5/7/2016 22:54'!
initializeWith: aNumerator over: aDenominator

	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	
	numerator := aNumerator.
	denominator := aDenominator ! !


!Fraccion methodsFor: 'testing' stamp: 'edrr 4/20/2022 18:15:34'!
isNegative
	
	^numerator integerValue < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numero-Exercise'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'NR 9/23/2018 23:45:19'!
with: aDividend over: aDivisor

	| greatestCommonDivisor numerator denominator |
	
	aDivisor isZero ifTrue: [ self error: self canNotDivideByZeroErrorDescription ].
	aDividend isZero ifTrue: [ ^aDividend ].
	
	aDivisor isNegative ifTrue:[ ^aDividend negated / aDivisor negated].
	
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	numerator := aDividend // greatestCommonDivisor.
	denominator := aDivisor // greatestCommonDivisor.
	
	denominator isOne ifTrue: [ ^numerator ].

	^self new initializeWith: numerator over: denominator
	! !
