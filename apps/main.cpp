#include <iostream>
#include "fft/furie.h"

int main()
{
//    std::string filename = "../songs/GSPD-RUSSIA_HAS_3_PATHS.mp3";
    std::string filename = "D:/studying/prog/furie_cpp/furie_cpp/songs/song.wav";
    std::cout << filename << std::endl;

    processAudioFile(filename);

    return 0;
}
