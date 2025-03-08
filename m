Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7853119EEBD
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Mar 2025 22:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741473170; cv=none; b=MmxvYCqZi3bpmliK1NqTlXutoKWVw3m8D9O/zeUuY1judel680EW8j9Fq4NhwbhW0J+3Ed45pWLaBGY0QsH0PAjnOKq4DqZekOCbiAmpopSmUg768tDVwC9vbbCD/01JLaoSb+bXdJym+iLV3pqTDmlviict9xbjxZC9OSpEx/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741473170; c=relaxed/simple;
	bh=eK7vrXTTiUJPHG7kDVMbTkATD/jeekNYhCG7h4kel/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGOuFeYwV8svwJv+pWBpxKUw/+BNd91+Podatyvgf8sR/Ev86PibzP6jpcxWliWE/XKTYqpS6RBWDqq183MQ0ssEq8MSktmAXUs5XLCteS+iiYvoG6iAN1/J4LnoRqh3g57cXMkbFKwloBuL6woYNwivEJXk2id/6+x7I72NBYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyFl8w61; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyFl8w61"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2fec13a4067so4709274a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Mar 2025 14:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741473167; x=1742077967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=DskHMzW3peHqf34I84wSW5Ly8Iu1aYkim5zVeqtGqoM=;
        b=YyFl8w61+TvFD0u1SF1BYd6B+P3fM18TGjmGFdnkA5U/K+IFBkhaqRN2ANgnrzszGz
         LMFNnp35a3jcekq3CwpMFZMNfhZ401a/Tlw+H6ewktFYAJLjBwHKd7i01h6ts3DjP8k+
         01Tv9dxLQlH8IzP/zOdGko9U1wXtmRlKBTwQwbzgWaUjz4+I8S3VJ6FLeipuey6FoydS
         2sg0Za23vWqnJrll5beA+i69ktH3eJ+ZNxdP29jXczfKALLOlT4F44EpLv9k+Vio0cp1
         dbboadcMvyVfAt6rMYyx5aPr/UORrMglED/wJoJnZfUDLZYTkNOXvLk5aeciIJqKU8uc
         h/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741473167; x=1742077967;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DskHMzW3peHqf34I84wSW5Ly8Iu1aYkim5zVeqtGqoM=;
        b=u046sdawy+Nb5HeGJ4KBBpo89rH87oR/i1c7uGr7ciGnBgCtDWPNlyiuTSirP8tyrt
         2VDsETNIYVr5msS3GM4YVr91gdfQ3vLuOsCx8Yf25kHqHC3aLvS8C8FgXMOdC5Zg3sNx
         zMF1bMwpJlJyQgrAU/BKWbJw/u4Hva5GV+aDj5WRFqtDFfujI2OlFVVjSSWYFb3acjxg
         89xytSvcErbVJG9Vt9ih+WBKbewE2FH725FoGP819+YCLwHcZoBSg9veISMRnsDDHb5T
         6Mbg69ElZQ/bnyShGsA/U9lGUcyCk6uckFSvFITGMf/ICGu4hGf9mOeXDxJBjTNVTkAW
         APVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK5RsGf9HVGWMROMUPrejDIlG0XfB8kigCtB43X6dU/v6mQ5WscgciuqH3ZMizDxZrZB/4EqeBIwj0eQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2EUS3IUDsoUr0t331u4ljkUzwU4C8oqVpRsi8i8eK1/ermaSm
	SynS9DmCgHEthoKVl7Qbt3VXTTSqDWtIijx7zmZDCB3FwSOjL+7D
X-Gm-Gg: ASbGncv9wPAoMl6UNkEuamuHKMI1r7EcKXnKYF7JsbqUI2EWBQa/kgeeY7M+ZllLJep
	qtkB+aBFe4ziUzBJ/6z0gmKTyOv3mdv2Wcw2jz5XWpHPRgh9NneNlihLS2Jk/rhkgAq6rq5mbEy
	Yx/tIXdfeoe2azfR9a8yS5RA7KHH0FnJmZmaO7bhbTjqz0GBGfbg9SQ+hLqYzUbCaOshk2uJj6x
	ib8r0L7YfPe4z/BDRodoYb2Us0lY4qLF+mYEQIFVi2vgUkWTcVNQLmcW8h07wQ2asoOFNhbcbZU
	4XNOG/tPTcqdyZix84UbZrF5LoyBUHvQG8HUtL0Fj+tIqcKoIAFlx+X9Hoa89z6FX5IjZ6/8ot4
	o9uGOdAbsRRwDTmxfag==
X-Google-Smtp-Source: AGHT+IGqMgnNCDMUcJK/1/d76NyGULpsaRNSogZ2riNGM3FEgE2ocVeJj32bzX1Rio02dj5QcLVTmA==
X-Received: by 2002:a17:90b:3887:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-2ff7ce84ce1mr13682191a91.8.1741473166686;
        Sat, 08 Mar 2025 14:32:46 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693f8804sm5824047a91.47.2025.03.08.14.32.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Mar 2025 14:32:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <54a58308-e559-4007-a751-2d8a8fef29bb@roeck-us.net>
Date: Sat, 8 Mar 2025 14:32:44 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: Gerhard Engleder <gerhard@engleder-embedded.com>,
 linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, Gerhard Engleder <eg@keba.com>
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250308212346.51316-1-gerhard@engleder-embedded.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/8/25 13:23, Gerhard Engleder wrote:
> From: Gerhard Engleder <eg@keba.com>
> 
> The KEBA battery monitoring controller is found in the system FPGA of
> KEBA PLC devices. It puts a load on the coin cell battery to check the
> state of the battery.
> 
> Signed-off-by: Gerhard Engleder <eg@keba.com>

Looking into the keba code, that is kind of piece by piece approach.
I see a reference to fans in drivers/misc/keba/cp500.c, so I guess I'll see
a fan controller driver at some point in the future. I do not support
the idea of having multiple drivers for the hardware monitoring
functionality of a single device.

Either case, the attribute needs to be documented.

Some more technical comments inline.

Guenter

> ---
>   drivers/hwmon/Kconfig  |  12 ++++
>   drivers/hwmon/Makefile |   1 +
>   drivers/hwmon/kbatt.c  | 159 +++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 172 insertions(+)
>   create mode 100644 drivers/hwmon/kbatt.c
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 4cbaba15d86e..ec396252cc18 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -335,6 +335,18 @@ config SENSORS_K10TEMP
>   	  This driver can also be built as a module. If so, the module
>   	  will be called k10temp.
>   
> +config SENSORS_KBATT
> +	tristate "KEBA battery controller support"
> +	depends on HAS_IOMEM
> +	depends on KEBA_CP500 || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	help
> +	  This driver supports the battery monitoring controller found in
> +	  KEBA system FPGA devices.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called kbatt.
> +
>   config SENSORS_FAM15H_POWER
>   	tristate "AMD Family 15h processor power"
>   	depends on X86 && PCI && CPU_SUP_AMD
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index b7ef0f0562d3..4671a9b77b55 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -108,6 +108,7 @@ obj-$(CONFIG_SENSORS_IT87)	+= it87.o
>   obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
>   obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
>   obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
> +obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
>   obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
>   obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
>   obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
> diff --git a/drivers/hwmon/kbatt.c b/drivers/hwmon/kbatt.c
> new file mode 100644
> index 000000000000..09a622a7d36a
> --- /dev/null
> +++ b/drivers/hwmon/kbatt.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) KEBA Industrial Automation Gmbh 2025
> + *
> + * Driver for KEBA battery monitoring controller FPGA IP core
> + */
> +
> +#include <linux/hwmon.h>
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/misc/keba.h>
> +
> +#define KBATT "kbatt"
> +
> +#define KBATT_CONTROL_REG		0x4
> +#define   KBATT_CONTROL_BAT_TEST	0x01
> +
> +#define KBATT_STATUS_REG		0x8
> +#define   KBATT_STATUS_BAT_OK		0x01
> +
> +#define KBATT_MAX_UPD_INTERVAL	(5 * HZ)
> +#define KBATT_SETTLE_TIME_MS	100
> +
> +struct kbatt {
> +	struct keba_batt_auxdev *auxdev;
> +	/* update lock */
> +	struct mutex lock;
> +	void __iomem *base;
> +	struct device *hwmon_dev;
> +
> +	bool valid;
> +	unsigned long last_updated; /* in jiffies */
> +	long alarm;

bool

> +};
> +
> +static long kbatt_alarm(struct kbatt *kbatt)
> +{
> +	mutex_lock(&kbatt->lock);
> +
> +	if (time_after(jiffies, kbatt->last_updated + KBATT_MAX_UPD_INTERVAL) ||
> +	    !kbatt->valid) {
> +		/* switch load on */
> +		iowrite8(KBATT_CONTROL_BAT_TEST,
> +			 kbatt->base + KBATT_CONTROL_REG);
> +
> +		/* wait some time to let things settle */
> +		msleep(KBATT_SETTLE_TIME_MS);
> +
> +		/* check battery state */
> +		if (ioread8(kbatt->base + KBATT_STATUS_REG) &
> +		    KBATT_STATUS_BAT_OK)
> +			kbatt->alarm = 0;
> +		else
> +			kbatt->alarm = 1;
> +
> +		/* switch load off */
> +		iowrite8(0, kbatt->base + KBATT_CONTROL_REG);
> +
> +		kbatt->last_updated = jiffies;
> +		kbatt->valid = true;
> +	}
> +
> +	mutex_unlock(&kbatt->lock);
> +
> +	return kbatt->alarm;
> +}
> +
> +static int kbatt_read(struct device *dev, enum hwmon_sensor_types type,
> +		      u32 attr, int channel, long *val)
> +{
> +	struct kbatt *kbatt = dev_get_drvdata(dev);
> +
> +	if ((channel != 1) || (attr != hwmon_in_alarm))

Various unnecessary ( ) here and below.

> +		return -EOPNOTSUPP;
> +
> +	*val = kbatt_alarm(kbatt);
> +
> +	return 0;
> +}
> +
> +static umode_t kbatt_is_visible(const void *data, enum hwmon_sensor_types type,
> +				u32 attr, int channel)
> +{
> +	if ((channel == 1) && (attr == hwmon_in_alarm))
> +		return 0444;
> +
> +	return 0;
> +}
> +
> +static const struct hwmon_channel_info *kbatt_info[] = {
> +	HWMON_CHANNEL_INFO(in,
> +			   /* 0: dummy, skipped in is_visible */
> +			   HWMON_I_ALARM,
> +			   /* 1: input alarm channel */
> +			   HWMON_I_ALARM),

Not acceptable. The first voltage channel is channel 0, not 1.

> +	NULL
> +};
> +
> +static const struct hwmon_ops kbatt_hwmon_ops = {
> +	.is_visible = kbatt_is_visible,
> +	.read = kbatt_read,
> +};
> +
> +static const struct hwmon_chip_info kbatt_chip_info = {
> +	.ops = &kbatt_hwmon_ops,
> +	.info = kbatt_info,
> +};
> +
> +static int kbatt_probe(struct auxiliary_device *auxdev,
> +		       const struct auxiliary_device_id *id)
> +{
> +	struct device *dev = &auxdev->dev;
> +	struct kbatt *kbatt;
> +
> +	kbatt = devm_kzalloc(dev, sizeof(struct kbatt), GFP_KERNEL);
> +	if (!kbatt)
> +		return -ENOMEM;
> +	kbatt->auxdev = container_of(auxdev, struct keba_batt_auxdev, auxdev);
> +	mutex_init(&kbatt->lock);
> +	auxiliary_set_drvdata(auxdev, kbatt);
> +
> +	kbatt->base = devm_ioremap_resource(dev, &kbatt->auxdev->io);
> +	if (IS_ERR(kbatt->base))
> +		return PTR_ERR(kbatt->base);
> +
> +	kbatt->hwmon_dev = devm_hwmon_device_register_with_info(dev, KBATT,
> +							     kbatt,
> +							     &kbatt_chip_info,
> +							     NULL);
> +	if (IS_ERR(kbatt->hwmon_dev))
> +		return PTR_ERR(kbatt->hwmon_dev);
> +
> +	return 0;
> +}
> +
> +static void kbatt_remove(struct auxiliary_device *auxdev)
> +{
> +	auxiliary_set_drvdata(auxdev, NULL);
> +}
> +
> +static const struct auxiliary_device_id kbatt_devtype_aux[] = {
> +	{ .name = "keba.batt" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(auxiliary, kbatt_devtype_aux);
> +
> +static struct auxiliary_driver kbatt_driver_aux = {
> +	.name = KBATT,
> +	.id_table = kbatt_devtype_aux,
> +	.probe = kbatt_probe,
> +	.remove = kbatt_remove,
> +};
> +module_auxiliary_driver(kbatt_driver_aux);
> +
> +MODULE_AUTHOR("Petar Bojanic <boja@keba.com>");
> +MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
> +MODULE_DESCRIPTION("KEBA battery monitoring controller driver");
> +MODULE_LICENSE("GPL");

