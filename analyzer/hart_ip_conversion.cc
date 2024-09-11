#include <string>
#include <iostream>
#include <algorithm>
#include <random>
#include <hilti/rt/libhilti.h>
#include <spicy/rt/libspicy.h>

namespace HART_IP_CONVERSION
{
    std::string latin1Conversion(const hilti::rt::Bytes &data)    {
        std::string returnValue;
        const char *char_ptr = (const char *) data.data();
        for(std::size_t i = 0; i < data.size(); ++i)
        {
            //if(0 == char_ptr[i])
            //{
            //    break;
            //}
            returnValue += char_ptr[i];
        }
        return returnValue;
    }

    std::string dateConversion(const hilti::rt::Bytes &data)    {
        if(data.size() < 3)
        {
            printf("[error] Date Type Improper Byte Length (%li), must be 3\n", data.size());
            return "";
        }

        const char *char_ptr = (const char *) data.data();

        unsigned char day = char_ptr[0];
        unsigned char month = char_ptr[1];
        unsigned char shortYear = char_ptr[2];
        unsigned int longYear = 1900 + shortYear;

        return std::to_string(month) + "-" +
               std::to_string(day) + "-" +
               std::to_string(longYear);
    }

    std::string timeConversion(const hilti::rt::Bytes &data)    {
        const unsigned int MILLISECOND_PARTS = 32;
        const unsigned int SECONDS_PER_MINUTE = 60;
        const unsigned int MINUTES_PER_HOUR = 60;
        if(data.size() < 4)
        {
            printf("[error] Time Type Improper Byte Length (%li), must be 4\n", data.size());
            return "";
        }
        const char *char_ptr = (const char *) data.data();
        unsigned int time = 0;
        for(int i = 0; i < 4; ++i)
        {
            time <<= 8;
            time |= (unsigned char)char_ptr[i];
        }
        //printf("Time: %u\n", time);
        float fractionPart = (float)(time % MILLISECOND_PARTS)/(float)MILLISECOND_PARTS;
        unsigned int totalSeconds = time / MILLISECOND_PARTS; // Same as time >> 5
        unsigned int secondsPart = totalSeconds % SECONDS_PER_MINUTE;
        unsigned int totalMinutes = totalSeconds / SECONDS_PER_MINUTE;
        unsigned int minutesPart = totalMinutes % MINUTES_PER_HOUR;
        unsigned int hoursPart = totalMinutes / MINUTES_PER_HOUR;

        std::string returnString = "";
        std::string tempString = "";
        if(0 < secondsPart || 0.0 < fractionPart)
        {
            returnString = std::to_string(fractionPart + secondsPart) +
                           " seconds since midnight";
        }
        if(0 < minutesPart)
        {
            tempString = std::to_string(minutesPart) + " minutes";
            if("" != returnString)
            {
                tempString += ", ";
            }
            returnString = tempString + returnString;
        }
        if(0 < hoursPart)
        {
            tempString = std::to_string(hoursPart) + " hours";
            if("" != returnString)
            {
                tempString += ", ";
            }
            returnString = tempString + returnString;
        }

        return returnString;
    }

    std::string packedConversion(const hilti::rt::Bytes &data)    {
        const int INPUT_CHARS = 3;
        const int OUTPUT_CHARS = 4;
        const int BITS_PER_BYTE = 8;
        const int NEEDED_BITS = BITS_PER_BYTE / OUTPUT_CHARS * INPUT_CHARS;
        // MAP from TS20099 (v11.0) 5.1.1, Table 1
        // Note: there are other ways to do this, this just seems easy for now.
        const std::string MAP = "@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_ !\"#$%&'()*+,-./0123456789:;<=>?";
            
        if(0 != data.size() % INPUT_CHARS)
        {
            printf("[error] Packed Type Improper Byte Length (%li), must be divisible by %i\n", data.size(), INPUT_CHARS);
            return "";
        }
        std::string outputString;

        unsigned char tempChar = 0;
        int processedBits = 0;
        const char *char_ptr = (const char *) data.data();
        for(std::size_t i = 0; i < data.size(); ++i)
        {
            // Can we be smarter about this? (i.e., not read just one bit at a time)
            for(int j = BITS_PER_BYTE - 1; j >= 0; --j)
            {
                // Shift current bits
                tempChar <<= 1;
                // Read the next bit
                if(char_ptr[i] & (1 << j))
                {
                    // Bit was set, copy it over
                    tempChar |= 1;
                }
                if(0 == ++processedBits % NEEDED_BITS)
                {
                    // We have collected the next set of NEEDED_BITS, time to map and
                    // return a character
                    if(tempChar < MAP.size())
                    {
                        outputString += MAP[tempChar];
                    }
                    else
                    {
                        printf("[error] Packed Type Improper Character Encoding\n");
                        return "";
                    }
                    // Reset things in preparation for the next set of NEEDED_BITS
                    processedBits = 0;
                    tempChar = 0;
                }
            }
        }

        return outputString;
    }

}

