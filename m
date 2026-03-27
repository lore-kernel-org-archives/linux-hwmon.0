Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A9D3E716B
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 17:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774632600; cv=none; b=M0KdAGaJJriHzK628Eg+lcrDyg+63Ske18ZaEG+T3s236JBfDud1tjWC5KocTGghd/QkPLKuV9K2CyidLWENT9vqyQPWY8TXwX3ocCnOgjw0nceon5Z0EKZOeIICSIVe0w6Sv8ZkPWs9QkeG3RaavjnfoIPXAeDjHF4gSLbDwIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774632600; c=relaxed/simple;
	bh=R1VR1id3Nw+h00AdesdzKQTYNyeVNurIY2nfkMPZMAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ptoOjxTnBZ1AW4Okf+ugbkLo9uwrPl8qNRpWB+fyk3lv1o+DUo11kWk95FhXfl8t/DtNAjgM2e1vBc28rBjD4kqgkmqwpuv9fWravuJcNeXKhSEJrewiSsKrgkOWeE4mXjgGpQvaCYdKsqUX84ZGfoaR1l1eDgFB36BbCmXF6sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b53+ozIG; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b53+ozIG"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128b9b7e3edso1791593c88.0
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 10:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774632598; x=1775237398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UDtS8QqlK5zzaFhAZ3n9ypKXp4VLpAw5Q1WzjAwJ3kQ=;
        b=b53+ozIG/AtoDx1CkwtadKtwXXiNcp1zZKebelSB/ySkzp7IvOEmyTZS/1O5Ws97nA
         +pm1YzQLmV++iLDyUWl6U+SWkimAitIZzaukdcQm6gVZnztf7q464GWlPJboHWVw5XGM
         3dUxky7zGydma5lQSphZX8VX7lRPGcAQgRic2vcVUYxPU7qLY/whpzPSHhw1soWIvEOe
         Cey8QHqSzvcDEPVNiaANNfcvOJRV4D0n+HIBmJxAa6udEPs4Zuesx9gp5bwGE/myT2K0
         HjPPxM3HFExfUjyDEjoebnd9lfGctuYLJ91/qH41LOqzE3iORAQz3d4AkeOXuplRuMh9
         3fGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774632598; x=1775237398;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDtS8QqlK5zzaFhAZ3n9ypKXp4VLpAw5Q1WzjAwJ3kQ=;
        b=q9895U5UE8DChWkmNSUfFYDFca0OHxe66sS7NhsjfOVsjtcXpyV2w0JnMjKKc1MGO/
         vKP4pnf76HEvvpPgbwIN9FtnyRRbqIYZFXL1tZ+NkL6dRd9eS22zPYl/+x5ajneI/2Yy
         1g2I5eu9RI+1VHk/8/iGuzBGf/ZlOWhUKirjds/fIhTvLXo8BEWAGOei8zq+5ZQ8RtZx
         RuNKt6dmnS4VklwyEDdzresYlwl/Yks05GmFVjwjngeH5wMp+sIfeSmAB8Qmzan1xWag
         ZL8PxMUyvVaKnjXKDUtjd6S7LdgsTx2tnu22/fGxSabbDbyzbxb9eocIehfHCfoAU4ny
         rX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfHBbY+IsWkWsygowKm3JbeRnFZ5ScxQcT+tSuBod4fJZ39CMaoYpG35A0gEp3pRsGyjtqECaySeoCWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4BFwgYbFYTridgk9G2fuW+WCGQ00xEDDfJcYTI4/6ZrTsi3Bf
	xfHyEVoL8sJ+Kp+FMmMAK2TcjDBc9XxR0t0nm3qxgFSoUsYwQBHd77AQ
X-Gm-Gg: ATEYQzzGwclC6QHRj0oRNWQVnryhRSBj0zcRDRGIP8N+5OmXJy/3+N32m2hgIwxBRD0
	hHW/TBAWtE8CuFMWth9f23usxw+5NFxJwqVylvAv2Za88wX/U7bnY31cXqnBFFCA/CssU5bItv9
	m4wGX49Z2fdd0OnHW14InoNSpVHPHFU2ecTL6TS3oWfVcGgAfRdCeuChijwsQLPqOwOBOYuE2sJ
	V3hHtv9W3DzVjFeQN1BStvoeNvRofI86PBtTP/8zTqDlTxJT7tSXVxs1aA49lUfAcHm/KO6P3Nc
	Aux0xCzLEmFdqAyI7H/sKSHwp2pmnX+nc1A6F1VftAD7KN0vliEq9/hLxDN0thaPgKvXE9BQY9t
	Q9p6bCKOmo80kihH0W1/aaSXAkWBCzWxdcNBGJGedmawFi7pBJB3tPI6MTrmIblyVF4PkkvhjJq
	SUIltmhhLOJUHsfRkIApSTqj3kxrm8s7RoH8ppqQ2lZjYYjXWv2+aejogcwY7shc9M7ADCNITwI
	TqXovuPwbc=
X-Received: by 2002:a05:7300:641d:b0:2be:617:2ddf with SMTP id 5a478bee46e88-2c185e54c23mr1997402eec.16.1774632598247;
        Fri, 27 Mar 2026 10:29:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec4934asm5609052eec.8.2026.03.27.10.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 10:29:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <55c96f65-d462-4507-a1ef-c36df6d3b4d9@roeck-us.net>
Date: Fri, 27 Mar 2026 10:29:55 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] hwmon: temperature: add support for EMC1812
To: Marius.Cristea@microchip.com
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 linux-doc@vger.kernel.org, conor+dt@kernel.org
References: <20260310-hw_mon-emc1812-v8-0-bc155727e0d2@microchip.com>
 <20260310-hw_mon-emc1812-v8-2-bc155727e0d2@microchip.com>
 <f1e55e6e-a374-4b97-b1f3-706d627ebab5@roeck-us.net>
 <350d1d2bf73c11c2c311c4ae6bf1b8b423151113.camel@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <350d1d2bf73c11c2c311c4ae6bf1b8b423151113.camel@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/27/26 09:30, Marius.Cristea@microchip.com wrote:
> Hi Guenther,
> 
>     Thanks for the review, please see my comments below:
> 
> ...
> 
>>
>>
>>
>>
>>> +static int emc1812_init(struct emc1812_data *priv)
>>> +{
>>> +     int ret;
>>> +     u8 val;
>>> +
>>> +     /*
>>> +      * Set default values in registers. APDD, RECD12 and RECD34
>>> are active
>>> +      * on 0. Set ALERT pin to be in comparator mode.
>>> +      * Set the device to be in Run (Active) state and converting
>>> on all
>>> +      * channels.
>>> +      * Don't change conversion rate. After reset, default is 4
>>> conversions/seconds.
>>> +      * The temperature measurement range is -64°C to +191.875°C.
>>> +      */
>>> +     val = FIELD_PREP(EMC1812_CFG_MSKAL, 1) |
>>> +           FIELD_PREP(EMC1812_CFG_RS, 0) |
>>> +           FIELD_PREP(EMC1812_CFG_ATTHM, 1) |
>>> +           FIELD_PREP(EMC1812_CFG_RECD12, !priv->recd12_en) |
>>> +           FIELD_PREP(EMC1812_CFG_RECD34, !priv->recd34_en) |
>>> +           FIELD_PREP(EMC1812_CFG_RANGE, 1) |
>>> +           FIELD_PREP(EMC1812_CFG_DA_ENA, 0) |
>>> +           FIELD_PREP(EMC1812_CFG_APDD, !priv->apdd_en);
>>> +
>>
>> I assume it is on purpose that the defaults for EMC1812_CFG_RECD12
>> and
>> EMC1812_CFG_RECD34 deviate from the chip default (chip: enabled;
>> driver:
>> disabled).
>>
> 
> Yes, EMC1812_CFG_ATTHM was set in order for the alerts to be clear
> automaticaly when the limits goes back to normal.
> 
> The EMC1812_CFG_RANGE is set to extended range in order to be able to
> measure from the -64 to 191,875 degree Celsius.
> 
> The EMC1812_CFG_MSKAL could be left at the "reset", so I will change it
> to 0.
> 
> The EMC1812_CFG_RECD12 and EMC1812_CFG_RECD34 will be set based on the
> device tree setting and is related to the hardware and if the system
> designer wants to enable or disable the resistance error correction.
> 
> 
>>> +     ret = regmap_write(priv->regmap, EMC1812_CFG_ADDR, val);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = regmap_write(priv->regmap, EMC1812_THRM_HYS_ADDR,
>>> 0x0A);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = regmap_write(priv->regmap, EMC1812_CONSEC_ALERT_ADDR,
>>> 0x70);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = regmap_write(priv->regmap, EMC1812_FILTER_SEL_ADDR, 0);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = regmap_write(priv->regmap, EMC1812_HOTTEST_CFG_ADDR,
>>> 0);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     /* Enables the beta compensation factor auto-detection
>>> function for beta1 and beta2 */
>>> +     ret = regmap_write(priv->regmap,
>>> EMC1812_EXT1_BETA_CONFIG_ADDR,
>>> +                        EMC1812_BETA_LOCK_VAL);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ret = regmap_write(priv->regmap,
>>> EMC1812_EXT2_BETA_CONFIG_ADDR,
>>
>> AI review thinks that this register only exists on EMC1812. I don't
>> find that detail in the datasheet, but it is odd that there are two
>> registers
>> with supposedly the same functionality.
>>
>>
> 
> All devices "have" the EMC1812_EXT2_BETA_CONFIG register (I mean if you
> are writing something to it, there will be no NAK on the i2c bus, but
> the value read back will be "0" for the devices that has the register
> not writable).
> EMC1812 having only one external channel, will not have the
> EMC1812_EXT2_BETA_CONFIG writable.
> 
Ah, so the second register is for the second external channel. Seems
obvious, thinking about it ;-). Still, would it make sense to only write
the register if the second external channel actually exists ?

Thanks,
Guenter

