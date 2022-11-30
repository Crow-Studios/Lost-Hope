import os
import subprocess
import time

def packAllPbo(addonbuilder,in_path,out_path):

    directories = os.walk(f"{in_path}")
    dirpath, dirnames, filenames = next(directories)

    #for i in range(len(dirnames)):
    for folder in os.listdir(in_path):
        isFile = os.path.isfile(f"{folder}")
        notAllowed = ["@", ".git", ".vscode"]
        #reiterate through the notAllowed extensions or keywords, stops things like mod folders being packed
        for folderName in notAllowed:
            if (folderName in str(folder)):
                isFile = True

        if (isFile == False):
            print(f"-exclude={str(in_path)}\exclude.txt")
            subprocess.call([addonbuilder, f"{in_path}/{folder}", out_path, "-binarizeNoLogs", f"-exclude={in_path}\exclude.txt"]) # use the exclude.txt to delete .bin file (f"-exclude={in_path}/exclude.txt")
        else:
            print(f"{folder} was aborted")

packAllPbo("F:\SteamLibrary\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe","C:\\Users\jakey\Documents\Arma 3 - Other Profiles\Silence\missions\PACK", "C:\\Users\jakey\Documents\Arma 3 - Other Profiles\Silence\missions\PACK\Lost_Hope\@Lost_Hope\\addons")
time.sleep(3)
packAllPbo("F:\SteamLibrary\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe","C:\\Users\jakey\Documents\Arma 3 - Other Profiles\Silence\missions\Lost-Hope-Models", "C:\\Users\jakey\Documents\Arma 3 - Other Profiles\Silence\missions\PACK\Lost_Hope\@Lost_Hope\\addons")