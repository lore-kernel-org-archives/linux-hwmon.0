Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0D739E199
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 14:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485612; cv=none; b=ZCJqJN6EufPqFFE1+eFaf9zlpA24f0iFS3A/py/4Mv7PCc0CQa/Zs1StnV4nNAaWmlY3zfA7FveCfn+D9MxZWnL3cXirnL+EIOMixa4H0HzlCD3hNWmPnZjZQHqnEAJADE1y1escFKDF87oW58pkuKYa5HEw2r8pSxDc+YEQw+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485612; c=relaxed/simple;
	bh=aEqdwEszh+pQ6E4raqUIGNswQCSYpT7Dqv/kK0c+aWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bU7CJW3qoEJ9F6lBudeGZX0MotVaR3YS3/6ao+RCpR3a2e9G8x8ax4mdmky9x4ZcdpVs3ZT2j9N4DEZ3vTZ942VRk5H7+Uj67o9TfwzzYfiov/lIzGSwQZl6qtet6JGCyZTsdmTJfDJFLnBagt+p++gTPTmbgVolz9+vk5VQG5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM/VUY3M; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM/VUY3M"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso1965810a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Jan 2026 06:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768485607; x=1769090407; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6sLwRZXnWih+mOyCPNae25BI7GaUFDW7tdsjLIiO/Sg=;
        b=dM/VUY3Mv8nLtOC7/44eeYWbFCbBzJGYdhPGqigxyrWSGmqSUZSEAR9nlyndptsIkk
         ViO4iEoeqtMesnSJ2jGdW8XsOnklajbzdZSH9qmMR2CaS5UW6KPOKQLG0yyMAITXalj3
         71xArbatYUyK2K62QJNmjfd+oScaT1U/sKZ5LTLqxbNZW3nCZogTuScxZhpHBIs+XF/I
         QJ6801PLBwIa8GM9qmfaoFr5boc/eApZlU4s6xxYDlIZ23ud8aZDPAgk1QBL38QDjsaD
         6gQjbXEg0StCY+E7bJsSRudpGfCfD97xmuOMXNZA2ytTUsohhoI6S1G9Iqa9O4jc6eTC
         GE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768485607; x=1769090407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sLwRZXnWih+mOyCPNae25BI7GaUFDW7tdsjLIiO/Sg=;
        b=M+JwjUSTOiQv/Yvocqe63zhQqQt83lXuZbmvl2Z8iLi4u+kh3tK50+b1t1Me5CkBZm
         +1fWF6lNthrXzYWoBQtysu+Ldky7sROByGksIo6R6CZ6cy518CuXeW2piNxPNfUbqDWv
         3nGWIZLbx4ZWK5cxmcQ46T2liK0iseXLlB5P4kjf5l+i+qwSE1FfxYsZSwszDRW8lFBP
         8eZQsmgdusu4N+DsjTlNIZGYUd78vmnKtHKJdkEedgkrfZpP7RwATtdLWKwzCmg0UMJx
         zuf747bgJegH2EiRH+Z/nyCguSPOZNOrDhIzPv5wjdJiQc5Drh//u04Djo92T3SbPI8+
         Yk/g==
X-Forwarded-Encrypted: i=1; AJvYcCX7YaOxGHsoR/yy/rYgs9YHVsT4Vs/gAk/o3zsOMVz67bxerSTKd4KMtWv8oVyZnZHcETiKE6DBaCY2hA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHo7LBc41AkLZpT029N/5H9SJZv4t0dIwC0Xpze38my7qNB+mi
	lr0LHxllFncQR03RsoNMsMMQro4w9Jjl8zIMNWxbBCclyXwJxXrKnRDq
X-Gm-Gg: AY/fxX4jrHHV9+Wb+1fICDGbQ29spFVtRgx8wW5uE+1X8awQ2UaGATmheUd/ooVYlf5
	twnVI1m9K7grMS3lQ4V6pCpGP/RUjF8KpOf70O7rOEDO5YVRmYn6IV5D5ydbZQHWnsPB/FrSwwQ
	h0kWlU8pmdFgslz14IKDlqgg9ftahYWfyMmzVl3ZMDeDvNC8b8PAFyHY0yeeuzs/s6zKb5xaheq
	7Kyly8QlF2qJRw4yzBCTeeOI8AsbVBuJmb4cQWNFmNJLSc9LCEuQERzgFgSYs4YKS6/nsLhz1et
	NcGLreVrFryjW2ArxFSjPwfhnWwfsGUbyRyDAhPdn+nFzG2tIx7wL8ajIqQ6vatm4cexwshEXLa
	4YwvAs0NXOZnzcIEcxIOlYqPVafBwcYLDs1R/uoGDdv3uKGUQmrAPa497Bv/QGwd4o/37DThc7X
	9x7i172h9tu6SUEFn8xdQ=
X-Received: by 2002:a17:907:d15:b0:b76:f090:777b with SMTP id a640c23a62f3a-b8761074528mr552256566b.22.1768485607163;
        Thu, 15 Jan 2026 06:00:07 -0800 (PST)
Received: from vamoirid-laptop ([2a04:ee41:82:7577:9faf:2056:44a:a73a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8724197145sm1064135266b.11.2026.01.15.06.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:00:06 -0800 (PST)
Date: Thu, 15 Jan 2026 15:00:03 +0100
From: Vasileios Amoiridis <vassilisamir@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
Subject: Re: [PATCH v1 2/2] hwmon: Add support for HiTRON HAC300S PSU
Message-ID: <aWjy405syjr134lR@vamoirid-laptop>
References: <20260106160353.14023-1-vassilisamir@gmail.com>
 <20260106160353.14023-3-vassilisamir@gmail.com>
 <67eb366e-1207-4e9a-9659-3482c8a9ec9b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67eb366e-1207-4e9a-9659-3482c8a9ec9b@roeck-us.net>

On Mon, Jan 12, 2026 at 07:26:49AM -0800, Guenter Roeck wrote:
> On 1/6/26 08:03, Vasileios Amoiridis wrote:
> > From: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> > 
> > Add Support for HiTRON HAC300S PSU. This is a AC/DC hot-swappable
> > CompactPCI Serial Dual output active current sharing switching power
> > supply with a 312W rating.
> > 
> > Signed-off-by: Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> > ---
> >   Documentation/hwmon/hac300s.rst |  37 ++++++++
> 
> Needs to be added to index.rst.
> 

ACK

> >   MAINTAINERS                     |   7 ++
> >   drivers/hwmon/pmbus/Kconfig     |   9 ++
> >   drivers/hwmon/pmbus/Makefile    |   1 +
> >   drivers/hwmon/pmbus/hac300s.c   | 152 ++++++++++++++++++++++++++++++++
> >   5 files changed, 206 insertions(+)
> >   create mode 100644 Documentation/hwmon/hac300s.rst
> >   create mode 100644 drivers/hwmon/pmbus/hac300s.c
> > 
> > diff --git a/Documentation/hwmon/hac300s.rst b/Documentation/hwmon/hac300s.rst
> > new file mode 100644
> > index 000000000000..573269fc81f8
> > --- /dev/null
> > +++ b/Documentation/hwmon/hac300s.rst
> > @@ -0,0 +1,37 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Kernel driver hac300s
> > +=====================
> > +
> > +Supported chips:
> > +
> > +   * HiTRON HAC300S
> > +
> > +     Prefix: 'hac300s'
> > +
> > +     Datasheet: Publicly available at HiTRON website.
> > +
> > +Author:
> > +
> > +  - Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> > +
> > +Description
> > +-----------
> > +
> > +This driver implements support for the HiTRON HAC300S PSU. It is a Universal
> 
> s/implements support/supports/
> 

ACK

> > +AC input harmonic correction AC-DC hot-swappable CompactPCI Serial Dual output
> > +(with 5V standby) 312 Watts active current sharing switching power supply.
> > +
> > +The device has an input of 90-264VAC and 2 nominal output voltaged at 12V and
> > +5V which they can supplu up to 25A and 2.5A respectively.
> > +
> > +Sysfs entries
> > +-------------
> > +
> > +======= ==========================================
> > +curr1   Output current
> > +in1     Output voltage
> > +power1  Output power
> > +temp1   Ambient temperature inside the module
> > +temp2   Internal secondary component's temperature
> > +======= ==========================================
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a0dd762f5648..feb8ec4d9b17 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11254,6 +11254,13 @@ F:	kernel/time/timer_list.c
> >   F:	kernel/time/timer_migration.*
> >   F:	tools/testing/selftests/timers/
> > +HITRON HAC300S PSU DRIVER
> > +M:	Vasileios Amoiridis <vasileios.amoiridis@cern.ch>
> > +L:	linux-hwmon@vger.kernel.org
> > +S:	Maintained
> > +F:	Documentation/hwmon/hac300s.rst
> > +F:	drivers/hwmon/pmbus/hac300s.c
> > +
> >   DELAY, SLEEP, TIMEKEEPING, TIMERS [RUST]
> >   M:	Andreas Hindborg <a.hindborg@kernel.org>
> >   R:	Boqun Feng <boqun.feng@gmail.com>
> > diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> > index f3fb94cebf1a..4c2cb51dbe3f 100644
> > --- a/drivers/hwmon/pmbus/Kconfig
> > +++ b/drivers/hwmon/pmbus/Kconfig
> > @@ -124,6 +124,15 @@ config SENSORS_FSP_3Y
> >   	  This driver can also be built as a module. If so, the module will
> >   	  be called fsp-3y.
> > +config SENSORS_HAC300S
> > +	tristate "Hitron HAC300S-D120E PSU"
> > +	help
> > +	  If you say yes here you get hardware monitoring support for the
> > +	  Hitron HAC300S-D120E Power Supply.
> > +
> > +	  This driver can also be built as a module. If so, the module will
> > +	  be called hac300s.
> > +
> >   config SENSORS_IBM_CFFPS
> >   	tristate "IBM Common Form Factor Power Supply"
> >   	depends on LEDS_CLASS
> > diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> > index 349a89b6d92e..b92309019d35 100644
> > --- a/drivers/hwmon/pmbus/Makefile
> > +++ b/drivers/hwmon/pmbus/Makefile
> > @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
> >   obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
> >   obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
> >   obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
> > +obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
> >   obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
> >   obj-$(CONFIG_SENSORS_DPS920AB)	+= dps920ab.o
> >   obj-$(CONFIG_SENSORS_INA233)	+= ina233.o
> > diff --git a/drivers/hwmon/pmbus/hac300s.c b/drivers/hwmon/pmbus/hac300s.c
> > new file mode 100644
> > index 000000000000..a1640449e5f5
> > --- /dev/null
> > +++ b/drivers/hwmon/pmbus/hac300s.c
> > @@ -0,0 +1,152 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +// SPDX-FileCopyrightText: 2024 CERN (home.cern)
> > +/*
> > + * Hardware monitoring driver for Hi-Tron HAC300S PSU.
> > + *
> > + * NOTE: The HAC300S device does not support the PMBUS_VOUT_MODE register.
> > + * On top of that, it returns the Voltage output values in Linear11 which is
> > + * not adhering to the PMBus specifications. (PMBus Specification Part II,
> > + * Section 7.1-7.3). For that reason the PMBUS_VOUT_MODE register is being faked
> > + * and returns the exponent value of the READ_VOUT register. The exponent part
> > + * of the VOUT_* registers is being cleared in order to return the mantissa to
> > + * the pmbus core.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/bits.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/init.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/pmbus.h>
> > +
> > +#include "pmbus.h"
> > +
> > +#define LINEAR11_EXPONENT_MASK GENMASK(15, 11)
> > +#define LINEAR11_MANTISSA_MASK GENMASK(10, 0)
> > +
> > +#define to_hac300s_data(x) container_of(x, struct hac300s_data, info)
> > +
> > +struct hac300s_data {
> > +	struct pmbus_driver_info info;
> > +	bool vout_linear11;
> > +	s8 exponent;
> > +};
> > +
> > +static int hac300s_read_byte_data(struct i2c_client *client, int page, int reg)
> > +{
> > +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> > +	struct hac300s_data *data = to_hac300s_data(info);
> > +
> > +	if (reg == PMBUS_VOUT_MODE && data->vout_linear11)
> > +		return data->exponent;
> > +
> > +	return pmbus_read_byte_data(client, page, reg);
> > +}
> > +
> > +static int hac300s_read_word_data(struct i2c_client *client, int page,
> > +				   int phase, int reg)
> > +{
> > +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
> > +	struct hac300s_data *data = to_hac300s_data(info);
> > +	int rv;
> > +
> > +	rv = pmbus_read_word_data(client, page, phase, reg);
> > +	if (rv < 0)
> > +		return rv;
> > +
> > +	switch (reg) {
> > +	case PMBUS_VIRT_READ_IOUT_AVG:
> > +	case PMBUS_VIRT_READ_POUT_AVG:
> > +	case PMBUS_VIRT_READ_TEMP_AVG:
> > +		return -ENXIO;
> > +	case PMBUS_VOUT_OV_WARN_LIMIT:
> > +	case PMBUS_VOUT_UV_WARN_LIMIT:
> > +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> > +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> > +	case PMBUS_MFR_VOUT_MAX:
> > +	case PMBUS_MFR_VOUT_MIN:
> > +	case PMBUS_READ_VOUT:
> > +		if (data->vout_linear11)
> > +			return FIELD_GET(LINEAR11_MANTISSA_MASK, rv);
> 
> Is it guaranteed that the exponent is always the same ? Because if not the
> conversion will have to be explicit.
> 

Yes, after a lot of testing with different values, it remained the same.

> > +		fallthrough;
> > +	default:
> > +		return rv;
> 
> This is wrong. The register should only be read by affected commands, and
> the function should return -ENODATA for the others.
> 

ACK. I hadn't understood that this was the usecase of this function.

> > +	}
> > +}
> > +
> > +#define HAC300S_SW_FUNC (PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2 | \
> > +			 PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT | \
> > +			 PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT | \
> > +			 PMBUS_HAVE_POUT | PMBUS_HAVE_STATUS_TEMP)
> > +
> Unnecessary define since it is only used once. Please fold into the declaration
> below.
> 

ACK.

> > +static struct pmbus_driver_info hac300s_info = {
> > +	.pages = 1,
> > +	.func[0] = HAC300S_SW_FUNC,
> > +	.read_byte_data = hac300s_read_byte_data,
> > +	.read_word_data = hac300s_read_word_data,
> > +	.format[PSC_VOLTAGE_OUT] = linear,
> > +};
> > +
> > +static struct pmbus_platform_data hac300s_pdata = {
> > +	.flags = PMBUS_NO_CAPABILITY,
> > +};
> > +
> > +static int hac300s_probe(struct i2c_client *client)
> > +{
> > +	struct hac300s_data *data;
> > +	int rv;
> > +
> > +	data = devm_kzalloc(&client->dev, sizeof(struct hac300s_data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	if (!i2c_check_functionality(client->adapter,
> > +				     I2C_FUNC_SMBUS_READ_BYTE_DATA |
> > +				     I2C_FUNC_SMBUS_READ_WORD_DATA))
> > +		return -ENODEV;
> > +
> > +	rv = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
> > +	if (rv < 0) {
> 
> This needs explanation. Why try to read PMBUS_VOUT_MODE if the failure is
> expected ? Are there variants of the PSU which return something useful here ?
> The note above does not explain the reason for this conditional.
> 
> If this is supposed to check if this is really the expected device,
> read and verify PMBUS_MFR_ID instead.
> 
> Thanks,
> Guenter
> 

That was just some sanity check, it can indeed be removed. 

Cheers,
Vasilis

> > +		data->vout_linear11 = true;
> > +		/* LINEAR11 format, use exponent from READ_VOUT register */
> > +		rv = i2c_smbus_read_word_data(client, PMBUS_READ_VOUT);
> > +		if (rv < 0)
> > +			return dev_err_probe(&client->dev, rv, "Failed to read vout_mode\n");
> > +
> > +		data->exponent = FIELD_GET(LINEAR11_EXPONENT_MASK, rv);
> > +	}
> > +
> > +	data->info = hac300s_info;
> > +	client->dev.platform_data = &hac300s_pdata;
> > +	return pmbus_do_probe(client, &data->info);
> > +}
> > +
> > +static const struct of_device_id hac300s_of_match[] = {
> > +	{ .compatible = "hitron,hac300s" },
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(of, hac300s_of_match);
> > +
> > +static const struct i2c_device_id hac300s_id[] = {
> > +	{"hac300s", 0},
> > +	{}
> > +};
> > +MODULE_DEVICE_TABLE(i2c, hac300s_id);
> > +
> > +static struct i2c_driver hac300s_driver = {
> > +	.driver = {
> > +		   .name = "hac300s",
> > +		   .of_match_table = hac300s_of_match,
> > +	},
> > +	.probe = hac300s_probe,
> > +	.id_table = hac300s_id,
> > +
> > +};
> > +module_i2c_driver(hac300s_driver);
> > +
> > +MODULE_AUTHOR("Vasileios Amoiridis");
> > +MODULE_DESCRIPTION("PMBus driver for Hi-Tron HAC300S PSU");
> > +MODULE_LICENSE("GPL");
> > +MODULE_IMPORT_NS("PMBUS");
> 
