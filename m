Received: from mx04lb.world4you.com (mx04lb.world4you.com [81.19.149.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C03610F4
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 08:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741510031; cv=none; b=Cp3qV672nrEz/vUJxZVm75b78sYe9/7FtwYIk8J7C2JRJ4KK+YdHMRQZW979Wnf1VI2W1SZslyUrka8XMw0Lpuqxc3g2EfR4p0GbHQ+bvAER6R3UduL1h9fIVgRIoX2fBxYk2dx23SrtYM2CpkoOBJyq50tTQIiG3xA/UoN+KCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741510031; c=relaxed/simple;
	bh=mmTK0YSI1Iz1B+FP2bd8NSpTEreLyNhKxixaQQx6uHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zm9BtiFSN+7ngX5mPPDV1bfuw/rqDxKiH0IU3Z9l2aNeNwDlqq+1Ab1S5mLOQx58IREEe0LE0d4HBCtbtrEv7ouv3p/QdOEsS7y/20SY55OY1gMHE2r+67AirSlcdY4TZ3pWpkUsp0GHg7GplpHYSSGuEstkoCL0PxwT1K7B0P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=wzhDYonv; arc=none smtp.client-ip=81.19.149.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="wzhDYonv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TPT/c2HTGKZlibkFpzuIuIpCaZZlbTBe6H36bzBMwfk=; b=wzhDYonvLJObuEAoVDCIHpNf5l
	t5qJTJJ0gw2N/KEvzZFGQWnjkoPVNcDReujXWcnhl8y1bEVSwE4kEWVsPDw04QIYPXB/+eTbfV4qA
	a3hYhTL47VcFNZzaoLRF7Wpo3HgA3nLQmQsSpnNdDM7SlPOcVdZSP8UfhKEHxUx8t6IU=;
Received: from [80.121.79.4] (helo=[10.0.0.160])
	by mx04lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1trBEd-0000000061C-1c8r;
	Sun, 09 Mar 2025 08:38:07 +0100
Message-ID: <f534db33-3464-4d75-ae73-c1a3a63e3c3c@engleder-embedded.com>
Date: Sun, 9 Mar 2025 08:38:06 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net,
 Gerhard Engleder <eg@keba.com>
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <f684a381-2eab-4c7b-8173-f8d8634bd237@t-8ch.de>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <f684a381-2eab-4c7b-8173-f8d8634bd237@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes

On 08.03.25 23:23, Thomas Weißschuh wrote:
> On 2025-03-08 22:23:46+0100, Gerhard Engleder wrote:
>> From: Gerhard Engleder <eg@keba.com>
>>
>> The KEBA battery monitoring controller is found in the system FPGA of
>> KEBA PLC devices. It puts a load on the coin cell battery to check the
>> state of the battery.
> 
> A hint that this will be instantiated from drivers/misc/keba/cp500.c
> would be nice.

I will add that hint.

> 
>> Signed-off-by: Gerhard Engleder <eg@keba.com>
>> ---
>>   drivers/hwmon/Kconfig  |  12 ++++
>>   drivers/hwmon/Makefile |   1 +
>>   drivers/hwmon/kbatt.c  | 159 +++++++++++++++++++++++++++++++++++++++++
> 
> hwmon drivers commonly have an entry in Documentation/hwmon/.

Will be added.

>>   3 files changed, 172 insertions(+)
>>   create mode 100644 drivers/hwmon/kbatt.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 4cbaba15d86e..ec396252cc18 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -335,6 +335,18 @@ config SENSORS_K10TEMP
>>   	  This driver can also be built as a module. If so, the module
>>   	  will be called k10temp.
>>   
>> +config SENSORS_KBATT
>> +	tristate "KEBA battery controller support"
>> +	depends on HAS_IOMEM
>> +	depends on KEBA_CP500 || COMPILE_TEST
> 
> KEBA_CP500 already has a COMPILE_TEST variant.
> Duplicating it here looks unnecessary.
> Then the HAS_IOMEM and AUXILIARY_BUS references can go away.

With COMPILE_TEST here the driver can be compile tested individually.
Is this property not worth it? But I can change it if needed.

>> +	select AUXILIARY_BUS
>> +	help
>> +	  This driver supports the battery monitoring controller found in
>> +	  KEBA system FPGA devices.
>> +
>> +	  This driver can also be built as a module. If so, the module
>> +	  will be called kbatt.
>> +
>>   config SENSORS_FAM15H_POWER
>>   	tristate "AMD Family 15h processor power"
>>   	depends on X86 && PCI && CPU_SUP_AMD
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index b7ef0f0562d3..4671a9b77b55 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -108,6 +108,7 @@ obj-$(CONFIG_SENSORS_IT87)	+= it87.o
>>   obj-$(CONFIG_SENSORS_JC42)	+= jc42.o
>>   obj-$(CONFIG_SENSORS_K8TEMP)	+= k8temp.o
>>   obj-$(CONFIG_SENSORS_K10TEMP)	+= k10temp.o
>> +obj-$(CONFIG_SENSORS_KBATT)	+= kbatt.o
>>   obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
>>   obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
>>   obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
>> diff --git a/drivers/hwmon/kbatt.c b/drivers/hwmon/kbatt.c
>> new file mode 100644
>> index 000000000000..09a622a7d36a
>> --- /dev/null
>> +++ b/drivers/hwmon/kbatt.c
>> @@ -0,0 +1,159 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) KEBA Industrial Automation Gmbh 2025
> 
> typo in "GmbH".

I will fix that.

> Normal copyright format would be:
> Copyright (C) 2025 KEBA Industrial Automation GmbH

I will check the copyright format.

>> + *
>> + * Driver for KEBA battery monitoring controller FPGA IP core
>> + */
>> +
>> +#include <linux/hwmon.h>
>> +#include <linux/io.h>
>> +#include <linux/delay.h>
>> +#include <linux/module.h>
>> +#include <linux/misc/keba.h>
> 
> #include <linux/auxiliary_bus.h>
> #include <linux/device.h>

Do I really have to include them explicitly? They are included
indirectly with linux/misc/keba.h.

> #include <linux/mutex.h>
> 
>> +
>> +#define KBATT "kbatt"
>> +
>> +#define KBATT_CONTROL_REG		0x4
>> +#define   KBATT_CONTROL_BAT_TEST	0x01
>> +
>> +#define KBATT_STATUS_REG		0x8
>> +#define   KBATT_STATUS_BAT_OK		0x01
>> +
>> +#define KBATT_MAX_UPD_INTERVAL	(5 * HZ)
>> +#define KBATT_SETTLE_TIME_MS	100
>> +
>> +struct kbatt {
>> +	struct keba_batt_auxdev *auxdev;
> 
> Not needed.

Will be fixed.

>> +	/* update lock */
>> +	struct mutex lock;
>> +	void __iomem *base;
>> +	struct device *hwmon_dev;
> 
> Not needed.

Will be fixed.

>> +
>> +	bool valid;
>> +	unsigned long last_updated; /* in jiffies */
>> +	long alarm;
> 
> bool

I choose long to match the hwmon API, hwmon_ops->read. Does it need to
be bool nevertheless?

>> +};
>> +
>> +static long kbatt_alarm(struct kbatt *kbatt)
>> +{
>> +	mutex_lock(&kbatt->lock);
>> +
>> +	if (time_after(jiffies, kbatt->last_updated + KBATT_MAX_UPD_INTERVAL) ||
>> +	    !kbatt->valid) {
> 
> kbatt->valid can be removed and instead check for
> !kbatt->last_updated || time_after().

You are right. I will rework.

>> +		/* switch load on */
>> +		iowrite8(KBATT_CONTROL_BAT_TEST,
>> +			 kbatt->base + KBATT_CONTROL_REG);
>> +
>> +		/* wait some time to let things settle */
>> +		msleep(KBATT_SETTLE_TIME_MS);
> 
> Could use the recommended fsleep():
> Documentation/timers/delay_sleep_functions.rst

Thank you for the hint! According to the documentation, I would still
choose the second option "Use `*sleep()` whenever possible", because
I want to prevent unecessary hrtimer work and interrupts.

>> +
>> +		/* check battery state */
>> +		if (ioread8(kbatt->base + KBATT_STATUS_REG) &
>> +		    KBATT_STATUS_BAT_OK)
>> +			kbatt->alarm = 0;
>> +		else
>> +			kbatt->alarm = 1;
>> +
>> +		/* switch load off */
>> +		iowrite8(0, kbatt->base + KBATT_CONTROL_REG);
>> +
>> +		kbatt->last_updated = jiffies;
>> +		kbatt->valid = true;
>> +	}
>> +
>> +	mutex_unlock(&kbatt->lock);
>> +
>> +	return kbatt->alarm;
>> +}
>> +
>> +static int kbatt_read(struct device *dev, enum hwmon_sensor_types type,
>> +		      u32 attr, int channel, long *val)
>> +{
>> +	struct kbatt *kbatt = dev_get_drvdata(dev);
>> +
>> +	if ((channel != 1) || (attr != hwmon_in_alarm))
>> +		return -EOPNOTSUPP;
> 
> This condition is never true.

I will remove that check.

>> +
>> +	*val = kbatt_alarm(kbatt);
>> +
>> +	return 0;
>> +}
>> +
>> +static umode_t kbatt_is_visible(const void *data, enum hwmon_sensor_types type,
>> +				u32 attr, int channel)
>> +{
>> +	if ((channel == 1) && (attr == hwmon_in_alarm))
>> +		return 0444;
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct hwmon_channel_info *kbatt_info[] = {
>> +	HWMON_CHANNEL_INFO(in,
>> +			   /* 0: dummy, skipped in is_visible */
> 
> Why?

For compatibility reasons, as the out of tree version of the driver did
start with index 1 and there is software which rely on that fact. But
I'm unsure if this is a valid argument for mainline code. Guenter Roeck
also commented that, so will discuss this in the other thread.

>> +			   HWMON_I_ALARM,
>> +			   /* 1: input alarm channel */
>> +			   HWMON_I_ALARM),
>> +	NULL
>> +};
>> +
>> +static const struct hwmon_ops kbatt_hwmon_ops = {
>> +	.is_visible = kbatt_is_visible,
>> +	.read = kbatt_read,
>> +};
>> +
>> +static const struct hwmon_chip_info kbatt_chip_info = {
>> +	.ops = &kbatt_hwmon_ops,
>> +	.info = kbatt_info,
>> +};
>> +
>> +static int kbatt_probe(struct auxiliary_device *auxdev,
>> +		       const struct auxiliary_device_id *id)
>> +{
>> +	struct device *dev = &auxdev->dev;
>> +	struct kbatt *kbatt;
>> +
>> +	kbatt = devm_kzalloc(dev, sizeof(struct kbatt), GFP_KERNEL);
> 
> sizeof(*kbatt)

I will change that.

>> +	if (!kbatt)
>> +		return -ENOMEM;
>> +	kbatt->auxdev = container_of(auxdev, struct keba_batt_auxdev, auxdev);
>> +	mutex_init(&kbatt->lock);
> 
> devm_mutex_init(), check the return value.

That is new to me. Seams to help with mutex debugging. I will use it.

>> +	auxiliary_set_drvdata(auxdev, kbatt);
> 
> Is this needed?

dev_get_drvdata() is used within kbatt_read().

>> +
>> +	kbatt->base = devm_ioremap_resource(dev, &kbatt->auxdev->io);
>> +	if (IS_ERR(kbatt->base))
>> +		return PTR_ERR(kbatt->base);
>> +
>> +	kbatt->hwmon_dev = devm_hwmon_device_register_with_info(dev, KBATT,
>> +							     kbatt,
>> +							     &kbatt_chip_info,
>> +							     NULL);
>> +	if (IS_ERR(kbatt->hwmon_dev))
>> +		return PTR_ERR(kbatt->hwmon_dev);
>> +
>> +	return 0;
> 
> Would be slightly shorter with 'return PTR_ERR_OR_ZERO()', but both
> variant are fine.

I will use it.

>> +}
>> +
>> +static void kbatt_remove(struct auxiliary_device *auxdev)
>> +{
>> +	auxiliary_set_drvdata(auxdev, NULL);
> 
> Unnecessary.

Then I can completely eliminate kbatt_remove(). I will remove it.

>> +}
>> +
>> +static const struct auxiliary_device_id kbatt_devtype_aux[] = {
>> +	{ .name = "keba.batt" },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(auxiliary, kbatt_devtype_aux);
>> +
>> +static struct auxiliary_driver kbatt_driver_aux = {
>> +	.name = KBATT,
>> +	.id_table = kbatt_devtype_aux,
>> +	.probe = kbatt_probe,
>> +	.remove = kbatt_remove,
>> +};
>> +module_auxiliary_driver(kbatt_driver_aux);
>> +
>> +MODULE_AUTHOR("Petar Bojanic <boja@keba.com>");
>> +MODULE_AUTHOR("Gerhard Engleder <eg@keba.com>");
>> +MODULE_DESCRIPTION("KEBA battery monitoring controller driver");
>> +MODULE_LICENSE("GPL");
>> -- 
>> 2.39.5
>>
>>

