Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BB43D47B8
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 15:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773935984; cv=none; b=RSowa2oQwY36YGXWtrDpRGbu8dwSuUvF2SdqQ78dSefn1tprwW1YbvhSkq/GWG+s5rocMfrq5eTBURhRvHXz3fiqWnzskZ0RtkupQ7JZLu94uIuo53tCX+WNsHG6+3vE1xe1npDDEls/hLOfxRyUmAkPTp5IPzkeF1Z9NHaIiz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773935984; c=relaxed/simple;
	bh=QeYjFHh74N8QW1xaxJzf8DaAhZB41Zs5BSHaVjPTbBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uQrA/0VgbRfSY9yn6O6cFMav5xdDE/HhV3crzNFQ8vxZ6KMd/F5uP3kuu05hL0tgmxCFfhZim2tNqgtDx5+izv4uuL3fJ2rCrlcj2thzfxTQs3wuUm6ndl39SLFr+7Ta7lyceDbH4N/mvN90Ai1VojQEXhRKZXHxYHSfKO9dong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZ4JWTVE; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ4JWTVE"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so2155883eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 08:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773935981; x=1774540781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=gteT3ijTuMRU0z5DVBKWVN9RSoBsF4puTZ+GjKhiQEY=;
        b=fZ4JWTVEFgjKmC1prgbbYgAriUYJ5NVnb5Qt4lXGjdkaRxrCD6KcS7AwpO1+YMDjri
         QptLv3ZX3y5YyUqbuST2BH93HLPhLJGofC4ZLnvyTwSSFwWVW9RbneZVc3eqAdW5X0Vg
         7E60cpvMDDSgy6soW/Gye1dYlwgDkH+2GZCmbeeXxNyfnu23cmuNoPSG9SMvqxndz1Wm
         ZPcbo0Tgw/Sz84pxPDzQ6Ecg4UwNAWJjXUxzYd9/eOkhNYzfg8Ya8aoiWRndrpWYPHO8
         7a1qLePLjBXFf+V2oNoivcuL82OMOzPtAopwM6YL0lU7/vlaqnBCJsrwsJolYA0XEBdY
         f9Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773935981; x=1774540781;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gteT3ijTuMRU0z5DVBKWVN9RSoBsF4puTZ+GjKhiQEY=;
        b=cn7WJM6XLrG/y0Gedo5zsrg39R2h1fd0bKYHjK6huG+Zz87UPb/U7l1Mf61RmBEl7z
         hILilGKuVeQ+WgmnEFevo5/2LgpaW3nrADza1aZ98L85uj54NuC3/g9h3Xo1v/LgHnRp
         c2x8AzSn7tQsETUtv34taHoXwSyvapMwIZwVeD+RnZZIG4BGyyN055YR62y5pkYPY0TD
         eMDzATQE4ZuwthrR5kb/SpRWLah1uSvj/atMd9AQ7PAnXSqujqkSYDM5W6kMaodXtyR4
         l7+jt6KSH8hS/Htm0M0R7MkfMv7MWbp7618IcFDVnf/hXnrzCj+wS/3gI75+sQaTbvgC
         FGeg==
X-Forwarded-Encrypted: i=1; AJvYcCUBvzCmcHvbj0libxUU34en+wG0dyym6A/KdFE7DA7BQs7XK/AQLE1EaqKBuDdLJHh1kyOsotsJQ5mvdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5UFyJlydmr0TtTrD/xuBVpT0VuY2tmvEiD9PCttIBkw/8uAsQ
	z2isiCGdpkfxwYhdUV7yI5iZxhw02dNkHsQn0lddRk2Szm74f9qq5obyuagBVQ==
X-Gm-Gg: ATEYQzzZj0OT9fcqW0YE1/YDgaXkZxNDJF9jzsBgPRGRnjJ8T6tW2YUqc9URCXYc8MV
	/1jxCqqMLRMx8d+evQ4dQoy6MzLUIFBNWGQtx0tfyxElm47ZlnnF5YM0imVlCwj54Tv8OArr6jn
	W9bB53KpyN0aFjcIPg2Tre1dVmmBhqz9GRDu0D1aCo2WF0z3Suta5Is/Honlb26pYmAR/llDiPa
	2rsz1FDTJg+e+DfV9i0ogatalTtSr0Z7WVAD1PjwHswQzGGrAq+HgNx814AcDvsBvn1gGUZcu94
	HNL6cMtYjjb5OepiOON2PreWDMbsuazCaL/SBfDB1iHyD8p/UMS8psWK2xwNuuAb7x44rAmegCp
	Y39dNx+n7KJNUJHuQLYvgfeJh2kdGtnMDV8oJY5vQqbC7YMyvpOuOBZTqTBQP+iM982V3NJEZrx
	21R+ws+YkxQzg2ITdgQ6zZeNncrNk6ql56ily/8GyaJC0UZzwvfAvFMBs57fSiGM3uOeVSCZTL
X-Received: by 2002:a05:7301:168f:b0:2c0:d92c:2c68 with SMTP id 5a478bee46e88-2c0e505e8f4mr3630357eec.31.1773935980453;
        Thu, 19 Mar 2026 08:59:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e559ff3fsm8578428eec.21.2026.03.19.08.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 08:59:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <221ba4ba-73ac-44b7-8663-60889ebe8e9e@roeck-us.net>
Date: Thu, 19 Mar 2026 08:59:38 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hwmon: (yogafan) Add universal Lenovo Yoga/Legion fan
 driver
To: Sergio Melas <sergiomelas@gmail.com>, linux-hwmon@vger.kernel.org,
 groeck@gmail.com
Cc: platform-driver-x86@vger.kernel.org, jdelvare@suse.com
References: <20260319132920.275755-1-sergiomelas@gmail.com>
 <20260319132920.275755-2-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260319132920.275755-2-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/19/26 06:29, Sergio Melas wrote:
> - Support universal ACPI fan monitoring for up to 8 fans.
> - Support various ACPI path naming conventions (FANS, FA2S, FANX).
> - Implement a passive RLLag (Rate Limited Lag) filter for jumpy EC data.
> - Use dt-based scaling for physical consistency across read intervals.
> - Filter parameters verified via tachometer and FOPTD identification.
> - Use 10-bit fixed-point integer math to avoid floating-point registers.
> - Support KDE 6 Plasma Sensor compatibility and stable S3 sleep cycles.
> 

Thanks for your patch. Unfortunately, that is just as wrong as before.
Most of what should be here is in your patch 0/1 which 1) does not have
a subject and 2) is unnecessary for single patches.

> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
> ---
>   Documentation/hwmon/yoga_fan.rst    |  36 +++++

Add to index.rst

>   auto_compile_rust_lenovo_drivers.sh | 196 -----------------------

???? This doesn't look like the patch originates from an upstream
repository/branch.

I didn't look into the actual code. AI code review will be available at

https://sashiko.dev/#/patchset/20260319132920.275755-2-sergiomelas%40gmail.com

once completed.

Thanks,
Guenter

>   drivers/hwmon/Kconfig               |  14 ++
>   drivers/hwmon/Makefile              |   1 +
>   drivers/hwmon/yoga_fan.c            | 237 ++++++++++++++++++++++++++++
>   5 files changed, 288 insertions(+), 196 deletions(-)
>   create mode 100644 Documentation/hwmon/yoga_fan.rst
>   delete mode 100755 auto_compile_rust_lenovo_drivers.sh
>   create mode 100644 drivers/hwmon/yoga_fan.c
> 
> diff --git a/Documentation/hwmon/yoga_fan.rst b/Documentation/hwmon/yoga_fan.rst
> new file mode 100644
> index 000000000..37eec7647
> --- /dev/null
> +++ b/Documentation/hwmon/yoga_fan.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +Kernel driver yogafan
> +=====================
> +
> +Supported chips:
> +  * Lenovo Yoga / Legion / IdeaPad Embedded Controllers
> +    Prefix: 'yogafan'
> +    Addresses: ACPI (Dynamic probing of FANS, FA2S, FANX, etc.)
> +
> +Description
> +-----------
> +
> +This driver provides fan speed monitoring for modern Lenovo laptops.
> +It interfaces with the Lenovo Embedded Controller (EC) via ACPI to
> +retrieve fan tachometer data.
> +
> +Many Lenovo ECs report RPM values that oscillate rapidly due to
> +low-resolution internal sampling. To provide a stable reading in
> +userspace (e.g., KDE Plasma, MangoHud), this driver implements a
> +"Passive RLLag" (Rate Limited Lag) filter.
> +
> +Filter Logic:
> +The filter is "passive," meaning it performs no background work.
> +It calculates the state transition based on the ktime delta (dt)
> +between read requests. This ensures physical model consistency
> +while maximizing CPU sleep states and battery life.
> +
> +Probing:
> +The driver dynamically searches for common Lenovo ACPI fan handles.
> +It does not assume a fixed number of fans, making it compatible
> +across various Yoga and Legion generations.
> +
> +Usage Note:
> +If your device shows more fans than physically present, the EC is likely
> +exposing a virtual or secondary hardware channel.
> diff --git a/auto_compile_rust_lenovo_drivers.sh b/auto_compile_rust_lenovo_drivers.sh
> deleted file mode 100755
> index a3df04f65..000000000
> --- a/auto_compile_rust_lenovo_drivers.sh
> +++ /dev/null
> @@ -1,196 +0,0 @@
> -#!/bin/bash
> -# auto_compile_rust_lenovo_drivers.sh
> -
> -##################################################################"
> -#                                                                #"
> -#                     Kernel Compile Script                      #"
> -#             Developed by Sergio Melas 2021-26                  #"
> -#                                                                #"
> -#                  Email: sergiomelas@gmail.com                  #"
> -#                      Released under GPL V2.0                   #"
> -#                                                                #"
> -##################################################################"
> -
> -
> -
> -# Fix for dpkg-source email warning
> -export DEBFULLNAME="Sergio Melas"
> -export DEBEMAIL="sergiomelas@gmail.com"
> -
> -
> -# Your kernel personalization string
> -postfix="yoga"
> -
> -# ANSI Color Codes
> -CYAN='\033[0;36m'
> -GOLD='\033[1;33m'
> -GREEN='\033[0;32m'
> -BLUE='\033[1;34m'
> -NC='\033[0m'
> -
> -echo -e "${GOLD} "
> -echo -e " ##################################################################"
> -echo -e " #                                                                #"
> -echo -e " # ${CYAN}                    Kernel Compile Script                ${GOLD}      #"
> -echo -e " # ${CYAN}            Developed by Sergio Melas 2021-26            ${GOLD}      #"
> -echo -e " #                                                                #"
> -echo -e " # ${BLUE}                 Email: ${GREEN}sergiomelas@gmail.com ${GOLD}                 #"
> -echo -e " # ${BLUE}                     Released under GPL V2.0             ${GOLD}      #"
> -echo -e " #                                                                #"
> -echo -e " ##################################################################"
> -echo -e " ${NC}"
> -
> -
> -
> -# 1. Change to local directory
> -VAR=$0
> -DIR="$(dirname "${VAR}")"
> -cd  "${DIR}"
> -
> -# 2. Automated Architecture Detection
> -ARCH_TYPE=$(uname -m)
> -case "$ARCH_TYPE" in
> -    x86_64)    ARCH_SUFFIX="amd64" ;;
> -    aarch64)   ARCH_SUFFIX="arm64" ;;
> -    armv7l)    ARCH_SUFFIX="armhf" ;;
> -    i386|i686) ARCH_SUFFIX="i386" ;;
> -    *)         ARCH_SUFFIX="$ARCH_TYPE" ;;
> -esac
> -
> -# 3. Combine for the final string
> -full_postfix="${postfix}-${ARCH_SUFFIX}"
> -
> -
> -# Admin login
> -sudo ls >/dev/null
> -
> -# Install libs
> -sudo apt-get install -y build-essential libncurses-dev bison flex libssl-dev libelf-dev dwarves debhelper rustc rust-src bindgen rustfmt rust-clippy clang libdw-dev:native bc
> -
> -# Configure kernel base
> -LATEST_CONFIG=$(ls -v /boot/config-* 2>/dev/null | grep -v "$postfix" | tail -n 1)
> -if [ -n "$LATEST_CONFIG" ]; then
> -    cp -v "$LATEST_CONFIG" .config
> -else
> -    cp -v /boot/config-$(uname -r) .config
> -fi
> -
> -# --- DRIVER INJECTION (Yoga Fan v4.3) ---
> -echo -e "${BLUE}Injecting Yoga Fan Driver v4.3...${NC}"
> -SOURCE_CODE="../../Lenovo Drivers/yoga_fan.c"
> -TARGET_FILE="./drivers/hwmon/yoga_fan.c"
> -
> -if [ -f "$SOURCE_CODE" ]; then
> -    cp "$SOURCE_CODE" "$TARGET_FILE"
> -else
> -    echo -e "${GOLD}Error: Source not found!${NC}"
> -    exit 1
> -fi
> -
> -if ! grep -q "yoga_fan.o" ./drivers/hwmon/Makefile; then
> -    echo "obj-\$(CONFIG_SENSORS_YOGA_FAN) += yoga_fan.o" >> ./drivers/hwmon/Makefile
> -fi
> -
> -if ! grep -q "config SENSORS_YOGA_FAN" ./drivers/hwmon/Kconfig; then
> -    cat <<EOF >> ./drivers/hwmon/Kconfig
> -config SENSORS_YOGA_FAN
> -	tristate "Lenovo Yoga Fan Hardware Monitoring"
> -	depends on ACPI && HWMON
> -	help
> -	  Support for fan RPM on modern Lenovo laptops.
> -EOF
> -fi
> -
> -# --- START OF OPTIMIZED MODULE CONFIGURATION (YOGA 14c ACN) ---
> -
> -# 1. AMD Zen 3 & Power (For Ryzen 5800U)
> -scripts/config --set-val CONFIG_MZEN3 y                               # Zen 3 microarchitecture optimization
> -scripts/config --enable  CONFIG_X86_AMD_PSTATE                        # Modern AMD P-State driver
> -scripts/config --set-val CONFIG_X86_AMD_PSTATE_DEFAULT_MODE 3         # "Active" mode for performance/watt balance
> -scripts/config --enable  CONFIG_AMD_PMC                               # Vital for s2idle (Modern Standby) sleep support
> -scripts/config --enable  CONFIG_SENSORS_K10TEMP                       # Accurate CPU temperature monitoring
> -scripts/config --enable  CONFIG_PINCTRL_AMD                           # Crucial for Touchpad/GPIO interrupts
> -
> -# 2. Graphics (AMD Radeon Vega/Cezanne)
> -scripts/config --enable CONFIG_DRM_AMDGPU                             # Main Radeon driver
> -scripts/config --enable CONFIG_DRM_AMDGPU_USERPTR                     # Support for OpenCL/ROCm
> -scripts/config --enable CONFIG_DRM_DISPLAY_HDMI_HELPER                # Essential for HDMI/HDR
> -scripts/config --enable CONFIG_DRM_DISPLAY_DP_HELPER                  # Essential for DisplayPort/USB-C Alt Mode
> -
> -# 3. Lenovo Yoga 14c Hardware Logic (The Fan & Sensor Fix)
> -scripts/config --set-val CONFIG_HWMON y                               # REQUIRED: Base framework for all sensors
> -scripts/config --set-val CONFIG_ACPI_WMI y                            # REQUIRED: Bridge for Lenovo BIOS
> -scripts/config --enable  CONFIG_WMI_BMOF                              # REQUIRED: Interpret ACPI binary data
> -scripts/config --set-val CONFIG_SENSORS_YOGA_FAN m                    # Compiles Yoga Fan driver as module
> -scripts/config --enable  CONFIG_LEDS_CLASS                            # Needed for status LEDs
> -scripts/config --enable  CONFIG_LEDS_TRIGGERS                         # Allows hardware events to trigger LEDs
> -scripts/config --set-val CONFIG_IDEAPAD_LAPTOP y                      # Main driver for Yoga Fn keys
> -scripts/config --enable  CONFIG_LENOVO_YMC                            # Yoga Mode Control (Tablet mode)
> -scripts/config --enable  CONFIG_ACPI_PLATFORM_PROFILE                 # Enables Fn+Q power modes
> -scripts/config --enable  CONFIG_AMD_SFH_HID                           # Needed for screen auto-rotation
> -scripts/config --enable  CONFIG_HID_WACOM                             # Supports the internal stylus
> -scripts/config --enable  CONFIG_HID_MULTITOUCH                        # Enables 10-point touch screen
> -
> -# 4. Enable Rust (2026 Toolchain)
> -scripts/config --set-val CONFIG_RUST y                                # Enables Rust infrastructure
> -scripts/config --set-val MODVERSIONS n                                # Required for Rust compatibility
> -scripts/config --set-val GENDWARFKSYMS y                              # Safe Rust module loading
> -scripts/config --set-val RANDSTRUCT n                                 # Prevents C-to-Rust memory mismatches
> -scripts/config --set-val DEBUG_INFO_BTF n                             # Prevents Rust symbol length conflicts
> -
> -# 5. Rust-Powered "Blue Screen" (DRM Panic)
> -scripts/config --enable CONFIG_DRM_PANIC                              # Graphical panic core
> -scripts/config --enable CONFIG_DRM_PANIC_SCREEN_USER                  # Blue background
> -scripts/config --enable CONFIG_DRM_PANIC_SCREEN_QR_CODE               # Rust-generated scannable QR code
> -
> -# 6. Build Tweaks & Strict Debug Stripping
> -scripts/config --set-str CONFIG_LOCALVERSION "-$full_postfix"         # Identifies as -yoga-amd64
> -scripts/config --set-val CONFIG_LOCALVERSION_AUTO n                   # Cleaner versioning
> -scripts/config --undefine CONFIG_DEBUG_INFO                           # Strip primary debug symbols
> -scripts/config --undefine CONFIG_DEBUG_INFO_BTF                       # Disable BPF Type Format bloat
> -scripts/config --set-val CONFIG_DEBUG_INFO_NONE y                     # Explicitly select 'None'
> -scripts/config --disable CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT    # Kills bloated symbols
> -scripts/config --disable CONFIG_DEBUG_INFO_DWARF4                     # Disables old DWARF v4
> -scripts/config --disable CONFIG_DEBUG_INFO_DWARF5                     # Disables heavy DWARF v5
> -scripts/config --disable CONFIG_GDB_SCRIPTS                           # No Python helpers
> -
> -# --- END OF OPTIMIZED MODULE CONFIGURATION ---
> -
> -make olddefconfig
> -
> -# Get kernel version (e.g., 7.0.0-rc4)
> -VERSION_BASE=$(make kernelversion)
> -FULL_VER="${VERSION_BASE}-${full_postfix}"
> -PKG_VER="${VERSION_BASE}-${full_postfix}"
> -
> -echo -e "${BLUE}Starting Kernel Build (uname -r: ${FULL_VER})${NC}"
> -
> -# Compile using your naming logic
> -make -j$(nproc) bindeb-pkg \
> -    KDEB_PKGVERSION="${PKG_VER}" \
> -    KDEB_SOURCENAME=linux-upstream \
> -    DEBUG_INFO=n \
> -    NO_VMLINUX_DEBUG=1
> -
> -# Change to parent directory
> -cd ../
> -
> -echo -e "${BLUE}Post-Processing: Cleaning up filenames...${NC}"
> -
> -# Perform the exact renaming to remove the redundant version_arch string
> -# e.g., linux-image-VER_VER_amd64.deb -> linux-image-VER.deb
> -mv "linux-image-${FULL_VER}_${PKG_VER}_${ARCH_SUFFIX}.deb" "linux-image-${FULL_VER}.deb"
> -mv "linux-headers-${FULL_VER}_${PKG_VER}_${ARCH_SUFFIX}.deb" "linux-headers-${FULL_VER}.deb"
> -mv "linux-libc-dev_${PKG_VER}_${ARCH_SUFFIX}.deb" "linux-libc-dev_${FULL_VER}.deb"
> -
> -# Clean up
> -rm -f *.buildinfo *.changes
> -
> -# Install the cleaned packages
> -sudo apt-mark unhold linux-libc-dev
> -sudo dpkg -i "linux-image-${FULL_VER}.deb" \
> -             "linux-headers-${FULL_VER}.deb" \
> -             "linux-libc-dev_${FULL_VER}.deb"
> -sudo apt-mark hold linux-libc-dev
> -
> -echo -e "${CYAN}Success! kernel ${FULL_VER} installed.${NC}"
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 342aa97bf..7d938308d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2454,6 +2454,20 @@ config SENSORS_VEXPRESS
>   	  the ARM Ltd's Versatile Express platform. It can provide wide
>   	  range of information like temperature, power, energy.
>   
> +config SENSORS_YOGAFAN
> +	tristate "Lenovo Yoga/Legion Fan Monitor"
> +	depends on ACPI && DMI
> +	help
> +	  If you say yes here you get support for the fan sensors on
> +	  modern Lenovo Yoga, Legion, and IdeaPad laptops.
> +
> +	  This driver implements a passive RLLag filter to smooth out
> +	  oscillating RPM data reported by the Embedded Controller without
> +	  the power overhead of a background worker.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called yoga_fan.
> +
>   config SENSORS_VIA_CPUTEMP
>   	tristate "VIA CPU temperature sensor"
>   	depends on X86
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 7ac7711f9..d8d4ff834 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -252,3 +252,4 @@ obj-$(CONFIG_PMBUS)		+= pmbus/
>   
>   ccflags-$(CONFIG_HWMON_DEBUG_CHIP) := -DDEBUG
>   obj-$(CONFIG_SENSORS_YOGA_FAN) += yoga_fan.o
> +
> diff --git a/drivers/hwmon/yoga_fan.c b/drivers/hwmon/yoga_fan.c
> new file mode 100644
> index 000000000..31e657146
> --- /dev/null
> +++ b/drivers/hwmon/yoga_fan.c
> @@ -0,0 +1,237 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/**
> + * yoga_fan.c - Lenovo Yoga/Legion Fan Hardware Monitoring Driver
> + *
> + * Provides fan speed monitoring for Lenovo Yoga, Legion, and IdeaPad
> + * laptops by interfacing with the Embedded Controller (EC) via ACPI.
> + *
> + * The driver implements a passive discrete-time first-order lag filter
> + * with slew-rate limiting (RLLag). This filter addresses low-resolution
> + * tachometer sampling in the EC by smoothing RPM readings based on
> + * the time delta (dt) between userspace requests, ensuring physical
> + * consistency without background task overhead.
> + *
> + * Copyright (C) 2021-2026 Sergio Melas <sergiomelas@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/ktime.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#define DRVNAME "yogafan"
> +#define MAX_FANS 8
> +
> +/* Filter Configuration Constants */
> +#define TAU_MS          3000    /* Time constant for the first-order lag (ms) */
> +#define MAX_SLEW_RPM_S  100     /* Maximum allowed change in RPM per second */
> +
> +struct yoga_fan_data {
> +	const char *active_paths[MAX_FANS];
> +	long filtered_val[MAX_FANS];
> +	ktime_t last_update[MAX_FANS];
> +	int fan_count;
> +};
> +
> +/**
> + * apply_rllag_filter - Discrete-time filter update (Passive)
> + * @data: pointer to driver data
> + * @idx: fan index
> + * @raw_rpm: new raw value from ACPI
> + */
> +static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
> +{
> +	ktime_t now = ktime_get();
> +	s64 dt_ms;
> +	long delta, step, limit, alpha;
> +
> +	if (data->last_update[idx] == 0) {
> +		data->filtered_val[idx] = raw_rpm;
> +		data->last_update[idx] = now;
> +		return;
> +	}
> +
> +	dt_ms = ktime_to_ms(ktime_sub(now, data->last_update[idx]));
> +
> +	if (dt_ms > 5000) {
> +		data->filtered_val[idx] = raw_rpm;
> +		data->last_update[idx] = now;
> +		return;
> +	}
> +
> +	if (dt_ms < 1)
> +		return;
> +
> +	delta = raw_rpm - data->filtered_val[idx];
> +
> +	/* Alpha = dt / (Tau + dt) using 10-bit fixed point math */
> +	alpha = (dt_ms << 10) / (TAU_MS + dt_ms);
> +	step = (delta * alpha) >> 10;
> +
> +	/* Slew Limit = (MaxSlew * dt) / 1000 */
> +	limit = (MAX_SLEW_RPM_S * (long)dt_ms) / 1000;
> +
> +	if (step > limit)
> +		step = limit;
> +	else if (step < -limit)
> +		step = -limit;
> +
> +	data->filtered_val[idx] += step;
> +
> +	if (data->filtered_val[idx] < 50)
> +		data->filtered_val[idx] = 0;
> +
> +	data->last_update[idx] = now;
> +}
> +
> +static int yoga_fan_read(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct yoga_fan_data *data = dev_get_drvdata(dev);
> +	unsigned long long raw_acpi;
> +	acpi_status status;
> +	long rpm;
> +
> +	if (type != hwmon_fan || attr != hwmon_fan_input)
> +		return -EOPNOTSUPP;
> +
> +	status = acpi_evaluate_integer(NULL, (char *)data->active_paths[channel], NULL, &raw_acpi);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	rpm = (raw_acpi > 0 && raw_acpi <= 255) ? ((long)raw_acpi * 100) : (long)raw_acpi;
> +
> +	apply_rllag_filter(data, channel, rpm);
> +
> +	*val = data->filtered_val[channel];
> +	return 0;
> +}
> +
> +static umode_t yoga_fan_is_visible(const void *data, enum hwmon_sensor_types type,
> +				   u32 attr, int channel)
> +{
> +	const struct yoga_fan_data *fan_data = data;
> +
> +	if (type == hwmon_fan && channel < fan_data->fan_count)
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops yoga_fan_hwmon_ops = {
> +	.is_visible = yoga_fan_is_visible,
> +	.read = yoga_fan_read,
> +};
> +
> +static const struct hwmon_channel_info *yoga_fan_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT,
> +			   HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info yoga_fan_chip_info = {
> +	.ops = &yoga_fan_hwmon_ops,
> +	.info = yoga_fan_info,
> +};
> +
> +static int yoga_fan_probe(struct platform_device *pdev)
> +{
> +	struct yoga_fan_data *data;
> +	struct device *hwmon_dev;
> +	acpi_handle handle;
> +	int i;
> +
> +	static const char * const fan_paths[] = {
> +		"\\_SB.PCI0.LPC0.EC0.FANS",  // Primary Fan (Yoga 14c)
> +		"\\_SB.PCI0.LPC0.EC0.FA2S",  // Secondary Fan (Legion)
> +		"\\_SB.PCI0.LPC0.EC0.FAN0",  // IdeaPad / Slim
> +		"\\_SB.PCI0.LPC.EC.FAN0",    // Legacy
> +		"\\_SB.PCI0.LPC0.EC.FAN0",   // Alternate
> +	};
> +
> +	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->fan_count = 0;
> +
> +	for (i = 0; i < ARRAY_SIZE(fan_paths); i++) {
> +		if (ACPI_SUCCESS(acpi_get_handle(NULL, (char *)fan_paths[i], &handle))) {
> +			data->active_paths[data->fan_count] = fan_paths[i];
> +			data->fan_count++;
> +
> +			if (data->fan_count >= MAX_FANS)
> +				break;
> +		}
> +	}
> +
> +	if (data->fan_count == 0)
> +		return -ENODEV;
> +
> +	dev_set_drvdata(&pdev->dev, data);
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, DRVNAME,
> +							 data, &yoga_fan_chip_info, NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +
> +static struct platform_driver yoga_fan_driver = {
> +	.driver = {
> +		.name = DRVNAME,
> +	},
> +	.probe = yoga_fan_probe,
> +};
> +
> +static struct platform_device *yoga_fan_device;
> +
> +static const struct dmi_system_id yoga_dmi_table[] __initconst = {
> +	{
> +		.ident = "Lenovo",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +		},
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, yoga_dmi_table);
> +
> +static int __init yoga_fan_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(yoga_dmi_table))
> +		return -ENODEV;
> +
> +	ret = platform_driver_register(&yoga_fan_driver);
> +	if (ret)
> +		return ret;
> +
> +	yoga_fan_device = platform_device_register_simple(DRVNAME, 0, NULL, 0);
> +	if (IS_ERR(yoga_fan_device)) {
> +		platform_driver_unregister(&yoga_fan_driver);
> +		return PTR_ERR(yoga_fan_device);
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit yoga_fan_exit(void)
> +{
> +	platform_device_unregister(yoga_fan_device);
> +	platform_driver_unregister(&yoga_fan_driver);
> +}
> +
> +module_init(yoga_fan_init);
> +module_exit(yoga_fan_exit);
> +
> +MODULE_AUTHOR("Sergio Melas <sergiomelas@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Yoga/Legion Fan Monitor Driver");
> +MODULE_LICENSE("GPL");

