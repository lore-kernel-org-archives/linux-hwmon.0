Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CAE3112BD
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 20:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772481640; cv=none; b=lMH50uWZ2B8q9ud4ybpvIxPQ1fMIfnVrGRwz1XIruSKuHD/LAlMBIiiwB97zzIlT5I3fsYnu8GLRYQQdguz59FzLQ6MCmIUt3un39o8J+2GFZ303h23gPO+JDWa0H0VH/z1cE/cH10pkG3gZv9hrQUJ1ftnxGd9/JC7pADNbuNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772481640; c=relaxed/simple;
	bh=DRYU/jEIZN1nRuZDfr0jFycQnGb1UlKl30D1rwR+UG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jKNh02oGxfCEwqftlAx6bMRG2q12i6JFWKNIEDEqEFHQT9GAX2OCwhIXIMeliqKSs43h1KdaHsDJHwTd/J/EHFn2D41tAUg/Qb+4nrUyvz/lRx5KgIsTaMctY6ALCvyHWiFjfyJcz/qhKxdyGINcKEMWSuUJHua95Q+B6/T+1IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxZ4VuT8; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxZ4VuT8"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2be19f05d7dso616217eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 12:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772481638; x=1773086438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oxAuMSjrSkVlrHzmV/zXr2kJSp6K3vzj9w3ts098SFc=;
        b=DxZ4VuT8F2qT8jcRNpBcwujG/OS0QV6wvDg4IxEnzkjr4PH/rY44+ZDX4ew2LqiLi2
         SQVJ/UjUv+poHR7NF2xVIMriRqT7/q6bHZKnx38yToawIuQoaqvOnd4kl6tnkykBfbaD
         IVJ8O4EHbXm5eWMTuWjjxCLVjK7EFkFViaEDeK37HvzixHKxWEaM1jlOOe1UOYFtMLgN
         mzkZVSy4sgFFsscD51bEi4Qs/+RcMAvFUQZR+2Y8HfU7UB3ivkd5kGIVYRV49Nb8GJv/
         pCEsYK5e1MXr+OEpJiuECB3/qEQgd/M7JRCuf8EtQCnDkf+ZXGKuuMGbl2+gQ5mKGQ85
         ASzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772481638; x=1773086438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oxAuMSjrSkVlrHzmV/zXr2kJSp6K3vzj9w3ts098SFc=;
        b=IT+YVhacKy8PMJX8QiuPszkLa53pHhPueyEFnyPT1d3uydNio9no3vgSXRX9NKUyFJ
         E3gf26z9cvPrhg54BcaKA9IZ5BWhDGgrZoDAjS/4uFC2+zkaQBnARNITSROi2tB8Jc8b
         BBiRJc0mFCs67cvyeRVADqWt42wArw+b+MI5/8DQ5blJAM1jmvV2F49IjHlBAWuLRFFU
         9WNbZKxQ4Uj1stXz+e0KYkDMBD10Z9yKrICTYKefb4FsA1xMYkYqgARv7FSvSftolO1I
         cPtcrFHInL2q4BTpVbFxSpl5cslv1tmDipwD4WC2Pq4NDn+uMKZnfU2gjMhNaG6G4J/7
         LK9w==
X-Forwarded-Encrypted: i=1; AJvYcCVDW3QSa5SoBEi5y06yoiZRH02xH1UANCOVgl6/Hpx82OCev+6tdZaWyLy6vyqCNZRyENPNxoyebnNziw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa3mtAOkMdkBAYQhqd2ERMsfenrAcXMTaT+tMa+TeSNxZqupVQ
	+6KTWDX4WLZjLW0hO/P6jXb2UQD3BpmnSf6EX8BgJEAQq9QJmJE2WgWn
X-Gm-Gg: ATEYQzxyxffron/Szyf84p7ZLxE3YlfKuMZd1OhIAn5qjcY7b3gyxapWbl+JVq2000T
	xfVhDqiJoxx7BHKQVDNuFTgdUI9U5kBMPVr3AxNz+gDdbQdlqZmgvf3HiFnhZdXZyPHP4RnVL51
	j/xSC3zo9rwsH4dz3B9KNLueutnZItS/6Mu5qwD6zaBGJWEt81HLge90WUvN8+ql0f3EMPV+FXz
	6+R1qQZReYgbKLBbFqAODWZMGls2+2CVgzu5J22nxgSTS1VPmjQpOo5L1VWpih7kaRCRr3RX3T2
	xTXU76szQrqaTmsyWCPu+vMmyRaLvFbhaqNSfh/+/DE/QkpWJKZFePBxcM2Dm1wudyKBiFrXNUv
	CsyzqOIREPRJ+D+JdDkYtkhjAQVRMSeeWXF2/UuhYehSCnA3bbhRvKlhjbCoJ653wO3pQXucPuu
	0MCBV0I7KmBno8916geIqoHpfp2xGyIDLwC9OSL81UY7ivXHPDbEqiM63WQZ23LU94ElqcQGjT
X-Received: by 2002:a05:7300:8cac:b0:2ba:956e:d26a with SMTP id 5a478bee46e88-2bde1d6e182mr5761978eec.36.1772481637215;
        Mon, 02 Mar 2026 12:00:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfed770d4sm5873036eec.17.2026.03.02.12.00.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 12:00:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ca8ac0bb-c21a-406a-a1fe-9f5aaa0d94ee@roeck-us.net>
Date: Mon, 2 Mar 2026 12:00:35 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add LattePanda Sigma EC driver
To: Mariano Abad <weimaraner@gmail.com>, linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260301023707.1184592-1-weimaraner@gmail.com>
 <20260302183514.3021503-1-weimaraner@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260302183514.3021503-1-weimaraner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/26 10:35, Mariano Abad wrote:
> The LattePanda Sigma is an x86 single-board computer made by DFRobot,
> featuring an Intel Core i5-1340P and an ITE IT8613E Embedded Controller
> that manages fan speed and thermal monitoring.
> 
> The BIOS declares the ACPI Embedded Controller (PNP0C09) with _STA
> returning 0 and provides only stub ECRD/ECWT methods. Since the kernel's
> ACPI EC subsystem never initializes, ec_read() is not available and
> direct port I/O to the standard ACPI EC ports (0x62/0x66) is used. As
> ACPI never accesses the EC, no ACPI Global Lock or namespace mutex is
> required.
> 
> The driver exposes:
>    - CPU fan speed (RPM, read-only)
>    - Board temperature (unsigned 8-bit, degrees Celsius)
>    - CPU proximity temperature (unsigned 8-bit, degrees Celsius)
> 
> DMI matching restricts the driver to verified LattePanda Sigma hardware
> with BIOS version 5.27. A 'force' module parameter allows loading on
> untested BIOS versions while still requiring vendor/product match.
> 
> The EC register map was discovered through firmware reverse engineering
> and confirmed by physical testing.
> 
This should not be part of the commit message.

Couple of additional comments below. Most importantly, there needs to
be some i/o address protection to help ensure that no other driver
accesses to IO port range. Presumably the ec driver should bail out
and not reserve the addresses for itself.

Thanks,
Guenter

> Signed-off-by: Mariano Abad <weimaraner@gmail.com>
> ---
> Changes in v2:
>   - Add entry to Documentation/hwmon/index.rst
>   - Move reverse engineering notes and ACPI explanation from .rst
>     into driver source comments
>   - Restrict DMI match to BIOS version 5.27; add 'force' module
>     parameter for untested versions
>   - Document why no ACPI lock is needed: DSDT analysis shows _STA
>     returns 0 and ECRD/ECWT are stubs, so firmware never accesses
>     the EC ports
>   - Remove driver mutex: the hwmon with_info API already serializes
>     all sysfs callbacks
>   - Keep udelay() for EC polling: usleep_range() was tested but
>     caused EC protocol failures; approach matches the kernel ACPI
>     EC driver (drivers/acpi/ec.c)
>   - Clarify temperature values are unsigned 8-bit
>   - Register platform driver before platform device
>   - Link to v1: https://lore.kernel.org/linux-hwmon/20260301023707.1184592-1-weimaraner@gmail.com/
>   Documentation/hwmon/index.rst               |   1 +
>   Documentation/hwmon/lattepanda-sigma-ec.rst |  61 ++++
>   MAINTAINERS                                 |   7 +
>   drivers/hwmon/Kconfig                       |  17 +
>   drivers/hwmon/Makefile                      |   1 +
>   drivers/hwmon/lattepanda-sigma-ec.c         | 329 ++++++++++++++++++++
>   6 files changed, 416 insertions(+)
>   create mode 100644 Documentation/hwmon/lattepanda-sigma-ec.rst
>   create mode 100644 drivers/hwmon/lattepanda-sigma-ec.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index d91dbb20c..dff283064 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -111,6 +111,7 @@ Hardware Monitoring Kernel Drivers
>      kbatt
>      kfan
>      lan966x
> +   lattepanda-sigma-ec
>      lineage-pem
>      lm25066
>      lm63
> diff --git a/Documentation/hwmon/lattepanda-sigma-ec.rst b/Documentation/hwmon/lattepanda-sigma-ec.rst
> new file mode 100644
> index 000000000..8a521ee1f
> --- /dev/null
> +++ b/Documentation/hwmon/lattepanda-sigma-ec.rst
> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver lattepanda-sigma-ec
> +=================================
> +
> +Supported systems:
> +
> +  * LattePanda Sigma (Intel 13th Gen i5-1340P)
> +
> +    DMI vendor: LattePanda
> +
> +    DMI product: LattePanda Sigma
> +
> +    BIOS version: 5.27 (verified)
> +
> +    Datasheet: Not available (EC registers discovered empirically)
> +
> +Author: Mariano Abad <weimaraner@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver provides hardware monitoring for the LattePanda Sigma
> +single-board computer made by DFRobot. The board uses an ITE IT8613E
> +Embedded Controller to manage a CPU cooling fan and thermal sensors.
> +
> +The BIOS declares the ACPI Embedded Controller (``PNP0C09``) with
> +``_STA`` returning 0, preventing the kernel's ACPI EC subsystem from
> +initializing. This driver reads the EC directly via the standard ACPI
> +EC I/O ports (``0x62`` data, ``0x66`` command/status).
> +
> +Sysfs attributes
> +----------------
> +
> +======================= ===============================================
> +``fan1_input``          Fan speed in RPM (EC registers 0x2E:0x2F,
> +                        16-bit big-endian)
> +``fan1_label``          "CPU Fan"
> +``temp1_input``         Board/ambient temperature in millidegrees
> +                        Celsius (EC register 0x60, unsigned)
> +``temp1_label``         "Board Temp"
> +``temp2_input``         CPU proximity temperature in millidegrees
> +                        Celsius (EC register 0x70, unsigned)
> +``temp2_label``         "CPU Temp"
> +======================= ===============================================
> +
> +Module parameters
> +-----------------
> +
> +``force`` (bool, default false)
> +    Force loading on BIOS versions other than 5.27. The driver still
> +    requires DMI vendor and product name matching.
> +
> +Known limitations
> +-----------------
> +
> +* Fan speed control is not supported. The fan is always under EC
> +  automatic control.
> +* The EC register map was verified only on BIOS version 5.27.
> +  Other versions may use different register offsets; use the ``force``
> +  parameter at your own risk.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96e97d25e..7b0c5bb5d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14414,6 +14414,13 @@ F:	drivers/net/wan/framer/
>   F:	drivers/pinctrl/pinctrl-pef2256.c
>   F:	include/linux/framer/
>   
> +LATTEPANDA SIGMA EC HARDWARE MONITOR DRIVER
> +M:	Mariano Abad <weimaraner@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/lattepanda-sigma-ec.rst
> +F:	drivers/hwmon/lattepanda-sigma-ec.c
> +
>   LASI 53c700 driver for PARISC
>   M:	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
>   L:	linux-scsi@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 41c381764..f2e2ee96f 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -990,6 +990,23 @@ config SENSORS_LAN966X
>   	  This driver can also be built as a module. If so, the module
>   	  will be called lan966x-hwmon.
>   
> +config SENSORS_LATTEPANDA_SIGMA_EC
> +	tristate "LattePanda Sigma EC hardware monitoring"
> +	depends on X86
> +	depends on DMI
> +	depends on HAS_IOPORT
> +	help
> +	  If you say yes here you get support for the hardware monitoring
> +	  features of the Embedded Controller on LattePanda Sigma
> +	  single-board computers, including CPU fan speed (RPM) and
> +	  board and CPU temperatures.
> +
> +	  The driver reads the EC directly via ACPI EC I/O ports and
> +	  uses DMI matching to ensure it only loads on supported hardware.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called lattepanda-sigma-ec.
> +
>   config SENSORS_LENOVO_EC
>           tristate "Sensor reader for Lenovo ThinkStations"
>           depends on X86
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index eade8e3b1..0372fedbb 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -114,6 +114,7 @@ obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
>   obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
>   obj-$(CONFIG_SENSORS_KFAN)	+= kfan.o
>   obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
> +obj-$(CONFIG_SENSORS_LATTEPANDA_SIGMA_EC) += lattepanda-sigma-ec.o
>   obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
>   obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
>   obj-$(CONFIG_SENSORS_LOCHNAGAR)	+= lochnagar-hwmon.o
> diff --git a/drivers/hwmon/lattepanda-sigma-ec.c b/drivers/hwmon/lattepanda-sigma-ec.c
> new file mode 100644
> index 000000000..2ba51a20d
> --- /dev/null
> +++ b/drivers/hwmon/lattepanda-sigma-ec.c
> @@ -0,0 +1,329 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for LattePanda Sigma EC.
> + *
> + * The LattePanda Sigma is an x86 SBC made by DFRobot with an ITE IT8613E
> + * Embedded Controller that manages a CPU fan and thermal sensors.
> + *
> + * The BIOS declares the ACPI Embedded Controller (PNP0C09) with _STA
> + * returning 0 and provides only stub ECRD/ECWT methods that return Zero
> + * for all registers. Since the kernel's ACPI EC subsystem never initializes,
> + * ec_read() is not available and direct port I/O to the standard ACPI EC
> + * ports (0x62/0x66) is used instead.
> + *
> + * Because ACPI never initializes the EC, there is no concurrent firmware
> + * access to these ports, and no ACPI Global Lock or namespace mutex is
> + * required. The hwmon with_info API serializes all sysfs callbacks,
> + * so no additional driver-level locking is needed.
> + *

If the io space is only used by this driver, it should be reserved,
either with request_muxed_region() while in use or permanently with
request_region() for both the command and data port to ensure that it
is used exclusively by this driver.

> + * The EC register map was discovered by dumping all 256 registers,
> + * identifying those that change in real-time, and validating by physically
> + * stopping the fan and observing the RPM register drop to zero. The map
> + * has been verified on BIOS version 5.27; other versions may differ.
> + *
> + * Copyright (c) 2026 Mariano Abad <weimaraner@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#define DRIVER_NAME	"lattepanda_sigma_ec"
> +
> +/* EC I/O ports (standard ACPI EC interface) */
> +#define EC_DATA_PORT	0x62
> +#define EC_CMD_PORT	0x66	/* also status port */
> +
> +/* EC commands */
> +#define EC_CMD_READ	0x80
> +
> +/* EC status register bits */
> +#define EC_STATUS_OBF	0x01	/* Output Buffer Full */
> +#define EC_STATUS_IBF	0x02	/* Input Buffer Full */
> +
> +/* EC register offsets for LattePanda Sigma (BIOS 5.27) */
> +#define EC_REG_FAN_RPM_HI	0x2E
> +#define EC_REG_FAN_RPM_LO	0x2F
> +#define EC_REG_TEMP_BOARD	0x60
> +#define EC_REG_TEMP_CPU		0x70
> +#define EC_REG_FAN_DUTY		0x93
> +
> +/*
> + * EC polling uses udelay() because the EC typically responds within a
> + * few microseconds. The kernel's own ACPI EC driver (drivers/acpi/ec.c)
> + * likewise uses udelay() for busy-polling with a per-poll delay of 550us.
> + *
> + * usleep_range() was tested but caused EC protocol failures: the EC
> + * clears its status flags within microseconds, and sleeping for 50-100us
> + * between polls allowed the flags to transition past the expected state.
> + *
> + * The worst-case total busy-wait of 25ms covers EC recovery after errors.
> + * In practice the EC responds within 10us so the loop exits immediately.
> + */
> +#define EC_TIMEOUT_US		25000
> +#define EC_POLL_US		1
> +
> +static bool force;
> +module_param(force, bool, 0444);
> +MODULE_PARM_DESC(force,
> +		 "Force loading on untested BIOS versions (default: false)");
> +
> +static struct platform_device *lps_ec_pdev;
> +
> +static int ec_wait_ibf_clear(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < EC_TIMEOUT_US; i++) {
> +		if (!(inb(EC_CMD_PORT) & EC_STATUS_IBF))
> +			return 0;
> +		udelay(EC_POLL_US);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int ec_wait_obf_set(void)
> +{
> +	int i;
> +
> +	for (i = 0; i < EC_TIMEOUT_US; i++) {
> +		if (inb(EC_CMD_PORT) & EC_STATUS_OBF)
> +			return 0;
> +		udelay(EC_POLL_US);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int ec_read_reg(u8 reg, u8 *val)
> +{
> +	int ret;
> +
> +	ret = ec_wait_ibf_clear();
> +	if (ret)
> +		return ret;
> +
> +	outb(EC_CMD_READ, EC_CMD_PORT);
> +
> +	ret = ec_wait_ibf_clear();
> +	if (ret)
> +		return ret;
> +
> +	outb(reg, EC_DATA_PORT);
> +
> +	ret = ec_wait_obf_set();
> +	if (ret)
> +		return ret;
> +
> +	*val = inb(EC_DATA_PORT);
> +	return 0;
> +}
> +
> +/* Read a 16-bit big-endian value from two consecutive EC registers. */
> +static int ec_read_reg16(u8 reg_hi, u8 reg_lo, u16 *val)
> +{
> +	int ret;
> +	u8 hi, lo;
> +
> +	ret = ec_read_reg(reg_hi, &hi);
> +	if (ret)
> +		return ret;
> +
> +	ret = ec_read_reg(reg_lo, &lo);
> +	if (ret)
> +		return ret;
> +
> +	*val = ((u16)hi << 8) | lo;
> +	return 0;
> +}
> +
> +static int
> +lps_ec_read_string(struct device *dev,
> +		   enum hwmon_sensor_types type,
> +		   u32 attr, int channel,
> +		   const char **str)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		*str = "CPU Fan";
> +		return 0;
> +	case hwmon_temp:
> +		*str = channel == 0 ? "Board Temp" : "CPU Temp";
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static umode_t
> +lps_ec_is_visible(const void *drvdata,
> +		  enum hwmon_sensor_types type,
> +		  u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		if (attr == hwmon_fan_input || attr == hwmon_fan_label)
> +			return 0444;
> +		break;
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_input || attr == hwmon_temp_label)
> +			return 0444;
> +		break;
> +	default:
> +		break;
> +	}
> +	return 0;
> +}
> +
> +static int
> +lps_ec_read(struct device *dev,
> +	    enum hwmon_sensor_types type,
> +	    u32 attr, int channel, long *val)
> +{
> +	u16 rpm;
> +	u8 v;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		if (attr != hwmon_fan_input)
> +			return -EOPNOTSUPP;
> +		ret = ec_read_reg16(EC_REG_FAN_RPM_HI,
> +				    EC_REG_FAN_RPM_LO, &rpm);
> +		if (ret)
> +			return ret;
> +		*val = rpm;
> +		return 0;
> +
> +	case hwmon_temp:
> +		if (attr != hwmon_temp_input)
> +			return -EOPNOTSUPP;
> +		ret = ec_read_reg(channel == 0 ? EC_REG_TEMP_BOARD
> +					       : EC_REG_TEMP_CPU,
> +				  &v);
> +		if (ret)
> +			return ret;
> +		/* EC reports unsigned 8-bit temperature in degrees Celsius */
> +		*val = (unsigned long)v * 1000;
> +		return 0;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_channel_info * const lps_ec_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops lps_ec_ops = {
> +	.is_visible = lps_ec_is_visible,
> +	.read = lps_ec_read,
> +	.read_string = lps_ec_read_string,
> +};
> +
> +static const struct hwmon_chip_info lps_ec_chip_info = {
> +	.ops = &lps_ec_ops,
> +	.info = lps_ec_info,
> +};
> +
> +static int lps_ec_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *hwmon;
> +	u8 test;
> +	int ret;
> +
> +	/* Sanity check: verify EC is responsive */
> +	ret = ec_read_reg(EC_REG_FAN_DUTY, &test);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "EC not responding on ports 0x%x/0x%x\n",
> +				     EC_DATA_PORT, EC_CMD_PORT);
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, DRIVER_NAME, NULL,
> +						     &lps_ec_chip_info, NULL);
> +	if (IS_ERR(hwmon))
> +		return dev_err_probe(dev, PTR_ERR(hwmon),
> +				     "Failed to register hwmon device\n");
> +
> +	dev_info(dev, "EC hwmon registered (fan duty: %u%%)\n", test);
> +	return 0;
> +}
> +
> +/* DMI table with strict BIOS version match (override with force=1) */
> +static const struct dmi_system_id lps_ec_dmi_table[] = {
> +	{
> +		.ident = "LattePanda Sigma",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LattePanda"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "LattePanda Sigma"),
> +			DMI_MATCH(DMI_BIOS_VERSION, "5.27"),
> +		},
> +	},
> +	{ }	/* terminator */
> +};
> +MODULE_DEVICE_TABLE(dmi, lps_ec_dmi_table);
> +
> +/* Loose table (vendor + product only) for use with force=1 */
> +static const struct dmi_system_id lps_ec_dmi_table_force[] = {
> +	{
> +		.ident = "LattePanda Sigma",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LattePanda"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "LattePanda Sigma"),
> +		},
> +	},
> +	{ }	/* terminator */
> +};
> +
> +static struct platform_driver lps_ec_driver = {
> +	.probe	= lps_ec_probe,
> +	.driver	= {
> +		.name = DRIVER_NAME,
> +	},
> +};
> +
> +static int __init lps_ec_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(lps_ec_dmi_table)) {
> +		if (!force || !dmi_check_system(lps_ec_dmi_table_force))
> +			return -ENODEV;
> +		pr_warn("%s: BIOS version not verified, loading due to force=1\n",
> +			DRIVER_NAME);
> +	}
> +
> +	ret = platform_driver_register(&lps_ec_driver);
> +	if (ret)
> +		return ret;
> +
> +	lps_ec_pdev = platform_device_register_simple(DRIVER_NAME, -1,
> +						       NULL, 0);

CHECK: Alignment should match open parenthesis
#605: FILE: drivers/hwmon/lattepanda-sigma-ec.c:309:
+	lps_ec_pdev = platform_device_register_simple(DRIVER_NAME, -1,
+						       NULL, 0);

> +	if (IS_ERR(lps_ec_pdev)) {
> +		platform_driver_unregister(&lps_ec_driver);
> +		return PTR_ERR(lps_ec_pdev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit lps_ec_exit(void)
> +{
> +	platform_device_unregister(lps_ec_pdev);
> +	platform_driver_unregister(&lps_ec_driver);
> +}
> +
> +module_init(lps_ec_init);
> +module_exit(lps_ec_exit);
> +
> +MODULE_AUTHOR("Mariano Abad <weimaraner@gmail.com>");
> +MODULE_DESCRIPTION("Hardware monitoring driver for LattePanda Sigma EC");
> +MODULE_LICENSE("GPL");

