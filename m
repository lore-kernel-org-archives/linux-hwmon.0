Return-Path: <SRS0=13Sa=SA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF1A1C43381
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 16:53:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CDF9218D0
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Mar 2019 16:53:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9OGzLCd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbfC2Qxy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Mar 2019 12:53:54 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33152 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728936AbfC2Qxy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Mar 2019 12:53:54 -0400
Received: by mail-pg1-f193.google.com with SMTP id b12so1507248pgk.0;
        Fri, 29 Mar 2019 09:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=SEy3HY7gF3Qy85Wk+CtlD7FbBXbq9DnQ263p1bOKv6s=;
        b=V9OGzLCd3oLJXfY0Jv9wFFzjdG8OCcR9L+jIJh2zW80GaC45pRV6mjNLxRxw0FtQ59
         fnqhBllsTfhToXjJkERZZPv6lj/0wT4oSG0aEvLJyJeREL31lC+k8lC5WKVjv0+RuUFv
         4Q2ZvjhkTlpz8bxyKytZportsvk40l4aX86OQhiRRhbGGnvSXN8ssxUdg5B31pzRTxh8
         8uvBoXEhBURbwMLxOI243oVvPog0+ahedd1W7Iqb4WW6cYZrmNFsceEjWGXGmsfesUik
         fmK1QlAJw2BzCkSzCQXqS2VotcPk9PvEV8bDB0sQD1xfFVpLDTD8iGxLNlWbHk/hlkGG
         09Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=SEy3HY7gF3Qy85Wk+CtlD7FbBXbq9DnQ263p1bOKv6s=;
        b=uIuSmxvhcCe+8EHnue3oihaAiNiT3KH66lRz1q/RZvHgRCBUqdFp4bEE/q4mM15pN+
         U/pr0SC/lQBxHSF+BaDssX1Y4wUJjMtqQuELYE+STkrnyYPqAoFCiRiDfFKN/r9ENqVn
         2WwnF+uZnUBGBEf40HqOPm//B5Ayoqqi1XQOfAobEmDBx2N/WEcOpbgw9+P8XqEtR71H
         Y9bvOn8QMGcdy6oAkjdw1qWVdONXc6GDJsZ9bJ44DdzE060yYlQfUocs7twGSrSELv67
         DDkoTvXbU1K//Bb2EILLLNMdZnyLqFB4qxY9Gk+GQO3EEPHaMbDsK6/N1jFkxcCVQlx2
         5EDg==
X-Gm-Message-State: APjAAAVyTABnqDAUd98LYEBbXQJi9s0xwn9GEBf8afBBV61aN22UOt/q
        z5RGr1NZhfQ49mobYK7hQQA=
X-Google-Smtp-Source: APXvYqyYK3NkZMK2CcF3QhypVOEeUF+drpWKGyztJLNFWXPmqfRAF2nnBZuVxuSjfqfsEYq8qzohwA==
X-Received: by 2002:a63:c84c:: with SMTP id l12mr46845842pgi.287.1553878433028;
        Fri, 29 Mar 2019 09:53:53 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q87sm3740531pfa.133.2019.03.29.09.53.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Mar 2019 09:53:52 -0700 (PDT)
Date:   Fri, 29 Mar 2019 09:53:51 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, corbet@lwn.net,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 2/2] hwmon: lochnagar: Add Lochnagar 2 hardware
 monitoring driver
Message-ID: <20190329165351.GA16008@roeck-us.net>
References: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
 <20190328130937.3756-2-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190328130937.3756-2-ckeepax@opensource.cirrus.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Mar 28, 2019 at 01:09:37PM +0000, Charles Keepax wrote:
> From: Lucas Tanure <tanureal@opensource.cirrus.com>
> 
> Lochnagar is an evaluation and development board for Cirrus
> Logic Smart CODEC and Amp devices. It allows the connection of
> most Cirrus Logic devices on mini-cards, as well as allowing
> connection of various application processor systems to provide a
> full evaluation platform.
> 
> This driver adds support for the hardware monitoring features of
> the Lochnagar 2 to the hwmon API. Monitoring is provided for
> the board voltages, currents and temperature supported by the
> board controller chip.
> 
> Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> 
> Changes since v3:
>  - Add defines for the precision of each measurement
>  - Change to storing number of samples for averaging not time
>  - Use DIV_ROUND_CLOSEST_ULL
> 
> Thanks,
> Charles
> 
>  Documentation/hwmon/lochnagar   |  80 ++++++++
>  MAINTAINERS                     |   3 +
>  drivers/hwmon/Kconfig           |  10 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/lochnagar-hwmon.c | 412 ++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 506 insertions(+)
>  create mode 100644 Documentation/hwmon/lochnagar
>  create mode 100644 drivers/hwmon/lochnagar-hwmon.c
> 
> diff --git a/Documentation/hwmon/lochnagar b/Documentation/hwmon/lochnagar
> new file mode 100644
> index 0000000000000..e9686fb3eb405
> --- /dev/null
> +++ b/Documentation/hwmon/lochnagar
> @@ -0,0 +1,80 @@
> +Kernel Driver Lochnagar
> +========================
> +
> +Supported systems:
> +  * Cirrus Logic : Lochnagar 2
> +
> +Author: Lucas A. Tanure Alves
> +
> +Description
> +-----------
> +
> +Lochnagar 2 features built-in Current Monitor circuitry that allows for the
> +measurement of both voltage and current on up to eight of the supply voltage
> +rails provided to the minicards. The Current Monitor does not require any
> +hardware modifications or external circuitry to operate.
> +
> +The current and voltage measurements are obtained through the standard register
> +map interface to the Lochnagar board controller, and can therefore be monitored
> +by software.
> +
> +Sysfs attributes
> +----------------
> +
> +temp1_input             The Lochnagar board temperature (milliCelsius)
> +in0_input               Measured voltage for DBVDD1 (milliVolts)
> +in0_label               "DBVDD1"
> +curr1_input             Measured current for DBVDD1 (milliAmps)
> +curr1_label             "DBVDD1"
> +power1_average          Measured average power for DBVDD1 (microWatts)
> +power1_average_interval Power averaging time input valid from 1 to 1708mS
> +power1_label            "DBVDD1"
> +in1_input               Measured voltage for 1V8 DSP (milliVolts)
> +in1_label               "1V8 DSP"
> +curr2_input             Measured current for 1V8 DSP (milliAmps)
> +curr2_label             "1V8 DSP"
> +power2_average          Measured average power for 1V8 DSP (microWatts)
> +power2_average_interval Power averaging time input valid from 1 to 1708mS
> +power2_label            "1V8 DSP"
> +in2_input               Measured voltage for 1V8 CDC (milliVolts)
> +in2_label               "1V8 CDC"
> +curr3_input             Measured current for 1V8 CDC (milliAmps)
> +curr3_label             "1V8 CDC"
> +power3_average          Measured average power for 1V8 CDC (microWatts)
> +power3_average_interval Power averaging time input valid from 1 to 1708mS
> +power3_label            "1V8 CDC"
> +in3_input               Measured voltage for VDDCORE DSP (milliVolts)
> +in3_label               "VDDCORE DSP"
> +curr4_input             Measured current for VDDCORE DSP (milliAmps)
> +curr4_label             "VDDCORE DSP"
> +power4_average          Measured average power for VDDCORE DSP (microWatts)
> +power4_average_interval Power averaging time input valid from 1 to 1708mS
> +power4_label            "VDDCORE DSP"
> +in4_input               Measured voltage for AVDD 1V8 (milliVolts)
> +in4_label               "AVDD 1V8"
> +curr5_input             Measured current for AVDD 1V8 (milliAmps)
> +curr5_label             "AVDD 1V8"
> +power5_average          Measured average power for AVDD 1V8 (microWatts)
> +power5_average_interval Power averaging time input valid from 1 to 1708mS
> +power5_label            "AVDD 1V8"
> +curr6_input             Measured current for SYSVDD (milliAmps)
> +curr6_label             "SYSVDD"
> +power6_average          Measured average power for SYSVDD (microWatts)
> +power6_average_interval Power averaging time input valid from 1 to 1708mS
> +power6_label            "SYSVDD"
> +in6_input               Measured voltage for VDDCORE CDC (milliVolts)
> +in6_label               "VDDCORE CDC"
> +curr7_input             Measured current for VDDCORE CDC (milliAmps)
> +curr7_label             "VDDCORE CDC"
> +power7_average          Measured average power for VDDCORE CDC (microWatts)
> +power7_average_interval Power averaging time input valid from 1 to 1708mS
> +power7_label            "VDDCORE CDC"
> +in7_input               Measured voltage for MICVDD (milliVolts)
> +in7_label               "MICVDD"
> +curr8_input             Measured current for MICVDD (milliAmps)
> +curr8_label             "MICVDD"
> +power8_average          Measured average power for MICVDD (microWatts)
> +power8_average_interval Power averaging time input valid from 1 to 1708mS
> +power8_label            "MICVDD"
> +
> +Note: It is not possible to measure voltage on the SYSVDD rail.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e17ebf70b5480..4cd3c281d8b56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3796,6 +3796,7 @@ M:	Richard Fitzgerald <rf@opensource.cirrus.com>
>  L:	patches@opensource.cirrus.com
>  S:	Supported
>  F:	drivers/clk/clk-lochnagar.c
> +F:	drivers/hwmon/lochnagar-hwmon.c
>  F:	drivers/mfd/lochnagar-i2c.c
>  F:	drivers/pinctrl/cirrus/pinctrl-lochnagar.c
>  F:	drivers/regulator/lochnagar-regulator.c
> @@ -3804,8 +3805,10 @@ F:	include/dt-bindings/pinctrl/lochnagar.h
>  F:	include/linux/mfd/lochnagar*
>  F:	Documentation/devicetree/bindings/mfd/cirrus,lochnagar.txt
>  F:	Documentation/devicetree/bindings/clock/cirrus,lochnagar.txt
> +F:	Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
>  F:	Documentation/devicetree/bindings/pinctrl/cirrus,lochnagar.txt
>  F:	Documentation/devicetree/bindings/regulator/cirrus,lochnagar.txt
> +F:	Documentation/hwmon/lochnagar
>  
>  CISCO FCOE HBA DRIVER
>  M:	Satish Kharat <satishkh@cisco.com>
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index d0f1dfe2bcbbd..dedd5febd3aa6 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -705,6 +705,16 @@ config SENSORS_LINEAGE
>  	  This driver can also be built as a module. If so, the module
>  	  will be called lineage-pem.
>  
> +config SENSORS_LOCHNAGAR
> +	tristate "Lochnagar Hardware Monitor"
> +	depends on MFD_LOCHNAGAR
> +	help
> +	  If you say yes here you get support for Lochnagar 2 temperature,
> +	  voltage and current sensors abilities.
> +
> +	  This driver can also be built as a module.  If so, the module
> +	  will be called lochnagar-hwmon.
> +
>  config SENSORS_LTC2945
>  	tristate "Linear Technology LTC2945"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index f5c7b442e69e5..8db472ea04f00 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_SENSORS_JZ4740)	+= jz4740-hwmon.o
>  obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
>  obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
>  obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
> +obj-$(CONFIG_SENSORS_LOCHNAGAR)	+= lochnagar-hwmon.o
>  obj-$(CONFIG_SENSORS_LM63)	+= lm63.o
>  obj-$(CONFIG_SENSORS_LM70)	+= lm70.o
>  obj-$(CONFIG_SENSORS_LM73)	+= lm73.o
> diff --git a/drivers/hwmon/lochnagar-hwmon.c b/drivers/hwmon/lochnagar-hwmon.c
> new file mode 100644
> index 0000000000000..8b19adf2eeb07
> --- /dev/null
> +++ b/drivers/hwmon/lochnagar-hwmon.c
> @@ -0,0 +1,412 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Lochnagar hardware monitoring features
> + *
> + * Copyright (c) 2016-2019 Cirrus Logic, Inc. and
> + *                         Cirrus Logic International Semiconductor Ltd.
> + *
> + * Author: Lucas Tanure <tanureal@opensource.cirrus.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/i2c.h>
> +#include <linux/math64.h>
> +#include <linux/mfd/lochnagar.h>
> +#include <linux/mfd/lochnagar2_regs.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define LN2_MAX_NSAMPLE 1023
> +#define LN2_SAMPLE_US   1670
> +
> +#define LN2_CURR_UNITS  1000
> +#define LN2_VOLT_UNITS  1000
> +#define LN2_TEMP_UNITS  1000
> +#define LN2_PWR_UNITS   1000000
> +
> +static const char * const lochnagar_chan_names[] = {
> +	"DBVDD1",
> +	"1V8 DSP",
> +	"1V8 CDC",
> +	"VDDCORE DSP",
> +	"AVDD 1V8",
> +	"SYSVDD",
> +	"VDDCORE CDC",
> +	"MICVDD",
> +};
> +
> +struct lochnagar_hwmon {
> +	struct regmap *regmap;
> +
> +	long power_nsamples[ARRAY_SIZE(lochnagar_chan_names)];
> +
> +	/* Lock to ensure only a single sensor is read at a time */
> +	struct mutex sensor_lock;
> +};
> +
> +enum lochnagar_measure_mode {
> +	LN2_CURR = 0,
> +	LN2_VOLT,
> +	LN2_TEMP,
> +};
> +
> +/**
> + * float_to_long - Convert ieee754 reading from hardware to an integer
> + *
> + * @data: Value read from the hardware
> + * @precision: Units to multiply up to eg. 1000 = milli, 1000000 = micro
> + *
> + * Return: Converted integer reading
> + *
> + * Depending on the measurement type the hardware returns an ieee754
> + * floating point value in either volts, amps or celsius. This function
> + * will convert that into an integer in a smaller unit such as micro-amps
> + * or milli-celsius. The hardware does not return NaN, so consideration of
> + * that is not required.
> + */
> +static long float_to_long(u32 data, u32 precision)
> +{
> +	u64 man = data & 0x007FFFFF;
> +	int exp = ((data & 0x7F800000) >> 23) - 127 - 23;
> +	bool negative = data & 0x80000000;
> +	long result;
> +
> +	man = (man + (1 << 23)) * precision;
> +
> +	if (fls64(man) + exp > (int)sizeof(long) * 8 - 1)
> +		result = LONG_MAX;
> +	else if (exp < 0)
> +		result = (man + (1ull << (-exp - 1))) >> -exp;
> +	else
> +		result = man << exp;
> +
> +	return negative ? -result : result;
> +}
> +
> +static int do_measurement(struct regmap *regmap, int chan,
> +			  enum lochnagar_measure_mode mode, int nsamples)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	chan = 1 << (chan + LOCHNAGAR2_IMON_MEASURED_CHANNELS_SHIFT);
> +
> +	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL1,
> +			   LOCHNAGAR2_IMON_ENA_MASK | chan | mode);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL2, nsamples);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL3,
> +			   LOCHNAGAR2_IMON_CONFIGURE_MASK);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL3, val,
> +					val & LOCHNAGAR2_IMON_DONE_MASK,
> +					1000, 10000);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL3,
> +			   LOCHNAGAR2_IMON_MEASURE_MASK);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Actual measurement time is ~1.67mS per sample, approximate this
> +	 * with a 1.5mS per sample msleep and then poll for success up to
> +	 * ~0.17mS * 1023 (LN2_MAX_NSAMPLES). Normally for smaller values
> +	 * of nsamples the poll will complete on the first loop due to
> +	 * other latency in the system.
> +	 */
> +	msleep((nsamples * 3) / 2);
> +
> +	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL3, val,
> +					val & LOCHNAGAR2_IMON_DONE_MASK,
> +					5000, 200000);
> +	if (ret < 0)
> +		return ret;
> +
> +	return regmap_write(regmap, LOCHNAGAR2_IMON_CTRL3, 0);
> +}
> +
> +static int request_data(struct regmap *regmap, int chan, u32 *data)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_write(regmap, LOCHNAGAR2_IMON_CTRL4,
> +			   LOCHNAGAR2_IMON_DATA_REQ_MASK |
> +			   chan << LOCHNAGAR2_IMON_CH_SEL_SHIFT);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =  regmap_read_poll_timeout(regmap, LOCHNAGAR2_IMON_CTRL4, val,
> +					val & LOCHNAGAR2_IMON_DATA_RDY_MASK,
> +					1000, 10000);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_read(regmap, LOCHNAGAR2_IMON_DATA1, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	*data = val << 16;
> +
> +	ret = regmap_read(regmap, LOCHNAGAR2_IMON_DATA2, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	*data |= val;
> +
> +	return regmap_write(regmap, LOCHNAGAR2_IMON_CTRL4, 0);
> +}
> +
> +static int read_sensor(struct device *dev, int chan,
> +		       enum lochnagar_measure_mode mode, int nsamples,
> +		       unsigned int precision, long *val)
> +{
> +	struct lochnagar_hwmon *priv = dev_get_drvdata(dev);
> +	struct regmap *regmap = priv->regmap;
> +	u32 data;
> +	int ret;
> +
> +	mutex_lock(&priv->sensor_lock);
> +
> +	ret = do_measurement(regmap, chan, mode, nsamples);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to perform measurement: %d\n", ret);
> +		goto error;
> +	}
> +
> +	ret = request_data(regmap, chan, &data);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to read measurement: %d\n", ret);
> +		goto error;
> +	}
> +
> +	*val = float_to_long(data, precision);
> +
> +error:
> +	mutex_unlock(&priv->sensor_lock);
> +
> +	return ret;
> +}
> +
> +static int read_power(struct device *dev, int chan, long *val)
> +{
> +	struct lochnagar_hwmon *priv = dev_get_drvdata(dev);
> +	int nsamples = priv->power_nsamples[chan];
> +	u64 power;
> +	int ret;
> +
> +	if (!strcmp("SYSVDD", lochnagar_chan_names[chan])) {
> +		power = 5 * LN2_PWR_UNITS;
> +	} else {
> +		ret = read_sensor(dev, chan, LN2_VOLT, 1, LN2_PWR_UNITS, val);
> +		if (ret < 0)
> +			return ret;
> +
> +		power = abs(*val);
> +	}
> +
> +	ret = read_sensor(dev, chan, LN2_CURR, nsamples, LN2_PWR_UNITS, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	power *= abs(*val);
> +	power = DIV_ROUND_CLOSEST_ULL(power, LN2_PWR_UNITS);
> +
> +	if (power > LONG_MAX)
> +		*val = LONG_MAX;
> +	else
> +		*val = power;
> +
> +	return 0;
> +}
> +
> +static umode_t lochnagar_is_visible(const void *drvdata,
> +				    enum hwmon_sensor_types type,
> +				    u32 attr, int chan)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +		if (!strcmp("SYSVDD", lochnagar_chan_names[chan]))
> +			return 0;
> +		break;
> +	case hwmon_power:
> +		if (attr == hwmon_power_average_interval)
> +			return 0644;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0444;
> +}
> +
> +static int lochnagar_read(struct device *dev, enum hwmon_sensor_types type,
> +			  u32 attr, int chan, long *val)
> +{
> +	struct lochnagar_hwmon *priv = dev_get_drvdata(dev);
> +	int interval;
> +
> +	switch (type) {
> +	case hwmon_in:
> +		return read_sensor(dev, chan, LN2_VOLT, 1, LN2_VOLT_UNITS, val);
> +	case hwmon_curr:
> +		return read_sensor(dev, chan, LN2_CURR, 1, LN2_CURR_UNITS, val);
> +	case hwmon_temp:
> +		return read_sensor(dev, chan, LN2_TEMP, 1, LN2_TEMP_UNITS, val);
> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_average:
> +			return read_power(dev, chan, val);
> +		case hwmon_power_average_interval:
> +			interval = priv->power_nsamples[chan] * LN2_SAMPLE_US;
> +			*val = DIV_ROUND_CLOSEST(interval, 1000);
> +			return 0;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int lochnagar_read_string(struct device *dev,
> +				 enum hwmon_sensor_types type, u32 attr,
> +				 int chan, const char **str)
> +{
> +	switch (type) {
> +	case hwmon_in:
> +	case hwmon_curr:
> +	case hwmon_power:
> +		*str = lochnagar_chan_names[chan];
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int lochnagar_write(struct device *dev, enum hwmon_sensor_types type,
> +			   u32 attr, int chan, long val)
> +{
> +	struct lochnagar_hwmon *priv = dev_get_drvdata(dev);
> +
> +	if (type != hwmon_power || attr != hwmon_power_average_interval)
> +		return -EOPNOTSUPP;
> +
> +	val = clamp_t(long, val, 1, (LN2_MAX_NSAMPLE * LN2_SAMPLE_US) / 1000);
> +	val = DIV_ROUND_CLOSEST(val * 1000, LN2_SAMPLE_US);
> +
> +	priv->power_nsamples[chan] = val;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_ops lochnagar_ops = {
> +	.is_visible = lochnagar_is_visible,
> +	.read = lochnagar_read,
> +	.read_string = lochnagar_read_string,
> +	.write = lochnagar_write,
> +};
> +
> +static const struct hwmon_channel_info *lochnagar_info[] = {
> +	HWMON_CHANNEL_INFO(temp,  HWMON_T_INPUT),
> +	HWMON_CHANNEL_INFO(in,    HWMON_I_INPUT | HWMON_I_LABEL,
> +				  HWMON_I_INPUT | HWMON_I_LABEL,
> +				  HWMON_I_INPUT | HWMON_I_LABEL,
> +				  HWMON_I_INPUT | HWMON_I_LABEL,
> +				  HWMON_I_INPUT | HWMON_I_LABEL,
> +				  HWMON_I_INPUT | HWMON_I_LABEL,
> +				  HWMON_I_INPUT | HWMON_I_LABEL,
> +				  HWMON_I_INPUT | HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(curr,  HWMON_C_INPUT | HWMON_C_LABEL,
> +				  HWMON_C_INPUT | HWMON_C_LABEL,
> +				  HWMON_C_INPUT | HWMON_C_LABEL,
> +				  HWMON_C_INPUT | HWMON_C_LABEL,
> +				  HWMON_C_INPUT | HWMON_C_LABEL,
> +				  HWMON_C_INPUT | HWMON_C_LABEL,
> +				  HWMON_C_INPUT | HWMON_C_LABEL,
> +				  HWMON_C_INPUT | HWMON_C_LABEL),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_AVERAGE | HWMON_P_AVERAGE_INTERVAL |
> +				  HWMON_P_LABEL,
> +				  HWMON_P_AVERAGE | HWMON_P_AVERAGE_INTERVAL |
> +				  HWMON_P_LABEL,
> +				  HWMON_P_AVERAGE | HWMON_P_AVERAGE_INTERVAL |
> +				  HWMON_P_LABEL,
> +				  HWMON_P_AVERAGE | HWMON_P_AVERAGE_INTERVAL |
> +				  HWMON_P_LABEL,
> +				  HWMON_P_AVERAGE | HWMON_P_AVERAGE_INTERVAL |
> +				  HWMON_P_LABEL,
> +				  HWMON_P_AVERAGE | HWMON_P_AVERAGE_INTERVAL |
> +				  HWMON_P_LABEL,
> +				  HWMON_P_AVERAGE | HWMON_P_AVERAGE_INTERVAL |
> +				  HWMON_P_LABEL,
> +				  HWMON_P_AVERAGE | HWMON_P_AVERAGE_INTERVAL |
> +				  HWMON_P_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info lochnagar_chip_info = {
> +	.ops = &lochnagar_ops,
> +	.info = lochnagar_info,
> +};
> +
> +static const struct of_device_id lochnagar_of_match[] = {
> +	{ .compatible = "cirrus,lochnagar2-hwmon" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, lochnagar_of_match);
> +
> +static int lochnagar_hwmon_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device *hwmon_dev;
> +	struct lochnagar_hwmon *priv;
> +	int i;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	mutex_init(&priv->sensor_lock);
> +
> +	priv->regmap = dev_get_regmap(dev->parent, NULL);
> +	if (!priv->regmap) {
> +		dev_err(dev, "No register map found\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(priv->power_nsamples); i++)
> +		priv->power_nsamples[i] = 96;
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, "Lochnagar", priv,
> +							 &lochnagar_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static struct platform_driver lochnagar_hwmon_driver = {
> +	.driver = {
> +		.name = "lochnagar-hwmon",
> +		.of_match_table = lochnagar_of_match,
> +	},
> +	.probe = lochnagar_hwmon_probe,
> +};
> +module_platform_driver(lochnagar_hwmon_driver);
> +
> +MODULE_AUTHOR("Lucas Tanure <tanureal@opensource.cirrus.com>");
> +MODULE_DESCRIPTION("Lochnagar hardware monitoring features");
> +MODULE_LICENSE("GPL");
