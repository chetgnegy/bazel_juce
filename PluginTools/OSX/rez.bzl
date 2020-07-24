# The purpose of this genrule is to generate the compiled resources. It is designed to replace this
# a series of complicated commands that Juce's XCode projects use for an audio plugin. This was not 
# designed to be generally useful beyond this application.

def generate_compiled_resource(name,
                               srcs,
                               out,
                               visibility = ["//visibility:public"], 
                               **genrule_kwargs):
  developer_dir = "/Applications/Xcode.app/Contents/Developer"
  # This is the tool that is used for resource compilation.
  rez_tool = developer_dir + "/usr/bin/Rez"
  
  au_defs = developer_dir + "/Extras/CoreAudio/AudioUnits/AUPublic/AUBase"
  carbon_defs = "/System/Library/Frameworks/CoreServices.framework/Frameworks/CarbonCore.framework/Versions/A/Headers"

  sdk = developer_dir + "/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk"

  extra_args = [
      "-d SystemSevenOrLater=1",
      "-useDF",
      "-script Roman",
      "-d x86_64_YES",
      "-arch x86_64",
  ]
  
  # *****************************************************
  # *                 COMPILE RESOURCES                 *
  # *****************************************************
  stage_one_out = "stage_one_" + out

  compile_components = [
      rez_tool,
      "-o $(location " + stage_one_out + ")",
      " ".join(extra_args),
      " ".join(["-I " + x for x in [au_defs, carbon_defs]]),
      "-isysroot " + sdk,
      # Not sure if more than one is tolerated.
      " ".join([("$(location " + x + ")") for x in srcs]),
  ]
  
  native.genrule(
      name = "_compile_" + name,
      srcs = srcs,
      message = "Executing resource_library genrule",
      outs = [stage_one_out],
      cmd = " ".join(compile_components),
      **genrule_kwargs
  )
# *****************************************************
# *                 COLLECT RESOURCES                 *
# *****************************************************
  stage_two_out = "stage_two_" + out
  
  res_merger_tool = developer_dir + "/usr/bin/ResMerger" 
  dst_flag = "-dstIs DF"

  collector_components = [
      res_merger_tool,
      dst_flag,
      "$(location " + stage_one_out + ")",
      "-o $(location " + stage_two_out + ")",
  ]
  native.genrule(
      name = "_collect_" + name,
      srcs = [":" + stage_one_out],
      outs = [stage_two_out],
      cmd = " ".join(collector_components),
      **genrule_kwargs
  )
# *****************************************************
# *                 PRODUCT RESOURCES                 *
# *****************************************************
  
  product_components = [
      res_merger_tool,
      "$(location " + stage_two_out + ")",   # srcs before flags.
      dst_flag,
      "-o $(location " + out + ")",
  ]
  
  native.genrule(
      name = name,
      srcs = [stage_two_out],
      outs = [out],
      cmd = " ".join(product_components),
      **genrule_kwargs
  )