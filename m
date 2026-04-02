Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A391B3CF032
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 17:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775149915; cv=none; b=L1p0THEqz6fUcCScIn0cCGVLarVv+hWr27MrKeOtrJ7h/tq26kVPQAYnhV8u2Ai/meW/paXlxO/sm6QzYkKxtrUaCUQr32s9UvSddGpciFmfs0Go9KwpPDiWNAoeu0/De+qpxZSh1y6zjG3d9qILrl2SJhY1AOm4MTEK26UgdKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775149915; c=relaxed/simple;
	bh=IBuFRNBGBaBjd9eZE55+VJyYFcLcjL8kQrBse1nHfG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8/pbP1D33UG9fhKxl0TBVJuhF9PU1tGjpO7j4fNqK7brSmMv6OxzBP2Jjlw413y/9JUvpnSO30/k3QvITKlozjyqSKCQ1EBz5/8y4XAvi/5a8o/5YeOK9DUfwO53SngtvMaQRSqKT0nAtvgwc9JRlnaqC5FuTh7g0aeIm+mozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/IRgyQH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/IRgyQH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso15866605e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Apr 2026 10:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775149909; x=1775754709; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q4nHYoH4lQZS8z/1UWtS0Bd4HeYd52xdlIi7BxO3080=;
        b=E/IRgyQHts6By0MbTveh7PHS1B1sHG5b8nvjCjBNvK60cvwCZIi7jveax8fqMQYXXi
         2VnfRguCrx9Re9V1ESBLv6lSTgJoPHmMNQ8oxlSsNJlZL/f67uKbeJ86qjUzs63ocLbT
         pwKipsEQDUqWU7pacnzx+dFrDlCxkFlpKF2mOh6ju2lVa9OvM5Mbq1ZyymWXzw2tztfI
         iHjPVN8EC3hUqJvKQMuxKdocnhhwQwx3czB5CSmOAyjDYl7KiMaDTtVjgwEtOF+59PLl
         EXnrPz4viJ6jSzTALCXE3/2N76nbMagd7A7lX1cGj4YBdeklvzCyYL57WRzsTmwqaUkd
         /Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149909; x=1775754709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4nHYoH4lQZS8z/1UWtS0Bd4HeYd52xdlIi7BxO3080=;
        b=PHJ5Oq5ftPufCZMOg00LmMsEjrYHK+W1lJEI0oIUYB1sq33QeUImGVo3FSWyGY1+Nm
         PJ97If1GgWyzUy2OSN5zLfU8ONDUEiOZ5nx1WnVsEtIJSB82lP2AOIL8KgGX5VUGCTJd
         PO5grpqjWAJGFM52rGh3GUaQ7n6YsldcWOrAE8XGxTmEM0N7kyw75qCo5SHp/7RbxL70
         OY2SqOZG1tUKhptYRnvZDzX94JkCtf/nZBdXXo7DSzAtdppFh1y/ULjf9KYynOGl9yx2
         a+7E8TRlgXCpK5CNo1IPab2dI81VkvBd5FnIJq8cVYVogkV2oy02aIMfKFPevllZYaAp
         Cm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUEHsdPutuimYtO6JNywr1UggzOZdt6VTkiMIFXPlgHpxvm3vmVCKiokAeDpYJr3Jn7C2JBV/dfiIhYdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGO9HjyZyeRhbaxnS8JNlAz08Bava2obg4MO+s0blQFh9qmpwO
	NkBMP91JUv4bBTb6qNc0zHUGUU+aCBCT1yScYhJ1clkAQ5AojFLFgh2n
X-Gm-Gg: ATEYQzxoWUmTYwytyxrtPtq5MvH3oNBRsMvtEwl5Pe5d5fPMJhf+Eonq0XodjBAiJel
	3lRNA2hXLe9Q8nMJLU/Z3AeXwsiGRbAKhhO1s5lXA3uAFeOCRQt7ihZs4E9ZJBtblE+em0VpehM
	Je2qTyTbxbNEVtyTThAfNq/jwxontEY6h3JiGck70KFEpPbDqFE4tXWzWY96N0HQQjTPzO5dVLn
	uk2E1tr46gz3h+kGgeUfEedFn7OhOtJSSE+gXfGRKPjpaeJzztMxRtBwPhV31LF4AJhSD1j7inI
	5g9FI/J5Z4CeCoBaxRwfwXiBbjtb1iX0tQ1bgyxL7SaU1EzhY9XEnANkkRBCvks/SZv7cVjFV+r
	itJ3Z4Cd0yXfdv9rjy58d19F7/6lFODCUkjJY1JLm20DTGUkjyf2CbgLY+mI0eiXFq7MUFVPcZF
	MR20M6H78gd51imA==
X-Received: by 2002:a05:600c:8184:b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-48883590456mr148967405e9.14.1775149908448;
        Thu, 02 Apr 2026 10:11:48 -0700 (PDT)
Received: from nsa ([185.128.9.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488977e43absm1368775e9.28.2026.04.02.10.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 10:11:48 -0700 (PDT)
Date: Thu, 2 Apr 2026 18:12:35 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v8 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <ac6iNzw9aW6Lgziz@nsa>
References: <20260327-ltc4283-support-v8-0-471de255d728@analog.com>
 <20260327-ltc4283-support-v8-2-471de255d728@analog.com>
 <aco5L_6SZIB2DdpF@nsa>
 <e0c96f38-6742-4b86-8938-64e4e6063119@roeck-us.net>
 <acuLynb1hRFJRcEf@nsa>
 <32c4c4dc-91db-4286-82e5-1d3269c76a74@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32c4c4dc-91db-4286-82e5-1d3269c76a74@roeck-us.net>

On Tue, Mar 31, 2026 at 06:31:59AM -0700, Guenter Roeck wrote:
> On 3/31/26 02:48, Nuno Sá wrote:
> > On Mon, Mar 30, 2026 at 08:47:32AM -0700, Guenter Roeck wrote:
> > > On 3/30/26 02:28, Nuno Sá wrote:
> > > > Hi Guenter, Regarding AI review, I think most of the points were
> > > > discussed in previous revisions, but there are two valid.
> > > > 
> > > > On Fri, Mar 27, 2026 at 05:26:15PM +0000, Nuno Sá wrote:
> > > > > Support the LTC4283 Hot Swap Controller. The device features programmable
> > > > > current limit with foldback and independently adjustable inrush current to
> > > > > optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> > > > > temperature rise for reliable protection against overstresses.
> > > > > 
> > > > > An I2C interface and onboard ADC allow monitoring of board current,
> > > > > voltage, power, energy, and fault status.
> > > > > 
> > > > > Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> > > > > ---
> > > > >    Documentation/hwmon/index.rst   |    1 +
> > > > >    Documentation/hwmon/ltc4283.rst |  266 ++++++
> > > > >    MAINTAINERS                     |    1 +
> > > > >    drivers/hwmon/Kconfig           |   12 +
> > > > >    drivers/hwmon/Makefile          |    1 +
> > > > >    drivers/hwmon/ltc4283.c         | 1796 +++++++++++++++++++++++++++++++++++++++
> > > > >    6 files changed, 2077 insertions(+)
> > > > > 
> > > > 
> > > > ...
> > > > 
> > > > > +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> > > > > +				 bool max_alm, long *val)
> > > > > +{
> > > > > +	if (channel == LTC4283_VPWR)
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> > > > > +					  BIT(2 + max_alm), val);
> > > > > +
> > > > > +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_ADI_4) {
> > > > > +		u32 bit = (channel - LTC4283_CHAN_ADI_1) * 2;
> > > > > +		/*
> > > > > +		 * Lower channels go to higher bits. We also want to go +1 down
> > > > > +		 * in the min_alarm case.
> > > > > +		 */
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> > > > > +					  BIT(7 - bit - !max_alm), val);
> > > > > +	}
> > > > > +
> > > > > +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
> > > > > +		u32 bit = (channel - LTC4283_CHAN_ADIO_1) * 2;
> > > > > +
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> > > > > +					  BIT(7 - bit - !max_alm), val);
> > > > > +	}
> > > > > +
> > > > > +	if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> > > > > +		u32 bit = (channel - LTC4283_CHAN_ADIN12) * 2;
> > > > > +
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> > > > > +					  BIT(7 - bit - !max_alm), val);
> > > > > +	}
> > > > 
> > > > "Will this condition handle the ADIO12 and ADIO34 differential channels?
> > > > It looks like channels 14 and 15 fall through to the default return intended
> > > > for the DRAIN channel. Since reading the alarm implicitly clears the register
> > > > bits, could reading these ADIO alarms unintentionally clear actual DRAIN
> > > > alarms? Should the upper bound be LTC4283_CHAN_ADIO34?"
> > > > 
> > > > Good catch and should be:
> > > > 
> > > > -       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> > > > +       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIO34) {
> > > > 
> > > > > +
> > > > > +	if (channel == LTC4283_CHAN_DRNS)
> > > > > +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> > > > > +					  BIT(6 + max_alm), val);
> > > > > +
> > > > > +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
> > > > > +				  val);
> > > > > +}
> > > > 
> > > > ...
> > > > 
> > > > > +
> > > > > +static int ltc4283_probe(struct i2c_client *client)
> > > > > +{
> > > > > +	struct device *dev = &client->dev, *hwmon;
> > > > > +	struct auxiliary_device *adev;
> > > > > +	struct ltc4283_hwmon *st;
> > > > > +	int ret;
> > > > > +
> > > > > +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> > > > > +	if (!st)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	if (!i2c_check_functionality(client->adapter,
> > > > > +				     I2C_FUNC_SMBUS_BYTE_DATA |
> > > > > +				     I2C_FUNC_SMBUS_WORD_DATA |
> > > > > +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> > > > > +		return -EOPNOTSUPP;
> > > > > +
> > > > > +	st->client = client;
> > > > > +	st->map = devm_regmap_init(dev, &ltc4283_regmap_bus, client,
> > > > > +				   &ltc4283_regmap_config);
> > > > > +	if (IS_ERR(st->map))
> > > > > +		return dev_err_probe(dev, PTR_ERR(st->map),
> > > > > +				     "Failed to create regmap\n");
> > > > > +
> > > > > +	ret = ltc4283_setup(st, dev);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > > +
> > > > > +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> > > > > +						     &ltc4283_chip_info, NULL);
> > > > > +
> > > > > +	if (IS_ERR(hwmon))
> > > > > +		return PTR_ERR(hwmon);
> > > > > +
> > > > > +	ltc4283_debugfs_init(st, client);
> > > > > +
> > > > > +	if (!st->gpio_mask)
> > > > > +		return 0;
> > > > > +
> > > > > +	adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> > > > > +	if (!adev)
> > > > > +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> > > > 
> > > > "Does this allow multiple LTC4283 chips to probe successfully?
> > > > Without allocating a unique ID per I2C instance, it seems the first probed
> > > > chip takes the generic name. If a second chip is present, it might attempt
> > > > to register with the exact same name, resulting in a failure in device_add()
> > > > and aborting the probe."
> > > > 
> > > > Also looks valid and I suspect is one of those that a quick look will
> > > > find more "offenders". I would purpose:
> > > > 
> > > > -       adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> > > > +       adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
> > > > +                                             &st->gpio_mask, client->addr);
> > > > 
> > > 
> > > That would still fail if there are multiple chips at the same I2C address
> > > on multiple I2C busses. Check drivers/gpu/drm/bridge/ti-sn65dsi86.c which has
> > > the same problem.
> > 
> > I did looked at that one but totally forgot the multiple busses
> > scenario.
> > 
> > > 
> > > > If there's nothing else and you agree with the above, is this something
> > > > you can tweak while applying or should I spin a new version?
> > > > 
> > > 
> > > Please respin. Also, regarding the other concerns:
> > > 
> > >    Can BIT(8) * st->rsense wrap to zero on 32-bit architectures?
> > >    BIT(8) is a 32-bit unsigned long and st->rsense is a u32. If a user sets a
> > >    very large sense resistor value via the device tree, the multiplication could
> > >    wrap to 0, causing a division-by-zero kernel panic. Should the divisor use
> > >    BIT_ULL(8)?
> > > 
> > > Unless I am missing something, this _can_ overflow. Try to provide a sense
> > > resistor value of 1677721600. Yes, it is unreasonable to specify such large
> > > rsense values, but why not just limit it such that it does not overflow ?
> > 
> > Yes, that's pretty much my reasoning (regarding the unreasonable
> > rsense). I could just make BIT_ULL() and be done with it. I can also
> > also cap rsense to a max value but i'm not 100% what that value would
> > be. Maybe 1 ohm is already more than reasonable. I can also ask internally. Any
> > preference on this one?
> > 
> 
> I'd suggest to reject large (unreasonable) values. In this case, rejecting rsense
> values >= 1677721600 should solve the problem.
> 
> > > 
> > > Also, for the overflow concerns, if you are sure they can not happen, I'll
> > > really need to write the unit test code to make sure that this is indeed
> > > the case.
> > > 
> > 
> > Hmm, for the val * MILLI case, well it should not happen but given it
> > depends on user input, better if I clamp it before passing the
> > value to ltc4283_write_in_byte(). Yes, we clamp again inside the
> > write_bytes() API but not a big deal.
> > 
> > For the st->power_max is again one of those cases where the values would
> > not make sense (I think - the combination of vsense_max and rsense). Just looking
> > at the code, it can overflow but this one I'm not really sure how we could handle it.
> > Maybe clamp power_max to U8_MAX and have a warning message in ltc4283_read_power_byte() if
> > we overflow long in which case we need a power64 attr?
> > 
> > But even clamping does not make much sense here. The power limit register
> > is 8 bits, so if our design (rsense + vsense_max) overflows that,
> > there's nothing we can do other that erroring out.
> > 
> 
> Again, why not just reject unreasonable values such that calculations
> can not overflow ?
> 
> In other drivers, the common approach is to reject unreeasonable values if
> provided through devicetree and to clamp them if provided through sysfs.
> I don't see why that would not work here.

Hi Guenter,

Just FYI, I intended to re-spin today but then I started to double check
the st->power_max logic. If I did not messed up 14.5uOhm is the minimum rsense
we can take so that we don't overflow long on 32bits systems. I'm not sure but
I think it's plausible to have values lower than that. So, bottom line, I
asked internally to some HW folks, who definitely know these systems
better than I do, about that 14,5 min value. I'm waiting for feedback
but it might be that we end up needing power64 attrs as you suggested
some revisions ago.

- Nuno Sá

> 
> Thanks,
> Guenter
> 
