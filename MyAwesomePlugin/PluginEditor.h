/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#pragma once

#include "ThirdParty/Juce/Juce.h"
#include "MyAwesomePlugin/PluginProcessor.h"

//==============================================================================
/**
*/
class MyAwesomePluginAudioProcessorEditor  : public juce::AudioProcessorEditor
{
public:
    MyAwesomePluginAudioProcessorEditor (MyAwesomePluginAudioProcessor&);
    ~MyAwesomePluginAudioProcessorEditor() override;

    //==============================================================================
    void paint (juce::Graphics&) override;
    void resized() override;

private:
    // This reference is provided as a quick way for your editor to
    // access the processor object that created it.
    MyAwesomePluginAudioProcessor& audioProcessor;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (MyAwesomePluginAudioProcessorEditor)
};
