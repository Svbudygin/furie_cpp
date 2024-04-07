#include <iostream>
#include <cmath>
#include <sndfile.h>
#include <vector>
// https://github.com/LibraryOfCongress/ADCTest/blob/master/lib-src/libsndfile/include/sndfile.h
// https://github.com/fmtlib/fmt/blob/master/include/fmt/format.h

const double TwoPi = 6.283185307179586;

void FFTAnalysis(double *AVal, double *FTvl, int Nvl, int Nft);

void processAudioFile(std::string path);

//int main()
//{
//    std::string filename = "../songs/GSPD-RUSSIA_HAS_3_PATHS.mp3";
//    std::cout << filename << std::endl;
//    processAudioFile(filename);
//
//    return 0;
//}



// AVal - массив анализируемых данных, Nvl - длина массива должна быть кратна степени 2.
// FTvl - массив полученных значений, Nft - длина массива должна быть равна Nvl.


void FFTAnalysis(double* AVal, double* FTvl, int Nvl, int Nft)
{
    int i, j, n, m, Mmax, Istp;
    double Tmpr, Tmpi, Wtmp, Theta;
    double Wpr, Wpi, Wr, Wi;
    double *Tmvl;

    n = Nvl * 2;
    Tmvl = new double[n];

    for (i = 0; i < n; i += 2)
    {
        Tmvl[i] = 0;
        Tmvl[i + 1] = AVal[i / 2];
    }

    i = 1;
    j = 1;
    while (i < n)
    {
        if (j > i)
        {
            Tmpr = Tmvl[i];
            Tmvl[i] = Tmvl[j];
            Tmvl[j] = Tmpr;
            Tmpr = Tmvl[i + 1];
            Tmvl[i + 1] = Tmvl[j + 1];
            Tmvl[j + 1] = Tmpr;
        }
        i = i + 2;
        m = Nvl;
        while ((m >= 2) && (j > m))
        {
            j = j - m;
            m = m >> 1;
        }
        j = j + m;
    }

    Mmax = 2;
    while (n > Mmax)
    {
        Theta = -TwoPi / Mmax;
        Wpi = sin(Theta);
        Wtmp = sin(Theta / 2);
        Wpr = Wtmp * Wtmp * 2;
        Istp = Mmax * 2;
        Wr = 1;
        Wi = 0;
        m = 1;

        while (m < Mmax)
        {
            i = m;
            m = m + 2;
            Tmpr = Wr;
            Tmpi = Wi;
            Wr = Wr - Tmpr * Wpr - Tmpi * Wpi;
            Wi = Wi + Tmpr * Wpi - Tmpi * Wpr;

            while (i < n)
            {
                j = i + Mmax;
                Tmpr = Wr * Tmvl[j] - Wi * Tmvl[j - 1];
                Tmpi = Wi * Tmvl[j] + Wr * Tmvl[j - 1];

                Tmvl[j] = Tmvl[i] - Tmpr;
                Tmvl[j - 1] = Tmvl[i - 1] - Tmpi;
                Tmvl[i] = Tmvl[i] + Tmpr;
                Tmvl[i - 1] = Tmvl[i - 1] + Tmpi;
                i = i + Istp;
            }
        }

        Mmax = Istp;
    }

    for (i = 0; i < Nft; i++)
    {
        j = i * 2;
        FTvl[i] = 2 * sqrt(pow(Tmvl[j], 2) + pow(Tmvl[j + 1], 2)) / Nvl;
    }

    delete[] Tmvl;
}


void processAudioFile(std::string path) {
    // Открываем аудиофайл для чтения
    const char* filename = path.c_str();
    filename = "D:/studying/prog/furie_cpp/furie_cpp/songs/GSPD-RUSSIA_HAS_3_PATHS.mp3";
    SF_INFO info;
    SNDFILE* file = sf_open(filename, SFM_READ, &info);
    if (!file) {
        std::cerr << "Error opening the file" << std::endl;

    }

    // Размер блока данных для чтения (например, каждый блок будет содержать 1 секунду аудио)
    const int block_size = info.samplerate; // 1 секунда

    // Буфер для чтения данных из файла
    std::vector<float> buffer(block_size * info.channels);

    // Читаем данные из файла и разбиваем их на отрезки
    while (true) {
        // Читаем блок данных из файла
        sf_count_t read_count = sf_readf_float(file, buffer.data(), block_size);
        if (read_count <= 0) {
            // Если больше данных не осталось, выходим из цикла
            break;
        }

        // Обработка блока данных
        // Например, здесь можно обработать блок данных или сохранить его в отдельный файл

        // Выводим информацию о размере блока
        std::cout << "Read block of size: " << read_count << " samples" << std::endl;
    }

    // Закрываем файл
    sf_close(file);


}
