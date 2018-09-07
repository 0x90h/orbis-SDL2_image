ifndef Ps4Sdk
ifdef ps4sdk
Ps4Sdk := $(ps4sdk)
endif
ifdef PS4SDK
Ps4Sdk := $(PS4SDK)
endif
ifndef Ps4Sdk
$(error Neither PS4SDK, Ps4Sdk nor ps4sdk set)
endif
endif


target := ps4_lib
OutPath := lib
TargetFile := libSDL2_image
AllTarget = $(OutPath)/$(TargetFile).a


include $(Ps4Sdk)/make/ps4sdk.mk

IncludePath += -I$(Ps4Sdk)/include/SDL2 -I$(Ps4Sdk)/include
CompilerFlags += -DVERSION=\"2.0.3\" -DLOAD_BMP=1 -DLOAD_GIF=1 -DLOAD_JPG=1 -DLOAD_LBM=1 -DLOAD_PCX=1 -DLOAD_PNG=1 -DLOAD_PNM=1 -DLOAD_SVG=1 -DLOAD_TGA=1 -DLOAD_TIF=1 -DLOAD_WIC=1 -DLOAD_XCF=1 -DLOAD_XPM=1 -DLOAD_XV=1 -DLOAD_xxx=1 

$(OutPath)/$(TargetFile).a: $(ObjectFiles)
	$(dirp)
	$(archive)

install:
	@cp $(OutPath)/$(TargetFile).a $(Ps4Sdk)/lib
	@mkdir -p $(Ps4Sdk)/include/SDL2
	@cp include/SDL_image.h $(Ps4Sdk)/include/SDL2
	@echo "Installed!"
