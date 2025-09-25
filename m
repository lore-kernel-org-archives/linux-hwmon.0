Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0878C148
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Sep 2025 00:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758760491; cv=none; b=mH7bc5tNCAMmFPGfdwYoz28HzRkSz5ZXfi0gFIr6V+oNgTCUlVWoBCBJez2ATeJJAMIEKp7XxrUlobPybCATPt+Nfb1VffQVUhdxcqcpfqpzF9R3Aq00QzDWwLVxPPB8/ugWAo4tqWmlrTwrYH/MpmyzIf4J+w9abMsDa1RtzLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758760491; c=relaxed/simple;
	bh=xt6qeXtFrJ9u7OvgpWDzMcGTjpmJVCtBj9O2kttiGJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=du380HAgTUJn0m3Xtkr5ut1fyhTaalE+48d1+Fzp3OOkyVi3K2U/whz4lWqUyWjhg77PhgHmarCV7Cl++/fd4+ObnZRdcwUCXrkaXp52cLAVvGlWCigi9WCeRVT0YOb9HY4afffJw1OZHq1DSVv/jQCISYRMa8FKhcSDuromv1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOn8jIoA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOn8jIoA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-77dedf198d4so600789b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 17:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758760488; x=1759365288; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o+aI2nnYkvv/3F4q2xhMvTHnkPv6LpMLWESNL5YNvIQ=;
        b=iOn8jIoAp4YOZfNhHTAP9IWKzsJ4rVrI71tNRZiPHnt3TiXkFzwGIKrMsECAdr4UvM
         LDXfDjSU1c5ff5gBtwX2bdWlsY7HUp2KxOzUrSvGAub6R17jbpeVltWtdUT3cieRRIeN
         148UJ1lu7PgLCvwKx2vEY6UIxE3djWKOKw0o/wH3MbkWJ7xPq84LOtdZ/WcpqCjJKfup
         hk4qzdXAaJ458Cifrldrjp8x7OQvc3qtK3a7MFwlDrF9VF6y5nqDvzhNEXLXb+QxmnNe
         6A5s7ChP4U9xhGihrDLOySIt2Ld8JfjJBCm2qTm4Ij4q4WpZ4elGhymsAMrIPM+JjGZc
         qpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758760488; x=1759365288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+aI2nnYkvv/3F4q2xhMvTHnkPv6LpMLWESNL5YNvIQ=;
        b=AY4qmg6kLlEZwvIBl0RwhE312RvnX48jFssXIUZ6dOI3AwPtTATdR7F78JC/mbvdAx
         zsSdUx29LhZJesWhq7z7Le9r2UE+DikcpkZWgADAO69FIlaH4q/muMOsETHA0au7hMqt
         +Js6ooy51d9rCZBrhZ3/i24GIJbgLaPUJJm1NqNYVVRfetMmCRrdEOKQx2RbpVPZgymx
         yuHP0EsTVwMxwXjaFYaNvbrlLuk4HkQjxGPO0y8Nmuk0KV1WTVIeaW0ifPYiahUzWc5z
         er+zO5PanVIMSE9DG5hBMxX/fWh793sdVIQdz4L36tgle1vlA8BVAAIrfcnj2foKcANf
         6gyw==
X-Forwarded-Encrypted: i=1; AJvYcCVqQldoz506z/gLjJllFGWXCEdqC8R/jFaNKXIANtiyobmMrPfjoEi8B7dYAnE5sikznsBNiEdI78w7EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRUZSnlft+pwSP6+oAv9UhkkCft1dp8LhQf2hyRQp+XvJ0rRzc
	Q6akA6l97iQ0khZDL5WqiEoyyQVj19q9N5G5cB0pTbizQkwMnbpFKEfl
X-Gm-Gg: ASbGncul/WzNG4tRxQOPD4BI1JEYctXRHpvetTkd3YuftMLoC6/2S3TEcqqavGJIT5c
	Dee69yj4rxoI+dljKPs/nxXBsU72VoCiSGuc+EdM8l7QeVsMyElo2WFaVNQgDxRYkBdbgqthQNF
	tMBM8z8qhWzYvYTXaFKiewYxbVG8kwuR/7B0CfRnQQfofWAaxmBcT2V2XNFb3fChFdgIVMsgqfZ
	xFSc6Vm8fAkzcUVTZD5QD433c4ZjDbJBELFbP67MiKHVtsKoe7YHWn6NzAUZXeVZTucoKVcBSmI
	gQddZGwMhJYP7two/Bd3uBOzxjAD3MwtG/B/eNVVD1tvRjllDDm8VMktrwY+QghPZaNg5C9RUdv
	mKF/6U5wu1awKLqm99TvyPcem9xe0gSdY8LDjLY1odLqso3Lp8RPx0/Qt57pOvEJbN3cO/mavfe
	IDzgAObVzGVRP1KA==
X-Google-Smtp-Source: AGHT+IFiaimIg0XaDy9GX3Vl99pu84ZrPFzP7Nmf/g95vMbssr9qQZY1uBSBVSf55OgTf3TTf8WEIw==
X-Received: by 2002:a05:6a20:a123:b0:25c:3979:ec83 with SMTP id adf61e73a8af0-2e7dd62fd27mr1707888637.58.1758760487729;
        Wed, 24 Sep 2025 17:34:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c55bf378sm468121a12.50.2025.09.24.17.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 17:34:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4e5e7035-f504-4107-bfe5-7127c386b916@roeck-us.net>
Date: Wed, 24 Sep 2025 17:34:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hwmon: adc: rp1: Add Raspberry Pi's RP1 ADC driver
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Stefan Wahren <wahrenst@gmx.net>, Saenz Julienne <nsaenz@kernel.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <20250925000416.2408457-1-svarbanov@suse.de>
 <20250925000416.2408457-3-svarbanov@suse.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250925000416.2408457-3-svarbanov@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/25 17:04, Stanimir Varbanov wrote:
> A five-input successive-approximation analogue-to-digital converter
> with 12-bit (effective number of 9.5 bits) resolution at 500kSPS.
> The ADC has four external inputs and one internal temperature sensor.
> 
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Jonathan Bell <jonathan@raspberrypi.com>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
> ---
>   drivers/hwmon/Kconfig   |  10 ++
>   drivers/hwmon/Makefile  |   1 +
>   drivers/hwmon/rp1-adc.c | 301 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 312 insertions(+)
>   create mode 100644 drivers/hwmon/rp1-adc.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 9d28fcf7cd2a..2cde8f83d1df 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -2629,6 +2629,16 @@ config SENSORS_INTEL_M10_BMC_HWMON
>   	  sensors monitor various telemetry data of different components on the
>   	  card, e.g. board temperature, FPGA core temperature/voltage/current.
>   
> +config SENSORS_RP1_ADC
> +	tristate "RP1 ADC and temperature sensor driver"
> +	depends on MISC_RP1
> +	help
> +	  The driver provides support for the hardware monitoring of voltage
> +	  and temperature sensor of the Raspberry Pi RP1 peripheral chip.
> +
> +	  The RP1 ADC is used by Raspberry Pi 5 to monitor four analog inputs
> +	  and one temperature sensor input.
> +
>   if ACPI
>   
>   comment "ACPI drivers"
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index cd8bc4752b4d..574e2c22636f 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -196,6 +196,7 @@ obj-$(CONFIG_SENSORS_PT5161L)	+= pt5161l.o
>   obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
>   obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
> +obj-$(CONFIG_SENSORS_RP1_ADC)	+= rp1-adc.o
>   obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
>   obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
>   obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
> diff --git a/drivers/hwmon/rp1-adc.c b/drivers/hwmon/rp1-adc.c
> new file mode 100644
> index 000000000000..2487d19c8ee9
> --- /dev/null
> +++ b/drivers/hwmon/rp1-adc.c
> @@ -0,0 +1,301 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Driver for the RP1 ADC and temperature sensor
> + *
> + * Copyright (C) 2023 Raspberry Pi Ltd.
> + * Copyright (c) 2025, SUSE.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/regulator/consumer.h>
> +
> +#define RP1_ADC_CS			0x00
> +#define RP1_ADC_RESULT			0x04
> +#define RP1_ADC_FCS			0x08
> +#define RP1_ADC_FIFO			0x0c
> +#define RP1_ADC_DIV			0x10
> +#define RP1_ADC_INTR			0x14
> +#define RP1_ADC_INTE			0x18
> +#define RP1_ADC_INTF			0x1c
> +#define RP1_ADC_INTS			0x20
> +
> +#define RP1_ADC_RWTYPE_SET		0x2000
> +#define RP1_ADC_RWTYPE_CLR		0x3000
> +
> +#define RP1_ADC_CS_RROBIN_MASK		0x1f
> +#define RP1_ADC_CS_RROBIN_SHIFT		16
> +#define RP1_ADC_CS_AINSEL_MASK		0x7
> +#define RP1_ADC_CS_AINSEL_SHIFT		12
> +#define RP1_ADC_CS_ERR_STICKY		0x400
> +#define RP1_ADC_CS_ERR			0x200
> +#define RP1_ADC_CS_READY		0x100
> +#define RP1_ADC_CS_START_MANY		0x8
> +#define RP1_ADC_CS_START_ONCE		0x4
> +#define RP1_ADC_CS_TS_EN		0x2
> +#define RP1_ADC_CS_EN			0x1
> +
> +#define RP1_ADC_FCS_THRESH_MASK		0xf
> +#define RP1_ADC_FCS_THRESH_SHIFT	24
> +#define RP1_ADC_FCS_LEVEL_MASK		0xf
> +#define RP1_ADC_FCS_LEVEL_SHIFT		16
> +#define RP1_ADC_FCS_OVER		0x800
> +#define RP1_ADC_FCS_UNDER		0x400
> +#define RP1_ADC_FCS_FULL		0x200
> +#define RP1_ADC_FCS_EMPTY		0x100
> +#define RP1_ADC_FCS_DREQ_EN		0x8
> +#define RP1_ADC_FCS_ERR			0x4
> +#define RP1_ADC_FCS_SHIFR		0x2
> +#define RP1_ADC_FCS_EN			0x1
> +
> +#define RP1_ADC_FIFO_ERR		0x8000
> +#define RP1_ADC_FIFO_VAL_MASK		0xfff
> +
> +#define RP1_ADC_DIV_INT_MASK		0xffff
> +#define RP1_ADC_DIV_INT_SHIFT		8
> +#define RP1_ADC_DIV_FRAC_MASK		0xff
> +#define RP1_ADC_DIV_FRAC_SHIFT		0
> +
> +#define RP1_ADC_TEMP_CHAN		4
> +
> +struct rp1_adc_data {
> +	void __iomem		*base;
> +	struct mutex		lock;
> +	struct device		*hwmon;
> +	int			vref_mv;
> +	struct clk		*clk;
> +	struct regulator	*reg;
> +};
> +
> +static int rp1_adc_read(struct rp1_adc_data *rp1, int channel, long *val)
> +{
> +	u32 regval;
> +	int ret;
> +
> +	writel(RP1_ADC_CS_AINSEL_MASK << RP1_ADC_CS_AINSEL_SHIFT,
> +	       rp1->base + RP1_ADC_RWTYPE_CLR + RP1_ADC_CS);
> +	writel(channel << RP1_ADC_CS_AINSEL_SHIFT,
> +	       rp1->base + RP1_ADC_RWTYPE_SET + RP1_ADC_CS);
> +	writel(RP1_ADC_CS_START_ONCE,
> +	       rp1->base + RP1_ADC_RWTYPE_SET + RP1_ADC_CS);
> +
> +	ret = readl_poll_timeout(rp1->base + RP1_ADC_CS, regval,
> +				 regval & RP1_ADC_CS_READY, 10, 1000);
> +	if (ret)
> +		return ret;
> +
> +	/* Asserted if the completed conversion had a convergence error */
> +	if (readl(rp1->base + RP1_ADC_CS) & RP1_ADC_CS_ERR)
> +		return -EIO;
> +
> +	*val = readl(rp1->base + RP1_ADC_RESULT);
> +
> +	return 0;
> +}
> +
> +static int rp1_adc_read_temp(struct rp1_adc_data *rp1, long *val)
> +{
> +	int ret, mv;
> +
> +	writel(RP1_ADC_CS_TS_EN, rp1->base + RP1_ADC_RWTYPE_SET + RP1_ADC_CS);
> +
> +	ret = rp1_adc_read(rp1, RP1_ADC_TEMP_CHAN, val);
> +	if (ret)
> +		return ret;
> +
> +	mv = ((u64)rp1->vref_mv * *val) / 4095;

This ends up being a 64-bit divide operation. Does this work if build for arm
(32 bit) ?

> +
> +	/* T = 27 - (ADC_voltage - 0.706)/0.001721 */
> +	*val = 27000 - DIV_ROUND_CLOSEST((mv - 706) * (s64)1000000, 1721);
> +
> +	return 0;
> +}
> +
> +static umode_t rp1_adc_hwmon_is_visible(const void *drvdata,
> +					enum hwmon_sensor_types type,
> +					u32 attr, int channel)
> +{
> +	return 0444;
> +}
> +
> +static int rp1_adc_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct rp1_adc_data *rp1 = dev_get_drvdata(dev);
> +	int ret = -EOPNOTSUPP;
> +
> +	mutex_lock(&rp1->lock);
> +

The lock is no longer needed. See commit 3ad2a7b9b15d ("hwmon: Serialize accesses
in hwmon core") in linux-next.

> +	if (type == hwmon_temp && attr == hwmon_temp_input)
> +		ret = rp1_adc_read_temp(rp1, val);
> +	else if (type == hwmon_in && attr == hwmon_in_input)
> +		ret = rp1_adc_read(rp1, channel, val);
> +
> +	mutex_unlock(&rp1->lock);
> +
> +	return ret;
> +}
> +
> +static const char *const rp1_adc_hwmon_in_labels[] = {
> +	"ain0", "ain1", "ain2", "ain3",
> +};
> +
> +static const char *const rp1_adc_hwmon_temp_label = {
> +	"RP1 die temp"
> +};
> +
> +static int rp1_adc_hwmon_read_string(struct device *dev,
> +				     enum hwmon_sensor_types type, u32 attr,
> +				     int channel, const char **str)
> +{
> +	if (type == hwmon_temp && attr == hwmon_temp_label) {
> +		*str = rp1_adc_hwmon_temp_label;
> +	} else if (type == hwmon_in && attr == hwmon_in_label) {
> +		if (channel < ARRAY_SIZE(rp1_adc_hwmon_in_labels))
> +			*str = rp1_adc_hwmon_in_labels[channel];
> +	} else {
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops rp1_adc_hwmon_ops = {
> +	.is_visible	= rp1_adc_hwmon_is_visible,
> +	.read		= rp1_adc_hwmon_read,
> +	.read_string	= rp1_adc_hwmon_read_string,
> +};
> +
> +static const struct hwmon_channel_info * const rp1_adc_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL,
> +			       HWMON_I_INPUT | HWMON_I_LABEL,
> +			       HWMON_I_INPUT | HWMON_I_LABEL,
> +			       HWMON_I_INPUT | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info rp1_adc_chip_info = {
> +	.ops	= &rp1_adc_hwmon_ops,
> +	.info	= rp1_adc_hwmon_info,
> +};
> +
> +static int rp1_adc_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct rp1_adc_data *rp1;
> +	int ret;
> +
> +	rp1 = devm_kzalloc(dev, sizeof(*rp1), GFP_KERNEL);
> +	if (!rp1)
> +		return -ENOMEM;
> +
> +	rp1->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(rp1->base))
> +		return dev_err_probe(dev, PTR_ERR(rp1->base), "can't ioremap resource\n");
> +
> +	rp1->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(rp1->clk))
> +		return dev_err_probe(dev, PTR_ERR(rp1->clk), "can't get clock\n");
> +
> +	rp1->reg = devm_regulator_get(dev, "vref");
> +	if (IS_ERR(rp1->reg))
> +		return dev_err_probe(dev, PTR_ERR(rp1->reg), "can't get regulator\n");
> +
> +	ret = devm_mutex_init(dev, &rp1->lock);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_set_rate(rp1->clk, 50000000);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(rp1->clk);
> +	if (ret)
> +		return ret;
> +

Other drivers call devm_clk_get_enabled() and then set the clock rate.
Doing this here would avoid having to call clk_disable_unprepare()
in the remove function.

> +	platform_set_drvdata(pdev, rp1);
> +
> +	ret = regulator_get_voltage(rp1->reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	rp1->vref_mv = DIV_ROUND_CLOSEST(ret, 1000);
> +
> +	ret = regulator_enable(rp1->reg);

devm_regulator_get_enable() ?

> +	if (ret)
> +		return ret;
> +
> +	rp1->hwmon = devm_hwmon_device_register_with_info(dev, "rp1_adc", rp1,
> +							  &rp1_adc_chip_info, NULL);
> +	if (IS_ERR(rp1->hwmon))
> +		return PTR_ERR(rp1->hwmon);
> +
> +	/* Disable interrupts */
> +	writel(0, rp1->base + RP1_ADC_INTE);
> +
> +	/* Enable the block, clearing any sticky error */
> +	writel(RP1_ADC_CS_EN | RP1_ADC_CS_ERR_STICKY, rp1->base + RP1_ADC_CS);
> +
> +	return 0;
> +}
> +
> +static void rp1_adc_remove(struct platform_device *pdev)
> +{
> +	struct rp1_adc_data *rp1 = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(rp1->clk);
> +	regulator_disable(rp1->reg);

As written, this disables the clock and regulator before the hwmon device is
removed. Either make sure to use devm functions for clock and regulator, or
you can not use devm_hwmon_device_register_with_info() but must remove the
hwmon device here.

> +}
> +
> +static int rp1_adc_suspend(struct device *dev)
> +{
> +	struct rp1_adc_data *rp1 = dev_get_drvdata(dev);
> +
> +	clk_disable_unprepare(rp1->clk);
> +	return regulator_disable(rp1->reg);
> +}
> +
> +static int rp1_adc_resume(struct device *dev)
> +{
> +	struct rp1_adc_data *rp1 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = regulator_enable(rp1->reg);
> +	if (ret)
> +		return ret;
> +
> +	return clk_prepare_enable(rp1->clk);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(rp1_adc_pm_ops, rp1_adc_suspend, rp1_adc_resume);
> +
> +static const struct of_device_id rp1_adc_match_table[] = {
> +	{ .compatible = "raspberrypi,rp1-adc", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rp1_adc_match_table);
> +
> +static struct platform_driver rp1_adc_driver = {
> +	.probe = rp1_adc_probe,
> +	.remove = rp1_adc_remove,
> +	.driver = {
> +		.name = "rp1-adc",
> +		.of_match_table = rp1_adc_match_table,
> +		.pm = pm_ptr(&rp1_adc_pm_ops),
> +	},
> +};
> +module_platform_driver(rp1_adc_driver);
> +
> +MODULE_DESCRIPTION("RP1 ADC driver");
> +MODULE_AUTHOR("Phil Elwell <phil@raspberrypi.com>");
> +MODULE_AUTHOR("Stanimir Varbanov <svarbanov@suse.de>");
> +MODULE_LICENSE("GPL");

