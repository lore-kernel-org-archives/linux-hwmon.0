Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B55310647
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 20:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248066; cv=none; b=LwNdizHZ2XyaDW1kG103wPi5q/2NjVmAcaU0MPqXd0K/GFOuqpuGLveS6racH8rddLaJQY/sQCZyYjrGtYWPM8cT3WXoWPaximNDQ4ofIw+YWo+ftD6GtnoibqEqZnxmcyj3tAEn0+qUEEm1IPhAmdCRXOJdXnqvmHegqbQ7OAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248066; c=relaxed/simple;
	bh=B9pZ3RitWRtUcu44EDdbISm0j3g7TdRLwbxqFMq4lDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+EfH/ErERAR+y9mbZ5ktgLgntVgDYX4u0tvH9K8CBA/AFGoi//pEf+QU2oNUWO8lbUSW6PVRGmPxd938MyW8/Ht3qG/KmOgsjmdrw3UD5Iv2/DvUkXh2f+Pnk9CukBhQr/oDZqIcqePNqlxff2BH6ywVgUP12brfWn+sgPXeAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eu6vWTHo; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eu6vWTHo"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b04fcfc0daso6928310eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 12:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768248063; x=1768852863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YyPwtZUyfv87v/UoHK+TFFTP6bT/3Wl/2L0eJynjZmo=;
        b=eu6vWTHot7OPnZI9rztunAc53eLgUNzqXTXJEBfQbd8ragVhwCNDg0aSG1lLbJbFWx
         AWSf0x8iqd1K81/bbl9PcWtewke4N7S9PB2ND4idmJolFPshwrcJnob1wZPVgz9WYhIl
         nycachm64hNsIpijkvHh+nva+cKHZ2aueoomQYJz01fkoqgpZPt1u8j2hWFpzGNMjJ+d
         zMH5A/+aW+o8i5nS5F7F0WZvXqsWhBrrZtolywLDdZ0Evl+47A9c+QLsCd9o0hGOJsox
         z/7LSltqCV9xFCimE/pSqSoo+Nsg/wJaGy+7RpExB2EH6oDa5HtkW3TOEW1x999UdVSJ
         OliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768248063; x=1768852863;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YyPwtZUyfv87v/UoHK+TFFTP6bT/3Wl/2L0eJynjZmo=;
        b=bnxppTnhew8M8/0zSOLoFBHky0JEMhdtahjLB2QbRw+pOTlHu7jXaB6vIeN3XUqjUM
         Luu8N3zluHlWe5vDcKZJWkpQsblxiPsN5U5+PAcVGcLak557go4VRrRs4nwdOlrznd9L
         uazn8KNzHovISGLojBqNq0pnMQDZwzZ0TlLH+i/SSiS/6CoOUdndw+tbykZpwcKugxvE
         xFbxOtXKCZbkabS4CE6gHscrafNFqPsoWEOGMvELCOdM+9NoeF4M59fNJc7/sKk1oWBa
         7Zd3z4Sbsw578fJO4BZFVK0M7xcfcO5aKk6wjJW1vWZBjjKg6fK26rMsvG7YLGh2iaAc
         LvXA==
X-Forwarded-Encrypted: i=1; AJvYcCWC15LLRTF1PsFfsdqnlBEXv0/NXGBpQLZbPDWJ420AbvNpW+MQ36UZN22aY3aoYPCtt+jJvHVbCn0Gig==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFLPXIKxvrbEU5lVefVC096xW32Yk4wVnz5ZCcaR8fJZDmDiD0
	rqGkC4HTWA1FborYlqchNJa1mlcZtMDJ3ZfCndDJ9Ko9xLxsripHKAoE
X-Gm-Gg: AY/fxX4E/nWKS9iG/SCGO++LBRGpthnrD93nYcPGlJG8GHquEkykoL3fZEec0OoAMVE
	JBH9LwIB3ywjzY1b6HEor9MT1r+XnXTKP81oYC5SDdKdZqePcZnyh91Q9mlIoa0bJ9nVouzh2TG
	6i4u8QWHHg/LP11mNCw6nHnOmX0CMwQLt3jkQX2rjkiTDdTJ/rjynNCyrMeb/BER6cyAWTIDya3
	MDotLGnumoP/WhHpAWOVSh8jJvuscV90/k0vVM7Aj7NH/P6PpCa9ANHQvXGbdy7QA9+7v8O1deV
	1QUjGABOOxCdzkyX+HTphTaHuL94rX2sjLckrbq28Gul4+L0RuVhX0bSuZfeXixI8TOrxMM8jR0
	HodTeTERanRZxYx0Qb7V97Lw/tsuCAyj0uQ4aQQRfo5bgYeRtlqyJvWwa1XkGeTMexAlu58y4t3
	lyLeZM1wa29hXBCJy60AO1neHY
X-Google-Smtp-Source: AGHT+IHS8A9lAYeLtKim0bs5mqJl/jIEYZuwUQmtooPpH0NDA8I+WPBwcFgLCk72AMnWDczJITBI9Q==
X-Received: by 2002:a05:7300:4785:b0:2b0:4c30:53b8 with SMTP id 5a478bee46e88-2b17d238bcfmr16565729eec.2.1768248062709;
        Mon, 12 Jan 2026 12:01:02 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm16899689eec.2.2026.01.12.12.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 12:01:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 12:01:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: hehuan1@eswincomputing.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com,
	weishangjuan@eswincomputing.com
Subject: Re: [PATCH v1 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Message-ID: <592de73c-e1c9-4f1e-92c5-81dc17e1901b@roeck-us.net>
References: <20260109090718.442-1-hehuan1@eswincomputing.com>
 <20260109090929.567-1-hehuan1@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109090929.567-1-hehuan1@eswincomputing.com>

On Fri, Jan 09, 2026 at 05:09:29PM +0800, hehuan1@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
> 
> Add support for ESWIN EIC7700 Process, Voltage and Temperature sensor. The
> driver supports temperature and voltage monitoring with polynomial
> conversion, and provides sysfs interface for sensor data access.
> 
> The PVT IP contains one temperature sensor and four voltage sensors for
> process variation monitoring.
> 
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> ---
>  drivers/hwmon/Kconfig       |  12 +
>  drivers/hwmon/Makefile      |   1 +
>  drivers/hwmon/eic7700-pvt.c | 797 ++++++++++++++++++++++++++++++++++++
>  drivers/hwmon/eic7700-pvt.h | 128 ++++++
>  4 files changed, 938 insertions(+)
>  create mode 100644 drivers/hwmon/eic7700-pvt.c
>  create mode 100644 drivers/hwmon/eic7700-pvt.h
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 157678b821fc..de04ef41bcd9 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2043,6 +2043,18 @@ config SENSORS_DME1737
>  	  This driver can also be built as a module. If so, the module
>  	  will be called dme1737.
>  
> +config SENSORS_EIC7700_PVT
> +	tristate "Eswin EIC7700 Process, Voltage, Temperature sensor driver"
> +	depends on ARCH_ESWIN || COMPILE_TEST
> +	depends on HWMON
> +	select POLYNOMIAL
> +	help
> +	  If you say yes here you get support for Eswin EIC7700 PVT sensor
> +	  embedded into the SoC.
> +
> +	  This driver can also be built as a module. If so, the module will be
> +	  called eic7700-pvt.
> +
>  config SENSORS_EMC1403
>  	tristate "SMSC EMC1403/23 thermal sensor"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index eade8e3b1bde..1b2845bd5a54 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -72,6 +72,7 @@ obj-$(CONFIG_SENSORS_DME1737)	+= dme1737.o
>  obj-$(CONFIG_SENSORS_DRIVETEMP)	+= drivetemp.o
>  obj-$(CONFIG_SENSORS_DS620)	+= ds620.o
>  obj-$(CONFIG_SENSORS_DS1621)	+= ds1621.o
> +obj-$(CONFIG_SENSORS_EIC7700_PVT) += eic7700-pvt.o
>  obj-$(CONFIG_SENSORS_EMC1403)	+= emc1403.o
>  obj-$(CONFIG_SENSORS_EMC2103)	+= emc2103.o
>  obj-$(CONFIG_SENSORS_EMC2305)	+= emc2305.o
> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
> new file mode 100644
> index 000000000000..ade44f3a126f
> --- /dev/null
> +++ b/drivers/hwmon/eic7700-pvt.c
> @@ -0,0 +1,797 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ESWIN EIC7700 Process, Voltage, Temperature sensor driver
> + *
> + * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd.
> + *
> + * Authors:
> + *   Yulin Lu <luyulin@eswincomputing.com>
> + *   Huan He <hehuan1@eswincomputing.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/hwmon-sysfs.h>

I do not see why this include would be needed.

> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/polynomial.h>
> +#include <linux/reset.h>
> +#include "eic7700-pvt.h"
> +
> +/*
> + * For the sake of the code simplification we created the sensors info table
> + * with the sensor names, activation modes.
> + */

Simplification ? I'd argue that this code is fragile and complicated,
and doesn't simplify anything.

> +static int eic7700_pvt_create_sensor_info(struct pvt_hwmon *pvt)
> +{
> +	const char *suffixes[PVT_SENSORS_NUM] = {

PVT_SENSORS_NUM == 6, so this allocates one too many array entries.

> +		" Temperature",
> +		" Voltage",
> +		" Low-Vt",
> +		" UltraLow-Vt",
> +		" Standard-Vt"
> +	};
> +	struct device *dev = pvt->dev;
> +	struct device_node *np = dev->of_node;
> +	struct pvt_sensor_info *info_array;
> +	char *labels[PVT_SENSORS_NUM];

This is a character array with PVT_SENSORS_NUM entries.

> +	const char *prefix = NULL;
> +	const char *node_label;
> +	int i;
> +
> +	if (of_property_read_string(np, "label", &node_label)) {
> +		dev_err(dev, "Missing 'label' property in DTS node\n");
> +		return -EINVAL;
> +	}
> +
> +	struct {
> +		const char *label;
> +		const char *prefix;
> +	} label_map[] = {
> +		{ "pvt0", "SoC"},
> +		{ "pvt1", "DDR Core"},
> +	};

It seems to me that using a string property such as "label"
to distinguish SoC from DDR core is just wrong. First of all,
the assignment is really fixed. The driver instance name could
be used to identify that. Having each individual sensor named
"SoC <something>" or "DDR core <something>" seems excessive.
It would be much simpler and less error prone to name the instances
instead and use the same labels for both.

Ah, I see in the probe function that this is already the case.
So the instances are named "soc_pvt" and "ddr_pvt", and then
the individual sensors are again named "SoC ..." and "DDR Core ...".
That seems redundant.

> +
> +	for (i = 0; i < ARRAY_SIZE(label_map); i++) {
> +		if (strcmp(node_label, label_map[i].label) == 0) {
> +			prefix = label_map[i].prefix;
> +			break;
> +		}
> +	}
> +
> +	info_array = devm_kzalloc(dev, PVT_SENSORS_NUM * sizeof(*info_array),
> +				  GFP_KERNEL);
> +	if (!info_array)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < PVT_SENSORS_NUM; i++) {
> +		labels[i] = devm_kasprintf(dev, GFP_KERNEL, "%s%s", prefix,
> +					   suffixes[i]);

So the property is evaluated twice, in the probe function and here.
Why ?

Also, labels[i] is a character. Does this code even compile ?

> +		if (!labels[i])
> +			return -ENOMEM;
> +	}
> +
> +	info_array[0] = (struct pvt_sensor_info)PVT_SENSOR_INFO(0, labels[0],
> +								hwmon_temp,
> +								TEMP);
> +	info_array[1] = (struct pvt_sensor_info)PVT_SENSOR_INFO(0, labels[1],
> +								hwmon_in,
> +								VOLT);
> +	info_array[2] = (struct pvt_sensor_info)PVT_SENSOR_INFO(1, labels[2],
> +								hwmon_in,
> +								LVT);
> +	info_array[3] = (struct pvt_sensor_info)PVT_SENSOR_INFO(2, labels[3],
> +								hwmon_in,
> +								ULVT);
> +	info_array[4] = (struct pvt_sensor_info)PVT_SENSOR_INFO(3, labels[4],
> +								hwmon_in,
> +								SVT);
> +
> +	pvt->sensor_info = info_array;
> +	return 0;
> +}
> +
> +/*
> + * The original translation formulae of the temperature (in degrees of Celsius)
> + * to PVT data and vice-versa are following:
> + * N = 6.0818e-8*(T^4) +1.2873e-5*(T^3) + 7.2244e-3*(T^2) + 3.6484*(T^1) +
> + *     1.6198e2,
> + * T = -1.8439e-11*(N^4) + 8.0705e-8*(N^3) + -1.8501e-4*(N^2) +
> + *     3.2843e-1*(N^1) - 4.8690e1,
> + * where T = [-40, 125]C and N = [27, 771].
> + * They must be accordingly altered to be suitable for the integer arithmetics.
> + * The technique is called 'factor redistribution', which just makes sure the
> + * multiplications and divisions are made so to have a result of the operations
> + * within the integer numbers limit. In addition we need to translate the
> + * formulae to accept millidegrees of Celsius. Here what they look like after
> + * the alterations:
> + * N = (60818e-20*(T^4) + 12873e-14*(T^3) + 72244e-9*(T^2) + 36484e-3*T +
> + *     16198e2) / 1e4,
> + * T = -18439e-12*(N^4) + 80705e-9*(N^3) - 185010e-6*(N^2) + 328430e-3*N -
> + *     48690,
> + * where T = [-40000, 125000] mC and N = [27, 771].
> + */
> +static const struct polynomial poly_N_to_temp = {
> +	.total_divider = 1,
> +	.terms = {
> +		{4, -18439, 1000, 1},
> +		{3, 80705, 1000, 1},
> +		{2, -185010, 1000, 1},
> +		{1, 328430, 1000, 1},
> +		{0, -48690, 1, 1}
> +	}
> +};
> +
> +/*
> + * Similar alterations are performed for the voltage conversion equations.
> + * The original formulae are:
> + * N = 1.3905e3*V - 5.7685e2,
> + * V = (N + 5.7685e2) / 1.3905e3,
> + * where V = [0.72, 0.88] V and N = [424, 646].
> + * After the optimization they looks as follows:
> + * N = (13905e-3*V - 5768.5) / 10,
> + * V = (N * 10^5 / 13905 + 57685 * 10^3 / 13905) / 10.
> + * where V = [720, 880] mV and N = [424, 646].
> + */
> +static const struct polynomial poly_N_to_volt = {
> +	.total_divider = 10,
> +	.terms = {
> +		{1, 100000, 13905, 1},
> +		{0, 57685000, 1, 13905}
> +	}
> +};
> +
> +static inline u32 eic7700_pvt_update(void __iomem *reg, u32 mask, u32 data)
> +{
> +	u32 old;
> +
> +	old = readl_relaxed(reg);
> +	writel((old & ~mask) | (data & mask), reg);
> +
> +	return old & mask;
> +}
> +
> +static inline void eic7700_pvt_set_mode(struct pvt_hwmon *pvt, u32 mode)
> +{
> +	u32 old;
> +
> +	mode = FIELD_PREP(PVT_MODE_MASK, mode);
> +
> +	old = eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
> +	eic7700_pvt_update(pvt->regs + PVT_MODE, PVT_MODE_MASK, mode);
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, old);
> +}
> +
> +static inline void eic7700_pvt_set_trim(struct pvt_hwmon *pvt, u32 val)
> +{
> +	u32 old;
> +
> +	old = eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
> +	writel(val, pvt->regs + PVT_TRIM);
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, old);
> +}
> +
> +static irqreturn_t eic7700_pvt_hard_isr(int irq, void *data)
> +{
> +	struct pvt_hwmon *pvt = data;
> +	struct pvt_cache *cache;
> +	u32 val;
> +
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +
> +	/*
> +	 * Read the data, update the cache and notify a waiter of this event.
> +	 */
> +
> +	val = readl(pvt->regs + PVT_DATA);
> +
> +	cache = &pvt->cache[pvt->sensor];
> +
> +	WRITE_ONCE(cache->data, FIELD_GET(PVT_DATA_OUT, val));
> +
> +	complete(&cache->conversion);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int eic7700_pvt_read_data(struct pvt_hwmon *pvt,
> +				 enum pvt_sensor_type type, long *val)
> +{
> +	const struct pvt_sensor_info *pvt_info = pvt->sensor_info;
> +	struct pvt_cache *cache = &pvt->cache[type];
> +	u32 data;
> +	int ret;
> +
> +	if (!pvt_info) {
> +		dev_err(pvt->dev, "No matching device data found\n");
> +		return -EINVAL;
> +	}

How would pvt_info ever be NULL ?

> +	/*
> +	 * Lock PVT conversion interface until data cache is updated. The data
> +	 * read procedure is following: set the requested PVT sensor mode,
> +	 * enable conversion, wait until conversion is finished, then disable
> +	 * conversion and IRQ, and read the cached data.
> +	 */
> +	ret = mutex_lock_interruptible(&pvt->iface_mtx);
> +	if (ret)
> +		return ret;
> +
> +	pvt->sensor = type;
> +	eic7700_pvt_set_mode(pvt, pvt_info[type].mode);
> +
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, PVT_ENA_EN);
> +
> +	ret = wait_for_completion_interruptible(&cache->conversion);
> +
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +
> +	data = READ_ONCE(cache->data);
> +
> +	mutex_unlock(&pvt->iface_mtx);
> +
> +	if (ret && (ret != -ERESTARTSYS))
> +		return ret;
> +
> +	if (type == PVT_TEMP)
> +		*val = polynomial_calc(&poly_N_to_temp, data);
> +	else if (type == PVT_VOLT)
> +		*val = polynomial_calc(&poly_N_to_volt, data);
> +	else
> +		*val = data;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *pvt_channel_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_TYPE | HWMON_T_LABEL |
> +			   HWMON_T_OFFSET),
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_LABEL),
> +	NULL
> +};
> +
> +static inline bool
> +eic7700_pvt_hwmon_channel_is_valid(enum hwmon_sensor_types type, int ch)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +		if (ch < 0 || ch >= PVT_TEMP_CHS)
> +			return false;
> +		break;
> +	case hwmon_in:
> +		if (ch < 0 || ch >= PVT_VOLT_CHS)
> +			return false;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return true;
> +}

This validation is unnecessary.

> +
> +static umode_t eic7700_pvt_hwmon_is_visible(const void *data,
> +					    enum hwmon_sensor_types type,
> +					    u32 attr, int ch)
> +{
> +	if (!eic7700_pvt_hwmon_channel_is_valid(type, ch))
> +		return 0;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +		case hwmon_temp_type:
> +		case hwmon_temp_label:
> +			return 0444;
> +		case hwmon_temp_offset:
> +			return 0644;
> +		}
> +		break;
> +	case hwmon_in:
> +		switch (attr) {
> +		case hwmon_in_input:
> +		case hwmon_in_label:
> +			return 0444;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int eic7700_pvt_read_trim(struct pvt_hwmon *pvt, long *val)
> +{
> +	u32 data;
> +
> +	data = readl(pvt->regs + PVT_TRIM);
> +	*val = data;
> +
> +	return 0;
> +}
> +
> +static int eic7700_pvt_write_trim(struct pvt_hwmon *pvt, long val)
> +{
> +	int ret;
> +	/*
> +	 * Serialize trim update, since a part of the register is changed and
> +	 * the controller is supposed to be disabled during this operation.
> +	 */
> +	ret = mutex_lock_interruptible(&pvt->iface_mtx);
> +	if (ret)
> +		return ret;
> +
> +	eic7700_pvt_set_trim(pvt, val);
> +
> +	mutex_unlock(&pvt->iface_mtx);
> +
> +	return 0;
> +}
> +
> +static int eic7700_pvt_hwmon_read(struct device *dev,
> +				  enum hwmon_sensor_types type, u32 attr,
> +				  int ch, long *val)
> +{
> +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(pvt->dev);
> +	if (ret < 0) {
> +		dev_err(pvt->dev, "Failed to resume PVT device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!eic7700_pvt_hwmon_channel_is_valid(type, ch)) {

How would that ever be invalid ? This validation is pointless.

> +		ret = -EINVAL;
> +		goto out_put;
> +	}
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_input:
> +			ret = eic7700_pvt_read_data(pvt, ch, val);
> +			break;
> +		case hwmon_temp_type:
> +			*val = 1;

Drop this attribute.

> +			ret = 0;
> +			break;
> +		case hwmon_temp_offset:
> +			ret = eic7700_pvt_read_trim(pvt, val);
> +			break;
> +		default:
> +			ret = -EOPNOTSUPP;
> +		}
> +		break;
> +	case hwmon_in:
> +		if (attr == hwmon_in_input)
> +			ret = eic7700_pvt_read_data(pvt, PVT_VOLT + ch, val);
> +		else
> +			ret = -EOPNOTSUPP;
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
> +out_put:
> +	pm_runtime_mark_last_busy(pvt->dev);
> +	pm_runtime_put_autosuspend(pvt->dev);
> +	return ret;
> +}
> +
> +static int eic7700_pvt_hwmon_read_string(struct device *dev,
> +					 enum hwmon_sensor_types type, u32 attr,
> +					 int ch, const char **str)
> +{
> +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
> +	const struct pvt_sensor_info *pvt_info = pvt->sensor_info;
> +
> +	if (!eic7700_pvt_hwmon_channel_is_valid(type, ch))
> +		return -EINVAL;
> +
> +	if (!pvt_info) {
> +		dev_err(pvt->dev, "No matching device data found\n");
> +		return -EINVAL;
> +	}

More unnecessary validations.

> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_label) {
> +			*str = pvt_info[ch].label;
> +			return 0;
> +		}
> +		break;
> +	case hwmon_in:
> +		if (attr == hwmon_in_label) {
> +			*str = pvt_info[PVT_VOLT + ch].label;
> +			return 0;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;
> +}
> +
> +static int eic7700_pvt_hwmon_write(struct device *dev,
> +				   enum hwmon_sensor_types type, u32 attr,
> +				   int ch, long val)
> +{
> +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_get_sync(pvt->dev);
> +	if (ret < 0) {
> +		dev_err(pvt->dev, "Failed to resume PVT device: %d\n", ret);
> +		return ret;
> +	}
> +
> +	if (!eic7700_pvt_hwmon_channel_is_valid(type, ch)) {
> +		ret = -EINVAL;
> +		goto out_put;
> +	}

And again.

> +
> +	if (type == hwmon_temp || attr == hwmon_temp_offset)
> +		ret = eic7700_pvt_write_trim(pvt, val);
> +	else
> +		ret = -EOPNOTSUPP;
> +
> +out_put:
> +	pm_runtime_mark_last_busy(pvt->dev);
> +	pm_runtime_put_autosuspend(pvt->dev);
> +	return ret;
> +}
> +
> +static const struct hwmon_ops pvt_hwmon_ops = {
> +	.is_visible = eic7700_pvt_hwmon_is_visible,
> +	.read = eic7700_pvt_hwmon_read,
> +	.read_string = eic7700_pvt_hwmon_read_string,
> +	.write = eic7700_pvt_hwmon_write
> +};
> +
> +static const struct hwmon_chip_info pvt_hwmon_info = {
> +	.ops = &pvt_hwmon_ops,
> +	.info = pvt_channel_info
> +};
> +
> +static void pvt_clear_data(void *data)
> +{
> +	struct pvt_hwmon *pvt = data;
> +	int idx;
> +
> +	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
> +		complete_all(&pvt->cache[idx].conversion);
> +
> +	mutex_destroy(&pvt->iface_mtx);
> +}
> +
> +static struct pvt_hwmon *eic7700_pvt_create_data(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct pvt_hwmon *pvt;
> +	int ret, idx;
> +
> +	pvt = devm_kzalloc(dev, sizeof(*pvt), GFP_KERNEL);
> +	if (!pvt)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = devm_add_action(dev, pvt_clear_data, pvt);
> +	if (ret) {
> +		dev_err(dev, "Can't add PVT data clear action\n");
> +		return ERR_PTR(ret);
> +	}

Doing that before any data is initialized seems wrong.

> +
> +	pvt->dev = dev;
> +	pvt->sensor = PVT_SENSOR_FIRST;

What is this supposed to accomplish ?

> +	mutex_init(&pvt->iface_mtx);

The hwmon core already serializes accesses. Why would this driver need
another mutex ?

> +
> +	for (idx = 0; idx < PVT_SENSORS_NUM; ++idx)
> +		init_completion(&pvt->cache[idx].conversion);

Why would more than one completion ever be needed ? All accesses are serialized
in the hwmon core, so there will only be one outstanding conversion
at any given time. On top of that, the iface_mtx serializs accesses again.

Why is more than one cache entry needed anyway, given that all accesses are serialized ?

> +
> +	return pvt;
> +}
> +
> +static void eic7700_pvt_remove(void *data)
> +{
> +	int ret;
> +	struct pvt_hwmon *pvt = data;
> +
> +	pm_runtime_disable(pvt->dev);
> +	pm_runtime_dont_use_autosuspend(pvt->dev);
> +	pm_runtime_get_sync(pvt->dev);
> +
> +	ret = reset_control_assert(pvt->rst);
> +	if (ret)
> +		dev_err(pvt->dev, "Failed to assert reset: %d\n", ret);
> +
> +	if (pm_runtime_active(pvt->dev))
> +		clk_disable_unprepare(pvt->clk);

The probe function calls devm_clk_get_enabled(), which means that the clock
will be disabled on remove. Why is it necessary to disable it again here ?

> +
> +	pm_runtime_put_noidle(pvt->dev);
> +}
> +
> +static int eic7700_pvt_check_pwr(struct pvt_hwmon *pvt)
> +{
> +	unsigned long tout;
> +	int ret = 0;
> +
> +	/*
> +	 * Test out the sensor conversion functionality. If it is not done on
> +	 * time then the domain must have been unpowered and we won't be able
> +	 * to use the device later in this driver.
> +	 */
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, PVT_ENA_EN);
> +	readl(pvt->regs + PVT_DATA);
> +
> +	tout = PVT_TOUT_MIN / NSEC_PER_USEC;
> +	usleep_range(tout, 2 * tout);
> +
> +	readl(pvt->regs + PVT_DATA);
> +	if (!(readl(pvt->regs + PVT_INT) & PVT_INT_STAT)) {
> +		ret = -ENODEV;
> +		dev_err(pvt->dev,
> +			"Sensor is powered down - no interrupt generated\n");
> +	}
> +
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +
> +	return ret;
> +}
> +
> +static int eic7700_pvt_init_iface(struct pvt_hwmon *pvt)
> +{
> +	unsigned long rate;
> +	const struct pvt_sensor_info *pvt_info = pvt->sensor_info;
> +
> +	rate = clk_get_rate(pvt->clk);
> +	if (!rate) {
> +		dev_err(pvt->dev, "Invalid reference clock rate\n");
> +		return -ENODEV;
> +	}
> +	if (!pvt_info) {
> +		dev_err(pvt->dev, "No matching device data found\n");
> +		return -EINVAL;
> +	}
> +	/*
> +	 * Make sure controller are disabled so not to accidentally have ISR
> +	 * executed before the driver data is fully initialized. Clear the IRQ
> +	 * status as well.
> +	 */
> +	eic7700_pvt_update(pvt->regs + PVT_INT, PVT_INT_CLR, PVT_INT_CLR);
> +	eic7700_pvt_update(pvt->regs + PVT_ENA, PVT_ENA_EN, 0);
> +	readl(pvt->regs + PVT_INT);
> +	readl(pvt->regs + PVT_DATA);
> +
> +	/* Setup default sensor mode and temperature trim. */
> +	eic7700_pvt_set_mode(pvt, pvt_info[pvt->sensor].mode);
> +
> +	eic7700_pvt_set_trim(pvt, PVT_TRIM_DEF);
> +
> +	return 0;
> +}
> +
> +static int eic7700_pvt_request_irq(struct pvt_hwmon *pvt)
> +{
> +	struct platform_device *pdev = to_platform_device(pvt->dev);
> +	int ret;
> +
> +	pvt->irq = platform_get_irq(pdev, 0);
> +	if (pvt->irq < 0)
> +		return pvt->irq;
> +
> +	ret = devm_request_threaded_irq(pvt->dev, pvt->irq,
> +					eic7700_pvt_hard_isr, NULL,
> +					IRQF_SHARED | IRQF_TRIGGER_HIGH, "pvt",
> +					pvt);
> +	if (ret) {
> +		dev_err(pvt->dev, "Couldn't request PVT IRQ\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int eic7700_pvt_create_hwmon(struct pvt_hwmon *pvt)
> +{
> +	struct device *dev = pvt->dev;
> +	struct device_node *np = dev->of_node;
> +	const char *node_label;
> +	int type;
> +	const char *names[2] = {"soc_pvt", "ddr_pvt"};
> +
> +	if (of_property_read_string(np, "label", &node_label)) {
> +		dev_err(dev, "Missing 'label' property in DTS node\n");
> +		return -EINVAL;
> +	}
> +
> +	if (strcmp(node_label, "pvt0") == 0) {
> +		type = 0;
> +	} else if (strcmp(node_label, "pvt1") == 0) {
> +		type = 1;
> +	} else {
> +		dev_err(pvt->dev, "Unsupported label: %s\n", node_label);
> +		return -EINVAL;
> +	}
> +
> +	pvt->hwmon = devm_hwmon_device_register_with_info(pvt->dev, names[type],
> +							  pvt, &pvt_hwmon_info,
> +							  NULL);
> +	if (IS_ERR(pvt->hwmon)) {
> +		dev_err(pvt->dev, "Couldn't create hwmon device\n");
> +		return PTR_ERR(pvt->hwmon);
> +	}
> +
> +	return 0;
> +}
> +
> +static int eic7700_pvt_probe(struct platform_device *pdev)
> +{
> +	struct pvt_hwmon *pvt;
> +	int ret;
> +
> +	pvt = eic7700_pvt_create_data(pdev);
> +	if (IS_ERR(pvt))
> +		return PTR_ERR(pvt);
> +
> +	platform_set_drvdata(pdev, pvt);
> +
> +	ret = eic7700_pvt_create_sensor_info(pvt);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to create sensor info\n");
> +		return ret;
> +	}
> +
> +	pvt->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pvt->regs))
> +		return PTR_ERR(pvt->regs);
> +
> +	pvt->clk = devm_clk_get_enabled(&pdev->dev, NULL);
> +	if (IS_ERR(pvt->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(pvt->clk),
> +				     "Couldn't get clock\n");
> +
> +	pvt->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
> +	if (IS_ERR(pvt->rst))
> +		return dev_err_probe(pvt->dev, PTR_ERR(pvt->rst),
> +				     "Couldn't to get reset control\n");
> +
> +	if (pvt->rst) {
> +		ret = reset_control_reset(pvt->rst);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "Couldn't to trigger reset\n");
> +	}
> +
> +	ret = eic7700_pvt_check_pwr(pvt);
> +	if (ret)
> +		return ret;
> +
> +	ret = eic7700_pvt_init_iface(pvt);
> +	if (ret)
> +		return ret;
> +
> +	ret = eic7700_pvt_request_irq(pvt);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_get_noresume(&pdev->dev);
> +
> +	ret = eic7700_pvt_create_hwmon(pvt);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_add_action_or_reset(pvt->dev, eic7700_pvt_remove, pvt);
> +	if (ret) {
> +		dev_err(pvt->dev, "Can't add PVT clocks disable action\n");
> +		return ret;
> +	}
> +
> +	pm_runtime_put_autosuspend(&pdev->dev);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused eic7700_pvt_runtime_resume(struct device *dev)
> +{
> +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
> +	int ret;
> +
> +	if (!pvt->clk) {
> +		dev_err(dev, "clk not initialized\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = clk_prepare_enable(pvt->clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable clock: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused eic7700_pvt_runtime_suspend(struct device *dev)
> +{
> +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
> +
> +	if (pvt->clk)
> +		clk_disable_unprepare(pvt->clk);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused eic7700_pvt_suspend(struct device *dev)
> +{
> +	int ret = 0;
> +
> +	if (!pm_runtime_status_suspended(dev)) {
> +		ret = eic7700_pvt_runtime_suspend(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to suspend: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused eic7700_pvt_resume(struct device *dev)
> +{
> +	int ret = 0;
> +
> +	if (!pm_runtime_status_suspended(dev)) {
> +		ret = eic7700_pvt_runtime_resume(dev);
> +		if (ret) {
> +			dev_err(dev, "Failed to resume: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops eic7700_pvt_pm_ops = {
> +	SYSTEM_SLEEP_PM_OPS(eic7700_pvt_suspend, eic7700_pvt_resume)
> +	RUNTIME_PM_OPS(eic7700_pvt_runtime_suspend, eic7700_pvt_runtime_resume,
> +		       NULL)
> +};
> +
> +static const struct of_device_id pvt_of_match[] = {
> +	{ .compatible = "eswin,eic7700-pvt"},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pvt_of_match);
> +
> +static struct platform_driver pvt_driver = {
> +	.probe = eic7700_pvt_probe,
> +	.driver = {
> +		.name = "eic7700-pvt",
> +		.of_match_table = pvt_of_match,
> +		.pm = pm_sleep_ptr(&eic7700_pvt_pm_ops),
> +	},
> +};
> +module_platform_driver(pvt_driver);
> +
> +MODULE_AUTHOR("Yulin Lu <luyulin@eswincomputing.com>");
> +MODULE_AUTHOR("Huan He <hehuan1@eswincomputing.com>");
> +MODULE_DESCRIPTION("Eswin eic7700 PVT driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/hwmon/eic7700-pvt.h b/drivers/hwmon/eic7700-pvt.h
> new file mode 100644
> index 000000000000..41419cddd93d
> --- /dev/null
> +++ b/drivers/hwmon/eic7700-pvt.h
> @@ -0,0 +1,128 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * ESWIN EIC7700 Process, Voltage, Temperature sensor driver
> + *
> + * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd.
> + */
> +#ifndef __HWMON_EIC7700_PVT_H__
> +#define __HWMON_EIC7700_PVT_H__
> +
> +#include <linux/completion.h>
> +#include <linux/hwmon.h>
> +#include <linux/kernel.h>
> +#include <linux/mutex.h>
> +#include <linux/time.h>
> +
> +/* ESWIN EIC7700 PVT registers and their bitfields */
> +#define PVT_TRIM		0x04
> +#define PVT_TRIM_G		GENMASK(4, 0)
> +#define PVT_TRIM_O		GENMASK(13, 8)
> +#define PVT_MODE		0x08
> +#define PVT_MODE_MASK		GENMASK(2, 0)
> +#define PVT_CTRL_MODE_TEMP	0x0
> +#define PVT_CTRL_MODE_VOLT	0x4
> +#define PVT_CTRL_MODE_LVT	0x1
> +#define PVT_CTRL_MODE_ULVT	0x2
> +#define PVT_CTRL_MODE_SVT	0x3
> +#define PVT_ENA			0x0c
> +#define PVT_ENA_EN		BIT(0)
> +#define PVT_INT			0x10
> +#define PVT_INT_STAT		BIT(0)
> +#define PVT_INT_CLR		BIT(1)
> +#define PVT_DATA		0x14
> +#define PVT_DATA_OUT		GENMASK(9, 0)
> +
> +/*
> + * PVT sensors-related limits and default values
> + * @PVT_TEMP_CHS: Number of temperature hwmon channels.
> + * @PVT_VOLT_CHS: Number of voltage hwmon channels.
> + * @PVT_TRIM_DEF: Default temperature sensor trim value (set a proper value
> + *		  when one is determined for ESWIN EIC7700 SoC).
> + * @PVT_TOUT_MIN: Minimal timeout between samples in nanoseconds.
> + */
> +#define PVT_TEMP_CHS		1
> +#define PVT_VOLT_CHS		4
> +#define PVT_TRIM_DEF		0
> +#define PVT_TOUT_MIN		(NSEC_PER_SEC / 3000)
> +
> +/*
> + * enum pvt_sensor_type - ESWIN EIC7700 PVT sensor types (correspond to each PVT
> + *			  sampling mode)
> + * @PVT_SENSOR*: helpers to traverse the sensors in loops.
> + * @PVT_TEMP: PVT Temperature sensor.
> + * @PVT_VOLT: PVT Voltage sensor.
> + * @PVT_LVT: PVT Low-Voltage threshold sensor.
> + * @PVT_HVT: PVT High-Voltage threshold sensor.
> + * @PVT_SVT: PVT Standard-Voltage threshold sensor.
> + */
> +enum pvt_sensor_type {
> +	PVT_SENSOR_FIRST,
> +	PVT_TEMP = PVT_SENSOR_FIRST,
> +	PVT_VOLT,
> +	PVT_LVT,
> +	PVT_ULVT,
> +	PVT_SVT,
> +	PVT_SENSOR_LAST = PVT_SVT,

Why PVT_SENSOR_FIRST and PVT_SENSOR_LAST ?

> +	PVT_SENSORS_NUM
> +};
> +
> +/*
> + * struct pvt_sensor_info - ESWIN EIC7700 PVT sensor informational structure
> + * @channel: Sensor channel ID.
> + * @label: hwmon sensor label.
> + * @mode: PVT mode corresponding to the channel.
> + * @type: Sensor type.
> + */
> +struct pvt_sensor_info {
> +	int channel;
> +	const char *label;
> +	u32 mode;
> +	enum hwmon_sensor_types type;
> +};
> +
> +#define PVT_SENSOR_INFO(_ch, _label, _type, _mode)	\
> +	{						\
> +		.channel = _ch,				\
> +		.label = _label,			\
> +		.mode = PVT_CTRL_MODE_ ##_mode,		\
> +		.type = _type,				\
> +	}
> +
> +/*
> + * struct pvt_cache - PVT sensors data cache
> + * @data: data cache in raw format.
> + * @conversion: data conversion completion.
> + */
> +struct pvt_cache {
> +	u32 data;
> +	struct completion conversion;
> +};
> +
> +/*
> + * struct pvt_hwmon - Eswin EIC7700 PVT private data
> + * @dev: device structure of the PVT platform device.
> + * @hwmon: hwmon device structure.
> + * @regs: pointer to the Eswin EIC7700 PVT registers region.
> + * @irq: PVT events IRQ number.
> + * @clk: PVT core clock (1.2MHz).
> + * @rst: pointer to the reset descriptor.
> + * @iface_mtx: Generic interface mutex (used to lock the data conversion
> + *	       interface).
> + * @sensor: current PVT sensor the data conversion is being performed for.
> + * @cache: data cache descriptor.
> + * @sensor_info: pvt sensor info.
> + */
> +struct pvt_hwmon {
> +	struct device *dev;
> +	struct device *hwmon;
> +	void __iomem *regs;
> +	int irq;
> +	struct clk *clk;
> +	struct reset_control *rst;
> +	struct mutex iface_mtx;		/* protects data conversion interface */
> +	enum pvt_sensor_type sensor;
> +	struct pvt_cache cache[PVT_SENSORS_NUM];
> +	const struct pvt_sensor_info *sensor_info;
> +};
> +
> +#endif /* __HWMON_EIC7700_PVT_H__ */
