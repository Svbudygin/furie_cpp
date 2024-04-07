#ifndef AUDIO_PROCESSOR_H
#define AUDIO_PROCESSOR_H

#include <iostream>
#include <cmath>
#include <sndfile.h>
#include <vector>

// Объявление функций
void FFTAnalysis(double *AVal, double *FTvl, int Nvl, int Nft);
void processAudioFile(std::string path);

#endif // AUDIO_PROCESSOR_H
