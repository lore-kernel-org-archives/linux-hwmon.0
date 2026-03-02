Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96AB800
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 00:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772412135; cv=none; b=I63lS2UIafhCgqauC/PDcmGVg4zivl784OQjBSTI5XWSgY6rEUe25ogroPj21sOVToVfV1gpr9KmLuOy8l6T6cM+TmjRh8wuYZJ/VCgzSVgbdCcu9SPIedUCQW2XPlLLVzHWXmVXGQIgbrHuZZQvjxL3ArnY95KF/fJ9++x8a+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772412135; c=relaxed/simple;
	bh=yyExWpLuknM2uJ2nmerZDioezhloXts7rEobI5EUgE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jxPO04tb3/yOrtFg/kZ975uqEqSEn4uk7TnC07q+VCLdZRmLDshzASx4oDXagpGu7xc8mifgpCAW0gH5Wf0Z7Kzkw94Uu2FsdDR1dSalqEemsWdaHINQ3nxYrUeEMmGC+kFH27UR2IhPeUm7JoyJkHYFADPzIoNu7Hvw9dYtKbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjTQbg/I; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjTQbg/I"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bdbd13ca01so1912767eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Mar 2026 16:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772412132; x=1773016932; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+H9l1cqEWf/M0lHlufrxTM81iwnXge2LCpe7LTr8HY=;
        b=KjTQbg/I5UiXE1d5TROjPkd7YLZ3VZ/oSm/r6+SL8jW1n+G3j1UBADbWAsO4dWMFyt
         8CTpZ2VAEAL7M/ZDDBSPAl0iaQnxMBxtJ36D8B8jviFzRCpHebwLx3pMwPdhgNii4biQ
         +0spwwzLVRl9C/MQaJGa0XY3w9ZloMZHm/L8fMlw3Wo9+Xoz0N16jLVHjJveyA2te3vB
         JjLVoDbGz/ZAUurUXPAhl4xhWtaAopxq1bNqwsyGf3RAG9F9E1mL7vs7PRP5n4XoN6ok
         wLzHrMgUC/huNMrDO+Ti2WrDC2GrP1RHp2oW90W37B2pHn25kcwXSoav5lH3bDooFHDo
         XXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772412132; x=1773016932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+H9l1cqEWf/M0lHlufrxTM81iwnXge2LCpe7LTr8HY=;
        b=T4csXutNbc2FhOs8cAbceKA6UctOTXNE+ONLpjnb01yDBI+7wXnGSxMRsp8cLXCG3k
         QxOA45d2wnCYU7QSKbzjoOcQWlpXpoLpS2je+8MljcP+GL8Hc7kxmgoIje5S1KabC1QJ
         qLK6w8i9+HhGTalkwcGZzS4SWrSfXfzLUeZ3oGCcf3L6muhBeAPK+J6LTcGJaozkwpJo
         kw20Dh4Lxi1TjPpZ4APPu/A5HDp+p9xxE5AHrAwwr0YBQXZEzUr5HHhZE6zFAjf8NW8I
         jHXGfprhpnZf0vz22L9Ulr/RWc4VMbIIHZPFrw5qvqxvw3nf7TAIgQMYpFSQzu7ARw84
         p9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8oG7oNvuiP6e6BJ5b3wvgyiRgZUcLexkacgbA+7UjMm7txC8AVRHyUhGYw8BfF7EZ4qGeT9LVgUZUdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YypKYblwVcXUCVmQXYbizfxa/jzlVCiu4THxQABiZwnFhiLfJFH
	nvFH9bwUYn9Vzwh0DOjBPVHEpMA8w61ySDfq5E57dxxgwqVqjCnMYuBe
X-Gm-Gg: ATEYQzwzN/tISzeLwVjdRpv41DntSLxAv2ug1IcmhloF8WWi5Lsu2EQLwnNGXYjtwN7
	V8xv8CH0eZlfkMxMUzxcOIqJW5h9VMFJeXmeKtlednGoJLJ+o5M6/lLTu83r9IpMujcags7cBrC
	3LbJe1N1ne+2DOEhWuU1QEVHNqJxG40K7uSDFQWgi4C96n6n06subnS5PTAjRaaAZEBxdwIOeh7
	wDX2GZlMeu7DcfXdVcui57J9ZqulNO+UcWsSuRVwSr1BhHIVoACQ1KhlGMo7XHPW8jVhZLpIzBM
	ZUG/mtIArlm3eqAiOGUvDOmDin8spucgjMEuNwnifu5RHtEszApIDig29UmcTke+fF50gB7r4eo
	bKSW/75Z64bAo7wZFmHRA1/fL0dsHplgTgERvVHRckHPkIkPaj0weZja/acmQW3qQvg+tF7QG1Q
	46tq4QSNdsHUaXMazduVrGLLqJkCp1dXuKXfuN9w2jlqjTH0kffLvwqVBQgYZviM+xLSQz0oudI
	tFDtZbYk0o=
X-Received: by 2002:a05:693c:3109:b0:2be:9d3:c8c5 with SMTP id 5a478bee46e88-2be09d3cfa2mr1064863eec.34.1772412131689;
        Sun, 01 Mar 2026 16:42:11 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be09bc9ec4sm2525668eec.24.2026.03.01.16.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 16:42:10 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b6f9268b-ca4d-4ca0-838c-f661323d1b54@roeck-us.net>
Date: Sun, 1 Mar 2026 16:42:09 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add LattePanda Sigma EC driver
To: Mariano Abad <weimaraner@gmail.com>, linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260301023707.1184592-1-weimaraner@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260301023707.1184592-1-weimaraner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/26 18:37, Mariano Abad wrote:
> The LattePanda Sigma is an x86 single-board computer made by DFRobot,
> featuring an Intel Core i5-1340P and an ITE IT8613E Embedded Controller
> that manages fan speed and thermal monitoring.
> 
> The BIOS declares the ACPI Embedded Controller as disabled (_STA returns
> 0), so standard Linux hwmon interfaces do not expose the EC sensors.
> This driver reads the EC directly via the ACPI EC I/O ports (0x62/0x66)
> to provide:
>    - CPU fan speed (RPM)
>    - Board temperature
>    - CPU proximity temperature
> 
> The driver uses DMI matching and only loads on verified LattePanda Sigma
> hardware. Fan speed is controlled autonomously by the EC firmware and is
> read-only from the host.
> 
> The EC register map was discovered through firmware reverse engineering
> and confirmed by physical testing (stopping the fan, observing RPM drop
> to zero).
> 
> Signed-off-by: Mariano Abad <weimaraner@gmail.com>
> ---
>   Documentation/hwmon/lattepanda-sigma-ec.rst |  64 ++++
>   MAINTAINERS                                 |   7 +
>   drivers/hwmon/Kconfig                       |  17 +
>   drivers/hwmon/Makefile                      |   1 +
>   drivers/hwmon/lattepanda-sigma-ec.c         | 328 ++++++++++++++++++++
>   5 files changed, 417 insertions(+)
>   create mode 100644 Documentation/hwmon/lattepanda-sigma-ec.rst

Needs to be added to Documentation/hwmon/index.rst.

>   create mode 100644 drivers/hwmon/lattepanda-sigma-ec.c
> 
> diff --git a/Documentation/hwmon/lattepanda-sigma-ec.rst b/Documentation/hwmon/lattepanda-sigma-ec.rst
> new file mode 100644
> index 000000000..e8bc9a71e
> --- /dev/null
> +++ b/Documentation/hwmon/lattepanda-sigma-ec.rst
> @@ -0,0 +1,64 @@
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
> +    Datasheet: Not available (EC registers discovered empirically)
> +
> +Author: Mariano Abad <weimaraner@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver provides hardware monitoring for the LattePanda Sigma
> +single-board computer. The board's Embedded Controller manages a CPU
> +cooling fan but does not expose sensor data through standard ACPI
> +interfaces.
> +
> +The BIOS declares the ACPI Embedded Controller (``PNP0C09``) with
> +``_STA`` returning 0 (not present), preventing the kernel's ACPI EC
> +subsystem from initializing. However, the EC hardware is fully
> +functional on the standard ACPI EC I/O ports (``0x62`` data, ``0x66``
> +command/status). This driver uses direct port I/O with EC read command
> +``0x80`` to access sensor registers.
> +
> +The EC register map was discovered empirically by dumping all 256
> +registers, identifying those that change in real-time, then validating
> +by physically stopping the fan and observing the RPM drop to zero.
> +

This should be a comment in the driver source code, not here,
explaining why the ACPI API function (specifically ec_read()) is not
used/usable.

> +The driver uses DMI matching and will only load on LattePanda Sigma
> +hardware.
> +
> +Sysfs attributes
> +----------------
> +
> +======================= ===============================================
> +``fan1_input``          Fan speed in RPM (EC registers 0x2E:0x2F,
> +                        16-bit big-endian)
> +``fan1_label``          "CPU Fan"
> +``temp1_input``         Board/ambient temperature in millidegrees
> +                        Celsius (EC register 0x60)
> +``temp1_label``         "Board Temp"
> +``temp2_input``         CPU proximity temperature in millidegrees
> +                        Celsius (EC register 0x70)
> +``temp2_label``         "CPU Temp"
> +======================= ===============================================
> +
> +Known limitations
> +-----------------
> +
> +* The EC register map was reverse-engineered on a LattePanda Sigma with
> +  BIOS version 5.27. Different BIOS versions may use different register
> +  offsets.

That soulds kind of scary. It might be prudent to limit support to that
BIOS version and provide a force module parameter to override it.

> +* Fan speed control is not supported. The fan is always under EC
> +  automatic control.
> +* The I/O ports ``0x62``/``0x66`` are shared with the ACPI EC subsystem
> +  and are not exclusively reserved by this driver.

That pretty much directly contradicts the information above, which suggests
that ACPI is not active. Please move that comment and this one into the
driver because it is associated with the implementation.

Either case, if ACPI _is_ active, this will likely cause conflicts with
the ACPI code accessing the same registers. Worst case, this could result
in crashes or even damaged hardware if writes into the EC interfer with
operations setting the register address by this driver.

Is there maybe some other ACPI ID (besides PNP0C09) that can be used
(and maybe even is used to access/provide sensor data to Windows) ?

It may also be necessary to find and use an ACPI mutex/lock to prevent
parallel access from ACPI code. The asus-ec-sensors driver may provide
some guidance on how to do that.

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
> index 000000000..60558e449
> --- /dev/null
> +++ b/drivers/hwmon/lattepanda-sigma-ec.c
> @@ -0,0 +1,328 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for LattePanda Sigma EC.
> + *
> + * Reads fan RPM and temperatures from the Embedded Controller via
> + * ACPI EC I/O ports (0x62 data, 0x66 cmd/status). The BIOS reports
> + * the ACPI EC as disabled (_STA=0), so direct port I/O is used.
> + *
> + * Copyright (c) 2026 Mariano Abad <weimaraner@gmail.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
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
> +/* EC register offsets for LattePanda Sigma */
> +#define EC_REG_FAN_RPM_HI	0x2E
> +#define EC_REG_FAN_RPM_LO	0x2F
> +#define EC_REG_TEMP1		0x60
> +#define EC_REG_TEMP2		0x70
> +#define EC_REG_FAN_DUTY		0x93
> +
> +/* Timeout for EC operations (in microseconds) */
> +#define EC_TIMEOUT_US		25000
> +#define EC_POLL_INTERVAL_US	5
> +
> +struct lattepanda_sigma_ec_data {
> +	struct mutex lock;	/* serialize EC access */
> +};

The hardware monitoring subsystem provides locking for drivers using
the with_info API. I do not immediately see why another level of
locking would be needed for this driver.

> +
> +static struct platform_device *lps_ec_pdev;
> +
> +static int ec_wait_ibf_clear(void)
> +{
> +	int timeout = EC_TIMEOUT_US / EC_POLL_INTERVAL_US;
> +
> +	while (timeout--) {
> +		if (!(inb(EC_CMD_PORT) & EC_STATUS_IBF))
> +			return 0;
> +		udelay(EC_POLL_INTERVAL_US);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int ec_wait_obf_set(void)
> +{
> +	int timeout = EC_TIMEOUT_US / EC_POLL_INTERVAL_US;
> +
> +	while (timeout--) {
> +		if (inb(EC_CMD_PORT) & EC_STATUS_OBF)
> +			return 0;
> +		udelay(EC_POLL_INTERVAL_US);
> +	}

This results in up to 25 ms "hot" loop, blocking a CPU core.
If using ec_read() is not possible, you should consider using a longer
per-loop timeout and use usleep_range() to avoid the hot loop.

> +	return -ETIMEDOUT;
> +}
> +
> +static int ec_read_reg(struct lattepanda_sigma_ec_data *data, u8 reg, u8 *val)
> +{
> +	int ret;
> +
> +	mutex_lock(&data->lock);
> +
> +	ret = ec_wait_ibf_clear();
> +	if (ret)
> +		goto out;
> +
> +	outb(EC_CMD_READ, EC_CMD_PORT);
> +
> +	ret = ec_wait_ibf_clear();
> +	if (ret)
> +		goto out;
> +
> +	outb(reg, EC_DATA_PORT);
> +
> +	ret = ec_wait_obf_set();
> +	if (ret)
> +		goto out;
> +
> +	*val = inb(EC_DATA_PORT);
> +
> +out:
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
> +
> +/*
> + * Read a 16-bit big-endian value from two consecutive EC registers.
> + * Both bytes are read within a single mutex hold to prevent tearing.
> + */
> +static int ec_read_reg16(struct lattepanda_sigma_ec_data *data,
> +			 u8 reg_hi, u8 reg_lo, u16 *val)
> +{
> +	int ret;
> +	u8 hi, lo;
> +
> +	mutex_lock(&data->lock);
> +
> +	/* Read high byte */
> +	ret = ec_wait_ibf_clear();
> +	if (ret)
> +		goto out;
> +	outb(EC_CMD_READ, EC_CMD_PORT);
> +	ret = ec_wait_ibf_clear();
> +	if (ret)
> +		goto out;
> +	outb(reg_hi, EC_DATA_PORT);
> +	ret = ec_wait_obf_set();
> +	if (ret)
> +		goto out;
> +	hi = inb(EC_DATA_PORT);
> +
> +	/* Read low byte */
> +	ret = ec_wait_ibf_clear();
> +	if (ret)
> +		goto out;
> +	outb(EC_CMD_READ, EC_CMD_PORT);
> +	ret = ec_wait_ibf_clear();
> +	if (ret)
> +		goto out;
> +	outb(reg_lo, EC_DATA_PORT);
> +	ret = ec_wait_obf_set();
> +	if (ret)
> +		goto out;
> +	lo = inb(EC_DATA_PORT);
> +
> +	*val = ((u16)hi << 8) | lo;
> +
> +out:
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
> +
> +static int
> +lattepanda_sigma_ec_read_string(struct device *dev,
> +				enum hwmon_sensor_types type,
> +				u32 attr, int channel,
> +				const char **str)
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
> +lattepanda_sigma_ec_is_visible(const void *drvdata,
> +			       enum hwmon_sensor_types type,
> +			       u32 attr, int channel)
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
> +lattepanda_sigma_ec_read(struct device *dev,
> +			 enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long *val)
> +{
> +	struct lattepanda_sigma_ec_data *data = dev_get_drvdata(dev);
> +	u16 rpm;
> +	u8 v;
> +	int ret;
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		if (attr != hwmon_fan_input)
> +			return -EOPNOTSUPP;
> +		ret = ec_read_reg16(data, EC_REG_FAN_RPM_HI,
> +				    EC_REG_FAN_RPM_LO, &rpm);
> +		if (ret)
> +			return ret;
> +		*val = rpm;
> +		return 0;
> +
> +	case hwmon_temp:
> +		if (attr != hwmon_temp_input)
> +			return -EOPNOTSUPP;
> +		ret = ec_read_reg(data,
> +				  channel == 0 ? EC_REG_TEMP1 : EC_REG_TEMP2,
> +				  &v);
> +		if (ret)
> +			return ret;
> +		/* hwmon temps are in millidegrees Celsius */
> +		*val = (long)v * 1000;

Is the temperature signed or unsigned ?

> +		return 0;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct hwmon_channel_info * const lattepanda_sigma_ec_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_LABEL,
> +			   HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops lattepanda_sigma_ec_ops = {
> +	.is_visible = lattepanda_sigma_ec_is_visible,
> +	.read = lattepanda_sigma_ec_read,
> +	.read_string = lattepanda_sigma_ec_read_string,
> +};
> +
> +static const struct hwmon_chip_info lattepanda_sigma_ec_chip_info = {
> +	.ops = &lattepanda_sigma_ec_ops,
> +	.info = lattepanda_sigma_ec_info,
> +};
> +
> +static int lattepanda_sigma_ec_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct lattepanda_sigma_ec_data *data;
> +	struct device *hwmon;
> +	u8 test;
> +	int ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mutex_init(&data->lock);
> +	platform_set_drvdata(pdev, data);
> +
> +	/* Sanity check: verify EC is responsive */
> +	ret = ec_read_reg(data, EC_REG_FAN_DUTY, &test);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "EC not responding on ports 0x%x/0x%x\n",
> +				     EC_DATA_PORT, EC_CMD_PORT);
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, DRIVER_NAME, data,
> +						     &lattepanda_sigma_ec_chip_info,
> +						     NULL);
> +	if (IS_ERR(hwmon))
> +		return dev_err_probe(dev, PTR_ERR(hwmon),
> +				     "Failed to register hwmon device\n");
> +
> +	dev_dbg(dev, "EC hwmon registered (fan duty: %u%%)\n", test);
> +	return 0;
> +}
> +
> +static const struct dmi_system_id lattepanda_sigma_ec_dmi_table[] = {
> +	{
> +		.ident = "LattePanda Sigma",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LattePanda"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "LattePanda Sigma"),
> +		},
> +	},
> +	{ }	/* terminator */
> +};
> +MODULE_DEVICE_TABLE(dmi, lattepanda_sigma_ec_dmi_table);
> +
> +static struct platform_driver lattepanda_sigma_ec_driver = {
> +	.probe	= lattepanda_sigma_ec_probe,
> +	.driver	= {
> +		.name = DRIVER_NAME,
> +	},
> +};
> +
> +static int __init lattepanda_sigma_ec_init(void)
> +{
> +	int ret;
> +
> +	if (!dmi_check_system(lattepanda_sigma_ec_dmi_table))
> +		return -ENODEV;
> +
> +	lps_ec_pdev = platform_device_register_simple(DRIVER_NAME, -1, NULL, 0);
> +	if (IS_ERR(lps_ec_pdev))
> +		return PTR_ERR(lps_ec_pdev);
> +
> +	ret = platform_driver_register(&lattepanda_sigma_ec_driver);
> +	if (ret) {
> +		platform_device_unregister(lps_ec_pdev);
> +		return ret;
> +	}

It is quite unusual to register the device first, followed by the driver.
All other hardware monitoring drivers register the driver first, followed
by the device, and that order makes much more sense to me.

Is there a specific reason for reversing the order ? If so, please provide
a detailed explanation as comment. Otherwise please register the driver first.

Thanks,
Guenter

