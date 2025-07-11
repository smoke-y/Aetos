#import "lib/io.zs"
#import "lib/mem.zs"
#import "lib/str.zs"

Bytecode :: enum{
    LOG,
        LICENSE,
}

lic :: proc(fileName: ^char, leng: u32){
    //TODO: use fileName
file := fopen("LICENSE.txt", "rb")
          if file == 0{
              printf("File does not exist")
                  return 
          }
      defer fclose(file)

          fseek(file, 0, SEEK_END)
          len := ftell(file)
          fseek(file, 0, SEEK_SET)

          buff : ^char = malloc(len)
          defer free(buff)

          fread(buff, len, 1, file)
          printf("LICENSE:\n%s\n", buff)
}

exec :: proc(opcodes: ^u32, len: u32, strs: ^^char){
    for i:=0...len{
opcode := opcodes[i]
            i = i +1
            strLoc := opcodes[i]
            i= i + 1
            leng := opcodes[i]
            str := strs[strLoc]
            if(opcode == Bytecode\LOG){
                printf("%.*s\n", leng, str)
            }else if(opcode == Bytecode\LICENSE){
                lic(str, leng)
            }
    }
}
