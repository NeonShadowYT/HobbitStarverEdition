
import os
import subprocess
import shutil

# Specify the input folder containing files 
input_folder = "./"
destination_dir = r"C:\Users\NeonCyndows\Documents\Project\HobbitStarverEdition\Levels\CH4_OVERHILL"

def func():

    for filename in os.listdir(input_folder):
        if filename.endswith(".EXPORT.TXT"):
            print(filename)
            input_file = os.path.join(input_folder, filename)

            try:
                print(subprocess.run(["exporttool.exe", "-c", input_file], capture_output=True))
            except Exception as e:
                print("Something is wrong, probably you've messed up in" + filename )
                print(e)
                return
            
            output_file = os.path.join(destination_dir, filename)

            output_file = output_file.replace('.TXT', '')
            print(output_file)

            shutil.move(filename.replace('.TXT', ''), output_file)



print('start')
func()
print('Everything is done')