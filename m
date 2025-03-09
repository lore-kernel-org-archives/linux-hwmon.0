Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8489460
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 08:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741508591; cv=none; b=FwKRTc0XLtPAvi4nVALCQJV7GnNTdMe1yyPBhi78hLM7HK2/s9/U1JwuhRHmuUgVBJiPicyuW00hlW2IppBxOLCYGXhUpxgbZSvKXUzdfFMsngJtZ9G5ukJqcXdBLsAgFJX8KLs6iW5GIW67K9SzZBQhYBsiyyJfBHwJN1cyIjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741508591; c=relaxed/simple;
	bh=kdfMC6EZG2UnmXp8PrXTG96KDUUSfMaVN4k2DmdffbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rFdmd7n/lExyOijTsUjssJFBYh6KhwkVDskZcOVcf7TXYTx6UU+zmRJ9twpDJZFfet39auedwve/NdjQe6pseHo0k7+MMiCezkQIdUhIq9KZ/X8vbmFtrHJSvRiiUZUj1DKWUfSBlYxA+wesWCAXvA9LbD0rS2gyd5fnIuLDIC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=fdj5GCZ0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="fdj5GCZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1741508582;
	bh=kdfMC6EZG2UnmXp8PrXTG96KDUUSfMaVN4k2DmdffbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fdj5GCZ0zZ8fCK08zsrslcKHfUIDoJAgNcKQZYVeF6xlOOCxq07qYMGp57czEUq3t
	 FTHw4oBFu+9tQHjIUIFLi+1PZ1THNbfqcYgM2i64Vpq9NFTi8PcUgh7h0Pe3cD5xcM
	 rTSCj1ZmopgZUrRcS2sp+bqso/IPzJ7c3ISqwGF0=
Date: Sun, 9 Mar 2025 09:23:02 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net, 
	Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
Message-ID: <054c5313-8b54-4afd-9457-26b89a4a7bab@t-8ch.de>
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <f684a381-2eab-4c7b-8173-f8d8634bd237@t-8ch.de>
 <f534db33-3464-4d75-ae73-c1a3a63e3c3c@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f534db33-3464-4d75-ae73-c1a3a63e3c3c@engleder-embedded.com>

On 2025-03-09 08:38:06+0100, Gerhard Engleder wrote:
> On 08.03.25 23:23, Thomas Weißschuh wrote:
> > On 2025-03-08 22:23:46+0100, Gerhard Engleder wrote:

<snip>

> > > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > > index 4cbaba15d86e..ec396252cc18 100644
> > > --- a/drivers/hwmon/Kconfig
> > > +++ b/drivers/hwmon/Kconfig
> > > @@ -335,6 +335,18 @@ config SENSORS_K10TEMP
> > >   	  This driver can also be built as a module. If so, the module
> > >   	  will be called k10temp.
> > > +config SENSORS_KBATT
> > > +	tristate "KEBA battery controller support"
> > > +	depends on HAS_IOMEM
> > > +	depends on KEBA_CP500 || COMPILE_TEST
> > 
> > KEBA_CP500 already has a COMPILE_TEST variant.
> > Duplicating it here looks unnecessary.
> > Then the HAS_IOMEM and AUXILIARY_BUS references can go away.
> 
> With COMPILE_TEST here the driver can be compile tested individually.
> Is this property not worth it? But I can change it if needed.

COMPILE_TEST is meant to break dependencies on concrete platforms.
KEBA_CP500 itself is not a platform dependency.
The platform dependencies of KERBA_CP500 are already broken through
COMPILE_TEST.

> > > +	select AUXILIARY_BUS
> > > +	help
> > > +	  This driver supports the battery monitoring controller found in
> > > +	  KEBA system FPGA devices.
> > > +
> > > +	  This driver can also be built as a module. If so, the module
> > > +	  will be called kbatt.
> > > +
> > >   config SENSORS_FAM15H_POWER
> > >   	tristate "AMD Family 15h processor power"
> > >   	depends on X86 && PCI && CPU_SUP_AMD

<snip>

> > > + *
> > > + * Driver for KEBA battery monitoring controller FPGA IP core
> > > + */
> > > +
> > > +#include <linux/hwmon.h>
> > > +#include <linux/io.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/module.h>
> > > +#include <linux/misc/keba.h>
> > 
> > #include <linux/auxiliary_bus.h>
> > #include <linux/device.h>
> 
> Do I really have to include them explicitly? They are included
> indirectly with linux/misc/keba.h.

You are using symbols from those headers in your own source code,
so there is a direct dependency on them.

> > #include <linux/mutex.h>

<snip>

> > > +
> > > +	bool valid;
> > > +	unsigned long last_updated; /* in jiffies */
> > > +	long alarm;
> > 
> > bool
> 
> I choose long to match the hwmon API, hwmon_ops->read. Does it need to
> be bool nevertheless?

hwmon_ops->read needs to deal with different kinds of attributes,
most of which need proper number support. Alarm is only a bool,
so the code specific to it can be simpler.

Guenter also mentioned it.

<snip>

> > > +		/* switch load on */
> > > +		iowrite8(KBATT_CONTROL_BAT_TEST,
> > > +			 kbatt->base + KBATT_CONTROL_REG);
> > > +
> > > +		/* wait some time to let things settle */
> > > +		msleep(KBATT_SETTLE_TIME_MS);
> > 
> > Could use the recommended fsleep():
> > Documentation/timers/delay_sleep_functions.rst
> 
> Thank you for the hint! According to the documentation, I would still
> choose the second option "Use `*sleep()` whenever possible", because
> I want to prevent unecessary hrtimer work and interrupts.

I read the docs as fsleep() being preferable.
The timer core should do the right thing to avoid unnecessary work.

<snip>

> > > +static const struct hwmon_channel_info *kbatt_info[] = {
> > > +	HWMON_CHANNEL_INFO(in,
> > > +			   /* 0: dummy, skipped in is_visible */
> > 
> > Why?
> 
> For compatibility reasons, as the out of tree version of the driver did
> start with index 1 and there is software which rely on that fact. But
> I'm unsure if this is a valid argument for mainline code. Guenter Roeck
> also commented that, so will discuss this in the other thread.

Ack, lets' discuss with Guenter.
However I don't think it's going to fly.

> > > +			   HWMON_I_ALARM,
> > > +			   /* 1: input alarm channel */
> > > +			   HWMON_I_ALARM),
> > > +	NULL
> > > +};

<snip>

> > > +	auxiliary_set_drvdata(auxdev, kbatt);
> > 
> > Is this needed?
> 
> dev_get_drvdata() is used within kbatt_read().

The dev_get_drvdata() in kbatt_read(), is used on the hwmon device, not
the aux device. The drvdata for that hwmon device is set in
devm_hwmon_device_register_with_info() below.

> 
> > > +
> > > +	kbatt->base = devm_ioremap_resource(dev, &kbatt->auxdev->io);
> > > +	if (IS_ERR(kbatt->base))
> > > +		return PTR_ERR(kbatt->base);
> > > +
> > > +	kbatt->hwmon_dev = devm_hwmon_device_register_with_info(dev, KBATT,
> > > +							     kbatt,
> > > +							     &kbatt_chip_info,
> > > +							     NULL);

<snip>
