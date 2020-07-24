#include "SharedLibrary/FilePath.h"

#include <cassert>

#include "ThirdParty/Juce/Juce.h"

int main(void) {
  // Congratulations, unit tests are the spice of life.
  assert(GetCurrentWorkingDirectory().length() > 0);
}
