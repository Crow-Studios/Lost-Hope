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
            subprocess.call([addonbuilder, f"{in_path}/{folder}", out_path, "-clear", "-temp", "-binarizeNoLogs", f"-include={in_path}/include.txt"]) # use the include.txt
        else:
            print(f"{folder} was aborted")

packAllPbo("F:\SteamLibrary\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe","C:\\Users\jakey\Documents\Arma 3 - Other Profiles\Silence\missions\PACK\lost_hope_root", "C:\\Users\jakey\Documents\Arma 3 - Other Profiles\Silence\missions\PACK\lost_hope_root\Lost_Hope\@Lost_Hope\\addons")
time.sleep(3)
packAllPbo("F:\SteamLibrary\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe","C:\\Users\jakey\Documents\Arma 3 - Other Profiles\Silence\missions\Lost-Hope-Models", "C:\\Users\jakey\Documents\Arma 3 - Other Profiles\Silence\missions\PACK\lost_hope_root\Lost_Hope\@Lost_Hope\\addons")