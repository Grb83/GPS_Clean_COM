	.386p
	ifdef ??version
	if ??version GT 500H
	.mmx
	endif
	endif
	model flat
	ifndef	??version
	?debug	macro
	endm
	endif
	?debug	S "C:\Borland\CBuilder6\Projects\GPS_ÑLean_COM\projects\gps\vctime\AvcTime.cpp"
	?debug	T "C:\Borland\CBuilder6\Projects\GPS_ÑLean_COM\projects\gps\vctime\AvcTime.cpp"
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
 ?debug C FB0C0100600000
DGROUP	group	_BSS,_DATA
_TEXT	segment dword public use32 'CODE'
@avc_time$qv	segment virtual
@@avc_time$qv	proc	near
?live16385@0:
	?debug L 15
	push ebp
	mov ebp,esp
	?debug L 17
@1:
	call @vc_time
	?debug L 18
@3:
@2:
	pop ebp
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
	push ebp
	mov ebp,esp
	push ecx
	?debug L 24
@4:
	push dword ptr [ebp+8]
	call @vc_localtime
	mov dword ptr [ebp-4],eax
	?debug L 26
	add	 esp,4
	?debug L 28
	mov eax,dword ptr [ebp-4]
	?debug L 29
@6:
@5:
	pop ecx
	pop ebp
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
	push ebp
	mov ebp,esp
	push ecx
	?debug L 35
@7:
	push dword ptr [ebp+8]
	call @vc_mktime
	mov dword ptr [ebp-4],eax
	?debug L 37
	add	 esp,4
	?debug L 39
	mov eax,dword ptr [ebp-4]
	?debug L 40
@9:
@8:
	pop ecx
	pop ebp
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
_DATA	segment dword public use32 'DATA'
s@	label	byte
	db	0,0,0,0
	align	4
_DATA	ends
_TEXT	segment dword public use32 'CODE'
_TEXT	ends
@vc_time equ vc_time
 extrn vc_time:near
@vc_localtime equ vc_localtime
 extrn vc_localtime:near
@vc_mktime equ vc_mktime
 extrn vc_mktime:near
 ?debug C FB0A41766354696D6500
 ?debug C 9F76636C652E6C6962
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
	dw	37
	dw	20
	dw	0
	dw	0
	dw	0
	dw	0
?patch12	equ	12
	dw	?patch13
	dw	37
	dw	21
	dw	0
	dw	0
	dw	0
	dw	0
?patch13	equ	12
	dw	?patch14
	dw	37
	dw	22
	dw	0
	dw	0
	dw	0
	dw	0
?patch14	equ	12
	dw	?patch15
	dw	37
	dw	23
	dw	0
	dw	0
	dw	0
	dw	0
?patch15	equ	12
	dw	?patch16
	dw	37
	dw	24
	dw	0
	dw	0
	dw	0
	dw	0
?patch16	equ	12
	dw	?patch17
	dw	37
	dw	25
	dw	0
	dw	0
	dw	0
	dw	0
?patch17	equ	12
	dw	?patch18
	dw	37
	dw	26
	dw	0
	dw	0
	dw	0
	dw	0
?patch18	equ	12
	dw	?patch19
	dw	37
	dw	27
	dw	0
	dw	0
	dw	0
	dw	0
?patch19	equ	12
	dw	?patch20
	dw	37
	dw	28
	dw	0
	dw	0
	dw	0
	dw	0
?patch20	equ	12
	dw	?patch21
	dw	37
	dw	29
	dw	0
	dw	0
	dw	0
	dw	0
?patch21	equ	12
	dw	?patch22
	dw	37
	dw	30
	dw	0
	dw	0
	dw	0
	dw	0
?patch22	equ	12
	dw	?patch23
	dw	37
	dw	31
	dw	0
	dw	0
	dw	0
	dw	0
?patch23	equ	12
	dw	?patch24
	dw	37
	dw	32
	dw	0
	dw	0
	dw	0
	dw	0
?patch24	equ	12
	dw	?patch25
	dw	37
	dw	33
	dw	0
	dw	0
	dw	0
	dw	0
?patch25	equ	12
	dw	?patch26
	dw	37
	dw	34
	dw	0
	dw	0
	dw	0
	dw	0
?patch26	equ	12
	dw	?patch27
	dw	37
	dw	35
	dw	0
	dw	0
	dw	0
	dw	0
?patch27	equ	12
	dw	?patch28
	dw	37
	dw	36
	dw	0
	dw	0
	dw	0
	dw	0
?patch28	equ	12
	dw	?patch29
	dw	37
	dw	37
	dw	0
	dw	0
	dw	0
	dw	0
?patch29	equ	12
	dw	?patch30
	dw	37
	dw	38
	dw	0
	dw	0
	dw	0
	dw	0
?patch30	equ	12
	dw	?patch31
	dw	37
	dw	39
	dw	0
	dw	0
	dw	0
	dw	0
?patch31	equ	12
	dw	?patch32
	dw	37
	dw	40
	dw	0
	dw	0
	dw	0
	dw	0
?patch32	equ	12
	dw	?patch33
	dw	37
	dw	41
	dw	0
	dw	0
	dw	0
	dw	0
?patch33	equ	12
	dw	?patch34
	dw	37
	dw	42
	dw	0
	dw	0
	dw	0
	dw	0
?patch34	equ	12
	dw	?patch35
	dw	37
	dw	43
	dw	0
	dw	0
	dw	0
	dw	0
?patch35	equ	12
	dw	?patch36
	dw	37
	dw	44
	dw	0
	dw	0
	dw	0
	dw	0
?patch36	equ	12
	dw	?patch37
	dw	37
	dw	45
	dw	0
	dw	0
	dw	0
	dw	0
?patch37	equ	12
	dw	?patch38
	dw	37
	dw	46
	dw	0
	dw	0
	dw	0
	dw	0
?patch38	equ	12
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
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	52
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	18
	dw	0
	dw	0
	dw	53
	dw	0
	dw	0
	dw	0
	dw	16
	dw	4
	dw	4100
	dw	0
	dw	1
	dw	54
	dw	0
	dw	0
	dw	0
	dw	?patch44
	dw	38
	dw	300
	dw	55
	dw	0
	dw	56
	dw	0
	dw	57
	dw	0
	dw	58
	dw	0
	dw	59
	dw	0
	dw	60
	dw	0
	dw	61
	dw	0
	dw	62
	dw	0
	dw	63
	dw	0
	dw	64
	dw	0
	dw	65
	dw	0
	dw	66
	dw	0
	dw	67
	dw	0
	dw	68
	dw	0
	dw	69
	dw	0
	dw	70
	dw	0
	dw	71
	dw	0
	dw	72
	dw	0
	dw	73
	dw	0
	dw	74
	dw	0
	dw	75
	dw	0
	dw	76
	dw	0
	dw	77
	dw	0
	dw	78
	dw	0
	dw	79
	dw	0
	dw	80
	dw	0
	dw	81
	dw	0
	dw	82
	dw	0
	dw	83
	dw	0
	dw	84
	dw	0
	dw	85
	dw	0
	dw	86
	dw	0
	dw	87
	dw	0
	dw	88
	dw	0
	dw	89
	dw	0
	dw	90
	dw	0
	dw	91
	dw	0
	dw	92
	dw	0
	dw	93
	dw	0
	dw	94
	dw	0
	dw	95
	dw	0
	dw	96
	dw	0
	dw	97
	dw	0
	dw	98
	dw	0
	dw	99
	dw	0
	dw	100
	dw	0
	dw	101
	dw	0
	dw	102
	dw	0
	dw	103
	dw	0
	dw	104
	dw	0
	dw	105
	dw	0
	dw	106
	dw	0
	dw	107
	dw	0
	dw	108
	dw	0
	dw	109
	dw	0
	dw	110
	dw	0
	dw	111
	dw	0
	dw	112
	dw	0
	dw	113
	dw	0
	dw	114
	dw	0
	dw	115
	dw	0
	dw	116
	dw	0
	dw	117
	dw	0
	dw	118
	dw	0
	dw	119
	dw	0
	dw	120
	dw	0
	dw	121
	dw	0
	dw	122
	dw	0
	dw	123
	dw	0
	dw	124
	dw	0
	dw	125
	dw	0
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
?patch44	equ	1204
	dw	?patch45
	dw	1
	db	3
	db	1
	db	0
	db	24
	db	9
	db	66
	db	67
	db	67
	db	51
	db	50
	db	32
	db	53
	db	46
	db	54
?patch45	equ	16
$$BSYMS	ends
$$BTYPES	segment byte public use32 'DEBTYP'
	db 2,0,0,0,14,0,8,0,18,0,0,0,0,0,0,0
	db 1,16,0,0,4,0,1,2,0,0,14,0,8,0,3,16
	db 0,0,0,0,1,0,8,16,0,0,8,0,2,0,10,0
	db 4,16,0,0,28,0,5,0,9,0,5,16,0,0,0,0
	db 0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0
	db 36,0,180,0,4,2,6,4,116,0,0,0,3,0,3,0
	db 0,0,0,0,0,0,0,0,242,241,6,4,116,0,0,0
	db 3,0,4,0,0,0,0,0,0,0,4,0,242,241,6,4
	db 116,0,0,0,3,0,5,0,0,0,0,0,0,0,8,0
	db 242,241,6,4,116,0,0,0,3,0,6,0,0,0,0,0
	db 0,0,12,0,242,241,6,4,116,0,0,0,3,0,7,0
	db 0,0,0,0,0,0,16,0,242,241,6,4,116,0,0,0
	db 3,0,8,0,0,0,0,0,0,0,20,0,242,241,6,4
	db 116,0,0,0,3,0,9,0,0,0,0,0,0,0,24,0
	db 242,241,6,4,116,0,0,0,3,0,10,0,0,0,0,0
	db 0,0,28,0,242,241,6,4,116,0,0,0,3,0,11,0
	db 0,0,0,0,0,0,32,0,8,0,2,0,10,0,7,16
	db 0,0,8,0,1,0,1,0,18,0,0,0,8,0,1,2
	db 1,0,6,16,0,0,14,0,8,0,18,0,0,0,0,0
	db 1,0,10,16,0,0,8,0,1,2,1,0,3,16,0,0
	db 14,0,8,0,18,0,0,0,7,0,0,0,12,16,0,0
	db 4,0,1,2,0,0,14,0,8,0,3,16,0,0,7,0
	db 1,0,14,16,0,0,8,0,1,2,1,0,6,16,0,0
	db 14,0,8,0,18,0,0,0,7,0,1,0,16,16,0,0
	db 8,0,1,2,1,0,3,16,0,0
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
	db	8,'Sysutils'
	db	7,'Sysinit'
	db	5,'Types'
	db	7,'Windows'
	db	8,'Messages'
	db	8,'Sysconst'
	db	8,'Variants'
	db	7,'Typinfo'
	db	7,'Classes'
	db	7,'Contnrs'
	db	8,'Commctrl'
	db	8,'Graphics'
	db	7,'Imglist'
	db	8,'Actnlist'
	db	3,'Imm'
	db	5,'Menus'
	db	8,'Multimon'
	db	8,'Controls'
	db	9,'Helpintfs'
	db	5,'Forms'
	db	7,'Activex'
	db	6,'Urlmon'
	db	7,'Wininet'
	db	6,'Regstr'
	db	8,'Shellapi'
	db	6,'Shlobj'
	db	8,'Winspool'
	db	8,'Printers'
	db	8,'Stdctrls'
	db	7,'Commdlg'
	db	7,'Dialogs'
	db	8,'Extctrls'
	db	11,'@std@time_t'
	db	12,'@std@clock_t'
	db	7,'@std@tm'
	db	8,'Extctrls'
	db	7,'Dialogs'
	db	7,'Commdlg'
	db	8,'Stdctrls'
	db	8,'Printers'
	db	8,'Winspool'
	db	6,'Shlobj'
	db	8,'Shellapi'
	db	6,'Regstr'
	db	7,'Wininet'
	db	6,'Urlmon'
	db	7,'Activex'
	db	5,'Forms'
	db	9,'Helpintfs'
	db	8,'Controls'
	db	8,'Multimon'
	db	5,'Menus'
	db	3,'Imm'
	db	8,'Actnlist'
	db	7,'Imglist'
	db	8,'Graphics'
	db	8,'Commctrl'
	db	7,'Contnrs'
	db	7,'Classes'
	db	7,'Typinfo'
	db	8,'Variants'
	db	8,'Sysutils'
	db	8,'Sysconst'
	db	8,'Messages'
	db	7,'Windows'
	db	5,'Types'
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
	db	8,'strptime'
	db	8,'strftime'
	db	5,'clock'
	db	6,'mktime'
	db	9,'localtime'
	db	6,'gmtime'
	db	8,'difftime'
	db	5,'ctime'
	db	7,'asctime'
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
	db	10,'__doserrno'
	db	7,'__errno'
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
	db	9,'_sys_nerr'
	db	12,'_sys_errlist'
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
	db	9,'_wenviron'
	db	13,'@std@atexit_t'
	db	10,'@std@div_t'
	db	11,'@std@ldiv_t'
	db	11,'@std@time_t'
	db	12,'@std@clock_t'
	db	7,'@std@tm'
	db	9,'_daylight'
	db	9,'_timezone'
	db	7,'_tzname'
	db	8,'_wtzname'
$$BNAMES	ends
	?debug	D "c:\borland\cbuilder6\include\time.h" 11329 22528
	?debug	D "C:\Borland\CBuilder6\Projects\GPS_ÑLean_COM\projects\gps\vctime\AvcTime.h" 11406 33573
	?debug	D "c:\borland\cbuilder6\include\vcl\ExtCtrls.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\commdlg.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\CommDlg.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\StdCtrls.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winspool.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\WinSpool.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Printers.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\shellapi.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\ShellAPI.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\regstr.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\RegStr.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\wininet.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\WinInet.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\objidl.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\oaidl.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\oleauto.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\ActiveX.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\UrlMon.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\ShlObj.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Dialogs.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\HelpIntfs.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Forms.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\multimon.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\MultiMon.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Menus.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Imm.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Graphics.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\prsht.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\CommCtrl.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\CommCtrl.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\ImgList.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Contnrs.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\ActnList.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Controls.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Variants.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\TypInfo.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Classes.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\SysConst.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\SysUtils.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Messages.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\dde.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\wincrypt.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\wintrust.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Windows.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\SysInit.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\Types.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\sysvari.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\sysopen.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\errno.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\search.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\stdlib.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\sysdyn.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\systvar.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\sysset.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\syscomp.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\syscurr.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\systdate.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\systobj.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\wstring.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\dstring.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\sysclass.H" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\wtypes.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\rpcnsip.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\rpcndr.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\rpcnterr.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\rpcnsi.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\rpcdcep.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\rpcdce.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\rpc.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\unknwn.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\basetyps.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\imm.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\mcx.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winsvc.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\stralign.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winnetwk.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\reason.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winreg.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winver.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\wincon.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winnls.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\tvout.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winuser.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\pshpack1.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\wingdi.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winerror.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winbase.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\pshpack8.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\pshpack2.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\poppack.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\pshpack4.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\_loc.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\oldstl/locale.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\_str.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\string.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\guiddef.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\basetsd.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\mbctype.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\ctype.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\winnt.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\windef.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\stdarg.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\excpt.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\_null.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\_defs.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\_stddef.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\mem.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\windows.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\sysmac.H" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\System.hpp" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\basepch0.h" 11329 22528
	?debug	D "c:\borland\cbuilder6\include\vcl\vcl.h" 11329 22528
	?debug	D "C:\Borland\CBuilder6\Projects\GPS_ÑLean_COM\projects\gps\vctime\AvcTime.cpp" 11406 34189
	end
