	.386p
	ifdef ??version
	if    ??version GT 500H
	.mmx
	endif
	endif
	model flat
	ifndef	??version
	?debug	macro
	endm
	endif
	?debug	S "D:\igor9\work575\vctime\AvcTime.cpp"
	?debug	T "D:\igor9\work575\vctime\AvcTime.cpp"
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
_DATA	segment dword public use32 'DATA'
_DATA	ends
_BSS	segment dword public use32 'BSS'
_BSS	ends
$$BSYMS	segment byte public use32 'DEBSYM'
$$BSYMS	ends
$$BTYPES	segment byte public use32 'DEBTYP'
$$BTYPES	ends
$$BNAMES	segment byte public use32 'DEBNAM'
$$BNAMES	ends
$$BROWSE	segment byte public use32 'DEBSYM'
$$BROWSE	ends
$$BROWFILE	segment byte public use32 'DEBSYM'
$$BROWFILE	ends
 ?debug  C FB0C0100600000
DGROUP	group	_BSS,_DATA
_TEXT	segment dword public use32 'CODE'
@avc_time$qv	segment virtual
@@avc_time$qv	proc	near
?live16385@0:
	?debug L 15
	push      ebp
	mov       ebp,esp
	?debug L 17
@1:
	call      @vc_time
	?debug L 18
@3:
@2:
	pop       ebp
	ret 
	?debug L 0
@@avc_time$qv	endp
@avc_time$qv	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	db	2
	db	0
	db	0
	db	0
	dw	59
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch1
	dd	?patch2
	dd	?patch3
	df	@@avc_time$qv
	dw	0
	dw	4096
	dw	0
	dw	1
	dw	0
	dw	0
	dw	0
	db	12
	db	64
	db	97
	db	118
	db	99
	db	95
	db	116
	db	105
	db	109
	db	101
	db	36
	db	113
	db	118
?patch1	equ	@3-@@avc_time$qv+2
?patch2	equ	0
?patch3	equ	@3-@@avc_time$qv
	dw	2
	dw	6
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@avc_localtime$qpxl	segment virtual
@@avc_localtime$qpxl	proc	near
?live16386@0:
	?debug L 20
	push      ebp
	mov       ebp,esp
	push      ecx
	?debug L 24
@4:
	push      dword ptr [ebp+8]
	call      @vc_localtime
	mov       dword ptr [ebp-4],eax
	?debug L 26
	add	 esp,4
	?debug L 28
	mov       eax,dword ptr [ebp-4]
	?debug L 29
@6:
@5:
	pop       ecx
	pop       ebp
	ret 
	?debug L 0
@@avc_localtime$qpxl	endp
@avc_localtime$qpxl	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	66
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch4
	dd	?patch5
	dd	?patch6
	df	@@avc_localtime$qpxl
	dw	0
	dw	4098
	dw	0
	dw	12
	dw	0
	dw	0
	dw	0
	db	19
	db	64
	db	97
	db	118
	db	99
	db	95
	db	108
	db	111
	db	99
	db	97
	db	108
	db	116
	db	105
	db	109
	db	101
	db	36
	db	113
	db	112
	db	120
	db	108
	dw	18
	dw	512
	dw	8
	dw	0
	dw	4102
	dw	0
	dw	13
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65532
	dw	65535
	dw	4099
	dw	0
	dw	14
	dw	0
	dw	0
	dw	0
?patch4	equ	@6-@@avc_localtime$qpxl+3
?patch5	equ	0
?patch6	equ	@6-@@avc_localtime$qpxl
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
@avc_mktime$qp6std@tm	segment virtual
@@avc_mktime$qp6std@tm	proc	near
?live16387@0:
	?debug L 31
	push      ebp
	mov       ebp,esp
	push      ecx
	?debug L 35
@7:
	push      dword ptr [ebp+8]
	call      @vc_mktime
	mov       dword ptr [ebp-4],eax
	?debug L 37
	add	 esp,4
	?debug L 39
	mov       eax,dword ptr [ebp-4]
	?debug L 40
@9:
@8:
	pop       ecx
	pop       ebp
	ret 
	?debug L 0
@@avc_mktime$qp6std@tm	endp
@avc_mktime$qp6std@tm	ends
_TEXT	ends
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	68
	dw	517
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dw	0
	dd	?patch7
	dd	?patch8
	dd	?patch9
	df	@@avc_mktime$qp6std@tm
	dw	0
	dw	4105
	dw	0
	dw	15
	dw	0
	dw	0
	dw	0
	db	21
	db	64
	db	97
	db	118
	db	99
	db	95
	db	109
	db	107
	db	116
	db	105
	db	109
	db	101
	db	36
	db	113
	db	112
	db	54
	db	115
	db	116
	db	100
	db	64
	db	116
	db	109
	dw	18
	dw	512
	dw	8
	dw	0
	dw	4099
	dw	0
	dw	16
	dw	0
	dw	0
	dw	0
	dw	18
	dw	512
	dw	65532
	dw	65535
	dw	18
	dw	0
	dw	17
	dw	0
	dw	0
	dw	0
?patch7	equ	@9-@@avc_mktime$qp6std@tm+3
?patch8	equ	0
?patch9	equ	@9-@@avc_mktime$qp6std@tm
	dw	2
	dw	6
	dw	4
	dw	531
	dw	0
$$BSYMS	ends
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
@vc_time equ vc_time
 extrn   vc_time:near
@vc_localtime equ vc_localtime
 extrn   vc_localtime:near
@vc_mktime equ vc_mktime
 extrn   vc_mktime:near
 ?debug  C FB0A41766354696D6500
 ?debug  C 9F757569642E6C6962
 ?debug  C 9F757569642E6C6962
 ?debug  C 9F757569642E6C6962
 ?debug  C 9F757569642E6C6962
 ?debug  C 9F76636C6535302E6C6962
$$BSYMS	segment byte public use32 'DEBSYM'
	dw	?patch10
	dw	37
	dw	18
	dw	0
	dw	0
	dw	0
	dw	0
?patch10	equ	12
	dw	?patch11
	dw	37
	dw	19
	dw	0
	dw	0
	dw	0
	dw	0
?patch11	equ	12
	dw	?patch12
	dw	3
	dw	4107
	dw	0
	dw	20
	dw	0
	dw	0
	dw	0
	dw	2
?patch12	equ	16
	dw	?patch13
	dw	3
	dw	4107
	dw	0
	dw	21
	dw	0
	dw	0
	dw	0
	dw	3
?patch13	equ	16
	dw	?patch14
	dw	3
	dw	4107
	dw	0
	dw	22
	dw	0
	dw	0
	dw	0
	dw	4
?patch14	equ	16
	dw	?patch15
	dw	3
	dw	4107
	dw	0
	dw	23
	dw	0
	dw	0
	dw	0
	dw	5
?patch15	equ	16
	dw	?patch16
	dw	3
	dw	4107
	dw	0
	dw	24
	dw	0
	dw	0
	dw	0
	dw	6
?patch16	equ	16
	dw	?patch17
	dw	3
	dw	4107
	dw	0
	dw	25
	dw	0
	dw	0
	dw	0
	dw	7
?patch17	equ	16
	dw	?patch18
	dw	3
	dw	4107
	dw	0
	dw	26
	dw	0
	dw	0
	dw	0
	dw	8
?patch18	equ	16
	dw	?patch19
	dw	3
	dw	4107
	dw	0
	dw	27
	dw	0
	dw	0
	dw	0
	dw	9
?patch19	equ	16
	dw	?patch20
	dw	3
	dw	4107
	dw	0
	dw	28
	dw	0
	dw	0
	dw	0
	dw	11
?patch20	equ	16
	dw	?patch21
	dw	3
	dw	4107
	dw	0
	dw	29
	dw	0
	dw	0
	dw	0
	dw	12
?patch21	equ	16
	dw	?patch22
	dw	3
	dw	4107
	dw	0
	dw	30
	dw	0
	dw	0
	dw	0
	dw	13
?patch22	equ	16
	dw	?patch23
	dw	3
	dw	4107
	dw	0
	dw	31
	dw	0
	dw	0
	dw	0
	dw	17
?patch23	equ	16
	dw	?patch24
	dw	3
	dw	4108
	dw	0
	dw	32
	dw	0
	dw	0
	dw	0
	dw	16384
?patch24	equ	16
	dw	?patch25
	dw	3
	dw	4107
	dw	0
	dw	33
	dw	0
	dw	0
	dw	0
	dw	0
?patch25	equ	16
	dw	?patch26
	dw	3
	dw	4107
	dw	0
	dw	34
	dw	0
	dw	0
	dw	0
	dw	1
?patch26	equ	16
	dw	?patch27
	dw	3
	dw	4107
	dw	0
	dw	35
	dw	0
	dw	0
	dw	0
	dw	2
?patch27	equ	16
	dw	?patch28
	dw	3
	dw	4107
	dw	0
	dw	36
	dw	0
	dw	0
	dw	0
	dw	3
?patch28	equ	16
	dw	?patch29
	dw	3
	dw	4107
	dw	0
	dw	37
	dw	0
	dw	0
	dw	0
	dw	4
?patch29	equ	16
	dw	?patch30
	dw	3
	dw	4107
	dw	0
	dw	38
	dw	0
	dw	0
	dw	0
	dw	5
?patch30	equ	16
	dw	?patch31
	dw	3
	dw	4107
	dw	0
	dw	39
	dw	0
	dw	0
	dw	0
	dw	6
?patch31	equ	16
	dw	?patch32
	dw	3
	dw	4107
	dw	0
	dw	40
	dw	0
	dw	0
	dw	0
	dw	7
?patch32	equ	16
	dw	?patch33
	dw	3
	dw	4107
	dw	0
	dw	41
	dw	0
	dw	0
	dw	0
	dw	8
?patch33	equ	16
	dw	?patch34
	dw	3
	dw	4107
	dw	0
	dw	42
	dw	0
	dw	0
	dw	0
	dw	9
?patch34	equ	16
	dw	?patch35
	dw	3
	dw	4107
	dw	0
	dw	43
	dw	0
	dw	0
	dw	0
	dw	10
?patch35	equ	16
	dw	?patch36
	dw	3
	dw	4107
	dw	0
	dw	44
	dw	0
	dw	0
	dw	0
	dw	11
?patch36	equ	16
	dw	?patch37
	dw	3
	dw	4107
	dw	0
	dw	45
	dw	0
	dw	0
	dw	0
	dw	12
?patch37	equ	16
	dw	?patch38
	dw	3
	dw	4107
	dw	0
	dw	46
	dw	0
	dw	0
	dw	0
	dw	13
?patch38	equ	16
	dw	?patch39
	dw	37
	dw	47
	dw	0
	dw	0
	dw	0
	dw	0
?patch39	equ	12
	dw	?patch40
	dw	37
	dw	48
	dw	0
	dw	0
	dw	0
	dw	0
?patch40	equ	12
	dw	?patch41
	dw	37
	dw	49
	dw	0
	dw	0
	dw	0
	dw	0
?patch41	equ	12
	dw	?patch42
	dw	37
	dw	50
	dw	0
	dw	0
	dw	0
	dw	0
?patch42	equ	12
	dw	?patch43
	dw	37
	dw	51
	dw	0
	dw	0
	dw	0
	dw	0
?patch43	equ	12
	dw	?patch44
	dw	37
	dw	52
	dw	0
	dw	0
	dw	0
	dw	0
?patch44	equ	12
	dw	?patch45
	dw	37
	dw	53
	dw	0
	dw	0
	dw	0
	dw	0
?patch45	equ	12
	dw	?patch46
	dw	37
	dw	54
	dw	0
	dw	0
	dw	0
	dw	0
?patch46	equ	12
	dw	?patch47
	dw	37
	dw	55
	dw	0
	dw	0
	dw	0
	dw	0
?patch47	equ	12
	dw	?patch48
	dw	37
	dw	56
	dw	0
	dw	0
	dw	0
	dw	0
?patch48	equ	12
	dw	?patch49
	dw	37
	dw	57
	dw	0
	dw	0
	dw	0
	dw	0
?patch49	equ	12
	dw	?patch50
	dw	37
	dw	58
	dw	0
	dw	0
	dw	0
	dw	0
?patch50	equ	12
	dw	?patch51
	dw	37
	dw	59
	dw	0
	dw	0
	dw	0
	dw	0
?patch51	equ	12
	dw	?patch52
	dw	37
	dw	60
	dw	0
	dw	0
	dw	0
	dw	0
?patch52	equ	12
	dw	?patch53
	dw	37
	dw	61
	dw	0
	dw	0
	dw	0
	dw	0
?patch53	equ	12
	dw	?patch54
	dw	37
	dw	62
	dw	0
	dw	0
	dw	0
	dw	0
?patch54	equ	12
	dw	?patch55
	dw	37
	dw	63
	dw	0
	dw	0
	dw	0
	dw	0
?patch55	equ	12
	dw	?patch56
	dw	37
	dw	64
	dw	0
	dw	0
	dw	0
	dw	0
?patch56	equ	12
	dw	?patch57
	dw	37
	dw	65
	dw	0
	dw	0
	dw	0
	dw	0
?patch57	equ	12
	dw	?patch58
	dw	37
	dw	66
	dw	0
	dw	0
	dw	0
	dw	0
?patch58	equ	12
	dw	?patch59
	dw	37
	dw	67
	dw	0
	dw	0
	dw	0
	dw	0
?patch59	equ	12
	dw	?patch60
	dw	37
	dw	68
	dw	0
	dw	0
	dw	0
	dw	0
?patch60	equ	12
	dw	?patch61
	dw	37
	dw	69
	dw	0
	dw	0
	dw	0
	dw	0
?patch61	equ	12
	dw	?patch62
	dw	37
	dw	70
	dw	0
	dw	0
	dw	0
	dw	0
?patch62	equ	12
	dw	?patch63
	dw	37
	dw	71
	dw	0
	dw	0
	dw	0
	dw	0
?patch63	equ	12
	dw	?patch64
	dw	37
	dw	72
	dw	0
	dw	0
	dw	0
	dw	0
?patch64	equ	12
	dw	?patch65
	dw	37
	dw	73
	dw	0
	dw	0
	dw	0
	dw	0
?patch65	equ	12
	dw	?patch66
	dw	37
	dw	74
	dw	0
	dw	0
	dw	0
	dw	0
?patch66	equ	12
	dw	?patch67
	dw	37
	dw	75
	dw	0
	dw	0
	dw	0
	dw	0
?patch67	equ	12
	dw	?patch68
	dw	37
	dw	76
	dw	0
	dw	0
	dw	0
	dw	0
?patch68	equ	12
	dw	?patch69
	dw	37
	dw	77
	dw	0
	dw	0
	dw	0
	dw	0
?patch69	equ	12
	dw	?patch70
	dw	37
	dw	78
	dw	0
	dw	0
	dw	0
	dw	0
?patch70	equ	12
	dw	?patch71
	dw	37
	dw	79
	dw	0
	dw	0
	dw	0
	dw	0
?patch71	equ	12
	dw	?patch72
	dw	37
	dw	80
	dw	0
	dw	0
	dw	0
	dw	0
?patch72	equ	12
	dw	?patch73
	dw	37
	dw	81
	dw	0
	dw	0
	dw	0
	dw	0
?patch73	equ	12
	dw	?patch74
	dw	37
	dw	82
	dw	0
	dw	0
	dw	0
	dw	0
?patch74	equ	12
	dw	?patch75
	dw	37
	dw	83
	dw	0
	dw	0
	dw	0
	dw	0
?patch75	equ	12
	dw	?patch76
	dw	37
	dw	84
	dw	0
	dw	0
	dw	0
	dw	0
?patch76	equ	12
	dw	?patch77
	dw	37
	dw	85
	dw	0
	dw	0
	dw	0
	dw	0
?patch77	equ	12
	dw	?patch78
	dw	37
	dw	86
	dw	0
	dw	0
	dw	0
	dw	0
?patch78	equ	12
	dw	?patch79
	dw	37
	dw	87
	dw	0
	dw	0
	dw	0
	dw	0
?patch79	equ	12
	dw	?patch80
	dw	37
	dw	88
	dw	0
	dw	0
	dw	0
	dw	0
?patch80	equ	12
	dw	?patch81
	dw	37
	dw	89
	dw	0
	dw	0
	dw	0
	dw	0
?patch81	equ	12
	dw	?patch82
	dw	37
	dw	90
	dw	0
	dw	0
	dw	0
	dw	0
?patch82	equ	12
	dw	?patch83
	dw	37
	dw	91
	dw	0
	dw	0
	dw	0
	dw	0
?patch83	equ	12
	dw	?patch84
	dw	37
	dw	92
	dw	0
	dw	0
	dw	0
	dw	0
?patch84	equ	12
	dw	?patch85
	dw	37
	dw	93
	dw	0
	dw	0
	dw	0
	dw	0
?patch85	equ	12
	dw	?patch86
	dw	37
	dw	94
	dw	0
	dw	0
	dw	0
	dw	0
?patch86	equ	12
	dw	?patch87
	dw	37
	dw	95
	dw	0
	dw	0
	dw	0
	dw	0
?patch87	equ	12
	dw	?patch88
	dw	37
	dw	96
	dw	0
	dw	0
	dw	0
	dw	0
?patch88	equ	12
	dw	?patch89
	dw	37
	dw	97
	dw	0
	dw	0
	dw	0
	dw	0
?patch89	equ	12
	dw	?patch90
	dw	37
	dw	98
	dw	0
	dw	0
	dw	0
	dw	0
?patch90	equ	12
	dw	?patch91
	dw	37
	dw	99
	dw	0
	dw	0
	dw	0
	dw	0
?patch91	equ	12
	dw	?patch92
	dw	37
	dw	100
	dw	0
	dw	0
	dw	0
	dw	0
?patch92	equ	12
	dw	?patch93
	dw	37
	dw	101
	dw	0
	dw	0
	dw	0
	dw	0
?patch93	equ	12
	dw	?patch94
	dw	37
	dw	102
	dw	0
	dw	0
	dw	0
	dw	0
?patch94	equ	12
	dw	?patch95
	dw	37
	dw	103
	dw	0
	dw	0
	dw	0
	dw	0
?patch95	equ	12
	dw	?patch96
	dw	37
	dw	104
	dw	0
	dw	0
	dw	0
	dw	0
?patch96	equ	12
	dw	?patch97
	dw	37
	dw	105
	dw	0
	dw	0
	dw	0
	dw	0
?patch97	equ	12
	dw	?patch98
	dw	37
	dw	106
	dw	0
	dw	0
	dw	0
	dw	0
?patch98	equ	12
	dw	?patch99
	dw	37
	dw	107
	dw	0
	dw	0
	dw	0
	dw	0
?patch99	equ	12
	dw	?patch100
	dw	37
	dw	108
	dw	0
	dw	0
	dw	0
	dw	0
?patch100	equ	12
	dw	?patch101
	dw	37
	dw	109
	dw	0
	dw	0
	dw	0
	dw	0
?patch101	equ	12
	dw	?patch102
	dw	37
	dw	110
	dw	0
	dw	0
	dw	0
	dw	0
?patch102	equ	12
	dw	?patch103
	dw	37
	dw	111
	dw	0
	dw	0
	dw	0
	dw	0
?patch103	equ	12
	dw	?patch104
	dw	37
	dw	112
	dw	0
	dw	0
	dw	0
	dw	0
?patch104	equ	12
	dw	?patch105
	dw	37
	dw	113
	dw	0
	dw	0
	dw	0
	dw	0
?patch105	equ	12
	dw	?patch106
	dw	37
	dw	114
	dw	0
	dw	0
	dw	0
	dw	0
?patch106	equ	12
	dw	?patch107
	dw	37
	dw	115
	dw	0
	dw	0
	dw	0
	dw	0
?patch107	equ	12
	dw	?patch108
	dw	37
	dw	116
	dw	0
	dw	0
	dw	0
	dw	0
?patch108	equ	12
	dw	?patch109
	dw	37
	dw	117
	dw	0
	dw	0
	dw	0
	dw	0
?patch109	equ	12
	dw	?patch110
	dw	37
	dw	118
	dw	0
	dw	0
	dw	0
	dw	0
?patch110	equ	12
	dw	?patch111
	dw	37
	dw	119
	dw	0
	dw	0
	dw	0
	dw	0
?patch111	equ	12
	dw	?patch112
	dw	37
	dw	120
	dw	0
	dw	0
	dw	0
	dw	0
?patch112	equ	12
	dw	?patch113
	dw	37
	dw	121
	dw	0
	dw	0
	dw	0
	dw	0
?patch113	equ	12
	dw	?patch114
	dw	37
	dw	122
	dw	0
	dw	0
	dw	0
	dw	0
?patch114	equ	12
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	123
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	124
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4100
	dw	0
	dw	1
	dw	125
	dw	0
	dw	0
	dw	0
	dw	?patch115
	dw	38
	dw	388
	dw	126
	dw	0
	dw	127
	dw	0
	dw	128
	dw	0
	dw	129
	dw	0
	dw	130
	dw	0
	dw	131
	dw	0
	dw	132
	dw	0
	dw	133
	dw	0
	dw	134
	dw	0
	dw	135
	dw	0
	dw	136
	dw	0
	dw	137
	dw	0
	dw	138
	dw	0
	dw	139
	dw	0
	dw	140
	dw	0
	dw	141
	dw	0
	dw	142
	dw	0
	dw	143
	dw	0
	dw	144
	dw	0
	dw	145
	dw	0
	dw	146
	dw	0
	dw	147
	dw	0
	dw	148
	dw	0
	dw	149
	dw	0
	dw	150
	dw	0
	dw	151
	dw	0
	dw	152
	dw	0
	dw	153
	dw	0
	dw	154
	dw	0
	dw	155
	dw	0
	dw	156
	dw	0
	dw	157
	dw	0
	dw	158
	dw	0
	dw	159
	dw	0
	dw	160
	dw	0
	dw	161
	dw	0
	dw	162
	dw	0
	dw	163
	dw	0
	dw	164
	dw	0
	dw	165
	dw	0
	dw	166
	dw	0
	dw	167
	dw	0
	dw	168
	dw	0
	dw	169
	dw	0
	dw	170
	dw	0
	dw	171
	dw	0
	dw	172
	dw	0
	dw	173
	dw	0
	dw	174
	dw	0
	dw	175
	dw	0
	dw	176
	dw	0
	dw	177
	dw	0
	dw	178
	dw	0
	dw	179
	dw	0
	dw	180
	dw	0
	dw	181
	dw	0
	dw	182
	dw	0
	dw	183
	dw	0
	dw	184
	dw	0
	dw	185
	dw	0
	dw	186
	dw	0
	dw	187
	dw	0
	dw	188
	dw	0
	dw	189
	dw	0
	dw	190
	dw	0
	dw	191
	dw	0
	dw	192
	dw	0
	dw	193
	dw	0
	dw	194
	dw	0
	dw	195
	dw	0
	dw	196
	dw	0
	dw	197
	dw	0
	dw	198
	dw	0
	dw	199
	dw	0
	dw	200
	dw	0
	dw	201
	dw	0
	dw	202
	dw	0
	dw	203
	dw	0
	dw	204
	dw	0
	dw	205
	dw	0
	dw	206
	dw	0
	dw	207
	dw	0
	dw	208
	dw	0
	dw	209
	dw	0
	dw	210
	dw	0
	dw	211
	dw	0
	dw	212
	dw	0
	dw	213
	dw	0
	dw	214
	dw	0
	dw	215
	dw	0
	dw	216
	dw	0
	dw	217
	dw	0
	dw	218
	dw	0
	dw	219
	dw	0
	dw	220
	dw	0
	dw	221
	dw	0
	dw	222
	dw	0
	dw	223
	dw	0
	dw	224
	dw	0
	dw	225
	dw	0
	dw	226
	dw	0
	dw	227
	dw	0
	dw	228
	dw	0
	dw	229
	dw	0
	dw	230
	dw	0
	dw	231
	dw	0
	dw	232
	dw	0
	dw	233
	dw	0
	dw	234
	dw	0
	dw	235
	dw	0
	dw	236
	dw	0
	dw	237
	dw	0
	dw	238
	dw	0
	dw	239
	dw	0
	dw	240
	dw	0
	dw	241
	dw	0
	dw	242
	dw	0
	dw	243
	dw	0
	dw	244
	dw	0
	dw	245
	dw	0
	dw	246
	dw	0
	dw	247
	dw	0
	dw	248
	dw	0
	dw	249
	dw	0
	dw	250
	dw	0
	dw	251
	dw	0
	dw	252
	dw	0
	dw	253
	dw	0
	dw	254
	dw	0
	dw	255
	dw	0
	dw	256
	dw	0
	dw	257
	dw	0
	dw	258
	dw	0
	dw	259
	dw	0
	dw	260
	dw	0
	dw	261
	dw	0
	dw	262
	dw	0
	dw	263
	dw	0
	dw	264
	dw	0
	dw	265
	dw	0
	dw	266
	dw	0
	dw	267
	dw	0
	dw	268
	dw	0
	dw	269
	dw	0
	dw	270
	dw	0
	dw	271
	dw	0
	dw	272
	dw	0
	dw	273
	dw	0
	dw	274
	dw	0
	dw	275
	dw	0
	dw	276
	dw	0
	dw	277
	dw	0
	dw	278
	dw	0
	dw	279
	dw	0
	dw	280
	dw	0
	dw	281
	dw	0
	dw	282
	dw	0
	dw	283
	dw	0
	dw	284
	dw	0
	dw	285
	dw	0
	dw	286
	dw	0
	dw	287
	dw	0
	dw	288
	dw	0
	dw	289
	dw	0
	dw	290
	dw	0
	dw	291
	dw	0
	dw	292
	dw	0
	dw	293
	dw	0
	dw	294
	dw	0
	dw	295
	dw	0
	dw	296
	dw	0
	dw	297
	dw	0
	dw	298
	dw	0
	dw	299
	dw	0
	dw	300
	dw	0
	dw	301
	dw	0
	dw	302
	dw	0
	dw	303
	dw	0
	dw	304
	dw	0
	dw	305
	dw	0
	dw	306
	dw	0
	dw	307
	dw	0
	dw	308
	dw	0
	dw	309
	dw	0
	dw	310
	dw	0
	dw	311
	dw	0
	dw	312
	dw	0
	dw	313
	dw	0
	dw	314
	dw	0
	dw	315
	dw	0
	dw	316
	dw	0
	dw	317
	dw	0
	dw	318
	dw	0
	dw	319
	dw	0
	dw	320
	dw	0
	dw	321
	dw	0
	dw	322
	dw	0
	dw	323
	dw	0
	dw	324
	dw	0
	dw	325
	dw	0
	dw	326
	dw	0
	dw	327
	dw	0
	dw	328
	dw	0
	dw	329
	dw	0
	dw	330
	dw	0
	dw	331
	dw	0
	dw	332
	dw	0
	dw	333
	dw	0
	dw	334
	dw	0
	dw	335
	dw	0
	dw	336
	dw	0
	dw	337
	dw	0
	dw	338
	dw	0
	dw	339
	dw	0
	dw	340
	dw	0
	dw	341
	dw	0
	dw	342
	dw	0
	dw	343
	dw	0
	dw	344
	dw	0
	dw	345
	dw	0
	dw	346
	dw	0
	dw	347
	dw	0
	dw	348
	dw	0
	dw	349
	dw	0
	dw	350
	dw	0
	dw	351
	dw	0
	dw	352
	dw	0
	dw	353
	dw	0
	dw	354
	dw	0
	dw	355
	dw	0
	dw	356
	dw	0
	dw	357
	dw	0
	dw	358
	dw	0
	dw	359
	dw	0
	dw	360
	dw	0
	dw	361
	dw	0
	dw	362
	dw	0
	dw	363
	dw	0
	dw	364
	dw	0
	dw	365
	dw	0
	dw	366
	dw	0
	dw	367
	dw	0
	dw	368
	dw	0
	dw	369
	dw	0
	dw	370
	dw	0
	dw	371
	dw	0
	dw	372
	dw	0
	dw	373
	dw	0
	dw	374
	dw	0
	dw	375
	dw	0
	dw	376
	dw	0
	dw	377
	dw	0
	dw	378
	dw	0
	dw	379
	dw	0
	dw	380
	dw	0
	dw	381
	dw	0
	dw	382
	dw	0
	dw	383
	dw	0
	dw	384
	dw	0
	dw	385
	dw	0
	dw	386
	dw	0
	dw	387
	dw	0
	dw	388
	dw	0
	dw	389
	dw	0
	dw	390
	dw	0
	dw	391
	dw	0
	dw	392
	dw	0
	dw	393
	dw	0
	dw	394
	dw	0
	dw	395
	dw	0
	dw	396
	dw	0
	dw	397
	dw	0
	dw	398
	dw	0
	dw	399
	dw	0
	dw	400
	dw	0
	dw	401
	dw	0
	dw	402
	dw	0
	dw	403
	dw	0
	dw	404
	dw	0
	dw	405
	dw	0
	dw	406
	dw	0
	dw	407
	dw	0
	dw	408
	dw	0
	dw	409
	dw	0
	dw	410
	dw	0
	dw	411
	dw	0
	dw	412
	dw	0
	dw	413
	dw	0
	dw	414
	dw	0
	dw	415
	dw	0
	dw	416
	dw	0
	dw	417
	dw	0
	dw	418
	dw	0
	dw	419
	dw	0
	dw	420
	dw	0
	dw	421
	dw	0
	dw	422
	dw	0
	dw	423
	dw	0
	dw	424
	dw	0
	dw	425
	dw	0
	dw	426
	dw	0
	dw	427
	dw	0
	dw	428
	dw	0
	dw	429
	dw	0
	dw	430
	dw	0
	dw	431
	dw	0
	dw	432
	dw	0
	dw	433
	dw	0
	dw	434
	dw	0
	dw	435
	dw	0
	dw	436
	dw	0
	dw	437
	dw	0
	dw	438
	dw	0
	dw	439
	dw	0
	dw	440
	dw	0
	dw	441
	dw	0
	dw	442
	dw	0
	dw	443
	dw	0
	dw	444
	dw	0
	dw	445
	dw	0
	dw	446
	dw	0
	dw	447
	dw	0
	dw	448
	dw	0
	dw	449
	dw	0
	dw	450
	dw	0
	dw	451
	dw	0
	dw	452
	dw	0
	dw	453
	dw	0
	dw	454
	dw	0
	dw	455
	dw	0
	dw	456
	dw	0
	dw	457
	dw	0
	dw	458
	dw	0
	dw	459
	dw	0
	dw	460
	dw	0
	dw	461
	dw	0
	dw	462
	dw	0
	dw	463
	dw	0
	dw	464
	dw	0
	dw	465
	dw	0
	dw	466
	dw	0
	dw	467
	dw	0
	dw	468
	dw	0
	dw	469
	dw	0
	dw	470
	dw	0
	dw	471
	dw	0
	dw	472
	dw	0
	dw	473
	dw	0
	dw	474
	dw	0
	dw	475
	dw	0
	dw	476
	dw	0
	dw	477
	dw	0
	dw	478
	dw	0
	dw	479
	dw	0
	dw	480
	dw	0
	dw	481
	dw	0
	dw	482
	dw	0
	dw	483
	dw	0
	dw	484
	dw	0
	dw	485
	dw	0
	dw	486
	dw	0
	dw	487
	dw	0
	dw	488
	dw	0
	dw	489
	dw	0
	dw	490
	dw	0
	dw	491
	dw	0
	dw	492
	dw	0
	dw	493
	dw	0
	dw	494
	dw	0
	dw	495
	dw	0
	dw	496
	dw	0
	dw	497
	dw	0
	dw	498
	dw	0
	dw	499
	dw	0
	dw	500
	dw	0
	dw	501
	dw	0
	dw	502
	dw	0
	dw	503
	dw	0
	dw	504
	dw	0
	dw	505
	dw	0
	dw	506
	dw	0
	dw	507
	dw	0
	dw	508
	dw	0
	dw	509
	dw	0
	dw	510
	dw	0
	dw	511
	dw	0
	dw	512
	dw	0
	dw	513
	dw	0
?patch115	equ	1556
	dw	?patch116
	dw	1
	db	3
	db	1
	db	0
	db	24
	db	11
	db	66
	db	67
	db	67
	db	51
	db	50
	db	32
	db	53
	db	46
	db	53
	db	46
	db	49
?patch116	equ	18
$$BSYMS	ends
$$BTYPES	segment byte public use32 'DEBTYP'
	db        2,0,0,0,14,0,8,0,18,0,0,0,0,0,0,0
	db        1,16,0,0,4,0,1,2,0,0,14,0,8,0,3,16
	db        0,0,0,0,1,0,8,16,0,0,8,0,2,0,10,0
	db        4,16,0,0,28,0,5,0,9,0,5,16,0,0,0,0
	db        0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0
	db        36,0,180,0,4,2,6,4,116,0,0,0,3,0,3,0
	db        0,0,0,0,0,0,0,0,242,241,6,4,116,0,0,0
	db        3,0,4,0,0,0,0,0,0,0,4,0,242,241,6,4
	db        116,0,0,0,3,0,5,0,0,0,0,0,0,0,8,0
	db        242,241,6,4,116,0,0,0,3,0,6,0,0,0,0,0
	db        0,0,12,0,242,241,6,4,116,0,0,0,3,0,7,0
	db        0,0,0,0,0,0,16,0,242,241,6,4,116,0,0,0
	db        3,0,8,0,0,0,0,0,0,0,20,0,242,241,6,4
	db        116,0,0,0,3,0,9,0,0,0,0,0,0,0,24,0
	db        242,241,6,4,116,0,0,0,3,0,10,0,0,0,0,0
	db        0,0,28,0,242,241,6,4,116,0,0,0,3,0,11,0
	db        0,0,0,0,0,0,32,0,8,0,2,0,10,0,7,16
	db        0,0,8,0,1,0,1,0,18,0,0,0,8,0,1,2
	db        1,0,6,16,0,0,14,0,8,0,18,0,0,0,0,0
	db        1,0,10,16,0,0,8,0,1,2,1,0,3,16,0,0
	db        8,0,1,0,1,0,16,0,0,0,8,0,1,0,1,0
	db        33,0,0,0,14,0,8,0,18,0,0,0,7,0,0,0
	db        14,16,0,0,4,0,1,2,0,0,14,0,8,0,3,16
	db        0,0,7,0,1,0,16,16,0,0,8,0,1,2,1,0
	db        6,16,0,0,14,0,8,0,18,0,0,0,7,0,1,0
	db        18,16,0,0,8,0,1,2,1,0,3,16,0,0
$$BTYPES	ends
$$BNAMES	segment byte public use32 'DEBNAM'
	db	8,'avc_time'
	db	19,'@avc_localtime$qpxl'
	db	6,'tm_sec'
	db	6,'tm_min'
	db	7,'tm_hour'
	db	7,'tm_mday'
	db	6,'tm_mon'
	db	7,'tm_year'
	db	7,'tm_wday'
	db	7,'tm_yday'
	db	8,'tm_isdst'
	db	13,'avc_localtime'
	db	1,'t'
	db	2,'TM'
	db	10,'avc_mktime'
	db	2,'TM'
	db	1,'t'
	db	3,'std'
	db	6,'System'
	db	19,'@System@varSmallint'
	db	18,'@System@varInteger'
	db	17,'@System@varSingle'
	db	17,'@System@varDouble'
	db	19,'@System@varCurrency'
	db	15,'@System@varDate'
	db	17,'@System@varOleStr'
	db	19,'@System@varDispatch'
	db	18,'@System@varBoolean'
	db	18,'@System@varVariant'
	db	18,'@System@varUnknown'
	db	15,'@System@varByte'
	db	16,'@System@varByRef'
	db	17,'@System@vtInteger'
	db	17,'@System@vtBoolean'
	db	14,'@System@vtChar'
	db	18,'@System@vtExtended'
	db	16,'@System@vtString'
	db	17,'@System@vtPointer'
	db	15,'@System@vtPChar'
	db	16,'@System@vtObject'
	db	15,'@System@vtClass'
	db	18,'@System@vtWideChar'
	db	19,'@System@vtPWideChar'
	db	20,'@System@vtAnsiString'
	db	18,'@System@vtCurrency'
	db	17,'@System@vtVariant'
	db	8,'Sysutils'
	db	7,'Sysinit'
	db	7,'Windows'
	db	8,'Messages'
	db	8,'Sysconst'
	db	7,'Classes'
	db	8,'Graphics'
	db	8,'Commctrl'
	db	7,'Imglist'
	db	8,'Actnlist'
	db	3,'Imm'
	db	7,'Contnrs'
	db	5,'Menus'
	db	8,'Multimon'
	db	8,'Controls'
	db	5,'Forms'
	db	7,'Activex'
	db	6,'Urlmon'
	db	7,'Wininet'
	db	6,'Regstr'
	db	8,'Shellapi'
	db	6,'Shlobj'
	db	8,'Stdctrls'
	db	7,'Commdlg'
	db	7,'Dialogs'
	db	8,'Extctrls'
	db	2,'Db'
	db	7,'Toolwin'
	db	8,'Richedit'
	db	8,'Comctrls'
	db	7,'Buttons'
	db	4,'Mask'
	db	7,'Dbctrls'
	db	6,'Smintf'
	db	3,'Bde'
	db	8,'Dbcommon'
	db	8,'Dbtables'
	db	6,'Stdvcl'
	db	6,'Comobj'
	db	7,'Axctrls'
	db	8,'Olectrls'
	db	4,'Ole2'
	db	6,'Olectl'
	db	7,'Chartfx'
	db	8,'Dbcgrids'
	db	5,'Grids'
	db	7,'Dbgrids'
	db	8,'Dblookup'
	db	5,'Ddeml'
	db	6,'Ddeman'
	db	8,'Filectrl'
	db	8,'Graphsvr'
	db	8,'Mmsystem'
	db	7,'Mplayer'
	db	6,'Oledlg'
	db	8,'Olectnrs'
	db	7,'Outline'
	db	8,'Qr3const'
	db	6,'Qrexpr'
	db	8,'Qrexpbld'
	db	8,'Winspool'
	db	8,'Printers'
	db	7,'Qrprntr'
	db	8,'Qrprgres'
	db	8,'Quickrpt'
	db	8,'Tabnotbk'
	db	4,'Tabs'
	db	8,'Vcfimprs'
	db	8,'Vcfrmla1'
	db	8,'Vcspell3'
	db	5,'Midas'
	db	6,'Dsintf'
	db	8,'Dbclient'
	db	8,'Provider'
	db	7,'Databkr'
	db	3,'Mtx'
	db	11,'@std@time_t'
	db	12,'@std@clock_t'
	db	7,'@std@tm'
	db	3,'Mtx'
	db	7,'Databkr'
	db	8,'Provider'
	db	8,'Dbclient'
	db	6,'Dsintf'
	db	5,'Midas'
	db	8,'Vcspell3'
	db	8,'Vcfrmla1'
	db	8,'Vcfimprs'
	db	4,'Tabs'
	db	8,'Tabnotbk'
	db	8,'Quickrpt'
	db	8,'Qrprgres'
	db	7,'Qrprntr'
	db	8,'Printers'
	db	8,'Winspool'
	db	8,'Qrexpbld'
	db	6,'Qrexpr'
	db	8,'Qr3const'
	db	7,'Outline'
	db	8,'Olectnrs'
	db	6,'Oledlg'
	db	7,'Mplayer'
	db	8,'Mmsystem'
	db	8,'Graphsvr'
	db	8,'Filectrl'
	db	6,'Ddeman'
	db	5,'Ddeml'
	db	8,'Dblookup'
	db	7,'Dbgrids'
	db	5,'Grids'
	db	8,'Dbcgrids'
	db	7,'Chartfx'
	db	6,'Olectl'
	db	4,'Ole2'
	db	8,'Olectrls'
	db	7,'Axctrls'
	db	6,'Comobj'
	db	6,'Stdvcl'
	db	8,'Dbtables'
	db	8,'Dbcommon'
	db	3,'Bde'
	db	6,'Smintf'
	db	7,'Dbctrls'
	db	4,'Mask'
	db	7,'Buttons'
	db	8,'Comctrls'
	db	8,'Richedit'
	db	7,'Toolwin'
	db	2,'Db'
	db	8,'Extctrls'
	db	7,'Dialogs'
	db	7,'Commdlg'
	db	8,'Stdctrls'
	db	6,'Shlobj'
	db	8,'Shellapi'
	db	6,'Regstr'
	db	7,'Wininet'
	db	6,'Urlmon'
	db	7,'Activex'
	db	5,'Forms'
	db	8,'Controls'
	db	8,'Multimon'
	db	5,'Menus'
	db	7,'Contnrs'
	db	3,'Imm'
	db	8,'Actnlist'
	db	7,'Imglist'
	db	8,'Commctrl'
	db	8,'Graphics'
	db	7,'Classes'
	db	8,'Sysutils'
	db	8,'Sysconst'
	db	8,'Messages'
	db	7,'Windows'
	db	7,'Sysinit'
	db	6,'System'
	db	11,'_setsystime'
	db	11,'_getsystime'
	db	5,'tzset'
	db	8,'_strtime'
	db	8,'_strdate'
	db	6,'_tzset'
	db	5,'stime'
	db	7,'_wtzset'
	db	8,'wcsftime'
	db	9,'_wstrtime'
	db	9,'_wstrdate'
	db	7,'_wctime'
	db	9,'_wasctime'
	db	9,'_lstrftim'
	db	8,'strftime'
	db	5,'clock'
	db	6,'mktime'
	db	9,'localtime'
	db	6,'gmtime'
	db	8,'difftime'
	db	5,'ctime'
	db	7,'asctime'
	db	8,'heapwalk'
	db	13,'heapchecknode'
	db	13,'heapcheckfree'
	db	12,'heapfillfree'
	db	9,'heapcheck'
	db	11,'_wgetcurdir'
	db	8,'_wgetcwd'
	db	9,'_wfnmerge'
	db	9,'_wfnsplit'
	db	11,'_wfindclose'
	db	10,'_wfindnext'
	db	11,'_wfindfirst'
	db	8,'_wmktemp'
	db	11,'wsearchpath'
	db	7,'_wrmdir'
	db	7,'_wmkdir'
	db	7,'_wchdir'
	db	5,'rmdir'
	db	6,'mktemp'
	db	5,'mkdir'
	db	7,'setdisk'
	db	10,'searchpath'
	db	6,'_rmdir'
	db	7,'_mktemp'
	db	6,'_mkdir'
	db	7,'getdisk'
	db	6,'getcwd'
	db	9,'getcurdir'
	db	7,'fnsplit'
	db	7,'fnmerge'
	db	9,'findclose'
	db	8,'findnext'
	db	9,'findfirst'
	db	5,'chdir'
	db	5,'_rotr'
	db	5,'_rotl'
	db	6,'_crotr'
	db	6,'_lrotr'
	db	6,'_lrotl'
	db	6,'_crotl'
	db	3,'abs'
	db	6,'wctomb'
	db	7,'wcstoul'
	db	8,'wcstombs'
	db	6,'wcstol'
	db	6,'wcstod'
	db	5,'ultoa'
	db	4,'time'
	db	6,'system'
	db	4,'swab'
	db	7,'strtoul'
	db	6,'strtol'
	db	6,'strtod'
	db	5,'srand'
	db	7,'realloc'
	db	4,'rand'
	db	6,'putenv'
	db	6,'perror'
	db	6,'mbtowc'
	db	8,'mbstowcs'
	db	5,'mblen'
	db	13,'_seterrormode'
	db	26,'@std@%max$T1%$qrxT1t1$rxT1'
	db	26,'@std@%min$T1%$qrxT1t1$rxT1'
	db	17,'@std@randomize$qv'
	db	14,'@std@random$qi'
	db	4,'ltoa'
	db	4,'gcvt'
	db	4,'fcvt'
	db	4,'ecvt'
	db	6,'malloc'
	db	4,'ldiv'
	db	4,'labs'
	db	4,'itoa'
	db	6,'getenv'
	db	4,'free'
	db	4,'exit'
	db	3,'div'
	db	6,'calloc'
	db	4,'atol'
	db	4,'atoi'
	db	4,'atof'
	db	6,'atexit'
	db	5,'abort'
	db	6,'_wtold'
	db	5,'_wtol'
	db	5,'_wtoi'
	db	5,'_wtof'
	db	8,'_wsystem'
	db	11,'_wsplitpath'
	db	11,'_wsearchstr'
	db	11,'_wsearchenv'
	db	8,'_wputenv'
	db	8,'_wperror'
	db	10,'_wmakepath'
	db	8,'_wgetenv'
	db	10,'_wfullpath'
	db	8,'_wcstold'
	db	8,'_strtold'
	db	10,'_splitpath'
	db	10,'_searchstr'
	db	10,'_searchenv'
	db	9,'_makepath'
	db	7,'_wtoi64'
	db	8,'_ui64tow'
	db	8,'_ui64toa'
	db	7,'_i64tow'
	db	7,'_i64toa'
	db	7,'_atoi64'
	db	5,'_ltow'
	db	5,'_ltoa'
	db	6,'_lrand'
	db	5,'_itow'
	db	6,'_ultow'
	db	5,'_gcvt'
	db	5,'_fcvt'
	db	9,'_fullpath'
	db	5,'_exit'
	db	6,'_atold'
	db	5,'_ecvt'
	db	7,'__errno'
	db	10,'__doserrno'
	db	5,'qsort'
	db	7,'lsearch'
	db	5,'lfind'
	db	7,'bsearch'
	db	7,'wcsxfrm'
	db	6,'wcstok'
	db	6,'wcsstr'
	db	6,'wcsspn'
	db	7,'wcsrchr'
	db	7,'wcspcpy'
	db	7,'wcspbrk'
	db	7,'wcsncpy'
	db	7,'wcsncmp'
	db	7,'wcsncat'
	db	6,'wcslen'
	db	7,'wcscspn'
	db	6,'wcscpy'
	db	7,'wcscoll'
	db	6,'wcscmp'
	db	6,'wcschr'
	db	6,'wcscat'
	db	6,'strtok'
	db	18,'@std@strstr$qpxct1'
	db	18,'@std@strstr$qpcpxc'
	db	6,'strspn'
	db	19,'@std@strpbrk$qpxct1'
	db	19,'@std@strpbrk$qpcpxc'
	db	8,'strerror'
	db	7,'strcspn'
	db	18,'@std@strrchr$qpxci'
	db	17,'@std@strrchr$qpci'
	db	7,'strncpy'
	db	7,'strncmp'
	db	7,'strncat'
	db	6,'strlen'
	db	6,'strcpy'
	db	6,'strcmp'
	db	17,'@std@strchr$qpxci'
	db	16,'@std@strchr$qpci'
	db	6,'strcat'
	db	6,'strset'
	db	6,'stpcpy'
	db	7,'strnset'
	db	7,'_wcsset'
	db	7,'_wcsrev'
	db	8,'_wcspcpy'
	db	8,'_wcsnset'
	db	10,'_wcsnicoll'
	db	9,'_wcsnicmp'
	db	9,'_wcsncoll'
	db	9,'_wcsicoll'
	db	8,'_wcsicmp'
	db	7,'_wcsdup'
	db	10,'_strnicoll'
	db	9,'_strncoll'
	db	9,'_stricoll'
	db	9,'_strerror'
	db	9,'_lwcsxfrm'
	db	8,'_lwcsupr'
	db	11,'_lwcsnicoll'
	db	10,'_lwcsncoll'
	db	8,'_lwcslwr'
	db	10,'_lwcsicoll'
	db	9,'_lwcscoll'
	db	9,'_lstrxfrm'
	db	11,'_lstrnicoll'
	db	10,'_lstrncoll'
	db	10,'_lstricoll'
	db	9,'_lstrcoll'
	db	6,'strrev'
	db	8,'strnicmp'
	db	7,'stricmp'
	db	6,'strdup'
	db	7,'_stpcpy'
	db	8,'_lstrupr'
	db	8,'_lstrlwr'
	db	12,'_lwsetlocale'
	db	11,'_wsetlocale'
	db	12,'_llocaleconv'
	db	10,'localeconv'
	db	11,'_lsetlocale'
	db	10,'_ltowlower'
	db	10,'_ltowupper'
	db	8,'towupper'
	db	8,'towlower'
	db	9,'_ltoupper'
	db	7,'toupper'
	db	9,'_ltolower'
	db	7,'tolower'
	db	8,'iswascii'
	db	9,'iswxdigit'
	db	8,'iswupper'
	db	8,'iswspace'
	db	8,'iswpunct'
	db	8,'iswprint'
	db	8,'iswlower'
	db	8,'iswgraph'
	db	8,'iswdigit'
	db	8,'iswcntrl'
	db	8,'iswalpha'
	db	8,'iswalnum'
	db	7,'isascii'
	db	8,'isxdigit'
	db	7,'isupper'
	db	7,'isspace'
	db	7,'ispunct'
	db	7,'isprint'
	db	7,'islower'
	db	7,'isgraph'
	db	7,'isdigit'
	db	7,'iscntrl'
	db	7,'isalpha'
	db	7,'isalnum'
	db	6,'memset'
	db	6,'memcpy'
	db	6,'memcmp'
	db	19,'@std@memchr$qpxviui'
	db	18,'@std@memchr$qpviui'
	db	7,'memmove'
	db	7,'memicmp'
	db	7,'memccpy'
	db	8,'_wmemset'
	db	8,'_wmemcpy'
	db	21,'@std@_wmemchr$qpxviui'
	db	20,'@std@_wmemchr$qpviui'
	db	10,'__threadid'
	db	14,'@std@ptrdiff_t'
	db	11,'@std@size_t'
	db	11,'@std@wint_t'
	db	13,'@std@wctype_t'
	db	12,'@std@va_list'
	db	9,'_chartype'
	db	6,'_lower'
	db	6,'_upper'
	db	5,'lconv'
	db	5,'_argc'
	db	5,'_argv'
	db	12,'__mb_cur_max'
	db	16,'_cmdline_escapes'
	db	8,'_environ'
	db	9,'_fileinfo'
	db	6,'_fmode'
	db	8,'_osmajor'
	db	8,'_osminor'
	db	7,'_osmode'
	db	10,'_osversion'
	db	12,'_sys_errlist'
	db	9,'_sys_nerr'
	db	9,'_wenviron'
	db	13,'@std@atexit_t'
	db	10,'@std@div_t'
	db	11,'@std@ldiv_t'
	db	6,'_TCHAR'
	db	7,'_TSCHAR'
	db	7,'_TUCHAR'
	db	7,'_TXCHAR'
	db	5,'_TINT'
	db	10,'@std@ffblk'
	db	12,'@std@_wffblk'
	db	13,'@std@heapinfo'
	db	11,'@std@time_t'
	db	12,'@std@clock_t'
	db	7,'@std@tm'
	db	9,'_daylight'
	db	9,'_timezone'
	db	7,'_tzname'
	db	8,'_wtzname'
$$BNAMES	ends
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\time.h" 10303 10240
	?debug	D "D:\igor9\work575\vctime\AvcTime.h" 11406 35621
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\transact.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\comsvcs.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\mtx.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\DBClient.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\DSIntf.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Midas.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Provider.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\databkr.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\stddef.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\alloc.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\malloc.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\dir.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\VCSpell3.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\VCFrmla1.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\VCFImprs.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Tabs.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Tabnotbk.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\WinSpool.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Printers.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\QRPrntr.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\QRPrgres.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\QRExpr.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\qr3const.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\QRExpbld.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Quickrpt.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Outline.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\DocObj.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\dlgs.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\tchar.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\oledlg.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\OleDlg.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\OleCtnrs.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\mmsystem.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\MMSystem.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\MPlayer.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\GraphSvr.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\FileCtrl.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\ddeml.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Ddeml.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\DdeMan.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\DBLookup.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Grids.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\DBGrids.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\DBCGrids.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\olectl.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\propidl.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\cguid.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\objbase.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\ole2.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\OLE2.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\OleCtl.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\msxml.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\urlmon.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\servprov.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\oleidl.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\ocidl.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\objsafe.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\ComObj.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\StdVCL.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\AxCtrls.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\OleCtrls.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\ChartFX.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\DBCommon.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Bde.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\SMIntf.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\dbtables.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Mask.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Buttons.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\RichEdit.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\RichEdit.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\ToolWin.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\ComCtrls.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Db.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\dbctrls.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\extctrls.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\commdlg.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\CommDlg.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\StdCtrls.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\shellapi.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\ShellAPI.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\regstr.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\RegStr.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\wininet.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\WinInet.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\objidl.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\oaidl.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\oleauto.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\ActiveX.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\UrlMon.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\ShlObj.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\dialogs.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\forms.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\multimon.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\MultiMon.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Contnrs.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Menus.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Imm.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\CommCtrl.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\Commctrl.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\ImgList.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\ActnList.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\controls.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\graphics.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\classes.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\SysConst.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\sysutils.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\messages.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\dde.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\wincrypt.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\wintrust.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\SysInit.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\windows.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\unknwn.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\sysvari.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\sysopen.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\search.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\stdlib.h" 10503 10272
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\sysdyn.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\systvar.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\sysset.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\syscomp.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\syscurr.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\systdate.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\systobj.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\rpcnsip.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\rpcndr.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\rpcnterr.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\rpcnsi.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\rpcdcep.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\rpcdce.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\rpc.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\wtypes.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\wstring.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\sysmac.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\dstring.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\sysclass.H" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\basetyps.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\prsht.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winspool.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\imm.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\mcx.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winsvc.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winnetwk.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winreg.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winver.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\wincon.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winnls.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\tvout.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winuser.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\pshpack1.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\wingdi.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winerror.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winbase.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\pshpack8.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\pshpack2.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\poppack.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\pshpack4.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\_loc.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\locale.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\_str.h" 10503 10272
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\string.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\guiddef.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\basetsd.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\mbctype.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\ctype.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\winnt.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\windef.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\stdarg.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\excpt.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\_null.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\_defs.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\_stddef.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\mem.h" 10503 10272
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\windows.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\sysmac.H" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\system.hpp" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\vcl0.h" 10303 10240
	?debug	D "D:\CMPLR\CBUILDER5\INCLUDE\VCL\VCL4.H" 10303 10240
	?debug	D "D:\igor9\work575\vctime\AvcTime.cpp" 11406 36237
	end
