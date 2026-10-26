Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046312;
	b=BSXP6sdCCDTS/HR9XLQ8nxc/ssHqSeYnCyA6fXY9OCtEze4Qv6HCtWoObUiCgvGSm+Y1
	 RTKBVKIS3cMLhao/A+Qd5zH6DDYfvvbxx9dlQ+yBR1AFqSUHywMiLr06m0ifJI1wzTelr
	 IXSPz3z5JmZbnnDL36xMc434PRGi/469ug0Gjo5766USB0CRci/riil7hcIMJQmD8P3bc
	 rHgI43L9YU06iJK6tMhT4fIOKLjuvCEA2UUZ4jdoAQJzyMvQLlVq3Xid4vFsckp3FgKVC
	 PGSjE0On7PJyk85oU8bPuM+P1kGbCw2F1f9yOl4RKo0TobPO3lblf6wEgo4C51sqUnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Rgy6JAa8WWpUv6rTqSbaTFGVKK9WiNFppzWhSik38N0=;
	b=jiwJLDEqh5o3RbEtrcPfQO4oUhSu4rc9qjdBhlnGQwTXVh1jXzEZe0fSXbBBZP2m7wYb
	 ZwvWw2g6kWiD6wI2tUI/Xr+WnGYY2Mr1TFVyqAYVyaTNAVyKl+fkvjzxspwd1wOTAkhHj
	 vppMSKw5CyZ7xrYtFtIwCkBWDdpeZwqoSQ0pl3OpH8zIaMX8SLwhSZ9vb4cUhqzydU805
	 08egQXZEyuNFAPIAJY4ScDdrVpv3AzKgyEoAuAGvx1L9GijE4+QkH0Hd5h+LV0NYsRM4m
	 BLNhuBM2gl0HXIKPDjaghsKY2ZpEfUEoK9MwQcoWI2qyb50UxfxBtTnQWE8w9RyiFiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m6ttTcRQ;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFFB606A31F
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 20:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBFFB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m6ttTcRQ
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-185fd3a4ca3so2878203c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046311; x=1793651111; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rgy6JAa8WWpUv6rTqSbaTFGVKK9WiNFppzWhSik38N0=;
        b=m6ttTcRQAMLbecDDXna//Ii2f/zGqMt/aKjrOnBZ20kOlcur5NpzBx7xF7S4TVQgsq
         ICfplv1hL+Weeh6xEI9C1OKfhuwuVh0SrjC50UsE4Bdvywscm0OspUesErvXXz2sVnI1
         jyjLAS9tgi6F1SF34vbRRHL6QJCH6vZ+tMdMxkSI37IkQrJT9Rk6Orw+3RLn4kcCRACx
         /cYUN5WhfuwVH2ADlqZ4TGClOeqWIbsV9qyCqPI076o02T2htQirK2kVYcA2B8WPkAM9
         J8o6MiQ1SXWu/auYzwm5w36tvrqrqUeO8x53LKOKQYcBjkPL3m3f9Ov58/sjg8qsHgJy
         2cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046311; x=1793651111;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rgy6JAa8WWpUv6rTqSbaTFGVKK9WiNFppzWhSik38N0=;
        b=E+DIBYx+yEeN2AwOs2/me9Hdy0RYesKKfYTxDuCh6bpEj9cvYodOPOgq3aOFAf6OI0
         9b8PHlVkkn1KItBz4kiccpMoQYcQRO193TyYgFNa4kQ+kNyYcG4rTeIHD0qNq8VWGD2F
         w/dF/lARYIFwdgXMbUdAvcSagoKaPmVpGWofCgDWuMlQIuPJVO46NMBbGXy5jl2Fq+uq
         9UTll6EEPO30bKvsESms8N3KijoGU9HVjrE+OVtPn9C+U7fe+1TelYH/UmNH5GQHQSQG
         Ar7/R+7BW6D0JF9B1gwZeUyqpOky3WnRFImxqhQyME+40tQOJrdbgrVOlrW8coEt3aQ6
         uLeQ==
X-Gm-Message-State: AFq9FYJJIHy3peTCFDqs2enFb8GSBMNa2dNj/xKmrup5QAgFHiCJzImx
	Ta8gL6aEAV/hJzV/n6i/z8kuNaxKzag1a33cxG4Jpegf5zHvhJNAXKRQoGyL4Q==
X-Gm-Gg: AYBFou33ApM4B1BQ89hQ2tDXzKK6obN9F81ohu+h7+O0zYLDN/bW1fHWBTdQqxAOXcX
	Nh4Zy/gLQWfFailcD2mY+hq4/PHyolT6pPDklBjfA3X+Yc0iHmwRDNIQy0oVQQgAES3zzrVYE16
	n7z3yIDfTCifnKp7V0UAaKx9klBA3NfKUGTQq68pl8K2SNynI8SoAZsVuTBido04zOIdEs1FAPk
	NALESPW5vhXXqg3j0lcvga3a/J6mCG97dzaTLeeSIXJ2OMhVukpjHjHZI5KU/+OjWEFzwMqsQD1
	BykYy8mwVacpRk4IQ2ODDczjVmCAoX41Kn6ul5GI4dq6bVQGD0sZjYkC9kFrJNOmRq5s7YbwAuy
	EerKu17GsXycKSBWk2s6yUgt3M7erkq9XpGVjjTtBDVLXRsMqdUX1OSjzq5qNuHlViiRnjjekTz
	GPuuJ8j2KAynJ0aU/6tSODOZzbeThrtMFXulVQC1Nsqc2hRwhZp2IUFWINfN9yl3MlXmphJd0yI
	1yONEjvbT4id51anxLFSVpU5GfkxXdhIko+XXjdkyBU/SQfUKuqMTDUOaQ6bkBEXLePiA==
X-Received: by 2002:a05:701b:290b:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1993505e004mr10125053c88.11.1793046310420;
        Mon, 26 Oct 2026 13:25:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm26015316c88.22.2026.10.26.13.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:25:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:25:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ethan Jimmy <duhxu0@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (acer-aspire14-ec) Add driver for Acer Aspire 14
 52MT and 52M fan
Message-ID: <0dee51d4-c153-457a-a3aa-ebf1177df045@roeck-us.net>
References: <20261010041313.34153-1-duhxu0@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261010041313.34153-1-duhxu0@gmail.com>

On Fri, Oct 09, 2026 at 09:13:13PM -0700, Ethan Jimmy wrote:
> The Aspire A14-52M and A14-52MT expose fan speed through an I2C HID
> embedded controller that also serves the keyboard. The same product id
> is used by other Acer keyboards, so the driver binds only when DMI
> matches these two models.
> 
> Signed-off-by: Ethan Jimmy <duhxu0@gmail.com>
> ---
>  Documentation/hwmon/acer-aspire14-ec.rst |  38 ++++
>  Documentation/hwmon/index.rst            |   1 +
>  MAINTAINERS                              |   8 +
>  drivers/hwmon/Kconfig                    |  20 ++
>  drivers/hwmon/Makefile                   |   1 +
>  drivers/hwmon/acer-aspire14-ec.c         | 270 +++++++++++++++++++++++
>  6 files changed, 338 insertions(+)
>  create mode 100644 Documentation/hwmon/acer-aspire14-ec.rst
>  create mode 100644 drivers/hwmon/acer-aspire14-ec.c
> 
> diff --git a/Documentation/hwmon/acer-aspire14-ec.rst b/Documentation/hwmon/acer-aspire14-ec.rst
> new file mode 100644
> index 000000000000..73acfb181c39
> --- /dev/null
> +++ b/Documentation/hwmon/acer-aspire14-ec.rst
> @@ -0,0 +1,38 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver acer-aspire14-ec
> +==============================
> +
> +Supported chips:
> +
> +  * Acer Aspire 14 AI 52MT/52M embedded controller
> +
> +    Prefix: 'aspire14_ec'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: unavailable
> +
> +Author: Ethan Jimmy <duhxu0@gmail.com>
> +
> +Description
> +-----------
> +
> +This driver monitors the fan on the Acer Aspire 14 AI (Aspire A14-52M
> +and A14-52MT). The embedded controller is an I2C HID device (vendor
> +0x1025, product 0x174b) that also provides the keyboard.
> +
> +The device is autodetected on those models. The same product id is used
> +by other Acer keyboards; those machines stay with hid-generic. On the
> +Aspire A14-52M and A14-52MT this driver provides both the keyboard and
> +the fan sensor.
> +
> +Fan speed is reported in RPM through the standard hwmon attribute
> +``fan1_input``. The driver does not change fan speed.
> +
> +Sysfs entries
> +-------------
> +
> +======================= ======================================================
> +fan1_input		Fan speed in RPM
> +======================= ======================================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 199ca79621e9..9dd16e6ddabd 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -22,6 +22,7 @@ Hardware Monitoring Kernel Drivers
>     abituguru
>     abituguru3
>     acbel-fsg032
> +   acer-aspire14-ec
>     acpi_power_meter
>     ad7314
>     adc128d818
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5ad12c57ca5f..b944f77c7a71 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -262,6 +262,14 @@ L:	linux-gpio@vger.kernel.org
>  S:	Maintained
>  F:	drivers/gpio/gpio-pcie-idio-24.c
>  
> +ACER ASPIRE 14 AI (A14-52M, A14-52MT) EC FAN DRIVER
> +M:	Ethan Jimmy <duhxu0@gmail.com>
> +L:	linux-hwmon@vger.kernel.org
> +L:	linux-input@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/acer-aspire14-ec.rst
> +F:	drivers/hwmon/acer-aspire14-ec.c
> +
>  ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER
>  M:	Peter Kaestle <peter@piie.net>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 18c682e1a475..84e9e9c115a1 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -67,6 +67,26 @@ config SENSORS_ABITUGURU3
>  	  This driver can also be built as a module. If so, the module
>  	  will be called abituguru3.
>  
> +config SENSORS_ACER_ASPIRE14_EC
> +	tristate "Acer Aspire 14 AI EC fan sensor"
> +	depends on HID
> +	depends on X86 || COMPILE_TEST
> +	depends on DMI || COMPILE_TEST
> +	depends on I2C_HID_ACPI || I2C_HID_OF || COMPILE_TEST
> +	help
> +	  If you say yes here you get support for reading the fan
> +	  speed from the embedded controller on the Acer Aspire 14 AI
> +	  (Aspire A14-52M and A14-52MT). The controller is an I2C HID
> +	  device (vendor 0x1025, product 0x174b) that also provides the
> +	  keyboard. Fan speed is read-only.
> +
> +	  The same product id is used by other Acer keyboards. This driver
> +	  registers only on the Aspire A14-52M and A14-52MT, where it also
> +	  provides the keyboard. Other machines stay with hid-generic.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called acer-aspire14-ec.
> +
>  config SENSORS_SMPRO
>  	tristate "Ampere's Altra SMpro hardware monitoring driver"
>  	depends on MFD_SMPRO
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d4c345ed7261..ac5cec462c81 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -27,6 +27,7 @@ obj-$(CONFIG_SENSORS_W83791D)	+= w83791d.o
>  
>  obj-$(CONFIG_SENSORS_ABITUGURU)	+= abituguru.o
>  obj-$(CONFIG_SENSORS_ABITUGURU3)+= abituguru3.o
> +obj-$(CONFIG_SENSORS_ACER_ASPIRE14_EC) += acer-aspire14-ec.o
>  obj-$(CONFIG_SENSORS_AD7314)	+= ad7314.o
>  obj-$(CONFIG_SENSORS_AD7414)	+= ad7414.o
>  obj-$(CONFIG_SENSORS_AD7418)	+= ad7418.o
> diff --git a/drivers/hwmon/acer-aspire14-ec.c b/drivers/hwmon/acer-aspire14-ec.c
> new file mode 100644
> index 000000000000..9d100f2a0b80
> --- /dev/null
> +++ b/drivers/hwmon/acer-aspire14-ec.c
> @@ -0,0 +1,270 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hwmon driver for the Acer Aspire 14 AI embedded controller.
> + *
> + * Author: Ethan Jimmy <duhxu0@gmail.com>
> + *
> + * On the Aspire A14-52M and A14-52MT the EC is an I2C HID device
> + * (vendor 0x1025, product 0x174b) that also serves the keyboard. The same
> + * product id is used by other Acer keyboards. The HID driver is registered
> + * only when DMI matches these models, so those machines stay with hid-generic.

Doees this impact the actual keyboard functionality ?
> + * 
> + * Fan speed is read with one feature report: A0 00 A0 08 00 02 02. The
> + * reply carries a little-endian status word, command id, and RPM.
> + */
> +
> +#include <linux/dmi.h>
> +#include <linux/hid.h>
> +#include <linux/hwmon.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/string.h>
> +#include <linux/unaligned.h>
> +
> +#define ACER_ASPIRE14_VID		0x1025
> +#define ACER_ASPIRE14_PID		0x174b
> +#define ACER_ASPIRE14_REPORT_ID		0xa0
> +#define ACER_ASPIRE14_PREFIX		0xa0
> +#define ACER_ASPIRE14_CMD_MARK		0x02
> +#define ACER_ASPIRE14_RPM_OFFSET	8
> +#define ACER_ASPIRE14_MIN_REPLY		(ACER_ASPIRE14_RPM_OFFSET + sizeof(u16))
> +#define ACER_ASPIRE14_STATUS_OK		0xe000
> +#define ACER_ASPIRE14_CMD_FAN_RPM	0x0008
> +
> +struct acer_aspire14_data {
> +	struct hid_device *hdev;
> +	struct device *hwmon_dev;
> +	struct mutex lock; /* protects buf across feature report I/O */

There is no asynchronous call, meaning the lock is unnecessary
since requests are already serialised by the hwmon subsystem.

> +	u8 *buf;
> +	u32 report_len;
> +};
> +
> +static int acer_aspire14_fan_rpm(struct acer_aspire14_data *data, long *val)
> +{
> +	u16 status, command_id;
> +	int ret;
> +
> +	mutex_lock(&data->lock);
> +
> +	memset(data->buf, 0, data->report_len);
> +	data->buf[0] = ACER_ASPIRE14_REPORT_ID;
> +	data->buf[2] = ACER_ASPIRE14_PREFIX;
> +	put_unaligned_le16(ACER_ASPIRE14_CMD_FAN_RPM, &data->buf[3]);
> +	data->buf[5] = ACER_ASPIRE14_CMD_MARK;
> +	data->buf[6] = ACER_ASPIRE14_CMD_MARK;
> +
> +	ret = hid_hw_raw_request(data->hdev, ACER_ASPIRE14_REPORT_ID,
> +				 data->buf, data->report_len,
> +				 HID_FEATURE_REPORT, HID_REQ_SET_REPORT);
> +	if (ret < 0)
> +		goto unlock;
> +	if (!ret) {

Shouldn't that check for a specific length, such as data->report_len ?

> +		ret = -EIO;
> +		goto unlock;
> +	}
> +
> +	memset(data->buf, 0, data->report_len);
> +	data->buf[0] = ACER_ASPIRE14_REPORT_ID;
> +	ret = hid_hw_raw_request(data->hdev, ACER_ASPIRE14_REPORT_ID,
> +				 data->buf, data->report_len,
> +				 HID_FEATURE_REPORT, HID_REQ_GET_REPORT);
> +	if (ret < 0)
> +		goto unlock;
> +	if (ret < ACER_ASPIRE14_MIN_REPLY) {
> +		ret = -EIO;
> +		goto unlock;
> +	}
> +
> +	status = get_unaligned_le16(&data->buf[1]);
> +	command_id = get_unaligned_le16(&data->buf[3]);
> +	if (status != ACER_ASPIRE14_STATUS_OK ||
> +	    command_id != ACER_ASPIRE14_CMD_FAN_RPM) {
> +		ret = -EIO;
> +		goto unlock;
> +	}
> +
> +	*val = get_unaligned_le16(&data->buf[ACER_ASPIRE14_RPM_OFFSET]);
> +	ret = 0;
> +
> +unlock:
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
> +
> +static int acer_aspire14_read(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct acer_aspire14_data *data = dev_get_drvdata(dev);
> +
> +	if (type != hwmon_fan || attr != hwmon_fan_input || channel != 0)
> +		return -EOPNOTSUPP;

Unnecessary check.

> +
> +	return acer_aspire14_fan_rpm(data, val);
> +}
> +
> +static umode_t acer_aspire14_is_visible(const void *drvdata,
> +					enum hwmon_sensor_types type,
> +					u32 attr, int channel)
> +{
> +	if (type == hwmon_fan && attr == hwmon_fan_input && channel == 0)
> +		return 0444;
> +
Unnecessary check. Just return 0444.

> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *const acer_aspire14_info[] = {
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops acer_aspire14_ops = {
> +	.is_visible = acer_aspire14_is_visible,
> +	.read = acer_aspire14_read,
> +};
> +
> +static const struct hwmon_chip_info acer_aspire14_chip_info = {
> +	.ops = &acer_aspire14_ops,
> +	.info = acer_aspire14_info,
> +};
> +
> +static const struct dmi_system_id acer_aspire14_dmi_table[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Aspire A14-52M"),
> +		},
> +	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Aspire A14-52MT"),
> +		},
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(dmi, acer_aspire14_dmi_table);
> +
> +static u32 acer_aspire14_fan_report_len(struct hid_device *hdev)
> +{
> +	struct hid_report *report;
> +	u32 len;
> +
> +	report = hdev->report_enum[HID_FEATURE_REPORT].report_id_hash[ACER_ASPIRE14_REPORT_ID];
> +	if (!report)
> +		return 0;
> +
> +	len = hid_report_len(report);
> +	if (len < ACER_ASPIRE14_MIN_REPLY || len > HID_MAX_BUFFER_SIZE)
> +		return 0;
> +
> +	return len;
> +}
> +
> +static int acer_aspire14_probe(struct hid_device *hdev,
> +			       const struct hid_device_id *id)
> +{
> +	struct acer_aspire14_data *data;
> +	struct device *hwmon_dev;
> +	long rpm;
> +	u32 report_len;
> +	int ret;
> +
> +	hdev->quirks |= HID_QUIRK_INPUT_PER_APP;
> +
> +	ret = hid_parse(hdev);
> +	if (ret)
> +		return ret;
> +
> +	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT | HID_CONNECT_DRIVER);
> +	if (ret)
> +		return ret;
> +
> +	report_len = acer_aspire14_fan_report_len(hdev);
> +	if (!report_len)
> +		return 0;
> +
> +	data = devm_kzalloc(&hdev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return 0;
> +
> +	data->buf = devm_kzalloc(&hdev->dev, report_len, GFP_KERNEL);
> +	if (!data->buf)
> +		return 0;
> +	data->report_len = report_len;
> +
> +	ret = devm_mutex_init(&hdev->dev, &data->lock);
> +	if (ret) {
> +		hid_warn(hdev, "failed to init mutex: %d\n", ret);
> +		return 0;
> +	}
> +
> +	data->hdev = hdev;
> +	hid_set_drvdata(hdev, data);
> +
> +	ret = acer_aspire14_fan_rpm(data, &rpm);
> +	if (ret)
> +		hid_dbg(hdev, "fan report failed: %d\n", ret);
> +	else
> +		hid_dbg(hdev, "initial fan speed %ld RPM\n", rpm);
> +
> +	hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "aspire14_ec",
> +						    data, &acer_aspire14_chip_info,
> +						    NULL);
> +	if (IS_ERR(hwmon_dev)) {
> +		hid_warn(hdev, "failed to register hwmon: %pe\n", hwmon_dev);
> +		return 0;

That is a problem. Something is wrong here: If the driver fails to instantiate
the hwmon device, it should return an error. Same for all other "return 0"
instances above.

> +	}
> +	data->hwmon_dev = hwmon_dev;
> +
> +	return 0;
> +}
> +
> +static void acer_aspire14_remove(struct hid_device *hdev)
> +{
> +	struct acer_aspire14_data *data = hid_get_drvdata(hdev);
> +
> +	if (data && data->hwmon_dev)
> +		hwmon_device_unregister(data->hwmon_dev);
> +	hid_hw_stop(hdev);
> +}
> +
> +static int acer_aspire14_reset_resume(struct hid_device *hdev)
> +{
> +	if (hdev->claimed & HID_CLAIMED_INPUT)
> +		hidinput_reset_resume(hdev);
> +
> +	return 0;
> +}
> +
> +static const struct hid_device_id acer_aspire14_id_table[] = {
> +	{ HID_I2C_DEVICE(ACER_ASPIRE14_VID, ACER_ASPIRE14_PID) },
> +	{ }
> +};
> +
> +static struct hid_driver acer_aspire14_driver = {
> +	.name = "acer-aspire14-ec",
> +	.id_table = acer_aspire14_id_table,
> +	.probe = acer_aspire14_probe,
> +	.remove = acer_aspire14_remove,
> +	.reset_resume = acer_aspire14_reset_resume,
> +};
> +
> +static int __init acer_aspire14_init(void)
> +{
> +	if (!dmi_check_system(acer_aspire14_dmi_table))
> +		return -ENODEV;
> +
> +	return hid_register_driver(&acer_aspire14_driver);
> +}
> +
> +static void __exit acer_aspire14_exit(void)
> +{
> +	hid_unregister_driver(&acer_aspire14_driver);
> +}
> +
> +module_init(acer_aspire14_init);
> +module_exit(acer_aspire14_exit);
> +
> +MODULE_AUTHOR("Ethan Jimmy <duhxu0@gmail.com>");
> +MODULE_DESCRIPTION("Acer Aspire 14 AI EC fan driver");
> +MODULE_LICENSE("GPL");
