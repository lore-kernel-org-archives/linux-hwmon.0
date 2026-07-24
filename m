Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11713CF05E;
	Fri, 24 Jul 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883796; cv=none; b=B5dI2noFT0Xn/CRtavfoZTsALkjLSAyOZ31DldW9jCBaUnJkTaR8ORbDL+UI+YgyboNikXWKK0O576q11wE22PMLE+xB5EpJZ5fHq1CnnfrJacQaTAeYFJcbVUaG06+efwQD9AF+7x73OqdsW3cBAnJZ3PX52gG9EkWfnq8pZC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883796; c=relaxed/simple;
	bh=4iHp5BUvxvd5rOy1kSVqeufWDBQIKDZjgGvORm0NC2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYnuwwh/tO9fTT4GiCBJZ+FaYc/6P+Mkt/5yhlL2ji1M506wb7LzPTJ7vjCkJqPuL1coTO7XwEjSMrIE5cVPlLCaJtFH1Nac0dAnCOeKLtSdiYBKbaCi6trCuYPJJ+ofa9NNVjLT2Id59CuFS4ONQH2qj4O1V6E2SbDx/bTzfDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxZIaaEn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxZIaaEn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408611F000E9;
	Fri, 24 Jul 2026 09:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883795;
	bh=9AC1/cLcxBYn/hvPpDe/+BVdWHRTTJ8ogTqb0M5K7Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZxZIaaEnw6Mqo8oi092UtXl4sxpnOwucH0+lCvG+PNEMOrX5Fyl33xIKyRnIipaoe
	 UZmtUsqOg31FCC3QSDW05CmzG5yIrRmxPGHUD4hq7+INSQH7PEyfUj69hEJdjKk/op
	 M3SOH8NDMnYycheAFAargGOGGmS7+Tpk6IbycIe002461DRZbqUotfpNzZv9XrasGY
	 51Zr9I6Npr8nO/RAZ/1sOmoif77uZrxGXsFdW57kYoO3kOfxv96woXgqX70IsvzJXE
	 jTBcGpHU/VXJbuxRQQ/j6q0f4diu1PSWM42HoJ29gS7RsdKl5eRqfI29z8y/4Nm9Tk
	 YMb4eetPPxJXA==
Date: Fri, 24 Jul 2026 11:03:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux@roeck-us.net" <linux@roeck-us.net>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sanman Pradhan <psanman@juniper.net>, 
	Georgi Vlaev <gvlaev@juniper.net>, Dhruva Devineni <ddevineni@juniper.net>, 
	Debjit Ghosh <dghosh@juniper.net>, Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>, 
	Avadhut Naik <avadhutn@juniper.net>, Santhanakrishnan Balraj <sbalraj@juniper.net>, 
	Brian Mak <makb@juniper.net>
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
Message-ID: <20260724-skink-of-unmistakable-novelty-d97d95@quoll>
References: <20260723164249.199442-1-sanman.pradhan@hpe.com>
 <20260723164249.199442-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723164249.199442-3-sanman.pradhan@hpe.com>

On Thu, Jul 23, 2026 at 04:43:59PM +0000, Pradhan, Sanman wrote:
> diff --git a/drivers/hwmon/pmbus/Makefile b/drivers/hwmon/pmbus/Makefile
> index 080d366809f3..daa4b49bc90f 100644
> --- a/drivers/hwmon/pmbus/Makefile
> +++ b/drivers/hwmon/pmbus/Makefile
> @@ -75,6 +75,7 @@ obj-$(CONFIG_SENSORS_TPS53679)	+= tps53679.o
>  obj-$(CONFIG_SENSORS_TPS546D24)	+= tps546d24.o
>  obj-$(CONFIG_SENSORS_UCD9000)	+= ucd9000.o
>  obj-$(CONFIG_SENSORS_UCD9200)	+= ucd9200.o
> +obj-$(CONFIG_SENSORS_VT7505)	+= vt7505.o
>  obj-$(CONFIG_SENSORS_XDP710)	+= xdp710.o
>  obj-$(CONFIG_SENSORS_XDP720)	+= xdp720.o
>  obj-$(CONFIG_SENSORS_XDPE122)	+= xdpe12284.o
> diff --git a/drivers/hwmon/pmbus/vt7505.c b/drivers/hwmon/pmbus/vt7505.c
> new file mode 100644
> index 000000000000..a96abf75b1aa
> --- /dev/null
> +++ b/drivers/hwmon/pmbus/vt7505.c
> @@ -0,0 +1,274 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Analog Devices MAX16545/MAX16550 and
> + * Volterra VT7505 PMBus controllers.
> + *
> + * SPDX-FileCopyrightText: Copyright Hewlett Packard Enterprise Development LP

Tag is accepted but discouraged. Use standard copyright header.

...


> +#define VT7505_MFR_PEAK_VIN		0xd1
> +#define VT7505_MFR_PEAK_IOUT		0xd2
> +#define VT7505_MFR_PEAK_PIN		0xd3
> +#define VT7505_MFR_PEAK_TEMP		0xd4
> +#define VT7505_MFR_CLEAR_PEAKS		0xd5
> +#define VT7505_MFR_PEAK_VOUT		0xfd
> +
> +#define VT7505_RLOAD_DEFAULT		4750
> +
> +enum chips { max16550, vt7505 };

You must adjust to upstream kernel style and such constants/defines are
UPPER CASE (I know there are antipatterns in existing drivers, though).

> +
> +static int vt7505_read_word_data(struct i2c_client *client, int page,
> +				 int phase, int reg)

...

> +static void vt7505_set_m(int *m, u32 rload)
> +{
> +	u64 val = (u64)*m * rload;
> +
> +	/* Make sure m fits the s32 type */
> +	*m = DIV_ROUND_CLOSEST_ULL(val, 1000);
> +}
> +
> +static int vt7505_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct pmbus_driver_info *info;
> +	enum chips chip;
> +	u32 rload;
> +	int ret;
> +
> +	chip = (enum chips)(unsigned long)i2c_get_match_data(client);

How does this exactly work for you? One of the values used in match_data
is 0, so device_get_match_data() returns 0 and you compare it against
NULL.

Using 0 as raw number passed to match data was long time discouraged
because it leads to such cases and in the future encourages bugs.

> +
> +	info = devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> +	if (!info)
> +		return -ENOMEM;
> +
> +	dev->platform_data = &vt7505_pdata;
> +
> +	/*
> +	 * The m coefficient used in the direct-format current and power
> +	 * calculations depends on RLOAD, the external current-report resistor
> +	 * connected between the ILOAD pin and ground. Use the default value if
> +	 * none is specified.
> +	 */
> +	if (of_property_read_u32(dev->of_node, "adi,rload-ohms", &rload))
> +		rload = VT7505_RLOAD_DEFAULT;
> +
> +	if (!rload)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "adi,rload-ohms must be non-zero\n");
> +
> +	info->pages = 1;
> +	info->read_word_data = vt7505_read_word_data;
> +	info->write_word_data = vt7505_write_word_data;
> +
> +	info->format[PSC_VOLTAGE_IN] = direct;
> +	info->format[PSC_VOLTAGE_OUT] = direct;
> +	info->format[PSC_CURRENT_IN] = direct;
> +	info->format[PSC_CURRENT_OUT] = direct;
> +	info->format[PSC_POWER] = direct;
> +	info->format[PSC_TEMPERATURE] = direct;
> +
> +	/*
> +	 * Direct data format coefficients from the device datasheet ("PMBus
> +	 * Equation Parameters"). The current and power m coefficients scale
> +	 * with RLOAD; vt7505_set_m() applies the 1/1000 factor below, giving
> +	 * m = 3.824 * RLOAD for current and 0.895 * RLOAD for power. The
> +	 * temperature coefficients are chip specific (see the switch below).
> +	 */
> +	info->m[PSC_VOLTAGE_IN] = 7578;
> +	info->R[PSC_VOLTAGE_IN] = -2;
> +	info->m[PSC_VOLTAGE_OUT] = 7578;
> +	info->R[PSC_VOLTAGE_OUT] = -2;
> +	info->m[PSC_CURRENT_IN] = 3824;
> +	info->b[PSC_CURRENT_IN] = -4300;
> +	info->R[PSC_CURRENT_IN] = -3;
> +	info->m[PSC_CURRENT_OUT] = 3824;
> +	info->b[PSC_CURRENT_OUT] = -4300;
> +	info->R[PSC_CURRENT_OUT] = -3;
> +	info->m[PSC_POWER] = 895;
> +	info->b[PSC_POWER] = -9100;
> +	info->R[PSC_POWER] = -2;
> +
> +	vt7505_set_m(&info->m[PSC_CURRENT_IN], rload);
> +	vt7505_set_m(&info->m[PSC_CURRENT_OUT], rload);
> +	vt7505_set_m(&info->m[PSC_POWER], rload);
> +
> +	switch (chip) {
> +	case max16550:
> +		info->m[PSC_TEMPERATURE] = 199;
> +		info->b[PSC_TEMPERATURE] = 7046;
> +		info->R[PSC_TEMPERATURE] = -2;
> +		break;
> +	case vt7505:
> +		info->m[PSC_TEMPERATURE] = 205;
> +		info->b[PSC_TEMPERATURE] = 6545;
> +		info->R[PSC_TEMPERATURE] = -2;
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +
> +	info->func[0] = PMBUS_HAVE_VIN | PMBUS_HAVE_STATUS_INPUT |
> +			PMBUS_HAVE_VOUT | PMBUS_HAVE_STATUS_VOUT |
> +			PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
> +			PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> +			PMBUS_HAVE_IIN | PMBUS_HAVE_PIN;
> +
> +	/*
> +	 * The severe OCP deglitch filter is programmable on the MAX16550 and
> +	 * the VT7505, but fixed on the MAX16545. The MAX16545 shares match data
> +	 * with the VT7505 (its fallback compatible), so identify it by its
> +	 * compatible string and skip the programming there.
> +	 */
> +	if (chip == max16550 ||
> +	    !of_device_is_compatible(dev->of_node, "adi,max16545")) {

You do not need to compare compatibles. The driver match data must
define the type.

If it does not, solve that problem instead of placing compatibles in
multiple places.

Best regards,
Krzysztof

