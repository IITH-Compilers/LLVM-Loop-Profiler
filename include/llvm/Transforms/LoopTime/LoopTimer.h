// This file provides the interface for the Loop Profiler pass.
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_PROFILER_H
#define LLVM_PROFILER_H

#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Support/CommandLine.h"
#include "llvm/PassRegistry.h"
#include <unordered_map>
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include <algorithm>
#include <string>


using  namespace llvm;



namespace {
    
    // To know which types of loop to profile (inner, outer or all)
    static cl::opt<std::string>LoopType("profile-loop",cl::desc("Specify Which Loops You Want to Instrument"));
    uint64_t totalLoops=0;
    std::unordered_map<uint64_t,std::string>symbolTable;


    namespace {
        // Count total number of loops in the program (including artifical loops)
        class CountLoops:  public LoopPass{

        public:
            static char ID;
            CountLoops():LoopPass(ID){}
            void getAnalysisUsage(AnalysisUsage&AU) const override;
            bool runOnLoop(Loop *L,LPPassManager&) override;
        };
    }



    namespace {
        // Insert instrumentation in header and in exit block of loop
        struct InsertTimer : public LoopPass {
            static char ID;
            uint64_t iter = 0;
            InsertTimer() : LoopPass(ID) {}
            void getAnalysisUsage(AnalysisUsage &AU) const override;
            bool runOnLoop(Loop *L, LPPassManager &) override ;
        };
    }



    namespace {
        // Declare/define the variables or functions for a code
        // like Printf(...), PrintProfilerValues(...), array to store clock values etc
        struct InsertStr : public ModulePass {
            static char ID;
            uint64_t g = 0;
            InsertStr() : ModulePass(ID) {}
            bool runOnModule(Module &M) override ;
        };
    }
}

#endif
