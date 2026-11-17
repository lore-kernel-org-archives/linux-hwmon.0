Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794914880;
	b=mNfqkBHSy/35qrTKtMg1CAB3JIsL0kodc626WqIYJ8n6UJjak2cj6/9znx/decsS8tGZ
	 p+AXVqv0cmdNvhc+v3w32zWOon5W6rK8qIfAh+G/g6xeHz4tfnC/7CojBg94Tm9yIeS+0
	 TCEYHwhEyowW9scc/M6cOtNIxY+iBs/loTpN2hnYhjf3Ca5r0ZMc8Sf0XLKB9mML1G6rf
	 aGRJ+YHzSKsK6vxbpm8/DycIjQkx7j2/EGRDqkUhOsOQ/cyTNzsVx3W0azXVHZafd7gqH
	 vyCvb8Kxd1MQGLZy6l+hPdMsMhn5eOevkHBp78TtrfsFztcbHCqHrhzTk8xE+fD54lg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=96pswqJ5qTbntrCOwepGnE2YJy9r1prVrxEWrzWWlW0=;
	b=DiCD5DeHzQHcO3UVI4T5VIql9Su8PdWTY6MsFLQp0J8f4O5grMPH9A03IiGI4s8MSARV
	 kb0IaBHXqcnaP2zTawkrfRccArxxzczbnYn90AQSwKyqfbyhmb46wAcC+DhhwtosVLfcF
	 UlWABXB5n8nDGm8fPV0yuFXh3x0j6Z0EuBB77jbja3H187HWYK2IYMVp+NTESnSFiNiQo
	 xbU59yNclhGhOx1aDqLmb/sHFqWZ97pyw+o9F5A6ENgZpaJb4EFqLV3xAQtF1nd1EHBDl
	 p6vbPOlOSHk8Y4ImeURfWFqs9hnRCR5+B54UeYNcyP8l/25AedZhXwy+NiivXGr/e1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sR/N0i1+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB85606A32C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 11:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DB85606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sR/N0i1+
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso6007773a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:27:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794914878; cv=none;
        d=google.com; s=arc-20260327;
        b=A/pxwK3oGEsDPjN1Y15ld/qT7OUfrPIQK4T7ilomgPP571F5fGwU2jDPV97gkXlCTu
         etQO/N9RCQKgJ0e1FJHPXUVKSA2YUHadlr3mFtZCNIzDvWwMDVcuPjWpSUtKhKUWFP0r
         BfLlE3yM2u9sK9qyEugzGFvsrSTMGl7SAhT4ihGpeK6Jbupmh2JoS8jPxjYfH972I9L9
         qKViyBYVy9sUnUFXjgLcJREL9RpFyOpGcNxWbQF/juA27DeWyU+r+6DurjUIhZ7WM4ve
         NVejEl8+JyKi/NNSU2dI7BQhr+49zf9i0Gv2vJPXEee00BVUlLkDZT7WBnimO44wofHe
         RAVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=96pswqJ5qTbntrCOwepGnE2YJy9r1prVrxEWrzWWlW0=;
        fh=ZG0y1GZbz+xdCDN3aNRBD6c0cms0rRfqJljCzwHM8sM=;
        b=WVO+uTl4SQ2IAEYamKa6qy3PAemcEe+H3QhcajK/6HIZnKVQhX+/XbosdMekBa1Gil
         Sbgr5lr96uS6Chdzu10BQQGxBWr0hTEpiqtfnFJ8qyKUnj1bw4VhnYxIHPlH7GftpGlI
         j70AqKc7aeSJKg2Qw9bNdUcMS0EFbfymkzkg+rAkFRFQRsuXI68c4gVe0UqatgQed+1j
         ZmarT8NBRtG1g9eomP/crUAoWYy7lgrLIeS4ha4L56fsLovtEh+aK1PCoI/oba7FnJF0
         Rct8NgwNa9brwc8ZxT7N75hHtbNYkpDTjtzRfsqOlPvh4EQuSqqknTYhksA10xCOBogi
         54ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794914878; x=1795519678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=96pswqJ5qTbntrCOwepGnE2YJy9r1prVrxEWrzWWlW0=;
        b=sR/N0i1+UjU2WkuETkMc44pHi2ZIAuZlHcG+A7Oh0J0ZQw9Gm9vnK/z8bqSAIud29P
         zakNbH4k3TzaWepbIQForDoMHu2aN5gDhx8C19CLzb2KSY5Mz80xkdSVA6jdsyA9grKs
         d+CX8g5WuS3ekeiBlre33VePm8JjrhYyv04hEJHtkePVboZCyrSUMkk9u2DsukMmpCM7
         UfgYNlIaA5ZdQmctH1as+h+H33aN/oWzcz7eTAyI331jqBzVBexYhXx9cyKso3mX8DAB
         jVdTognkfHtpDRJYwIDhIP6hIW8O1kTXQS+bpIHfTA/3Zf7SskS9KQlmpjITUpscWPC6
         xLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794914878; x=1795519678;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96pswqJ5qTbntrCOwepGnE2YJy9r1prVrxEWrzWWlW0=;
        b=fbQKi2xgnbbdxkag+0Q+DwEMUz8Y60u1wrp3jXI2CbR7j3jJzd4FYn4RFPTitZ7Xgu
         VwG0Rsvu+quqCaSnttkWgEuPvJywxdh02xr9aAwjXzydyer6e+EFGZ/9e0RQG+1ZVhTt
         z+kptbqH76OfD41sdtc8yBESr+/kfSKOM88F9/+IaVh8nY8NZknWpv3vKc8ME/9BJhVQ
         7LGODPF/ui0+uwhDBToCe+Zl1dJmWzUyd3rOcvbYUM3tXaE8LWugpcgfeGOFMDrN2riK
         SU/MVjT1u+r0siOWK2o9HUnD8NWVit1GyzrfGVhBfEMtdVnw8D/uPX6s4IzkGqLsE+r5
         eaUg==
X-Forwarded-Encrypted: i=1; AL+hErEZdAHe/AvfGcqfNn12EjBNJlZolm5IlvihYzizOkKIf3buNfZz0c8oWHD8uExxEZCCpSnpiVK2LXnNwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8gygm+UHisZhMNSV10knrbrIJU3BxRVfj6YSsAxYRfFSR0leaj
	j5QdbVeCgGFj+ynFV6GXHxhPPS9GL7kzR/Rz6ZmmZ/HSZL5vNXvrv7ASPYW9uGrpzGCd3+9dF5H
	tL14akngxdZ6ZGEiq6YDapfJro68fYsw=
X-Gm-Gg: AYBFou2xVeUsbOpvVOQJHhn9pDBYFSuNwW2XGuyxMOP9HAcXJ1l7F8k6BIaoJ0kIf59
	Ly7lnFhHxXK4NCKge9446fNA6kRTwx6o+CemFH3gmbZxSI3GJnWmTJtoFSGwrc8UiDED/M1zhyf
	w3asyMyGUheqFHK9hdg3xkcKt2Vi4Oz5bhneXDPPPFE5cdlYXxSpauEy+Ywf0FWUlaUY/htDcTc
	mjx9QzzBkgZ1GNUQzfVpc3rC5j0bI5JW3NYoUlj3nDG4eArSQL6ZsD9wIkLk8Qw/TrlGOZQX4VN
	kEwnAHIpUMELCGdiRQ2VaM6jqIMSbdnbz+R4XvoNaINDQqFEPVTikQt5/rQ4bELETHUBXGB+eos
	qw4aEH/GOsNVaggMAhjIAXQDqLJJUJNemnxybaXnw7+afBeMH0KZ8yP8hW7n2OVsTLZ/c0PrhR+
	RgctLX4XPVLhWOJqkWnitFQ7E=
X-Received: by 2002:a05:6402:1d4c:b0:6b7:e12e:7f1f with SMTP id
 4fb4d7f45d1cf-6b7e12e824fmr8480026a12.10.1794914877296; Tue, 17 Nov 2026
 03:27:57 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-6-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:27:45 +0100
X-Gm-Features: AclHuK-0FMELmrbeSIJ6lqsgvU6_EHHBYLUy6hN4f2Saz_XYO2VMTL7Kx9k-SXw
Message-ID: <CA+=Fv5Rq0wWrEVoUwrMfM4Zs5X+giJh5ku_ARYDYkofnR2PwoQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] hwmon: Add driver for Marvel AlphaServer
 environmental sensors
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,


On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The management firmware of the Marvel (EV7) AlphaServers, the GS1280,
> ES80 and ES47, monitors temperatures, fans, voltages and power supplies.
> The SRM console describes each sensor as a packet in a power and
> environment node of its config tree (GCT), and fills in the readings
> when asked to refresh the node. The packet layout was taken from Tru64
> UNIX.
>
> The firmware gives each temperature, fan and voltage sensor a warning
> limit and a failure limit, and reports the sensor in the warning or
> failure state once its reading reaches one. Neither state means that the
> sensor is broken: a temperature past its failure limit is too high, not
> faulty. Power supplies are either working or failed, with the cause
> (AC, POK, overtemperature, fan) logged by the firmware.
>
> Export the sensors through hwmon. A temperature's warning and failure
> limits become max and crit, with max_alarm set in either state and
> crit_alarm in the failure state. A fan's warning limit becomes min, with
> min_alarm set in either state and fault in the failure state, which is
> when the firmware counts the fan as failed. A voltage exports its
> reading, with min_alarm or max_alarm set in either state and lcrit_alarm
> or crit_alarm in the failure state, depending on which side of its
> nominal voltage it reads. The console gives the nominal voltage and only
> one other limit, so the voltage limits are not exported. A power supply
> is a voltage channel with only a fault attribute.
>
> A refresh keeps the boot CPU in the console with interrupts disabled for
> up to 300 ms per node, so refresh a node at most once per
> update_interval. The hwmon core serializes the callbacks, which also
> serializes the refreshes.
>
> The console callback lives in core_marvel.o, which generic kernels
> built with ALPHA_LEGACY_START_ADDRESS leave out.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  Documentation/hwmon/index.rst      |   1 +
>  Documentation/hwmon/marvel-env.rst |  72 +++++
>  MAINTAINERS                        |   8 +
>  arch/alpha/include/asm/gct.h       |   2 +
>  drivers/hwmon/Kconfig              |  11 +
>  drivers/hwmon/Makefile             |   1 +
>  drivers/hwmon/marvel-env.c         | 609 +++++++++++++++++++++++++++++++=
++++++
>  7 files changed, 704 insertions(+)
>
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rs=
t
> index 199ca79621e9..b062ad1ff53f 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -157,6 +157,7 @@ Hardware Monitoring Kernel Drivers
>     ltc4286
>     lx1308
>     macsmc-hwmon
> +   marvel-env
>     max127
>     max15301
>     max16064
> diff --git a/Documentation/hwmon/marvel-env.rst b/Documentation/hwmon/mar=
vel-env.rst
> new file mode 100644
> index 000000000000..7e0457a60094
> --- /dev/null
> +++ b/Documentation/hwmon/marvel-env.rst
> @@ -0,0 +1,72 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver marvel-env
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported systems:
> +
> +  * Marvel (EV7) AlphaServers: the GS1280, ES80 and ES47 families,
> +    booted from the SRM console
> +
> +Author: Matt Turner <mattst88@gmail.com>
> +
> +Description
> +-----------
> +
> +The management firmware of these machines monitors temperatures, fans,
> +voltages and power supplies, and the SRM console describes each sensor i=
n
> +its configuration tree (GCT). This driver asks the console to refresh th=
e
> +readings and exports them.
> +
> +The console has no sensor names, so the labels are built from the report=
ing
> +unit (such as ``CMM0`` or ``MBM/PBM``) and the sensor's position in that
> +unit. On systems with more than one drawer the label starts with the
> +cabinet and drawer numbers.
> +
> +A refresh keeps the boot CPU in the console with interrupts disabled for=
 up
> +to 300 ms per unit, so a unit is refreshed at most once every
> +``update_interval`` milliseconds (10000 by default).
> +
> +Sysfs entries
> +-------------
> +
> +The management firmware gives each temperature, fan and voltage sensor a
> +warning limit and a failure limit, and reports the sensor in the warning=
 or
> +failure state when its reading reaches the limit. Neither state means th=
at
> +the sensor is broken. Power supplies have no warning state and are repor=
ted
> +as voltage channels that only have a fault attribute.
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +``update_interval``         Minimum time between refreshes of a unit, in=
 ms
> +
> +``temp[1-*]_input``         Temperature
> +``temp[1-*]_max``           Warning limit
> +``temp[1-*]_crit``          Failure limit
> +``temp[1-*]_max_alarm``     Temperature reached the warning limit
> +``temp[1-*]_crit_alarm``    Temperature reached the failure limit
> +``temp[1-*]_label``         Sensor label
> +
> +``fan[1-*]_input``          Fan speed
> +``fan[1-*]_min``            Warning limit
> +``fan[1-*]_min_alarm``      Fan speed dropped to the warning limit
> +``fan[1-*]_fault``          Fan speed dropped to the failure limit, and =
the
> +                            firmware counts the fan as failed
> +``fan[1-*]_label``          Fan label
> +
> +``in[0-*]_input``           Voltage
> +``in[0-*]_min_alarm``       Voltage is below the warning limit
> +``in[0-*]_max_alarm``       Voltage is above the warning limit
> +``in[0-*]_lcrit_alarm``     Voltage is below the failure limit
> +``in[0-*]_crit_alarm``      Voltage is above the failure limit
> +``in[0-*]_fault``           Power supply has failed
> +``in[0-*]_label``           Sensor or power supply label
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +The firmware checks a voltage against limits on both sides of the nomina=
l
> +voltage, but the console only describes the nominal voltage and one othe=
r
> +limit, so the voltage limits are not exported. Whether a voltage is too =
low
> +or too high comes from comparing it with the nominal voltage.
> +
> +Sensors that the console reports as unknown or not present when the driv=
er
> +loads are not exported. If a sensor becomes unknown later, reading its i=
nput,
> +alarm or fault attribute fails with ``-ENODATA``.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb315065..09dee8fab9ec 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16100,6 +16100,14 @@ L:     linux-mips@vger.kernel.org
>  S:     Maintained
>  F:     arch/mips/boot/dts/img/pistachio*
>
> +MARVEL ALPHASERVER ENVIRONMENTAL SENSOR DRIVER
> +M:     Matt Turner <mattst88@gmail.com>
> +L:     linux-hwmon@vger.kernel.org
> +L:     linux-alpha@vger.kernel.org
> +S:     Maintained
> +F:     Documentation/hwmon/marvel-env.rst
> +F:     drivers/hwmon/marvel-env.c
> +
>  MARVELL 88E6XXX ETHERNET SWITCH FABRIC DRIVER
>  M:     Andrew Lunn <andrew@lunn.ch>
>  L:     netdev@vger.kernel.org
> diff --git a/arch/alpha/include/asm/gct.h b/arch/alpha/include/asm/gct.h
> index 2847449fb168..afa7ed870bd1 100644
> --- a/arch/alpha/include/asm/gct.h
> +++ b/arch/alpha/include/asm/gct.h
> @@ -43,11 +43,13 @@ typedef struct {
>   * node types
>   */
>  #define GCT_TYPE_HOSE                  0x0E
> +#define GCT_TYPE_PE                    0x13    /* power and environment =
*/
>
>  /*
>   * node subtypes
>   */
>  #define GCT_SUBTYPE_IO_PORT_MODULE     0x2C
> +#define GCT_SUBTYPE_PE_CABINET         0x3D    /* id holds an 8-bit cabi=
net */
>
>  #define GCT_NODE_PTR(off) ((gct6_node *)((char *)hwrpb +               \
>                                          hwrpb->frut_offset +           \
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 18c682e1a475..c0ce5591c82d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1255,6 +1255,17 @@ config SENSORS_MACSMC_HWMON
>           This driver can also be built as a module. If so, the module wi=
ll
>           be called macsmc-hwmon.
>
> +config SENSORS_MARVEL_ENV
> +       tristate "Marvel (EV7) AlphaServer environmental sensors"
> +       depends on ALPHA_MARVEL || (ALPHA_GENERIC && !ALPHA_LEGACY_START_=
ADDRESS)
> +       help
> +         If you say yes here you get support for the temperature, fan,
> +         voltage and power supply sensors of Marvel AlphaServers (the
> +         GS1280, ES80 and ES47), as described by the SRM console.
> +
> +         This driver can also be built as a module. If so, the module
> +         will be called marvel-env.
> +
>  config SENSORS_MAX1111
>         tristate "Maxim MAX1111 Serial 8-bit ADC chip and compatibles"
>         depends on SPI_MASTER
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d4c345ed7261..2b1b1850d641 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -157,6 +157,7 @@ obj-$(CONFIG_SENSORS_LTC4282)       +=3D ltc4282.o
>  obj-$(CONFIG_SENSORS_LTC4283)  +=3D ltc4283.o
>  obj-$(CONFIG_SENSORS_LTQ_CPUTEMP) +=3D ltq-cputemp.o
>  obj-$(CONFIG_SENSORS_MACSMC_HWMON)     +=3D macsmc-hwmon.o
> +obj-$(CONFIG_SENSORS_MARVEL_ENV)       +=3D marvel-env.o
>  obj-$(CONFIG_SENSORS_MAX1111)  +=3D max1111.o
>  obj-$(CONFIG_SENSORS_MAX127)   +=3D max127.o
>  obj-$(CONFIG_SENSORS_MAX16065) +=3D max16065.o
> diff --git a/drivers/hwmon/marvel-env.c b/drivers/hwmon/marvel-env.c
> new file mode 100644
> index 000000000000..e501e049d702
> --- /dev/null
> +++ b/drivers/hwmon/marvel-env.c
> @@ -0,0 +1,609 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Environmental sensors of Marvel (EV7) AlphaServers: the GS1280, ES80 =
and
> + * ES47 families.
> + *
> + * The SRM console describes every sensor in the config tree (GCT). Each=
 power
> + * and environment (P&E) node may carry a list of environmental packets:
> + * temperature and voltage sensors, fans and power supplies. The console=
 fills
> + * in the readings when asked to refresh the node. The packet layout was
> + * taken from Tru64 UNIX.
> + *
> + * The management firmware gives each temperature, voltage and fan senso=
r a
> + * warning limit and a failure limit, and puts the sensor in the warning=
 or
> + * failure state when its reading reaches the limit. Neither state means=
 that
> + * the sensor itself is broken. A power supply has no warning state; it =
is
> + * either working or failed.
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +
> +#include <asm/gct.h>
> +#include <asm/marvel_env.h>
> +
> +#define DRVNAME "marvel_env"
> +
> +#define GCT_FLAGS_REQUIRED     BIT(9)
> +#define GCT_FLAGS_EXCLUDED     (BIT(2) | BIT(7) | BIT(12) | BIT(14))
> +
> +/* Header of a P&E node's packet list, at hd_extension. */
> +#define ENV_HDR_COUNT          0x10
> +#define ENV_HDR_FIRST          0x14
> +#define ENV_HDR_SIZE           0x18
> +
> +/* Packet types. */
> +#define ENV_PKT_POWER_SUPPLY   0x08
> +#define ENV_PKT_FAN            0x09
> +#define ENV_PKT_SENSOR         0x2a
> +
> +/*
> + * Sensor packet: kind, status, reading, and two limits. Temperatures ar=
e in
> + * tenths of a degree Celsius, voltages in millivolts. For a temperature=
 the
> + * two values are the warning and failure limits. For a voltage they are=
 the
> + * nominal voltage and an upper limit; the firmware checks a voltage aga=
inst
> + * a window on both sides of the nominal voltage, so neither is exported=
.
> + */
> +#define SENSOR_KIND            0x28
> +#define SENSOR_STATUS          0x2c
> +#define SENSOR_VALUE           0x30
> +#define SENSOR_WARN            0x34
> +#define SENSOR_FAIL            0x38
> +#define SENSOR_NOMINAL         SENSOR_WARN     /* of a voltage */
> +#define SENSOR_SIZE            0x3c
> +
> +#define SENSOR_KIND_THERMAL    2
> +#define SENSOR_KIND_VOLT_FIRST 3
> +#define SENSOR_KIND_VOLT_LAST  5
> +
> +/* Fan packet: status, rpm, low warning limit, low failure limit. */
> +#define FAN_STATUS             0x24
> +#define FAN_VALUE              0x28
> +#define FAN_WARN               0x2c
> +#define FAN_SIZE               0x34
> +
> +/* Power supply packet: status. */
> +#define PS_STATUS              0x24
> +#define PS_SIZE                        0x28
> +
> +/* Status values, in the low byte of the status word. */
> +#define ENV_OK                 0
> +#define ENV_WARNING            1       /* reading reached the warning li=
mit */
> +#define ENV_FAILURE            2       /* reading reached the failure li=
mit */
> +#define ENV_UNKNOWN            0xfe
> +#define ENV_NOT_PRESENT                0xff
> +
> +/* Console status of a refresh that Tru64 also treats as success. */
> +#define CFGTREE_STATUS_OK2     (-0x4a)
> +
> +struct marvel_env_node {
> +       gct6_node *node;
> +       unsigned long offset;           /* from the start of the GCT */
> +       unsigned long last_refresh;
> +       bool valid;
> +       unsigned int cabinet, drawer, pe;
> +};
> +
> +struct marvel_env_chan {
> +       struct marvel_env_node *node;
> +       unsigned int pkt;               /* packet offset in the node */
> +       bool ps;                        /* power supply, as an in channel=
 */
> +       bool present;                   /* known when the driver loaded *=
/
> +       char label[32];
> +};
> +
> +struct marvel_env_data {
> +       struct device *dev;
> +       unsigned int update_interval;   /* ms */
> +       struct marvel_env_node *nodes;
> +       unsigned int nr_nodes;
> +       struct marvel_env_chan *chans[hwmon_max];
> +       unsigned int nr_chans[hwmon_max];
> +};
> +
> +static const char * const pe_names[] =3D {
> +       [0x09] =3D "MBM",
> +       [0x0a] =3D "MBM/PBM",
> +       [0x0c] =3D "PS",
> +       [0x0d] =3D "FAN",
> +       [0x0f] =3D "CMM0", [0x10] =3D "CMM1", [0x11] =3D "CMM2", [0x12] =
=3D "CMM3",
> +       [0x14] =3D "VRM0", [0x15] =3D "VRM1", [0x16] =3D "VRM2", [0x17] =
=3D "VRM3",
> +       [0x19] =3D "PBM",
> +       [0x1a] =3D "XSHELF",
> +       [0x1b] =3D "PCIPS",
> +       [0x1c] =3D "PCIFANS",
> +};
> +
> +/* The sensor types the driver exports. */
> +static const enum hwmon_sensor_types marvel_env_types[] =3D {
> +       hwmon_temp, hwmon_fan, hwmon_in,
> +};
> +
> +/* The attributes that report the state of a channel. */
> +static const u32 marvel_env_alarm_attrs[hwmon_max] =3D {
> +       [hwmon_temp] =3D HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM,
> +       [hwmon_fan] =3D HWMON_F_MIN_ALARM | HWMON_F_FAULT,
> +       [hwmon_in] =3D HWMON_I_MIN_ALARM | HWMON_I_MAX_ALARM |
> +                    HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM | HWMON_I_F=
AULT,
> +};
> +
> +static inline u32 env_rd(struct marvel_env_node *n, unsigned int off)
> +{
> +       return *(u32 *)((char *)n->node + off);
> +}
> +
> +static bool env_status_valid(u8 status)
> +{
> +       return status !=3D ENV_UNKNOWN && status !=3D ENV_NOT_PRESENT;
> +}
> +
> +static u8 marvel_env_status(enum hwmon_sensor_types type,
> +                           const struct marvel_env_chan *c)
> +{
> +       unsigned int off;
> +
> +       if (type =3D=3D hwmon_fan)
> +               off =3D FAN_STATUS;
> +       else if (c->ps)
> +               off =3D PS_STATUS;
> +       else
> +               off =3D SENSOR_STATUS;
> +       return env_rd(c->node, c->pkt + off) & 0xff;
> +}
> +
> +/*
> + * The alarm attributes that are set in @status. A reading past the fail=
ure
> + * limit is also past the warning limit, so it sets both alarms. A fan b=
elow
> + * its failure limit is one the firmware counts as failed. A voltage out=
side
> + * its limits is too low or too high depending on which side of the nomi=
nal
> + * voltage it reads.
> + */
> +static u32 marvel_env_alarms(enum hwmon_sensor_types type,
> +                            const struct marvel_env_chan *c, u8 status)
> +{
> +       switch (type) {
> +       case hwmon_temp:
> +               if (status =3D=3D ENV_FAILURE)
> +                       return HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM;
> +               if (status =3D=3D ENV_WARNING)
> +                       return HWMON_T_MAX_ALARM;
> +               break;
> +       case hwmon_fan:
> +               if (status =3D=3D ENV_FAILURE)
> +                       return HWMON_F_MIN_ALARM | HWMON_F_FAULT;
> +               if (status =3D=3D ENV_WARNING)
> +                       return HWMON_F_MIN_ALARM;
> +               break;
> +       case hwmon_in:
> +               if (c->ps)
> +                       return status =3D=3D ENV_FAILURE ? HWMON_I_FAULT =
: 0;
> +               if (status !=3D ENV_WARNING && status !=3D ENV_FAILURE)
> +                       break;
> +               if ((s32)env_rd(c->node, c->pkt + SENSOR_VALUE) <
> +                   (s32)env_rd(c->node, c->pkt + SENSOR_NOMINAL)) {
> +                       if (status =3D=3D ENV_FAILURE)
> +                               return HWMON_I_MIN_ALARM | HWMON_I_LCRIT_=
ALARM;
> +                       return HWMON_I_MIN_ALARM;
> +               }
> +               if (status =3D=3D ENV_FAILURE)
> +                       return HWMON_I_MAX_ALARM | HWMON_I_CRIT_ALARM;
> +               return HWMON_I_MAX_ALARM;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static inline gct6_node *gct_node(gct6_handle h)
> +{
> +       return GCT_NODE_PTR(h);
> +}
> +
> +/* Cabinet and drawer come from the P&E node's parent. */
> +static void marvel_env_keys(struct marvel_env_node *n)
> +{
> +       gct6_node *parent =3D n->node->parent ? gct_node(n->node->parent)=
 : NULL;
> +
> +       n->pe =3D n->node->id & 0xff;
> +       if (!parent)
> +               return;
> +       if (parent->type =3D=3D GCT_TYPE_PE && parent->subtype =3D=3D GCT=
_SUBTYPE_PE_CABINET)
> +               n->cabinet =3D (parent->id >> 48) & 0xff;
> +       else
> +               n->cabinet =3D (parent->id >> 48) & 0x3f;
> +       n->drawer =3D (parent->id >> 32) & 0xff;
> +}
> +
> +static int marvel_env_refresh(struct marvel_env_data *data,
> +                             struct marvel_env_node *n)
> +{
> +       long status;
> +
> +       if (n->valid && time_before(jiffies, n->last_refresh +
> +                                   msecs_to_jiffies(data->update_interva=
l)))
> +               return 0;
> +
> +       status =3D marvel_cfgtree_partial_update(n->offset);
> +       if (status !=3D 1 && status !=3D CFGTREE_STATUS_OK2) {
> +               dev_warn_ratelimited(data->dev,
> +                                    "refresh of GCT node %#lx failed: %l=
d\n",
> +                                    n->offset, status);
> +               return -EIO;
> +       }
> +       n->last_refresh =3D jiffies;
> +       n->valid =3D true;
> +       return 0;
> +}
> +
> +/* The hwmon type of a packet, or hwmon_max to skip it. */
> +static enum hwmon_sensor_types marvel_env_pkt_type(struct marvel_env_nod=
e *n,
> +                                                  unsigned int pkt,
> +                                                  unsigned int type)
> +{
> +       unsigned int len =3D env_rd(n, pkt) & 0xffff;
> +       u32 kind;
> +
> +       switch (type) {
> +       case ENV_PKT_SENSOR:
> +               if (len < SENSOR_SIZE)
> +                       break;
> +               kind =3D env_rd(n, pkt + SENSOR_KIND);
> +               if (kind =3D=3D SENSOR_KIND_THERMAL)
> +                       return hwmon_temp;
> +               if (kind >=3D SENSOR_KIND_VOLT_FIRST && kind <=3D SENSOR_=
KIND_VOLT_LAST)
> +                       return hwmon_in;
> +               break;
> +       case ENV_PKT_FAN:
> +               if (len >=3D FAN_SIZE)
> +                       return hwmon_fan;
> +               break;
> +       case ENV_PKT_POWER_SUPPLY:
> +               if (len >=3D PS_SIZE)
> +                       return hwmon_in;
> +               break;
> +       }
> +       return hwmon_max;
> +}
> +
> +static void marvel_env_add_chan(struct marvel_env_data *data,
> +                               struct marvel_env_node *n, unsigned int p=
kt,
> +                               enum hwmon_sensor_types type, bool ps,
> +                               unsigned int index)
> +{
> +       static const char * const names[hwmon_max] =3D {
> +               [hwmon_temp] =3D "Temp", [hwmon_fan] =3D "Fan", [hwmon_in=
] =3D "Volt",
> +       };
> +       const char *what =3D ps ? "PS" : names[type];
> +       struct marvel_env_chan *c;
> +       const char *pe =3D NULL;
> +       size_t len =3D 0;
> +       u8 status;
> +
> +       c =3D &data->chans[type][data->nr_chans[type]++];

Minor: nothing checks this against the first pass's count. Both walks
read the same GCT, but a bounds check is cheap.

> +       c->node =3D n;
> +       c->pkt =3D pkt;
> +       c->ps =3D ps;
> +       status =3D marvel_env_status(type, c);
> +       c->present =3D env_status_valid(status);
> +
> +       if (n->cabinet || n->drawer)

This tests the node's own position, so on a multi-drawer system the
cabinet 0, drawer 0 units get no prefix. Either decide once in probe
whether any node is outside cabinet 0, drawer 0, or reword the doc.

> +               len =3D scnprintf(c->label, sizeof(c->label), "Cab%u Dra%=
u ",
> +                               n->cabinet, n->drawer);
> +
> +       if (n->pe < ARRAY_SIZE(pe_names))
> +               pe =3D pe_names[n->pe];
> +       if (pe && !strncasecmp(pe, what, strlen(what)))
> +               scnprintf(c->label + len, sizeof(c->label) - len, "%s %u"=
,
> +                         pe, index);
> +       else if (pe)
> +               scnprintf(c->label + len, sizeof(c->label) - len, "%s %s =
%u",
> +                         pe, what, index);
> +       else
> +               scnprintf(c->label + len, sizeof(c->label) - len, "PE%u %=
s %u",
> +                         n->pe, what, index);
> +}
> +
> +/*
> + * Walk a P&E node's packets, counting them, or adding them when @add. A=
s
> + * Tru64 does, visit count + 1 packets and number sensors from their
> + * position minus one.
> + */
> +static void marvel_env_walk(struct marvel_env_data *data,
> +                           struct marvel_env_node *n, bool add)
> +{
> +       unsigned int size =3D n->node->size;
> +       unsigned int hdr =3D n->node->hd_extension;
> +       unsigned int count, pkt, i;
> +
> +       if (!hdr || hdr + ENV_HDR_SIZE > size)
> +               return;
> +       count =3D env_rd(n, hdr + ENV_HDR_COUNT);
> +       pkt =3D env_rd(n, hdr + ENV_HDR_FIRST);
> +
> +       for (i =3D 0; i <=3D count; i++) {
> +               enum hwmon_sensor_types type;
> +               unsigned int len, pkt_type;
> +
> +               if (pkt < 8 || pkt + 8 > size)
> +                       break;
> +               len =3D env_rd(n, pkt) & 0xffff;
> +               pkt_type =3D env_rd(n, pkt + 4) & 0xffff;
> +               if (len < 8 || pkt + len > size)
> +                       break;
> +
> +               type =3D marvel_env_pkt_type(n, pkt, pkt_type);
> +               if (type !=3D hwmon_max && add)
> +                       marvel_env_add_chan(data, n, pkt, type,
> +                                           pkt_type =3D=3D ENV_PKT_POWER=
_SUPPLY,
> +                                           pkt_type =3D=3D ENV_PKT_SENSO=
R && i ?
> +                                           i - 1 : i);
> +               else if (type !=3D hwmon_max)
> +                       data->nr_chans[type]++;
> +               pkt +=3D len;
> +       }
> +}
> +
> +/* Collect the P&E nodes with an environmental packet list. */
> +static void marvel_env_find_nodes(struct marvel_env_data *data,
> +                                 gct6_node *node, bool record)
> +{
> +       for (; node; node =3D node->next ? gct_node(node->next) : NULL) {
> +               if (node->magic !=3D GCT_NODE_MAGIC)
> +                       return;
> +               if (node->type =3D=3D GCT_TYPE_PE && node->hd_extension &=
&
> +                   (node->flags & GCT_FLAGS_REQUIRED) &&
> +                   !(node->flags & GCT_FLAGS_EXCLUDED)) {
> +                       if (record) {
> +                               struct marvel_env_node *n =3D
> +                                       &data->nodes[data->nr_nodes];
> +
> +                               n->node =3D node;
> +                               n->offset =3D (char *)node - (char *)gct_=
node(0);
> +                               marvel_env_keys(n);
> +                       }
> +                       data->nr_nodes++;
> +               }
> +               if (node->child)
> +                       marvel_env_find_nodes(data, gct_node(node->child)=
,
> +                                             record);
> +       }
> +}
> +
> +static umode_t marvel_env_is_visible(const void *drvdata,
> +                                    enum hwmon_sensor_types type,
> +                                    u32 attr, int channel)
> +{
> +       const struct marvel_env_data *data =3D drvdata;
> +
> +       if (type =3D=3D hwmon_chip)
> +               return 0644;
> +
> +       /* Hide sensors that are absent when the driver loads. */
> +       return data->chans[type][channel].present ? 0444 : 0;
> +}
> +
> +/* Called with the hwmon device lock held, which serializes refreshes. *=
/
> +static int marvel_env_read(struct device *dev, enum hwmon_sensor_types t=
ype,
> +                          u32 attr, int channel, long *val)
> +{
> +       struct marvel_env_data *data =3D dev_get_drvdata(dev);
> +       struct marvel_env_chan *c;
> +       struct marvel_env_node *n;
> +       unsigned int pkt;
> +       u8 status;
> +       int ret;
> +
> +       if (type =3D=3D hwmon_chip) {
> +               *val =3D data->update_interval;
> +               return 0;
> +       }
> +
> +       c =3D &data->chans[type][channel];
> +       n =3D c->node;
> +       pkt =3D c->pkt;
> +
> +       ret =3D marvel_env_refresh(data, n);
> +       if (ret)
> +               return ret;
> +       status =3D marvel_env_status(type, c);
> +
> +       switch (type) {
> +       case hwmon_temp:
> +               switch (attr) {
> +               case hwmon_temp_max:
> +                       *val =3D (s32)env_rd(n, pkt + SENSOR_WARN) * 100L=
;
> +                       return 0;
> +               case hwmon_temp_crit:
> +                       *val =3D (s32)env_rd(n, pkt + SENSOR_FAIL) * 100L=
;
> +                       return 0;
> +               }
> +               break;
> +       case hwmon_fan:
> +               if (attr =3D=3D hwmon_fan_min) {
> +                       *val =3D env_rd(n, pkt + FAN_WARN);
> +                       return 0;
> +               }
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       if (!env_status_valid(status))
> +               return -ENODATA;
> +
> +       if (marvel_env_alarm_attrs[type] & BIT(attr)) {
> +               *val =3D !!(marvel_env_alarms(type, c, status) & BIT(attr=
));
> +               return 0;
> +       }
> +
> +       switch (type) {
> +       case hwmon_temp:
> +               if (attr !=3D hwmon_temp_input)
> +                       break;
> +               *val =3D (s32)env_rd(n, pkt + SENSOR_VALUE) * 100L;
> +               return 0;
> +       case hwmon_fan:
> +               if (attr !=3D hwmon_fan_input)
> +                       break;
> +               *val =3D env_rd(n, pkt + FAN_VALUE);
> +               return 0;
> +       case hwmon_in:
> +               if (attr !=3D hwmon_in_input)
> +                       break;
> +               *val =3D (s32)env_rd(n, pkt + SENSOR_VALUE);
> +               return 0;
> +       default:
> +               break;
> +       }
> +       return -EOPNOTSUPP;
> +}
> +
> +static int marvel_env_write(struct device *dev, enum hwmon_sensor_types =
type,
> +                           u32 attr, int channel, long val)
> +{
> +       struct marvel_env_data *data =3D dev_get_drvdata(dev);
> +
> +       if (type !=3D hwmon_chip || attr !=3D hwmon_chip_update_interval)
> +               return -EOPNOTSUPP;
> +
> +       data->update_interval =3D clamp_val(val, 0, 3600 * MSEC_PER_SEC);
> +       return 0;
> +}

At 0 every attribute read refreshes its node, which is up to 300 ms
with interrupts off on the boot CPU, so a single "sensors" run can take
seconds. A floor of, say, 1000 ms would prevent that.

> +
> +static int marvel_env_read_string(struct device *dev,
> +                                 enum hwmon_sensor_types type, u32 attr,
> +                                 int channel, const char **str)
> +{
> +       struct marvel_env_data *data =3D dev_get_drvdata(dev);
> +
> +       *str =3D data->chans[type][channel].label;
> +       return 0;
> +}
> +
> +static const struct hwmon_ops marvel_env_ops =3D {
> +       .is_visible =3D marvel_env_is_visible,
> +       .read =3D marvel_env_read,
> +       .write =3D marvel_env_write,
> +       .read_string =3D marvel_env_read_string,
> +};
> +
> +static u32 marvel_env_config(enum hwmon_sensor_types type,
> +                            const struct marvel_env_chan *c)
> +{
> +       switch (type) {
> +       case hwmon_temp:
> +               return HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_CRIT |
> +                      HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM | HWMON_T_L=
ABEL;
> +       case hwmon_fan:
> +               return HWMON_F_INPUT | HWMON_F_MIN | HWMON_F_MIN_ALARM |
> +                      HWMON_F_FAULT | HWMON_F_LABEL;
> +       case hwmon_in:
> +               if (c->ps)
> +                       return HWMON_I_FAULT | HWMON_I_LABEL;
> +               return HWMON_I_INPUT | HWMON_I_MIN_ALARM | HWMON_I_MAX_AL=
ARM |
> +                      HWMON_I_LCRIT_ALARM | HWMON_I_CRIT_ALARM | HWMON_I=
_LABEL;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static const struct hwmon_channel_info * const marvel_env_chip_info =3D
> +       HWMON_CHANNEL_INFO(chip, HWMON_C_UPDATE_INTERVAL);
> +
> +static int marvel_env_probe(struct platform_device *pdev)
> +{
> +       u32 *config[hwmon_max] =3D { };
> +       struct device *dev =3D &pdev->dev;
> +       const struct hwmon_channel_info **info;
> +       struct marvel_env_data *data;
> +       struct hwmon_chip_info *chip;
> +       struct device *hwmon;
> +       unsigned int i, k, nr_info =3D 0;
> +
> +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +       data->dev =3D dev;
> +       data->update_interval =3D 10 * MSEC_PER_SEC;
> +
> +       marvel_env_find_nodes(data, gct_node(0), false);
> +       if (!data->nr_nodes)
> +               return -ENODEV;
> +       data->nodes =3D devm_kcalloc(dev, data->nr_nodes, sizeof(*data->n=
odes),
> +                                  GFP_KERNEL);
> +       if (!data->nodes)
> +               return -ENOMEM;
> +       data->nr_nodes =3D 0;
> +       marvel_env_find_nodes(data, gct_node(0), true);
> +
> +       for (i =3D 0; i < data->nr_nodes; i++) {
> +               marvel_env_refresh(data, &data->nodes[i]);
> +               marvel_env_walk(data, &data->nodes[i], false);
> +       }
> +
> +       info =3D devm_kcalloc(dev, ARRAY_SIZE(marvel_env_types) + 2,
> +                           sizeof(*info), GFP_KERNEL);
> +       if (!info)
> +               return -ENOMEM;
> +       info[nr_info++] =3D marvel_env_chip_info;
> +
> +       for (k =3D 0; k < ARRAY_SIZE(marvel_env_types); k++) {
> +               enum hwmon_sensor_types type =3D marvel_env_types[k];
> +               struct hwmon_channel_info *ci;
> +
> +               if (!data->nr_chans[type])
> +                       continue;
> +               data->chans[type] =3D devm_kcalloc(dev, data->nr_chans[ty=
pe],
> +                                                sizeof(*data->chans[type=
]),
> +                                                GFP_KERNEL);
> +               ci =3D devm_kzalloc(dev, sizeof(*ci), GFP_KERNEL);
> +               config[type] =3D devm_kcalloc(dev, data->nr_chans[type] +=
 1,
> +                                           sizeof(*config[type]), GFP_KE=
RNEL);
> +               if (!data->chans[type] || !ci || !config[type])
> +                       return -ENOMEM;
> +               ci->type =3D type;
> +               ci->config =3D config[type];
> +               info[nr_info++] =3D ci;
> +               data->nr_chans[type] =3D 0;
> +       }
> +       if (nr_info =3D=3D 1)
> +               return -ENODEV;
> +
> +       for (i =3D 0; i < data->nr_nodes; i++)
> +               marvel_env_walk(data, &data->nodes[i], true);
> +
> +       for (k =3D 0; k < ARRAY_SIZE(marvel_env_types); k++) {
> +               enum hwmon_sensor_types type =3D marvel_env_types[k];
> +
> +               for (i =3D 0; i < data->nr_chans[type]; i++)
> +                       config[type][i] =3D marvel_env_config(type,
> +                                                           &data->chans[=
type][i]);
> +       }
> +
> +       chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;
> +       chip->ops =3D &marvel_env_ops;
> +       chip->info =3D info;
> +
> +       hwmon =3D devm_hwmon_device_register_with_info(dev, DRVNAME, data=
, chip,
> +                                                    NULL);
> +       return PTR_ERR_OR_ZERO(hwmon);
> +}
> +
> +static struct platform_driver marvel_env_driver =3D {
> +       .driver =3D {
> +               .name =3D DRVNAME,
> +       },
> +       .probe =3D marvel_env_probe,
> +};
> +module_platform_driver(marvel_env_driver);
> +
> +MODULE_ALIAS("platform:" DRVNAME);
> +MODULE_DESCRIPTION("Marvel (EV7) AlphaServer environmental sensors");
> +MODULE_LICENSE("GPL");
>
> --
> 2.56.1
>

Magnus
