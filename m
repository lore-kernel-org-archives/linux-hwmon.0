Return-Path: <linux-hwmon+bounces-6-linux-hwmon=archiver.kernel.org@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C3DC4167B
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:50:13 +0000 (UTC)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71DF4281874
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C8CD3D99F;
	Fri, 10 Nov 2023 17:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9D33C69F
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Nov 2023 17:47:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66CC40AEF;
	Fri, 10 Nov 2023 08:50:48 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="394111592"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="394111592"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 08:50:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="740197164"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="740197164"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 08:50:45 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC3)
	(envelope-from <andy@kernel.org>)
	id 1r1UiQ-0000000Ctty-0Atx;
	Fri, 10 Nov 2023 18:50:42 +0200
Date: Fri, 10 Nov 2023 18:50:41 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
Message-ID: <ZU5fYY81L_qSmQWq@smile.fi.intel.com>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
 <20231110151905.1659873-3-nuno.sa@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110151905.1659873-3-nuno.sa@analog.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Fri, Nov 10, 2023 at 04:18:46PM +0100, Nuno Sa wrote:
> The LTC4282 hot swap controller allows a board to be safely inserted and
> removed from a live backplane. Using one or more external N-channel pass
> transistors, board supply voltage and inrush current are ramped up at an
> adjustable rate. An I2C interface and onboard ADC allows for monitoring
> of board current, voltage, power, energy and fault status.

There are plenty of ltc42xx in the same folder and a lot of other chips.
Have you checked that none of the existing driver is not close enough and
brand new driver is indeed required? If so, add a respective paragraph
somewhere (cover letter? TBH I haven't read it, it's fine if it's already
explained there).

...

> +#define LTC4282_STATUS_MSB			0x1F

> +#define LTC4282_VSOURCE				0x3a
> +#define LTC4282_VSOURCE_LOWEST			0x3c
> +#define LTC4282_VSOURCE_HIGHEST			0x3e

You have an inconsistency in the capitalization of the hexadecimal values.

...

> +/*
> + * relaxed version of FIELD_PREP() to be used when mask is not a compile time constant
> + * u32_encode_bits() can't also be used as the compiler needs to be able to evaluate
> + * mask at compile time.
> + */
> +#define LTC4282_FIELD_PREP(m, v)	(((v) << (ffs(m) - 1)) & (m))

Can we name it accordingly as done in other places, and TBH it's a time to move
it to the header. (At least I know about two more implementations of this).

...

> +struct ltc4282_state {
> +	struct regmap *map;
> +	struct device *dev;
> +	/* Protect against multiple accesses to the device registers */
> +	struct mutex lock;
> +	struct gpio_chip gc;
> +	u64 saved_energy;
> +	long power_max;

> +	u32 gpio_map[LTC4282_GPIO_NR];

Why is this needed? The valid_mask is not enough?

> +	u32 rsense;
> +	u32 vin_mode;
> +	u16 vfs_out;
> +};

...

> +	/* GPIO_2,3 and the ALERT pin require setting the bit to 1 to pull down the line */
> +	if (!gpio->active_high)

Hmm... Why do you need a separate flag for this? Shouldn't be described or
autodetected somehow?

> +		val = !val;

...

> +	*val = DIV_ROUND_CLOSEST_ULL(be16_to_cpu(in) * (u64)fs, U16_MAX);

I'm wondering if you can do some trick to "divide" actually to 2^16 so, it will
not use division op at all?

...

> +	*val = DIV_ROUND_CLOSEST(in * fs, U8_MAX);

Ditto.

...

> +	/*
> +	 * Wait for two ADC conversions so we are sure we get one full VDD
> +	 * measurement.
> +	 */
> +	msleep(2 * LTC4282_TCONV_US / MILLI);

fsleep() ?

...

> +static int ltc4282_read_power_word(const struct ltc4282_state *st, u32 reg, long *val)
> +{
> +	u64 temp =  DECA * 40ULL * st->vfs_out * 1 << 16, temp_2;

Too many spaces.

"* BIT(16)" / "* BIT_ULL(16)" ?

...

> +		temp = DIV_ROUND_CLOSEST_ULL(power * temp, U16_MAX);
> +		*val = DIV64_U64_ROUND_CLOSEST(temp * MICRO, U16_MAX * (u64)st->rsense);

> +	*val = DIV64_U64_ROUND_CLOSEST(temp_2, st->rsense * int_pow(U16_MAX, 2));

Same Q about possible optimizations.

...

> +	temp = power * 40 * DECA * st->vfs_out * 256ULL;

BIT_ULL(8) ?

...

> +	*val = DIV64_U64_ROUND_CLOSEST(temp * MICRO, int_pow(U8_MAX, 2) * st->rsense);

Same Q about possible optimizations.

...

> +	if (check_mul_overflow(DECA * st->vfs_out * 40 * 256, energy, &temp)) {
> +		temp = DIV_ROUND_CLOSEST(DECA * st->vfs_out * 40 * 256, U16_MAX);
> +		*val = DIV_ROUND_CLOSEST_ULL(temp * energy, st->rsense);
> +		return ret;
> +	}

BIT(8) ?

...

> +	*val = DIV64_U64_ROUND_CLOSEST(temp, U16_MAX * (u64)st->rsense);

Same Q about possible optimizations.

...

> +		/*
> +		 * reset happened... let's read the new energy value that

Reset
Let's

> +		 * together with the new tick counter should give a sane average
> +		 * value. Furthermore, we save whatever value we had accumulated
> +		 * so that the next energy read will have it into account.
> +		 */

...

> +		/* give some time for accumulation... */
> +		msleep(2 * LTC4282_TCONV_US / MILLI);

fsleep() ?

...

> +	/*
> +	 * AVG = E / (Tconv * counter)
> +	 * We get energy in microJoule, hence dividing it by microSeconds gives Watts. Therefore,
> +	 * multiplying by MICRO gives us microWatts.
> +	 */

Here you used long lines, somewhere else, much shorter. Please, choose one
limit and be consistent with it.

...

> +	temp = val * int_pow(U8_MAX, 2) * st->rsense;
> +	power = DIV64_U64_ROUND_CLOSEST(temp, MICRO * DECA * 256ULL * st->vfs_out * 40);

As per above.

...

> +	if (val >= fs)
> +		in = U8_MAX;
> +	else
> +		in = DIV_ROUND_CLOSEST(val * U8_MAX, fs);

Can clamp() be used here?

...

> +	/*
> +	 * Make sure vdd is stable. From the datasheet:
> +	 * The state of the UV and OV comparators is indicated by the STATUS register
> +	 * bits 0 and 1 and must be stable for at least 50ms to qualify for turn-on.
> +	 */
> +	do {
> +		ret = regmap_read_poll_timeout(st->map, LTC4282_STATUS_LSB, reg,
> +					       reg & LTC4282_VDD_STATUS_MASK, 10000, 50000);
> +		if (!ret)
> +			continue;
> +		if (ret != -ETIMEDOUT)
> +			return dev_err_probe(st->dev, ret, "Failed regmap read\n");

I would do it a bit differently.

> +		break;

> +	} while (n_tries--);

	} while (--n_tries); ?

Altogether:

	do {
		ret = regmap_read_poll_timeout(st->map, LTC4282_STATUS_LSB, reg,
					       reg & LTC4282_VDD_STATUS_MASK, 10000, 50000);
		/* Check if we got timeout which means UV and OV are stable for 50ms */
		if (ret == -ETIMEDOUT)
			break;
		if (ret)
			return dev_err_probe(st->dev, ret, "Failed regmap read\n");
	} while (--n_tries);


...

> +	if (val > LTC4282_CLKOUT_TICK)
> +		return dev_err_probe(st->dev, -EINVAL,
> +				     "Invalid val(%u) for adi,clkout-mode\n", val);

ERANGE?

...

> +	if (rate < LTC4282_CLKIN_MIN || rate > LTC4282_CLKIN_MAX)

in_range() ?

> +		return dev_err_probe(st->dev, -EINVAL, "Invalid clkin range(%lu) [%lu %lu]\n",
> +				     rate, LTC4282_CLKIN_MIN, LTC4282_CLKIN_MAX);

...

> +	for (gpio = 0; gpio <= LTC4282_GPIO_3; gpio++) {

Is 0 also being defined?

> +		ret = device_property_read_u32(dev, ltc4282_gpio_prop[gpio], &func);
> +		if (ret)
> +			continue;
> +		if (func >= ltc4282_gpios[gpio].n_funcs)
> +			return dev_err_probe(dev, ret, "Invalid func(%u >= %u) for gpio%u\n",
> +					     func, ltc4282_gpios[gpio].n_funcs, gpio + 1);
> +		if (func == LTC4282_PIN_GPIO) {
> +			st->gpio_map[ngpios++] = gpio;
> +			if (gpio == LTC4282_GPIO_1) {
> +				/* default to input GPIO */
> +				ret = regmap_set_bits(st->map, LTC4282_GPIO_CONFIG,
> +						      LTC4282_GPIO_1_CONFIG_MASK);
> +				if (ret)
> +					return ret;
> +			}
> +
> +			continue;
> +		}

...

> +		switch (val) {
> +		case 3300000:

Hmm... Do we have MICROVOLTS_IN_VOLTS or so?

> +			st->vin_mode = LTC4282_VIN_3_3V;
> +			break;
> +		case 5000000:
> +			st->vin_mode = LTC4282_VIN_5V;
> +			break;
> +		case 12000000:
> +			st->vin_mode = LTC4282_VIN_12V;
> +			break;
> +		case 24000000:
> +			st->vin_mode = LTC4282_VIN_24V;
> +			break;
> +		default:
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Invalid val(%u) for vin-mode-microvolt\n", val);
> +		}

...

> +static SENSOR_DEVICE_ATTR(in1_crit_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_OV_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(in1_lcrit_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_UV_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(curr1_crit_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_OC_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(power1_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_POWER_BAD_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(fet_bad_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_FET_BAD_FAULT_MASK);
> +static SENSOR_DEVICE_ATTR(fet_short_fault_log, 0644, ltc4282_show_fault_log,
> +			  ltc4282_clear_fault_log, LTC4282_FET_SHORT_FAULT_MASK);

SENSOR_DEVICE_ATTR_RO() / _RW() ?

...

> +static struct attribute *ltc4282_attrs[] = {
> +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> +	&sensor_dev_attr_power1_good.dev_attr.attr,
> +	&sensor_dev_attr_fet_bad_fault.dev_attr.attr,
> +	&sensor_dev_attr_fet_short_fault.dev_attr.attr,
> +	&sensor_dev_attr_in1_crit_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_in1_lcrit_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_curr1_crit_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_power1_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_fet_bad_fault_log.dev_attr.attr,
> +	&sensor_dev_attr_fet_short_fault_log.dev_attr.attr,
> +	NULL,

No comma for the terminator line.

> +};

...

> +	msleep(3200);

Not a single letter to comment such a huge delay :-(

-- 
With Best Regards,
Andy Shevchenko



