	area name,code,readonly
PINSEL1 equ 0xE002C004
AD0CR equ 0xE0034000
AD0GDR equ 0xE0034004

T0CTCR equ 0xE0004070
T0PR equ 0xE000400C
T0TCR equ 0xE0004004
T0TC equ 0xE0004008
T0MCR equ 0xE0004014
T0MR1 equ 0xE000401C
T0EMR equ 0xE000403C
PINSEL0 equ 0xE002C000
	
	ldr r0,=PINSEL0
	mov r1,#0x0800
	str r1,[r0]
	ldr r0,=T0CTCR
	mov r1,#0x0
	str r1,[r0]
	ldr r0,=T0PR
	ldr r1,=0x2dc6bf
	str r1,[r0]
	ldr r0,=T0MCR
	mov r1,#0x010
	str r1,[r0]
	ldr r0,=T0MR1
	mov r1,#0x04
	str r1,[r0]
	ldr r0,=T0EMR
	mov r1,#0x0C2
	str r1,[r0]
	ldr r0,=T0TCR
	mov r1,#0x02
	str r1,[r0]
	ldr r0,=T0TCR
	mov r1,#0x01
	str r1,[r0]
	
DONE 
	ldr r1,=PINSEL1
	ldr r2,=0x15000000 
	str r2,[r1]
	ldr r1,=AD0CR 
	ldr r2,=0x4200102  
	str r2,[r1]
l0  ldr r3,=AD0GDR  
	ldr r4,[r3]
	ldr r1,=0x80000000  
	and r1,r4
	ldr r5,=0x80000000
	cmp r1,r5
	bne l0
	ldr r4,[r3]
	ldr r1,=0x0000ffc0 
	and r7,r1,r4
	lsr r8,r7,#6
	
	B DONE
	END
