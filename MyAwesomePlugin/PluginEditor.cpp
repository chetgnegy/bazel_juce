/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "MyAwesomePlugin/PluginProcessor.h"
#include "MyAwesomePlugin/PluginEditor.h"

//==============================================================================
MyAwesomePluginAudioProcessorEditor::MyAwesomePluginAudioProcessorEditor (MyAwesomePluginAudioProcessor& p)
    : AudioProcessorEditor (&p), audioProcessor (p)
{
    // Make sure that before the constructor has finished, you've set the
    // editor's size to whatever you need it to be.
    setSize (400, 300);
}

MyAwesomePluginAudioProcessorEditor::~MyAwesomePluginAudioProcessorEditor()
{
}

//==============================================================================
void MyAwesomePluginAudioProcessorEditor::paint (juce::Graphics& g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll (getLookAndFeel().findColour (juce::ResizableWindow::backgroundColourId));

    g.setColour (juce::Colours::white);
    g.setFont (15.0f);
    g.drawFittedText ("Hello World!", getLocalBounds(), juce::Justification::centred, 1);
}

void MyAwesomePluginAudioProcessorEditor::resized()
{
    // This is generally where you'll want to lay out the positions of any
    // subcomponents in your editor..
}
