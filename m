Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793780811;
	b=ek7gkmKzn6tMErW+1HUMtOc8xusrxQNs3IDYvflNMw2nlZp/rxh3fnntup89sCmAU/A8
	 WlULq5ZHJ7SBjjAzg+umNWrppiILj/daxzE/AYu/vmkZ17FMclnyuZrsoJSu3XhWZcBiu
	 gRATVVW5yG93B7tntuCGSUalopRJ9X3V32jj46GC0HiIfTpfEteLKaup0KKuiLd76R+/q
	 qxIiFcBBcj7e4p7hTLMxPbSHrWi7MzF7MVbm2Hy1DbDdFIJRX6rN3/KGK4LZcDYavic5q
	 AOegypH9ka0QLTveTgSYvTWtYU99R7s3QlPmFWEqjXuYwjpkSglIU0EPlv24bsPhFOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=tvLMSn5HFpx5poOdSsb+2hYTyzg/cMkxA4fwRXRdGto=;
	b=qqogyEaPiU2pufnVpEhNRkXz1U2c6JctXBvZYXNBnc4NBI0iHjtBBg7iIqCfmkHZi8V3
	 SGi7e//xst3MhesWOG8srtDPvWqR1ZCbeC9dDtp2zRY0+9IaLqznQ7m3ILYyrF8NeEzeq
	 qalt9bSSYSczQs8QmektmH5geEXtld7hA0yXYox3PL0TpYI6gLHFDYMj2p+ebHEuFEzif
	 1dwNoIW0F7ppjfdlVfmjCppvMGHzNAobtFaf8LJ4RTVS2Q0ojyG3CakyzDCRsPpTZKllZ
	 uva5i7vZKD+ZUVOhqgnhucWexieZ7TJhwms7l+GkMrImUGzz7D0fkrhUfCwvnyesAlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=absP1XAP;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2271606A32F
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Nov 2026 08:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2271606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=absP1XAP
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso3560521fa.2
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 00:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793780808; x=1794385608; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvLMSn5HFpx5poOdSsb+2hYTyzg/cMkxA4fwRXRdGto=;
        b=absP1XAP5WyJOO4ydTiMHBpJYvH3qYUqCNKFKPJeOXvzrGlpB5o48crUhH22VhMAHr
         pmHB4al1ucv287GKq4CfijCKii8jUsKxqTOSz4QUOd6VtSDWc1xKFgSpn9XBe4pNjxNL
         9i13TJeXMRPbll+uxMSvUa5dzZpp/4xucAKPFsG7lyJSoh340Jp7z/DJ4qHMPsyc++au
         VDLS1acj4vMhmwAeCvFFROED4SJJNI5Qhzeg5+lndFhUOrZzDKQ/eLBV9UbYOyt6Yf9L
         jRbzqThMzuC1APpLwrz3wbqcOe91cbG8iUxrkil++rXHPYbIt+StjJUhVqLMufSqIZhx
         zeug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780808; x=1794385608;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tvLMSn5HFpx5poOdSsb+2hYTyzg/cMkxA4fwRXRdGto=;
        b=xoiEZcoShs1US9kPWQnJ8e1867KozLghAsW9PUh6X7EZZbpAFs22xG4Bgrr7NYvIXb
         VKkwcSr/D7VuQTnrANbeOriJedCYs7AXPjM6o+hmd2X2pZtRXDJgoa6TC4BHEEM3Zk5a
         wc4ubb4ciy35bJmPZro6lmiVVgl9MadaTjsGANCOUHypzpww2SV0LVXtOWrJpQE5a99d
         UNDoJL5exeVGWnMdk3hZRP5azVzWgh8OOlG9kVtxRCHCSjxhr9y1wSgW8cFP0LEffEdI
         VdrCAKkjMbLQqN+I7qSGk0jjYhXBdlbLhvYkUvZRtBITvVwTigalqDDNEIECvlAdShw3
         5k+g==
X-Forwarded-Encrypted: i=1; AKwUvByRzccuMFHONPgfNAFVSEibuZLOaF4NRW98Rh4cgeDTNHLkQwsczVbN2xq593Pn8csXXmwLcTO8oD51Eg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/NneVvB+9N1rUEd3PVNDyHCJQSu+jApNqlC6jUipk0mDk/cBhq
	YpK5EGVLg/gWeCfdDJgoW+nI+KmTMi5noRnlet3b7JJ/nDCuLom4w90c4oOC/+T/cZk=
X-Gm-Gg: AYBFou271B7i/15sNmCM0pzEvmaduCO+8wsb+dqt59Bder4RwmECRT4VfDM77Vugalc
	9o1y3rava0wzF2RNQKETpZkfM4Fkk3Rmvj7gJRICWLwq548tK2cf4FN+1bEBzwsd9Pn/8VbP8av
	RjMJKdPlIwpxtkBQXMQvyIKkven0VdwO8fgfYASnLdYfy1FsZ4G3tpilegHf8GxQo/JlH5Bq88D
	obS7R56NLSwNzcLYndRQg95sNJj9NA/NfY1EW3QLgonVqtsahMnctPg9qYYMJYL6Wb0WLOcrutB
	zBvm/Qxwt0VRxqi6hiBOMu/LHNhf298g8T4vRb3EwsdMHaPk9kJJU/w6E3iNkEK7uLXbt1K+j4B
	ckFEPK7RueNsM5yoOA9tmlHCqBVteiGtIA9JMgTaAGV1DsL64+nXgCc4zJTgAUfAy+zucNEPc2I
	lDxRdzZZVZHgHO1LlvHIo7znmq4RqxkRdQ3k7Eyz63u/m/jdnlclqO9XX9rTKJ44HeXHKpXkjHN
	Owu5gD+eGv7Ikorlm8fx8pDFf/a96yg4OXvajsNiuvigJgDGCYAOTs4MVlesAKcXX9g5gcC3WTb
	xes0QhpPSk7Lhe1Vv9cEwVqkJbxZ3iRWNs6j+RNuJp9V1kJF4stEFLY=
X-Received: by 2002:a05:6512:2243:b0:5bf:a77e:7231 with SMTP id 2adb3069b0e04-5bfd956a2c7mr5805640e87.26.1793780807863;
        Wed, 04 Nov 2026 00:26:47 -0800 (PST)
Received: from nuoska (78-27-71-225.bb.dnainternet.fi. [78.27.71.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38c2690sm269858e87.57.2026.11.04.00.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 00:26:47 -0800 (PST)
Date: Wed, 4 Nov 2026 10:26:45 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: Kconfig dependency loop LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL ->
 POWER_SUPPLY -> HID_NVIDIA_SHIELD -> LEDS_CLASS (was Re: [PATCH v4 2/4]
 platform: arm64: Add a driver for the EC found on ASUS Glymur machines )
Message-ID: <aursRfQRr0AOL1Oi@nuoska>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com>
 <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>

(Adding linux-kbuild@vger.kernel.org, linux-yocto@lists.yoctoproject.org and
yocto kernel maintainer Bruce)

Hi,

On Thu, Oct 15, 2026 at 10:55:30AM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> least the Zenbook A14 and A16) expose a custom, somewhat
> Qualcomm reference-derived EC interface. Introduce a driver to
> communicate with said EC, allowing for fan speed reporting, keyboard
> backlight setting and receiving of a number of miscellaneous sideband
> events.
>=20
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/Kconfig          |  16 +
>  drivers/platform/arm64/Makefile         |   1 +
>  drivers/platform/arm64/asus-glymur-ec.c | 616 ++++++++++++++++++++++++++=
++++++
>  3 files changed, 633 insertions(+)
>=20
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> index e32e01b2a9bd..84c475c62990 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -33,6 +33,22 @@ config EC_ACER_ASPIRE1
>  	  laptop where this information is not properly exposed via the
>  	  standard ACPI devices.
> =20
> +config EC_ASUS_GLYMUR
> +	tristate "ASUS Zenbook A16 (Qualcomm) Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on HWMON
> +	depends on INPUT
> +	depends on PM
> +	depends on THERMAL || THERMAL=3Dn
> +	select NEW_LEDS
> +	select LEDS_CLASS
> +	help
> +	  Say M or Y here to enable the EC driver for the Qualcomm Snapdragon-
> +	  based ASUS Zenbook A16 (UX3607OA) and similar machines. It provides
> +	  temperature sensors readout, fan monitoring, keyboard and EC event
> +	  reporting.
> +

With this new EC_ASUS_GLYMUR driver in 7.4-rc1 there now exists a kconfig d=
ependency loop
in arm64 builds:

LEDS_CLASS -> EC_ASUS_GLYMUR -> THERMAL -> POWER_SUPPLY -> HID_NVIDIA_SHIEL=
D -> LEDS_CLASS

In Yocto distro we use additional tools[1] to check that kconfig elements i=
n fragments actually
get applied in the final .config etc and one of the checks is for dependenc=
y loops which now
fails with 7.4-rc1, full log below[2].

To me it looks like EC_ASUS_GLYMUR correctly depends on LEDS_CLASS and that=
 enabling this
driver by default on arm64 with LEDS_CLASS is correct. And also HID_NVIDIA_=
SHIELD correctly
depends on LEDS_CLASS. Thus I don't think the drivers are doing anything wr=
ong and thus
on the Yocto kernel QA check side the dependency loop check should be relax=
ed since they
now can exists in the kernel tree.

Do you agree to this or is there maybe some way to remove the kernel side k=
config dependency
loop to and from LEDS_CLASS?

Cheers,

-Mikko

[1] symbol_why.py and kconfig parsing library from https://git.yoctoproject=
=2Eorg/yocto-kernel-tools/
    detects this loop

[2]
2026-11-03 12:00:42 - ERROR    - Command "/builds/Linaro/trustedsubstrate/g=
pit/build$ /builds/Linaro/trustedsubstrate/gpit/bitbake/bin/bitbake -c buil=
d core-image-sato-sdk" failed:
ERROR: linux-yocto-dev-7.4-rc1+git-r0 do_kernel_configcheck: config analysi=
s failed when running 'symbol_why.py --dotconfig /builds/Linaro/trustedsubs=
trate/gpit/build/tmp/work/genericarm64-poky-linux/linux-yocto-dev/7.4-rc1+g=
it/linux-genericarm64-standard-build/.config --mismatches --classify': Trac=
eback (most recent call last):
  File "/builds/Linaro/trustedsubstrate/gpit/build/tmp/work/genericarm64-po=
ky-linux/linux-yocto-dev/7.4-rc1+git/recipe-sysroot-native/usr/bin/symbol_w=
hy.py", line 879, in <module>
    conf =3D kconfiglib.Kconfig( kconf, show_errors, show_errors )
  File "/builds/Linaro/trustedsubstrate/gpit/build/tmp/work/genericarm64-po=
ky-linux/linux-yocto-dev/7.4-rc1+git/recipe-sysroot-native/usr/bin/kconfigl=
ib.py", line 948, in __init__
    self._init(filename, warn, warn_to_stderr, encoding)
    ~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/builds/Linaro/trustedsubstrate/gpit/build/tmp/work/genericarm64-po=
ky-linux/linux-yocto-dev/7.4-rc1+git/recipe-sysroot-native/usr/bin/kconfigl=
ib.py", line 1122, in _init
    check_dep_loop_sym(sym, False)
    ~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^
  File "/builds/Linaro/trustedsubstrate/gpit/build/tmp/work/genericarm64-po=
ky-linux/linux-yocto-dev/7.4-rc1+git/recipe-sysroot-native/usr/bin/kconfigl=
ib.py", line 6691, in _check_dep_loop_sym
    else _check_dep_loop_sym(dep, False)
         ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^
  File "/builds/Linaro/trustedsubstrate/gpit/build/tmp/work/genericarm64-po=
ky-linux/linux-yocto-dev/7.4-rc1+git/recipe-sysroot-native/usr/bin/kconfigl=
ib.py", line 6691, in _check_dep_loop_sym
    else _check_dep_loop_sym(dep, False)
         ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^
  File "/builds/Linaro/trustedsubstrate/gpit/build/tmp/work/genericarm64-po=
ky-linux/linux-yocto-dev/7.4-rc1+git/recipe-sysroot-native/usr/bin/kconfigl=
ib.py", line 6691, in _check_dep_loop_sym
    else _check_dep_loop_sym(dep, False)
         ~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^
  [Previous line repeated 7 more times]
  File "/builds/Linaro/trustedsubstrate/gpit/build/tmp/work/genericarm64-po=
ky-linux/linux-yocto-dev/7.4-rc1+git/recipe-sysroot-native/usr/bin/kconfigl=
ib.py", line 6695, in _check_dep_loop_sym
    return _found_dep_loop(loop, sym)
  File "/builds/Linaro/trustedsubstrate/gpit/build/tmp/work/genericarm64-po=
ky-linux/linux-yocto-dev/7.4-rc1+git/recipe-sysroot-native/usr/bin/kconfigl=
ib.py", line 6799, in _found_dep_loop
    raise KconfigError(msg)
kconfiglib.KconfigError:=20
Dependency loop
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

LEDS_CLASS (defined at drivers/leds/Kconfig:23), with definition...

config LEDS_CLASS
	tristate "LED Class Support"
	depends on NEW_LEDS
	help
	  This option enables the LED sysfs class in /sys/class/leds.  You'll
	  need this to do anything useful with LEDs.  If unsure, say Y.

(select-related dependencies: (ADB_PMU_LED && PPC_PMAC && ADB_PMU && MACINT=
OSH_DRIVERS) || (INPUT_WISTRON_BTNS && X86_32 && !UML && INPUT_MISC && INPU=
T) || (SENSORS_APPLESMC && INPUT && X86 && HWMON) || (IR_REDRAT3 && USB && =
RC_DEVICES && RC_CORE) || (IR_TTUSBIR && USB && RC_DEVICES && RC_CORE) || (=
IR_WINBOND_CIR && ((X86 && PNP) || COMPILE_TEST) && HAS_IOPORT && RC_DEVICE=
S && RC_CORE) || (HT16K33 && FB && I2C && INPUT && BACKLIGHT_CLASS_DEVICE &=
& AUXDISPLAY) || (BACKLIGHT_ADP8860 && I2C && BACKLIGHT_CLASS_DEVICE && HAS=
_IOMEM) || (BACKLIGHT_ADP8870 && I2C && BACKLIGHT_CLASS_DEVICE && HAS_IOMEM=
) || (BACKLIGHT_LM3639 && I2C && BACKLIGHT_CLASS_DEVICE && HAS_IOMEM) || (S=
ND_HDA_GENERIC && SND_HDA_GENERIC_LEDS && SND_HDA && SND && SOUND) || (SND_=
USB_TONEPORT && SND_USB && USB && SND && SOUND) || (HID_MSI && USB_HID && H=
ID && HID_SUPPORT) || (HID_WACOM && USB_HID && HID && HID_SUPPORT) || (HUAW=
EI_WMI && ACPI_BATTERY && ACPI_EC && ACPI_WMI && INPUT && X86_PLATFORM_DEVI=
CES) || (ACER_WMI && BACKLIGHT_CLASS_DEVICE && SERIO_I8042 && INPUT && (RFK=
ILL || RFKILL =3D n) && ACPI_EC && ACPI_WMI && (ACPI_VIDEO || ACPI_VIDEO =
=3D n) && HWMON && X86_PLATFORM_DEVICES) || (ASUS_LAPTOP && ACPI && BACKLIG=
HT_CLASS_DEVICE && INPUT && (RFKILL || RFKILL =3D n) && (ACPI_VIDEO || ACPI=
_VIDEO =3D n) && X86_PLATFORM_DEVICES) || (ASUS_WIRELESS && ACPI && INPUT &=
& X86_PLATFORM_DEVICES) || (ASUS_WMI && ACPI_WMI && ACPI_BATTERY && INPUT &=
& HWMON && BACKLIGHT_CLASS_DEVICE && (RFKILL || RFKILL =3D n) && HOTPLUG_PC=
I && (ACPI_VIDEO || ACPI_VIDEO =3D n) && (SERIO_I8042 || SERIO_I8042 =3D n)=
 && X86_PLATFORM_DEVICES) || (EEEPC_LAPTOP && ACPI_EC && INPUT && (RFKILL |=
| RFKILL =3D n) && (ACPI_VIDEO || ACPI_VIDEO =3D n) && HOTPLUG_PCI && BACKL=
IGHT_CLASS_DEVICE && X86_PLATFORM_DEVICES) || (DELL_LAPTOP && DMI && BACKLI=
GHT_CLASS_DEVICE && ACPI_BATTERY && (ACPI_VIDEO || ACPI_VIDEO =3D n) && (RF=
KILL || RFKILL =3D n) && (DELL_WMI || DELL_WMI =3D n) && SERIO_I8042 && DEL=
L_SMBIOS && X86_PLATFORM_DRIVERS_DELL && X86_PLATFORM_DEVICES) || (FUJITSU_=
LAPTOP && ACPI && INPUT && BACKLIGHT_CLASS_DEVICE && ACPI_BATTERY && (ACPI_=
VIDEO || ACPI_VIDEO =3D n) && X86_PLATFORM_DEVICES) || (HP_ACCEL && INPUT &=
& ACPI && SERIO_I8042 && X86_PLATFORM_DRIVERS_HP && X86_PLATFORM_DEVICES) |=
| (IDEAPAD_LAPTOP && ACPI && ACPI_BATTERY && RFKILL && INPUT && SERIO_I8042=
 && BACKLIGHT_CLASS_DEVICE && (ACPI_VIDEO || ACPI_VIDEO =3D n) && (ACPI_WMI=
 || ACPI_WMI =3D n) && X86_PLATFORM_DEVICES) || (LENOVO_WMI_HOTKEY_UTILITIE=
S && ACPI_WMI && X86_PLATFORM_DEVICES) || (THINKPAD_ACPI && ACPI_EC && ACPI=
_BATTERY && INPUT && (RFKILL || RFKILL =3D n) && (ACPI_VIDEO || ACPI_VIDEO =
=3D n) && BACKLIGHT_CLASS_DEVICE && I2C && DRM && X86_PLATFORM_DEVICES) || =
(YOGABOOK && ACPI_WMI && INPUT && I2C && X86_PLATFORM_DEVICES) || (SAMSUNG_=
LAPTOP && (RFKILL || RFKILL =3D n) && (ACPI_VIDEO || ACPI_VIDEO =3D n) && A=
CPI_BATTERY && BACKLIGHT_CLASS_DEVICE && X86_PLATFORM_DEVICES) || (ACPI_TOS=
HIBA && ACPI_EC && ACPI_BATTERY && ACPI_WMI && BACKLIGHT_CLASS_DEVICE && IN=
PUT && (SERIO_I8042 || SERIO_I8042 =3D n) && (ACPI_VIDEO || ACPI_VIDEO =3D =
n) && (HWMON || HWMON =3D n) && (RFKILL || RFKILL =3D n) && IIO && X86_PLAT=
FORM_DEVICES) || (LG_LAPTOP && ACPI && ACPI_BATTERY && INPUT && X86_PLATFOR=
M_DEVICES) || (SYSTEM76_ACPI && ACPI_EC && ACPI_BATTERY && HWMON && INPUT &=
& X86_PLATFORM_DEVICES) || (TOPSTAR_LAPTOP && ACPI && INPUT && X86_PLATFORM=
_DEVICES) || (X86_ANDROID_TABLETS && I2C && SPI && SERIAL_DEV_BUS && GPIOLI=
B && PMIC_OPREGION && ACPI && EFI && PCI && X86_PLATFORM_DEVICES) || (SEL33=
50_PLATFORM && ACPI && GPIOLIB && PINCTRL_BROXTON && X86_PLATFORM_DEVICES) =
|| (EC_ASUS_GLYMUR && (ARCH_QCOM || COMPILE_TEST) && I2C && HWMON && INPUT =
&& PM && (THERMAL || THERMAL =3D n) && ARM64_PLATFORM_DEVICES) || (EC_LENOV=
O_THINKPAD_T14S && (ARCH_QCOM || COMPILE_TEST) && I2C && INPUT && ARM64_PLA=
TFORM_DEVICES) || (EC_LENOVO_YOGA_SLIM7X_GEN11 && (ARCH_QCOM || COMPILE_TES=
T) && I2C && INPUT && HWMON && ARM64_PLATFORM_DEVICES))

=2E..depends on EC_ASUS_GLYMUR (defined at drivers/platform/arm64/Kconfig:3=
6), with definition...

config EC_ASUS_GLYMUR
	tristate "ASUS Zenbook A16 (Qualcomm) Embedded Controller driver"
	select NEW_LEDS
	select LEDS_CLASS
	depends on (ARCH_QCOM || COMPILE_TEST) && I2C && HWMON && INPUT && PM && (=
THERMAL || THERMAL =3D n) && ARM64_PLATFORM_DEVICES
	help
	  Say M or Y here to enable the EC driver for the Qualcomm Snapdragon-
	  based ASUS Zenbook A16 (UX3607OA) and similar machines. It provides
	  temperature sensors readout, fan monitoring, keyboard and EC event
	  reporting.

=2E..depends on THERMAL (defined at drivers/thermal/Kconfig:6), with defini=
tion...

menuconfig THERMAL
	bool "Thermal drivers"
	help
	  Thermal drivers offer a generic mechanism for
	  thermal management. Usually it's made up of one or more thermal
	  zones and cooling devices.
	  Each thermal zone contains its own temperature, trip points,
	  and cooling devices.
	  All platforms with ACPI or Open Firmware thermal support can use
	  this driver.
	  If you want this support, you should say Y here.

(select-related dependencies: (ACPI_VIDEO && BACKLIGHT_CLASS_DEVICE && INPU=
T && ACPI_WMI && ACPI) || (ACPI_PROCESSOR && (X86 || ARM64 || LOONGARCH || =
RISCV) && ACPI) || (ACPI_THERMAL && ACPI_PROCESSOR && ACPI) || (AB8500_BM &=
& AB8500_CORE && AB8500_GPADC && IIO =3D y && OF && POWER_SUPPLY) || (DRM_E=
TNAVIV && DRM_ETNAVIV_THERMAL && DRM && MMU && DRM && HAS_IOMEM) || (DRM_NO=
UVEAU && ACPI && X86 && DRM && PCI && DRM && HAS_IOMEM) || (MMC_SDHCI_OMAP =
&& (ARCH_OMAP2PLUS || ARCH_KEYSTONE || COMPILE_TEST) && MMC_SDHCI_PLTFM && =
OF && MMC))

(imply-related dependencies: (ACPI_VIDEO && BACKLIGHT_CLASS_DEVICE && INPUT=
 && ACPI_WMI && ACPI) || (ACPI_PROCESSOR && (X86 || ARM64 || LOONGARCH || R=
ISCV) && ACPI) || (ACPI_THERMAL && ACPI_PROCESSOR && ACPI) || (AB8500_BM &&=
 AB8500_CORE && AB8500_GPADC && IIO =3D y && OF && POWER_SUPPLY) || (DRM_ET=
NAVIV && DRM_ETNAVIV_THERMAL && DRM && MMU && DRM && HAS_IOMEM) || (DRM_NOU=
VEAU && ACPI && X86 && DRM && PCI && DRM && HAS_IOMEM) || (MMC_SDHCI_OMAP &=
& (ARCH_OMAP2PLUS || ARCH_KEYSTONE || COMPILE_TEST) && MMC_SDHCI_PLTFM && O=
F && MMC))

=2E..depends on POWER_SUPPLY (defined at drivers/power/supply/Kconfig:2), w=
ith definition...

menuconfig POWER_SUPPLY
	bool "Power supply class support"
	help
	  Say Y here to enable power supply class support. This allows
	  power supply (batteries, AC, USB) monitoring by userspace
	  via sysfs and uevent (if available) and/or APM kernel interface
	  (if selected below).

(select-related dependencies: ARM64 || (X86_AMD_PSTATE && ACPI && X86 && CP=
U_FREQ) || (ACPI_AC && ACPI) || (ACPI_BATTERY && ACPI) || (ACPI_SBS && X86 =
&& ACPI_EC && ACPI) || (AB8500_CORE && ABX500_CORE && MFD_DB8500_PRCMU && H=
AS_IOMEM) || (DRM_AMDGPU && DRM && PCI && DRM && HAS_IOMEM) || (DRM_NOUVEAU=
 && DRM && PCI && DRM && HAS_IOMEM) || (DRM_RADEON && DRM && PCI && (AGP ||=
 !AGP) && DRM && HAS_IOMEM) || (HID_BATTERY_STRENGTH && HID && HID_SUPPORT)=
 || (HID_ASUS && USB_HID && LEDS_CLASS && (ASUS_WMI || ASUS_WMI =3D n) && H=
ID && HID_SUPPORT) || (HID_CORSAIR && USB_HID && LEDS_CLASS && HID && HID_S=
UPPORT) || (HID_LOGITECH_HIDPP && HID_LOGITECH && HID && HID_SUPPORT) || (H=
ID_NINTENDO && NEW_LEDS && LEDS_CLASS && USB_HID && HID && HID_SUPPORT) || =
(HID_NVIDIA_SHIELD && USB_HID && BT_HIDP && LEDS_CLASS && HID && HID_SUPPOR=
T) || (HID_PLAYSTATION && LEDS_CLASS_MULTICOLOR && HID && HID_SUPPORT) || (=
HID_SONY && USB_HID && NEW_LEDS && LEDS_CLASS && HID && HID_SUPPORT) || (HI=
D_STEAM && HID && HID_SUPPORT) || (HID_PULSAR && USB_HID && HID && HID_SUPP=
ORT) || (HID_WACOM && USB_HID && HID && HID_SUPPORT) || (HID_WIIMOTE && LED=
S_CLASS && HID && HID_SUPPORT) || (USB_CONN_GPIO && GPIOLIB && USB_SUPPORT)=
 || (APPLE_MFI_FASTCHARGE && USB && USB_SUPPORT) || (TYPEC_TCPM && USB && T=
YPEC && USB_SUPPORT) || (TYPEC_TPS6598X && I2C && TYPEC && USB_SUPPORT) || =
(DELL_LAPTOP && DMI && BACKLIGHT_CLASS_DEVICE && ACPI_BATTERY && (ACPI_VIDE=
O || ACPI_VIDEO =3D n) && (RFKILL || RFKILL =3D n) && (DELL_WMI || DELL_WMI=
 =3D n) && SERIO_I8042 && DELL_SMBIOS && X86_PLATFORM_DRIVERS_DELL && X86_P=
LATFORM_DEVICES) || (HP_WMI && ACPI_EC && ACPI_WMI && INPUT && (RFKILL || R=
FKILL =3D n) && X86_PLATFORM_DRIVERS_HP && X86_PLATFORM_DEVICES) || (X86_AN=
DROID_TABLETS && I2C && SPI && SERIAL_DEV_BUS && GPIOLIB && PMIC_OPREGION &=
& ACPI && EFI && PCI && X86_PLATFORM_DEVICES) || (SEL3350_PLATFORM && ACPI =
&& GPIOLIB && PINCTRL_BROXTON && X86_PLATFORM_DEVICES))

=2E..depends on HID_NVIDIA_SHIELD (defined at drivers/hid/Kconfig:908), wit=
h definition...

config HID_NVIDIA_SHIELD
	tristate "NVIDIA SHIELD devices"
	select POWER_SUPPLY
	depends on USB_HID && BT_HIDP && LEDS_CLASS && HID && HID_SUPPORT
	help
	  Support for NVIDIA SHIELD accessories.
	 =20
	  Supported devices:
	  - Thunderstrike (NVIDIA SHIELD Controller 2017)

=2E..depends again on LEDS_CLASS (defined at drivers/leds/Kconfig:23)

ERROR: Logfile of failure stored in: /builds/Linaro/trustedsubstrate/gpit/b=
uild/tmp/work/genericarm64-poky-linux/linux-yocto-dev/7.4-rc1+git/temp/log.=
do_kernel_configcheck.519198
ERROR: Task (/builds/Linaro/trustedsubstrate/gpit/build/../core/meta/recipe=
s-kernel/linux/linux-yocto-dev.bb:do_kernel_configcheck) failed with exit c=
ode '1'
2026-11-03 12:00:42 - ERROR    - Command "/builds/Linaro/trustedsubstrate/g=
pit/bitbake/bin/bitbake -c build core-image-sato-sdk" failed with error 1
section_end:1793707242:step_script
