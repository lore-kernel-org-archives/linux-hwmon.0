Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3379AC433B4
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 15:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA01F61460
	for <linux-hwmon@archiver.kernel.org>; Fri,  7 May 2021 15:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238018AbhEGPvV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 7 May 2021 11:51:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhEGPvV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 7 May 2021 11:51:21 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B10C061574;
        Fri,  7 May 2021 08:50:21 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id u16so9095102oiu.7;
        Fri, 07 May 2021 08:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BCXEifsSIMiSWAR3myTmFBlSRDjhQf4YbhNsdRoLxZc=;
        b=YeDs/9hXmcnPPiZtO2Vp4ON9DoqNU/vYNRzWDq7qlEgnbNlO43Takpn9kLjeAaHemb
         df4JwQuR+HLUxLRUbl4lCalnq/4dOxTiBsyf+Oe0tXnomT5YoXVYlG8PDrxm/W9g7TUd
         ZZUOf01NvL6C+O4Ewyad1WagjErIVDdxIXSeXYCLvWtI7lMKWsuDhujYrhO2l8zweRNC
         efFDPArJFXeJ4h2C0nEthugQWjGy292nZuPBncqY5N5LdV66Rh20LcNUHu+WxZ1FU1RA
         WIYKh8/q01oMQWlN+K8w5c/9j7KjxNYIG19cqGw7qNJ72JqBNohEcZbzr3rjttsJCzLx
         eq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BCXEifsSIMiSWAR3myTmFBlSRDjhQf4YbhNsdRoLxZc=;
        b=LRJjpovaYDvIcZxo/AAweTpuv0DwrgzaMb/z5DIHDx2QdvhYMKukaMmhVGBtNPB5hy
         DA6RVywql9t66U0SvNQUMnc2SsOz8Tyist9L2X5KyfZ8YAQMSEUwvuKsvzWFlBieo4a9
         fWM1evAsAFci47WaAHoZxejYaRC3Ov5GhyomBHoyKHNEo1A7IJcrW3UCQs27xLHy3iHf
         X1P8Zp89hy02IbrOsdxvcLsq+fxum2WYveFRWpV1lkR2a/KPMvC2hU0+cfXxB6etWewG
         hU0RDn5fFdVe6aHIZDtXQCZfNFwWWD78z1xVz2hbgTRVJj+DeYXufjwZTWz4RvMazzzq
         0eyg==
X-Gm-Message-State: AOAM532NoUPXP6pIN6TGnfxdnQI2q6D8CvslgaREquEq70hZavQ8YbqQ
        wQIhryP9hqAlbUF6VD/IdzUdfKdSpr4=
X-Google-Smtp-Source: ABdhPJxepSq5HMCfwUHkROdBmZYLNyDoMITbKtbRWNBUXnaaXQPhQ3tVLQcA/8mYLpGXbVnu9QuG5w==
X-Received: by 2002:aca:c30f:: with SMTP id t15mr7579110oif.145.1620402620432;
        Fri, 07 May 2021 08:50:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r19sm1179498ooj.5.2021.05.07.08.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 May 2021 08:50:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Vadim Pasternak <vadimp@nvidia.com>, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
References: <20210507145850.420889-1-vadimp@nvidia.com>
 <20210507145850.420889-3-vadimp@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH hwmon-next v5 2/3] hwmon: (pmbus) Add support for MPS
 Multi-phase mp2888 controller
Message-ID: <29ea0ad3-2bf1-26bf-b177-6cd88a7f4879@roeck-us.net>
Date:   Fri, 7 May 2021 08:50:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210507145850.420889-3-vadimp@nvidia.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 5/7/21 7:58 AM, Vadim Pasternak wrote:
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
>    setting of different formats on rails 1 and 2. For VID the following
>    protocols are available: VR13 mode with 5-mV DAC; VR13 mode with
>    10-mV DAC, IMVP9 mode with 5-mV DAC.
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> ---
> v4->v5
>   Comments pointed out by Guenter:
>   - Fix calculation of PMBUS_READ_VIN.
>   - Add mp2888_read_word_data() for limits setting.

mp2888_write_word_data()

>   - Treat PMBUS_POUT_OP_WARN_LIMIT in separate case.
>   - Drop tuning of "m[PSC_POWER]" and "m[PSC_CURRENT_OUT]" from probing
>     routine.
>   Fixes from Vadim:
>   - Treat PMBUS_IOUT_OC_WARN_LIMIT in separate case.
> 
> v3->v4
>   Comments pointed out by Guenter:
>    - Fix PMBUS_READ_VIN and limits calculations.
>    - Add comment for PMBUS_OT_WARN_LIMIT scaling.
>    - Fix PMBUS_READ_IOUT, PMBUS_READ_POUT, PMBUS_READ_PIN calculations.
>    - Enable PMBUS_IOUT_OC_WARN_LIMIT and PMBUS_POUT_OP_WARN_LIMIT.
>   Fixes from Vadim:
>    - Disable PMBUS_POUT_MAX. Device uses this register for different
>      purpose.
>    - Disable PMBUS_MFR_VOU_MIN. Device doe not implement this register.
>    - Update documentation file.
> 
> v2->v3
>   Comments pointed out by Guenter:
>   - Fix precision for PMBUS_READ_VIN (it requires adding scale for
>     PMBUS_VIN_OV_FAULT_LIMIT and PMBUS_VIN_UV_WARN_LIMIT.
>   - Fix precision for PMBUS_READ_TEMPERATURE_1 (it requires adding
>     scale for PMBUS_OT_WARN_LIMIT).
>   - Use DIV_ROUND_CLOSEST_ULL for scaling PMBUS_READ_POUT,
>     PMBUS_READ_PIN readouts.
>   Notes and fixes from Vadim:
>    - READ_IOUT in linear11 does not give write calculation (tested with
>      external load), while in direct format readouts are correct.
>    - Disable non-configured phases in mp2888_identify_multiphase().
> 
> v1->v2:
>   Comments pointed out by Guenter:
>    - Use standard access for getting PMBUS_OT_WARN_LIMIT,
>      PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_UV_WARN_LIMIT.
>    - Use linear11 conversion for PMBUS_READ_VIN, PMBUS_READ_POUT,
>      PMBUS_READ_PIN, PMBUS_READ_TEMPERATURE_1 and adjust coefficients.
>    - Add reading phases current from the dedicated registers.
>    - Add comment for not implemented or implemented not according to the
> 	spec registers, for which "ENXIO" code is returned.
>    - Set PMBUS_HAVE_IOUT" statically.
>    Notes from Vadim:
>    - READ_IOUT uses direct format, so I did not adjust it like the below
>      registers.
> ---
>   Documentation/hwmon/mp2888.rst | 113 +++++++++++
>   drivers/hwmon/pmbus/Kconfig    |   9 +
>   drivers/hwmon/pmbus/Makefile   |   1 +
>   drivers/hwmon/pmbus/mp2888.c   | 411 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 534 insertions(+)
>   create mode 100644 Documentation/hwmon/mp2888.rst
>   create mode 100644 drivers/hwmon/pmbus/mp2888.c
> 
> diff --git a/Documentation/hwmon/mp2888.rst b/Documentation/hwmon/mp2888.rst
> new file mode 100644
> index 000000000000..5e578fd7b147
> --- /dev/null
> +++ b/Documentation/hwmon/mp2888.rst
> @@ -0,0 +1,113 @@
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
> +**curr[1-{1+n}]_input**
> +
> +**curr[1-{1+n}]_label**
> +
> +**curr1_max**
> +
> +**curr1_max_alarm**
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
> +**power2_input**
> +
> +**power2_label**
> +
> +**power2_max**
> +
> +**power2_max_alarm**
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
>   	  This driver can also be built as a module. If so, the module will
>   	  be called max8688.
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
>   config SENSORS_MP2975
>   	tristate "MPS MP2975"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 6a4ba0fdc1db..a6d7352621ca 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_SENSORS_MAX20751)	+= max20751.o
>   obj-$(CONFIG_SENSORS_MAX31785)	+= max31785.o
>   obj-$(CONFIG_SENSORS_MAX34440)	+= max34440.o
>   obj-$(CONFIG_SENSORS_MAX8688)	+= max8688.o
> +obj-$(CONFIG_SENSORS_MP2888)	+= mp2888.o
>   obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
>   obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
>   obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
> diff --git a/drivers/hwmon/pmbus/mp2888.c b/drivers/hwmon/pmbus/mp2888.c
> new file mode 100644
> index 000000000000..1e72c8fd82fa
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2888.c
> @@ -0,0 +1,411 @@
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
> +#define MP2888_MFR_READ_CS1_2	0x73
> +#define MP2888_MFR_READ_CS3_4	0x74
> +#define MP2888_MFR_READ_CS5_6	0x75
> +#define MP2888_MFR_READ_CS7_8	0x76
> +#define MP2888_MFR_READ_CS9_10	0x77
> +#define MP2888_MFR_VR_CONFIG1	0xe1
> +
> +#define MP2888_TOTAL_CURRENT_RESOLUTION	BIT(3)
> +#define MP2888_PHASE_CURRENT_RESOLUTION	BIT(4)
> +#define MP2888_DRMOS_KCS		GENMASK(2, 0)
> +#define MP2888_TEMP_UNIT		10
> +#define MP2888_MAX_PHASE		10
> +
> +struct mp2888_data {
> +	struct pmbus_driver_info info;
> +	int total_curr_resolution;
> +	int phase_curr_resolution;
> +	int curr_sense_gain;
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
> +mp2888_current_sense_gain_and_resolution_get(struct i2c_client *client, struct mp2888_data *data)
> +{
> +	int ret;
> +
> +	/*
> +	 * Obtain DrMOS current sense gain of power stage from the register
> +	 * , bits 0-2. The value is selected as below:
> +	 * 00b - 5µA/A, 01b - 8.5µA/A, 10b - 9.7µA/A, 11b - 10µA/A. Other
> +	 * values are reserved.
> +	 */
> +	ret = i2c_smbus_read_word_data(client, MP2888_MFR_SYS_CONFIG);
> +	if (ret < 0)
> +		return ret;
> +
> +	switch (ret & MP2888_DRMOS_KCS) {
> +	case 0:
> +		data->curr_sense_gain = 85;
> +		break;
> +	case 1:
> +		data->curr_sense_gain = 97;
> +		break;
> +	case 2:
> +		data->curr_sense_gain = 100;
> +		break;
> +	case 3:
> +		data->curr_sense_gain = 50;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Obtain resolution selector for total and phase current report and protection.
> +	 * 0: original resolution; 1: half resolution (in such case phase current value should
> +	 * be doubled.
> +	 */
> +	data->total_curr_resolution = (ret & MP2888_TOTAL_CURRENT_RESOLUTION) >> 3;
> +	data->phase_curr_resolution = (ret & MP2888_PHASE_CURRENT_RESOLUTION) >> 4;
> +
> +	return 0;
> +}
> +
> +static int
> +mp2888_read_phase(struct i2c_client *client, struct mp2888_data *data, int page, int phase, u8 reg)
> +{
> +	int ret;
> +
> +	ret = pmbus_read_word_data(client, page, phase, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!((phase + 1) % 2))
> +		ret >>= 8;
> +	ret &= 0xff;
> +
> +	/*
> +	 * Output value is calculated as: (READ_CSx / 80 – 1.23) / (Kcs * Rcs)
> +	 * where:
> +	 * - Kcs is the DrMOS current sense gain of power stage, which is obtained from the
> +	 *   register MP2888_MFR_VR_CONFIG1, bits 13-12 with the following selection of DrMOS
> +	 *   (data->curr_sense_gain):
> +	 *   00b - 5µA/A, 01b - 8.5µA/A, 10b - 9.7µA/A, 11b - 10µA/A.
> +	 * - Rcs is the internal phase current sense resistor. This parameter depends on hardware
> +	 *   assembly. By default it is set to 1kΩ. In case of different assembly, user should
> +	 *   scale this parameter by dividing it by Rcs.
> +	 * If phase current resolution bit is set to 1, READ_CSx value should be doubled.
> +	 * Note, that current phase sensing, providing by the device is not accurate. This is
> +	 * because sampling of current occurrence of bit weight has a big deviation, especially for
> +	 * light load.
> +	 */
> +	ret = DIV_ROUND_CLOSEST(ret * 100 - 9800, data->curr_sense_gain);
> +	ret = (data->phase_curr_resolution) ? ret * 2 : ret;
> +	/* Scale according to total current resolution. */
> +	ret = (data->total_curr_resolution) ? ret * 8 : ret * 4;
> +	return ret;
> +}
> +
> +static int
> +mp2888_read_phases(struct i2c_client *client, struct mp2888_data *data, int page, int phase)
> +{
> +	int ret;
> +
> +	switch (phase) {
> +	case 0 ... 1:
> +		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS1_2);
> +		break;
> +	case 2 ... 3:
> +		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS3_4);
> +		break;
> +	case 4 ... 5:
> +		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS5_6);
> +		break;
> +	case 6 ... 7:
> +		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS7_8);
> +		break;
> +	case 8 ... 9:
> +		ret = mp2888_read_phase(client, data, page, phase, MP2888_MFR_READ_CS9_10);
> +		break;
> +	default:
> +		return -ENODATA;
> +	}
> +	return ret;
> +}
> +
> +static int mp2888_read_word_data(struct i2c_client *client, int page, int phase, int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp2888_data *data = to_mp2888_data(info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VIN:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret <= 0)
> +			return ret;
> +
> +		/*
> +		 * READ_VIN requires fixup to scale it to linear11 format. Register data format
> +		 * provides 10 bits for mantissa and 6 bits for exponent. Bits 15:10 are set with
> +		 * the fixed value 111011b.
> +		 */
> +		ret = (ret & GENMASK(9, 0)) | ((ret & GENMASK(31, 10)) << 1);
> +		break;
> +	case PMBUS_OT_WARN_LIMIT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * Chip reports limits in degrees C, but the actual temperature in 10th of
> +		 * degrees C - scaling is needed to match both.
> +		 */
> +		ret *= MP2888_TEMP_UNIT;
> +		break;
> +	case PMBUS_READ_IOUT:
> +		if (phase != 0xff)
> +			return mp2888_read_phases(client, data, page, phase);
> +
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * READ_IOUT register has unused bits 15:12 with fixed value 1110b. Clear these
> +		 * bits and scale with total current resolution. Data is provided in direct format.
> +		 */
> +		ret &= GENMASK(11, 0);
> +		ret = data->total_curr_resolution ? ret * 2 : ret;
> +		break;
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		ret &= GENMASK(9, 0);
> +		/*
> +		 * READ_OUT should be multiplied by 0.25 if total_current_resolution=0 and by 0.5
> +		 * if 1. IOUT_OC_WARN_LIMIT is not scaled if total_current_resolution=0 and should
> +		 * be multiplied by 2 if 1.
> +		 */

Please fix comments (same as below).

> +		ret = data->total_curr_resolution ? ret * 8 : ret * 4;
> +		break;
> +	case PMBUS_READ_POUT:
> +	case PMBUS_READ_PIN:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		ret = data->total_curr_resolution ? ret * 2 : ret;
> +		break;
> +	case PMBUS_POUT_OP_WARN_LIMIT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +		/*
> +		 * READ_POUT should be multiplied by 0.5 if total_current_resolution=0 and is not

multiplied by 2 if total_current_resolution=1 ? At least that would match the code above.

> +		 * scaled if 1. IOUT_OC_WARN_LIMIT is not scaled if total_current_resolution=0 and

The first part of the comment belongs to PMBUS_READ_POUT/PMBUS_READ_PIN and
should be "multipleied by 2", and the second part doesn't describe what is done here.

> +		 * should be multiplied by 2 if 1.
> +		 */
> +		ret = data->total_curr_resolution ? ret * 4 : ret * 2;
> +		break;
> +	/*
> +	 * The below registers are not implemented by device or implemented not according to the
> +	 * spec. Skip all of them to avoid exposing non-relevant inputs to sysfs.
> +	 */
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
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +	case PMBUS_POUT_MAX:
> +	case PMBUS_IOUT_UC_FAULT_LIMIT:
> +	case PMBUS_POUT_OP_FAULT_LIMIT:
> +	case PMBUS_PIN_OP_WARN_LIMIT:
> +	case PMBUS_MFR_VIN_MIN:
> +	case PMBUS_MFR_VOUT_MIN:
> +	case PMBUS_MFR_VIN_MAX:
> +	case PMBUS_MFR_VOUT_MAX:
> +	case PMBUS_MFR_IIN_MAX:
> +	case PMBUS_MFR_IOUT_MAX:
> +	case PMBUS_MFR_PIN_MAX:
> +	case PMBUS_MFR_POUT_MAX:
> +	case PMBUS_MFR_MAX_TEMP_1:
> +		return -ENXIO;
> +	default:
> +		return -ENODATA;
> +	}
> +
> +	return ret;
> +}
> +
> +static int mp2888_write_word_data(struct i2c_client *client, int page, int reg, u16 word)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp2888_data *data = to_mp2888_data(info);
> +
> +	switch (reg) {
> +	case PMBUS_OT_WARN_LIMIT:
> +		word = DIV_ROUND_CLOSEST((int)word, MP2888_TEMP_UNIT);

Are those typecasts really needed ? That would surprise me. You are clamping
against negative values below, but that can not really happen since word
is u16 and, after the above code (u16 0xffff will be int 0xffff divided by 10,
or 6554), will never have bit 15 set. So the question is if 0xffff represents -1
or if it represents 6554. Either case some of the code is wrong (unless I am
missing something, of course ;-).

> +		/* Drop unused bits 15:8. */
> +		word = ((s16)word < 0) ? 0 : clamp_val(word, 0, GENMASK(7, 0));
> +		break;
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +		/* Fix limit according to total curent resolution. */
> +		word = data->total_curr_resolution ? DIV_ROUND_CLOSEST((int)word, 8) :
> +		       DIV_ROUND_CLOSEST((int)word, 4);
> +		/* Drop unused bits 15:10. */

Same here. word will never have the most significant bit set, and (s16)word will never be
negative.

> +		word = ((s16)word < 0) ? 0 : clamp_val(word, 0, GENMASK(9, 0));
> +		break;
> +	case PMBUS_POUT_OP_WARN_LIMIT:
> +		/* Fix limit according to total curent resolution. */
> +		word = data->total_curr_resolution ? DIV_ROUND_CLOSEST((int)word, 4) :
> +		       DIV_ROUND_CLOSEST((int)word, 2);

and again.

> +		/* Drop unused bits 15:10. */
> +		word = ((s16)word < 0) ? 0 : clamp_val(word, 0, GENMASK(9, 0));
> +		break;
> +	default:
> +		return -ENODATA;
> +	}
> +	return pmbus_write_word_data(client, page, reg, word);
> +}
> +
> +static int
> +mp2888_identify_multiphase(struct i2c_client *client, struct mp2888_data *data,
> +			   struct pmbus_driver_info *info)
> +{
> +	int i, ret;
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
> +	/* Disable non-configured phases. */
> +	for (i = info->phases[0]; i < MP2888_MAX_PHASE; i++)
> +		info->pfunc[i] = 0;
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
> +	.R[PSC_TEMPERATURE] = 1,
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.R[PSC_VOLTAGE_OUT] = 3,
> +	.m[PSC_CURRENT_OUT] = 4,
> +	.m[PSC_POWER] = 1,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_IOUT |
> +		   PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +		   PMBUS_HAVE_POUT | PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT |
> +		   PMBUS_PHASE_VIRTUAL,
> +	.pfunc[0] = PMBUS_HAVE_IOUT,
> +	.pfunc[1] = PMBUS_HAVE_IOUT,
> +	.pfunc[2] = PMBUS_HAVE_IOUT,
> +	.pfunc[3] = PMBUS_HAVE_IOUT,
> +	.pfunc[4] = PMBUS_HAVE_IOUT,
> +	.pfunc[5] = PMBUS_HAVE_IOUT,
> +	.pfunc[6] = PMBUS_HAVE_IOUT,
> +	.pfunc[7] = PMBUS_HAVE_IOUT,
> +	.pfunc[8] = PMBUS_HAVE_IOUT,
> +	.pfunc[9] = PMBUS_HAVE_IOUT,
> +	.read_byte_data = mp2888_read_byte_data,
> +	.read_word_data = mp2888_read_word_data,
> +	.write_word_data = mp2888_write_word_data,
> +};
> +
> +static int mp2888_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +	struct mp2888_data *data;
> +	int ret;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct mp2888_data), GFP_KERNEL);
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
> +	/* Obtain current sense gain of power stage and current resolution. */
> +	ret = mp2888_current_sense_gain_and_resolution_get(client, data);
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

