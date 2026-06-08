Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9711628B4E2
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 22:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780956792; cv=none; b=PZJHqDtPKrdncJOVr1IMaLQS1YMcXvHlJkZh8PcDT/sNZLgNfcUBtB/gpDurKarFMqKT4ZsZD2yxacb3YN4TUMccmmlAMqVQkg7uOe7PFrdKRYdDTC4u9znLYnQz/xR6RjbNj/iA+7bGDaPZY2N5ootJ0pMZFjagp5S3RMt/stU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780956792; c=relaxed/simple;
	bh=PHdnpGZPUxi9X6SS/MEkUCQ1PaSOMukhaiGg1SqBmLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hp23ETrWiX4mN9gG71TNiF/bgRQQY023BEMl0eYrqsvlvTn9jxECbLoui0wYdE+xM94+UyfZXO6BcKMsxJakjP4FeUEZy2XsMJJLg+hIeLTWmNUdNfnlb6MBp+MQKDRN8JbObaO8gaChpoOrRQ//CqRAJ5+G+OXM+qF/mArS4Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Va6Znx/J; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Va6Znx/J"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c8588f8fef3so1811463a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2026 15:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780956791; x=1781561591; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9wbSZE/aFz9Mur/lB6ehIatazsSPpRnHAyTrMUWB3TU=;
        b=Va6Znx/JpkoUdNC9n7LOoFrkKn67wpPpnxKzcO/Zu0ohayj3lMiNSW9NNB9VCEYX+R
         fAcu1SB8zQHVhYEv+/CmM4/NHOcqayKoSKikyniv1j3LklbF9os/GGxRsaFgA5+mxuwk
         cDHaIKCKfTuL1CuRk15prvne7GdizCv5w2mY+dnlgf5VCYH4bXgoJyrxYw99fEvhXHMq
         q2go2Fgqo7arYz/fvJPrMggp1wYqpJnZP027lL+k87TzCjwy+Dyd3dLmecOw2rwWLA8P
         Xl7R4Q5t4J7nD7G6R+FHSKfhMJ1glf61+2COOTTl62k3CFEq8wmoDPNKc4qndQOjPpnU
         V5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780956791; x=1781561591;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wbSZE/aFz9Mur/lB6ehIatazsSPpRnHAyTrMUWB3TU=;
        b=Xpc3Jq0SkvgaK+evYbhnwDvPJRCnp2aGYiXWSiXcd4w/KTdvUSb3V4nTbfvyIuEA8S
         tEF3ONzwAqIh0hv+kdYmYQWX3KZRwz1SNF+2xY4n3PibelbzFPGiiiFUoRBLf1Md8I4m
         bPtMNbjLl4KFvnKXtV+gGlbsOpAruwMY7GE52QLu4NB1e13LG8byNhX+7JKTSZ8h2ag1
         CH0CoanoYXD4Bl55apuxIyMDnFhelO0B+07YDkOE7EhHTIkeJYYtmwCJ0FzziUxy4i+A
         LRtw38bLE9xf6DCq7dgFsNazanZ0T2Ii+QNZElTc4uXrLOW8EGrAXWryQ0bH5u8xdiVU
         p38A==
X-Gm-Message-State: AOJu0YzlAu4T3IGtZ8v8HoDo9sqMaZqzui3me1tUJGQZMV2QTqVbNaLW
	NZQUvqDEQlmcouAQ9ZOttYovyl38bBXq24tFEeRPLSfF3Y+LjHc1QwiUmFGtZG8R
X-Gm-Gg: Acq92OEaGLNcGAX9VAwXTI+0Iz9WrD2gMl+9Reg+McQuPpR55gQ/64EB6AZfQp/wAo2
	ZctVTnapy6Fxopnsun/0EHWCxBumH79cf8AXB7tKLzN69lXFCfJlvlLhOLCXWrnR+Kb7dfF4YPU
	wWiHAUpf2N0fmpDH8QPKxSj4loavntZUnGGplbCr0w/5QlyfcSnyRYVewEm/IVMpEvPrOdhVoQ7
	HuL56hHfXjOwxtd9n4JkVuUXHpuJID8Rfvhta3ApDkhItTnurCOZtzW50gTRxS+KBUeAGoAuNu/
	TNaQWTjSmAlFzPlFvBwd/TMDIlTOqjSVlQjtoe+J1DezJrkiIoVwJue617P7jdcshElig2Ug8db
	OmsGsRhzTNg8SgPw0MVRARcR/QNrQc7toP/if9LHrJGkww/MCAzie44ZL9oW0KmmaofbLKKfeHz
	pwcAA6h6hi6aga40S7ycMS4GzcVlEMTlmKzWvrR7f3Dh7/A7nPTwZdwVX/cruQyjSJv8coiCofI
	m71z1BtnkM=
X-Received: by 2002:a17:903:3888:b0:2c0:a3dd:4e76 with SMTP id d9443c01a7336-2c1e80efba7mr192135695ad.28.1780956790808;
        Mon, 08 Jun 2026 15:13:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm190349275ad.6.2026.06.08.15.13.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 15:13:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <81dc547c-7c62-4e34-aa90-5a48ebe46b9b@roeck-us.net>
Date: Mon, 8 Jun 2026 15:13:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
 <20260529213842.354A51F00893@smtp.kernel.org>
 <20159ced-3959-47da-9245-8d562d656f43@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20159ced-3959-47da-9245-8d562d656f43@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/30/26 04:12, Thomas Weißschuh wrote:
> On 2026-05-29 21:38:41+0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Aggressiveness check incorrectly handles the disabled state (0 K), permanently locking unconfigured sensors and allowing fans to be disabled.
>> - [Medium] Integer truncation on 32-bit architectures bypasses input bounds validation.
>> --
>>
>> commit 84e7ddf64f7f5ac65172c3a7ccc4e158bbb73094
>> Author: Thomas Weißschuh <linux@weissschuh.net>
>>
>> hwmon: (cros_ec) Allow modification of fan curves
>>
>> This commit exposes the EC fan curves through the standard hwmon sysfs
>> ABI, allowing both reading and writing. It includes logic to ensure
>> the curves can only be made more aggressive than their current state.
>>
>>> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
>>> index 731143f8c6b2a..fb73a00ebeebd 100644
>>> --- a/drivers/hwmon/cros_ec_hwmon.c
>>> +++ b/drivers/hwmon/cros_ec_hwmon.c
>>
>> [ ... ]
>>
>>> @@ -417,14 +435,60 @@ static ssize_t temp_auto_point_temp_show(struct device *dev, struct device_attri
>>>   	return sysfs_emit(buf, "%ld\n", cros_ec_hwmon_kelvin_to_millicelsius(temp));
>>>   }
>>>   
>>> +static ssize_t temp_auto_point_temp_store(struct device *dev, struct device_attribute *attr,
>>> +					  const char *buf, size_t size)
>>> +{
>>> +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
>>> +	struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
>>> +	struct ec_thermal_config config;
>>> +	u32 *temp_field;
>>> +	s64 temp;
>>> +	int ret;
>>> +
>>> +	ret = kstrtos64(buf, 10, &temp);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	temp = cros_ec_hwmon_millicelsius_to_kelvin(temp);
>>
>> [Severity: Medium]
>> Does this silently truncate values on 32-bit platforms?
>>
>> The cros_ec_hwmon_millicelsius_to_kelvin() function takes a long parameter:
>>
>> static long cros_ec_hwmon_millicelsius_to_kelvin(long t)
>>
>> Since temp is parsed as an s64, passing an extremely large out-of-bounds
>> value on a 32-bit architecture might truncate to a small valid value.
> 
> We don't care about overflows anywhere else, so I am not sure that we
> should do so here. I'll switch the millicelsius to kelvin conversions

Oh help. "The driver already has bugs, so introducing more bugs should
be acceptable".

Who said that we (whoever that is) don't care about overflows ? Did you
consider the possibility that maybe we (or at least I) do care, but
that code reviews are not perfect and tend to overlook them ?

Sashiko is explicitly directed to look for overflows in hardware monitoring
drivers because its maintainer _does_ care.

No, it is not ok to introduce new bugs to a driver because the driver is
already buggy.

Why kstrtos64() in the first place ? That is completely pointless.

Guenter

