// FilePath.h
// chetgnegy@gmail.com
//
// An example file that uses JUCE.

#ifndef __SHAREDLIBRARY_FILEPATH_H__
#define __SHAREDLIBRARY_FILEPATH_H__

#include "ThirdParty/Juce/Juce.h"

inline std::string GetCurrentWorkingDirectory() {
  return juce::File::getCurrentWorkingDirectory().getFullPathName().toStdString();
}

#endif  // __SHAREDLIBRARY_FILEPATH_H__
