
text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit"

class Txt_File_Handler():

    path_file : str

    def __init__(self, path_file):
        self.path_file= path_file

    def get_path(self):
        return self.path_file

    def write_line(self, text: str):
        with open(self.path_file ,"w") as f:
            f.write(text) 
            f.write("\n") 
            f.close()

    def append_line(self, text):
        with open(self.path_file ,"a") as f:
            f.write(text)  
            f.write("\n")
            f.close()

    def read_all(self):
        with open(self.path_file,"r") as f:
            f_lines = f.read()
            f.close()
        return f_lines

    def read_lines(self, line: int):
        with open(self.path_file,"r") as f:
            f_line = f.readlines(line)
            f.close()
        return f_line

    def read_line(self, line: int):
        with open(self.path_file,"r") as f:
            f_line = f.readline(line)
            f.close()
        return f_line
    

# Pruebas

f =   Txt_File_Handler("unidad_17/tema_1/docs/test.txt")
f.write_line("algo1")
f.append_line("algo2")
f.append_line("algo3")
line = 1

print("Archivo\n")
print(f.read_all())
print(f"linea {line}")
print(f.read_lines(line))