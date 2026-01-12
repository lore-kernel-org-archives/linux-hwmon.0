Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F7836402C
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768234480; cv=none; b=AWJlZTSb1vr1+a1F/fHw6VAlcQ16L51ziCU4Na/2DzEgyx1nNzzr5J8hLE0jQ0QoBabiFn2oODJrOfo6EURkk5/ZX3R/DIvLiNe94/XeMN1HGAVAx4B1AYRrKl2eNJPwWyMH02WwCJoucoH4k1Nz4pH0Snu0lWtVNl23BLtHWys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768234480; c=relaxed/simple;
	bh=YxhHO/6f+kzzobQ5klqwskTnOLBdFzl4YHE8OwAl74w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoQUPU9ooKI20NI4Li1pjocw9fYhQFkuoZl/orLWYniVmDo3XrWw9jRqqiGdrT+lkIgdtDGh09PDSSBjbxgK92okMrnMLJ9IhJSiUWYH3a2Kfoiw073pBp/xSrh9lGm0EQYlWspN6181y3ooont/YLx5ThKe95l4FUlbBcG4cXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JsyY0CQE; arc=none smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JsyY0CQE"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2b053ec7d90so5743465eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 08:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768234478; x=1768839278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ps+uQW9AdtTCQpetvK8TRg5LNASGTC021orKjvvrvW0=;
        b=JsyY0CQESWtTUU/vAaW9XCKVmMq+L45aKhYsv1hgcfBaUmvx1o1NichuHYAunXq72B
         7crEQor3gNj5sqd/2oZnhyvyehQtL5JcO92ur51VLCwjpgTCVUssNGbXww+tOjmSz/Yw
         gH826z5ykuF/jAxbSpo58rY27lLcXz5MoVFFI6WY9NLOckQuIhVy+cG6yFk7GFx8KCV2
         RX8Y5sgCdv6Qi/3WMW6jkWqOeMJNpO95bwLCZ4Gy9e3zJBIbsBShRwXVasSgKVKmcrLw
         3SZc6qlCh4SsVoojLEzL9oFlmC7f8ZMPwI+2l2A35CKNH3alQUzAyMf0e/HzjuxDHj1N
         x8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768234478; x=1768839278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ps+uQW9AdtTCQpetvK8TRg5LNASGTC021orKjvvrvW0=;
        b=LDIiwUYKBovCkNlAbZ0zSqTY2EH4pEnz6Z2zHjE4C4nHOZ9SSXIE+7FEd0L0RYV759
         K/LZtHi0eNDoN0zlFewFhIQVWTPZ3MfIN+VCxPnqM9QN+Au6l4iIzFxv6KEdESrrJ019
         x62T1tq/CPFkD1qY8m2ilQ7k4P0jSPEe+9U3PMFQ8QjcY/NIxDmpCoW9tD15/ELWVt/H
         NPe4TQ+R61LOJN4vjVrkGNB/3V5JF77d1yU1xb4ZUs9SBouu578Lxlilc5zasT8UTVfr
         RjwYnXyQ9lyitJ3nWPxe/9THoHiYuzy0Po3tsW0lFBbVEjsTE3bVwxFs0J9bzgiDUbL0
         Xgaw==
X-Forwarded-Encrypted: i=1; AJvYcCUKbXw7UYX/KDan42I4Ng9ZPfArbPW3jM33lk9/+dszumE8JQGyIjhfEPeSsG55vi/hpaVCgxoGlgyZNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbvIfhnE0VuaRCfaqFfrZBG3nvd8/wl4JF94SPeVLavclEhShv
	/sFu5igImBGPri9jPS6M4rqwjWrkgwvz1ofQurmwf9e5mow59VNSJzai
X-Gm-Gg: AY/fxX4iGWNtyG3uH6eopVCa6k8EnAmSEh2LiDBuCxH1Cu/fWOUtprQgOExICtNphS4
	uxebzTTsvGufhZmP8ElXTxgDvmNUdrAqjHff9eUXCEVwb3lrV1zyNOFMvshRkyoBlkMLX66HEpt
	HJya2IQ39yeDjapLDzpUY5/QYUlGGyZYjyr3NemojFFH0XpaGB6SJoosZ2tioRoMOwOQGR1Qk/p
	AfWdRtciNhKCj+yWpz8/ef8lqg6FjOumXeV6wb8Z+u4zm4KQ7iuOvq4ooAnCINeyK+KQfuau3re
	b7xrt5UFUQeIiD4eWtW8MSo0+cMCd4OsqqlG8HtdWoLKp7lz5TLJvUVfVMfTHpu2U/OrEZVNkqJ
	BlY5Gsmk4QpsBVwK467WbU6xg6deI///WNqMEBFQDaBXs48IIBatxSYuoFMkQjUu+Rns4oBClZz
	+9L9lnnw7LAt6z/dd6cdIwFrtxtdmCoKiq6Tw=
X-Google-Smtp-Source: AGHT+IFdg5hRfFh4hBUFDQ4U1a6VG0PeU6IM4r660ArEbSmHUn7Y0f1NN6vXtRDoXL3Wed/RCFPauA==
X-Received: by 2002:a05:7300:d194:b0:2a4:3592:c60e with SMTP id 5a478bee46e88-2b17d2d60f6mr14078038eec.31.1768234478227;
        Mon, 12 Jan 2026 08:14:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b17078ccf4sm16324474eec.16.2026.01.12.08.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 08:14:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 08:14:36 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Charles Hsu <hsu.yungteng@gmail.com>
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: pmbus: add support for STEF48H28
Message-ID: <afbcd1d6-a83f-4c0c-859c-f8d452bf3e9d@roeck-us.net>
References: <20251216083712.260140-1-hsu.yungteng@gmail.com>
 <20251217013544.363715-1-hsu.yungteng@gmail.com>
 <20251217013544.363715-3-hsu.yungteng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217013544.363715-3-hsu.yungteng@gmail.com>

On Wed, Dec 17, 2025 at 09:35:44AM +0800, Charles Hsu wrote:
> Add support for STEF48H28 hot-swap controller.
> 
> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> ---
>  Documentation/hwmon/index.rst     |  1 +
>  Documentation/hwmon/stef48h28.rst | 73 +++++++++++++++++++++++++++++
>  MAINTAINERS                       |  7 +++
>  drivers/hwmon/pmbus/Kconfig       |  9 ++++
>  drivers/hwmon/pmbus/Makefile      |  1 +
>  drivers/hwmon/pmbus/stef48h28.c   | 76 +++++++++++++++++++++++++++++++
>  6 files changed, 167 insertions(+)
>  create mode 100644 Documentation/hwmon/stef48h28.rst
>  create mode 100644 drivers/hwmon/pmbus/stef48h28.c
> 
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 85d7a686883e..c682751a1fe3 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -233,6 +233,7 @@ Hardware Monitoring Kernel Drivers
>     shtc1
>     sis5595
>     sl28cpld
> +   stef48h28
>     smpro-hwmon
>     smsc47b397
>     smsc47m192
> diff --git a/Documentation/hwmon/stef48h28.rst b/Documentation/hwmon/stef48h28.rst
> new file mode 100644
> index 000000000000..058de12e979f
> --- /dev/null
> +++ b/Documentation/hwmon/stef48h28.rst
> @@ -0,0 +1,73 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Kernel driver stef48h28
> +======================

Bad length of "==="

> +
> +Supported chips:
> +
> +  * Analog Devices STEF48H28
> +
> +    Prefix: 'stef48h28'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://www.st.com/resource/en/data_brief/stef48h28.pdf
> +
> +Author:
> +
> +  - Charles Hsu <ythsu0511@gmail.com>
> +
> +
> +Description
> +-----------
> +
> +The STEF48H28 is a 30 A integrated e-fuse for 9-80 V DC power rails.
> +It provides inrush control, undervoltage/overvoltage lockout and
> +overcurrent protection using an adaptive (I x t) scheme that permits
> +short high-current pulses typical of CPU/GPU loads.
> +
> +The device offers an analog current-monitor output and an on-chip
> +temperature-monitor signal for system supervision. Startup behavior is
> +programmable through insertion-delay and soft-start settings.
> +
> +Additional features include power-good indication, self-diagnostics,
> +thermal shutdown and a PMBus interface for telemetry and status
> +reporting.
> +
> +Platform data support
> +---------------------
> +
> +The driver supports standard PMBus driver platform data.
> +
> +Sysfs entries
> +-------------
> +
> +================= ========================================
> +in1_label		"vin".
> +in1_input		Measured voltage. From READ_VIN register.
> +in1_min			Minimum Voltage. From VIN_UV_WARN_LIMIT register.
> +in1_max			Maximum voltage. From VIN_OV_WARN_LIMIT register.
> +
> +in2_label		"vout1".
> +in2_input		Measured voltage. From READ_VOUT register.
> +in2_min			Minimum Voltage. From VOUT_UV_WARN_LIMIT register.
> +in2_max			Maximum voltage. From VOUT_OV_WARN_LIMIT register.
> +
> +curr1_label "iin".
> +curr1_input Measured current. From READ_IIN register.
> +
> +curr2_label "iout1".
> +curr2_input Measured current. From READ_IOUT register.
> +
> +power1_label		"pin"
> +power1_input		Measured input power. From READ_PIN register.
> +
> +power2_label		"pout1"
> +power2_input		Measured output power. From READ_POUT register.
> +
> +temp1_input		Measured temperature. From READ_TEMPERATURE_1 register.
> +temp1_max		Maximum temperature. From OT_WARN_LIMIT register.
> +temp1_crit		Critical high temperature. From OT_FAULT_LIMIT register.
> +
> +temp2_input		Measured temperature. From READ_TEMPERATURE_2 register.
> +================= ========================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d701a4d5b00e..be6b6e9ee79b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24665,6 +24665,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/power/supply/st,stc3117.yaml
>  F:	drivers/power/supply/stc3117_fuel_gauge.c
>  
> +ST STEF48H28 DRIVER
> +M:	Charles Hsu	<hsu.yungteng@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/stef48h28.rst
> +F:	drivers/hwmon/pmbus/stef48h28.c
> +
>  ST STM32 FIREWALL
>  M:	Gatien Chevallier <gatien.chevallier@foss.st.com>
>  S:	Maintained
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index f3fb94cebf1a..29ea8ba98b8b 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -576,6 +576,15 @@ config SENSORS_Q54SJ108A2
>  	  This driver can also be built as a module. If so, the module will
>  	  be called q54sj108a2.
>  
> +config SENSORS_STEF48H28
> +    tristate "ST STEF48H28"
> +	help
> +	  If you say yes here you get hardware monitoring support for ST
> +	  STEF48H28.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called stef48h28.
> +
>  config SENSORS_STPDDC60
>  	tristate "ST STPDDC60"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 349a89b6d92e..b2497f1d7bd9 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -56,6 +56,7 @@ obj-$(CONFIG_SENSORS_PLI1209BC)	+= pli1209bc.o
>  obj-$(CONFIG_SENSORS_PM6764TR)	+= pm6764tr.o
>  obj-$(CONFIG_SENSORS_PXE1610)	+= pxe1610.o
>  obj-$(CONFIG_SENSORS_Q54SJ108A2)	+= q54sj108a2.o
> +obj-$(CONFIG_SENSORS_STEF48H28)	+= stef48h28.o
>  obj-$(CONFIG_SENSORS_STPDDC60)	+= stpddc60.o
>  obj-$(CONFIG_SENSORS_TDA38640)	+= tda38640.o
>  obj-$(CONFIG_SENSORS_TPS25990)	+= tps25990.o
> diff --git a/drivers/hwmon/pmbus/stef48h28.c b/drivers/hwmon/pmbus/stef48h28.c
> new file mode 100644
> index 000000000000..df7f7429162b
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/stef48h28.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for STMicroelectronics digital controller stef48h28
> + */
> +
> +#include <linux/err.h>

I don't immediately see where this include would be needed.

> +#include <linux/i2c.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +
> +#include "pmbus.h"
> +
> +static struct pmbus_driver_info stef48h28_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +    .format[PSC_CURRENT_IN] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +    .format[PSC_TEMPERATURE] = direct,
> +    .m[PSC_VOLTAGE_IN] = 50,

Replace spaces with tabs. Also, _please_ run checkpatch on your patches
because it would have told you.

WARNING: please, no spaces at the start of a line
#285: FILE: drivers/hwmon/pmbus/stef48h28.c:17:
+    .format[PSC_CURRENT_IN] = direct,$

> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = 0,
> +	.m[PSC_VOLTAGE_OUT] = 50,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = 0,
> +	.m[PSC_CURRENT_IN] = 100,
> +	.b[PSC_CURRENT_IN] = 0,
> +	.R[PSC_CURRENT_IN] = 0,
> +	.m[PSC_CURRENT_OUT] = 100,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	.R[PSC_CURRENT_OUT] = 0,
> +	.m[PSC_POWER] = 9765,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -3,
> +	.m[PSC_TEMPERATURE] = 25,
> +	.b[PSC_TEMPERATURE] = 500,
> +	.R[PSC_TEMPERATURE] = 0,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_IIN | PMBUS_HAVE_PIN
> +	    | PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
> +	    | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT
> +	    | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | PMBUS_HAVE_POUT
> +};
> +
> +static int stef48h28_probe(struct i2c_client *client)
> +{
> +	return pmbus_do_probe(client, &stef48h28_info);
> +}
> +
> +static const struct i2c_device_id stef48h28_id[] = {
> +	{"stef48h28"},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, stef48h28_id);
> +
> +static const struct of_device_id __maybe_unused stef48h28_of_match[] = {
> +	{.compatible = "st,stef48h28"},
> +	{}
> +};
> +
> +/* This is the driver that will be inserted */

I don't know why people like this comment. It is pointless. Please remove.

Thanks,
Guenter

> +static struct i2c_driver stef48h28_driver = {
> +	.driver = {
> +		   .name = "stef48h28",
> +		   .of_match_table = of_match_ptr(stef48h28_of_match),
> +		   },
> +	.probe = stef48h28_probe,
> +	.id_table = stef48h28_id,
> +};
> +
> +module_i2c_driver(stef48h28_driver);
> +
> +MODULE_AUTHOR("Charles Hsu <hsu.yungteng@gmail.com>");
> +MODULE_DESCRIPTION("PMBus driver for ST stef48h28");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
