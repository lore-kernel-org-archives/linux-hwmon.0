Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B73E3B19CB
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 21:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775856052; cv=none; b=b7BSPcFE+zj6G6AK42Ucp9GsQhfSV5MebG2/NQJ8IFGnCkA9nrjvlQHlFH2SphB+l7nl95QlIBJ96Wp/sAIaUu+ylhZwPz5uYpfym9NKVzuKllAe6sJVsBL/622HjzF5OHOvGSJRKJ0YyE7r2FRD7+n5U33g+ra+L+kypX3hn7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775856052; c=relaxed/simple;
	bh=nHis4KbGzKiM9B6a3caKE9lQfYb92pA78VEAYoJK2aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXWXXpjMNWFVPtMdEdEAtETmkWTvq+8WyLJMGLxcGdhKe/zHQlZBoxNL9/SvK7C1ZnfQEvMYOKdINl3YjiysdeXfGWTb0zX3kSOqQzFwglT/QwX7TTgQAiWCcVfDPkFzqjAHd5xypVvHqaVb3G3RRVyQvrewW+fX6g+NL4ZBC6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gg+8N9WX; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gg+8N9WX"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d9749c26dso2325620a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 14:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775856050; x=1776460850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaNs7oe7X7plINpb7j4hvUEmm6egxVc5Y+2JXLZ35cg=;
        b=Gg+8N9WX95Ga+kCQTYCjJzQsVQ1XPjpTfw8x6cNIxZyoQhUz10hh2zwHuavK8pK9hi
         JX0DTa6HAam8TKWPVUX3FwjbiItDf9ECghg0ZgirvuDgsdEyGBXm2gxmUSx251dEJ89X
         zjL7NWCqNqM+klgbF1pq+u3gf+CQtQX3+DN88z4DjkGHe7wluMjuxwOJYenQqQfYJdxX
         qwh091xOJTx2z/tu2MpW5sP2F/9Yp4GEFrmWsMobI+PRiN7koT1DquWWq/MfmM/qtCvJ
         nQgDQlHQtOtVw8q3irgdxd7CoJq/r2gXKFkcbXCnLrWj0qSYnkAkgm4Wn3ObQ/uRF4nw
         6Ddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775856050; x=1776460850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KaNs7oe7X7plINpb7j4hvUEmm6egxVc5Y+2JXLZ35cg=;
        b=Y1iPQ62xC10blszUOwhLWMOsDvwFBvDAtbkfUewe9uWmySF7M1I1cyo8fAWD94XNm1
         gy4MsQgFfkJFtcnavBsMiZtRrYm20av6Y+ra6WM/FBr7t1XQpYef9/Ygx7GaLx86pI7J
         FUTJChRfkNMVIXGrsiLh4fPKr7ll4xDlIu+J/ZjlIJnO8ShD14L/QHUGGHMtB0ds7kPG
         17Elg+/gaCYOp/trhTYYScnetlmSOkc1whhtrC5wRd0rNCS9nHlwX7DnPfMSMOtRKYGU
         pk26pnjQD8jnp+Lwi7QFSWs3bte8puBjbZd6uxkXGGu26JMdy/Vt7/uRjJnbFTucuSK8
         ydEg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ2zjOKHreEGNUhVkDEpprCtjCxZuB0+vL5RS4WRvNCPRTvw0URczHRiQRStxgvBPVDntFrGqHOjYtWw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqV/dvvXc2/+t4XqO1u7s9X23L39PIwGtrSbbAXuRcGOTYVMf
	Gs2Gi5h1XC//IjDGjHDAFSYRXBoihsXYBZ96NDWeE8IP04V9W7zfI1uQ
X-Gm-Gg: AeBDiethNsEvJ91PIsPw7pEkQVEFAHw5L/JM3ExJaoVpVChdMAtFvA6dObtVZKFCfct
	X7evNWwu6c0x/uEgKfKGMkwN3IxfCAqgQrFFkEhy5MWCLeJYUSNEuoyYUw6zSEdoKsPqyjT4VJH
	4OSL6+2ZB5rGu9wIxIzEw2W3gBcY2J57SFuV3ohpK7Avs7EawOrRyEucZOCMJxJmQJyCh2/LG33
	7DZsr0aJHmdgJM4iT4JWwa7sSu+tQVCf7e4ymHJ9UwUAtjIeaclesDo3KATkXc04VWZxCmnTqof
	BUOIk3i2VxkN518YKKFYCMEI7g8JnJWXZNQZrwAYH8WkvAiJC/F22Pvkh3hRjwHjlVlKq2Mer9N
	f1V9Vf+gifmHc2jDMJhXbw/M2gLgSfWl2u80RXV5FcJaAnV8HUofUnewGTzSHYt0IhLJ/jm0c6k
	Dc3HrCM6/9NRl/XG5Sseh+lzuWPjvxPmZWS+UPWgAo7wjJ0HM=
X-Received: by 2002:a17:90b:4f86:b0:35e:30bc:96d3 with SMTP id 98e67ed59e1d1-35e427eb04dmr5349968a91.9.1775856050387;
        Fri, 10 Apr 2026 14:20:50 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e3517f2a0sm10240059a91.17.2026.04.10.14.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 14:20:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 10 Apr 2026 14:20:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v4 2/2] hwmon:(pmbus/xdp720) Add support for efuse xdp720
Message-ID: <19284383-2e50-45c6-bf26-9bd366988c62@roeck-us.net>
References: <20260410070154.3313-1-Ashish.Yadav@infineon.com>
 <20260410070154.3313-3-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410070154.3313-3-Ashish.Yadav@infineon.com>

On Fri, Apr 10, 2026 at 12:31:54PM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Add the pmbus driver for Infineon XDP720 Digital eFuse Controller.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter

> ---
> XDP720 Digital eFuse Controller provides accurate system telemetry
> (V, I, P, T) and reports analog current at the IMON pin for post-processing.
> 
> The Current and Power measurement depends on the RIMON and GIMON values.
> Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
> https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
> 
> The GIMON (microA/A) depends on the 10th bit of TELEMETRY_AVG PMBUS Register.
> The value of RIMON (kohm) can be provided by the user through device tree using
> infineon,rimon-micro-ohms  property.
> ---
>  drivers/hwmon/pmbus/Kconfig  |   9 +++
>  drivers/hwmon/pmbus/Makefile |   1 +
>  drivers/hwmon/pmbus/xdp720.c | 128 +++++++++++++++++++++++++++++++++++
>  3 files changed, 138 insertions(+)
>  create mode 100644 drivers/hwmon/pmbus/xdp720.c
> 
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index fc1273abe357..c419e3ecce90 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -702,6 +702,15 @@ config SENSORS_XDP710
>  	  This driver can also be built as a module. If so, the module will
>  	  be called xdp710.
>  
> +config SENSORS_XDP720
> +	tristate "Infineon XDP720 family"
> +	help
> +	  If you say yes here you get hardware monitoring support for Infineon
> +	  XDP720.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called xdp720.
> +
>  config SENSORS_XDPE152
>  	tristate "Infineon XDPE152 family"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index d6c86924f887..1cac7ccae79f 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -68,6 +68,7 @@ obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
>  obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
>  obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
> +obj-$(CONFIG_SENSORS_XDP720)	+= xdp720.o
>  obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
>  obj-$(CONFIG_SENSORS_XDPE152)	+= xdpe152c4.o
>  obj-$(CONFIG_SENSORS_ZL6100)	+= zl6100.o
> diff --git a/drivers/hwmon/pmbus/xdp720.c b/drivers/hwmon/pmbus/xdp720.c
> new file mode 100644
> index 000000000000..8729a771f216
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/xdp720.c
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Hardware monitoring driver for Infineon XDP720 Digital eFuse Controller
> + *
> + * Copyright (c) 2026 Infineon Technologies. All rights reserved.
> + */
> +
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/of_device.h>
> +#include <linux/bitops.h>
> +#include <linux/math64.h>
> +#include "pmbus.h"
> +
> +/*
> + * The IMON resistor required to generate the system overcurrent protection.
> + * Arbitrary default Rimon value: 2k Ohm
> + */
> +#define XDP720_DEFAULT_RIMON 2000000000 /* 2k ohm */
> +#define XDP720_TELEMETRY_AVG 0xE9
> +
> +static struct pmbus_driver_info xdp720_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = direct,
> +	.format[PSC_VOLTAGE_OUT] = direct,
> +	.format[PSC_CURRENT_OUT] = direct,
> +	.format[PSC_POWER] = direct,
> +	.format[PSC_TEMPERATURE] = direct,
> +
> +	.m[PSC_VOLTAGE_IN] = 4653,
> +	.b[PSC_VOLTAGE_IN] = 0,
> +	.R[PSC_VOLTAGE_IN] = -2,
> +	.m[PSC_VOLTAGE_OUT] = 4653,
> +	.b[PSC_VOLTAGE_OUT] = 0,
> +	.R[PSC_VOLTAGE_OUT] = -2,
> +	/*
> +	 * Current and Power measurement depends on the RIMON (kOhm) and
> +	 * GIMON(microA/A) values.
> +	 */
> +	.m[PSC_CURRENT_OUT] = 24668,
> +	.b[PSC_CURRENT_OUT] = 0,
> +	.R[PSC_CURRENT_OUT] = -4,
> +	.m[PSC_POWER] = 4486,
> +	.b[PSC_POWER] = 0,
> +	.R[PSC_POWER] = -1,
> +	.m[PSC_TEMPERATURE] = 54,
> +	.b[PSC_TEMPERATURE] = 22521,
> +	.R[PSC_TEMPERATURE] = -1,
> +
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_VOUT | PMBUS_HAVE_PIN |
> +		   PMBUS_HAVE_TEMP | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_INPUT |
> +		   PMBUS_HAVE_STATUS_TEMP,
> +};
> +
> +static int xdp720_probe(struct i2c_client *client)
> +{
> +	struct pmbus_driver_info *info;
> +	int ret;
> +	u32 rimon;
> +	int gimon;
> +
> +	info = devm_kmemdup(&client->dev, &xdp720_info, sizeof(*info),
> +			    GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	ret = devm_regulator_get_enable(&client->dev, "vdd-vin");
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +			"failed to enable vdd-vin supply\n");
> +
> +	ret = i2c_smbus_read_word_data(client, XDP720_TELEMETRY_AVG);
> +	if (ret < 0) {
> +		dev_err(&client->dev, "Can't get TELEMETRY_AVG\n");
> +		return ret;
> +	}
> +
> +	ret >>= 10; /* 10th bit of TELEMETRY_AVG REG for GIMON Value */
> +	ret &= GENMASK(0, 0);
> +	if (ret == 1)
> +		gimon = 18200; /* output gain 18.2 microA/A */
> +	else
> +		gimon = 9100; /* output gain 9.1 microA/A */
> +
> +	if (of_property_read_u32(client->dev.of_node,
> +				 "infineon,rimon-micro-ohms", &rimon))
> +		rimon = XDP720_DEFAULT_RIMON; /* Default if not set via DT */
> +	if (rimon == 0)
> +		return -EINVAL;
> +
> +	/* Adapt the current and power scale for each instance */
> +	info->m[PSC_CURRENT_OUT] = DIV64_U64_ROUND_CLOSEST((u64)
> +		info->m[PSC_CURRENT_OUT] * rimon * gimon, 1000000000000ULL);
> +	info->m[PSC_POWER] = DIV64_U64_ROUND_CLOSEST((u64)
> +		info->m[PSC_POWER] * rimon * gimon, 1000000000000000ULL);
> +
> +	return pmbus_do_probe(client, info);
> +}
> +
> +static const struct of_device_id xdp720_of_match[] = {
> +	{ .compatible = "infineon,xdp720" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, xdp720_of_match);
> +
> +static const struct i2c_device_id xdp720_id[] = {
> +	{ "xdp720" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, xdp720_id);
> +
> +static struct i2c_driver xdp720_driver = {
> +	.driver = {
> +		   .name = "xdp720",
> +		   .of_match_table = xdp720_of_match,
> +	},
> +	.probe = xdp720_probe,
> +	.id_table = xdp720_id,
> +};
> +
> +module_i2c_driver(xdp720_driver);
> +
> +MODULE_AUTHOR("Ashish Yadav <ashish.yadav@infineon.com>");
> +MODULE_DESCRIPTION("PMBus driver for Infineon XDP720 Digital eFuse Controller");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
