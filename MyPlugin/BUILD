# Or for a plugin:
cc_library(
    name = "Config",
    defines = [
        # Project Specific Macros.
        "JucePlugin_Build_VST=1",
        "JucePlugin_Build_VST3=1",
        "JucePlugin_Build_AU=1",
        "JucePlugin_Build_RTAS=0",
        "JucePlugin_Build_AAX=0",
        # Double escape to make quotes show up in the code.
        'JucePlugin_Name=\\"YourPlugin\\"',
        'JucePlugin_Desc=\\"YourPlugin\\"',
        'JucePlugin_Manufacturer=\\"YourStudio\\"',
        'JucePlugin_ManufacturerWebsite=\\"\\"',
        'JucePlugin_ManufacturerEmail=\\"\\"',
        "JucePlugin_ManufacturerCode=\\'Manu\\'",
        "JucePlugin_PluginCode=\\'Plug\\'",
        "JucePlugin_IsSynth=0",
        "JucePlugin_WantsMidiInput=0",
        "JucePlugin_ProducesMidiOutput=0",
        "JucePlugin_IsMidiEffect=0",
        "JucePlugin_EditorRequiresKeyboardFocus=0",
        "JucePlugin_Version=1.0.0",
        "JucePlugin_VersionCode=0x10000",
        'JucePlugin_VersionString=\\"1.0.0\\"',
        "JucePlugin_VSTUniqueID=\\'Plug\\'",
        "JucePlugin_VSTCategory=kPlugCategEffect",
        "JucePlugin_AUMainType=kAudioUnitType_MusicEffect",
        "JucePlugin_AUSubType=JucePlugin_PluginCode",
        'JucePlugin_AUExportPrefix=\\"YourPluginAU\\"',
        'JucePlugin_AUExportPrefixQuoted=\\"YourPluginAU\\"',
        "JucePlugin_AUManufacturerCode=JucePlugin_ManufacturerCode",
        "JucePlugin_CFBundleIdentifier=com.YourStudio.YourPlugin",
        "JucePlugin_RTASCategory=ePlugInCategory_None",
        "JucePlugin_RTASManufacturerCode=JucePlugin_ManufacturerCode",
        "JucePlugin_RTASProductId=JucePlugin_PluginCode",
        "JucePlugin_RTASDisableBypass=0",
        "JucePlugin_RTASDisableMultiMono=0",
        "JucePlugin_AAXIdentifier=com.YourStudio.Something",
        "JucePlugin_AAXManufacturerCode=JucePlugin_ManufacturerCode",
        "JucePlugin_AAXProductId=JucePlugin_PluginCode",
        "JucePlugin_AAXCategory=AAX_ePlugInCategory_Dynamics",
        "JucePlugin_AAXDisableBypass=0",
        "JucePlugin_AAXDisableMultiMono=0",
        "JucePlugin_MaxNumInputChannels=2",
        "JucePlugin_MaxNumOutputChannels=2",
        "JucePlugin_PreferredChannelConfigurations={2,2}",
        # Suppresses a warning in Juce.
        "JUCE_STANDALONE_APPLICATION=0",
        "JUCE_QUICKTIME=1",
    ],
)

cc_binary(
    name = "YourPlugin.so",
    srcs = [
        "PluginEditor.cpp",
        "PluginEditor.h",
        "PluginProcessor.cpp",
        "PluginProcessor.h",
    ],
    deps = [
        # Other Stuff.
        "//ThirdParty/Juce:Juce",
    ],
    linkshared = 1,
)