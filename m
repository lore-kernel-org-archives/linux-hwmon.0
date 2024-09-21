Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E5316F0E8
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Sep 2024 16:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726937381; cv=none; b=Oz4dQD4F76r9JM1lcoIIeDr4AcyXR/5YqRcMCCwWCe24mxqjR8BWBsS9byExwJmtkUMdjUnyf2YDU1mclYO85dioaD8rmAhX7vDnrmk91V4GlJUtx7NLh2SXE8HUq1QOnbvYXp7/Gd5MWFiI+5X8EYnBycLD1jKDlHRki0rD/PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726937381; c=relaxed/simple;
	bh=oHnWOPoEOqQYaKNIGpGZdepxdCSjweW0OwEtaXDhRuE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cSnpGRnk5/IRK28S2Z4clHT+T0yANigLGMmKE7hZXW5MDmxOdSRQgF8VzrnmYC+ezB1zL56Khoy7hrgUf+sYSFTsjwh7/yPa/ntebNKrIPfUQ7ctThIr3heDyPS9pRVBS2Wn59j5C9UkyrSzntIVb8NFE0t+jUNIsFQrVRGLpyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rLNIi15g; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rLNIi15g"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-374d29ad8a7so1962776f8f.2
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Sep 2024 09:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726937376; x=1727542176; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0Ee89bSvPuzbwJVPo7RrppZlptldQyjv0yBlTvXT6g=;
        b=rLNIi15g4MFKuwLQbnG92+LaxbzjEwGEmwc5aVOWxX8jxPGk0aCp5hsT++vihrsepY
         owyFK2cGdPMBFv118YzNR+GreFvKfyS31SFjA9hXrKq6A29HOixvCej5vaAKwa6HL7AO
         AY8FdOtSoFGYJFhuEXIiooIFOUkbHPTIrw9RleokF0M1DGSoNgSMerUyhP8Mx2RX0u9p
         pDlmIv/D3toJmMZ8oWxxyprUy/H1u4EvLc+Dq/sR1KLfEIjEI2JE6tKCAcQKSje/EGzY
         1+OGCduwMjgiVZuBSZEbIe+hz0xTacpr0IQoWrULUT/8RNnyTQiT786RJz5agBtF7Jtf
         JLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726937376; x=1727542176;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0Ee89bSvPuzbwJVPo7RrppZlptldQyjv0yBlTvXT6g=;
        b=UHNNdG+CtH+jwUXoCVE0H2CuaMgvXaiY0XYVYgKcnKbwyT/GVuCcBd3Y/YptocMuZE
         YdFpDJHWbEjj32x0hTo0kJeO7Nx9s3ESbgJjCdMoj+oIyg4J+8PzQDbn6IDFSW0SejS/
         oxTZHvJKpXIq1a4kV7a569Mhi8sSZELHR7DppopscbqRyUV2MMqDmXGvWPVYaHWzxDVw
         3JpdD8BBudkY+FKjFMfD8JQ5xbWb24ycWCmF3ZqT/cUIlJ69K73a6EDT7bJJrIi8JPhI
         tqjHhofNvWLV4Nyo987vz97vLRvTybzlkH1QPtdkhE5wtRChOrM+F5Yo9Aolq89lUJba
         2TNw==
X-Forwarded-Encrypted: i=1; AJvYcCV3e0MAuvYZFnXXmtVU0rw2c90YLIsPU0cmQExD0Z15p3Ob9Py/4XIlissbvUp3BtZA/SQARkhEclWC7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqauT2348iUOI5IQHQtTMR7gcFiJtQtmYIC8LMCMSgvpoeTkc3
	Km2zBDxqdIHzcnjSpVh2d60/vX2nYJ/RHrEQYozvajPECvL2ZFfO7yvhtjrulls=
X-Google-Smtp-Source: AGHT+IFuPDsm2dRJp3jYW31EMPYnFqLjlNgedP1R0pR4HT5R9bGqIfkGbMTWeYiuJiC3vcBzdGoidw==
X-Received: by 2002:a5d:4248:0:b0:371:8763:763c with SMTP id ffacd0b85a97d-37a422bf14fmr4653591f8f.33.1726937376108;
        Sat, 21 Sep 2024 09:49:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6c01:bfb8:cacd:cf42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e80fcsm20245700f8f.36.2024.09.21.09.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 09:49:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jean Delvare <jdelvare@suse.com>,  Jonathan Corbet <corbet@lwn.net>,
  linux-kernel@vger.kernel.org,  linux-hwmon@vger.kernel.org,
  linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (pmbus/core) improve handling of write
 protected regulators
In-Reply-To: <2f3cec6e-7b05-4510-8c62-244ed114ad17@roeck-us.net> (Guenter
	Roeck's message of "Sat, 21 Sep 2024 08:22:41 -0700")
References: <20240920-pmbus-wp-v1-0-d679ef31c483@baylibre.com>
	<20240920-pmbus-wp-v1-4-d679ef31c483@baylibre.com>
	<4052294e-7b7f-4238-9b47-92727de4d516@roeck-us.net>
	<1jsettz1hh.fsf@starbuckisacylon.baylibre.com>
	<2f3cec6e-7b05-4510-8c62-244ed114ad17@roeck-us.net>
Date: Sat, 21 Sep 2024 18:49:34 +0200
Message-ID: <1jo74hymsh.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sat 21 Sep 2024 at 08:22, Guenter Roeck <linux@roeck-us.net> wrote:

> On 9/21/24 04:32, Jerome Brunet wrote:
>> On Fri 20 Sep 2024 at 14:13, Guenter Roeck <linux@roeck-us.net> wrote:
> [ ... ]
>
>>>>    +int pmbus_regulator_init_cb(struct regulator_dev *rdev,
>>>> +			    struct regulator_config *config)
>>>> +{
>>>> +	struct pmbus_data *data = config->driver_data;
>>>> +	struct regulation_constraints *constraints = rdev->constraints;
>>>> +
>>>> +	if (data->flags & PMBUS_OP_PROTECTED)
>>>> +		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_STATUS;
>>>> +
>>>> +	if (data->flags & PMBUS_VOUT_PROTECTED)
>>>> +		constraints->valid_ops_mask &= ~REGULATOR_CHANGE_VOLTAGE;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_NS_GPL(pmbus_regulator_init_cb, PMBUS);
>>>> +
>>>
>>> I am a bit at loss trying to understand why the constraints can't be passed
>>> with the regulator init_data when registering the regulator. Care to explain ?
>> Sure it something I found while working the problem out.
>> Simply put:
>>   * you should be able to, in theory.
>>   * currently it would not work
>>   * when fixed I think it would still be more complex to do so.
>> ATM, if you pass init_data, it will be ignored on DT platforms in
>> favor of the internal DT parsing of the regulator framework. The DT
>> parsing sets REGULATOR_CHANGE_STATUS as long as the always-on prop is
>> not set ... including for write protected regulator obviously.
>> 
>
> If the chip is read-only, I'd argue that the always-on property should
> be set in devicetree. After all, that is what it is if the chip is
> in read-only state.

I'm not touching that. If always-on is set DT, REGULATOR_CHANGE_STATUS
won't be set. What I'm proposing does not change that.

> In other words, if always-on is _not_ set in
> regulator constraints, I'd see that as request to override write-protect
> in the driver if there is a change request from regulator code.

That's very much different from what we initially discussed. It can
certainly be done, what is proposed here already does 90% of the job in
that direction. However, I'm not sure that is what people intended when
they did not put anything. A chip that was previously locked, would be
unlocked following such change. It's an important behaviour change.

>
>> This is something that might get fix with this change [1]. Even with that
>> fixed, passing init_data systematically would be convenient only if you
>> plan on skipping DT provided constraints (there are lot of those), or
>> redo the parsing in PMBus.
>> 
>
> I disagree. I am perfectly fine with DT overriding constraints provided
> by the driver. The driver can provide its own constraints, and if dt
> overrides them, so be it.

That's not what the regulator framework does. At the moment, it is DT
and nothing else. After the linked change, it would be DT if no
init_data is passed - otherwise, the init_data.

If a something in between, whichever the one you want to give priority
to, that will have to re-implemented on the caller side.
This is what I meant by redo the parsing on pmbus side.

> This is not different to the current code.
> The driver provides a variety of limits to the regulator core.
> If dt says "No, I don't believe that the minimum voltage is 1.234V, I
> insist that it is 0.934V", it is not the driver's fault if setting
> the voltage to anything below 1.234V fails. I would actually argue
> that this is intentional, and that the driver should not on its own
> try to override values provided through devicetree. After all, this
> is a two-way problem: Devicetree may also limit voltage or current
> ranges to less than the range reported by the driver.

It goes way beyond what I'm proposing.
The only thing done here is something you simply cannot put in DT
because DT is static. Following init, if the chip write protected,
REGULATOR_CHANGE_STATUS should not be set, regardless of what is in DT.
If it is not set, I'm not adding it.

Also, what I'm proposing does not get in the way of DT, or anything
else, providing constraints. What I propose allow to make adjustement in
the HW based on the constraint, if this is what you want to do. It also
allows to update the constaints based on what the HW actually is.
If the chip cannot be written, regulator needs to know.

>
> Again, if devicetree provides constraints, and those do not include
> the always-on property, we should see that as request to override any
> chip write protection in the driver while the command is executed.

I'm fine adding that. The init callback is also the place to do it.
As pointed above, this may not be what current user intended. Also,
implementing that means that, for a chip with multiple pmbus regulators,
a single always-on missing will unlock the chip. Also pmbus will need to
adjusted so the hwmon attributes are registered after the regulators, to
get the permission right.

> We should not try to override devicetree constraints.

I don't think I am. I'm just reading the chip state and adjusting the
constraint. Even after implementing what is suggested above, it will
still be necessary to readback and adjust the constraint based the
read protection. Unlock is not guranteed to succeed, the chip may be
permanently lock. Some provide the option to do that.

>
>> Also a callback can be attached to regulator using the pmbus_ops, and
>> only those. PMBus core just collect regulators provided by the drivers
>> in pmbus_regulator_register(), there could other type of regulators in
>> the provided table (something the tps25990 could use). It is difficult
>> to set/modify the init_data (or the ops) in pmbus_regulator_register()
>> because of that.
>> 
>
> The solution would be to copy the init data before manipulating it.
> I don't see why that would be a problem. After all, the data is not needed
> after the call to regulator_register() since the regulator code keeps
> its own copy.

The type regulator being registered is not known at this point, unless
you to use something as weak as comparing the ops pointer to
pmbus_ops. Without that, I don't really seee how you safely manipulate
the constraints. If it is not the generic pmbus regulator, the
constraints should not be touched by pmbus_core.

>
>> Using a callback allows to changes almost nothing to what is currently
>> done, so it is safe and address the problem regardless of the
>> platform type. I think the solution is fairly simple for both regulator
>> and pmbus. It could be viewed as just as extending an existing
>> callback. I chose to replace it make things more clear.
>> 
>
> At the same time I see it as unnecessary and possibly even harmful.
> Maybe we have a different understanding of complexity, but I don't
> think that copying the init data and attaching constraints to it in
> the PMBus core would be more complex than introducing a new regulator
> callback and implementing it.

There is an infinity of ways to merge the constraints between what
regulator_register() gets and what the framework will parse DT. It is
impossible to get right on the regulator side. Regulator is just picking
one and that's it (always DT at the moment). That's the only sane thing
the regulator framework can do IMO.

If you want a merge between runtime based constraints, such as write
protect, and possibly DT - all that ready before regulator registration
in init_data, then yes, a lot of the DT parsing will have to redone in
PMBus before regulator_register is called. It is also something that
will have to be done only for regulator using the pmbus_ops(). I don't
really see how to make that happen in pmbus_regulator_register() without
some sort of callback.

>
> Thanks,
> Guenter

-- 
Jerome
