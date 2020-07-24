package (
    default_visibility = ["//ThirdParty/Juce:__subpackages__"],
)

licenses(["notice"])

load("//ThirdParty/Juce:juce.bzl", "juce_library")

cc_library (
  name = "AppConfig",
  defines = [
      "JUCE_PLUGINHOST_VST=1",
      "JUCE_PLUGINHOST_VST3=1",
      "JUCE_PLUGINHOST_AU=1",
      "JUCE_STANDALONE_APPLICATION=0",
      "JucePlugin_Build_VST=1",
      "JucePlugin_Build_VST3=1",
      "JucePlugin_Build_AU=1",
      "JucePlugin_Build_AUv3=0",
      "JucePlugin_Build_RTAS=0",
      "JucePlugin_Build_AAZ=0",
      "JucePlugin_Build_STANDALONE=0",
      # Note the different quotes. This avoids a compiler error on OSX where the string
      # is interpreted as an int.
      'JucePlugin_Name=\\"Juce\ Demo\ Plugin\\"',
      'JucePlugin_Desc=\\"Juce\ Demo\ Plugin\\"',
      'JucePlugin_Manufacturer=\\"ROLI\ Ltd.\\"',
      'JucePlugin_ManufacturerWebsite=\\"www.juce.com\\"',
      'JucePlugin_ManufacturerEmail=\\"info@juce.com\\"',
      "JucePlugin_ManufacturerCode=\\'ROLI\\'",
      "JucePlugin_PluginCode=\\'Jcdm\\'",
      "JucePlugin_IsSynth=0",
      "JucePlugin_WantsMidiInput=1",
      "JucePlugin_ProducesMidiOutput=1",
      "JucePlugin_IsMidiEffect=0",
      "JucePlugin_EditorRequiresKeyboardFocus=1",
      #"JucePlugin_Version=1.0.0",
      "JucePlugin_VersionCode=65536",
      'JucePlugin_VersionString=\\"1.0.0\\"',
      "JucePlugin_VSTUniqueID=JucePlugin_PluginCode",
      "JucePlugin_VSTCategory=kPlugCategEffect",
      "JucePlugin_AUMainType=\'aumf\'",
      "JucePlugin_AUSubType=JucePlugin_PluginCode",
      "JucePlugin_AUExportPrefix=JuceDemoPluginAU",
      "JucePlugin_AUExportPrefixQuoted=\\'JuceDemoPluginAU\\'",
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
    name = "JuceDemoPlugin.so",
    srcs = [
        # This first header gets ignored. Make sure :AppConfig above defines these flags.
        # This gets confugured through a flag. --project=juce_plugin_demo
        # See make_plugin_demo.
        ":JuceLibraryCode/AppConfig.h",
        ":JuceLibraryCode/JuceHeader.h",
    ] + glob(["Source/*"]),
    data = select({
        "@bazel_tools//src/conditions:darwin": [
            ":AudioUnitInfoPList",
            ":AudioUnitPluginCompiledResource",
            ":VSTInfoPList",
        ],
        "@bazel_tools//src/conditions:darwin_x86_64": [
            ":AudioUnitInfoPList",
            ":AudioUnitPluginCompiledResource",
            ":VSTInfoPList",
        ],
        "//conditions:default": [],
    }),
    deps = ["//ThirdParty/Juce:Juce"],
    linkshared = 1,
)

genrule(
    name = "VSTInfoPList",
    srcs = ["//PluginTools:FileTemplates/VSTInfoPList.txt"],
    outs = ["VST-Info.plist"],
    cmd = """sed -e 's/JucePlugin_AUMainType/aumf/g;s/JucePlugin_AUSubType/Jcdm/g;s/JucePlugin_AUManufacturerCode/ROLI/g;s/JucePlugin_VersionCode/65536/g;s/JucePlugin_Manufacturer/ROLI Ltd./g;s/JucePlugin_Name/JuceDemoPlugin/g;s/JucePlugin_Desc/JuceDemoPlugin/g;s/JucePlugin_AUExportPrefixQuoted/JuceDemoPluginAU/g;s/JucePlugin_CFBundleIdentifier/com.juce.JuceDemoPlugin/g;s/JucePlugin_Version/1.0.0/g;s/JucePlugin_PluginCode/Jcdm/g' < $< >$@""",
)

genrule(
    name = "AudioUnitInfoPList",
    srcs = ["//PluginTools:FileTemplates/AudioUnitInfoPList.txt"],
    outs = ["AudioUnit-Info.plist"],
    cmd = """sed -e 's/JucePlugin_AUMainType/aumf/g;s/JucePlugin_AUSubType/Jcdm/g;s/JucePlugin_AUManufacturerCode/ROLI/g;s/JucePlugin_VersionCode/65536/g;s/JucePlugin_Manufacturer/ROLI Ltd./g;s/JucePlugin_Name/JuceDemoPlugin/g;s/JucePlugin_Desc/JuceDemoPlugin/g;s/JucePlugin_AUExportPrefixQuoted/JuceDemoPluginAU/g;s/JucePlugin_CFBundleIdentifier/com.juce.JuceDemoPlugin/g;s/JucePlugin_Version/1.0.0/g;s/JucePlugin_PluginCode/Jcdm/g' < $< >$@""",
)

genrule(
    name = "AudioUnitPluginResources",
    srcs = ["//PluginTools:FileTemplates/AudioUnitResource.txt"],
    outs = ["Resources.r"],
    cmd = """sed -e 's/JucePlugin_AUMainType/'"'"'aumf'"'"'/g;s/JucePlugin_AUSubType/'"'"'Jcdm'"'"'/g;s/JucePlugin_AUManufacturerCode/'"'"'ROLI'"'"'/g;s/JucePlugin_VersionCode/65536/g;s/JucePlugin_Manufacturer/"ROLI Ltd."/g;s/JucePlugin_Name/"JuceDemoPlugin"/g;s/JucePlugin_Desc/"JuceDemoPlugin"/g;s/JucePlugin_AUExportPrefixQuoted/"JuceDemoPluginAU"/g;s/JucePlugin_CFBundleIdentifier/com.juce.JuceDemoPlugin/g;s/JucePlugin_Version/1.0.0/g;s/JucePlugin_PluginCode/'"'"'Jcdm'"'"'/g' < $< >$@""",
)

load("//PluginTools/OSX:rez.bzl", "generate_compiled_resource")
generate_compiled_resource(
    name = "AudioUnitPluginCompiledResource",
    srcs = [":Resources.r"],
    out = "CompiledResources.rsrc",
)
