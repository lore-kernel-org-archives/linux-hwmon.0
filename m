Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792441505;
	b=ThI/r3o1hFTglnXNxzTgpttMY9uIknlhpTWH30lukGNbS4m/DDq59RjCTS6fUSzE7pe9
	 dBm9BVE4TzNtqGlo1dC+jQjb/W1Q1rnRyKkW5SXgxpec6RFpSb/5kW5AE4WRUh3hrqKfq
	 0vJBYbCAz91MPSEKNY5UVt7Ut03/DDWDUnycSz/r/cCm4z5r0LVRNoDII2+ZhU2dLn+LW
	 aiWLALi8INryfC9COShUbdi57GlIITsm6Ovzwt+TeQBrNKngByMLQtwnunuC+7CnBgCHQ
	 5tWWBDUP3R8ey9PF9q5BYoIbCXw7p65iBVv6qQAp1v/6Xi/IAG9l2IM8j9BDYJK6bmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=INmmuQhQR3OsQI5lw99FDEpKF0v4A1PwuES0KwTK1dw=;
	b=negnN2athJ/Tzd0MLMVw2LlbDsFCTEQkEC1EUcUQ0MEFh5NiTVMyBQvPsHNCKcq3f/r8
	 1++ePHWYoe9qS64ay8J4u7UsYF3Jlym8DByj4YgfjOSr7spGPm1pgCqGmNsqe1aWW3dyd
	 dIvyiFe6YSbTaS8uKcIX9+2EYIAjFm6/ebh1zEl+4ATzzl6FqXy/XyDUV09HNwy3Y/vU/
	 R3N+M87wKeE1aMXwp7VbUV+x2J3qPj1IpimMVgjFBaPu2grg2CvBRdvIn7w5MdIRDMPUQ
	 +PbOrEx0rDrf4hYyDFI0qMi67AODRT6bjqPz52fT3/8Xubuv0a5cU6kqZsBUPQe3aZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m5DxEs+Z;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023AC606A31B
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 20:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 023AC606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m5DxEs+Z
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5431894eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 13:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792441503; x=1793046303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=INmmuQhQR3OsQI5lw99FDEpKF0v4A1PwuES0KwTK1dw=;
        b=m5DxEs+ZbePDTgLu46jgFd5DTtLxkXczNfYtg3DnUh8AWOOROhVj5fyzxZF0wt9ucM
         IyIfxVZeXcFrdxdfD7Yw3nbgyGuinKsQz5Q+472y7l9j90rAxYgksm7HyqQufBeIpc7v
         MH5MklSKjf2L5LZOl//Hpa4mwOmKfZaMEk/PVLNHXH6f44yGX8Js3/QaidO6BEcZedn1
         BE6qYMn7C1ZiJE1dgNfVmhT4+ivaKHKP0kgnLHSHgRazEdc6XHpIUVpAYJ9uY0uYKLk4
         6DizdiUB2OPmElyuNC04Vs6rNQX3BQOzhD4DJi7CtDtyVwUpMiL5ia9vvbLyOwtYjFHf
         G46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792441503; x=1793046303;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=INmmuQhQR3OsQI5lw99FDEpKF0v4A1PwuES0KwTK1dw=;
        b=rAUDHI2BeGYil0DYG0pw/T2iIEa7xZXHYeC5FfZAJUCBTvk0kfSFheBYJnxo9B+gE1
         1ymF9E1nQuICpUXNDg8c64MH1B/wgx2NMqfqOYF61H77NJff1bxy9UKwx4sQda08G7dC
         vxHRcxU37N1QgClf7EtYLSL8sXj25Ptr3ISH0WMFfOVNqZcsp0H7hKtN6WfNhELQ8iYC
         3LX07/b4tYQobGnVmudQhJgqsFnWGqHyoi5C6ubnrAZcC+tnH0+vfqSilgzVXvNLGTPP
         Ai/nFEboLrEy9bYxv8cwGE6gGhPyVTWHMT2xOhjnIgc/pQbv9HpsXikx8wf8BEpokAfC
         s76g==
X-Forwarded-Encrypted: i=1; AKwUvByYugK/X1lRdlVtvyyi8Ec09fVxpIUViPWrWRHGNwWdl6o+FCuo2Pc7mvBSwCbAurBvOw+Xr3DSyIvSWw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIu2NTOjZtYGTncrfDV2ytXyh9QZGJNUqwDUuY7/JwuJIcDOJX2
	ruZ+lwn2wFHzWgmyaeFNtlDkYuDO6C+Y4b8iv5h53jogdyeasuGYx0rn
X-Gm-Gg: AYBFou2QD+jYsijSLQ2oPLnT4MEz29pX2h78LYmMhD2CnfOtWI54rzp3nduDHXKtmSd
	r96GrCcwlFyTM/BXPEPj0w+v20vn5qt2Z/qBu0h90exP4u75SYmfKwP8RVT5KjZkPnU6BNQcNkq
	ZWTMeNQWcKSptDx2piJGpQyQAJ2PMO4Z22Q+8BSjcM9v89qZSRAOSOrdGvMl3xtMq9mNZUcZpxS
	btxe85NqhdzLJhJMQaMOO1l5z9KyZ/99CsZntEd/YsIi5sOML6rfJTj0iCofem7y9/iU/CSwY53
	DVcXitpSGMQdj8j+WLQltnixVv7ibaiHb6Rv86UNkLocptFgWCZ2WnNUqxHhUY4xBRsKi3208tA
	9fsYL3lwo8ZcxeSqRavYyxhbvEC3Q3MWtTKAV9HcfmWOfX4A4JZ1GJdu2TrRu86FU9DIz8tsNru
	zYcM1LCwr8kAvhW2xV4Ngv5Fq1P24m9ZNqBOr1yUzIr+MRbJ/s384BrrZFwe5iXnPpsnk0Vs5KG
	ZVaFkxgAQm9xSQE3UHv+DpaMjJroTemGz7xp2bml97/TrreL4u596y1R5IRMR0Q5YUN7Q==
X-Received: by 2002:a05:7300:7a99:b0:358:f678:46b6 with SMTP id 5a478bee46e88-361a2343165mr13224340eec.22.1792441502794;
        Mon, 19 Oct 2026 13:25:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082784ec8sm32417137eec.22.2026.10.19.13.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:25:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 13:25:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/fs1412) Add TDK FS1412 driver
Message-ID: <a3ccc85b-aab6-44b4-9695-ecd78401102c@roeck-us.net>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
 <20261008-hwmon-pmbus-fs1412-v1-3-0ae7e5ee4e41@nexthop.ai>
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
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-3-0ae7e5ee4e41@nexthop.ai>

On Thu, Oct 08, 2026 at 05:56:04PM -0700, Abdurrahman Hussain wrote:
> The TDK FS1412 is a 12A uPOL regulator with PMBus telemetry for input
> voltage, output voltage and temperature, plus the matching status
> registers. It has over-current and over-temperature protection with
> programmable fault limits but no current telemetry: READ_IOUT is not in
> its command table. Its MFR_ID reads "KDT", which the driver checks
> before binding.
> 
> VOUT_MODE reads 0x98: LINEAR mode with exponent -8 and bit 7 set. The
> datasheet defines the output voltage limits relative to the output
> voltage with a resolution of 1/256, so 0x0133 against a 0.6V command is
> a 120% over-voltage limit. The PMBus core takes bits [7:5] as the mode
> and rejects the device, so the driver reports VOUT_MODE with bit 7
> cleared and converts the four VOUT limits to and from absolute voltages
> against VOUT_COMMAND.
> 
> OT_WARN_LIMIT is not in the command table either. The register answers,
> but the part has no warning threshold and reports OT_WARNING at room
> temperature, so the driver hides the register from the core and only
> the OT_FAULT_LIMIT based attributes are provided.
> 
> READ_VOUT reports the voltage at the feedback pin, so boards that set
> the output with a resistor divider scale in2_input in user space.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> ---
>  Documentation/hwmon/fs1412.rst |  87 ++++++++++++++++++++
>  Documentation/hwmon/index.rst  |   1 +
>  MAINTAINERS                    |   7 ++
>  drivers/hwmon/pmbus/Kconfig    |   9 +++
>  drivers/hwmon/pmbus/Makefile   |   1 +
>  drivers/hwmon/pmbus/fs1412.c   | 179 +++++++++++++++++++++++++++++++++++++++++
>  6 files changed, 284 insertions(+)
> 
> diff --git a/Documentation/hwmon/fs1412.rst b/Documentation/hwmon/fs1412.rst
> new file mode 100644
> index 000000000000..b9b12fcbc5d9
> --- /dev/null
> +++ b/Documentation/hwmon/fs1412.rst
> @@ -0,0 +1,87 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver fs1412
> +====================
> +
> +Supported chips:
> +
> +  * TDK FS1412
> +
> +    Prefix: 'fs1412'
> +
> +    Addresses scanned: -
> +
> +    Datasheet: https://product.tdk.com/system/files/dam/doc/product/power/switching-power/micro-pol/data_sheet/fs1412_datasheet.pdf
> +
> +Authors:
> +    Abdurrahman Hussain <abdurrahman@nexthop.ai>
> +
> +
> +Description
> +-----------
> +
> +This driver implements support for the TDK FS1412, a 12A uPOL DC/DC
> +regulator with PMBus monitoring of its input voltage, output voltage and
> +temperature. The part has over-current and over-temperature protection with
> +programmable fault limits but no current telemetry, so no current attributes
> +are provided.
> +
> +The device answers on two I2C addresses: a register interface at the I2C
> +base address (0x08 by default) and the PMBus interface at the PMBus base
> +address (0x70 by default), each plus the offset strapped on the ADDR pin.
> +This driver binds to the PMBus address.
> +
> +The driver is a client driver to the core PMBus driver.
> +Please see Documentation/hwmon/pmbus.rst for details on PMBus client drivers.
> +
> +
> +Usage Notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate the
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.rst for
> +details.
> +
> +READ_VOUT reports the voltage at the feedback (VFB) pin, not the regulated
> +output. When the output is set with an external resistor divider, scale
> +in2_input and the in2 limits by the divider ratio in user space.
> +
> +The device stores its output voltage limits relative to VOUT_COMMAND
> +(VOUT_MODE bit 7 set). The driver converts them to and from absolute
> +voltages, so the in2 limits read and write in the same units as in2_input.
> +A written limit is stored as a 1/256 fraction of VOUT_COMMAND, so it may
> +read back rounded to that resolution. The over-voltage protection itself
> +engages at one of four thresholds the device rounds the fault limit to; see
> +the datasheet.
> +
> +The part reports an over-temperature warning at room temperature and has no
> +OT_WARN_LIMIT in its command table, so temp1_max and its alarm are not
> +provided; temp1_crit comes from OT_FAULT_LIMIT.
> +
> +
> +Sysfs entries
> +-------------
> +
> +======================= ======================================================
> +in1_label		"vin"
> +in1_input		Measured input voltage
> +in1_min			Minimum input voltage
> +in1_min_alarm		Input voltage low alarm
> +in1_crit		Critical high input voltage
> +in1_crit_alarm		Input voltage critical high alarm
> +
> +in2_label		"vout1"
> +in2_input		Measured voltage at the feedback pin
> +in2_min			Minimum output voltage
> +in2_min_alarm		Output voltage low alarm
> +in2_max			Maximum output voltage
> +in2_max_alarm		Output voltage high alarm
> +in2_lcrit		Critical low output voltage
> +in2_lcrit_alarm		Output voltage critical low alarm
> +in2_crit		Critical high output voltage
> +in2_crit_alarm		Output voltage critical high alarm
> +
> +temp1_input		Measured temperature
> +temp1_crit		Critical high temperature
> +temp1_crit_alarm	Temperature critical high alarm
> +======================= ======================================================
> diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
> index 9955a525436a..625833374c94 100644
> --- a/Documentation/hwmon/index.rst
> +++ b/Documentation/hwmon/index.rst
> @@ -79,6 +79,7 @@ Hardware Monitoring Kernel Drivers
>     f71805f
>     f71882fg
>     fam15h_power
> +   fs1412
>     fsp-3y
>     ftsteutates
>     g760a
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 65e8a4b5c90b..05461a380bf7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26778,6 +26778,13 @@ W:	https://linuxtv.org
>  T:	git git://linuxtv.org/media.git
>  F:	drivers/media/i2c/tda9840*
>  
> +TDK FS1412 MICRO POL DRIVER
> +M:	Abdurrahman Hussain <abdurrahman@nexthop.ai>
> +L:	linux-hwmon@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/hwmon/fs1412.rst
> +F:	drivers/hwmon/pmbus/fs1412.c
> +
>  TEA5761 TUNER DRIVER
>  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
> diff --git a/drivers/hwmon/pmbus/Kconfig b/drivers/hwmon/pmbus/Kconfig
> index eb71a0ac044b..030ef72415fe 100644
> --- a/drivers/hwmon/pmbus/Kconfig
> +++ b/drivers/hwmon/pmbus/Kconfig
> @@ -132,6 +132,15 @@ config SENSORS_DELTA_AHE50DC_FAN
>  	  This driver can also be built as a module. If so, the module
>  	  will be called delta-ahe50dc-fan.
>  
> +config SENSORS_FS1412
> +	tristate "TDK FS1412"
> +	help
> +	  If you say yes here you get hardware monitoring support for the TDK
> +	  FS1412 uPOL regulator.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called fs1412.
> +
>  config SENSORS_FSP_3Y
>  	tristate "FSP/3Y-Power power supplies"
>  	help
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index e288fe72a437..7bbc0d02bfad 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_SENSORS_APS_379)	+= aps-379.o
>  obj-$(CONFIG_SENSORS_BEL_PFE)	+= bel-pfe.o
>  obj-$(CONFIG_SENSORS_BPA_RS600)	+= bpa-rs600.o
>  obj-$(CONFIG_SENSORS_DELTA_AHE50DC_FAN) += delta-ahe50dc-fan.o
> +obj-$(CONFIG_SENSORS_FS1412)	+= fs1412.o
>  obj-$(CONFIG_SENSORS_FSP_3Y)	+= fsp-3y.o
>  obj-$(CONFIG_SENSORS_HAC300S)	+= hac300s.o
>  obj-$(CONFIG_SENSORS_IBM_CFFPS)	+= ibm-cffps.o
> diff --git a/drivers/hwmon/pmbus/fs1412.c b/drivers/hwmon/pmbus/fs1412.c
> new file mode 100644
> index 000000000000..90a72b23967e
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/fs1412.c
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for the TDK FS1412 uPOL regulator
> + *
> + * Copyright 2026 Nexthop Systems.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/i2c.h>
> +#include <linux/math.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/pmbus.h>
> +#include <linux/string.h>
> +
> +#include "pmbus.h"
> +
> +#define FS1412_MFR_ID		"KDT"
> +#define FS1412_MFR_ID_LEN	(sizeof(FS1412_MFR_ID) - 1)
> +
> +/* VOUT_MODE: bit 7 selects relative VOUT limits, bits [4:0] the exponent. */
> +#define FS1412_VOUT_MODE_RELATIVE	BIT(7)
> +#define FS1412_VOUT_MODE_EXP_MASK	0x1f
> +#define FS1412_VOUT_EXP_SHIFT		8	/* exponent -8: 1/256 V per LSB */
> +
> +/*
> + * VOUT_MODE reads 0x98: LINEAR mode with exponent -8 and bit 7 set, which
> + * makes the VOUT limit commands relative to VOUT_COMMAND. The PMBus core
> + * treats bits [7:5] as the mode, so report the mode and exponent with bit
> + * 7 cleared and convert the relative limits in the word accessors below.
> + */
> +static int fs1412_read_byte_data(struct i2c_client *client, int page, int reg)
> +{
> +	int ret;
> +
> +	if (reg != PMBUS_VOUT_MODE)
> +		return -ENODATA;
> +
> +	ret = pmbus_read_byte_data(client, page, reg);
> +	if (ret < 0 || ret == 0xff)
> +		return ret;
> +
> +	return ret & ~FS1412_VOUT_MODE_RELATIVE;

This implementation is wrong. Support for relative mode should instead
be added to the PMBus core. Or, rather, this driver should be tested with
https://patchwork.kernel.org/project/linux-hwmon/patch/20240315151855.377627-2-lars.petter.mostad@appear.net/
in place (with appropriate fixes for that patch if necessary), and the
patches should be applied together.

Thanks,
Guenter

> +}
> +
> +static bool fs1412_vout_limit(int reg)
> +{
> +	switch (reg) {
> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> +	case PMBUS_VOUT_OV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_WARN_LIMIT:
> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/*
> + * The VOUT limits hold the limit as a fraction of VOUT_COMMAND in the same
> + * 1/256 units, so 0x0133 on a 0.6 V command is a 120% limit. Report them
> + * as absolute voltages: limit = fraction * VOUT_COMMAND.
> + */
> +static int fs1412_read_word_data(struct i2c_client *client, int page,
> +				 int phase, int reg)
> +{
> +	int rel, cmd;
> +
> +	/*
> +	 * OT_WARN_LIMIT is not in the command table. The register answers,
> +	 * but the part has no warning threshold and reports OT_WARNING at
> +	 * room temperature, so keep the core from exposing either.
> +	 */
> +	if (reg == PMBUS_OT_WARN_LIMIT)
> +		return -ENXIO;
> +	if (!fs1412_vout_limit(reg))
> +		return -ENODATA;
> +
> +	rel = pmbus_read_word_data(client, page, phase, reg);
> +	if (rel < 0)
> +		return rel;
> +
> +	cmd = pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_COMMAND);
> +	if (cmd < 0)
> +		return cmd;
> +
> +	return min_t(u32, DIV_ROUND_CLOSEST((u32)rel * cmd,
> +					     1 << FS1412_VOUT_EXP_SHIFT), 0xffff);
> +}
> +
> +static int fs1412_write_word_data(struct i2c_client *client, int page,
> +				  int reg, u16 word)
> +{
> +	int cmd;
> +
> +	if (reg == PMBUS_OT_WARN_LIMIT)
> +		return -ENXIO;
> +	if (!fs1412_vout_limit(reg))
> +		return -ENODATA;
> +
> +	cmd = pmbus_read_word_data(client, page, 0xff, PMBUS_VOUT_COMMAND);
> +	if (cmd < 0)
> +		return cmd;
> +	if (!cmd)
> +		return -EINVAL;
> +
> +	word = clamp_val(DIV_ROUND_CLOSEST(word << FS1412_VOUT_EXP_SHIFT, cmd),
> +			 0, 0xffff);
> +
> +	return pmbus_write_word_data(client, page, reg, word);
> +}
> +
> +static struct pmbus_driver_info fs1412_info = {
> +	.pages = 1,
> +	.format[PSC_VOLTAGE_IN] = linear,
> +	.format[PSC_VOLTAGE_OUT] = linear,
> +	.format[PSC_TEMPERATURE] = linear,
> +	.func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
> +		   PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +		   PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP,
> +	.read_byte_data = fs1412_read_byte_data,
> +	.read_word_data = fs1412_read_word_data,
> +	.write_word_data = fs1412_write_word_data,
> +};
> +
> +static int fs1412_probe(struct i2c_client *client)
> +{
> +	char buf[I2C_SMBUS_BLOCK_MAX + 1] = { 0 };
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	ret = i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read PMBUS_MFR_ID\n");
> +
> +	if (ret != FS1412_MFR_ID_LEN ||
> +	    strncmp(buf, FS1412_MFR_ID, FS1412_MFR_ID_LEN))
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Unsupported Manufacturer ID '%s'\n", buf);
> +
> +	/* The relative limit conversion assumes the 1/256 V exponent. */
> +	ret = i2c_smbus_read_byte_data(client, PMBUS_VOUT_MODE);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read VOUT_MODE\n");
> +	if ((ret & FS1412_VOUT_MODE_EXP_MASK) != 0x18)
> +		return dev_err_probe(dev, -ENODEV,
> +				     "Unsupported VOUT_MODE 0x%02x\n", ret);
> +
> +	return pmbus_do_probe(client, &fs1412_info);
> +}
> +
> +static const struct i2c_device_id fs1412_id[] = {
> +	{ .name = "fs1412" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, fs1412_id);
> +
> +static const struct of_device_id fs1412_of_match[] = {
> +	{ .compatible = "tdk,fs1412" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, fs1412_of_match);
> +
> +static struct i2c_driver fs1412_driver = {
> +	.driver = {
> +		.name = "fs1412",
> +		.of_match_table = fs1412_of_match,
> +	},
> +	.probe = fs1412_probe,
> +	.id_table = fs1412_id,
> +};
> +
> +module_i2c_driver(fs1412_driver);
> +
> +MODULE_AUTHOR("Abdurrahman Hussain <abdurrahman@nexthop.ai>");
> +MODULE_DESCRIPTION("PMBus driver for the TDK FS1412 uPOL regulator");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("PMBUS");
