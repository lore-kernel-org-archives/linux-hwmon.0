Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27913B5305
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772115765; cv=none; b=c0RbWydN1sRriE+F2tbStovXcmx0zr6VTy44XvYiJRJjAhyyGZCrMNR/7q6ZIMaHujNZNMeAaP+ovKqkLOiUwC7nveQkQnLhB+6QwnQ5370YYlMbggE9VMJoBC1LSVYZw5NocZQvu4FM57uFG1xjv4kf/7KMn8keSiOW5eJCXlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772115765; c=relaxed/simple;
	bh=ffHusz9JhJMyrebhxUjHd35IYmFiqaiEVFAl3pqoihs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a2PttLVbGigtnMB+g3jXPoJLS51SxS4AAPPrjB8qsMauUvuU8hYf0Qssf/aEEycKaUxgOENDO0UQ6MqD/dnGmBO8BgZKLtokOVRJ7xuawbWatgYV34BhmtTGc8QDCLj0pAiISmyvqIb5As8oF04M1P0253xXFabqIHIwi5zufl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFYwf7iH; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFYwf7iH"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1275750cf9cso702356c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 06:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772115762; x=1772720562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z+FXdaXl6ZAHu3oLkX4ZIoqZAdC0RT1Wg5swBMni7T0=;
        b=VFYwf7iHhAGiF/4huBHchMQelkeVOHl66teGVPMSxdxPzvIif69CLrxtjr7nkUliEn
         EV2x0gGJxxTlZcWR2f+6x1xsfLZMQy6dM2I2ZkGY60fsJAKvExwIJJID06lMLxvehUkS
         yUNojoWxB/YhgPdxSKga4UVnQf+iRfaiM/MAC7I3+qbekwod7wfFpIP2ESaLVO5pXlf9
         LkrisKWaQUEMpS9s3KFf+rqJ6jIS2qo1ukQ1ZZ6CkAKwdOaEI/35EFN1yxm6zJdx8uEf
         HYPWDFdX17g6F0luB5PMhUqwRq76VWn2LwtAJmspyK65tdIcUMNvv5wzWTA+1D3Fhg38
         kFgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772115762; x=1772720562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z+FXdaXl6ZAHu3oLkX4ZIoqZAdC0RT1Wg5swBMni7T0=;
        b=Sg3KIm2EIQ+gdU1L6joetpOnetmrSHOPBKlFUXRQY1Jb1ZlXcZXdLjvu13gstxfVSg
         lFcN5Di8JBUZZctzdzWqZ2wvtmtxxm0DWUFoOTCfT/3DvBQ1xl9AXKRKYnTjZKmGA3JN
         lKpRpRDjXhr8KRRJsxWYeGeTPVko2nklmvJbYKQSOM1xrubqJgADVlt9IlBNO60e4YMW
         Lv+g7SlkUIeKx1kGo1xsFX4ZXJQhsgvetvMOnesICEsYvmDVzJdxNgec+9VmfYp4aGp7
         6Up2Er4gq+fupPyJTwonO8rrV1IChLsY/h3kYDifDwF32iIAg2Fz5GgDD437JyqdEVZ0
         gTwg==
X-Forwarded-Encrypted: i=1; AJvYcCUbIxqlSiTFAc1WWXPh0PGNN9iN8RLBp+7/wABLf4rX2U2XKl+7idopYjDG/8at+a7xJ1rwvknFIW08FA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhne4Ohv2eyIn1bSA0U31KDWtv9+qgPHNH/kiKBVgQeKA45Hxm
	BFjt2oJ8EN9Wnje2rtoXvZH5irtvJkgfLDwT6xGFJ5wnXBI2yli8L1pr
X-Gm-Gg: ATEYQzxEjwfOL0maCUw3zA+Qn0Ol20dmKiG4wHupNxRsYQQK7ewkS/8m830ARYKS0Jq
	oeHrGYFmbLNqB/ksUIyPfbHISOc9j8gV9j221v89MqusjwcxAcUu2UMB/ngvk1AgUz7lnmxLWfa
	B/mMXeMP5zsDbODHeR1uWZ8Y72qHoA3Dbc/56tBBuA8YcDyMsVJIlgCQmKIWVUcRdwJ53bNG6Wo
	CewW8a8z4NQTEeIKcloTFVt4DZExyXAVHL1BrecjGPuSmHcBX2v51utULlzWNdQU5WoapRodgII
	kHmNs3lxX81wJIH9wEsIlI0FsCeRoNg3dA5XEA9uMFsvwu6Dua32jyKUJURQPolHwhMCCdGl1F+
	I+IUcBTrqLH70GMjBmePrDwZK5naNQtACl+QwGd4v/j9D+ojjjn165kbo0tIwWerZQw7cwNdBE4
	GqrFDkYipUUFmHktV3ZyqeAt3eOWEc0yeHFETM
X-Received: by 2002:a05:7022:50c:b0:11b:d561:bc10 with SMTP id a92af1059eb24-1276ad5c892mr8571691c88.41.1772115761547;
        Thu, 26 Feb 2026 06:22:41 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43885sm2764653c88.12.2026.02.26.06.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:22:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 26 Feb 2026 06:22:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: add MP2845 driver
Message-ID: <ef17c90f-a83c-47fa-b233-a98b9e76c5cf@roeck-us.net>
References: <20260225085501.164819-1-wenswang@yeah.net>
 <20260225085631.165106-1-wenswang@yeah.net>
 <20260225085631.165106-2-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225085631.165106-2-wenswang@yeah.net>

On Wed, Feb 25, 2026 at 04:56:31PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS VR controller mp2845. This driver exposes
> telemetry and limit value readings.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> ---
>  Documentation/hwmon/index.rst  |   1 +
>  Documentation/hwmon/mp2845.rst | 143 ++++++++++
>  MAINTAINERS                    |   7 +
>  drivers/hwmon/Kconfig          |  10 +
>  drivers/hwmon/Makefile         |   1 +
>  drivers/hwmon/mp2845.c         | 493 +++++++++++++++++++++++++++++++++
>  6 files changed, 655 insertions(+)
>  create mode 100644 Documentation/hwmon/mp2845.rst
>  create mode 100644 drivers/hwmon/mp2845.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index d91dbb20c7dc..0a2176e5b694 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -176,6 +176,7 @@ Hardware Monitoring Kernel Drivers
>     mcp3021
>     menf21bmc
>     mlxreg-fan
> +   mp2845
>     mp2856
>     mp2869
>     mp2888
> diff --git a/Documentation/hwmon/mp2845.rst b/Documentation/hwmon/mp2845.rst
> new file mode 100644
> index 000000000000..dc6328855e27
> --- /dev/null
> +++ b/Documentation/hwmon/mp2845.rst
> @@ -0,0 +1,143 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver mp2845
> +====================
> +
> +Supported chips:
> +
> +  * MPS mp2845
> +
> +    Prefix: 'mp2845'
> +
> +  * MPS mp2845
> +
> +    Prefix: 'mp2845'
> +
> +Author:
> +
> +	Wensheng Wang <wenswang@yeah.net>
> +
> +Description
> +-----------
> +
> +This driver implements support for Monolithic Power Systems, Inc. (MPS)
> +MP2845 Dual Loop Digital Multi-phase Controller.
> +
> +Device compliant with:
> +
> +- Smbus interface.
> +
> +The driver exports the following attributes via the 'sysfs' files
> +for input voltage:
> +
> +**in0_input**
> +
> +**in0_label**
> +
> +**in0_crit**
> +
> +**in0_crit_alarm**
> +
> +**in0_lcrit_alarm**
> +
> +**in0_min**
> +
> +The driver provides the following attributes for output voltage:
> +
> +**in1_input**
> +
> +**in1_label**
> +
> +**in1_crit_alarm**
> +
> +**in1_lcrit_alarm**
> +
> +**in2_input**
> +
> +**in2_label**
> +
> +**in2_crit_alarm**
> +
> +**in2_lcrit_alarm**
> +
> +**in3_input**
> +
> +**in3_label**
> +
> +**in3_crit_alarm**
> +
> +**in3_lcrit_alarm**
> +
> +**in4_input**
> +
> +**in4_label**
> +
> +**in4_crit_alarm**
> +
> +**in4_lcrit_alarm**
> +
> +The driver provides the following attributes for input current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +The driver provides the following attributes for output current:
> +
> +**curr1_input**
> +
> +**curr1_label**
> +
> +**curr1_crit**
> +
> +**curr1_crit_alarm**
> +
> +**curr1_max**
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
> +**curr4_input**
> +
> +**curr4_label**
> +
> +**curr4_crit**
> +
> +**curr4_crit_alarm**
> +
> +**curr4_max**
> +
> +The driver provides the following attributes for temperature:
> +
> +**temp1_input**
> +
> +**temp1_crit_alarm**
> +
> +**temp2_input**
> +
> +**temp2_crit_alarm**
> +
> +**temp3_input**
> +
> +**temp3_crit_alarm**
> +
> +**temp4_input**
> +
> +**temp4_crit_alarm**
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..f1539307de5f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17905,6 +17905,13 @@ F:	drivers/resctrl/mpam_*
>  F:	drivers/resctrl/test_mpam_*
>  F:	include/linux/arm_mpam.h
>  
> +MPS MP2845 DRIVER
> +M:	Wensheng Wang <wenswang@yeah.net>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/mp2845.rst
> +F:	drivers/hwmon/mp2845.c
> +
>  MPS MP2869 DRIVER
>  M:	Wensheng Wang <wenswang@yeah.net>
>  L:	linux-hwmon@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 41c381764c2b..3f77982e50ea 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1432,6 +1432,16 @@ config SENSORS_MENF21BMC_HWMON
>  	  This driver can also be built as a module. If so the module
>  	  will be called menf21bmc_hwmon.
>  
> +config SENSORS_MP2845
> +	tristate "MPS MP2845"
> +	depends on I2C
> +	help
> +	  If you say yes here you get hardware monitoring support for
> +	  MPS MP2845 Dual Loop Digital Multi-Phase Controller.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called mp2845.
> +
>  config SENSORS_MR75203
>  	tristate "Moortec Semiconductor MR75203 PVT Controller"
>  	select REGMAP_MMIO
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index eade8e3b1bde..4372759f2e60 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -174,6 +174,7 @@ obj-$(CONFIG_SENSORS_TC654)	+= tc654.o
>  obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
>  obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
>  obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
> +obj-$(CONFIG_SENSORS_MP2845)	+= mp2845.o
>  obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
>  obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
>  obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
> diff --git a/drivers/hwmon/mp2845.c b/drivers/hwmon/mp2845.c
> new file mode 100644
> index 000000000000..adecde7c9b71
> --- /dev/null
> +++ b/drivers/hwmon/mp2845.c

I just realized, while reviewing: This is a PMBus chip. YOu are trying
to bypass the PMBus core. This is an absolute no-go. Try again, this
time as PMBus driver.

> @@ -0,0 +1,493 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for MPS Digital Controller(MP2845)
> + */
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>

Unnecessary include.

> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +#define MP2845_IOUT_SCALE_MASK1	GENMASK(5, 3)
> +#define MP2845_IOUT_SCALE_MASK2	GENMASK(13, 11)
> +
> +#define MFR_VIN_OV_UV_SET	0x71
> +#define MFR_OVUV_OCWARN_THRES	0x75
> +#define MFR_TOTAL_OCP_SET	0x76
> +#define MFR_PROTECT_STATUS1	0x80
> +#define MFR_PROTECT_STATUS2 0x81
> +
> +#define MP2845_VIN_LIMIT_UINT	125
> +#define MP2845_READ_VIN_UINT	3125
> +#define MP2845_READ_VIN_DIV	100
> +#define MP2845_READ_IOUT_UINT	3125
> +#define MP2845_READ_IOUT_DIV	100
> +#define MP2845_READ_VOUT_UINT	5
> +#define MP2845_TEMP_UINT	1000
> +
> +#define MFR_READ_VIN	0xA6
> +#define MFR_READ_VOUT	0xA7
> +#define MFR_READ_IOUT	0xA8
> +#define MFR_READ_TEMP	0xA9
> +#define MFR_MFG_ID_SCALE_VI1	0x77
> +#define MFR_MFG_ID_SCALE_VI2	0x78
> +
> +struct mp2845_data {
> +	struct i2c_client *client;
> +	int iout_gain[4];
> +	/* lock for preventing concurrency issue */
> +	struct mutex lock;
> +};
> +
> +static umode_t mp2845_is_visible(const void *data, enum hwmon_sensor_types type,
> +				 u32 attr, int channel)
> +{
> +	switch (type) {
> +	case hwmon_temp:
> +	case hwmon_in:
> +	case hwmon_curr:
> +		return 0444;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mp2845_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, const char **str)
> +{
> +	struct mp2845_data *data;
> +	int ret = 0;
> +
> +	data = dev_get_drvdata(dev);
> +
> +	mutex_lock(&data->lock);

What concurrency issue is this supposed to protect against, and why is the
concurrency protection in the hwmon core insufficient ?

> +
> +	switch (type) {
> +	case hwmon_in:
> +		if (channel == 0)
> +			*str = "vin";
> +		else if (channel == 1)
> +			*str = "vout1";
> +		else if (channel == 2)
> +			*str = "vout2";
> +		else if (channel == 3)
> +			*str = "vout3";
> +		else
> +			*str = "vout4";
> +		break;
> +	case hwmon_curr:
> +		if (channel == 0)
> +			*str = "iout1";
> +		else if (channel == 1)
> +			*str = "iout2";
> +		else if (channel == 2)
> +			*str = "iout3";
> +		else
> +			*str = "iout4";
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +

The channel labels are supposed to reflect system values. The above just
reports PMBus values, and those are already provided by the PMBus core.
This is pointless code.

> +	mutex_unlock(&data->lock);
> +
> +	return ret;
> +}
> +
> +static int mp2845_read(struct device *dev, enum hwmon_sensor_types type,
> +		       u32 attr, int channel, long *val)
> +{
> +	int ret;
> +	struct mp2845_data *data;
> +
> +	data = dev_get_drvdata(dev);
> +	if (!data)
> +		return -ENOMEM;

How would this ever happen ?

> +
> +	mutex_lock(&data->lock);

Why is the lock provided by the hwmon core insufficient ?

> +
> +	switch (type) {
> +	case hwmon_in:
> +		if (channel == 0) {
> +			if (attr == hwmon_in_input) {
> +				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
> +				if (ret < 0)
> +					break;
> +
> +				ret = i2c_smbus_read_word_data(data->client, MFR_READ_VIN);
> +				if (ret < 0)
> +					break;
> +
> +				*val = DIV_ROUND_CLOSEST((ret & GENMASK(9, 0)) *
> +							 MP2845_READ_VIN_UINT,
> +							 MP2845_READ_VIN_DIV);
> +			} else if (attr == hwmon_in_crit) {
> +				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
> +				if (ret < 0)
> +					break;
> +
> +				ret = i2c_smbus_read_word_data(data->client, MFR_VIN_OV_UV_SET);
> +				if (ret < 0)
> +					break;
> +
> +				*val = FIELD_GET(GENMASK(15, 8), ret) * MP2845_VIN_LIMIT_UINT;
> +			} else if (attr == hwmon_in_min) {
> +				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
> +				if (ret < 0)
> +					break;
> +
> +				ret = i2c_smbus_read_word_data(data->client, MFR_VIN_OV_UV_SET);
> +				if (ret < 0)
> +					break;
> +
> +				*val = FIELD_GET(GENMASK(7, 0), ret) * MP2845_VIN_LIMIT_UINT;
> +			} else if (attr == hwmon_in_crit_alarm) {
> +				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
> +				if (ret < 0)
> +					break;
> +
> +				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS2);
> +				if (ret < 0)
> +					break;
> +
> +				*val = FIELD_GET(GENMASK(5, 5), ret);
> +			} else {
> +				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
> +				if (ret < 0)
> +					break;
> +
> +				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS2);
> +				if (ret < 0)
> +					break;
> +
> +				*val = FIELD_GET(GENMASK(4, 4), ret);
> +			}
> +		} else {
> +			if (attr == hwmon_in_input) {
> +				ret = i2c_smbus_write_byte_data(data->client, 0, channel - 1);
> +				if (ret < 0)
> +					break;
> +
> +				ret = i2c_smbus_read_word_data(data->client, MFR_READ_VOUT);
> +				if (ret < 0)
> +					break;
> +
> +				*val = (ret & GENMASK(9, 0)) * MP2845_READ_VOUT_UINT;
> +			} else if (attr == hwmon_in_crit_alarm) {
> +				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
> +				if (ret < 0)
> +					break;
> +
> +				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS1);
> +				if (ret < 0)
> +					break;
> +
> +				if (channel == 1)
> +					*val = FIELD_GET(GENMASK(10, 10), ret);
> +				else if (channel == 2)
> +					*val = FIELD_GET(GENMASK(7, 7), ret);
> +				else if (channel == 3)
> +					*val = FIELD_GET(GENMASK(4, 4), ret);
> +				else
> +					*val = FIELD_GET(GENMASK(1, 1), ret);
> +			} else {
> +				ret = i2c_smbus_write_byte_data(data->client, 0, 0);
> +				if (ret < 0)
> +					break;
> +
> +				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS1);
> +				if (ret < 0)
> +					break;
> +
> +				if (channel == 1)
> +					*val = FIELD_GET(GENMASK(11, 11), ret);
> +				else if (channel == 2)
> +					*val = FIELD_GET(GENMASK(8, 8), ret);
> +				else if (channel == 3)
> +					*val = FIELD_GET(GENMASK(5, 5), ret);
> +				else
> +					*val = FIELD_GET(GENMASK(2, 2), ret);
> +			}
> +		}
> +		break;
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_input) {
> +			ret = i2c_smbus_write_byte_data(data->client, 0, channel);
> +			if (ret < 0)
> +				break;
> +
> +			ret = i2c_smbus_read_word_data(data->client, MFR_READ_TEMP);
> +			if (ret < 0)
> +				break;
> +
> +			*val = ((ret & GENMASK(7, 0)) - 40) * MP2845_TEMP_UINT;
> +		} else {
> +			ret = i2c_smbus_write_byte_data(data->client, 0, 0);
> +			if (ret < 0)
> +				break;
> +
> +			ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS1);
> +				if (ret < 0)
> +					break;
> +
> +			if (channel == 0) {
> +				*val = FIELD_GET(GENMASK(12, 12), ret);
> +			} else if (channel == 1) {
> +				*val = FIELD_GET(GENMASK(14, 14), ret);
> +			} else if (channel == 2) {
> +				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS2);
> +				if (ret < 0)
> +					break;
> +
> +				*val = FIELD_GET(GENMASK(0, 0), ret);
> +			} else {
> +				ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS2);
> +				if (ret < 0)
> +					break;
> +
> +				*val = FIELD_GET(GENMASK(2, 2), ret);
> +			}
> +		}
> +		break;
> +	case hwmon_curr:
> +		if (attr == hwmon_curr_input) {
> +			ret = i2c_smbus_write_byte_data(data->client, 0, channel);
> +			if (ret < 0)
> +				break;
> +
> +			ret = i2c_smbus_read_word_data(data->client, MFR_READ_IOUT);
> +			if (ret < 0)
> +				break;
> +
> +			*val = DIV_ROUND_CLOSEST((ret & GENMASK(9, 0)) * data->iout_gain[channel] *
> +						 MP2845_READ_IOUT_UINT, MP2845_READ_IOUT_DIV);
> +		} else if (attr == hwmon_curr_max) {
> +			ret = i2c_smbus_write_byte_data(data->client, 0, channel);
> +			if (ret < 0)
> +				break;
> +
> +			ret = i2c_smbus_read_word_data(data->client, MFR_OVUV_OCWARN_THRES);
> +			if (ret < 0)
> +				break;
> +
> +			*val = DIV_ROUND_CLOSEST(FIELD_GET(GENMASK(15, 8), ret) *
> +						 data->iout_gain[channel] * MP2845_READ_IOUT_UINT *
> +						 4 * 2, MP2845_READ_IOUT_DIV);
> +		} else if (attr == hwmon_curr_crit) {
> +			ret = i2c_smbus_write_byte_data(data->client, 0, channel);
> +			if (ret < 0)
> +				break;
> +
> +			ret = i2c_smbus_read_word_data(data->client, MFR_TOTAL_OCP_SET);
> +			if (ret < 0)
> +				break;
> +
> +			*val = DIV_ROUND_CLOSEST(FIELD_GET(GENMASK(15, 8), ret) *
> +						 data->iout_gain[channel] * MP2845_READ_IOUT_UINT *
> +						 4 * 2, MP2845_READ_IOUT_DIV);
> +		} else {
> +			ret = i2c_smbus_write_byte_data(data->client, 0, 0);
> +			if (ret < 0)
> +				break;
> +
> +			ret = i2c_smbus_read_word_data(data->client, MFR_PROTECT_STATUS1);
> +			if (ret < 0)
> +				break;
> +
> +			if (channel == 0)
> +				*val = FIELD_GET(GENMASK(9, 9), ret);
> +			else if (channel == 2)
> +				*val = FIELD_GET(GENMASK(6, 6), ret);
> +			else if (channel == 3)
> +				*val = FIELD_GET(GENMASK(3, 3), ret);
> +			else
> +				*val = FIELD_GET(GENMASK(0, 0), ret);
> +		}
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	mutex_unlock(&data->lock);
> +
> +	return ret;
> +}
> +
> +static int
> +mp2845_identify_iout_scale(struct mp2845_data *data, int page)
> +{
> +	int gain;
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(data->client, 0x00, page);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = i2c_smbus_read_word_data(data->client, page == 0 ? MFR_MFG_ID_SCALE_VI2 :
> +				       MFR_MFG_ID_SCALE_VI1);
> +	if (ret < 0)
> +		return ret;
> +
> +	gain = page == 0 ? FIELD_GET(MP2845_IOUT_SCALE_MASK1, ret) :
> +	       FIELD_GET(MP2845_IOUT_SCALE_MASK2, ret);
> +	switch (gain) {
> +	case 1:
> +		data->iout_gain[page] = 1;
> +		break;
> +	case 2:
> +		data->iout_gain[page] = 2;
> +		break;
> +	case 3:
> +		data->iout_gain[page] = 4;
> +		break;
> +	case 4:
> +		data->iout_gain[page] = 8;
> +		break;
> +	case 5:
> +		data->iout_gain[page] = 16;
> +		break;
> +	case 6:
> +		data->iout_gain[page] = 32;
> +		break;
> +	case 7:
> +		data->iout_gain[page] = 64;
> +		break;
> +	default:
> +		data->iout_gain[page] = 1;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *mp2845_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_CRIT | HWMON_I_CRIT_ALARM |
> +			   HWMON_I_LCRIT_ALARM | HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM |
> +			   HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM |
> +			   HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM |
> +			   HWMON_I_LABEL,
> +			   HWMON_I_INPUT | HWMON_I_CRIT_ALARM | HWMON_I_LCRIT_ALARM |
> +			   HWMON_I_LABEL),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_CRIT_ALARM,
> +			   HWMON_T_INPUT | HWMON_T_CRIT_ALARM),
> +	HWMON_CHANNEL_INFO(curr,
> +			   HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM | HWMON_C_MAX |
> +			   HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM | HWMON_C_MAX |
> +			   HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM | HWMON_C_MAX |
> +			   HWMON_C_LABEL,
> +			   HWMON_C_INPUT | HWMON_C_CRIT | HWMON_C_CRIT_ALARM | HWMON_C_MAX |
> +			   HWMON_C_LABEL),
> +	NULL
> +};
> +
> +static const struct hwmon_ops mp2845_hwmon_ops = {
> +	.is_visible = mp2845_is_visible,
> +	.read = mp2845_read,
> +	.read_string = mp2845_read_string,
> +};
> +
> +static const struct hwmon_chip_info mp2845_chip_info = {
> +	.ops = &mp2845_hwmon_ops,
> +	.info = mp2845_info,
> +};
> +
> +static int mp2845_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct device *hwmon_dev;
> +	struct mp2845_data *data;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA)) {
> +		dev_err(dev, "check failed, smbus byte and/or word data not supported!\n");
> +		return -ENODEV;
> +	}
> +
> +	data = devm_kzalloc(dev, sizeof(struct mp2845_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	mutex_init(&data->lock);
> +	data->client = client;
> +
> +	ret = mp2845_identify_iout_scale(data, 0);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to identify rail1 iout scale, errno = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mp2845_identify_iout_scale(data, 1);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to identify rail2 iout scale, errno = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mp2845_identify_iout_scale(data, 2);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to identify rail3 iout scale, errno = %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = mp2845_identify_iout_scale(data, 3);
> +	if (ret < 0) {
> +		dev_err(dev, "unable to identify rail4 iout scale, errno = %d\n", ret);
> +		return ret;
> +	}
> +
> +	hwmon_dev = devm_hwmon_device_register_with_info(dev, client->name,
> +							 data, &mp2845_chip_info,
> +							 NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		dev_err(dev, "unable to register mp2845 hwmon device\n");
> +		return PTR_ERR(hwmon_dev);
> +	}
> +
> +	dev_info(dev, "%s: sensor '%s'\n", dev_name(hwmon_dev), client->name);
> +
> +	return 0;
> +}
> +
> +static const struct i2c_device_id mp2845_ids[] = {
> +	{"mp2845", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, mp2845_ids);
> +
> +static const struct of_device_id __maybe_unused mp2845_of_match[] = {
> +	{.compatible = "mps,mp2845"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mp2845_of_match);
> +
> +static struct i2c_driver mp2845_driver = {
> +	.class		= I2C_CLASS_HWMON,
> +	.driver = {
> +		.name	= "mp2845",
> +		.of_match_table = mp2845_of_match,
> +	},
> +	.probe		= mp2845_probe,
> +	.id_table	= mp2845_ids,
> +};
> +module_i2c_driver(mp2845_driver);
> +
> +MODULE_AUTHOR("Wensheng Wang <wenswang@yeah.net>");
> +MODULE_DESCRIPTION("MP2845 driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
> 
> 
