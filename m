Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AC37419B
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 19:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773948841; cv=none; b=QwLgv4e/3f2JbvkfVMUanYV7sgLI2/BxK+yO4g12TdJ/KzoUiWbNgm2DhXWTiT+wu0kaBKcFRlIIXPOeqAcauvbNwv9c6tfoyZ5Kh1AF8OmjPjkxNYetTrRDJBorCtxyivOy2xGbsD0at0aQyug2uJ+D9APmgNWun4IEywqAmHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773948841; c=relaxed/simple;
	bh=CsPW5FWxD7CCAajcBs2GMKCVGjaHMoDxdTmmVRCnX8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ux8Ei59E8OKrzZxilimwZtMuJu4uNrGw036IRCAuwxtZ9puFjPMvqR8IJC1JQN5EzMt5FqyB/gwoclBFhluqHEbSsg7zu0ZhytFr5UhF+psCjel8dniore6Qv7wnvHLS4nP5tJcg91AntQn2eUb9SudPQmPAXybSQQmsNg3Zzeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CdFMWoBn; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CdFMWoBn"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2ba895adfeaso1505639eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 12:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773948839; x=1774553639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GVz6VDm3FG8aSgFPzgKeXVLaT91jHQ5dIvUoadUIGNo=;
        b=CdFMWoBnczhd2qYd4vvsU7hJRgldjJcz2u6bKM2H4ZOhPiXdNk7+vlVD3aki/mMQtq
         i0xGjiNSRTHOlcgb4Udz1L7TDWJMQFb5VWUDa7fuh00kkv5svE+QdAuT6GUpf+BJYWe8
         WAhxx4HCYZ9Hf1RUmrpwmk/c5WKq2Ij1/8kOgNYmZX+IwH6aQ8ir8MlDcoLL12sIfv/Q
         hWX4eZbzjJ9AaedwTXoo90RO738xO3/b5zVOgdNzyrBDuxV35GdkO6pm+uTsLHxbaAtc
         fEXgvWBD2bO5WczggkmeKbZN/brTROb2WL3wdBhiYbeQ5DMiF4u8a6zwYwABKQJAq2/w
         YBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773948839; x=1774553639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVz6VDm3FG8aSgFPzgKeXVLaT91jHQ5dIvUoadUIGNo=;
        b=WKCVIRikz9kfuiGYarGQ88Nru3n0A1e+8yk504OD8pfxdP0gqVkil53I4MYJ3ambjh
         BJtkPgtxOwsdvzVg/Y72CJD4hQQDF6H4xOtFHywPV3muCeHqnsJff/SP2ylHxW90WyUk
         qbEjn3M9ipmeCFqrYfjauJhlCPh4fNpPHNt4Gucg03BgWPNv2knU98ZI+d9mebAyrA9e
         12HhHobn5CEeZsvEx8EdBKi0t+td2LZf2wNp8IUvbaO/glcWWSwZzHpWNRmZ/nRSzxbE
         pgNYXt4vt8kJcERzEhQ3uYKq00/hkDfkQS3FfU6oyR/PvcdCcXSCXrmlD+qgABfiMEWo
         2V/A==
X-Forwarded-Encrypted: i=1; AJvYcCV4wazO7pr5t10fi/pT0e/oDPZzwvFxQLtxh9sk0Q+eAngofm82ekKjzI3mMerJm5SBt4K6E8mY+TklSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTt6GEG3D/OykTyQeQSbcltdP/FlfpA8NXj0v9H3+xJAuV2bNx
	+KlJ7l4zE8wpV9sDr46CvQMxd/GpcV3iqodXHrSnwrsu5jSlymZ9hOVluGxJ1Q==
X-Gm-Gg: ATEYQzxJKBUMl6PlGiLRMJ9axNJmu72zwaqNnUb60fM9nlARZFQBx5gBLnnSwN+UXbp
	Ev8Sz1p6st3aBEZiUdjpM34pqgUGZXpJY5RRcqXRIG4Qx/362cDVOA27TW0eLuIZgC28NTcBWJU
	bBjOsoTvbCexYBb+Y95KqAT270w6n+hvEH5YxSX7YRCzvtX4w0zMo9DehGzan1EvmVPES+fybq/
	mULFBGF2Zx7x+mhEhCo0V4bOQVFTCZWJe8E6bpHu07wWyWGXLXJeAJPtKiG4VUbqRXZiaoywktc
	cEPs9ueCjcoGAayTKDoN02odzlM8KmIAxZ4SZzzOU7glHgA/9r5KVAAAJMlxhSkyr6hd3IXlGc7
	21l2VF/fcekNjUbI9adEIPYa2qFpWNcLbKMN9XUKAwW7yypt4N3EBTk+4pB0PnyKlpj7shTryYx
	Svwr1i6wbYnExIe9IHMY1mrbfpMaHX3HQKA2Ldr22RBu/ZkF/MppT0olw0P++ihqvf3NtkAkh+/
	Q8UYx5e7jM=
X-Received: by 2002:a05:7300:548:b0:2c0:fd7c:ddf4 with SMTP id 5a478bee46e88-2c109752dd0mr315707eec.21.1773948839009;
        Thu, 19 Mar 2026 12:33:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm4528eec.29.2026.03.19.12.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 12:33:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c0acce91-ffba-4ca8-8bd7-df4ad50ee4fb@roeck-us.net>
Date: Thu, 19 Mar 2026 12:33:57 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: add MP2985 driver
To: wenswang@yeah.net, krzk+dt@kernel.org, conor+dt@kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260319060118.643352-1-wenswang@yeah.net>
 <20260319060318.643572-1-wenswang@yeah.net>
 <20260319060318.643572-2-wenswang@yeah.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260319060318.643572-2-wenswang@yeah.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/18/26 23:03, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mp2985 controller. This driver exposes
> telemetry and limit value readings and writtings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>

Please check:

https://sashiko.dev/#/patchset/20260319060318.643572-1-wenswang%40yeah.net

It appears to me that the findings are real. Please have a look.

Thanks,
Guenter

> ---
> v1 -> v2:
>      1. remove duplicate entry in mp2985.rst
>      2. clamp vout value to 32767
>      3. simplify the code for obtaining PMBUS_VOUT_MODE bit value
>      4. add comment for explaining MP2985 supported vout mode
>      5. switch back to previous page after obtaining vid scale to avoid
>         confusing the PMBus core
> 
>   Documentation/hwmon/index.rst  |   1 +
>   Documentation/hwmon/mp2985.rst | 147 +++++++++++++
>   MAINTAINERS                    |   7 +
>   drivers/hwmon/pmbus/Kconfig    |   9 +
>   drivers/hwmon/pmbus/Makefile   |   1 +
>   drivers/hwmon/pmbus/mp2985.c   | 377 +++++++++++++++++++++++++++++++++
>   6 files changed, 542 insertions(+)
>   create mode 100644 Documentation/hwmon/mp2985.rst
>   create mode 100644 drivers/hwmon/pmbus/mp2985.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index b2ca8513cfcd..1b7007f41b39 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -183,6 +183,7 @@ Hardware Monitoring Kernel Drivers
>      mp2925
>      mp29502
>      mp2975
> +   mp2985
>      mp2993
>      mp5023
>      mp5920
> diff --git a/Documentation/hwmon/mp2985.rst b/Documentation/hwmon/mp2985.rst
> new file mode 100644
> index 000000000000..87a39c8a300c
> --- /dev/null
> +++ b/Documentation/hwmon/mp2985.rst
> @@ -0,0 +1,147 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp2985
> +====================
> +
> +Supported chips:
> +
> +  * MPS mp2985
> +
> +    Prefix: 'mp2985'
> +
> +Author:
> +
> +	Wensheng Wang <wenswang@yeah.net>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +MP2985 Dual Loop Digital Multi-phase Controller.
> +
> +Device compliant with:
> +
> +- PMBus rev 1.3 interface.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_crit**
> +
> +**in1_crit_alarm**
> +
> +**in1_lcrit**
> +
> +**in1_lcrit_alarm**
> +
> +**in1_max**
> +
> +**in1_max_alarm**
> +
> +**in1_min**
> +
> +**in1_min_alarm**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_crit**
> +
> +**in2_crit_alarm**
> +
> +**in2_lcrit**
> +
> +**in2_lcrit_alarm**
> +
> +**in3_input**
> +
> +**in3_label**
> +
> +**in3_crit**
> +
> +**in3_crit_alarm**
> +
> +**in3_lcrit**
> +
> +**in3_lcrit_alarm**
> +
> +The driver provides the following attributes for input current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr2_input**
> +
> +**curr2_label**
> +
> +**curr2_crit**
> +
> +**curr2_crit_alarm**
> +
> +**curr2_max**
> +
> +**curr2_max_alarm**
> +
> +**curr3_input**
> +
> +**curr3_label**
> +
> +**curr3_crit**
> +
> +**curr3_crit_alarm**
> +
> +**curr3_max**
> +
> +**curr3_max_alarm**
> +
> +The driver provides the following attributes for input power:
> +
> +**power1_input**
> +
> +**power1_label**
> +
> +**power2_input**
> +
> +**power2_label**
> +
> +The driver provides the following attributes for output power:
> +
> +**power3_input**
> +
> +**power3_label**
> +
> +**power4_input**
> +
> +**power4_label**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_crit**
> +
> +**temp1_crit_alarm**
> +
> +**temp1_max**
> +
> +**temp1_max_alarm**
> +
> +**temp2_input**
> +
> +**temp2_crit**
> +
> +**temp2_crit_alarm**
> +
> +**temp2_max**
> +
> +**temp2_max_alarm**
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d7241695df96..ac62dbaef34d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17920,6 +17920,13 @@ S:	Maintained
>   F:	Documentation/hwmon/mp29502.rst
>   F:	drivers/hwmon/pmbus/mp29502.c
>   
> +MPS MP2985 DRIVER
> +M:	Wensheng Wang <wenswang@yeah.net>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/mp2985.rst
> +F:	drivers/hwmon/pmbus/mp2985.c
> +
>   MPS MP2993 DRIVER
>   M:	Noah Wang <noahwang.wang@outlook.com>
>   L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index fc1273abe357..83fe5866c083 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -447,6 +447,15 @@ config SENSORS_MP2975
>   	  This driver can also be built as a module. If so, the module will
>   	  be called mp2975.
>   
> +config SENSORS_MP2985
> +	tristate "MPS MP2985"
> +	help
> +	  If you say yes here you get hardware monitoring support for MPS
> +	  MP2985 Dual Loop Digital Multi-Phase Controller.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called mp2985.
> +
>   config SENSORS_MP2993
>   	tristate "MPS MP2993"
>   	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d6c86924f887..24505bbee2b0 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -45,6 +45,7 @@ obj-$(CONFIG_SENSORS_MP2891)	+= mp2891.o
>   obj-$(CONFIG_SENSORS_MP2925)	+= mp2925.o
>   obj-$(CONFIG_SENSORS_MP29502)	+= mp29502.o
>   obj-$(CONFIG_SENSORS_MP2975)	+= mp2975.o
> +obj-$(CONFIG_SENSORS_MP2985)	+= mp2985.o
>   obj-$(CONFIG_SENSORS_MP2993)	+= mp2993.o
>   obj-$(CONFIG_SENSORS_MP5023)	+= mp5023.o
>   obj-$(CONFIG_SENSORS_MP5920)	+= mp5920.o
> diff --git a/drivers/hwmon/pmbus/mp2985.c b/drivers/hwmon/pmbus/mp2985.c
> new file mode 100644
> index 000000000000..df0934ebcaa0
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/mp2985.c
> @@ -0,0 +1,377 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for MPS Multi-phase Digital VR Controllers(MP2985)
> + *
> + * Copyright (C) 2026 MPS
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include "pmbus.h"
> +
> +/*
> + * Vender specific register READ_PIN_EST(0x93), READ_IIN_EST(0x8E),
> + * MFR_VR_MULTI_CONFIG_R1(0x0D) and MFR_VR_MULTI_CONFIG_R2(0x1D).
> + * The READ_PIN_EST is used to read pin telemetry, the READ_IIN_EST
> + * is used to read iin telemetry and the MFR_VR_MULTI_CONFIG_R1,
> + * MFR_VR_MULTI_CONFIG_R2 are used to obtain vid scale.
> + */
> +#define READ_PIN_EST	0x93
> +#define READ_IIN_EST	0x8E
> +#define MFR_VR_MULTI_CONFIG_R1	0x0D
> +#define MFR_VR_MULTI_CONFIG_R2	0x1D
> +
> +#define MP2985_VOUT_DIV	512
> +#define MP2985_VOUT_OVUV_UINT	195
> +#define MP2985_VOUT_OVUV_DIV	100
> +
> +#define MP2985_PAGE_NUM	2
> +
> +#define MP2985_RAIL1_FUNC	(PMBUS_HAVE_VIN | PMBUS_HAVE_PIN | \
> +							 PMBUS_HAVE_VOUT | PMBUS_HAVE_IOUT | \
> +							 PMBUS_HAVE_POUT | PMBUS_HAVE_TEMP | \
> +							 PMBUS_HAVE_STATUS_VOUT | \
> +							 PMBUS_HAVE_STATUS_IOUT | \
> +							 PMBUS_HAVE_STATUS_TEMP | \
> +							 PMBUS_HAVE_STATUS_INPUT)
> +
> +#define MP2985_RAIL2_FUNC	(PMBUS_HAVE_PIN | PMBUS_HAVE_VOUT | \
> +							 PMBUS_HAVE_IOUT | PMBUS_HAVE_POUT | \
> +							 PMBUS_HAVE_TEMP | PMBUS_HAVE_IIN | \
> +							 PMBUS_HAVE_STATUS_VOUT | \
> +							 PMBUS_HAVE_STATUS_IOUT | \
> +							 PMBUS_HAVE_STATUS_TEMP | \
> +							 PMBUS_HAVE_STATUS_INPUT)
> +
> +struct mp2985_data {
> +	struct pmbus_driver_info info;
> +	int vout_scale[MP2985_PAGE_NUM];
> +	int vid_offset[MP2985_PAGE_NUM];
> +};
> +
> +#define to_mp2985_data(x) container_of(x, struct mp2985_data, info)
> +
> +static u16 mp2985_linear_exp_transfer(u16 word, u16 expect_exponent)
> +{
> +	s16 exponent, mantissa, target_exponent;
> +
> +	exponent = ((s16)word) >> 11;
> +	mantissa = ((s16)((word & 0x7ff) << 5)) >> 5;
> +	target_exponent = (s16)((expect_exponent & 0x1f) << 11) >> 11;
> +
> +	if (exponent > target_exponent)
> +		mantissa = mantissa << (exponent - target_exponent);
> +	else
> +		mantissa = mantissa >> (target_exponent - exponent);
> +
> +	return (mantissa & 0x7ff) | ((expect_exponent << 11) & 0xf800);
> +}
> +
> +static int mp2985_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		/*
> +		 * The MP2985 does not follow standard PMBus protocol completely,
> +		 * and the calculation of vout in this driver is based on direct
> +		 * format. As a result, the format of vout is enforced to direct.
> +		 */
> +		ret = PB_VOUT_MODE_DIRECT;
> +		break;
> +	default:
> +		ret = -ENODATA;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int mp2985_read_word_data(struct i2c_client *client, int page, int phase,
> +				 int reg)
> +{
> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> +	struct mp2985_data *data = to_mp2985_data(info);
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_READ_VOUT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		/*
> +		 * The MP2985 supports three vout mode, direct, linear11 and vid mode.
> +		 * In vid mode, the MP2985 vout telemetry has 49 vid step offset, but
> +		 * PMBUS_VOUT_OV_FAULT_LIMIT and PMBUS_VOUT_UV_FAULT_LIMIT do not take
> +		 * this into consideration, its resolution is 1.95mV/LSB, as a result,
> +		 * format[PSC_VOLTAGE_OUT] can not be set to vid directly. Adding extra
> +		 * vid_offset variable for vout telemetry.
> +		 */
> +		ret = clamp_val(DIV_ROUND_CLOSEST(((ret & GENMASK(11, 0)) +
> +									data->vid_offset[page]) *
> +							data->vout_scale[page], MP2985_VOUT_DIV),
> +							0, 0x7FFF);
> +		break;
> +	case PMBUS_READ_IIN:
> +		/*
> +		 * The MP2985 has standard PMBUS_READ_IIN register(0x89), but this is
> +		 * not used to read the input current of per rail. The input current
> +		 * is read through the vender redefined register READ_IIN_EST(0x8E).
> +		 */
> +		ret = pmbus_read_word_data(client, page, phase, READ_IIN_EST);
> +		break;
> +	case PMBUS_READ_PIN:
> +		/*
> +		 * The MP2985 has standard PMBUS_READ_PIN register(0x97), but this
> +		 * is not used to read the input power of per rail. The input power
> +		 * of per rail is read through the vender redefined register
> +		 * READ_PIN_EST(0x93).
> +		 */
> +		ret = pmbus_read_word_data(client, page, phase, READ_PIN_EST);
> +		break;
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		ret = pmbus_read_word_data(client, page, phase, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = DIV_ROUND_CLOSEST((ret & GENMASK(11, 0)) * MP2985_VOUT_OVUV_UINT,
> +					MP2985_VOUT_OVUV_DIV);
> +		break;
> +	case PMBUS_STATUS_WORD:
> +	case PMBUS_READ_VIN:
> +	case PMBUS_READ_IOUT:
> +	case PMBUS_READ_POUT:
> +	case PMBUS_READ_TEMPERATURE_1:
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +		ret = -ENODATA;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int mp2985_write_word_data(struct i2c_client *client, int page, int reg,
> +				  u16 word)
> +{
> +	int ret;
> +
> +	switch (reg) {
> +	case PMBUS_VIN_OV_FAULT_LIMIT:
> +	case PMBUS_VIN_OV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_WARN_LIMIT:
> +	case PMBUS_VIN_UV_FAULT_LIMIT:
> +		/*
> +		 * The PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_OV_WARN_LIMIT,
> +		 * PMBUS_VIN_UV_WARN_LIMIT and PMBUS_VIN_UV_FAULT_LIMIT
> +		 * of MP2985 is linear11 format, and the exponent is a
> +		 * constant value(5'b11101)， so the exponent of word
> +		 * parameter should be converted to 5'b11101(0x1D).
> +		 */
> +		ret = pmbus_write_word_data(client, page, reg,
> +					    mp2985_linear_exp_transfer(word, 0x1D));
> +		break;
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		/*
> +		 * The bit0-bit11 is the limit value, and bit12-bit15
> +		 * should not be changed.
> +		 */
> +		ret = pmbus_read_word_data(client, page, 0xff, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = pmbus_write_word_data(client, page, reg,
> +					    (ret & ~GENMASK(11, 0)) |
> +				FIELD_PREP(GENMASK(11, 0),
> +					   DIV_ROUND_CLOSEST(word * MP2985_VOUT_OVUV_DIV,
> +							     MP2985_VOUT_OVUV_UINT)));
> +		break;
> +	case PMBUS_OT_FAULT_LIMIT:
> +	case PMBUS_OT_WARN_LIMIT:
> +		/*
> +		 * The PMBUS_OT_FAULT_LIMIT and PMBUS_OT_WARN_LIMIT of
> +		 * MP2985 is linear11 format, and the exponent is a
> +		 * constant value(5'b00000), so the exponent of word
> +		 * parameter should be converted to 5'b00000.
> +		 */
> +		ret = pmbus_write_word_data(client, page, reg,
> +					    mp2985_linear_exp_transfer(word, 0x00));
> +		break;
> +	case PMBUS_IOUT_OC_FAULT_LIMIT:
> +	case PMBUS_IOUT_OC_WARN_LIMIT:
> +		/*
> +		 * The PMBUS_IOUT_OC_FAULT_LIMIT and PMBUS_IOUT_OC_WARN_LIMIT
> +		 * of MP2985 is linear11 format, and the exponent can not be
> +		 * changed.
> +		 */
> +		ret = pmbus_read_word_data(client, page, 0xff, reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = pmbus_write_word_data(client, page, reg,
> +					    mp2985_linear_exp_transfer(word,
> +								       FIELD_GET(GENMASK(15, 11),
> +										 ret)));
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int
> +mp2985_identify_vout_scale(struct i2c_client *client, struct pmbus_driver_info *info,
> +			   int page)
> +{
> +	struct mp2985_data *data = to_mp2985_data(info);
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * The MP2985 supports three vout mode. If PMBUS_VOUT_MODE
> +	 * bit5 is 1, it is vid mode. If PMBUS PMBUS_VOUT_MODE bit4
> +	 * is 1, it is linear11 mode. If PMBUS PMBUS_VOUT_MODE bit6
> +	 * is 1, it is direct mode. In vid mode, the MP2985 vout
> +	 * telemetry has 49 vid step offset.
> +	 */
> +	if (FIELD_GET(BIT(5), ret)) {
> +		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, 2);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = i2c_smbus_read_word_data(client, page == 0 ?
> +									MFR_VR_MULTI_CONFIG_R1 :
> +									MFR_VR_MULTI_CONFIG_R2);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (page == 0) {
> +			if (FIELD_GET(BIT(4), ret))
> +				data->vout_scale[page] = 2560;
> +			else
> +				data->vout_scale[page] = 5120;
> +		} else {
> +			if (FIELD_GET(BIT(3), ret))
> +				data->vout_scale[page] = 2560;
> +			else
> +				data->vout_scale[page] = 5120;
> +		}
> +
> +		data->vid_offset[page] = 49;
> +
> +		/*
> +		 * For vid mode, the MP2985 should be changed to page 2
> +		 * to obtain vout scale value, this may confuse the PMBus
> +		 * core. To avoid this, switch back to the previous page
> +		 * again.
> +		 */
> +		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
> +		if (ret < 0)
> +			return ret;
> +	} else if (FIELD_GET(BIT(4), ret)) {
> +		data->vout_scale[page] = 1;
> +		data->vid_offset[page] = 0;
> +	} else {
> +		data->vout_scale[page] = 512;
> +		data->vid_offset[page] = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mp2985_identify(struct i2c_client *client, struct pmbus_driver_info *info)
> +{
> +	int ret;
> +
> +	ret = mp2985_identify_vout_scale(client, info, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	return mp2985_identify_vout_scale(client, info, 1);
> +}
> +
> +static struct pmbus_driver_info mp2985_info = {
> +	.pages = MP2985_PAGE_NUM,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_CURRENT_IN] = linear,
> +	.format[PSC_CURRENT_OUT] = linear,
> +	.format[PSC_POWER] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +
> +	.m[PSC_VOLTAGE_OUT] = 1,
> +	.R[PSC_VOLTAGE_OUT] = 3,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +
> +	.func[0] = MP2985_RAIL1_FUNC,
> +	.func[1] = MP2985_RAIL2_FUNC,
> +	.read_word_data = mp2985_read_word_data,
> +	.read_byte_data = mp2985_read_byte_data,
> +	.write_word_data = mp2985_write_word_data,
> +	.identify = mp2985_identify,
> +};
> +
> +static int mp2985_probe(struct i2c_client *client)
> +{
> +	struct mp2985_data *data;
> +
> +	data = devm_kzalloc(&client->dev, sizeof(struct mp2985_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	memcpy(&data->info, &mp2985_info, sizeof(mp2985_info));
> +
> +	return pmbus_do_probe(client, &data->info);
> +}
> +
> +static const struct i2c_device_id mp2985_id[] = {
> +	{"mp2985", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, mp2985_id);
> +
> +static const struct of_device_id __maybe_unused mp2985_of_match[] = {
> +	{.compatible = "mps,mp2985"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mp2985_of_match);
> +
> +static struct i2c_driver mp2985_driver = {
> +	.driver = {
> +		.name = "mp2985",
> +		.of_match_table = mp2985_of_match,
> +	},
> +	.probe = mp2985_probe,
> +	.id_table = mp2985_id,
> +};
> +
> +module_i2c_driver(mp2985_driver);
> +
> +MODULE_AUTHOR("Wensheng Wang <wenswang@yeah.net>");
> +MODULE_DESCRIPTION("PMBus driver for MPS MP2985 device");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");

