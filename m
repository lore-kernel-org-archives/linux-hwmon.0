Received: from omta-ad1-fd1-2101-ap-sydney-1.aib29aea255.vm.email.ap-sydney-1.oci.oraclecloud.com (aib29aea255.vm.email.ap-sydney-1.oci.oraclecloud.com [192.29.151.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA0130568B
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 03:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.29.151.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282852; cv=none; b=dO/3HNLqwu+TjbpTr1cGy3XSPkaNcmqACxX69b9ppU8NuihSQZux74ETDf40a8W9fZKwOz/x6SvEwSbA03td9HmnMf/76WA3+UMWpqX7b/b7+gHae5BMwtexKrWYs4gWpXjCF+q4Eyn152PPSEJTK1RQ6G1RNeqgUoUiPwQcz0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282852; c=relaxed/simple;
	bh=h7Ve+n7gLalVN/hamq+9sOt/wIp9NFoxX09l0/unmsU=;
	h=Message-id:Date:MIME-version:Subject:To:Cc:References:From:
	 In-reply-to:Content-type; b=o47PytrO+KD6gNezdFhGxX0Tgi7FGEi8a4GJkz+4e4LFToIaimDNTpaMXD4lY6mF44px7DJJVvxvn6NqICbcG8oEVL1QGinHnW+MKsJX37pDqLvFY9aRnYZs44rO2iJN3y+LJG6H7nWU2GAOICl84H1/SzYm2TO1w0LrHABrYc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stevetech.au; spf=pass smtp.mailfrom=syd1.rp.oracleemaildelivery.com; dkim=pass (2048-bit key) header.d=stevetech.au header.i=@stevetech.au header.b=T/uhddmt; dkim=pass (2048-bit key) header.d=syd1.rp.oracleemaildelivery.com header.i=@syd1.rp.oracleemaildelivery.com header.b=NG1M6rp5; arc=none smtp.client-ip=192.29.151.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=stevetech.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=syd1.rp.oracleemaildelivery.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stevetech.au header.i=@stevetech.au header.b="T/uhddmt";
	dkim=pass (2048-bit key) header.d=syd1.rp.oracleemaildelivery.com header.i=@syd1.rp.oracleemaildelivery.com header.b="NG1M6rp5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oracle-2026;
 d=stevetech.au;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=L66ir+PivH58IHajuTfLolp/B5mG7kVirbvlAHl33II=;
 b=T/uhddmtiSJQsIdDtw/nihZR76dG+SW/oxiQ97az6qo4myfzLlAfYsLYt6qfROdtAGblq8g/EFEQ
   bhZNarafucik5CmiP4739mrFiI4q0VKLHVO3Z6O9DKc0FI8qPTdY7hs4ZRJeNsFbiV/sjFjX6BtW
   lOojW00stekTsdIPInZbDlqcGEwlXBwHabdtyzF/pgMe1MPMOE6VRSwpGeGa2XmZpDc/e+iqi/H0
   kv5uTfIVzqZyPv98pHDiJnkw0W5+FVJVeDflYcd0aOLXZ6EYK+YAn/LeqPFSKW9PKDzcaIE6+3gs
   t/8Dx4r4/uWnEjwuszMs4lYSaUhj51FrHUI7qA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-syd-20200122;
 d=syd1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender:List-Unsubscribe:List-Unsubscribe-Post;
 bh=L66ir+PivH58IHajuTfLolp/B5mG7kVirbvlAHl33II=;
 b=NG1M6rp58lLliR9W8Qhke4IPIjDw6phLNsggQhW6wuruxTnsigQNDP5XUbKyIh/PZ6k6ZEwfLljj
   trncZFqN9OQUAvN9V/Om+KfjP9HTcCmOuKkEjvr7u1FWiRYkxLkVgeYzheCiwRev3eug5z+2zCn8
   0LaZiRMj87OqOtifal6w7YY8mXlVyrmbBzSvP1n12XYK3/vF5yCC7Hep69QskOf55DnBaWR6Tinu
   JuaHvv1PmPxIQrp0FYOQGFfzK0LsBQ6vKUHfnTk7w9UMEfNk7Gj8V6uZ3BQE2F2K182I6PiZH9zB
   ZBOatJRhRK9Y0S8QUVLeaIiMb32jjoLMGR2XtA==
Received: by omta-ad1-fd1-2101-ap-sydney-1.mnat.vcndpsyd.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20260722 64bit (built Jul 22
 2026))
 with ESMTPS id <0TK31OT2MO9S9F70@omta-ad1-fd1-2101-ap-sydney-1.mnat.vcndpsyd.oraclevcn.com> for
 linux-hwmon@vger.kernel.org; Fri, 21 Aug 2026 03:27:29 +0000 (GMT)
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Message-id: <7fac8b19-af18-4365-94d6-a6bd18076abb@stevetech.au>
Date: Fri, 21 Aug 2026 13:27:28 +1000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] hwmon: Add Support for PMIC5000 Power Management ICs
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20260819-pmic5000-v1-1-e5e0ddcf0863@stevetech.au>
 <6b8bf838-011f-46b9-a2a8-379de9cceddf@roeck-us.net>
From: Stephen Horvath <linux@stevetech.au>
Content-language: en-AU, en-US, en-GB
In-reply-to: <6b8bf838-011f-46b9-a2a8-379de9cceddf@roeck-us.net>
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 7bit
Reporting-Meta:
 AAE0CRPkDXUCCkglQobUipg4J5mxfCGMKIbvqKb9veEutptuF/BYXQOZL+n+BC+g
 9F/l1G9fNqweZphNlPpYqUMlvd2LjJ6v1MwDv7F4RQiViDg+xjKN8Dfpva+L5iMV
 J2fLjUw8MsPOlNpUHaKVqQ7Ff6K1DHCuv0lTeJ3U4oFisDg3CuxbHMNKV9jHgGEx
 0kQA4rkw6KTmiwi6St1GXY5OZYVsf4gZsh8MUUY6UlTkM15lVkkgjjuWBUQJIDVA
 KYGiZZvcX7wcytJnMq5V3axVqGdhJQmiM1tdJpKAO/trW11wOFTQKjqnDNjeCYol
 sM+7txYLLOafe1rM8EBwyCcaMTiPE1JCpcz8S4EhSi5bo+uPa7tX4Dm4MF3M4Ofw
 mOWl+zWuzUCtyzJ5pcrgirVxpzVN42bQiMnsS6DC1hCR/pD9oxUDw/vv8cLfOw==

Hi Guenter,

Thanks for your review!

On 21/8/26 01:34, Guenter Roeck wrote:
>> - Does this belong in HWMON, or should it be part of the regulator
>> 	subsystem?
> 
> It depends on its functionality. Is this just for monitoring, or are the voltages
> controllable ?

This driver is just for monitoring. They could be controllable, but I
haven't implemented that as changing the voltage of active RAM modules
doesn't seem safe (without retraining and so on).

>> +in0_enable		Whether SWA is enabled (RO)
> 
> Does that enable the voltage or its monitoriong ? The enable attribute is
> only to enable monitoring, not to enable the voltage. If this is a
> controllable voltage, the driver should be a regulator driver, as Sashiko
> suggested.

It just queries whether that output is enabled. I'll remove it though as
the disabled channels are hidden by is_visible anyway.

>> +/* PMIC5000 registers. */
>> +// clang-format off
> 
> No way. Are you serious ?

clang-format would break the alignment of the #defines; and there's a
few other drivers with "// clang-format" in them, so I assumed it would
be okay (though none are hwmon). I'll remove it next revision.

>> +
>> +
> 
> Please run checkpatch --strict on your patches and fix what it reports.

Will do!

>> +struct pmic5000_data {
>> +	struct regmap *regmap;
>> +	struct mutex mode_lock;
>> +	struct mutex adc_lock;
> 
> Explain why those are needed on top of the hwmon subsystem lock.

I didn't know the subsystem lock existed, I'll remove them.

>> +	if (channel != 0)
>> +		return -EOPNOTSUPP;
> 
> Unnecessary check.

Sure.

> 
> Unnecessary channel checks (at least if the is_visible function does its job
> and the info data is correct).
> 

Okay.

>> +	case 6: {
> 
> Why "{" ?

No reason, I'll remove it. I had previously declared something there.

>> +	if (channel >= 0 && channel <= 3) {
> 
> channel is always >= 0.
I wasn't too sure, thanks for that!

>> +	/*
>> +	 * The host shall wait minimum of 9 ms delay after the input selection
>> +	 * for ADC readout and the actual readout
>> +	 *
>> +	 * msleep may sleep for up to 20ms, which is fine.
> 
> No, it isn't fine.

Fair enough, I'll change it to fsleep.

> Also, why wait if the channel was not changed ?

Good point.

>> +	*val = 1 << (regval & 0x03);
> 
> 		BIT()

Thanks!

>> +static int pmic5000_write_interval(struct pmic5000_data *data, long val)
>> +{
>> +	struct regmap *regmap = data->regmap;
>> +	u32 regval;
>> +	int err;
>> +
>> +	switch (val) {
>> +	case 1:
>> +		regval = 0;
>> +		break;
>> +	case 2:
>> +		regval = 1;
>> +		break;
>> +	case 4:
>> +		regval = 2;
>> +		break;
>> +	case 8:
>> +		regval = 3;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
> 
> find_closest() would be more appropriate here. We don't usually expect users to know valid
> update intervals.

Thanks!

>> +static int pmic5000_common_probe(struct device *dev, struct regmap *regmap)
> 
> Why pmic5000_common_probe() ? There is only one caller.

Good point, I'll move it.

>> +static const struct of_device_id pmic5000_of_ids[] = {
>> +	{
>> +		.compatible = "jedec,pmic5000",
> 
> jedec,pmic5000 is not documented.

Is there some centralised database for device tree identifiers, or does
it just need to be added to trivial-devices.yaml or something?

Thanks again for your review!
Steve
