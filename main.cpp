#include <iostream>
#include "include/fft/furie.h"

int main()
{
    std::string filename = "../songs/GSPD-RUSSIA_HAS_3_PATHS.mp3";
    std::cout << filename << std::endl;
    processAudioFile(filename);

    return 0;
}
