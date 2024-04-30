Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BDD1527AF
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714491448; cv=none; b=TPV+Xj3L7vBvSbY67BARHByImxyJGL6X1eT3reG8RHFw5zg0Y/+YaSpVfAYjtfQCpUbhrIt/3/TPDtDOllvxumrDVYDvwokroEGE19iYjMkSepVrvq2ZxlgQ5WRSo2E2vsdzNKX+TENUsVYl+5nMaLLdwaD1lfek4HlYwbtz7I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714491448; c=relaxed/simple;
	bh=Gm41uuNRA5c2qxZcuRUmOTrsZXk3JeH1WftTKWlTxVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rY7pCdF9MpTAykrGRreKWrh+iptCKIQiIPO0EvNIa5DtjesQ7uQEzzeLqJJG4F+5xZrRDpP4U3kaHjiAS92bDD0FA1DsyaMA7170zRRGQGcuM6CPn/z1Au8I71x1Wx9LPi5dKve0eDfpR1svOnN7QnCpxxUYIH0Mn2LmXfEzsx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2ElEb+1; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2ElEb+1"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f4178aec15so540143b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Apr 2024 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714491445; x=1715096245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lHMj/wmLnfuWHyuHkEMKTw16618M3YUTWgM/+BYtmJU=;
        b=I2ElEb+1RpFfoCh55Bngk1eXMSOX5HRJWC+XB6XORIl/51/psrAKvR4XgIvHZkAXgO
         3jsoOus7qrPg5ooaukifrSGWL+eOrYVP44aoYPTDS9AqG5k478EMZmV+9hzSsI3bDJid
         r0wu1mVO+C/VZbMB1pLjgoFbUFawviceqcjWCeFmFpcRObocHh3HKJvuQPVPC+HXz+W0
         vOgR4auma9U0mjoZvpexnPiLnVk1v3RlEaVPoyHRHVY6aRYsgEO7I9ltBI2a6mvcqKSL
         cYRVFelscnPF9XihHi3vB62BYnhGSl0NZifXda3iQwD3bXiwIYMKJln1VXkpjo+Msuq+
         qt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714491445; x=1715096245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHMj/wmLnfuWHyuHkEMKTw16618M3YUTWgM/+BYtmJU=;
        b=UPSCbhBKHd8vKMSgT8zfnWuGLgxQXW4xd7t7JxUlI7TuzewgZCy2HVe6OL77V6j1HH
         u0ye1yInSij0rBatzNz+PUdTosvNm4433Ayy05KiH0eZLQ+dZpNneJ5PNBtXgRCehOip
         EeMwGqPOeQA8XFMlhbIUiGHoan1JixeYHRWAOJfIf/Jd3Lqxo07ReIjE+dR1iDEvPu5T
         YSK1kumi0BMXgXUKbjN7ZKR2L5dXxh7xW9v21ZvBjzOxaFCiGtBHs4I0sf3fcXnvayKv
         4URE9kHRNyKLcyFoIyhOmHqEe2+qS0O2D4Iq1IsasZlqmvkwU8jHyU1/xWW5VtSe7xeK
         cRTg==
X-Forwarded-Encrypted: i=1; AJvYcCVXW3CyFijWK4L7lfyk7T4WZoZrWHnYAqa5sC9gK96YX5ZteYbD7MgEhC6jSfPtVvt4dNjXhVxCh2lDGYn/U680d0SYeYzSPVHfxFQ=
X-Gm-Message-State: AOJu0YwsPyE1k3xbfLGV86AbW8hgrxWWj3V9+GqQ8FgTbAGNg78AYp+I
	cidU3g78ieHajfZt1OzmU4mEH0g3fiO4ozw/Sax8eU5ldtx5Cnm5
X-Google-Smtp-Source: AGHT+IEx2K0nCcXFo29vBRtWocWatBiUBeO/oab4mRIneFf7/HS/il2e6knZoYHVPa/8wl9o5pd6/g==
X-Received: by 2002:a05:6a20:b811:b0:1aa:6a28:cf6e with SMTP id fi17-20020a056a20b81100b001aa6a28cf6emr154911pzb.48.1714491443415;
        Tue, 30 Apr 2024 08:37:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y26-20020aa7805a000000b006ea9108ec12sm577823pfm.115.2024.04.30.08.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 08:37:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <372d0822-2aff-4663-998a-31cd1db4ab4b@roeck-us.net>
Date: Tue, 30 Apr 2024 08:37:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (emc1403) Decode fractional temperatures.
To: Lars Petter Mostad <larspm@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 Lars Petter Mostad <lars.petter.mostad@appear.net>
References: <20240426141322.609642-1-lars.petter.mostad@appear.net>
 <56b04367-8b5a-4c73-a741-729c55daf83e@roeck-us.net>
 <558708ed-4a26-44bb-85f7-eb2f2ac943be@roeck-us.net>
 <CAC-Dm243rwTcRS2_p989yUoFUjDoR4p9NGE-8WwwmaA6=Ko+4w@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAC-Dm243rwTcRS2_p989yUoFUjDoR4p9NGE-8WwwmaA6=Ko+4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/30/24 04:11, Lars Petter Mostad wrote:
> On Sun, Apr 28, 2024 at 8:07 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On Sun, Apr 28, 2024 at 11:00:47AM -0700, Guenter Roeck wrote:
>>> On Fri, Apr 26, 2024 at 04:13:22PM +0200, Lars Petter Mostad wrote:
>>>> Decode all diode data low byte registers.
>>>>
>>> All ?
> 
>>> What about the following ?
>>>
>>> 2c -> 2e
>>> 2d -> 2f
>>
>> Also all other limit registers, and for those the write part is missing.
> 
> Yes, my intention was only to decode the (already non-zero) data registers,
> not the limit registers.
> 

We should really do all or nothing.

>>>> -   unsigned int val;
>>>> +   unsigned int val, val_lowbyte;
>>>
>>> FWIW, this is wrong. The upper bit of the high byte is a sign bit
>>> on emc1438.
> 
> Yes, I missed the sign bit in the datasheets. See my comment on patch for
> emc1438. If I withdraw the EMC1438 patch, this will work for the current
> chips with unsigned registers.
> 

Adding support for the new chip is desirable. Please don't drop it.

>>>        retval = regmap_read(data->regmap, sda->index, &val);
>>>        if (retval < 0)
>>>                return retval;
>>> -     return sprintf(buf, "%d000\n", val);
>>> +
>>> +     if (idx_lowbyte) {
>>> +             retval = regmap_read(data->regmap, idx_lowbyte, &val_lowbyte);
>>> +             if (retval < 0)
>>> +                     val_lowbyte = 0;
>>
>> This is an error and should be handled, not ignored.
> 
> My idea here was that if for some reason it manages to read the high byte but
> not the low byte, I don't break anything. The output will be the same as before
> the patch.
> 

No, you should handle the error.

>>> +     return sprintf(buf, "%d\n",
>>> +                    (((val << 8) | val_lowbyte) * (u32)1000) >> 8);
>>
>> The u32 typecast is unnecessary and would interfer with negative temperatures.
> 
> I put the u32 typecast there on the off chance that somebody will compile
> this with a compiler with 16-bit ints (uClinux?), as C only guarantees 16 bits
> for unsigned int. It would of course have to change if negative values are
> to be supported.

I don't even know if such a system exists, but if it does it won't build a Linux
kernel. It doesn't make sense to even try to support a system with 16-bit integers.

> 
> Is it acceptable to handle the low byte for data registers only?
> 
No, as mentioned above.

> Should it be kept unsigned only (if dropping emc1438 patch)?
> 

You should not drop the emc1438 patch. What I would suggest, though,
is to consider converting the driver to use the _with_info registration
API. That would simplify the code a lot and make it much easier to add
support for new chips and to add conditional support for signed temperatures.

Thanks,
Guenter

