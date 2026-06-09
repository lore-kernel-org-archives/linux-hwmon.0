Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675E221B9F6
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018437; cv=none; b=JefAp5B40vO8F4Kxw806N5bCMbNfpGfUnCbTO7SIPQhserQQc+KxQzW2vWEPVzkw3FZB0njh0j0Io2CsiDa7vgg9ZD84dMKQxCUbZ3caKmwVUQu5gdb86t1CTRdHU0DdeFylFwtr8w2pffvYa26O249QWOtkQtFVdoCl2lkQKq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018437; c=relaxed/simple;
	bh=4tg7iEqL8ZqC8kkq+6MZsLsPmrgP14IUNx66MGcPRkY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sz/PWVfLchV1HK3GsZ12t0qJJ+PDxBMsPdmBCup10oUCjJTtLHVhyx4oFGbiwBD+CMrKvhZ1rxYojBsVTqH6xUS5OLLmwpupZCaMpzIcdaSp0bTq5ek3k7sThjLerPQ1FrJvArXFDjlwmB/OPv7k+XZRgq5o318MIoTVpM+Sqd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jn5Vcajl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jn5Vcajl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2d792c8so38239525ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781018436; x=1781623236; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+eeQRi37NSrVxflcw5hkhFrO4dus4rzUhno+ORzR9k=;
        b=Jn5VcajlTArk/PFqtDX2+qXmlpW4Wbht16Q/nPSeinO4YTjD2WHfXMtrmx29kqicQe
         CoLsp2akRndpc2Iv0RWd74Gg6qGRCOaaSX57FMQfjDS7L9+2BR13vuLxkMK+pLVIAG5T
         FBV4lAxglXaCObCQvmy0gfL61FvsLVbrOrjilwS6bFPg92wY9IjRo0d1B2fQfoKEaS57
         jfXSkk9367t2SCUb3s/VBqUaOXJZa9wRtc0Klewwch4IQy77kTTDkkHlCPVfoUncpLkK
         RvbTRw8iEAIm2q5XmJPT4M2+lIP9Ihh58ib5+UmrQIulieNyEHtdokLIpBM1kl5g2bkL
         R/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781018436; x=1781623236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y+eeQRi37NSrVxflcw5hkhFrO4dus4rzUhno+ORzR9k=;
        b=cuTxMtTr2YASEsEUCj+zCC6oY3/I3nmHB3gK86QBm78SifHhAlk5UBR3eIuYzHjsRR
         N1XizvIqrphnupWn1XLjdDDtRqpovscj2+K4F/MGC2uuwkhTy71OW/w1VEuUJ9cgAmva
         K0YONB3nr4cwv5G/+xTn5qXXLvAyhaPniWV4B1xew4MKE3S2d/aSGbSci/qmagXF6k2M
         Rh8mNtCMVluHPrGP1z11dzeFMj7ZxGwirPVQ3YGrTLfW3wSn/XENBSWt8xiAJewgEcHB
         /lOjCfSCDfNoe/5vNO0QLtLWLJlCJgKVcbXR0mxDC2lwNy5nVM6bBL8UXWO1TGLsGPN6
         gVWA==
X-Forwarded-Encrypted: i=1; AFNElJ/ysSqKq6f7Se+m/40c5EHR+5atMpMiFzyMujgpquB3Dqlf0WdAMtwIw00RTzSz36EBEE8gF61t9/HEpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMbDaFoYI3lsodGU+46yCLHdHaAz9QcePinB6xYSTDppJzV5qG
	RRLt1O0KUczx/rPGMU4IySsprUjhu3jM/m6G71wOtlUyGaxKiiDgSbxW
X-Gm-Gg: Acq92OFlrYqwi1CaKodjOmFCtvOwRq4mdzQGjCBJn/OEut2uXZnglVFaGM13Fp3OsAg
	hohAg9oNWFzfOWfrXaqgPZax8i4YcG5uhV7wy64/oofOxJvMzAXrXYybA1Z0gtztiN56BCpzzCQ
	9YOCKSseXL423Abz+fZaXswmwDVzZhVScHNB6wXFo0IGvDcdDUSq4TowHGhf1nIJrH2DdYe3mGJ
	UPuY7zNEd9F13dHUazOfI2SLX/Gph0Y+Sd7G6cf39m9JXx1jK6yZQwzoMpjOKe3vIBYMfIcVbLS
	qSwcSAIZPLZH2pdR20K/jbHmuE5AsHJgugdy2Ad6Zz5s2ZseADbaLaAhdksWha7jYavLAJzj5ZF
	rzfsgsE5zd1GH++ekaRGgsCu8Xu/2KvCcngkGXEE+r4F3iA3+rDVw0TMmTEeMYmjVgS2pPoOaNS
	oQj24hJcdHI9y+kNh/LvX77IjHVTBie+8Ct8iQerIJi722eILg1iEz28qRNl6TkBLXLDruGZo6H
	Wg4XD4fdB0FmM19IEiDJQ==
X-Received: by 2002:a17:903:44cb:b0:2bc:b80f:677e with SMTP id d9443c01a7336-2c1e80cd382mr153146575ad.25.1781018435640;
        Tue, 09 Jun 2026 08:20:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629cfb4sm227841275ad.59.2026.06.09.08.20.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 08:20:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9e1e0ac3-f92d-4b5f-8d76-aeda24f56acd@roeck-us.net>
Date: Tue, 9 Jun 2026 08:20:32 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: =?UTF-8?Q?Nuno_S=C3=A1_via_B4_Relay?=
 <devnull+nuno.sa.analog.com@kernel.org>, linux-hwmon@vger.kernel.org
References: <20260502-ltc4283-support-v13-2-1c206542e652@analog.com>
 <20260502104311.0D48EC19425@smtp.kernel.org>
 <3044ffed-b9a8-4a30-852e-2689b0cf0118@roeck-us.net> <afhpmO_FW6nYtHXK@nsa>
 <aigLddl1zeqM3gX0@nsa> <85185e61-f9fa-4183-927d-8d7f4e8d4a2e@roeck-us.net>
 <aige5END74wK3ENh@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aige5END74wK3ENh@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/26 07:12, Nuno Sá wrote:
> On Tue, Jun 09, 2026 at 06:07:38AM -0700, Guenter Roeck wrote:
>> On 6/9/26 05:50, Nuno Sá wrote:
>>> On Mon, May 04, 2026 at 10:51:12AM +0100, Nuno Sá wrote:
>>>> On Sat, May 02, 2026 at 09:21:15AM -0700, Guenter Roeck wrote:
>>>>> On 5/2/26 03:43, sashiko-bot@kernel.org wrote:
>>>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>>>> - [Medium] Read-modify-write operations on hardware alarm and fault log registers will cause concurrent events to be lost.
>>>>>> --
>>>>>>
>>>>>> commit 768d24f774b79f50e1444b93b756d7bda5873159
>>>>>> Author: Nuno Sá <nuno.sa@analog.com>
>>>>>>
>>>>>> hwmon: ltc4283: Add support for the LTC4283 Swap Controller
>>>>>>
>>>>>> This commit introduces driver support for the Analog Devices LTC4283
>>>>>> Negative Voltage Hot Swap Controller. It adds functionality to monitor
>>>>>> voltage, current, power, and various hardware faults via an I2C interface.
>>>>>>
>>>>>>> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..d8931c9a4685
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/hwmon/ltc4283.c
>>>>>>
>>>>>> [ ... ]
>>>>>>
>>>>>>> +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
>>>>>>> +			      u32 mask, long *val)
>>>>>>> +{
>>>>>>> +	u32 alarm;
>>>>>>> +	int ret;
>>>>>>> +
>>>>>>> +	ret = regmap_read(st->map, reg, &alarm);
>>>>>>> +	if (ret)
>>>>>>> +		return ret;
>>>>>>> +
>>>>>>> +	*val = !!(alarm & mask);
>>>>>>> +
>>>>>>> +	/* If not status/fault logs, clear the alarm after reading it. */
>>>>>>> +	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG)
>>>>>>> +		return regmap_write(st->map, reg, alarm & ~mask);
>>>>>>
>>>>>> Could this read-modify-write sequence cause concurrent hardware events to be
>>>>>> lost?
>>>>>>
>>>>>> If these alarm registers use write-0-to-clear semantics, writing back
>>>>>> alarm & ~mask will inadvertently write a 0 to any new alarm bits that were
>>>>>> asserted by the hardware between the regmap_read() and regmap_write() calls.
>>>>>> Usually, a direct atomic write of ~mask without reading first is preferred
>>>>>> to avoid clearing unrelated active alarms.
>>>>>>
>>>>>
>>>>> Sashiko comes back to this one. Looking this up in the datasheet, it says
>>>>> that alarm bits are reset by writing 0 into the alarm bit. That isn't
>>>>> what is done here, though. It will write 0 into any alarm bits which were
>>>>> not set when the register was read.
>>>>>
>>>>> Should this be something like the following instead ?
>>>>>
>>>>> 	alarm &= mask;
>>>>> 	*val = !!alarm;
>>>>>
>>>>> 	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG && alarm)
>>>>> 		return regmap_write(st->map, reg, ~alarm & 0xff);
>>>>>
>>>>> That would ensure that only the checked bit is cleared, and that it is only
>>>>> cleared if the bit was set when it was read.
>>>>
>>>> I'll have to check the above. I gave it a bit more thought and as it is, it
>>>> should not be a problem. Because even if we (in the edge case) end up
>>>> clearing an alarm that came after that regmap_read(), if the condition
>>>> persists in the next conversion, we'll have it set again. Yes, we still
>>>> loose one historical alarm but not something will be forever lost at
>>>> least.
>>>>
>>>> Having said the above I do agree with your proposed change, but I need
>>>> to see how the HW "behaves". I'm afraid that if we just write 1's into all
>>>> of the alarms we're not checking we create a window where reading the
>>>> register again will, falsely, indicate the alarm is present. If the
>>>> read happens before a new conversion was done (note that if all the
>>>> channels are enabled we actually have seconds for a new conversion to
>>>> go though all channels).
>>>
>>> Hi Guenter,
>>>
>>> I got time for this again and apparently my concerns were valid. As it
>>> turns out the chip is not "smart" enough:
>>>
>>> root@analog:/sys/class/hwmon/hwmon1# cat in5_max_alarm
>>> 0
>>> root@analog:/sys/class/hwmon/hwmon1# cat in5_max_alarm
>>> 1
>>>
>>> And you can imagine the outcome of running `sensors` :)
>>>
>>> So I guess we have to leave this as-is.
>>>
>>
>> Outch :-(.
>>
>> Oh well, that can't be helped. Should I apply the series as-is (v13) ?
>>
> 
> If there's no more concerns from you, I would say so. If I eventually
> have the time, I should apply some of the outcome from this series to
> the ltc4282 driver.
> 

Ok, I'll do that.

Thanks,
Guenter

