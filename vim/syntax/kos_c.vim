" Kos source code syntax highlighting

syntax keyword kosMacro TRY
syntax keyword kosMacro TRY_OBJID
syntax keyword kosMacro RAISE_EXCEPTION
syntax keyword kosMacro RAISE_EXCEPTION_STR
syntax keyword kosMacro RAISE_ERROR
syntax keyword kosMacro IS_BAD_PTR
syntax keyword kosMacro IS_SMALL_INT
syntax keyword kosMacro GET_SMALL_INT
syntax keyword kosMacro TO_SMALL_INT
syntax keyword kosMacro IS_NUMERIC_OBJ
syntax keyword kosMacro READ_OBJ_TYPE
syntax keyword kosMacro GET_OBJ_TYPE
syntax keyword kosMacro OBJPTR
syntax keyword kosMacro OBJID
syntax keyword kosMacro KOS_DECLARE_CONST_STRING_WITH_LENGTH
syntax keyword kosMacro KOS_DECLARE_STATIC_CONST_STRING_WITH_LENGTH
syntax keyword kosMacro KOS_DECLARE_CONST_STRING
syntax keyword kosMacro KOS_DECLARE_STATIC_CONST_STRING
syntax keyword kosMacro KOS_ATOMIC
syntax keyword kosMacro TRY_ADD_GLOBAL
syntax keyword kosMacro TRY_ADD_FUNCTION
syntax keyword kosMacro TRY_ADD_GENERATOR
syntax keyword kosMacro TRY_ADD_CONSTRUCTOR
syntax keyword kosMacro TRY_ADD_MEMBER_FUNCTION
syntax keyword kosMacro TRY_ADD_MEMBER_GENERATOR
syntax keyword kosMacro TRY_ADD_MEMBER_PROPERTY
syntax keyword kosMacro TRY_ADD_INTEGER_CONSTANT
syntax keyword kosMacro TRY_ADD_STRING_CONSTANT
syntax keyword kosMacro KOS_INIT_MODULE
syntax keyword kosMacro KOS_EXTERN_C
syntax keyword kosMacro KOS_EXPORT_SYMBOL
syntax keyword kosMacro KOS_IMPORT_SYMBOL
syntax keyword kosMacro KOS_API
syntax keyword kosMacro KOS_CPP11
syntax keyword kosMacro KOS_CONST_ID

syntax keyword kosType KOS_ENTITY_TYPE_E
syntax keyword kosType KOS_TYPE
syntax keyword kosType KOS_OBJ_ID
syntax keyword kosType KOS_OBJECT_HEADER_S
syntax keyword kosType KOS_OBJECT_HEADER
syntax keyword kosType KOS_CONTEXT
syntax keyword kosType KOS_INSTANCE
syntax keyword kosType KOS_FUNCTION_STATE_E
syntax keyword kosType KOS_FUNCTION_STATE
syntax keyword kosType KOS_FUNCTION_OPTS_S
syntax keyword kosType KOS_FUNCTION_OPTS
syntax keyword kosType KOS_FUNCTION_HANDLER
syntax keyword kosType KOS_STRING_FLAGS_E
syntax keyword kosType KOS_STRING_FLAGS
syntax keyword kosType KOS_MODULE_FLAGS_E
syntax keyword kosType KOS_ARG_DESC
syntax keyword kosType KOS_BYTECODE_INSTR
syntax keyword kosType KOS_VECTOR
syntax keyword kosType KOS_VECTOR_S
syntax keyword kosType KOS_MEMPOOL_S
syntax keyword kosType KOS_NUMERIC_TYPE_E
syntax keyword kosType KOS_NUMERIC_VALUE_U
syntax keyword kosType KOS_NUMERIC_VALUE
syntax keyword kosType KOS_NUMERIC_S
syntax keyword kosType KOS_NUMERIC
syntax keyword kosType KOS_COMPARE_RESULT_E
syntax keyword kosType KOS_COMPARE_RESULT
syntax keyword kosType KOS_VOID_INDEX_E
syntax keyword kosType KOS_QUOTE_STR_E
syntax keyword kosType KOS_QUOTE_STR
syntax keyword kosType KOS_PRINT_WHERE_E
syntax keyword kosType KOS_DEPTH_E
syntax keyword kosType KOS_PAGE_HEADER_S
syntax keyword kosType KOS_PAGE
syntax keyword kosType KOS_POOL_HEADER_S
syntax keyword kosType KOS_POOL
syntax keyword kosType KOS_MARK_GROUP_S
syntax keyword kosType KOS_MARK_GROUP
syntax keyword kosType KOS_PAGE_LIST_S
syntax keyword kosType KOS_PAGE_LIST
syntax keyword kosType KOS_MODULE_LOAD_CHAIN_S
syntax keyword kosType KOS_MODULE_LOAD_CHAIN
syntax keyword kosType KOS_LIB_LIST_S
syntax keyword kosType KOS_LIB_LIST
syntax keyword kosType KOS_HEAP_S
syntax keyword kosType KOS_HEAP
syntax keyword kosType KOS_CATCH_STATE_E
syntax keyword kosType KOS_STACK_FLAGS_E
syntax keyword kosType KOS_STACK
syntax keyword kosType KOS_ULOCAL
syntax keyword kosType KOS_LOCAL
syntax keyword kosType KOS_INSTANCE_FLAGS_E

syntax keyword kosType KOS_INTEGER
syntax keyword kosType KOS_FLOAT
syntax keyword kosType KOS_VOID_TYPE
syntax keyword kosType KOS_BOOLEAN
syntax keyword kosType KOS_OPAQUE
syntax keyword kosType KOS_STRING
syntax keyword kosType KOS_OBJECT
syntax keyword kosType KOS_BUFFER
syntax keyword kosType KOS_ARRAY
syntax keyword kosType KOS_FUNCTION
syntax keyword kosType KOS_CLASS
syntax keyword kosType KOS_MODULE
syntax keyword kosType KOS_DYNAMIC_PROP
syntax keyword kosType KOS_ITERATOR

syntax keyword kosType INTEGER
syntax keyword kosType FLOAT
syntax keyword kosType VOID_TYPE
syntax keyword kosType BOOLEAN
syntax keyword kosType OPAQUE
syntax keyword kosType STRING
syntax keyword kosType OBJECT
syntax keyword kosType BUFFER
syntax keyword kosType ARRAY
syntax keyword kosType FUNCTION
syntax keyword kosType CLASS
syntax keyword kosType MODULE
syntax keyword kosType DYNAMIC_PROP
syntax keyword kosType ITERATOR

syntax keyword kosConstant KOS_NULL
syntax keyword kosConstant KOS_BADPTR
syntax keyword kosConstant KOS_VOID
syntax keyword kosConstant KOS_FALSE
syntax keyword kosConstant KOS_TRUE
syntax keyword kosConstant KOS_STR_EMPTY

syntax keyword kosConstant OBJ_SMALL_INTEGER
syntax keyword kosConstant OBJ_INTEGER
syntax keyword kosConstant OBJ_FLOAT
syntax keyword kosConstant OBJ_VOID
syntax keyword kosConstant OBJ_BOOLEAN
syntax keyword kosConstant OBJ_STRING
syntax keyword kosConstant OBJ_OBJECT
syntax keyword kosConstant OBJ_ARRAY
syntax keyword kosConstant OBJ_BUFFER
syntax keyword kosConstant OBJ_FUNCTION
syntax keyword kosConstant OBJ_CLASS
syntax keyword kosConstant OBJ_LAST_TYPE
syntax keyword kosConstant OBJ_OPAQUE
syntax keyword kosConstant OBJ_HUGE_TRACKER
syntax keyword kosConstant OBJ_OBJECT_STORAGE
syntax keyword kosConstant OBJ_ARRAY_STORAGE
syntax keyword kosConstant OBJ_BUFFER_STORAGE
syntax keyword kosConstant OBJ_DYNAMIC_PROP
syntax keyword kosConstant OBJ_ITERATOR
syntax keyword kosConstant OBJ_MODULE
syntax keyword kosConstant OBJ_STACK
syntax keyword kosConstant OBJ_LAST

syntax keyword kosConstant KOS_STRING_ELEM_8
syntax keyword kosConstant KOS_STRING_ELEM_16
syntax keyword kosConstant KOS_STRING_ELEM_32
syntax keyword kosConstant KOS_STRING_ELEM_MASK

syntax keyword kosConstant KOS_STRING_LOCAL
syntax keyword kosConstant KOS_STRING_PTR
syntax keyword kosConstant KOS_STRING_REF
syntax keyword kosConstant KOS_FUN
syntax keyword kosConstant KOS_CTOR
syntax keyword kosConstant KOS_GEN_INIT
syntax keyword kosConstant KOS_GEN_READY
syntax keyword kosConstant KOS_GEN_ACTIVE
syntax keyword kosConstant KOS_GEN_RUNNING
syntax keyword kosConstant KOS_GEN_DONE

syntax keyword kosConstant KOS_MODULE_OWN_BYTECODE
syntax keyword kosConstant KOS_MODULE_OWN_LINE_ADDRS
syntax keyword kosConstant KOS_MODULE_OWN_FUNC_ADDRS

syntax keyword kosConstant KOS_DEEP
syntax keyword kosConstant KOS_SHALLOW
syntax keyword kosConstant KOS_CONTENTS

syntax keyword kosConstant KOS_NORMAL_STACK
syntax keyword kosConstant KOS_REENTRANT_STACK
syntax keyword kosConstant KOS_CAN_YIELD
syntax keyword kosConstant KOS_GENERATOR_DONE

syntax keyword kosConstant KOS_INST_NO_FLAGS
syntax keyword kosConstant KOS_INST_VERBOSE
syntax keyword kosConstant KOS_INST_DEBUG
syntax keyword kosConstant KOS_INST_DISASM
syntax keyword kosConstant KOS_INST_MANUAL_GC
syntax keyword kosConstant KOS_INST_DISABLE_TAIL_CALL

syntax keyword kosConstant KOS_NO_CATCH
syntax keyword kosConstant KOS_DONT_QUOTE
syntax keyword kosConstant KOS_QUOTE_STRINGS
syntax keyword kosConstant KOS_STDOUT
syntax keyword kosConstant KOS_STDERR
syntax keyword kosConstant KOS_NON_NUMERIC
syntax keyword kosConstant KOS_INTEGER_VALUE
syntax keyword kosConstant KOS_FLOAT_VALUE
syntax keyword kosConstant KOS_EQUAL
syntax keyword kosConstant KOS_LESS_THAN
syntax keyword kosConstant KOS_GREATER_THAN
syntax keyword kosConstant KOS_INDETERMINATE
syntax keyword kosConstant KOS_VOID_INDEX_INVALID
syntax keyword kosConstant KOS_VOID_INDEX_IS_BEGIN
syntax keyword kosConstant KOS_VOID_INDEX_IS_END

syntax keyword kosConstant KOS_SUCCESS
syntax keyword kosConstant KOS_SUCCESS_RETURN
syntax keyword kosConstant KOS_ERROR_INTERNAL
syntax keyword kosConstant KOS_ERROR_EXCEPTION
syntax keyword kosConstant KOS_ERROR_OUT_OF_MEMORY
syntax keyword kosConstant KOS_ERROR_NOT_FOUND
syntax keyword kosConstant KOS_ERROR_NO_DIRECTORY
syntax keyword kosConstant KOS_ERROR_ERRNO
syntax keyword kosConstant KOS_ERROR_SETTER
syntax keyword kosConstant KOS_ERROR_SCANNING_FAILED
syntax keyword kosConstant KOS_ERROR_PARSE_FAILED
syntax keyword kosConstant KOS_ERROR_COMPILE_FAILED
syntax keyword kosConstant KOS_ERROR_INVALID_UTF8_CHARACTER
syntax keyword kosConstant KOS_ERROR_INTERRUPTED
syntax keyword kosConstant KOS_ERROR_INVALID_EXPONENT
syntax keyword kosConstant KOS_ERROR_EXPONENT_OUT_OF_RANGE
syntax keyword kosConstant KOS_ERROR_NUMBER_TOO_BIG
syntax keyword kosConstant KOS_ERROR_INTEGER_EXPECTED
syntax keyword kosConstant KOS_ERROR_INVALID_NUMBER

" Default highlighting
if version >= 508 || !exists("kos_syntax_init")
    if version < 508
        let kos_syntax_init = 1
        command -nargs=+ HiLink hi link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif

    HiLink kosConstant Constant
    HiLink kosType     Type
    HiLink kosMacro    Macro

    delcommand HiLink
endif
