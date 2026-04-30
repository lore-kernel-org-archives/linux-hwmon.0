Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779D6282F0C
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 23:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777592022; cv=none; b=m1how0JmlxepU2c22jUpWKHPYq+X111F7TIr2zEJbDR118fFVqIIRWAel4CuX1v9XzQ/maH+ayETgYjw9QbKIZ1YB1//TuFzNqdpyeY1LJJycYuQg58InQ3sEoxCJe97BbfjpzfJ1s3lmTsl86hP/ouWMw6exqzCP+afwdsYkak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777592022; c=relaxed/simple;
	bh=W3/nqH6qHD72ixUWUP6ZBPNnt4XLF5MqlML1KUC9Prs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z5e87+fxWiES+y7Ybajdlz9T6sGATGzFenACA56NfsmYyGMrKA4j1SF91RO6r1+NcH/rXt5YtgxxF1lgKzkGqeVDoWvEqbyQlo5EY+ZQYGANMxh2dv7bh0W945dEAmQpCJ0kUxqs5mH8K0XO5duRpUosNtXei+fhuxEx+lb19x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnJuOiCq; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnJuOiCq"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c648bc907ebso928922a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 16:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777592021; x=1778196821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VnsbGdv+KHh/HAecW9JiTSqaqoPveVkbPqxbnPh/A=;
        b=bnJuOiCqhPLvssuyg6UJ0SE8UJLezKMz0iDHA0qaKVfoSNmvQaNbvJ4n1XrbqTlryh
         NYFtFhPp6bXPyI2gpMhSwzqhSaOMi/vc/6l02cykmKpWVnqeLN7NWD6civzdzP2LewyM
         EVGMyoNCgn489uQKm/pw+qYMKM7+r3dl4N7xvAdUltHeDGEwMwUFI7aqKTzQcmQfOk40
         zADTXNbvl67Ecy/gM0jEdgtfr7waiOqdxWIwIkpfYlIypFyNou7c/a0kPPNYySIh1jn7
         SHO5cFwJ6C/0M5ZmqfNFuZ+ZDFgd5LYL0KD6IOXsc2j4GkvkdGmH1ufH53TB1JznRVU3
         rK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777592021; x=1778196821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6VnsbGdv+KHh/HAecW9JiTSqaqoPveVkbPqxbnPh/A=;
        b=ORd3DrAnT6JZJQzZ2tf2WqILoPVmfrw6xRcd7VNLQ/0h3/RcZuLrPJR9m9hIN4imsR
         dTk595hlWk7IhX6pVFGU5PygMrLVAdJxUoPvDmLdtCJhZPiShkPVKGxWbzft7e7ahnaf
         DYwHssJJmldVcUjCC8Op03N2xAvGtnqBtPiSx7MlziTYu8GXHp87YOeZWU6JXAaoESuR
         VRum6onAuq2hhYGeMAbnYAD0l0eif5iIa5UdpIaFIIUhJBctxXJJqzI3WItIoS4yGFGD
         44j8KvCCh7CdlIILL7ZrI1cr72mZ68Jliz7Ubbh3JCMMXrM3RlGbzC5Y+6bacbDSyTsx
         CaKA==
X-Gm-Message-State: AOJu0YyULpnn1L2A0qb/0ievh004eVYAcRbPWP8Fai69zZ6Mpdh7kp3N
	v7dkA5cLzFd5vr4hNyMyp3HD0/GjetISCEFMohF7JAMH3/Y09HxqYUCq
X-Gm-Gg: AeBDiev9I4QBVnhpPPhypOuFMWL803gzbYQlJpHtK6lk4e84HqYoczFHE+Ag8lylrD3
	toq3w9zjoWb+mNarNN5ODQ8RBEWCi1hvU7Vagg+CqeF0eevhE2Nwok+Ga3of+Y5w7btMAHJafsr
	egREWKxb4hXDT+OaDX+0nVrryoKX1QM4CxQ4wXYWhlm56K9BfztgbbhkRhWwIm/FhFkN9MSReBJ
	rdACKzV6L83pYi4BT4KvKfe7f1gJ38KSfwOxHTudBAEev7bdxtwW0AfliBvoIrn3tsLRrS1ZSbY
	DF7GVqSMO93nRPjg1epWf0Fb9ymWK31HP9HXQ14SqVvJTmBzmt7P8QRZqfqDoPsAlBrmwWcQSOg
	IorV3jU4pJsRPQO32RMgEK1GvycPlyJQIMqXqDQ5ukEPmn0rX1kLgHOs9klo0vMsj+eUesioC45
	GYZChUQTJqd8jzN7A0W6mAxve2gipwozUiD+W3O8VUevdBPYkE8vr8TzK3gOgzLWYxZVsg7dhsj
	EX5X9VZYsw=
X-Received: by 2002:a05:6a20:3ca5:b0:3a0:129a:9747 with SMTP id adf61e73a8af0-3a46fc16e95mr948681637.53.1777592020785;
        Thu, 30 Apr 2026 16:33:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc6f66dsm646948a12.15.2026.04.30.16.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 16:33:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ac017f26-9af6-4cf9-bb76-f1257f96a1e7@roeck-us.net>
Date: Thu, 30 Apr 2026 16:33:39 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] hwmon: temperature: add support for EMC1812
To: sashiko@lists.linux.dev, Marius Cristea <marius.cristea@microchip.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260429-hw_mon-emc1812-v10-2-a8ca1d779502@microchip.com>
 <20260429183534.B9A77C19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260429183534.B9A77C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 11:35, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] `emc1812_is_visible()` returns `-EOPNOTSUPP` instead of `0` to hide unsupported channels, exposing them with garbage sysfs permissions.
> - [Medium] Incorrect bit indices are used when checking the active channels to configure the ideality factors, leading to an off-by-one error.
> - [Low] Variables of type `int` are passed to `regmap_read()`, which expects an `unsigned int *`, causing `-Wpointer-sign` compiler warnings.
> --
> 
> commit 334894f6ed5a53fe9f4a36ce3c196060e9967729
> Author: Marius Cristea <marius.cristea@microchip.com>
> 
> hwmon: temperature: add support for EMC1812
> 
> This commit introduces the hardware monitoring driver for the Microchip
> EMC1812/13/14/15/33 family of remote diode temperature sensors.
> 
>> diff --git a/drivers/hwmon/emc1812.c b/drivers/hwmon/emc1812.c
>> index 000000000000..94e2709a566f
>> --- /dev/null
>> +++ b/drivers/hwmon/emc1812.c
> 
> [ ... ]
> 
>> +static umode_t emc1812_is_visible(const void *_data, enum hwmon_sensor_types type,
>> +				  u32 attr, int channel)
>> +{
>> +	const struct emc1812_data *data = _data;
>> +
>> +	switch (type) {
>> +	case hwmon_temp:
>> +		/* Don't show channels which are not physically available */
>> +		if (channel >= data->chip->phys_channels)
>> +			return -EOPNOTSUPP;
> 
> Does this correctly hide the unsupported channels?
> 

This is most definitely wrong. Please fix. Just remove that check.
It is unnecessary.

> The hwmon core interprets the returned umode_t value as file permissions.
> Returning a negative error code like -EOPNOTSUPP results in a large
> positive non-zero value, which unintentionally creates sysfs attributes
> with malformed permissions instead of hiding them. It seems returning 0
> would properly hide the attributes.
> 
> [ ... ]
> 
>> +static int emc1812_read_reg(struct device *dev, struct emc1812_data *data, u32 attr,
>> +			    int channel, long *val)
>> +{
>> +	int hyst, ret;
>> +
>> +	switch (attr) {
> 
> [ ... ]
> 
>> +	case hwmon_temp_max_hyst:
>> +		ret = emc1812_get_limit_temp(data, channel, temp_max, val);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		ret = regmap_read(data->regmap, EMC1812_THRM_HYS_ADDR, &hyst);
> 
> Does this trigger a -Wpointer-sign compiler warning? The regmap_read API
> expects an unsigned int pointer, but the hyst variable is declared as a signed
> int.
> 
> [ ... ]
> 
>> +static int emc1812_set_hyst(struct emc1812_data *data, int channel, int val)
>> +{
>> +	int hyst, ret;
>> +	int limit;
>> +
>> +	/* Critical register is 8bits long and keeps only integer part of temperature */
>> +	ret = regmap_read(data->regmap, emc1812_temp_crit_regs[channel], &limit);
> 
> Similar to the above, limit is declared as a signed int. Does passing it
> here cause a pointer signedness mismatch warning?
> 
> [ ... ]
> 
>> +static int emc1812_init(struct emc1812_data *priv)
>> +{
>> +	int i, ret;
>> +	u8 val;
> 
> [ ... ]
> 
>> +	/* Set the ideality factor only for the channels enabled on the chip */
>> +	if (test_bit(2, &priv->active_ch_mask)) {
>> +		ret = regmap_write(priv->regmap, EMC1812_EXT1_IDEALITY_FACTOR_ADDR,
>> +				   EMC1812_DEFAULT_IDEALITY_FACTOR);
> 
> Since channel 0 corresponds to the internal diode, shouldn't EXT1 correspond
> to bit 1, EXT2 to bit 2, and so on?
> 
> If so, checking bit 2 for EXT1 (and continuing up to bit 5 for EXT4) will result
> in an off-by-one misalignment. This means EXT1 won't be configured if only
> channel 1 is active, and the out-of-bounds bit 5 will be checked for EXT4 since
> the bitmask has a maximum of 5 channels.
> 

I agree with Sashiko; I don't immediately see why it would make sense to check
for bit 2..5 instead of bit 1 .. 4.

FWIW, it might be easier to program this in a loop and declare a static array
for the registers, similar to how it is done for the other registers.

> [ ... ]
> 
>> +static int emc1812_chip_identify(struct emc1812_data *data, struct i2c_client *client)
>> +{
>> +	const struct emc1812_features *chip;
>> +	struct device *dev = &client->dev;
>> +	int ret, tmp;
>> +
>> +	ret = regmap_read(data->regmap, EMC1812_PRODUCT_ID_ADDR, &tmp);
> 
> This also passes a signed int pointer to regmap_read. Can tmp be declared
> as an unsigned int to avoid compiler warnings?
> 

The code is a bit inconsistent in this regard: Sometimes it uses int,
sometimes unsigned int. Please use unsigned int consistently.

Thanks,
Guenter

