Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BF2372062
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 13:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780925687; cv=none; b=l7cA6id8NTkgphrXkcMhM/fd1f+vYl4uwF2kGlPDm0zuPSnAbj3VGd6SLNf5/ZJC0Qwj+hD6GvIvR/uXGzizxeZCAnLNqouPvGFsZMbUkx1yDiGAY28ugZ9a0UKiOXpp6IMB0L2IGc9nM0uhEttLHIaGFqZ9LUrD6/jVaahOFR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780925687; c=relaxed/simple;
	bh=gS4N3bt4SVHbO+5q7Gyq7cev2WeoXC9xRlW4wfhJ+rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oUYoctt0alNWm1e9PrQI0AbH2YZ15QgfLxAcea1T3F5Mc9o26zqCuZi0uoVxbspKbVidcECOPOrSNhNjgKTPFP7x9prl3mcn1aQ4EEZUpajapZzBe15Z6ra2JM5sAjrukIw1mQTU1+WPr8otrwKcLld1YieK7xaZYFW8xXuVl2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2YQDcc8; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2YQDcc8"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36da8439078so3792503a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 08 Jun 2026 06:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780925685; x=1781530485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=G1yQGY/sxND8Z06ZcpOvc+uP5p9kqbh4/uD3ugDSS8I=;
        b=m2YQDcc8SbhkpNMgsi4Epr2Pbhe9ei8V8xZVxdP77NOawD2kb5/stl8OruBCUW+NcR
         w2+psZBFfeJkhiV8biPnSA0OY+pMxxDuEvmCFp7Drd+lTQEHssS5boXWXUkIfvmvE6fZ
         D6OVVv94Ifa1P57zTob+8NG1VB8A9u8qbKwLidc4wWEBCcKle5y3xv+l52Yx43F0p1Cv
         WRgBbUmdG49tiH0N9/We9JK6lBdvR18IULUdq2h3D0E+5hedfG/MjBi8KnFO5Lyw3q+x
         5HVcXxLMRPBASgG/b1wkILangy0GZdMAZRaWLNTKIFe0ippfM06MXZbAnGeBovVcaSIw
         3ZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780925685; x=1781530485;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G1yQGY/sxND8Z06ZcpOvc+uP5p9kqbh4/uD3ugDSS8I=;
        b=kWJ5D0swnsa3byFi2D5D7AvVcsiBzuAfRjMLLe/MwtSrInZhUFWY755h/otESPjPhg
         W92E5uvAGjeicPtxR6AQY3bThL2ZXx+PI0b/5Fw3BQv06OKM4VqFBk3SVk/zohf6g1WS
         Kc/DJGwjGtPUmvDeHC1zeDCVmWjcYU698OcADL7mm84/AstKVHxh8UlSpeNmPsJ05QGv
         sZ1k8azRD49feeHXvOdWNvQskrtXuvbxaKuvJ6KjxoH/WVeeULzPY4xLGxG7fuSzEdxQ
         B4GRWmuMtkA1CbCmDj0NVqy/YcBO+GMzii15rBW6lZeLjqyXedtdyoIDTq4fZ+GPDGR0
         kfig==
X-Forwarded-Encrypted: i=1; AFNElJ8mA6ukSnS2cstrBSJXgUUo78CJnB5Lu6qrYwokO3zlCS1tLbUpNPqiUooszqHfkgqSUa2b4vrRMaDGjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWeQ9iFNV++WfmlL50g/tmrg8YHnONi7KSUnbmrSwZTxWMWrC9
	R8dPQ+8RJ828uZ10yxqI+8OoOHbYjPvxVZV0+c23hZ7RuWIFRFis6b61
X-Gm-Gg: Acq92OHiGTPHEsqki9nX3GdUxc7kCRuC1XQ3kPR4/e+69uCgR9hl17hVQlVMbmEByY7
	gc1QnISIYkhzg2MKc4glY8OgSWpZcj3sMx/7sXZxh879auCLpoNbXejUq1e/wVGOYpl3myZ0H5c
	yTnB4WBOAgDo6XWvvO/IXwYh9guMqMuuU3rmTpmbcbZPAjDt9GXvShojaXgAOo+/S/RW6Cu8QXm
	4KirF8pIMZF/x7cwHccQyneFe8+lsHWAzjoFqPcB+Z3NZXO9WkK4WILCbK8dXLK0xBbyTtesaZw
	N0hwp4hTLAHkx1Uruw1KOReGz/lpuJXNXKliBxqkHzc5FCish6onvOuaC+BCLnuBx0WgL2GMOTY
	JBM/RX82BJrbEPvRBfx+yYdgtpVTbU8fAqHHZNgqEMG9/oAHID+yUlNCtgAkQ3RCl9X/4bfcroq
	y9Jwxe/baPN3Mby14EYyjTGQzxlEkkcpAvhgOJg01Z1OAx5xwErjmX7omI0LGL+o6ePAQI/0gbl
	zmG0One003jj16TW96OGg==
X-Received: by 2002:a17:90b:1d89:b0:368:ea0c:1b75 with SMTP id 98e67ed59e1d1-370ee82fe25mr16446630a91.6.1780925685333;
        Mon, 08 Jun 2026 06:34:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf82fecsm16305333a91.3.2026.06.08.06.34.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 06:34:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <243e6f71-b777-478c-802a-d8f3ed47b3fc@roeck-us.net>
Date: Mon, 8 Jun 2026 06:34:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
To: Armin Wolf <W_Armin@gmx.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
 <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
 <87825203-0bbb-46a4-8939-a904f5a546ab@gmx.de>
 <6a4a2d2c-4717-4cc9-8dd3-05f8b0905865@t-8ch.de>
 <8b8f5a9f-4a44-4e93-9ff6-c2e13a6b8797@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <8b8f5a9f-4a44-4e93-9ff6-c2e13a6b8797@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/4/26 03:33, Armin Wolf wrote:
> Am 04.06.26 um 11:04 schrieb Thomas Weißschuh:
>> On 2026-05-30 18:37:32+0200, Armin Wolf wrote:
>>> Am 29.05.26 um 22:31 schrieb Thomas Weißschuh:
>>
>> (...)
>>
>>>> +static ssize_t temp_auto_point_temp_store(struct device *dev, struct device_attribute *attr,
>>>> +                      const char *buf, size_t size)
>>>> +{
>>>> +    struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
>>>> +    struct cros_ec_hwmon_priv *priv = dev_get_drvdata(dev);
>>>> +    struct ec_thermal_config config;
>>>> +    u32 *temp_field;
>>>> +    s64 temp;
>>>> +    int ret;
>>>> +
>>>> +    ret = kstrtos64(buf, 10, &temp);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    temp = cros_ec_hwmon_millicelsius_to_kelvin(temp);
>>>> +
>>>> +    if (overflows_type(temp, config.temp_fan_off))
>>>> +        return -ERANGE;
>>>> +
>>>> +    guard(hwmon_lock)(dev);
>>>> +
>>>> +    ret = cros_ec_hwmon_get_thermal_config(priv->cros_ec, sattr->index, &config);
>>>> +    if (ret)
>>>> +        return ret;
>>>> +
>>>> +    if (cros_ec_hwmon_attr_is_temp_fan_off(sattr))
>>>> +        temp_field = &config.temp_fan_off;
>>>> +    else /* temp_fan_max */
>>>> +        temp_field = &config.temp_fan_max;
>>>> +
>>>> +    /* Only allow values which are more aggressive than the current ones */
>>>> +    if (temp > *temp_field)
>>>> +        return -EINVAL;
>>>
>>> i think it would be more practical for users to increase and later decrease the fan curve values.
>>> Could the driver copy the original fan curve configuration and use that instead? This would also
>>> require to restore the original fan curve during shutdown and removal.
>>
>> That would be possible. We would would have to expose these limits
>> through a new UAPI as otherwise the user has no way to know about them.
>> Restoring the original on shutdown shouldn't be necessary, as the EC
>> will reset the curves at shutdown anyways.
> 
> (And what about kexec?)
> 
> Ok, i myself would also interested in having a UAPI for communicating fan curve constraints to userspace as i am planning to add a similar feature to the uniwill-laptop driver.
> 
> I can think of two approaches:
> 
> 1. Clamp the values into the supported range, userspace will have to read back the written value to know the current setting.
> 

... which is widely used in hwmon drivers, so it is not special.
We don't usually expect userspace to know the valid attribute range.

> 2. Introducing a new tempX_auto_pointY_temp_min attribute to communicate the constraint to userspace.
> 
> Guenter, do you have a preference for one of the approaches? Personally
> i would prefer approach number 2.
> 

Again, we don't usually provide constraints for limit attributes
to userspace. Otherwise we would need separate _min and _max attributes
for literally every limit attribute. That would add a lot of complexity
for little if any gain.

Worse, almost all attributes do not just have min/max constraints but
step size constraints as well. Hardware does not typically accept values
in millisecond/millivolt etc. but have varying step sizes. How would you
express that ? The hardware won't accept a temperature of, say, 27.123
degrees C. Hwmon drivers are expected to adjust that to the next supported
value. That means userspace has to read the value back to know that value
anyway. Or do you plan to provide the step size to userspace as well ?
What would you do if the step size is non-linear ?

On top of that, _min and _max attributes are already associated with
limits. I would find it confusing if new attributes would redefine that
naming scheme to supported ranges.

>>
>> I am not so sure that it would be generally useful though. Let's hear
>> what other people think about it.
> 
> The uniwill-laptop driver will (likely) gain support for a similar feature in the future, so having such a UAPI would be beneficial.
> 

FWIW, as long as it does not reside in drivers/hwmon/, you can add any attribute
you want, and even violate the documented UAPI. That is one of the "advantages"
of having hwmon drivers reside outside drivers/hwmon/.

Guenter

