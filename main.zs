#import "lib/io.zs"

log :: proc(mem: ^char, len: u32){
    printf("%.*s", len, mem)
}
