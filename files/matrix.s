004001f0 <inc>:
  4001f0:	43 00 00 00 	addiu $29,$29,-16
  4001f4:	f0 ff 1d 1d 
  4001f8:	34 00 00 00 	sw $30,8($29)
  4001fc:	08 00 1e 1d 
  400200:	42 00 00 00 	addu $30,$0,$29
  400204:	00 1e 1d 00 
  400208:	34 00 00 00 	sw $4,16($30)
  40020c:	10 00 04 1e 
  400210:	43 00 00 00 	addiu $2,$0,2
  400214:	02 00 02 00 
  400218:	34 00 00 00 	sw $2,0($30)
  40021c:	00 00 02 1e 
  400220:	34 00 00 00 	sw $0,4($30)
  400224:	04 00 00 1e 
  400228:	28 00 00 00 	lw $2,4($30)
  40022c:	04 00 02 1e 
  400230:	5c 00 00 00 	slti $3,$2,10
  400234:	0a 00 03 02 
  400238:	06 00 00 00 	bne $3,$0,400248 <inc+0x58>
  40023c:	02 00 00 03 
  400240:	01 00 00 00 	j 4002e0 <inc+0xf0>
  400244:	b8 00 10 00 
  400248:	28 00 00 00 	lw $2,4($30)
  40024c:	04 00 02 1e 
  400250:	42 00 00 00 	addu $3,$0,$2
  400254:	00 03 02 00 
  400258:	55 00 00 00 	sll $2,$3,0x2
  40025c:	02 02 03 00 
  400260:	28 00 00 00 	lw $3,16($30)
  400264:	10 00 03 1e 
  400268:	42 00 00 00 	addu $2,$2,$3
  40026c:	00 02 03 02 
  400270:	28 00 00 00 	lw $3,4($30)
  400274:	04 00 03 1e 
  400278:	42 00 00 00 	addu $4,$0,$3
  40027c:	00 04 03 00 
  400280:	55 00 00 00 	sll $3,$4,0x2
  400284:	02 03 04 00 
  400288:	28 00 00 00 	lw $4,16($30)
  40028c:	10 00 04 1e 
  400290:	42 00 00 00 	addu $3,$3,$4
  400294:	00 03 04 03 
  400298:	28 00 00 00 	lw $4,0($3)
  40029c:	00 00 04 03 
  4002a0:	28 00 00 00 	lw $3,0($30)
  4002a4:	00 00 03 1e 
  4002a8:	42 00 00 00 	addu $4,$4,$3
  4002ac:	00 04 03 04 
  4002b0:	34 00 00 00 	sw $4,0($2)
  4002b4:	00 00 04 02 
  4002b8:	28 00 00 00 	lw $3,4($30)
  4002bc:	04 00 03 1e 
  4002c0:	43 00 00 00 	addiu $2,$3,1
  4002c4:	01 00 02 03 
  4002c8:	42 00 00 00 	addu $3,$0,$2
  4002cc:	00 03 02 00 
  4002d0:	34 00 00 00 	sw $3,4($30)
  4002d4:	04 00 03 1e 
  4002d8:	01 00 00 00 	j 400228 <inc+0x38>
  4002dc:	8a 00 10 00 
  4002e0:	42 00 00 00 	addu $29,$0,$30
  4002e4:	00 1d 1e 00 
  4002e8:	28 00 00 00 	lw $30,8($29)
  4002ec:	08 00 1e 1d 
  4002f0:	43 00 00 00 	addiu $29,$29,16
  4002f4:	10 00 1d 1d 
  4002f8:	03 00 00 00 	jr $31
  4002fc:	00 00 00 1f 

00400300 <main>:
  400300:	43 00 00 00 	addiu $29,$29,-32
  400304:	e0 ff 1d 1d 
  400308:	34 00 00 00 	sw $31,28($29)
  40030c:	1c 00 1f 1d 
  400310:	34 00 00 00 	sw $30,24($29)
  400314:	18 00 1e 1d 
  400318:	42 00 00 00 	addu $30,$0,$29
  40031c:	00 1e 1d 00 
  400320:	02 00 00 00 	jal 4005a8 <__main>
  400324:	6a 01 10 00 
  400328:	34 00 00 00 	sw $0,16($30)
  40032c:	10 00 00 1e 
  400330:	28 00 00 00 	lw $2,16($30)
  400334:	10 00 02 1e 
  400338:	5c 00 00 00 	slti $3,$2,5
  40033c:	05 00 03 02 
  400340:	06 00 00 00 	bne $3,$0,400350 <main+0x50>
  400344:	02 00 00 03 
  400348:	01 00 00 00 	j 4003c8 <main+0xc8>
  40034c:	f2 00 10 00 
  400350:	28 00 00 00 	lw $2,16($30)
  400354:	10 00 02 1e 
  400358:	42 00 00 00 	addu $4,$0,$2
  40035c:	00 04 02 00 
  400360:	55 00 00 00 	sll $3,$4,0x2
  400364:	02 03 04 00 
  400368:	42 00 00 00 	addu $3,$3,$2
  40036c:	00 03 02 03 
  400370:	55 00 00 00 	sll $2,$3,0x3
  400374:	03 02 03 00 
  400378:	a2 00 00 00 	lui $3,4096
  40037c:	00 10 03 00 
  400380:	43 00 00 00 	addiu $3,$3,96
  400384:	60 00 03 03 
  400388:	42 00 00 00 	addu $2,$2,$3
  40038c:	00 02 03 02 
  400390:	42 00 00 00 	addu $4,$0,$2
  400394:	00 04 02 00 
  400398:	02 00 00 00 	jal 4001f0 <inc>
  40039c:	7c 00 10 00 
  4003a0:	28 00 00 00 	lw $3,16($30)
  4003a4:	10 00 03 1e 
  4003a8:	43 00 00 00 	addiu $2,$3,1
  4003ac:	01 00 02 03 
  4003b0:	42 00 00 00 	addu $3,$0,$2
  4003b4:	00 03 02 00 
  4003b8:	34 00 00 00 	sw $3,16($30)
  4003bc:	10 00 03 1e 
  4003c0:	01 00 00 00 	j 400330 <main+0x30>
  4003c4:	cc 00 10 00 
  4003c8:	42 00 00 00 	addu $2,$0,$0
  4003cc:	00 02 00 00 
  4003d0:	01 00 00 00 	j 4003d8 <main+0xd8>
  4003d4:	f6 00 10 00 
  4003d8:	42 00 00 00 	addu $29,$0,$30
  4003dc:	00 1d 1e 00 
  4003e0:	28 00 00 00 	lw $31,28($29)
  4003e4:	1c 00 1f 1d 
  4003e8:	28 00 00 00 	lw $30,24($29)
  4003ec:	18 00 1e 1d 
  4003f0:	43 00 00 00 	addiu $29,$29,32
  4003f4:	20 00 1d 1d 
  4003f8:	03 00 00 00 	jr $31
  4003fc:	00 00 00 1f
