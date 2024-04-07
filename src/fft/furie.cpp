#include <iostream>
#include <cmath>
#include "AudioFile.h" // Подключаем заголовочный файл библиотеки AudioFile
#include <vector>
#include <cstdint>
#include <algorithm>
// https://github.com/LibraryOfCongress/ADCTest/blob/master/lib-src/libsndfile/include/sndfile.h
// https://github.com/fmtlib/fmt/blob/master/include/fmt/format.h

const double TwoPi = 6.283185307179586;
#include <complex>
#include <vector>

// Функция, выполняющая преобразование Фурье для вектора из float'ов
std::vector<float> fourierTransform(const std::vector<float>& samples) {
    int N = samples.size();
    std::vector<float> real(N, 0.0f);
    std::vector<float> imag(N, 0.0f);
    std::vector<float> magnitude(N);

    for (int k = 0; k < N; ++k) {
        for (int n = 0; n < N; ++n) {
            float angle = 2 * M_PI * k * n / N;
            real[k] += samples[n] * std::cos(angle);
            imag[k] -= samples[n] * std::sin(angle);
        }
        magnitude[k] = std::sqrt(real[k] * real[k] + imag[k] * imag[k]);
    }

    return magnitude;
}





void processAudioFile(std::string path) { // Считываем аудиофайл
    AudioFile<float> audio;

    if (!audio.load(path)) {
        std::cerr << "Не удалось загрузить аудиофайл\n";
        return ;
    }

// Получаем частоту дискретизации аудиофайла
    unsigned int sampleRate = audio.getSampleRate();

// Определяем длительность сегмента (в сэмплах)
    unsigned int segmentDuration = sampleRate; // 1 секунда

// Получаем общее количество сэмплов в аудиофайле
    unsigned int totalSamples = audio.getNumSamplesPerChannel();

// Определяем количество сегментов
    unsigned int numSegments = totalSamples / segmentDuration;

// Создаем вектор для хранения сегментов аудио
    std::vector<float> segments;

// Разбиваем аудиофайл на сегменты
    for (unsigned int i = 0; i < numSegments; i++) {
// Извлекаем сегмент продолжительностью в одну секунду
        for (unsigned int j = 0; j < segmentDuration; j=j+20) {
            segments.push_back(audio.samples[0][i * segmentDuration + j]);
        }
    }


// Выводим количество сегментов
    std::cout << "Количество сегментов: " << numSegments << std::endl;
    std::vector<float> furieVector;
    furieVector = fourierTransform(segments);
    std::cout<<furieVector[1];
// Здесь вы можете использовать каждый сегмент для анализа или обработки

    return ;
}
