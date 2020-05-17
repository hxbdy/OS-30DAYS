[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_init_gdtidt
	EXTERN	_init_pic
	EXTERN	_io_sti
	EXTERN	_fifo32_init
	EXTERN	_init_pit
	EXTERN	_init_keyboard
	EXTERN	_enable_mouse
	EXTERN	_io_out8
	EXTERN	_timer_alloc
	EXTERN	_timer_init
	EXTERN	_timer_settime
	EXTERN	_memtest
	EXTERN	_memman_init
	EXTERN	_memman_free
	EXTERN	_init_palette
	EXTERN	_shtctl_init
	EXTERN	_sheet_alloc
	EXTERN	_memman_alloc_4k
	EXTERN	_sheet_setbuf
	EXTERN	_init_screen8
	EXTERN	_init_mouse_cursor8
	EXTERN	_sheet_slide
	EXTERN	_sheet_updown
	EXTERN	_sprintf
	EXTERN	_memman_total
	EXTERN	_task_init
	EXTERN	_task_alloc
	EXTERN	_task_run
	EXTERN	_io_cli
	EXTERN	_fifo32_status
	EXTERN	_fifo32_get
	EXTERN	_boxfill8
	EXTERN	_sheet_refresh
	EXTERN	_mouse_decode
	EXTERN	_keytable.0
	EXTERN	_task_sleep
	EXTERN	_io_stihlt
	EXTERN	_putfonts8_asc
[FILE "bootpack.c"]
[SECTION .data]
_keytable.0:
	DB	0
	DB	0
	DB	49
	DB	50
	DB	51
	DB	52
	DB	53
	DB	54
	DB	55
	DB	56
	DB	57
	DB	48
	DB	45
	DB	94
	DB	0
	DB	0
	DB	81
	DB	87
	DB	69
	DB	82
	DB	84
	DB	89
	DB	85
	DB	73
	DB	79
	DB	80
	DB	64
	DB	91
	DB	0
	DB	0
	DB	65
	DB	83
	DB	68
	DB	70
	DB	71
	DB	72
	DB	74
	DB	75
	DB	76
	DB	59
	DB	58
	DB	0
	DB	0
	DB	93
	DB	90
	DB	88
	DB	67
	DB	86
	DB	66
	DB	78
	DB	77
	DB	44
	DB	46
	DB	47
	DB	0
	DB	42
	DB	0
	DB	32
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	55
	DB	56
	DB	57
	DB	45
	DB	52
	DB	53
	DB	54
	DB	43
	DB	49
	DB	50
	DB	51
	DB	48
	DB	46
LC0:
	DB	"window",0x00
LC1:
	DB	"(%d, %d)",0x00
LC2:
	DB	"memory %dMB   free : %dKB",0x00
LC8:
	DB	"3[sec]",0x00
LC7:
	DB	"10[sec]",0x00
LC5:
	DB	"[lcr %4d %4d]",0x00
LC6:
	DB	"(%3d, %3d)",0x00
LC3:
	DB	"%02X",0x00
LC4:
	DB	" ",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	LEA	ESI,DWORD [-44+EBP]
	SUB	ESP,908
	CALL	_init_gdtidt
	CALL	_init_pic
	CALL	_io_sti
	LEA	EAX,DWORD [-604+EBP]
	PUSH	0
	PUSH	EAX
	PUSH	128
	PUSH	ESI
	CALL	_fifo32_init
	CALL	_init_pit
	PUSH	256
	PUSH	ESI
	CALL	_init_keyboard
	LEA	EAX,DWORD [-620+EBP]
	PUSH	EAX
	PUSH	512
	PUSH	ESI
	CALL	_enable_mouse
	ADD	ESP,36
	PUSH	248
	PUSH	33
	CALL	_io_out8
	PUSH	239
	PUSH	161
	CALL	_io_out8
	CALL	_timer_alloc
	PUSH	10
	PUSH	ESI
	MOV	EBX,EAX
	PUSH	EAX
	CALL	_timer_init
	PUSH	1000
	PUSH	EBX
	CALL	_timer_settime
	ADD	ESP,36
	CALL	_timer_alloc
	PUSH	3
	MOV	EBX,EAX
	PUSH	ESI
	PUSH	EAX
	CALL	_timer_init
	PUSH	300
	PUSH	EBX
	CALL	_timer_settime
	CALL	_timer_alloc
	PUSH	1
	PUSH	ESI
	PUSH	EAX
	MOV	DWORD [-880+EBP],EAX
	CALL	_timer_init
	ADD	ESP,32
	PUSH	50
	PUSH	DWORD [-880+EBP]
	CALL	_timer_settime
	PUSH	-1073741825
	PUSH	4194304
	CALL	_memtest
	PUSH	3932160
	MOV	DWORD [-896+EBP],EAX
	CALL	_memman_init
	PUSH	647168
	PUSH	4096
	PUSH	3932160
	CALL	_memman_free
	MOV	EAX,DWORD [-896+EBP]
	ADD	ESP,32
	SUB	EAX,4194304
	PUSH	EAX
	PUSH	4194304
	PUSH	3932160
	CALL	_memman_free
	CALL	_init_palette
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [4088]
	PUSH	3932160
	CALL	_shtctl_init
	MOV	EBX,EAX
	PUSH	EAX
	CALL	_sheet_alloc
	ADD	ESP,32
	PUSH	EBX
	MOV	DWORD [-900+EBP],EAX
	CALL	_sheet_alloc
	PUSH	EBX
	LEA	EBX,DWORD [-876+EBP]
	MOV	DWORD [-904+EBP],EAX
	CALL	_sheet_alloc
	MOVSX	EDX,WORD [4086]
	MOV	DWORD [-908+EBP],EAX
	MOVSX	EAX,WORD [4084]
	IMUL	EAX,EDX
	PUSH	EAX
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	8320
	PUSH	3932160
	MOV	ESI,EAX
	CALL	_memman_alloc_4k
	PUSH	-1
	MOV	EDI,EAX
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	ESI
	PUSH	DWORD [-900+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,44
	PUSH	99
	PUSH	16
	PUSH	16
	PUSH	EBX
	PUSH	DWORD [-904+EBP]
	CALL	_sheet_setbuf
	PUSH	-1
	PUSH	52
	PUSH	160
	PUSH	EDI
	PUSH	DWORD [-908+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,40
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	ESI
	CALL	_init_screen8
	PUSH	99
	PUSH	EBX
	MOV	EBX,2
	CALL	_init_mouse_cursor8
	PUSH	LC0
	PUSH	52
	PUSH	160
	PUSH	EDI
	CALL	_make_window8
	ADD	ESP,36
	PUSH	7
	PUSH	16
	PUSH	144
	PUSH	28
	PUSH	8
	PUSH	DWORD [-908+EBP]
	CALL	_make_textbox8
	PUSH	0
	PUSH	0
	PUSH	DWORD [-900+EBP]
	MOV	DWORD [-888+EBP],8
	MOV	DWORD [-892+EBP],7
	CALL	_sheet_slide
	ADD	ESP,36
	MOVSX	EAX,WORD [4084]
	LEA	ECX,DWORD [-16+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	MOV	DWORD [-884+EBP],EAX
	MOVSX	EAX,WORD [4086]
	LEA	ECX,DWORD [-44+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	PUSH	EAX
	MOV	EDI,EAX
	PUSH	DWORD [-884+EBP]
	PUSH	DWORD [-904+EBP]
	LEA	EBX,DWORD [-92+EBP]
	CALL	_sheet_slide
	PUSH	72
	PUSH	80
	PUSH	DWORD [-908+EBP]
	CALL	_sheet_slide
	PUSH	0
	PUSH	DWORD [-900+EBP]
	CALL	_sheet_updown
	ADD	ESP,32
	PUSH	1
	PUSH	DWORD [-908+EBP]
	CALL	_sheet_updown
	PUSH	2
	PUSH	DWORD [-904+EBP]
	CALL	_sheet_updown
	PUSH	EDI
	PUSH	DWORD [-884+EBP]
	PUSH	LC1
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,32
	PUSH	10
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	0
	PUSH	0
	PUSH	DWORD [-900+EBP]
	CALL	_putfonts8_asc_sht
	PUSH	3932160
	CALL	_memman_total
	SHR	DWORD [-896+EBP],20
	SHR	EAX,10
	MOV	DWORD [ESP],EAX
	PUSH	DWORD [-896+EBP]
	PUSH	LC2
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,44
	PUSH	40
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	32
	PUSH	0
	PUSH	DWORD [-900+EBP]
	CALL	_putfonts8_asc_sht
	PUSH	3932160
	CALL	_task_init
	ADD	ESP,32
	MOV	DWORD [-912+EBP],EAX
	MOV	DWORD [-20+EBP],EAX
	CALL	_task_alloc
	PUSH	65536
	PUSH	3932160
	MOV	EBX,EAX
	CALL	_memman_alloc_4k
	MOV	EDX,DWORD [-900+EBP]
	ADD	EAX,65528
	MOV	DWORD [64+EBX],EAX
	MOV	DWORD [40+EBX],_task_b_main
	MOV	DWORD [80+EBX],8
	MOV	DWORD [84+EBX],16
	MOV	DWORD [88+EBX],8
	MOV	DWORD [92+EBX],8
	MOV	DWORD [96+EBX],8
	MOV	DWORD [100+EBX],8
	MOV	DWORD [4+EAX],EDX
	PUSH	EBX
	CALL	_task_run
L31:
	ADD	ESP,12
L2:
	LEA	ESI,DWORD [-44+EBP]
	CALL	_io_cli
	PUSH	ESI
	CALL	_fifo32_status
	POP	EBX
	TEST	EAX,EAX
	JE	L33
	PUSH	ESI
	CALL	_fifo32_get
	MOV	EBX,EAX
	CALL	_io_sti
	POP	EDX
	LEA	EAX,DWORD [-256+EBX]
	CMP	EAX,255
	JBE	L34
	LEA	EAX,DWORD [-512+EBX]
	CMP	EAX,255
	JBE	L35
	CMP	EBX,10
	JE	L36
	CMP	EBX,3
	JE	L37
	CMP	EBX,1
	JG	L2
	TEST	EBX,EBX
	JE	L28
	PUSH	0
	PUSH	ESI
	PUSH	DWORD [-880+EBP]
	CALL	_timer_init
	MOV	DWORD [-892+EBP],0
L32:
	ADD	ESP,12
	PUSH	50
	PUSH	DWORD [-880+EBP]
	CALL	_timer_settime
	MOV	EDX,DWORD [-908+EBP]
	MOV	EAX,DWORD [-888+EBP]
	PUSH	43
	ADD	EAX,7
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-888+EBP]
	PUSH	DWORD [-892+EBP]
	PUSH	DWORD [4+EDX]
	PUSH	DWORD [EDX]
	CALL	_boxfill8
	MOV	EAX,DWORD [-888+EBP]
	ADD	ESP,36
	ADD	EAX,8
	PUSH	44
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-888+EBP]
	PUSH	DWORD [-908+EBP]
	CALL	_sheet_refresh
	ADD	ESP,20
	JMP	L2
L28:
	PUSH	1
	PUSH	ESI
	PUSH	DWORD [-880+EBP]
	CALL	_timer_init
	MOV	DWORD [-892+EBP],7
	JMP	L32
L37:
	PUSH	6
	PUSH	LC8
	PUSH	14
	PUSH	7
	PUSH	80
L30:
	PUSH	0
	PUSH	DWORD [-900+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	JMP	L2
L36:
	PUSH	7
	PUSH	LC7
	PUSH	14
	PUSH	7
	PUSH	64
	JMP	L30
L35:
	MOVZX	EAX,BL
	PUSH	EAX
	LEA	EAX,DWORD [-620+EBP]
	PUSH	EAX
	CALL	_mouse_decode
	POP	EDX
	POP	ECX
	TEST	EAX,EAX
	JE	L2
	PUSH	DWORD [-612+EBP]
	PUSH	DWORD [-616+EBP]
	PUSH	LC5
	LEA	EBX,DWORD [-92+EBP]
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,16
	MOV	EAX,DWORD [-608+EBP]
	TEST	EAX,1
	JE	L14
	MOV	BYTE [-91+EBP],76
L14:
	TEST	EAX,2
	JE	L15
	MOV	BYTE [-89+EBP],82
L15:
	AND	EAX,4
	JE	L16
	MOV	BYTE [-90+EBP],67
L16:
	PUSH	15
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	16
	PUSH	32
	PUSH	DWORD [-900+EBP]
	CALL	_putfonts8_asc_sht
	MOV	EAX,DWORD [-616+EBP]
	ADD	EDI,DWORD [-612+EBP]
	ADD	ESP,28
	ADD	DWORD [-884+EBP],EAX
	JS	L38
L17:
	TEST	EDI,EDI
	JS	L39
L18:
	MOVSX	EAX,WORD [4084]
	DEC	EAX
	CMP	DWORD [-884+EBP],EAX
	JLE	L19
	MOV	DWORD [-884+EBP],EAX
L19:
	MOVSX	EAX,WORD [4086]
	DEC	EAX
	CMP	EDI,EAX
	JLE	L20
	MOV	EDI,EAX
L20:
	PUSH	EDI
	PUSH	DWORD [-884+EBP]
	PUSH	LC6
	PUSH	EBX
	CALL	_sprintf
	PUSH	10
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	0
	PUSH	0
	PUSH	DWORD [-900+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,44
	PUSH	EDI
	PUSH	DWORD [-884+EBP]
	PUSH	DWORD [-904+EBP]
	CALL	_sheet_slide
	ADD	ESP,12
	TEST	DWORD [-608+EBP],1
	JE	L2
	LEA	EAX,DWORD [-8+EDI]
	PUSH	EAX
	MOV	EAX,DWORD [-884+EBP]
	SUB	EAX,80
	PUSH	EAX
	PUSH	DWORD [-908+EBP]
	CALL	_sheet_slide
	JMP	L31
L39:
	XOR	EDI,EDI
	JMP	L18
L38:
	MOV	DWORD [-884+EBP],0
	JMP	L17
L34:
	PUSH	EAX
	LEA	ESI,DWORD [-92+EBP]
	PUSH	LC3
	PUSH	ESI
	CALL	_sprintf
	PUSH	2
	PUSH	ESI
	PUSH	14
	PUSH	7
	PUSH	16
	PUSH	0
	PUSH	DWORD [-900+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,40
	CMP	EBX,339
	JG	L8
	MOV	AL,BYTE [_keytable.0-256+EBX]
	TEST	AL,AL
	JE	L8
	CMP	DWORD [-888+EBP],143
	JG	L8
	PUSH	1
	MOV	BYTE [-92+EBP],AL
	PUSH	ESI
	PUSH	7
	PUSH	0
	PUSH	28
	PUSH	DWORD [-888+EBP]
	PUSH	DWORD [-908+EBP]
	MOV	BYTE [-91+EBP],0
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	ADD	DWORD [-888+EBP],8
L8:
	CMP	EBX,270
	JE	L40
L10:
	MOV	EAX,DWORD [-888+EBP]
	PUSH	43
	ADD	EAX,7
	MOV	EBX,DWORD [-908+EBP]
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-888+EBP]
	PUSH	DWORD [-892+EBP]
	PUSH	DWORD [4+EBX]
	PUSH	DWORD [EBX]
	CALL	_boxfill8
	MOV	EAX,DWORD [-888+EBP]
	PUSH	44
	ADD	EAX,8
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-888+EBP]
	PUSH	EBX
	CALL	_sheet_refresh
	ADD	ESP,48
	JMP	L2
L40:
	CMP	DWORD [-888+EBP],8
	JLE	L10
	PUSH	1
	PUSH	LC4
	PUSH	7
	PUSH	0
	PUSH	28
	PUSH	DWORD [-888+EBP]
	PUSH	DWORD [-908+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	SUB	DWORD [-888+EBP],8
	JMP	L10
L33:
	PUSH	DWORD [-912+EBP]
	CALL	_task_sleep
	CALL	_io_stihlt
	POP	ECX
	JMP	L2
[SECTION .data]
_closebtn.1:
	DB	"OOOOOOOOOOOOOOO@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQ@@QQQQ@@QQ$@"
	DB	"OQQQQ@@QQ@@QQQ$@"
	DB	"OQQQQQ@@@@QQQQ$@"
	DB	"OQQQQQQ@@QQQQQ$@"
	DB	"OQQQQQ@@@@QQQQ$@"
	DB	"OQQQQ@@QQ@@QQQ$@"
	DB	"OQQQ@@QQQQ@@QQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"O$$$$$$$$$$$$$$@"
	DB	"@@@@@@@@@@@@@@@@"
[SECTION .text]
	GLOBAL	_make_window8
_make_window8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,20
	MOV	EBX,DWORD [12+EBP]
	PUSH	0
	LEA	EAX,DWORD [-1+EBX]
	LEA	EDI,DWORD [-2+EBX]
	PUSH	EAX
	MOV	DWORD [-20+EBP],EAX
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	1
	PUSH	EDI
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EDX,DWORD [16+EBP]
	ADD	ESP,56
	DEC	EDX
	MOV	DWORD [-24+EBP],EDX
	PUSH	EDX
	PUSH	0
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	ESI,DWORD [16+EBP]
	SUB	ESI,2
	PUSH	ESI
	PUSH	1
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	ESI
	PUSH	EDI
	PUSH	1
	PUSH	EDI
	PUSH	15
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	DWORD [-24+EBP]
	PUSH	DWORD [-20+EBP]
	PUSH	0
	PUSH	DWORD [-20+EBP]
	PUSH	0
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EAX,DWORD [16+EBP]
	ADD	ESP,56
	SUB	EAX,3
	PUSH	EAX
	LEA	EAX,DWORD [-3+EBX]
	PUSH	EAX
	PUSH	2
	PUSH	2
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-4+EBX]
	PUSH	20
	PUSH	EAX
	PUSH	3
	PUSH	3
	PUSH	12
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	ESI
	PUSH	EDI
	PUSH	ESI
	PUSH	1
	PUSH	15
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	DWORD [-24+EBP]
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-24+EBP]
	PUSH	0
	PUSH	0
	IMUL	ESI,EBX,5
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	DWORD [20+EBP]
	PUSH	7
	PUSH	4
	PUSH	24
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc
	ADD	ESP,24
	MOV	DWORD [-16+EBP],0
	MOV	DWORD [-32+EBP],0
L57:
	LEA	EAX,DWORD [ESI+EBX*1]
	MOV	EDX,DWORD [8+EBP]
	XOR	EDI,EDI
	LEA	ECX,DWORD [-21+EDX+EAX*1]
L56:
	MOV	EAX,DWORD [-32+EBP]
	MOV	DL,BYTE [_closebtn.1+EDI+EAX*1]
	CMP	DL,64
	JE	L62
	CMP	DL,36
	JE	L63
	CMP	DL,81
	MOV	DL,8
	SETNE	AL
	SUB	DL,AL
L51:
	INC	EDI
	MOV	BYTE [ECX],DL
	INC	ECX
	CMP	EDI,15
	JLE	L56
	INC	DWORD [-16+EBP]
	ADD	ESI,EBX
	ADD	DWORD [-32+EBP],16
	CMP	DWORD [-16+EBP],13
	JLE	L57
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L63:
	MOV	DL,15
	JMP	L51
L62:
	XOR	EDX,EDX
	JMP	L51
	GLOBAL	_putfonts8_asc_sht
_putfonts8_asc_sht:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,12
	MOV	EAX,DWORD [8+EBP]
	MOV	EDI,DWORD [16+EBP]
	MOV	DWORD [-16+EBP],EAX
	MOV	EBX,DWORD [20+EBP]
	MOV	EAX,DWORD [12+EBP]
	MOV	DWORD [-20+EBP],EAX
	MOV	EAX,DWORD [28+EBP]
	MOV	DWORD [-24+EBP],EAX
	LEA	EAX,DWORD [15+EDI]
	PUSH	EAX
	MOV	EAX,DWORD [-20+EBP]
	MOV	ESI,DWORD [32+EBP]
	MOVSX	EBX,BL
	LEA	ESI,DWORD [EAX+ESI*8]
	LEA	EAX,DWORD [-1+ESI]
	PUSH	EAX
	PUSH	EDI
	PUSH	DWORD [-20+EBP]
	MOVZX	EAX,BYTE [24+EBP]
	PUSH	EAX
	MOV	EAX,DWORD [-16+EBP]
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	PUSH	DWORD [-24+EBP]
	PUSH	EBX
	PUSH	EDI
	PUSH	DWORD [-20+EBP]
	MOV	EAX,DWORD [-16+EBP]
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_putfonts8_asc
	MOV	DWORD [16+EBP],EDI
	LEA	EAX,DWORD [16+EDI]
	MOV	DWORD [20+EBP],ESI
	MOV	DWORD [24+EBP],EAX
	ADD	ESP,52
	MOV	EAX,DWORD [-20+EBP]
	MOV	DWORD [12+EBP],EAX
	MOV	EAX,DWORD [-16+EBP]
	MOV	DWORD [8+EBP],EAX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_sheet_refresh
	GLOBAL	_make_textbox8
_make_textbox8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,20
	MOV	EAX,DWORD [12+EBP]
	MOV	ESI,DWORD [16+EBP]
	ADD	EAX,DWORD [20+EBP]
	SUB	ESI,3
	PUSH	ESI
	MOV	DWORD [-16+EBP],EAX
	MOV	EAX,DWORD [16+EBP]
	ADD	EAX,DWORD [24+EBP]
	MOV	DWORD [-20+EBP],EAX
	MOV	EAX,DWORD [-16+EBP]
	INC	EAX
	PUSH	EAX
	MOV	DWORD [-24+EBP],EAX
	MOV	EAX,DWORD [12+EBP]
	PUSH	ESI
	SUB	EAX,2
	PUSH	EAX
	MOV	DWORD [-28+EBP],EAX
	MOV	EAX,DWORD [8+EBP]
	PUSH	15
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EDI,DWORD [12+EBP]
	MOV	EAX,DWORD [-20+EBP]
	SUB	EDI,3
	INC	EAX
	PUSH	EAX
	MOV	DWORD [-32+EBP],EAX
	PUSH	EDI
	MOV	EAX,DWORD [8+EBP]
	PUSH	ESI
	PUSH	EDI
	PUSH	15
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	ADD	ESP,56
	MOV	EBX,DWORD [-20+EBP]
	ADD	EBX,2
	PUSH	EBX
	PUSH	DWORD [-24+EBP]
	PUSH	EBX
	PUSH	EDI
	PUSH	7
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [-16+EBP]
	PUSH	EBX
	ADD	EAX,2
	PUSH	EAX
	PUSH	ESI
	PUSH	EAX
	MOV	EAX,DWORD [8+EBP]
	PUSH	7
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	ADD	ESP,56
	MOV	EBX,DWORD [16+EBP]
	SUB	EBX,2
	MOV	EDI,DWORD [12+EBP]
	PUSH	EBX
	DEC	EDI
	PUSH	DWORD [-16+EBP]
	PUSH	EBX
	PUSH	EDI
	PUSH	0
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-28+EBP]
	PUSH	EBX
	PUSH	DWORD [-28+EBP]
	PUSH	0
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	ADD	ESP,56
	PUSH	DWORD [-32+EBP]
	PUSH	DWORD [-16+EBP]
	PUSH	DWORD [-32+EBP]
	PUSH	DWORD [-28+EBP]
	PUSH	8
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	PUSH	DWORD [-32+EBP]
	PUSH	DWORD [-24+EBP]
	PUSH	EBX
	PUSH	DWORD [-24+EBP]
	PUSH	8
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [16+EBP]
	ADD	ESP,56
	DEC	EAX
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	PUSH	EAX
	PUSH	EDI
	MOVZX	EAX,BYTE [28+EBP]
	PUSH	EAX
	MOV	EAX,DWORD [8+EBP]
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
[SECTION .data]
LC9:
	DB	"%11d",0x00
[SECTION .text]
	GLOBAL	_task_b_main
_task_b_main:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	LEA	EAX,DWORD [-556+EBP]
	SUB	ESP,568
	LEA	EBX,DWORD [-44+EBP]
	MOV	DWORD [-576+EBP],0
	PUSH	0
	PUSH	EAX
	PUSH	128
	PUSH	EBX
	MOV	DWORD [-580+EBP],0
	CALL	_fifo32_init
	CALL	_timer_alloc
	PUSH	1
	PUSH	EBX
	MOV	EDI,EAX
	PUSH	EAX
	CALL	_timer_init
	PUSH	1
	PUSH	EDI
	CALL	_timer_settime
	ADD	ESP,36
	CALL	_timer_alloc
	PUSH	100
	MOV	ESI,EAX
	PUSH	EBX
	PUSH	EAX
	CALL	_timer_init
	PUSH	100
	PUSH	ESI
	CALL	_timer_settime
	ADD	ESP,20
L67:
	LEA	EBX,DWORD [-44+EBP]
	INC	DWORD [-576+EBP]
	CALL	_io_cli
	PUSH	EBX
	CALL	_fifo32_status
	POP	EDX
	TEST	EAX,EAX
	JE	L76
	PUSH	EBX
	CALL	_fifo32_get
	MOV	EBX,EAX
	CALL	_io_sti
	POP	ECX
	CMP	EBX,1
	JE	L77
	CMP	EBX,100
	JNE	L67
	MOV	EAX,DWORD [-576+EBP]
	LEA	EBX,DWORD [-572+EBP]
	SUB	EAX,DWORD [-580+EBP]
	PUSH	EAX
	PUSH	LC9
	PUSH	EBX
	CALL	_sprintf
	PUSH	11
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	128
	PUSH	0
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,40
	MOV	EAX,DWORD [-576+EBP]
	PUSH	100
	MOV	DWORD [-580+EBP],EAX
	PUSH	ESI
L75:
	CALL	_timer_settime
	POP	EAX
	POP	EDX
	JMP	L67
L77:
	PUSH	DWORD [-576+EBP]
	PUSH	LC9
	LEA	EBX,DWORD [-572+EBP]
	PUSH	EBX
	CALL	_sprintf
	PUSH	11
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	144
	PUSH	0
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,40
	PUSH	1
	PUSH	EDI
	JMP	L75
L76:
	CALL	_io_sti
	JMP	L67
