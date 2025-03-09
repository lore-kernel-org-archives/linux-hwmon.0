Received: from mx11lb.world4you.com (mx11lb.world4you.com [81.19.149.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56C9C2FD
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 08:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741507441; cv=none; b=HjBqCpATCidClp3TAsXxyRaSsh8W41Zbd5pJ+cZIoefhi8YNN/YsANe1rC2dtNAU1Gx1ZLA0ankDs2rHR0hwEvpZGB7RXmahSLG7Nprm44o95fbajyUNe/0BMmhgaOMGV5SicXJXHuycCezRPyXnxRC68VOKOzC8SlJsCasgmOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741507441; c=relaxed/simple;
	bh=+Z5VtvC19wBmv3Ea/GA1Uc+tUnU3WYIp1ipybgXFRBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bg8I/L2VWfYV5LC5WhL8DwrrEajAOg/+eJYU9Fwdr5BBYLRej9c5A/+wCcqfn7cJZTxwxxDVL9STPhzuA66QsMiT7hTjjceklNr0JH/sIhv6rk2BGmXssfVCW2+0SMJQA6fhOaaVhX5+sfdbYZ9kZK4U+xjetrn6/cshdwyF820=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=p8s7CkkJ; arc=none smtp.client-ip=81.19.149.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="p8s7CkkJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yszakLu5sr5XUFe3Z0Yo3zyKU79GX0zl3UY3+CDS3ZQ=; b=p8s7CkkJdMHyzmhHwCqF8d/pyC
	t50AFlkCMCcu4huuVp43CqOecg8r9QWawe+TIInwN8auHw61Ovslswtib/6V45cAydNvGjGJtfxQv
	tJiDYjgm/Njks47owlYZDm7y5m/ayX3QzbgcFBD31YcerluICpZrnzOD3kpqtiFZU6f0=;
Received: from [80.121.79.4] (helo=[10.0.0.160])
	by mx11lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1trBdX-000000003ET-3gc4;
	Sun, 09 Mar 2025 09:03:52 +0100
Message-ID: <aefd126d-2041-4355-b685-7aa5ebf6ff13@engleder-embedded.com>
Date: Sun, 9 Mar 2025 09:03:50 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, Gerhard Engleder <eg@keba.com>,
 linux-hwmon@vger.kernel.org
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <54a58308-e559-4007-a751-2d8a8fef29bb@roeck-us.net>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <54a58308-e559-4007-a751-2d8a8fef29bb@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes

On 08.03.25 23:32, Guenter Roeck wrote:
> On 3/8/25 13:23, Gerhard Engleder wrote:
>> From: Gerhard Engleder <eg@keba.com>
>>
>> The KEBA battery monitoring controller is found in the system FPGA of
>> KEBA PLC devices. It puts a load on the coin cell battery to check the
>> state of the battery.
>>
>> Signed-off-by: Gerhard Engleder <eg@keba.com>
> 
> Looking into the keba code, that is kind of piece by piece approach.
> I see a reference to fans in drivers/misc/keba/cp500.c, so I guess I'll see
> a fan controller driver at some point in the future. I do not support
> the idea of having multiple drivers for the hardware monitoring
> functionality of a single device.

Yes, the fan controller will follow. The cp500 driver supports multiple
devices. All of them have the battery controller, but only some of them
have the fan controller. Fanless devices don't have a fan controller in
the FPGA. There are also devices with two fan controllers.

The battery controller and the fan controller are separate IP cores with
its own 4k address range (also I2C, SPI, ...). So I see them as separate
devices. There is also no guarantee if the address range of both
controllers is next to each other or not.

Does that help you to see the battery controller and the fan controller
as separate devices?

> Either case, the attribute needs to be documented.

You mean the documentation Documentation/hwmon/, which Thomas Weißschuh
also mentioned? I will add it.

> Some more technical comments inline.
> 
> Guenter
> 
>> ---
>>   drivers/hwmon/Kconfig  |  12 ++++
>>   drivers/hwmon/Makefile |   1 +
>>   drivers/hwmon/kbatt.c  | 159 +++++++++++++++++++++++++++++++++++++++++
>>   3 files changed, 172 insertions(+)
>>   create mode 100644 drivers/hwmon/kbatt.c
>>
>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>> index 4cbaba15d86e..ec396252cc18 100644
>> --- a/drivers/hwmon/Kconfig
>> +++ b/drivers/hwmon/Kconfig
>> @@ -335,6 +335,18 @@ config SENSORS_K10TEMP
>>         This driver can also be built as a module. If so, the module
>>         will be called k10temp.
>> +config SENSORS_KBATT
>> +    tristate "KEBA battery controller support"
>> +    depends on HAS_IOMEM
>> +    depends on KEBA_CP500 || COMPILE_TEST
>> +    select AUXILIARY_BUS
>> +    help
>> +      This driver supports the battery monitoring controller found in
>> +      KEBA system FPGA devices.
>> +
>> +      This driver can also be built as a module. If so, the module
>> +      will be called kbatt.
>> +
>>   config SENSORS_FAM15H_POWER
>>       tristate "AMD Family 15h processor power"
>>       depends on X86 && PCI && CPU_SUP_AMD
>> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
>> index b7ef0f0562d3..4671a9b77b55 100644
>> --- a/drivers/hwmon/Makefile
>> +++ b/drivers/hwmon/Makefile
>> @@ -108,6 +108,7 @@ obj-$(CONFIG_SENSORS_IT87)    += it87.o
>>   obj-$(CONFIG_SENSORS_JC42)    += jc42.o
>>   obj-$(CONFIG_SENSORS_K8TEMP)    += k8temp.o
>>   obj-$(CONFIG_SENSORS_K10TEMP)    += k10temp.o
>> +obj-$(CONFIG_SENSORS_KBATT)    += kbatt.o
>>   obj-$(CONFIG_SENSORS_LAN966X)    += lan966x-hwmon.o
>>   obj-$(CONFIG_SENSORS_LENOVO_EC)    += lenovo-ec-sensors.o
>>   obj-$(CONFIG_SENSORS_LINEAGE)    += lineage-pem.o
>> diff --git a/drivers/hwmon/kbatt.c b/drivers/hwmon/kbatt.c
>> new file mode 100644
>> index 000000000000..09a622a7d36a
>> --- /dev/null
>> +++ b/drivers/hwmon/kbatt.c
>> @@ -0,0 +1,159 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) KEBA Industrial Automation Gmbh 2025
>> + *
>> + * Driver for KEBA battery monitoring controller FPGA IP core
>> + */
>> +
>> +#include <linux/hwmon.h>
>> +#include <linux/io.h>
>> +#include <linux/delay.h>
>> +#include <linux/module.h>
>> +#include <linux/misc/keba.h>
>> +
>> +#define KBATT "kbatt"
>> +
>> +#define KBATT_CONTROL_REG        0x4
>> +#define   KBATT_CONTROL_BAT_TEST    0x01
>> +
>> +#define KBATT_STATUS_REG        0x8
>> +#define   KBATT_STATUS_BAT_OK        0x01
>> +
>> +#define KBATT_MAX_UPD_INTERVAL    (5 * HZ)
>> +#define KBATT_SETTLE_TIME_MS    100
>> +
>> +struct kbatt {
>> +    struct keba_batt_auxdev *auxdev;
>> +    /* update lock */
>> +    struct mutex lock;
>> +    void __iomem *base;
>> +    struct device *hwmon_dev;
>> +
>> +    bool valid;
>> +    unsigned long last_updated; /* in jiffies */
>> +    long alarm;
> 
> bool

I will change it to bool.

>> +};
>> +
>> +static long kbatt_alarm(struct kbatt *kbatt)
>> +{
>> +    mutex_lock(&kbatt->lock);
>> +
>> +    if (time_after(jiffies, kbatt->last_updated + 
>> KBATT_MAX_UPD_INTERVAL) ||
>> +        !kbatt->valid) {
>> +        /* switch load on */
>> +        iowrite8(KBATT_CONTROL_BAT_TEST,
>> +             kbatt->base + KBATT_CONTROL_REG);
>> +
>> +        /* wait some time to let things settle */
>> +        msleep(KBATT_SETTLE_TIME_MS);
>> +
>> +        /* check battery state */
>> +        if (ioread8(kbatt->base + KBATT_STATUS_REG) &
>> +            KBATT_STATUS_BAT_OK)
>> +            kbatt->alarm = 0;
>> +        else
>> +            kbatt->alarm = 1;
>> +
>> +        /* switch load off */
>> +        iowrite8(0, kbatt->base + KBATT_CONTROL_REG);
>> +
>> +        kbatt->last_updated = jiffies;
>> +        kbatt->valid = true;
>> +    }
>> +
>> +    mutex_unlock(&kbatt->lock);
>> +
>> +    return kbatt->alarm;
>> +}
>> +
>> +static int kbatt_read(struct device *dev, enum hwmon_sensor_types type,
>> +              u32 attr, int channel, long *val)
>> +{
>> +    struct kbatt *kbatt = dev_get_drvdata(dev);
>> +
>> +    if ((channel != 1) || (attr != hwmon_in_alarm))
> 
> Various unnecessary ( ) here and below.

I will clean it up here and check the whole code for that.

>> +        return -EOPNOTSUPP;
>> +
>> +    *val = kbatt_alarm(kbatt);
>> +
>> +    return 0;
>> +}
>> +
>> +static umode_t kbatt_is_visible(const void *data, enum 
>> hwmon_sensor_types type,
>> +                u32 attr, int channel)
>> +{
>> +    if ((channel == 1) && (attr == hwmon_in_alarm))
>> +        return 0444;
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct hwmon_channel_info *kbatt_info[] = {
>> +    HWMON_CHANNEL_INFO(in,
>> +               /* 0: dummy, skipped in is_visible */
>> +               HWMON_I_ALARM,
>> +               /* 1: input alarm channel */
>> +               HWMON_I_ALARM),
> 
> Not acceptable. The first voltage channel is channel 0, not 1.

I did that for compatibility reasons, as the out of tree version of the
driver did start with index 1 and there is software which rely on that
fact. I saw a similar dummy in ina3221.c, so I thought this is ok.

Usually out of tree code is no argument. So if it must start with 0,
then I will change it.


Thank you for the review!

Gerhard
