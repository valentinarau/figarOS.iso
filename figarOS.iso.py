from PIL import Image

# ascii characters used to build the output text
ASCII_CHARS = ["@", "#", "S", "%", "?", "*", "+", ";", ":", ",", "."]

# resize image according to a new width
def resize_image(image, new_width=100):
    width, height = image.size
    ratio = height/width/1.65
    new_height = int(new_width * ratio)
    resized_image = image.resize((new_width, new_height))
    return(resized_image)

# convert each pixel to grayscale
def grayify(image):
    grayscale_image = image.convert("L")
    return(grayscale_image)
    
# convert pixels to a string of ascii characters
def pixels_to_ascii(image):
    pixels = image.getdata()
    characters = "".join([ASCII_CHARS[pixel//25] for pixel in pixels])
    return(characters)    

def main(new_width=100):

    # booting 
    bootingOS = int(input("Choose an operating system to start:\n1. figaro \n2. Windows 11\n3. Arch Linux\n"))

    if(bootingOS != 1):
        exit()

    message = "\n\nlautaroocampo@Vivobook-S15\n--------------------\nOS: figaro v1.0.0\nHost: VivoBook S15 X510UF 1.0\nKernel: 1.0.0 - FIGARO\nUptime: 0.0001 ns\nPackages: 0\nShell: bash 5.1.8\nResolution 640x480\nDE: Catnip\nWM: uwu\nTheme: SynthWave\nIcons: Asuka Langley [Evangelion], bunny [uwu]\nTerminal: katsole\nCPU: Intel i7-855OU (8) @ 4.000GHz\nGPU: NVIDIA GeForce MX130\nGPU: Intel UHD Graphics 620\nMemory: 903MiB / 15888MiB\n"

    # attempt to open image from user-input
    path = input("Enter a valid pathname to an image:\n")
    try:
        image = Image.open(path)
    except:
        print(path, " is not a valid pathname to an image.")
        return
  
    # convert image to ascii    
    new_image_data = pixels_to_ascii(grayify(resize_image(image)))
    
    # format
    pixel_count = len(new_image_data)  
    ascii_image = "\n".join([new_image_data[index:(index+new_width)] for index in range(0, pixel_count, new_width)])
    
    # print result
    print(ascii_image)
    print(message)
    
    # save result to "ascii_image.txt"
    with open("ascii_image.txt", "w") as f:
        f.write(ascii_image)
        f.write(message)
 
# run program
main()