Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396A619465;
	Mon, 13 Nov 2023 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYyq3i+4"
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88174D58;
	Mon, 13 Nov 2023 02:10:49 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so6495285a12.2;
        Mon, 13 Nov 2023 02:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699870248; x=1700475048; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YdxHVwkkDV2Ld9dGiWwyW8pBUgE/swsfDDpYaQzu++E=;
        b=aYyq3i+4ni9m/Ey4lXLg36Wa0/2QbOjT8FjF/4hFYewQf+nQzwnCCyDWR1t8/VsZei
         BRqQqcGCkH+Ac5Z5R7kiRK+i28PX3b7XJP+2XVPwwl1z0/R1uS2rn7l+dC0CbhEHX1VA
         dRfK/gOrU2IqUII1HPcD0OCVc9bStB/FOgLISXsadOuDZmf1Uzg5tBFHMLvgvO58QZQX
         uoR4thAWxS9vxOS9DfNfxFgRcDaQ3xCc5ZhsiaISr0YhbDTxfwq6tQWsLeITMyu64MhN
         vkgB7QAYo+TO+4I/PmdHbN/th+LDZxEIM4GSKxSRl/2G62EBNXci18kDVFlSWi+NEtoo
         g64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699870248; x=1700475048;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YdxHVwkkDV2Ld9dGiWwyW8pBUgE/swsfDDpYaQzu++E=;
        b=YUzdqwdV4PW2iHsLjlkoT3Oaq9d+lmay2uR31/S4yBoOXLGmpThhi1AEd5OGXMLwSv
         yNQSawQ00Hm+zjbNHHX38Rw67JpjlunqYEvRB122ECtmMqjpM26P2phabvwYxf0IiTnX
         gZ9xldTPIIluFGf2Eg2t6mrq8BY9ZPwtaqQhYq7EkVUgPxtBCll0PT4BegsZMbxO19Bm
         cte7FM2DsRl0tBVaJOkPtdNSYE2DB33F6yjOyCrRaGyMUmE0lxmaEtV16OlRPOu67lmf
         Gv+aEs8ty97mOJKv0i5fwORWTbsEvr02l0saH6AFmLWqtjzgNAOf5hey8tj1Mq13VCZM
         RUfg==
X-Gm-Message-State: AOJu0YwsunT3pt3RM8nTKGE58Mw2U96eQTWDyOsBCZyvNugTYJWKZcxt
	z1t9K+w9AZSDEuZMPUeisieaBtKaI6LLzCgYaa4=
X-Google-Smtp-Source: AGHT+IEKG/SXFWyTlUP/fjoFcfYNCl774t+JwXV0/jFvFi02fCweXz9HMlJrw9O5Pu04XS0VrrgLJA==
X-Received: by 2002:a05:6402:1016:b0:540:fde:5407 with SMTP id c22-20020a056402101600b005400fde5407mr4057996edu.34.1699870247641;
        Mon, 13 Nov 2023 02:10:47 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:361b:8f29:1cbf:5e69? (p200300f6ef1b2000361b8f291cbf5e69.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:361b:8f29:1cbf:5e69])
        by smtp.gmail.com with ESMTPSA id m20-20020a50d7d4000000b00530bc7cf377sm3531074edj.12.2023.11.13.02.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 02:10:47 -0800 (PST)
Message-ID: <581aec9c6313e3885aae8b1e12dfcc9f392716db.camel@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Andy Shevchenko <andy@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 devicetree@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Jonathan
 Corbet <corbet@lwn.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Linus Walleij
 <linus.walleij@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
 <robh+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Conor Dooley
 <conor+dt@kernel.org>
Date: Mon, 13 Nov 2023 11:13:44 +0100
In-Reply-To: <ZU5fYY81L_qSmQWq@smile.fi.intel.com>
References: <20231110151905.1659873-1-nuno.sa@analog.com>
	 <20231110151905.1659873-3-nuno.sa@analog.com>
	 <ZU5fYY81L_qSmQWq@smile.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2023-11-10 at 18:50 +0200, Andy Shevchenko wrote:
> On Fri, Nov 10, 2023 at 04:18:46PM +0100, Nuno Sa wrote:
> > The LTC4282 hot swap controller allows a board to be safely inserted an=
d
> > removed from a live backplane. Using one or more external N-channel pas=
s
> > transistors, board supply voltage and inrush current are ramped up at a=
n
> > adjustable rate. An I2C interface and onboard ADC allows for monitoring
> > of board current, voltage, power, energy and fault status.
>=20
> There are plenty of ltc42xx in the same folder and a lot of other chips.
> Have you checked that none of the existing driver is not close enough and
> brand new driver is indeed required? If so, add a respective paragraph
> somewhere (cover letter? TBH I haven't read it, it's fine if it's already
> explained there).
>=20

I can double check but not the last time I looked into those drivers
> ...
>=20
> > +#define LTC4282_STATUS_MSB			0x1F
>=20
> > +#define LTC4282_VSOURCE				0x3a
> > +#define LTC4282_VSOURCE_LOWEST			0x3c
> > +#define LTC4282_VSOURCE_HIGHEST			0x3e
>=20
> You have an inconsistency in the capitalization of the hexadecimal values=
.
>=20

right...

> ...
>=20
> > +/*
> > + * relaxed version of FIELD_PREP() to be used when mask is not a compi=
le
> > time constant
> > + * u32_encode_bits() can't also be used as the compiler needs to be ab=
le to
> > evaluate
> > + * mask at compile time.
> > + */
> > +#define LTC4282_FIELD_PREP(m, v)	(((v) << (ffs(m) - 1)) & (m))
>=20
> Can we name it accordingly as done in other places, and TBH it's a time t=
o
> move
> it to the header. (At least I know about two more implementations of this=
).
>=20

Not sure what you mean? Is there some other drivers doing it already? I'll,
anyways, wait on more feedback for the GPIO stuff because we might end up n=
ot
needing it...

> ...
>=20
> > +struct ltc4282_state {
> > +	struct regmap *map;
> > +	struct device *dev;
> > +	/* Protect against multiple accesses to the device registers */
> > +	struct mutex lock;
> > +	struct gpio_chip gc;
> > +	u64 saved_energy;
> > +	long power_max;
>=20
> > +	u32 gpio_map[LTC4282_GPIO_NR];
>=20
> Why is this needed? The valid_mask is not enough?
>=20

Hmm I just looked at the valid_mask. So, I can definitely make it work with=
 it.
The only thing I see is that we might end up wasting memory in case we are =
not
using the 4 available pins. Worst case, we allocate 3 'struct gpio_desc' th=
at
will never be used but I guess that's not a real issue... So yeah, I'll use=
 the
mask stuff.

> > +	u32 rsense;
> > +	u32 vin_mode;
> > +	u16 vfs_out;
> > +};
>=20
> ...
>=20
> > +	/* GPIO_2,3 and the ALERT pin require setting the bit to 1 to pull
> > down the line */
> > +	if (!gpio->active_high)
>=20
> Hmm... Why do you need a separate flag for this? Shouldn't be described o=
r
> autodetected somehow?

Well, if a consumer as an active high gpio, it expects to call
gpiod_set_value(..., 1) and the line to assert, right? To have that, we nee=
d to
write 0 on the device register for some of the pins.

And the same story is true for active low. gpiod_set_value(..., 0) will hav=
e the
gpiolib to automatically invert the value and we get 1 in the callback.
=20
>=20
> > +		val =3D !val;
>=20
> ...
>=20
> > +	*val =3D DIV_ROUND_CLOSEST_ULL(be16_to_cpu(in) * (u64)fs, U16_MAX);
>=20
> I'm wondering if you can do some trick to "divide" actually to 2^16 so, i=
t
> will
> not use division op at all?

Hmm, not sure if it will be obvious but you mean something like:

*val =3D (be16_to_cpu(in) * (u64)fs) >> 16;

Is this what you mean? If so, we`ll loose the "CLOSEST" handling... Not so =
sure
if we need to be "that" performant in such a code path. But Guenter can als=
o
share his opinion...

>=20
> ...
>=20
> > +	*val =3D DIV_ROUND_CLOSEST(in * fs, U8_MAX);
>=20
> Ditto.
>=20
> ...
>=20
> > +	/*
> > +	 * Wait for two ADC conversions so we are sure we get one full VDD
> > +	 * measurement.
> > +	 */
> > +	msleep(2 * LTC4282_TCONV_US / MILLI);
>=20
> fsleep() ?
>=20

Could be but this is going away anyways...

> ...
>=20
> > +static int ltc4282_read_power_word(const struct ltc4282_state *st, u32=
 reg,
> > long *val)
> > +{
> > +	u64 temp =3D=C2=A0 DECA * 40ULL * st->vfs_out * 1 << 16, temp_2;
>=20
> Too many spaces.
>=20
> "* BIT(16)" / "* BIT_ULL(16)" ?

Well, I can just place the number as in the formula. Not too keen on the BI=
T()
macros as this is not really a mask.
>=20
> ...
>=20
> > +		temp =3D DIV_ROUND_CLOSEST_ULL(power * temp, U16_MAX);
> > +		*val =3D DIV64_U64_ROUND_CLOSEST(temp * MICRO, U16_MAX *
> > (u64)st->rsense);
>=20
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp_2, st->rsense *
> > int_pow(U16_MAX, 2));
>=20
> Same Q about possible optimizations.
>=20
> ...
>=20
> > +	temp =3D power * 40 * DECA * st->vfs_out * 256ULL;
>=20
> BIT_ULL(8) ?

Same, not a mask so I would prefer the plain 256. No strong feeling though.=
..

>=20
> ...
>=20
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp * MICRO, int_pow(U8_MAX, 2) *
> > st->rsense);
>=20
> Same Q about possible optimizations.
>=20
> ...
>=20
> > +	if (check_mul_overflow(DECA * st->vfs_out * 40 * 256, energy,
> > &temp)) {
> > +		temp =3D DIV_ROUND_CLOSEST(DECA * st->vfs_out * 40 * 256,
> > U16_MAX);
> > +		*val =3D DIV_ROUND_CLOSEST_ULL(temp * energy, st->rsense);
> > +		return ret;
> > +	}
>=20
> BIT(8) ?
>=20
> ...
>=20
> > +	*val =3D DIV64_U64_ROUND_CLOSEST(temp, U16_MAX * (u64)st->rsense);
>=20
> Same Q about possible optimizations.
>=20
> ...
>=20
> > +		/*
> > +		 * reset happened... let's read the new energy value that
>=20
> Reset
> Let's
>=20
> > +		 * together with the new tick counter should give a sane
> > average
> > +		 * value. Furthermore, we save whatever value we had
> > accumulated
> > +		 * so that the next energy read will have it into account.
> > +		 */
>=20
> ...
>=20
> > +		/* give some time for accumulation... */
> > +		msleep(2 * LTC4282_TCONV_US / MILLI);
>=20
> fsleep() ?
>=20
> ...
>=20
> > +	/*
> > +	 * AVG =3D E / (Tconv * counter)
> > +	 * We get energy in microJoule, hence dividing it by microSeconds
> > gives Watts. Therefore,
> > +	 * multiplying by MICRO gives us microWatts.
> > +	 */
>=20
> Here you used long lines, somewhere else, much shorter. Please, choose on=
e
> limit and be consistent with it.
>=20

Yeah, maybe not too consistent. I'm still not sure what's the convention in
hwmon (I mention it in the cover).

> ...
>=20
> > +	temp =3D val * int_pow(U8_MAX, 2) * st->rsense;
> > +	power =3D DIV64_U64_ROUND_CLOSEST(temp, MICRO * DECA * 256ULL * st-
> > >vfs_out * 40);
>=20
> As per above.
>=20
> ...
>=20
> > +	if (val >=3D fs)
> > +		in =3D U8_MAX;
> > +	else
> > +		in =3D DIV_ROUND_CLOSEST(val * U8_MAX, fs);
>=20
> Can clamp() be used here?
>=20

Yes, I guess it can...

> ...
>=20
> > +	/*
> > +	 * Make sure vdd is stable. From the datasheet:
> > +	 * The state of the UV and OV comparators is indicated by the
> > STATUS register
> > +	 * bits 0 and 1 and must be stable for at least 50ms to qualify for
> > turn-on.
> > +	 */
> > +	do {
> > +		ret =3D regmap_read_poll_timeout(st->map, LTC4282_STATUS_LSB,
> > reg,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg &
> > LTC4282_VDD_STATUS_MASK, 10000, 50000);
> > +		if (!ret)
> > +			continue;
> > +		if (ret !=3D -ETIMEDOUT)
> > +			return dev_err_probe(st->dev, ret, "Failed regmap
> > read\n");
>=20
> I would do it a bit differently.
>=20
> > +		break;
>=20
> > +	} while (n_tries--);
>=20
> 	} while (--n_tries); ?
>=20
> Altogether:
>=20
> 	do {
> 		ret =3D regmap_read_poll_timeout(st->map, LTC4282_STATUS_LSB,
> reg,
> 					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg & LTC4282_VDD_STATUS_MASK,
> 10000, 50000);
> 		/* Check if we got timeout which means UV and OV are stable
> for 50ms */
> 		if (ret =3D=3D -ETIMEDOUT)
> 			break;
> 		if (ret)
> 			return dev_err_probe(st->dev, ret, "Failed regmap
> read\n");
> 	} while (--n_tries);
>=20
>=20

being dropped...

> ...
>=20
> > +	if (val > LTC4282_CLKOUT_TICK)
> > +		return dev_err_probe(st->dev, -EINVAL,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid val(%u) for adi,clkout-
> > mode\n", val);
>=20
> ERANGE?

Yeah, probably more appropriate.

>=20
> ...
>=20
> > +	if (rate < LTC4282_CLKIN_MIN || rate > LTC4282_CLKIN_MAX)
>=20
> in_range() ?

sure...

>=20
> > +		return dev_err_probe(st->dev, -EINVAL, "Invalid clkin
> > range(%lu) [%lu %lu]\n",
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 rate, LTC4282_CLKIN_MIN,
> > LTC4282_CLKIN_MAX);
>=20
> ...
>=20
> > +	for (gpio =3D 0; gpio <=3D LTC4282_GPIO_3; gpio++) {
>=20
> Is 0 also being defined?
>=20

Hmm, I guess ARRAY_SIZE(ltc4282_gpio_prop) is better. Not sure why I did no=
t
used it...

> > +		ret =3D device_property_read_u32(dev,
> > ltc4282_gpio_prop[gpio], &func);
> > +		if (ret)
> > +			continue;
> > +		if (func >=3D ltc4282_gpios[gpio].n_funcs)
> > +			return dev_err_probe(dev, ret, "Invalid func(%u >=3D
> > %u) for gpio%u\n",
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 func,
> > ltc4282_gpios[gpio].n_funcs, gpio + 1);
> > +		if (func =3D=3D LTC4282_PIN_GPIO) {
> > +			st->gpio_map[ngpios++] =3D gpio;
> > +			if (gpio =3D=3D LTC4282_GPIO_1) {
> > +				/* default to input GPIO */
> > +				ret =3D regmap_set_bits(st->map,
> > LTC4282_GPIO_CONFIG,
> > +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > LTC4282_GPIO_1_CONFIG_MASK);
> > +				if (ret)
> > +					return ret;
> > +			}
> > +
> > +			continue;
> > +		}
>=20
> ...
>=20
> > +		switch (val) {
> > +		case 3300000:
>=20
> Hmm... Do we have MICROVOLTS_IN_VOLTS or so?
>=20

Not sure, can look for it...

> > +			st->vin_mode =3D LTC4282_VIN_3_3V;
> > +			break;
> > +		case 5000000:
> > +			st->vin_mode =3D LTC4282_VIN_5V;
> > +			break;
> > +		case 12000000:
> > +			st->vin_mode =3D LTC4282_VIN_12V;
> > +			break;
> > +		case 24000000:
> > +			st->vin_mode =3D LTC4282_VIN_24V;
> > +			break;
> > +		default:
> > +			return dev_err_probe(dev, -EINVAL,
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 "Invalid val(%u) for vin-mode-
> > microvolt\n", val);
> > +		}
>=20
> ...
>=20
> > +static SENSOR_DEVICE_ATTR(in1_crit_fault_log, 0644, ltc4282_show_fault=
_log,
> > +			=C2=A0 ltc4282_clear_fault_log, LTC4282_OV_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(in1_lcrit_fault_log, 0644,
> > ltc4282_show_fault_log,
> > +			=C2=A0 ltc4282_clear_fault_log, LTC4282_UV_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(curr1_crit_fault_log, 0644,
> > ltc4282_show_fault_log,
> > +			=C2=A0 ltc4282_clear_fault_log, LTC4282_OC_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(power1_fault_log, 0644, ltc4282_show_fault_l=
og,
> > +			=C2=A0 ltc4282_clear_fault_log,
> > LTC4282_POWER_BAD_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(fet_bad_fault_log, 0644, ltc4282_show_fault_=
log,
> > +			=C2=A0 ltc4282_clear_fault_log,
> > LTC4282_FET_BAD_FAULT_MASK);
> > +static SENSOR_DEVICE_ATTR(fet_short_fault_log, 0644,
> > ltc4282_show_fault_log,
> > +			=C2=A0 ltc4282_clear_fault_log,
> > LTC4282_FET_SHORT_FAULT_MASK);
>=20
> SENSOR_DEVICE_ATTR_RO() / _RW() ?

will check..

>=20
> ...
>=20
> > +static struct attribute *ltc4282_attrs[] =3D {
> > +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> > +	&sensor_dev_attr_power1_good.dev_attr.attr,
> > +	&sensor_dev_attr_fet_bad_fault.dev_attr.attr,
> > +	&sensor_dev_attr_fet_short_fault.dev_attr.attr,
> > +	&sensor_dev_attr_in1_crit_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_in1_lcrit_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_curr1_crit_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_power1_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_fet_bad_fault_log.dev_attr.attr,
> > +	&sensor_dev_attr_fet_short_fault_log.dev_attr.attr,
> > +	NULL,
>=20
> No comma for the terminator line.
>=20

sure.

> > +};
>=20
> ...
>=20
> > +	msleep(3200);
>=20
> Not a single letter to comment such a huge delay :-(
>=20

Well, it's after doing a reset so it should be pretty obvious is the number
given in the DS. But I'll put a comment on it.

- Nuno S=C3=A1

