Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E9523D291
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Feb 2026 15:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770651875; cv=none; b=czG264SAHHq00hHVWvz/8hSusNaqsxuB5aw0yC5wm7O3tauzX9hlyZbtM8rcp90O0WfetQRtnUqDESBA4ESkncnTZHEfjmA5EZdAEYY2xluANI8iExkBsNxS/Qnh5RsbSoaZSmOUpXA0WBSmMfudGOBvD7/JnUf1nUZQeK8IXxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770651875; c=relaxed/simple;
	bh=KbQ1DR7eIjUwgWiTwhYGN3wCp8ERiDAQnoS/oIvZWRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cO5ODq/N8DxYyQaPL8TXvAew3dILFGVyO4EQ7rMfMOo8JHnEQ0LMHUoCZpBG2eIRyxiVFQ+Ta39CJNtWXmPaNtfSAk500fvWc21CRTiLoOaoVYinfEvsIzfmlJ1+H9m2OzYpGXJH6FtDYE/MJSnj1q3tzbICu7pioY0so16DxFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbQRsvgK; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbQRsvgK"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12721cd256bso579550c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Feb 2026 07:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770651874; x=1771256674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=c3Bl4JPOZwyRHkiDx2Lqy82QSiWS6py48zegDEINFNE=;
        b=hbQRsvgKwkoly4XJKwJvOa447rzBIeREH+LMd8vQPsFFy6mFgj1X1/lJh9VYYnwKWi
         nwKuqnKYNsxI2WNXMsqhssmJ0bR+TGDE73wHJMvl7BTuAr6kJB8liayXQhiWlZdYqGIF
         RczVX2OOI1h9h6pvgv5bavUpW5JTtgNBaWTRihnecfXTcm/IqJX/DgsIkrgFvdZlo4cY
         BhmCKl1CVzJkdtLYicqc2GsC+9tm2O58RcFdQeLhCkaiz1fhn7FrWkeYnHEIaOTVW294
         SHR371XOmz5v34YihU7bOp2+O8QqtKvA5Wdr+n5mVe4f9bqrfS3k/hpE1leXpVukQqF6
         F5OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770651874; x=1771256674;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3Bl4JPOZwyRHkiDx2Lqy82QSiWS6py48zegDEINFNE=;
        b=wPnCaPbFWtBH7lP5uF1Yxyki9UcGQ7DxXwVzhpbsjnUnXNN2gy9XXPhvJybxFRd6Bl
         Pcs261jl2K5FlVmqnnIGnUmHWQyjSakMOFSqecTMFqQc9W3ainyOGxeerOTcEbTcA4eP
         9YCuk5vUfVAZo+e0ELf3+QM5MQ7jh3/miQ8My91m2otdfcG0fAGExTTxmUrvG0pYrsoT
         bOGCvt7PNnxwAjGOAuR4bu8R+VNHcShyxa38Ygn0qT+j7SDEYX79Nu3lL4nXAW/y3lZa
         gL3h8ZaIPSBbWhC23Ckx/s4arf3jkVsjj98rAt7jlryGpMed7GcV+rdAR3L9J4SvVsm5
         /vzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXD3vOBDrWJ/YDMPzdzA+9CYxdGLYgqxForXdu1Buz9bKSZZOol482c+5OZ4IeNxPKaKTBOxzi97N2ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVw8ZqZpwfcmkcdPgWDVGDsyzYKURibopTdV9Zy5Ist9183Vi8
	7Q5Ih2IcBjb+stQKaKW5ahQcVuu+/Cs71Cl74Cnd+zJrRDvL450IC4q5
X-Gm-Gg: AZuq6aKBfpExHu4RcXll7yWQqOnqz0CDXf5dn+MLowsXk/TsRjCzNllzgX/iX7RVLM6
	b0eRl6AsbqNh2zv4a9GLAIdGlUnxrgnPIuTe9tFI1jwm0cqr2DPjEy8hcS5aSaS7AEIsEL+rjNd
	lacnjjUN7/rTSueaiP6jhbUZqDnfnLT+vTSoVUaka/geIxdfejs8i2k3sMg4PnRjatNsYjc7KjW
	x7zb0/aMxQ6P3EWQwJMW3LdmlGvksCq3np5coBVq8R8G7svAdZAzwiPKlk73bfyLG6QX9Fb4/AN
	03563VQyp14lqx9wSr5PLm6LlxNzqQCKEqCiwIzrc4K2ia+Q4McwJMVkkUUAX83d+5IRMW0cJbG
	RlncbMywi+XvD3KMEjsdrypT/8CO1aJeEoWeb01rdrX2gHhMLEwUw4KLJSGfnF97pXvZW4DTJbd
	jykfwNHdVAldC/VpIQnD966c6wDiACdbBeMkB8dAoDWwyJCzVeHpWgJlvcm7iV
X-Received: by 2002:a05:7022:6997:b0:11d:f440:b757 with SMTP id a92af1059eb24-12703fcfed1mr5405150c88.26.1770651874127;
        Mon, 09 Feb 2026 07:44:34 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1270414f28bsm9681347c88.0.2026.02.09.07.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 07:44:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c640192d-e0ca-49ce-8316-b6216a9a18f8@roeck-us.net>
Date: Mon, 9 Feb 2026 07:44:30 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] hwmon: pmbus: mpq8785: force direct mode for VID
 VOUT on MPQ8785/MPQ8786
To: Carl Lee <carl.lee@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, peter.shen@amd.com, colin.huang2@amd.com
References: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
 <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-3-3744cd9b2850@amd.com>
 <07c39c3e-f82d-4ec0-b7fc-6ca9721d246d@roeck-us.net>
 <aYl+pTlG9rEuE59h@carl-amd>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <aYl+pTlG9rEuE59h@carl-amd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/8/26 22:28, Carl Lee wrote:
> On Thu, Feb 05, 2026 at 08:58:37AM -0800, Guenter Roeck wrote:
>> On Thu, Feb 05, 2026 at 06:01:39PM +0800, Carl Lee via B4 Relay wrote:
>>> From: Carl Lee <carl.lee@amd.com>
>>>
>>> According to MPQ8785/MPQ8786 datasheet, VID mode configuration is
>>> the same as direct mode configuration. Therefore, when VOUT is
>>> reported in VID mode, it must be forced to use direct format.
>>>
>>
>> Why "must" ? Yes, the LSB is the same, at least for MPQ8785,
>> but that doesn't mean that the mode _must_ be overwritten. Maybe
>> I am missing it, but as far as I can see the datasheet doesn't
>> say that the VID mode configuration is the same as direct mode
>> configuration. It says that the _LSB_ is the same for both modes.
>>
>> I _think_ the problem may be that the output voltages are not really
>> reported as VID values but as raw voltages, but the datasheet is a bit
>> vague in that regard. It talks about LSB values but doesn't exactly
>> say how voltages are reported, and for READ_VIN it is most definitely
>> wrong ("This bit is in VID mode with 25mv/LSB" doesn't make any sense).
>>
>> Thanks,
>> Guenter
> 
> Thanks for your feedback. I see your point about “must.”
> The datasheet only says the LSB is the same for VID and direct modes;
> it doesn’t state that VID mode configuration is identical to direct mode.
> 
> Based on current hardware testing where the chip reports VOUT Mode as VID,
> Observations on actual hardware:
> 
> 1.Without forcing the mode: driver fails to initialize.
> dmesg | grep -i mpq8785
> mpq8785 58-0046: Failed to identify chip capabilities
> 

Wrong conclusion. That message means that the chip reports to be in VID mode,
while the configuration data disagrees.

That has nothing to do with how voltages are actually reported by the chip.

As it turns out, mpq8785_identify() already translates VID mode to direct
mode. Here is the real problem: The identify function knows that VID mode
is handled wrongly by the chip, and configures the driver for direct mode.
pmbus_identify_common(), however, does not take that into account and bails
out if the mode read from the chip does not match the configured mode.

That is what needs to be fixed, and until I find a cleaner solution the
patch is indeed acceptable. However, the above needs to be explained in
a comment and in the patch description.

Thanks,
Guenter

> 2.Forcing direct mode: voltage readings are consistent and as expected.
> cat /sys/bus/i2c/devices/58-0046/hwmon/hwmon2/in2_input
> 3293
> 
> This suggests that the issue is related to how the chip reports voltages in VID mode,
> rather than a datasheet requirement to overwrite the mode.
> I’ll revise the patch and update the wording accordingly.
> 
> Thanks,
> Carl
> 
>   
>>> Signed-off-by: Carl Lee <carl.lee@amd.com>
>>> ---
>>>   drivers/hwmon/pmbus/mpq8785.c | 20 ++++++++++++++++++++
>>>   1 file changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
>>> index f35534836cb8..d6624af076c3 100644
>>> --- a/drivers/hwmon/pmbus/mpq8785.c
>>> +++ b/drivers/hwmon/pmbus/mpq8785.c
>>> @@ -48,6 +48,25 @@ static int mpq8785_identify(struct i2c_client *client,
>>>   	return 0;
>>>   };
>>>   
>>> +static int mpq8785_read_byte_data(struct i2c_client *client, int page, int reg)
>>> +{
>>> +	int ret;
>>> +
>>> +	switch (reg) {
>>> +	case PMBUS_VOUT_MODE:
>>> +		ret = pmbus_read_byte_data(client, page, reg);
>>> +		if (ret < 0)
>>> +			return ret;
>>> +
>>> +		if ((ret >> 5) == 1)
>>> +			return PB_VOUT_MODE_DIRECT;
>>> +	default:
>>> +		return -ENODATA;
>>> +	}
>>> +
>>> +	return ret;
>>> +}
>>> +
>>>   static int mpm82504_read_word_data(struct i2c_client *client, int page,
>>>   				   int phase, int reg)
>>>   {
>>> @@ -133,6 +152,7 @@ static int mpq8785_probe(struct i2c_client *client)
>>>   	case mpq8785:
>>>   	case mpq8786:
>>>   		info->identify = mpq8785_identify;
>>> +		info->read_byte_data = mpq8785_read_byte_data;
>>>   		break;
>>>   	default:
>>>   		return -ENODEV;
>>>
>>> -- 
>>> 2.34.1
>>>
>>>

