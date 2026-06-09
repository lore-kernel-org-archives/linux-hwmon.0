Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8608A3C2BBD
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 13:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010461; cv=none; b=DqWhnRqW+uOxZ+bnQYbQXXuCVqMWEKRFQWvi7SJPaZk+XqhktVtETs52UAL7/9E3GSiBBONVfninMGUOwir4c7iXjymEGAKvbe80jDoDjx1C1i2888UHjPQPZy70xALlC+E82225OPln3hTOhB2os58NpWXKAE6LPBN1ogthRAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010461; c=relaxed/simple;
	bh=3ycMzXX52tu1hH8aX5OAJ02tW/bfleA9mi59j9i47dM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HtBor233b/kuAkOhxxkZrPc0NOarNSa5oNs8Ep5oNOMRltBqL2vy9+WCUOQzgLB5/8HIoXPQST5mX0Q6YUfvyPZwR6wkvgJHJl2osTV+onbYTIxDY+r2gTUhy8JHT54xI4NPkR5bHTKYWod7yW09ESTlK6kjJF86P/e1WHxLqts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LqsKVgjU; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LqsKVgjU"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so3476806a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 06:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781010460; x=1781615260; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WCW/Qzq8M64DMdQXUlGLAakjwDS5MWfgbwD4SQdmfEU=;
        b=LqsKVgjUsYdyUMlKgDUbOtnPVgwe7PB3prOAhEztUZrYZghQRNk6nsBwIq/MnJTjKp
         d0zNSIRgYQQNmQm5coMgKF5p2pqri+jL39RBlGlMeVJH2vRdBzHfqipIExo3SoipJs9Z
         7g/kKt762k1L88m0DLBXp8ihFcKL3DToAWLFNftDZzuLNaXJ8s186xFMzU9VavTpODDB
         KGEwO2SUEmLFk0y3wgBABQ1WmxnljzXRVBN/NdYj6c2p4iFSYIf8+lxw5FZcDEw3lu92
         VkC65z4Vzw+g9OSNaqXwUSOJMyTYyXekJo57+IMZyThPfzezfY7b8P/uJmWf/mUEOpBR
         euCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010460; x=1781615260;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WCW/Qzq8M64DMdQXUlGLAakjwDS5MWfgbwD4SQdmfEU=;
        b=XRCoL37BCHHm/gs4+NubSlF6sVAdE4cyp9X2BwVRnS0sG/hDifVeuRJwrHFoSN10oU
         erObjaf01pHejBOQip/xTI5R51jbei55jQeK/lFuvvmJBZfO4Ky/FDOHTH1N3RucX1kL
         LKXuqot9haL4eA5arikQ3xNmvxshqwwkFviSQuJX16ID+butWBbSjPT/b0TP/XY7z9TH
         5p6PNVE48pskadUk4k447Hnw1OniCRk4dsqDhpzGQfyCRxIlTHaksQcX4FOxY7WxdJCF
         fePnzQ05QF3ZG/IWSydJ0d4xZjrXNBAhYhcKLg4KQynq8ewQtEeydve16rkBuZJvQIG+
         wnZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+is7Ys1fPJrfYd8vp43k91oS78+nnsxpGzvk9V6/Y0KCqTU5NZT39WvWTrflTbzQCa70xUx07LmR/jng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz47sRjoKN/xbB96DTa1zUi0CXj2ZeJzJTqNG/fiVFvlspepJ2l
	xiW1YuSHSTgJhm4bvgAUFTxV1IufnI6/xxzhkQhpGKHoHMJPH8d59T90
X-Gm-Gg: Acq92OF/hD5ATzHgm716EVGZgTugcVQ0zndK7yIGRMXLur/fYwUojU5PGHz0JBOlFhn
	JLVpfk3qrpeaE2014imbrTrW6PLr3HqytpPZ6E3r1HUFi4hadRCk4L1EkuQjK7EUAID5/XwTvK1
	EeqxfiScO6h8Q3gpvj+cx8yGD2kj+QY4XUTcUcFZZ2ijKsMhCd1mwL7IoBZqL5ymjWf7ovZ+yBp
	m0cRumcfNAQwwBissw8ZpRqteTLxzuxa0e8hETLGqGdaRCwGDpF0LJjSZDI+q93TXMn1dmgHeDj
	/MKBl09QudIem3AXjCwo8SUvXCqsSbjt4cRBow2xeYJWKmG62/3U29yC8cm+UfLYvj5oZVxtfsm
	9O7zkHjM+6eM8cwjFols0FQPZL5u+dn8utFhgazDuFNR33fA06TGzccTdLuvo61EHWTpMhDPSvl
	ZKBpddf9nsw08t/+DtjnIyPeckj+Qu43TO/FkgAVBW+qKPFbjUY8KoEG4LPQ46+9BtQbb8VM0aL
	iAVmDiL6rU=
X-Received: by 2002:a17:90b:4fc6:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-3713113c245mr15187614a91.6.1781010459727;
        Tue, 09 Jun 2026 06:07:39 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm24133477a91.1.2026.06.09.06.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:07:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <85185e61-f9fa-4183-927d-8d7f4e8d4a2e@roeck-us.net>
Date: Tue, 9 Jun 2026 06:07:38 -0700
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
 <aigLddl1zeqM3gX0@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aigLddl1zeqM3gX0@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/9/26 05:50, Nuno Sá wrote:
> On Mon, May 04, 2026 at 10:51:12AM +0100, Nuno Sá wrote:
>> On Sat, May 02, 2026 at 09:21:15AM -0700, Guenter Roeck wrote:
>>> On 5/2/26 03:43, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>> - [Medium] Read-modify-write operations on hardware alarm and fault log registers will cause concurrent events to be lost.
>>>> --
>>>>
>>>> commit 768d24f774b79f50e1444b93b756d7bda5873159
>>>> Author: Nuno Sá <nuno.sa@analog.com>
>>>>
>>>> hwmon: ltc4283: Add support for the LTC4283 Swap Controller
>>>>
>>>> This commit introduces driver support for the Analog Devices LTC4283
>>>> Negative Voltage Hot Swap Controller. It adds functionality to monitor
>>>> voltage, current, power, and various hardware faults via an I2C interface.
>>>>
>>>>> diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
>>>>> new file mode 100644
>>>>> index 000000000000..d8931c9a4685
>>>>> --- /dev/null
>>>>> +++ b/drivers/hwmon/ltc4283.c
>>>>
>>>> [ ... ]
>>>>
>>>>> +static int ltc4283_read_alarm(struct ltc4283_hwmon *st, u32 reg,
>>>>> +			      u32 mask, long *val)
>>>>> +{
>>>>> +	u32 alarm;
>>>>> +	int ret;
>>>>> +
>>>>> +	ret = regmap_read(st->map, reg, &alarm);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>> +	*val = !!(alarm & mask);
>>>>> +
>>>>> +	/* If not status/fault logs, clear the alarm after reading it. */
>>>>> +	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG)
>>>>> +		return regmap_write(st->map, reg, alarm & ~mask);
>>>>
>>>> Could this read-modify-write sequence cause concurrent hardware events to be
>>>> lost?
>>>>
>>>> If these alarm registers use write-0-to-clear semantics, writing back
>>>> alarm & ~mask will inadvertently write a 0 to any new alarm bits that were
>>>> asserted by the hardware between the regmap_read() and regmap_write() calls.
>>>> Usually, a direct atomic write of ~mask without reading first is preferred
>>>> to avoid clearing unrelated active alarms.
>>>>
>>>
>>> Sashiko comes back to this one. Looking this up in the datasheet, it says
>>> that alarm bits are reset by writing 0 into the alarm bit. That isn't
>>> what is done here, though. It will write 0 into any alarm bits which were
>>> not set when the register was read.
>>>
>>> Should this be something like the following instead ?
>>>
>>> 	alarm &= mask;
>>> 	*val = !!alarm;
>>>
>>> 	if (reg != LTC4283_FAULT_STATUS && reg != LTC4283_FAULT_LOG && alarm)
>>> 		return regmap_write(st->map, reg, ~alarm & 0xff);
>>>
>>> That would ensure that only the checked bit is cleared, and that it is only
>>> cleared if the bit was set when it was read.
>>
>> I'll have to check the above. I gave it a bit more thought and as it is, it
>> should not be a problem. Because even if we (in the edge case) end up
>> clearing an alarm that came after that regmap_read(), if the condition
>> persists in the next conversion, we'll have it set again. Yes, we still
>> loose one historical alarm but not something will be forever lost at
>> least.
>>
>> Having said the above I do agree with your proposed change, but I need
>> to see how the HW "behaves". I'm afraid that if we just write 1's into all
>> of the alarms we're not checking we create a window where reading the
>> register again will, falsely, indicate the alarm is present. If the
>> read happens before a new conversion was done (note that if all the
>> channels are enabled we actually have seconds for a new conversion to
>> go though all channels).
> 
> Hi Guenter,
> 
> I got time for this again and apparently my concerns were valid. As it
> turns out the chip is not "smart" enough:
> 
> root@analog:/sys/class/hwmon/hwmon1# cat in5_max_alarm
> 0
> root@analog:/sys/class/hwmon/hwmon1# cat in5_max_alarm
> 1
> 
> And you can imagine the outcome of running `sensors` :)
> 
> So I guess we have to leave this as-is.
> 

Outch :-(.

Oh well, that can't be helped. Should I apply the series as-is (v13) ?

Thanks,
Guenter

