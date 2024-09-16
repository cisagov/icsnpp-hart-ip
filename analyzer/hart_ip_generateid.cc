// Copyright 2024, Battelle Energy Alliance, LLC, ALL RIGHTS RESERVED
#include <string>
#include <iostream>
#include <algorithm>
#include <random>
#include <hilti/rt/libhilti.h>
#include <spicy/rt/libspicy.h>

namespace HART_IP_GENERATEID
{
    #define ID_LEN 9
    
    std::string generateId() {
        std::stringstream ss;
        for (auto i = 0; i < ID_LEN; i++) {
            // Generate a random char
            std::random_device rd;
            std::mt19937 gen(rd());
            std::uniform_int_distribution<> dis(0, 255);
            const auto rc = dis(gen);

            // Hex representaton of random char
            std::stringstream hexstream;
            hexstream << std::hex << rc;
            auto hex = hexstream.str();
            ss << (hex.length() < 2 ? '0' + hex : hex);
        }
        return ss.str();
    }
}

