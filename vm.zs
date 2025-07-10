#import "lib/io.zs"
#import "lib/mem.zs"

Bytecode :: enum{
    LOG,
    PUSH_I,
    PUSH_D,
    POP_I,
    POP_D,
}

log :: proc(mem: ^char, len: u32){
    printf("%.*s", len, mem)
}

exec :: proc(opcodes: ^u32, len: u32){
    for i:=0...len{
        printf("%d\n", opcodes[i])
    }
}

main :: proc(){
    ops :^u32 = {Bytecode\LOG, Bytecode\POP_I}
    exec(ops, 2)
}
