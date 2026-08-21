Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BCE1E9B1A
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 02:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787277713; cv=none; b=bSA8ch2zVy3l0kyE2qRnfKwUdS/x7mp1+tFwSGJI2PeALSHPjQd1Z4LKPyQ6y4sg0kXCF/0XVmKWXUpCuP5JQRLx65VOLrxRP6kSA+R7sxrt5/q6rQ0v7dxPG8lli7CE1tMLM/9nZQZ/fcttFnDJmbkHQ1NnBKyMeXySUcNYj5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787277713; c=relaxed/simple;
	bh=4lnUFJLWnj2hDzaYx6oLw6pV+AMtceec5o57EJk7nAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovKFOJdEJ1b/PeFJ7j4vnwIgPC98OfYLaFBvQIjNe7n866nfsGrI+rqKPl1qlmPQ56qgzItp8ie7tKrdsCCR8bsEvPQOHkRecbUZHatKZEyBM8Fm67HV54m/2mfUZze38SdZdln8I6lCLAfUKljTdrhV0z4EhXZGBXvQ0vvFu0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu+xfwob; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu+xfwob"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-451d8064238so452847fac.3
        for <linux-hwmon@vger.kernel.org>; Thu, 20 Aug 2026 19:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787277711; x=1787882511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GFyIqmIo37Te13lPEl/2zml/WL1XE/teFuCYI7LyDs=;
        b=Nu+xfwobKTEXYsXR+3usPIZFi7T5ncu3Nz9jUvW+91FjB/XugVU/PSBO987XBO3Anf
         h/4Nucr94rohqt0Ihu7rdvF3ENY3FrDP9YKeBUoseIwFAlYF5rq/bmVmtRHvB75TdJCE
         0bJxEnIOkG60Oj3Qefa8LnraAsBiTCWpQzeC+eJ8E3XqZ3tRF4gAAjjOChsayjmJedf1
         VG8Q+qq9L1k8U9hQSoAsNb4wnZA/xQ/5Ym+7iSVgamrEE7odwmVTTeisnH5u59zzbq58
         T6qV4/TPlhteTIqdh97JAGav2N2aenwZdYncz23G033Pa8TPoQK4RjVWR54VKKsJNk9e
         Vxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787277711; x=1787882511;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+GFyIqmIo37Te13lPEl/2zml/WL1XE/teFuCYI7LyDs=;
        b=ZnoBAYqaaPwJDyZiFa/CVXz2VDkjlPAYuIWVRs3UnzqnjT3yEFoUVjjJ2NsgTfZ21i
         KZ/mgFHeSd0BK+O2FhXLegKSR4RY8MiQQN1n5HKDZQ5ee02w8IPa/XPjp9tC6g2ay0Gz
         64L2tUeL3xAQbDcPJ+oXaUOyi9QlrySTgm1Ovwl+ZUn44Hf5bk2fhUQdTuLnhCG6fsED
         0JaTxKcp8+OrtZA+cYFF0yCxqW+jmRJMnF40Av3Le9XXGhwpwNwYhV11Dc6JchPPH5J3
         BSPmW4WIJOrpUkoicuPPCUj5m0o6OTVLEtOocfwJq3Y/7IXuNkfzLd8FVsgCGyYABYv6
         u87A==
X-Forwarded-Encrypted: i=1; AHgh+RpQX8Pn96jcfeY1LvHe/nRi5YlqaWgsZn6pcxmnJ1+dStOCjZOLUlIKeqguvmhXwlLx6DcqGvMDdZa0BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/E0NoIzzOqtL/M3STKYC0+BXXIWfrtVt0dsKIpQ+Q2Wcgaiv2
	7XBKQ9nZ7iwCcoTprfZuZ8ae0q0pPPpOrFhdeLUbPauuFwPsXQBsQwos
X-Gm-Gg: AR+sD101HE/jPyAd30HzbZmMZhc0/+fLIIlNaC7maVb9H7PeIP/61P4tsJMQIffXWL8
	XUuRf8Oacrg3/ch6aoz6Inj386qNlKhhyv0KDp1BYlYENUTPbPJq9IXTPSYGRuoIxcsp2bccqc5
	xw1AV/fZGCh756tgpLV94P+yWljwvVkNRid0Whqa/NraPKb3bwcdlbuvNlQTLhY+9DNJViyVvq/
	ZfHk+X7B7GWHURInqfdfE6OLD4d+KYcRTBxis144HtvMmARidWTk9HdIY4d/WnXOcNLMBgRyCwY
	4u+FZcq7lD6GUic6v8tMsGiSj+fGLa5TeVxnHOQAcxdRuvrNjiontPV0ZgmsdI35iD91gMBKIzN
	KGHAVuMl5RJwVPoiBqaTk6PCGt1K3CmoHHcU5we7I6+0UcUSo/ruKuykxQ9sE84uhTefLNpsSkE
	wZVvXTi0q2LZrDHh3kd/geVtkNTRig+UZUE0cvOmMg3hLVTY43eU+EJ2751z9VSM7UkUo/bR9mG
	GD1tdVZG7PKpX2YMYc1mWGATKiUY5exzmTfPA==
X-Received: by 2002:a05:6820:5711:10b0:6b0:4c0b:4832 with SMTP id 006d021491bc7-6b1591cf1fdmr2823449eaf.2.1787277710884;
        Thu, 20 Aug 2026 19:01:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416ad564bcsm22623466c88.5.2026.08.20.19.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 19:01:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <86fb8015-cb78-4285-8a84-6ea617afb920@roeck-us.net>
Date: Thu, 20 Aug 2026 19:01:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (starfive-fan-tach) Add fan tach driver for
 StarFive JHB100
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20260819091601.41077-1-changhuang.liang@starfivetech.com>
 <20260819091601.41077-3-changhuang.liang@starfivetech.com>
 <033d3490-9848-436f-a7ad-e6ab73768031@roeck-us.net>
 <ZQ4PR01MB12025F1BFB7E3F897228AA40F2A42@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <9fc113e5-e56c-4e9f-8b29-914f39503b0f@roeck-us.net>
 <ZQ4PR01MB1202A9B4F415BE121B6984B0F2A32@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ZQ4PR01MB1202A9B4F415BE121B6984B0F2A32@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/26 18:06, Changhuang Liang wrote:
> Hi, Guenter
> 
> Thanks for the review.
> 
>>>> On 8/19/26 02:16, Changhuang Liang wrote:
>>>>> Add fan tach driver for StarFive JHB100 SoC.
>>>>>
>>>>> The controller supports up to 16 independent fan tachometer inputs
>>>>> and reports fan speed in RPM through the hwmon sysfs interface,
>>>>> along with stall and low-speed alarms.
>>>>>
>>>>> For this controller, the special clock and reset operation sequence is:
>>>>>     probe: clk_prepare_enable() than reset_control_deassert()
>>>>>     remove: clk_disable_unprepare() than reset_control_assert()
>>>>
>>>> s/than/then/
>>>>
>>>>>
>>>>> Co-developed-by: William Qiu <william.qiu@starfivetech.com>
>>>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>>>> Signed-off-by: Changhuang Liang
>>>>> <changhuang.liang@starfivetech.com>
>>>>> ---
>> ...
>>>>> +
>>>>> +static int starfive_fan_tach_hwmon_read(struct device *dev,
>>>>> +					enum hwmon_sensor_types type, u32 attr,
>>>>> +					int channel, long *val)
>>>>> +{
>>>>> +	struct starfive_fan_tach_data *priv = dev_get_drvdata(dev);
>>>>> +	int ret = 0;
>>>>> +
>>>>> +	switch (attr) {
>>>>> +	case hwmon_fan_fault:
>>>>> +		scoped_guard(mutex, &priv->lock) {
>>>>> +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
>>>>> +				writel(STARFIVE_FAN_TACH_STALL_INT(channel),
>>>>> +				       priv->regs + STARFIVE_FAN_TACH_STATUS);
>>>>> +				/* clear fan_stall first */
>>>>> +				priv->fan_stall[channel] = 0;
>>>>> +				reinit_completion(&priv->comp_stall[channel]);
>>>>> +				priv->armed_stall |= BIT(channel);
>>>>> +			}
>>>>> +
>>>>> +			starfive_fan_tach_ch_stall_unmask(priv, channel, true);
>>>>> +
>>>>> +			/* Waiting for hardware to measure */
>>>>> +
>> 	wait_for_completion_timeout(&priv->comp_stall[channel],
>>>>> +						    2 *
>>>> STARFIVE_FAN_TACH_TIMEOUT_JIFFIES);
>>>>> +
>>>>> +			starfive_fan_tach_ch_stall_unmask(priv, channel, false);
>>>>> +
>>>>> +			scoped_guard(spinlock_irqsave, &priv->irq_lock) {
>>>>> +				priv->armed_stall &= ~BIT(channel);
>>>>> +				*val = priv->fan_stall[channel];
>>>>> +			}
>>>>> +		}
>>>>> +
>>>>
>>>> I'd really be interested to see how long it takes to read the alarm
>>>> and fault status of all fans. And, yes, Sashiko has a point: the
>>>> attributes are supported to report a sticky status, not something
>>>> that is calculated on the fly. Is this based on some heuristics ? I
>>>> don't claim to understand how fault and min_alarm are calculated. A
>>>> comment in the code describing how this works would be helpful.
>>>
>>> There is no real calculation for fault and min_alarm, the hardware
>>> simply counts the corresponding pulses within a specified time period
>>> and reports the counts via interrupt when the counting period expires.
>>> I will try to modify it so that the previous statistical result is
>>> recorded, and when reading, the previous result is returned,  thus
>> eliminating the need to wait for the measurement.
>>>
>>
>> So how long does it take to execute the "sensors" command with 16 active
>> fans ?
> 
> # time sensors
> starfive_fan_tach-isa-0000
> Adapter: ISA adapter
> fan1:           FAULT  (min =  300 RPM)
> fan2:           FAULT  (min =  300 RPM)
> fan3:           FAULT  (min =  300 RPM)
> fan4:           FAULT  (min =  300 RPM)
> fan5:           FAULT  (min =  300 RPM)
> fan6:           FAULT  (min =  300 RPM)
> fan7:           FAULT  (min =  300 RPM)
> fan8:           FAULT  (min =  300 RPM)
> fan9:           FAULT  (min =  300 RPM)
> fan10:          FAULT  (min =  300 RPM)
> fan11:          FAULT  (min =  300 RPM)
> fan12:          FAULT  (min =  300 RPM)
> fan13:          FAULT  (min =  300 RPM)
> fan14:          FAULT  (min =  300 RPM)
> fan15:          FAULT  (min =  300 RPM)
> fan16:       1800 RPM  (min =  300 RPM)
> 
> 
> real    0m4.865s
> user    0m0.023s
> sys     0m0.001s
> 
> 
>> ...
>>>>> +
>>>>> +	for (index = 0; index < count; index++) {
>>>>> +		u8 ch = tach_ch[index];
>>>>> +
>>>>> +		if (ch >= STARFIVE_FAN_TACH_CH) {
>>>>> +			dev_warn(priv->dev, "Invalid tach-ch %d, skipping\n", ch);
>>>>> +			continue;
>>>>
>>>> This should also return an error. Also, this is the only use of
>>>> priv->dev, and
>>>> priv->dev == dev. priv->dev is therefore unnecessary.
>>>>
>>>
>>> Thank you for pointing that out. I noticed that the `struct device
>>> *dev` passed in the function
>>> starfive_fan_tach_create_fan() is somewhat redundant, so I plan to
>>> remove it directly and keep `priv->dev` instead.
>>
>> Just for use in this function ? Why ? It is not used after probe.
> 
> After probe, priv->dev is also used. In the starfive_fan_tach_create_fan() function,
> priv->dev can be used directly as well, so I plan to simply remove struct device *dev.
> 

Are you checking if I pay attention ? starfive_fan_tach_create_fan()
is called from the probe function, not "after" probe.

Guenter

