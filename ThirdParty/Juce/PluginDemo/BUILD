package (
    default_visibility = ["//ThirdParty/Juce:__subpackages__"],
)

licenses(["notice"])

load("//ThirdParty/Juce:juce.bzl", "juce_library")

cc_library (
  name = "AppConfig",
  defines = [
      "JUCE_PLUGINHOST_VST=1",
      "JUCE_PLUGINHOST_AU=1",
      "JUCE_STANDALONE_APPLICATION=0",
      "JucePlugin_Build_VST=1",
      "JucePlugin_Build_VST3=1",
      "JucePlugin_Build_AU=1",
      "JucePlugin_Build_AUv3=0",
      "JucePlugin_Build_RTAS=0",
      "JucePlugin_Build_AAZ=0",
      "JucePlugin_Build_STANDALONE=0",
      "JucePlugin_Name=\\'Juce\ Demo\ Plugin\\'",
      "JucePlugin_Desc=\\'Juce\ Demo\ Plugin\\'",
      "JucePlugin_Manufacturer=\\'ROLI\ Ltd.\\'",
      "JucePlugin_ManufacturerWebsite=\\'www.juce.com\\'",
      "JucePlugin_ManufacturerEmail=\\'info@juce.com\\'",
      "JucePlugin_ManufacturerCode=0x524f4c49",
      "JucePlugin_PluginCode=0x4a63646d",
      "JucePlugin_IsSynth=0",
      "JucePlugin_WantsMidiInput=1",
      "JucePlugin_ProducesMidiOutput=1",
      "JucePlugin_IsMidiEffect=0",
      "JucePlugin_EditorRequiresKeyboardFocus=1",
      #"JucePlugin_Version=1.0.0",
      "JucePlugin_VersionCode=0x10000",
      "JucePlugin_VersionString=\\'1.0.0\\'",
      "JucePlugin_VSTUniqueID=JucePlugin_PluginCode",
      "JucePlugin_VSTCategory=kPlugCategEffect",
      "JucePlugin_AUMainType=kAudioUnitType_MusicEffect",
      "JucePlugin_AUSubType=JucePlugin_PluginCode",
      "JucePlugin_AUExportPrefix=JuceDemoProjectAU",
      "JucePlugin_AUExportPrefixQuoted=\\'JuceDemoProjectAU\\'",
      "JucePlugin_AUManufacturerCode=JucePlugin_ManufacturerCode",
      "JucePlugin_CFBundleIdentifier=com.juce.JuceDemoPlugin",
      "JucePlugin_RTASCategory=ePlugInCategory_None",
      "JucePlugin_RTASManufacturerCode=JucePlugin_ManufacturerCode",
      "JucePlugin_RTASProductId=JucePlugin_PluginCode",
      "JucePlugin_RTASDisableBypass=0",
      "JucePlugin_RTASDisableMultiMono=0",
      "JucePlugin_AAXIdentifier=com.yourcompany.JuceDemoPlugin",
      "JucePlugin_AAXManufacturerCode=JucePlugin_ManufacturerCode",
      "JucePlugin_AAXProductId=JucePlugin_PluginCode",
      "JucePlugin_AAXCategory=AAX_ePlugInCategory_Dynamics",
      "JucePlugin_AAXDisableBypass=0",
      "JucePlugin_AAXDisableMultiMono=0",
  ]
)

cc_binary (
    name = "JucePluginDemo.so",
    srcs = [
        # This first header gets ignored. Make sure :AppConfig above defines these flags.
        ":JuceLibraryCode/AppConfig.h",
        ":JuceLibraryCode/JuceHeader.h",
    ] + glob(["Source/*"]),
    deps = ["//ThirdParty/Juce:JuceForPluginDemo"],
    linkshared = 1,
)
