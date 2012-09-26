	.file	"pow.cpp"
	.intel_syntax noprefix
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" "
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB1297:
	.cfi_startproc
	sub	rsp, 40
	.cfi_def_cfa_offset 48
	mov	edi, OFFSET FLAT:_ZSt3cin
	lea	rsi, [rsp+24]
	call	_ZNSirsERd
	movsd	xmm1, QWORD PTR [rsp+24]
	mov	esi, 9
	mov	edi, OFFSET FLAT:_ZSt4cout
	movapd	xmm0, xmm1
	mulsd	xmm0, xmm1
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm1
	movapd	xmm2, xmm0
	mulsd	xmm2, xmm0
	mulsd	xmm0, xmm2
	mulsd	xmm0, xmm2
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm1
	movsd	QWORD PTR [rsp], xmm0
	call	_ZNSo9_M_insertImEERSoT_
	mov	esi, OFFSET FLAT:.LC0
	mov	rdi, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movsd	xmm0, QWORD PTR [rsp]
	mov	rdi, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	movsd	xmm1, QWORD PTR [rsp+24]
	mov	esi, 10
	mov	edi, OFFSET FLAT:_ZSt4cout
	movapd	xmm0, xmm1
	mulsd	xmm0, xmm1
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm1
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm1
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm1
	mulsd	xmm0, xmm0
	mulsd	xmm0, xmm1
	movsd	QWORD PTR [rsp], xmm0
	call	_ZNSo9_M_insertImEERSoT_
	mov	esi, OFFSET FLAT:.LC0
	mov	rdi, rax
	call	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	movsd	xmm0, QWORD PTR [rsp]
	mov	rdi, rax
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	movsd	xmm1, QWORD PTR .LC1[rip]
	movsd	xmm0, QWORD PTR [rsp+24]
	call	pow
	mov	edi, OFFSET FLAT:_ZSt4cout
	call	_ZNSo9_M_insertIdEERSoT_
	mov	rdi, rax
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	xor	eax, eax
	add	rsp, 40
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1297:
	.size	main, .-main
	.p2align 4,,15
	.type	_GLOBAL__sub_I_main, @function
_GLOBAL__sub_I_main:
.LFB1484:
	.cfi_startproc
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	mov	edi, OFFSET FLAT:_ZStL8__ioinit
	call	_ZNSt8ios_base4InitC1Ev
	mov	edx, OFFSET FLAT:__dso_handle
	mov	esi, OFFSET FLAT:_ZStL8__ioinit
	mov	edi, OFFSET FLAT:_ZNSt8ios_base4InitD1Ev
	add	rsp, 8
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit
	.cfi_endproc
.LFE1484:
	.size	_GLOBAL__sub_I_main, .-_GLOBAL__sub_I_main
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I_main
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1079427072
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu/Linaro 4.7.0-7ubuntu3) 4.7.0"
	.section	.note.GNU-stack,"",@progbits
