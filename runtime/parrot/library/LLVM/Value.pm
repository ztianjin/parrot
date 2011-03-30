class LLVM::Value is LLVM::Opaque {
    method typeof() {
        LLVM::Type.create(
            LLVM::call("TypeOf", self)
        );
    }

    multi method name() {
        LLVM::call("GetValueName", self);
    }

    multi method name($name) {
        LLVM::call("SetValueName", self, $name);
        self;
    }

    method dump() {
        LLVM::call("DumpValue", self);
    }

INIT {
    my $HOW  := LLVM::Value.HOW;
    my $WHAT := LLVM::Value.WHAT;

    for hash(
        Argument => "argument",
        BasicBlock => "basic_block",
        InlineAsm => "inline_asm",
        User => "user",
        Constant => "constant",
        ConstantAggregateZero => "constant_aggregate_zero",
        ConstantArray => "constant_array",
        ConstantExpr => "constant_expr",
        ConstantFP => "constant_f_p",
        ConstantInt => "constant_int",
        ConstantPointerNull => "constant_pointer_null",
        ConstantStruct => "constant_struct",
        ConstantVector => "constant_vector",
        GlobalValue => "global_value",
        Function => "function",
        GlobalAlias => "global_alias",
        GlobalVariable => "global_variable",
        UndefValue => "undef_value",
        Instruction => "instruction",
        BinaryOperator => "binary_operator",
        CallInst => "call_inst",
        IntrinsicInst => "intrinsic_inst",
        DbgInfoIntrinsic => "dbg_info_intrinsic",
        DbgDeclareInst => "dbg_declare_inst",
        EHSelectorInst => "eh_selector_inst",
        MemIntrinsic => "mem_intrinsic",
        MemCpyInst => "mem_cpy_inst",
        MemMoveInst => "mem_move_inst",
        MemSetInst => "mem_set_inst",
        CmpInst => "cmp_inst",
        FCmpInst => "f_cmp_inst",
        ICmpInst => "i_cmp_inst",
        ExtractElementInst => "extract_element_inst",
        GetElementPtrInst => "get_element_ptr_inst",
        InsertElementInst => "insert_element_inst",
        InsertValueInst => "insert_value_inst",
        PHINode => "phi_node",
        SelectInst => "select_inst",
        ShuffleVectorInst => "shuffle_vector_inst",
        StoreInst => "store_inst",
        TerminatorInst => "terminator_inst",
        BranchInst => "branch_inst",
        InvokeInst => "invoke_inst",
        ReturnInst => "return_inst",
        SwitchInst => "switch_inst",
        UnreachableInst => "unreachable_inst",
        UnwindInst => "unwind_inst",
        UnaryInstruction => "unary_instruction",
        AllocaInst => "alloca_inst",
        CastInst => "cast_inst",
        BitCastInst => "bit_cast_inst",
        FPExtInst => "fp_ext_inst",
        FPToSIInst => "fp_to_si_inst",
        FPToUIInst => "fp_to_ui_inst",
        FPTruncInst => "fp_trunc_inst",
        IntToPtrInst => "int_to_ptr_inst",
        PtrToIntInst => "ptr_to_int_inst",
        SExtInst => "s_ext_inst",
        SIToFPInst => "si_to_fp_inst",
        TruncInst => "trunc_inst",
        UIToFPInst => "ui_to_fp_inst",
        ZExtInst => "z_ext_inst",
        ExtractValueInst => "extract_value_inst",
        LoadInst => "load_inst",
        VAArgInst => "va_arg_inst",
    ).kv -> $call,$sub {
        $HOW.add_method(
            "is_$sub",
            multi method () {
                LLVM::Value.create(
                    LLVM::call("IsA$call", self)
                )
            },
            to => $WHAT
        );
    }
}

}



# vim: ft=perl6
