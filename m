Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A43C433B4
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 16:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D7503610A2
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Apr 2021 16:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232144AbhDHQuX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Apr 2021 12:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbhDHQuX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 8 Apr 2021 12:50:23 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC4FEC061760;
        Thu,  8 Apr 2021 09:50:11 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id m13so2802862oiw.13;
        Thu, 08 Apr 2021 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FQ4T8w7sHRu8ecbif7/+BylKxPSa3biTd9hS5A12YWc=;
        b=KcNotqsGTCDQeSnTePrs8MAzYfa+Y5zpC+QKOeB/QJGF8jWcb/z24L2BPjQ1euhkSD
         +/J5Cu3BIfJKPq7axVwivylFnd5RhZFWe5u2RkRnKwyxam3747GdGK0ZAcfiHlvVOiEZ
         6L1qN3I31Si0Qtd6uJY9dJ6+y0PSAaeIMtrBlor7sWgBgPJfxCBTvFOv5ghItrJBBuzh
         OXu3cwT/Be8QwFYuHjwLnDGx32AdaMQwuUf215le0ngsQzR8Nwmm6fyQHHSKID7IKaiP
         nkdix5UQD+vcZRJ6IFc5VylngboKX0JulOp9EgAq7nTde03499K+odU4oZ7WaRhqazaE
         bE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=FQ4T8w7sHRu8ecbif7/+BylKxPSa3biTd9hS5A12YWc=;
        b=ejLjjlojvTChHD/dmKO14ht1JunxDlcxWursDN3gXNEumSlJEd/LnpUuA8yf0oiyJU
         zfeQi6GblclMheyrX2LKvb2PsU6JjIn4zHRDUAbDwdw55RAXZLIa+IMm9TUCN5xRo6Fw
         IVXuLOF9BORhuTEGc4sgAFc4AQcrXxLjxtTkk3w7TKPz62eZm/h6Okgl+RcOgjFE/xuj
         LZ5o5vHxALf7UxIMwUr5tI3aDh5q5ZrBahbPlxg6aiWxfKOcOekSsS9jWuSPZf0GN0xQ
         sK1n3xUgew6aypK1JBC4gDkRD6vO+o3YWbj6vMPjfNQ2yoivth8BSEoUxlN4gEOPz91X
         AwyQ==
X-Gm-Message-State: AOAM531r2IFlVjZ7U739+iugxfcvDAN2XSiOVkWQUeWXV3wbmLnB0PRu
        5L6iDLK/Kph98O7AigWhEeMV78NeWZE=
X-Google-Smtp-Source: ABdhPJwx2x31lsaTPZjmx6fJEYhpV0DmH7Vblhah0erWlTb4pgHCNpolpJEXSEL7T7nd7+yLHKXrnQ==
X-Received: by 2002:aca:1c18:: with SMTP id c24mr6687217oic.7.1617900610954;
        Thu, 08 Apr 2021 09:50:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m14sm6381156otn.69.2021.04.08.09.50.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 09:50:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH hwmon-next 2/3] hwmon: (pmbus) Add support for MPS
 Multi-phase mp2888 controller
To:     Vadim Pasternak <vadimp@nvidia.com>, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <20210408141726.2561683-1-vadimp@nvidia.com>
 <20210408141726.2561683-3-vadimp@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <bbc94377-9c0d-81a0-ba5f-491f9666aeff@roeck-us.net>
Date:   Thu, 8 Apr 2021 09:50:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210408141726.2561683-3-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/8/21 7:17 AM, Vadim Pasternak wrote:
> Add support for mp2888 device from Monolithic Power Systems, Inc. (MPS)
> vendor. This is a digital, multi-phase, pulse-width modulation
> controller.
> 
> This device supports:
> - One power rail.
> - Programmable Multi-Phase up to 10 Phases.
> - PWM-VID Interface
> - One pages 0 for telemetry.
> - Programmable pins for PMBus Address.
> - Built-In EEPROM to Store Custom Configurations.
> - Can configured VOUT readout in direct or VID format and allows
>   setting of different formats on rails 1 and 2. For VID the following
>   protocols are available: VR13 mode with 5-mV DAC; VR13 mode with
>   10-mV DAC, IMVP9 mode with 5-mV DAC.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
>  Documentation/hwmon/mp2888.rst | 111 ++++++++++++++++++
>  drivers/hwmon/pmbus/Kconfig    |   9 ++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/mp2888.c   | 256 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 377 insertions(+)
>  create mode 100644 Documentation/hwmon/mp2888.rst
>  create mode 100644 drivers/hwmon/pmbus/mp2888.c
> 
> diff --git a/Documentation/hwmon/mp2888.rst b/Documentation/hwmon/mp2888.rst
> new file mode 100644
> index 000000000000..7839a010642a
> --- /dev/null
> +++ b/Documentation/hwmon/mp2888.rst
> @@ -0,0 +1,111 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp2888
> +====================
> +
> +Supported chips:
> +
> +  * MPS MP12254
> +
> +    Prefix: 'mp2888'
> +
> +Author:
> +
> +	Vadim Pasternak <vadimp@nvidia.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +vendor dual-loop, digital, multi-phase controller MP2888.
> +
> +This device: supports:
> +
> +- One power rail.
> +- Programmable Multi-Phase up to 10 Phases.
> +- PWM-VID Interface
> +- One pages 0 for telemetry.
> +- Programmable pins for PMBus Address.
> +- Built-In EEPROM to Store Custom Configurations.
> +
> +Device complaint with:
> +
> +- PMBus rev 1.3 interface.
> +
> +Device supports direct format for reading output current, output voltage,
> +input and output power and temperature.
> +Device supports linear format for reading input voltage and input power.
> +
> +The driver provides the next attributes for the current:
> +
> +- for current out input and maximum alarm;
> +- for phase current: input and label.
> +
> +The driver exports the following attributes via the 'sysfs' files, where:
> +
> +- 'n' is number of configured phases (from 1 to 10);
> +- index 1 for "iout";
> +- indexes 2 ... 1 + n for phases.
> +
> +**curr1_alarm**
> +
> +**curr[1-{1+n}]_input**
> +
> +**curr[1-{1+n}]_label**
> +
> +The driver provides the next attributes for the voltage:
> +
> +- for voltage in: input, low and high critical thresholds, low and high
> +  critical alarms;
> +- for voltage out: input and high alarm;
> +
> +The driver exports the following attributes via the 'sysfs' files, where
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +**in2_alarm**
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +The driver provides the next attributes for the power:
> +
> +- for power in alarm and input.
> +- for power out: cap, cap alarm an input.
> +
> +The driver exports the following attributes via the 'sysfs' files, where
> +- indexes 1 for "pin";
> +- indexes 2 for "pout";
> +
> +**power1_alarm**
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +**power2_cap**
> +
> +**power2_cap_alarm**
> +
> +**power2_input**
> +
> +**power2_label**
> +
> +The driver provides the next attributes for the temperature:
> +
> +**temp1_input**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index 32d2fc850621..a57571928b31 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -211,6 +211,15 @@ config SENSORS_MAX8688
>  	  This driver can also be built as a module. If so, the module will
>  	  be called max8688.
>  
> +config SENSORS_MP2888
> +	tristate "MPS MP2888"
> +	help
> +	  If you say yes here you get hardware monitoring support for MPS
> +	  MP2888 Digital, Multi-Phase, Pulse-Width Modulation Controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mp2888.
> +
>  config SENSORS_MP2975
>  	tristate "MPS MP2975"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 6a4ba0fdc1db..a6d7352621ca 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>  obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>  obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>  obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> +obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>  obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>  obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
> diff --git a/drivers/hwmon/pmbus/mp2888.c b/drivers/hwmon/pmbus/mp2888.c
> new file mode 100644
> index 000000000000..3d4b272616c6
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2888.c
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers
> + *
> + * Copyright (C) 2020 Nvidia Technologies Ltd.
> + */
> +
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include "pmbus.h"
> +
> +/* Vendor specific registers. */
> +#define MP2888_MFR_SYS_CONFIG	0x44
> +#define MP2888_MFR_VR_CONFIG1	0xe1
> +
> +#define MP2888_TOTAL_CURRENT_RESOLUTION	BIT(3)
> +#define MP2888_VIN_LIMIT_UNIT		8
> +#define MP2888_VIN_UNIT			3125
> +#define MP2888_TEMP_UNIT		10
> +#define MP2888_MAX_PHASE		10
> +
> +struct mp2888_data {
> +	struct pmbus_driver_info info;
> +	int total_curr_resolution;
> +};
> +
> +#define to_mp2888_data(x)  container_of(x, struct mp2888_data, info)
> +
> +static int mp2888_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		/* Enforce VOUT direct format. */
> +		return PB_VOUT_MODE_DIRECT;
> +	default:
> +		return -ENODATA;
> +	}
> +}
> +
> +static int
> +mp2888_read_word_helper(struct i2c_client *client, int page, int phase, u8 reg, u16 mask)
> +{
> +	int ret = pmbus_read_word_data(client, page, phase, reg);
> +
> +	return (ret > 0) ? ret & mask : ret;
> +}
> +
> +static int mp2888_read_word_data(struct i2c_client *client, int page, int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp2888_data *data = to_mp2888_data(info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_OT_WARN_LIMIT:
> +		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(7, 0));
> +		break;

Explanation needed: The register map states that the upper bits read 0.
If that is unreliable, it needs to be documented here. This applies
to all masked operations.

> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(7, 0));
> +		ret = (ret < 0) ? ret : DIV_ROUND_CLOSEST(ret, MP2888_VIN_LIMIT_UNIT);

Limits are linear, and the exponent is supposed to be reported in the register.
Why override it ? Seems to me this code causes resolution loss.

> +		break;
> +	case PMBUS_READ_VIN:
> +		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(9, 0));
> +		ret = (ret < 0) ? ret : DIV_ROUND_CLOSEST(ret * MP2888_VIN_UNIT, 100000);
> +		break;

Again, this must cause a significant loss of accuracy. Why not just add in the linear11
exponent ?

> +	case PMBUS_READ_VOUT:
> +		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
> +		break;
> +	case PMBUS_READ_TEMPERATURE_1:
> +		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
> +		ret = (ret < 0) ? ret : DIV_ROUND_CLOSEST(ret, MP2888_TEMP_UNIT);

Better use linear11 and add the exponent (or fix the coefficients).

> +		break;
> +	case PMBUS_READ_IOUT:
> +		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
> +		ret = (ret < 0) ? ret : data->total_curr_resolution ? DIV_ROUND_CLOSEST(ret, 2) :
> +		      DIV_ROUND_CLOSEST(ret, 4);

I understand this can't use linear11 because that would drop/misinterpret the
upper bits, but it would be better to adjust the coefficients instead of
accepting a loss of accuracy here.

> +		/*
> +		 * Current phase sensing, providing by the device through the dedicated
> +		 * registers 73h - 77h is not accurate, because sampling of current occurrence of
> +		 * bit weight has a big deviation. Calculate per-phase current as total current
> +		 * divided by number phases.
> +		 */
> +		if (phase != 0xff)
> +			ret = (ret < 0) ? ret : DIV_ROUND_CLOSEST(ret, data->info.phases[page]);

If this is indeed the case, I'd argue that phase support is quite useless. The whole point
of it is to show load per phase, even if it is not perfect. Either live with the inaccuracy
and document it, or drop multi-phase support (and document why it isn't supported).

Note that all multi-phase controllers I have seen report inaccurate currents for the multiple
phases.

> +		break;
> +	case PMBUS_READ_POUT:
> +	case PMBUS_READ_PIN:
> +		ret = mp2888_read_word_helper(client, page, phase, reg, GENMASK(11, 0));
> +		ret = (ret < 0) ? ret : data->total_curr_resolution ? ret :
> +		      DIV_ROUND_CLOSEST(ret, 2);

Same as above. Adjusting coefficients would be better and easier than loss
of resolution.

> +		break;
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_UT_WARN_LIMIT:
> +	case PMBUS_UT_FAULT_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_VOUT_OV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_IOUT_OC_LV_FAULT_LIMIT:
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +	case PMBUS_IOUT_UC_FAULT_LIMIT:
> +	case PMBUS_POUT_OP_FAULT_LIMIT:
> +	case PMBUS_POUT_OP_WARN_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +	case PMBUS_MFR_VIN_MIN:
> +	case PMBUS_MFR_VIN_MAX:
> +	case PMBUS_MFR_VOUT_MAX:
> +	case PMBUS_MFR_IIN_MAX:
> +	case PMBUS_MFR_IOUT_MAX:
> +	case PMBUS_MFR_PIN_MAX:
> +	case PMBUS_MFR_POUT_MAX:
> +	case PMBUS_MFR_MAX_TEMP_1:
> +		return -ENXIO;

This needs explanation. Does the chip misbehave if accesses to those registers
are attempted ? If so, document/explain it. Otherwise drop the code.

> +	default:
> +		return -ENODATA;
> +	}
> +
> +	return ret;
> +}
> +
> +static void mp2888_set_phase(struct pmbus_driver_info *info)
> +{
> +	int i;
> +
> +	for (i = 0 ; i < info->phases[0]; i++)
> +		info->pfunc[i] = PMBUS_HAVE_IOUT;

You can just set that statically. It won't be used if a phase is disabled.

> +}
> +
> +static int
> +mp2888_identify_multiphase(struct i2c_client *client, struct mp2888_data *data,
> +			   struct pmbus_driver_info *info)
> +{
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Identify multiphase number - could be from 1 to 10. */
> +	ret = i2c_smbus_read_word_data(client, MP2888_MFR_VR_CONFIG1);
> +	if (ret <= 0)
> +		return ret;
> +
> +	info->phases[0] = ret & GENMASK(3, 0);
> +
> +	/*
> +	 * The device provides a total of 10 PWM pins, and can be configured to different phase
> +	 * count applications for rail.
> +	 */
> +	if (info->phases[0] > MP2888_MAX_PHASE)
> +		return -EINVAL;
> +
> +	mp2888_set_phase(info);
> +
> +	return 0;
> +}
> +
> +static int mp2888_current_resolution_get(struct i2c_client *client, struct mp2888_data *data)
> +{
> +	int ret;
> +
> +	/*
> +	 * Obtain resolution selector for total current report and protection.
> +	 * 0: original resolution; 1: half resolution (in such case phase current value should
> +	 * be doubled.
> +	 */
> +	ret = i2c_smbus_read_word_data(client, MP2888_MFR_SYS_CONFIG);
> +	if (ret < 0)
> +		return ret;
> +	data->total_curr_resolution = (ret & MP2888_TOTAL_CURRENT_RESOLUTION) >> 3;
> +
> +	return 0;
> +}
> +
> +static struct pmbus_driver_info mp2888_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.m[PSC_TEMPERATURE] = 1,
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.R[PSC_VOLTAGE_OUT] = 3,
> +	.m[PSC_CURRENT_OUT] = 1,
> +	.m[PSC_POWER] = 1,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |
> +		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		   PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> +		   PMBUS_PHASE_VIRTUAL,
> +	.read_byte_data = mp2888_read_byte_data,
> +	.read_word_data = mp2888_read_word_data,
> +};
> +
> +static int mp2888_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +	struct mp2888_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct mp2888_data),
> +			    GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &mp2888_info, sizeof(*info));
> +	info = &data->info;
> +
> +	/* Identify multiphase configuration. */
> +	ret = mp2888_identify_multiphase(client, data, info);
> +	if (ret)
> +		return ret;
> +
> +	/* Obtain total current resolution. */
> +	ret = mp2888_current_resolution_get(client, data);
> +	if (ret)
> +		return ret;
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct i2c_device_id mp2888_id[] = {
> +	{"mp2888", 0},
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(i2c, mp2888_id);
> +
> +static const struct of_device_id __maybe_unused mp2888_of_match[] = {
> +	{.compatible = "mps,mp2888"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mp2888_of_match);
> +
> +static struct i2c_driver mp2888_driver = {
> +	.driver = {
> +		.name = "mp2888",
> +		.of_match_table = of_match_ptr(mp2888_of_match),
> +	},
> +	.probe_new = mp2888_probe,
> +	.id_table = mp2888_id,
> +};
> +
> +module_i2c_driver(mp2888_driver);
> +
> +MODULE_AUTHOR("Vadim Pasternak <vadimp@nvidia.com>");
> +MODULE_DESCRIPTION("PMBus driver for MPS MP2888 device");
> +MODULE_LICENSE("GPL");
> 

