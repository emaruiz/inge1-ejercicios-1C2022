!classDefinition: #ParallelBlocks category: 'TusLibros'!
Object subclass: #ParallelBlocks
	instanceVariableNames: 'semaphores'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!ParallelBlocks methodsFor: 'initialization' stamp: 'edrr 6/14/2022 21:00:40'!
initialize
	semaphores := Set new.! !


!ParallelBlocks methodsFor: 'operations' stamp: 'edrr 6/14/2022 21:01:32'!
addParallelBlock: aBlock
	
	| semaphore |
	semaphore := Semaphore new.
	semaphores add: semaphore. 
	[aBlock value. 
	semaphore signal.] fork! !

!ParallelBlocks methodsFor: 'operations' stamp: 'edrr 6/14/2022 21:02:09'!
waitAll
	semaphores do: [:aSemaphore | aSemaphore wait].! !
