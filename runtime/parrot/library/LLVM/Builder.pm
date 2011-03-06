class LLVM::Builder {
    has $!ref;

    multi method BUILD () {
        $!ref := %LLVM::F<LLVMCreateBuilder>();
        self;
    }

    multi method BUILD ($context) {
        $!ref := %LLVM::F<LLVMCreateBuilderInContext>($context);
        self;
    }

    method DESTROY () {
        %LLVM::F<LLVMDisposeBuilder>($!ref);
        $!ref := undef;
    }

#            LLVMPositionBuilder             => "vppp",
    multi method set_position(LLVM::BasicBlock $bb, $value) {
        %LLVM::F<LLVMPositionBuilder>($!ref, $bb._get_ptr(), $value);
    }

#            LLVMPositionBuilderBefore       => "vpp",
    multi method set_position($value) {
        %LLVM::F<LLVMPositionBuilderBefore>($!ref, $value);
    }

#            LLVMPositionBuilderAtEnd        => "vpp",
    multi method set_position(LLVM::BasicBlock $bb) {
        %LLVM::F<LLVMPositionBuilderAtEnd>($!ref, $bb._get_ptr());
    }

#            LLVMGetInsertBlock              => "pp",
#            LLVMClearInsertionPosition      => "vp",
#            LLVMInsertIntoBuilder           => "vpp",
#            LLVMInsertIntoBuilderWithName   => "vppt",
#            LLVMDisposeBuilder              => "vp",

#            # Terminators
#            LLVMBuildRetVoid                => "pp",
    multi method ret() {
        %LLVM::F<LLVMBuildRetVoid>($!ref);
    }

#            LLVMBuildRet                    => "ppp",
    multi method ret($value) {
        %LLVM::F<LLVMBuildRet>($!ref, $value);
    }
#            LLVMBuildAggregateRet           => "ppp3",
#            LLVMBuildBr                     => "ppp",
#            LLVMBuildCondBr                 => "ppppp",
#            LLVMBuildSwitch                 => "ppppi",
#            LLVMBuildInvoke                 => "ppppippt",
#            LLVMBuildUnwind                 => "pp",
#            LLVMBuildUnreachable            => "pp",

#            # Add a case to the switch instruction */
#            LLVMAddCase => "vppp",

#            # Arithmetic
#            LLVMBuildAdd        => "ppppt",
#            LLVMBuildNSWAdd     => "ppppt",
#            LLVMBuildFAdd       => "ppppt",
#            LLVMBuildSub        => "ppppt",
#            LLVMBuildFSub       => "ppppt",
#            LLVMBuildMul        => "ppppt",
#            LLVMBuildFMul       => "ppppt",
#            LLVMBuildUDiv       => "ppppt",
#            LLVMBuildSDiv       => "ppppt",
#            LLVMBuildExactSDiv  => "ppppt",
#            LLVMBuildFDiv       => "ppppt",
#            LLVMBuildURem       => "ppppt",
#            LLVMBuildSRem       => "ppppt",
#            LLVMBuildFRem       => "ppppt",
#            LLVMBuildShl        => "ppppt",
#            LLVMBuildLShr       => "ppppt",
#            LLVMBuildAShr       => "ppppt",
#            LLVMBuildAnd        => "ppppt",
#            LLVMBuildOr         => "ppppt",
#            LLVMBuildXor        => "ppppt",

#            LLVMBuildNeg => "pppt",
#            LLVMBuildNot => "pppt",

#            # Memory
#            LLVMBuildMalloc             => "pppt",
#            LLVMBuildArrayMalloc        => "ppppt",
#            LLVMBuildAlloca             => "pppt",
#            LLVMBuildArrayAlloca        => "ppppt",
#            LLVMBuildFree               => "ppp",
#            LLVMBuildLoad               => "pppt",
#            LLVMBuildStore              => "pppp",
#            LLVMBuildGEP                => "pppp3t", # FIXME It's array here.
#            LLVMBuildInBoundsGEP        => "pppp3t", # FIXME
#            LLVMBuildStructGEP          => "ppp3t",
#            LLVMBuildGlobalString       => "pptt",
#            LLVMBuildGlobalStringPtr    => "pptt",

#            # Casts
#            LLVMBuildTrunc => "ppppt",
#            LLVMBuildZExt => "ppppt",
#            LLVMBuildSExt => "ppppt",
#            LLVMBuildFPToUI => "ppppt",
#            LLVMBuildFPToSI => "ppppt",
#            LLVMBuildUIToFP => "ppppt",
#            LLVMBuildSIToFP => "ppppt",
#            LLVMBuildFPTrunc => "ppppt",
#            LLVMBuildFPExt => "ppppt",
#            LLVMBuildPtrToInt => "ppppt",
#            LLVMBuildIntToPtr => "ppppt",
#            LLVMBuildBitCast => "ppppt",
#            LLVMBuildZExtOrBitCast => "ppppt",
#            LLVMBuildSExtOrBitCast => "ppppt",
#            LLVMBuildTruncOrBitCast => "ppppt",
#            LLVMBuildPointerCast => "ppppt",
#            LLVMBuildIntCast => "ppppt",
#            LLVMBuildFPCast => "ppppt",

#            # Comparisons
#            LLVMBuildICmp => "pp3ppt",
#            LLVMBuildFCmp => "pp3ppt",

#            # Miscellaneous instructions
#            LLVMBuildPhi => "pppt",
#            LLVMBuildCall => "pppp3t", #FIXME
#            LLVMBuildSelect => "pppppt",
#            LLVMBuildVAArg => "ppppt",
#            LLVMBuildExtractElement => "ppppt",
#            LLVMBuildInsertElement => "pppppt",
#            LLVMBuildShuffleVector => "pppppt",
#            LLVMBuildExtractValue => "ppp3t",
#            LLVMBuildInsertValue => "pppp3t",

#            LLVMBuildIsNull => "pppt",
#            LLVMBuildIsNotNull => "pppt",
#            LLVMBuildPtrDiff => "ppppt",

};

# vim: ft=perl6