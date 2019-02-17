// OpenGL.h
// chetgnegy@gmail.com
//
// Include statements for OpenGL.

#define GL_DO_NOT_WARN_IF_MULTI_GL_VERSION_HEADERS_INCLUDED
#if defined (MAC_OS_X_VERSION_10_7) && (MAC_OS_X_VERSION_MIN_REQUIRED >= MAC_OS_X_VERSION_10_7)
  #define JUCE_OPENGL3 1
  #include <OpenGL/gl3.h>
  #include <OpenGL/gl3ext.h>
#else
  // TODO: Find a better solution than defining this flag. Forums suggest that using GLEW is 
  // a better way around this and that this is problematic when distributing binaries.
  #define GL_GLEXT_PROTOTYPES
  #include <GL/gl.h>
  #include <GL/glext.h>
#endif