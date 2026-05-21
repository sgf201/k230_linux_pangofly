#!/usr/bin/make -f

# Default configuration
CONF ?= k230_canmv_defconfig

# Output directory
OUTPUT_DIR := $(CURDIR)/output/$(CONF)

.PHONY: all toolchain_and_depend help clean distclean

all:
	@echo "Building for $(CONF)..."
	@mkdir -p $(OUTPUT_DIR)
	@echo "Please use Docker compilation (recommended) or check the README"

toolchain_and_depend:
	@echo "Installing toolchain and dependencies..."
	@$(CURDIR)/tools/install_toolchain_and_depend.sh

help:
	@echo "K230 Linux SDK with Pangofly"
	@echo ""
	@echo "Usage:"
	@echo "  make CONF=<config> - Build using specified configuration"
	@echo ""
	@echo "Configurations:"
	@echo "  k230_canmv_defconfig"
	@echo "  k230d_canmv_defconfig"
	@echo "  k230d_canmv_ilp32_defconfig"
	@echo ""
	@echo "Recommended: Use Docker compilation"
	@echo "  curl -fsSL https://www.kendryte.com/misc/install.sh | bash"
	@echo "  k230 make CONF=k230_canmv_defconfig"

clean:
	@rm -rf $(OUTPUT_DIR)

distclean: clean
	@rm -rf output
