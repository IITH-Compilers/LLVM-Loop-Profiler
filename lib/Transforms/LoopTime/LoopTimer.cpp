// This file instruments the code for each loop to calculate the run-time information
// basically time elapsed by each loop and the number of times the whole loop executes.
//
// Number of times loop executes is not the trip count of the loop while it the total count
// the whole loop executes in the whole program.
//
//===----------------------------------------------------------------------===//

#include "llvm/Transforms/LoopTime/LoopTimer.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/Support/Debug.h"
using namespace llvm;
namespace {


    namespace {

        //  Get ScalarEV and LoopInfo analysis
        void CountLoops::getAnalysisUsage(AnalysisUsage &AU) const {
            AU.addRequired<LoopInfoWrapperPass>();
            AU.addRequired<ScalarEvolutionWrapperPass>();
            AU.setPreservesAll();
        }


        // Count the number of loops
        bool CountLoops::runOnLoop(Loop *L, LPPassManager &) {

            if(LoopType.compare("inner")==0) {
                if (L->getSubLoops().size() > 0) {
                    return false;
                }
            }

            else if(LoopType.compare("outer")==0)
            {
                if(L->getLoopDepth()!=1)
                {
                    return false;
                }
            }

            if(!L->getStartLoc())
            {
                errs() << " Please Compile Program using Debug flag\n";
                exit(1);
            }

            totalLoops++;
            return false;
        }
    }

    char CountLoops::ID = 0;
    static RegisterPass<CountLoops> XYZ("count-loops", "To Count total number of loops in program (including synthetic loops)");


    namespace {
        //  Get ScalarEV and LoopInfo analysis
        void InsertTimer::getAnalysisUsage(AnalysisUsage &AU) const {
            AU.addRequired<LoopInfoWrapperPass>();
            AU.addRequired<ScalarEvolutionWrapperPass>();
            AU.setPreservesAll();
        }

        // Instrument clock() function call to each loop
        bool InsertTimer::runOnLoop(Loop *L, LPPassManager &) {
            if(LoopType.compare("inner")==0) {
                if(L->getSubLoops().size()>0)
                    return false;
            }
            else if(LoopType.compare("outer")==0)
            {
                if(L->getLoopDepth()!=1)
                {
                    return false;
                }
            }



            Function &F = *L->getHeader()->getParent();
            Module *mod = F.getParent();


            //  Get filename and Line Number of loop as string (char array)
            Constant *ConstantStr = ConstantDataArray::getString(mod->getContext(), StringRef(Twine( L->getHeader()->getParent()->getSubprogram()->getDirectory()).concat("/").concat(L->getHeader()->getParent()->getSubprogram()->getFilename()).concat(",").concat(std::to_string(L->getStartLoc()->getLine())).str()));

            // Declare String ("filename, Linenumber") in IR
            GlobalVariable *GlobalStr = new GlobalVariable(*mod ,ConstantStr->getType(),true, GlobalValue::PrivateLinkage, ConstantStr);


            // Getting All Exit Blocks of Loop in exits
            SmallVector<BasicBlock *, 8> exits;
            std::vector<Instruction *> exitsFirstInst;
            L->getExitBlocks(exits);

            //Iterate over each exit block and insert them in a vector
            for (auto e:exits) {
                if (e->isLandingPad())
                    continue;
                exitsFirstInst.push_back(e->getFirstNonPHI());
            }

            // Counter array for loop trip count
            GlobalVariable *c = mod->getGlobalVariable("cd");


            // To get i th element of any array
            std::vector<Constant *> constIndic;
            ConstantInt *constantInt0 = ConstantInt::get(mod->getContext(), APInt(32, StringRef("0"), 10));
            ConstantInt *constantInti = ConstantInt::get(mod->getContext(), APInt(32, iter));
            constIndic.push_back(constantInt0);
            constIndic.push_back(constantInti);

            // To get 1st element of any array
            std::vector<Constant *> constIndic1;
            constIndic1.push_back(ConstantInt::get(mod->getContext(), APInt(32, StringRef("0"), 10)));
            constIndic1.push_back(ConstantInt::get(mod->getContext(), APInt(32, StringRef("0"), 10)));


            //Get the global variables
            GlobalVariable *str1 = mod->getGlobalVariable(".str1");
            GlobalVariable *t1 = mod->getGlobalVariable(".t1");
            GlobalVariable *t2 = mod->getGlobalVariable(".t2");
            GlobalVariable *loop_names = mod->getGlobalVariable(".loopnames");

            //  Get Loop Preheader
            auto p = L->getLoopPreheader();

            if(!p) // P is null then some problem is there
            {
                errs() << " No Preheader Found, Try using -loops -loop-simplyfy flag\n";
                exit(1);
            }


            //  Create 1st call to clock() just before terminator instruction of loop preheader
            CallInst *call_clock_t1 = CallInst::Create(mod->getFunction("clock"), "", p->getTerminator());
            call_clock_t1->setCallingConv(CallingConv::C);
            call_clock_t1->setTailCall(false);
            

            //  Instrumenting in exitblocks
            for (auto &e : exitsFirstInst) {

                // Get loop's token (to know at which index this loop should store counter or timer values)
                Constant *counter = ConstantExpr::getGetElementPtr(ArrayType::get(IntegerType::get(mod->getContext(), 64), totalLoops), c, constIndic);
                LoadInst *loadCounter = new LoadInst(counter, "", e);
                BinaryOperator *increment = BinaryOperator::CreateAdd(loadCounter, ConstantInt::get(mod->getContext(), APInt(64, StringRef("1"), 10)), "", e);
                StoreInst *storeCounter = new StoreInst(increment, counter, e);

                
                // Create 2nd call to clock() in all the exit blocks of loop
                CallInst *call_clock_t2 = CallInst::Create(mod->getFunction("clock"), "", e);
                call_clock_t2->setCallingConv(CallingConv::C);
                call_clock_t2->setTailCall(false);

                // Calculate elapsed time
                BinaryOperator *sub = BinaryOperator::Create(Instruction::Sub, call_clock_t2, call_clock_t1, "", e);

                // Add this time it in global array
                GlobalVariable *t = mod->getGlobalVariable("t");
                Constant *timer_click = ConstantExpr::getGetElementPtr(ArrayType::get(IntegerType::get(mod->getContext(), 64), totalLoops), t, constIndic);
                LoadInst *timer_load = new LoadInst(timer_click, "", e);
                BinaryOperator *add_ans = BinaryOperator::CreateAdd(timer_load, sub, "", e);
                StoreInst *storeTimer = new StoreInst(add_ans, timer_click, e);

                // Store Loop Name in a array
                Constant *counterg1 = ConstantExpr::getGetElementPtr(ConstantStr->getType(), GlobalStr, constIndic1);
                Constant *counterg2 = ConstantExpr::getGetElementPtr(ArrayType::get(PointerType::get(IntegerType::get(mod->getContext(), 8), 0), totalLoops), loop_names, constIndic);
                StoreInst *valC = new StoreInst(counterg1, counterg2, e);
            }
            iter++;
            return true;
        }
    }
    char InsertTimer::ID = 0;
    static RegisterPass<InsertTimer> X("inserttimer", "Instrument loops with function calls");




    namespace {
            // Declare and define function and variables
            bool InsertStr::runOnModule(Module &M)  {

                //  If no loops in code then no need to instrument function code
                if(totalLoops==0)
                {
                    return false;
                }

                //Declare Global Array to Store Counter
                ArrayType *cc = ArrayType::get(IntegerType::get(M.getContext(), 64), totalLoops);
                GlobalVariable *c = new GlobalVariable(M, cc, false, GlobalValue::ExternalLinkage, 0, "cd");
                ConstantAggregateZero *const_array_2 = ConstantAggregateZero::get(cc);
                c->setInitializer(const_array_2);

                //Declare Global Array to Store time values
                ArrayType *tc = ArrayType::get(Type::getFloatTy(M.getContext()), totalLoops);
                GlobalVariable *t = new GlobalVariable(M, cc, false, GlobalValue::ExternalLinkage, 0, "t");
                ConstantAggregateZero *consgt = ConstantAggregateZero::get(cc);
                t->setInitializer(consgt);


                //Declare string "%lld," for printf function argument
                ArrayType *ArrayTy_0 = ArrayType::get(IntegerType::get(M.getContext(), 8), 6);
                GlobalVariable *time = new GlobalVariable(M, ArrayTy_0, true, GlobalValue::ExternalLinkage, 0, ".counter");
                Constant *format = ConstantDataArray::getString(M.getContext(), "%lld,", true);
                time->setInitializer(format);


                // Declare string "%lld\n" for printf function argument
                ArrayType *arrayType = ArrayType::get(IntegerType::get(M.getContext(), 8), 6);
                GlobalVariable *str = new GlobalVariable(M, arrayType, true, GlobalValue::ExternalLinkage, 0, ".str1");
                Constant *format2 = ConstantDataArray::getString(M.getContext(), "%lld\x0A", true);
                str->setInitializer(format2);


                //Declare Global Variable for printf Format for printing Time Taken
                ArrayType *cc1 = ArrayType::get(PointerType::get(IntegerType::get(M.getContext(), 8), 0), totalLoops);
                GlobalVariable *c1 = new GlobalVariable(M, cc1, false, GlobalValue::ExternalLinkage, 0, ".loopnames");
                ConstantAggregateZero *const_array_21 = ConstantAggregateZero::get(cc1);
                c1->setInitializer(const_array_21);


                //Declare Global Variable for printf Format for printing Time Taken
                ArrayType *arrayType22 = ArrayType::get(IntegerType::get(M.getContext(), 8), 5);
                GlobalVariable *str22 = new GlobalVariable(M, arrayType22, true, GlobalValue::ExternalLinkage, 0, ".str2");
                Constant *format22 = ConstantDataArray::getString(M.getContext(), "%s, \00", true);
                str22->setInitializer(format22);

                //Declare Global Variable for putting t1 before the loop and t2 after the loop
                ConstantInt *constantInt1 = ConstantInt::get(M.getContext(), APInt(64, StringRef("0"), 10));
                GlobalVariable *t1 = new GlobalVariable(M, IntegerType::get(M.getContext(), 64), false, GlobalValue::ExternalLinkage, 0, ".t1");
                t1->setInitializer(constantInt1);
                GlobalVariable *t2 = new GlobalVariable(M, IntegerType::get(M.getContext(), 64), false, GlobalValue::ExternalLinkage, 0, ".t2");
                t2->setInitializer(constantInt1);


                //Declare clock Function
                std::vector<Type *> clock_func_args;
                FunctionType *clock_func_type = FunctionType::get(IntegerType::get(M.getContext(), 64), clock_func_args, false);
                Function *clock_func = Function::Create(clock_func_type, GlobalValue::ExternalLinkage, "clock", &M);
                clock_func->setCallingConv(CallingConv::C);


                //Declare printf Function
                PointerType *PointerTy_6 = PointerType::get(IntegerType::get(M.getContext(), 8), 0);
                std::vector<Type *> printf_func_args;
                printf_func_args.push_back(PointerTy_6);
                FunctionType *printf_func_type = FunctionType::get(IntegerType::get(M.getContext(), 32), printf_func_args, true);
                Function *printf_func = Function::Create(printf_func_type, GlobalValue::ExternalLinkage, "printf", &M);
                printf_func->setCallingConv(CallingConv::C);


                // Declare i32 @atexit(void ()*)
                std::vector<Type *> atexit_args;
                atexit_args.push_back(PointerType::get(FunctionType::get(Type::getVoidTy(M.getContext()), false), 0));
                FunctionType *Atexit_type = FunctionType::get(Type::getInt32Ty(M.getContext()), atexit_args, false);
                Function *Atexit = Function::Create(Atexit_type, GlobalValue::ExternalLinkage, "atexit", &M);


                // Declare and define function which prints the profiler output
                FunctionType *PrintValues_type = FunctionType::get(Type::getVoidTy(M.getContext()), false);
                Function *PrintValues = Function::Create(PrintValues_type, GlobalValue::ExternalLinkage, "PrintValues", &M);
                BasicBlock *BB_Print = BasicBlock::Create(M.getContext(), "entry", PrintValues);
                Function *FF = M.getFunction("exit");
                std::vector<Constant *> zeroVector;
                ConstantInt *constantInt0 = ConstantInt::get(M.getContext(),APInt(32, StringRef("0"), 10));
                zeroVector.push_back(constantInt0);
                zeroVector.push_back(constantInt0);

                //Accessing printf Format for counter
                GlobalVariable *printfFormatCounter = M.getGlobalVariable(".counter");
                Constant *counterFormatGEP = ConstantExpr::getGetElementPtr(ArrayType::get(IntegerType::get(M.getContext(), 8), 6), printfFormatCounter,zeroVector);

                //Accesing print Format for Time
                GlobalVariable *pFormat = M.getGlobalVariable(".str1");
                Constant *timerFormatGEP = ConstantExpr::getGetElementPtr(ArrayType::get(IntegerType::get(M.getContext(), 8), 6), pFormat, zeroVector);

                // Get loop names array
                GlobalVariable *loop_names = M.getGlobalVariable(".loopnames");
                Constant *loopNamePrintFormat = ConstantExpr::getGetElementPtr(ArrayType::get(IntegerType::get(M.getContext(), 8), 5), str22, zeroVector);



                // Write printf for each loop
                while (g < totalLoops) {

                    //Print Loop ID
                    std::vector<Value *> loop_id_args;
                    loop_id_args.push_back(counterFormatGEP);
                    loop_id_args.push_back(ConstantInt::get(M.getContext(), APInt(32, g)));
                    CallInst *call_printf = CallInst::Create(M.getFunction("printf"), loop_id_args, "", BB_Print);
                    call_printf->setCallingConv(CallingConv::C);
                    call_printf->setTailCall(false);



                    
                    // Print Loopname and LoopLine Number
                    {
                        std::vector<Constant *> constIndic;
                        ConstantInt *constantInt0 = ConstantInt::get(M.getContext(), APInt(32, StringRef("0"), 10));
                        ConstantInt *constantInti = ConstantInt::get(M.getContext(), APInt(32, g));
                        constIndic.push_back(constantInt0);
                        constIndic.push_back(constantInti);
                        Constant *counterg2 = ConstantExpr::getGetElementPtr(ArrayType::get(PointerType::get(IntegerType::get(M.getContext(), 8), 0), totalLoops), loop_names, constIndic);
                        LoadInst *valC = new LoadInst(counterg2, "", BB_Print);
                        std::vector<Value *> loop_id_args;
                        loop_id_args.push_back(loopNamePrintFormat);
                        loop_id_args.push_back(valC);
                        CallInst *call_printf = CallInst::Create(M.getFunction("printf"), loop_id_args, "", BB_Print);
                        call_printf->setCallingConv(CallingConv::C);
                        call_printf->setTailCall(false);
                    }



                    //Print Counter (Token) of Loop
                    std::vector<Constant *> constIndicg;
                    ConstantInt *constantInti = ConstantInt::get(M.getContext(), APInt(32, g));
                    constIndicg.push_back(constantInt0);
                    constIndicg.push_back(constantInti);
                    Constant *counterg = ConstantExpr::getGetElementPtr(ArrayType::get(IntegerType::get(M.getContext(), 64), totalLoops), c, constIndicg);
                    LoadInst *valC = new LoadInst(counterg, "", BB_Print);
                    std::vector<Value *> printf_args;
                    printf_args.push_back(counterFormatGEP);
                    printf_args.push_back(valC);
                    CallInst *call_printf1 = CallInst::Create(M.getFunction("printf"), printf_args, "", BB_Print);
                    call_printf1->setCallingConv(CallingConv::C);
                    call_printf1->setTailCall(false);

                    //Print Time elapsed of loop
                    Constant *timer = ConstantExpr::getGetElementPtr(
                    ArrayType::get(Type::getInt64Ty(M.getContext()), totalLoops), t, constIndicg);
                    LoadInst *timerLoad = new LoadInst(timer, "", BB_Print);
                    std::vector<Value *> p_args;
                    p_args.push_back(timerFormatGEP);
                    p_args.push_back(timerLoad);
                    CallInst *call_print_func = CallInst::Create(M.getFunction("printf"), p_args, "", BB_Print);
                    call_print_func->setCallingConv(CallingConv::C);
                    call_print_func->setTailCall(false);

                    g++;
                }

                ReturnInst::Create(M.getContext(), BB_Print);

                // Insert atexit(PrintValues) in entry block of main (just after phi instructions)
                Function *F = M.getFunction("main");
                if(F)
                {
                    BasicBlock &main_entry = F->getEntryBlock();
                    Instruction *main_firstnonphi =  main_entry.getFirstNonPHI();
                    std::vector<Value *> callatexit_args;
                    callatexit_args.push_back(PrintValues);
                    CallInst *atexit_call = CallInst::Create(M.getFunction("atexit"), callatexit_args, "", main_firstnonphi);
                    atexit_call->setCallingConv(CallingConv::C);
                    atexit_call->setTailCall(false);

                }
                return true;
                }
            }
    char InsertStr::ID = 0;
    static RegisterPass<InsertStr> Y("insertstr", "For Declaring and defining global function or variable");
}
