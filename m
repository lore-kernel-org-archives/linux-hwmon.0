Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8022B3B2FF8
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 09:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774862898; cv=none; b=FDDN118XMhxiHnnLIjfEXNQf4/PTpjlwGxtloT1y5yTRu8apQIQ44W712XOjcP90EKssQHIlBLPYAWHEoEPiqYX2pTsp7rEdREZP5T+N0guSANT/CqnKZ1ULYAdkgVLBZJ2+ogq3RO+Me16jhSoaz6Z+3VL1OkxW0cdmt/0Fx7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774862898; c=relaxed/simple;
	bh=A0pfCojUiGgrrf0Ej5R1kBaQcEv947GaCDZ90NppBa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kh6shpK7a1QMry5rwRpAymaxuYml0v+Co+rY1vCvqzSZ9BJCFnmo66Yze2REuCjEkF1DgObnaergK58QdR+BQPcg/IZU1zMidsOywZK6MxhGOzN7Qnz+k6E3z6whLDBNJDZnxXgkkYskyXQSKhLJjpgWkWjTOZfPzuD02rtEPyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RqYuHeQ2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RqYuHeQ2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso35986625e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 02:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774862895; x=1775467695; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3zDHIQyb3IezUESO9F09MAim9FoAsOYTRYDFkmxzVFg=;
        b=RqYuHeQ2zIlSNVIp8Y01sDKtexz5NJFxXDwwOWBCgszHinnN4Z6/AMcNkBLcWbigFn
         OXY8/eVUs/bkVcNDvMJlHzG5ZHfIIux8kCXkFXJv6CNVckuazEgO6KLX2qe3IYUHsX4c
         t8gjAvpYHbbyt2MWTK7717BHmVI9u8WhTcMDvNtN7gwhCHKEzoSpvPKa5Ra79xGJWsDg
         sPAaMwlVl6IaItM3tynUcu6m4jdFSTaWDJ9X+VW4N73b6pp2fo6oEOkdY8utKBA0gM+w
         x9wWINUCYasrsN1eyIyuy/pxjHHeZz6ACik8eHIMcNsVRucUQO1fAoHUWGSjMi5yDzAX
         BbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774862895; x=1775467695;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zDHIQyb3IezUESO9F09MAim9FoAsOYTRYDFkmxzVFg=;
        b=FlzXvnkGAMMv3CI86x5sR36kj39Wite7isZAm/GGo/n0y1McDvRWhwbcoxL/fAjj95
         RtpCypc45smE4Z30QWbaEZ27G+HpkrXygdmg6gfa+Vig3q5sBYH3Ih6rtL/U/eTjH6EL
         WW+I9lgURKs9v4MGWiX3evN2vF2bhcLoGHzwWZHHQgGurhP7zkkQvBXy3JdR8SSisGDC
         +F60E37UKJolQ7Kok3jijYrMRqN6K6O0If8VwHNVHsSE4bovCXZY/3QX5EBKeu7fV7Fm
         VELPndXHGS21TytC4VdzUpOPBGDxxZ9BD1loCSsAap4xLRrRkI1fD6ChSz3rtg+pqzn7
         yBrw==
X-Forwarded-Encrypted: i=1; AJvYcCXdW015kO6ARf5zi7GQTCzw01mOKyqgs8vdgmg6XCxjYeIKwtTb485g6kPQ4ZW9gqy2VGHiIEigoSFbGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/NbkrogkgACnNOMqnXcQJdiQZQUdCCRLOQ0NB+bALYeNZoJH
	Gkgqx84upaCHLzS3bOG/rxZ7OFELdq8otWV8rjJzr46dnde4GAdM+Hh7
X-Gm-Gg: ATEYQzzq0i1zMXFunxI5bYV94I/BiAzWg+IRpqafp+I9arQHtG5oxQpaWmSUwTMd1Qb
	Px+Vbzf73+8RvZ/PM8Vl9fk0Djr1/Bw2UvKFcViS5FKohxQjqYCiZBc2o1RndVzpWJE+gtIXl/A
	TcWPfSqHz/VGIeQpGeesltH1bpbk1WYqF3+tIQP91WPTfwKCWG+vZQe6fCZD2BEQhDmEYSknDqa
	g5ZEidFr0QurhjL7XiEBCBzkro7FuruZqceOhaCbOU0bfZ2JWlbZDMZsvfKKB5d2gp91G5lE3zu
	RhRRxvdloBnYDY8jOitSgksHy1WBx2Kz8WenSeC4UK17Mvm//1yG8qlHGSRyBw4fg1lA1RMu47u
	RPlPWelmq8B/RtRSYn5de9j/hACu2IY/za8Msh0VHmEoHR4voLf/lUiYgyFd4kbKgoRA6Rsdd/G
	PsOw4nuNpaFTZe
X-Received: by 2002:a05:600c:83c5:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-487280a25c4mr210099595e9.31.1774862894489;
        Mon, 30 Mar 2026 02:28:14 -0700 (PDT)
Received: from nsa ([45.94.208.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4873ab203e9sm74265215e9.0.2026.03.30.02.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:28:14 -0700 (PDT)
Date: Mon, 30 Mar 2026 10:28:59 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v8 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
Message-ID: <aco5L_6SZIB2DdpF@nsa>
References: <20260327-ltc4283-support-v8-0-471de255d728@analog.com>
 <20260327-ltc4283-support-v8-2-471de255d728@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327-ltc4283-support-v8-2-471de255d728@analog.com>

Hi Guenter, Regarding AI review, I think most of the points were
discussed in previous revisions, but there are two valid.

On Fri, Mar 27, 2026 at 05:26:15PM +0000, Nuno Sá wrote:
> Support the LTC4283 Hot Swap Controller. The device features programmable
> current limit with foldback and independently adjustable inrush current to
> optimize the MOSFET safe operating area (SOA). The SOA timer limits MOSFET
> temperature rise for reliable protection against overstresses.
> 
> An I2C interface and onboard ADC allow monitoring of board current,
> voltage, power, energy, and fault status.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> ---
>  Documentation/hwmon/index.rst   |    1 +
>  Documentation/hwmon/ltc4283.rst |  266 ++++++
>  MAINTAINERS                     |    1 +
>  drivers/hwmon/Kconfig           |   12 +
>  drivers/hwmon/Makefile          |    1 +
>  drivers/hwmon/ltc4283.c         | 1796 +++++++++++++++++++++++++++++++++++++++
>  6 files changed, 2077 insertions(+)
>

...

> +static int ltc4283_read_in_alarm(struct ltc4283_hwmon *st, u32 channel,
> +				 bool max_alm, long *val)
> +{
> +	if (channel == LTC4283_VPWR)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_1,
> +					  BIT(2 + max_alm), val);
> +
> +	if (channel >= LTC4283_CHAN_ADI_1 && channel <= LTC4283_CHAN_ADI_4) {
> +		u32 bit = (channel - LTC4283_CHAN_ADI_1) * 2;
> +		/*
> +		 * Lower channels go to higher bits. We also want to go +1 down
> +		 * in the min_alarm case.
> +		 */
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_2,
> +					  BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >= LTC4283_CHAN_ADIO_1 && channel <= LTC4283_CHAN_ADIO_4) {
> +		u32 bit = (channel - LTC4283_CHAN_ADIO_1) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_3,
> +					  BIT(7 - bit - !max_alm), val);
> +	}
> +
> +	if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
> +		u32 bit = (channel - LTC4283_CHAN_ADIN12) * 2;
> +
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_5,
> +					  BIT(7 - bit - !max_alm), val);
> +	}

"Will this condition handle the ADIO12 and ADIO34 differential channels?
It looks like channels 14 and 15 fall through to the default return intended
for the DRAIN channel. Since reading the alarm implicitly clears the register
bits, could reading these ADIO alarms unintentionally clear actual DRAIN
alarms? Should the upper bound be LTC4283_CHAN_ADIO34?"

Good catch and should be:

-       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIN34) {
+       if (channel >= LTC4283_CHAN_ADIN12 && channel <= LTC4283_CHAN_ADIO34) {

> +
> +	if (channel == LTC4283_CHAN_DRNS)
> +		return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4,
> +					  BIT(6 + max_alm), val);
> +
> +	return ltc4283_read_alarm(st, LTC4283_ADC_ALM_LOG_4, BIT(4 + max_alm),
> +				  val);
> +}

...

> +
> +static int ltc4283_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev, *hwmon;
> +	struct auxiliary_device *adev;
> +	struct ltc4283_hwmon *st;
> +	int ret;
> +
> +	st = devm_kzalloc(dev, sizeof(*st), GFP_KERNEL);
> +	if (!st)
> +		return -ENOMEM;
> +
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA |
> +				     I2C_FUNC_SMBUS_READ_I2C_BLOCK))
> +		return -EOPNOTSUPP;
> +
> +	st->client = client;
> +	st->map = devm_regmap_init(dev, &ltc4283_regmap_bus, client,
> +				   &ltc4283_regmap_config);
> +	if (IS_ERR(st->map))
> +		return dev_err_probe(dev, PTR_ERR(st->map),
> +				     "Failed to create regmap\n");
> +
> +	ret = ltc4283_setup(st, dev);
> +	if (ret)
> +		return ret;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "ltc4283", st,
> +						     &ltc4283_chip_info, NULL);
> +
> +	if (IS_ERR(hwmon))
> +		return PTR_ERR(hwmon);
> +
> +	ltc4283_debugfs_init(st, client);
> +
> +	if (!st->gpio_mask)
> +		return 0;
> +
> +	adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
> +	if (!adev)
> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");

"Does this allow multiple LTC4283 chips to probe successfully?
Without allocating a unique ID per I2C instance, it seems the first probed
chip takes the generic name. If a second chip is present, it might attempt
to register with the exact same name, resulting in a failure in device_add()
and aborting the probe."

Also looks valid and I suspect is one of those that a quick look will
find more "offenders". I would purpose:

-       adev = devm_auxiliary_device_create(dev, "gpio", &st->gpio_mask);
+       adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
+                                             &st->gpio_mask, client->addr);

If there's nothing else and you agree with the above, is this something
you can tweak while applying or should I spin a new version?

Thanks!
- Nuno Sá

