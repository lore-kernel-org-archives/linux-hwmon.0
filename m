Received: from mx08lb.world4you.com (mx08lb.world4you.com [81.19.149.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF641B4151
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 10:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.149.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741517191; cv=none; b=BMNuQ2zYi+SzkMYsGrYP3d6hFtVsAv2u6crUQ5Tf7yKi7zRKHBxKyGeK/YDf8qCXIIiLufMk0Xh7DyQWKML5jXq4HY7Gr1RLmEQbXN8piSO8Jkiu9usN8jif+Q1cMeLidnjf2Rw0Ysbf66NpUhbTYvN6e38nm7C3Asrp5tbZSwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741517191; c=relaxed/simple;
	bh=kewlmXRAGz22DfYgSy+xebVyAUOxIwnZB5WJ0imyMdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KOXyHGeT9fP2HBdn203H70DMHwiH/Yj+lES67v6Euc++WdOjG7HH4wNr2ALrBubd150RWoHTu4GNyNbJTV7lDtivH3ElRgXSorcryTYWiMNdKMTAg7qNk2aSXbPizxC013+r75BDBLhkCZwSxwHJbNEPrzRoA8Som9f2EdSrqXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com; spf=pass smtp.mailfrom=engleder-embedded.com; dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b=kXoVrpXj; arc=none smtp.client-ip=81.19.149.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=engleder-embedded.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=engleder-embedded.com header.i=@engleder-embedded.com header.b="kXoVrpXj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=engleder-embedded.com; s=dkim11; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jR5tPi8vc0nZIcoyHA9GBCAv8Ix0vi7yXjZa1yIhYqQ=; b=kXoVrpXjGzJ5ARVe0yKR7apWfY
	OH7CLoZln+PD8tzz9WY7jXCcOjGrgcFYMi/GIj8wy2OG+CTlYgwC8vuvBKc4Fq7Um4XwfSa8tdvb/
	RLKVVS6st7WzEvpkFDZ1HIkxHHVmw8GPVS3lC5Fo2bnmBXgTTKKQ4vNYRz7KHy77KLVI=;
Received: from [80.121.79.4] (helo=[10.0.0.160])
	by mx08lb.world4you.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <gerhard@engleder-embedded.com>)
	id 1trCm6-0000000074Y-1UTN;
	Sun, 09 Mar 2025 10:16:46 +0100
Message-ID: <f65dd656-2195-4686-b2e7-bdd5df47ede5@engleder-embedded.com>
Date: Sun, 9 Mar 2025 10:16:45 +0100
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
 <f534db33-3464-4d75-ae73-c1a3a63e3c3c@engleder-embedded.com>
 <054c5313-8b54-4afd-9457-26b89a4a7bab@t-8ch.de>
Content-Language: en-US
From: Gerhard Engleder <gerhard@engleder-embedded.com>
In-Reply-To: <054c5313-8b54-4afd-9457-26b89a4a7bab@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AV-Do-Run: Yes

On 09.03.25 09:23, Thomas Weißschuh wrote:
> On 2025-03-09 08:38:06+0100, Gerhard Engleder wrote:
>> On 08.03.25 23:23, Thomas Weißschuh wrote:
>>> On 2025-03-08 22:23:46+0100, Gerhard Engleder wrote:
> 
> <snip>
> 
>>>> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
>>>> index 4cbaba15d86e..ec396252cc18 100644
>>>> --- a/drivers/hwmon/Kconfig
>>>> +++ b/drivers/hwmon/Kconfig
>>>> @@ -335,6 +335,18 @@ config SENSORS_K10TEMP
>>>>    	  This driver can also be built as a module. If so, the module
>>>>    	  will be called k10temp.
>>>> +config SENSORS_KBATT
>>>> +	tristate "KEBA battery controller support"
>>>> +	depends on HAS_IOMEM
>>>> +	depends on KEBA_CP500 || COMPILE_TEST
>>>
>>> KEBA_CP500 already has a COMPILE_TEST variant.
>>> Duplicating it here looks unnecessary.
>>> Then the HAS_IOMEM and AUXILIARY_BUS references can go away.
>>
>> With COMPILE_TEST here the driver can be compile tested individually.
>> Is this property not worth it? But I can change it if needed.
> 
> COMPILE_TEST is meant to break dependencies on concrete platforms.
> KEBA_CP500 itself is not a platform dependency.
> The platform dependencies of KERBA_CP500 are already broken through
> COMPILE_TEST.

Ok, I will change it.

>>>> + *
>>>> + * Driver for KEBA battery monitoring controller FPGA IP core
>>>> + */
>>>> +
>>>> +#include <linux/hwmon.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/misc/keba.h>
>>>
>>> #include <linux/auxiliary_bus.h>
>>> #include <linux/device.h>
>>
>> Do I really have to include them explicitly? They are included
>> indirectly with linux/misc/keba.h.
> 
> You are using symbols from those headers in your own source code,
> so there is a direct dependency on them.

I will include them.

>>>> +
>>>> +	bool valid;
>>>> +	unsigned long last_updated; /* in jiffies */
>>>> +	long alarm;
>>>
>>> bool
>>
>> I choose long to match the hwmon API, hwmon_ops->read. Does it need to
>> be bool nevertheless?
> 
> hwmon_ops->read needs to deal with different kinds of attributes,
> most of which need proper number support. Alarm is only a bool,
> so the code specific to it can be simpler.
> 
> Guenter also mentioned it.

I will switch to bool.

> <snip>
> 
>>>> +		/* switch load on */
>>>> +		iowrite8(KBATT_CONTROL_BAT_TEST,
>>>> +			 kbatt->base + KBATT_CONTROL_REG);
>>>> +
>>>> +		/* wait some time to let things settle */
>>>> +		msleep(KBATT_SETTLE_TIME_MS);
>>>
>>> Could use the recommended fsleep():
>>> Documentation/timers/delay_sleep_functions.rst
>>
>> Thank you for the hint! According to the documentation, I would still
>> choose the second option "Use `*sleep()` whenever possible", because
>> I want to prevent unecessary hrtimer work and interrupts.
> 
> I read the docs as fsleep() being preferable.
> The timer core should do the right thing to avoid unnecessary work.

I read "Use `fsleep()` whenever _unsure_" and I'm sure that msleep() is
sufficient and I don't need hrtimer. But in this case fsleep() will end
up in msleep() anyway. I will switch to fsleep().

(...)

>>>> +	auxiliary_set_drvdata(auxdev, kbatt);
>>>
>>> Is this needed?
>>
>> dev_get_drvdata() is used within kbatt_read().
> 
> The dev_get_drvdata() in kbatt_read(), is used on the hwmon device, not
> the aux device. The drvdata for that hwmon device is set in
> devm_hwmon_device_register_with_info() below.

I will remove it.


Thank you for your detailed review! Will make the code much simpler.

Gerhard
