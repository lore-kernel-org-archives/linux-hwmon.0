Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6103F38F254
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 04:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785213267; cv=none; b=EL1/EKs8gPVQiljy0oDVdkFNYP8gkJwtDgxqoQ5UnjIguZI+62yX4GTgH56nUG/qMONIareQPMpS+/qL+pA6t8T+pyVN3RYyNXUlqEzKaD7RsbzHR9qdUTc3qzujZ4Xj9cODJpEKQPEQrmGZnDk98SA4jG5waPzJ95K+QfSu4tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785213267; c=relaxed/simple;
	bh=uyawnA8JzmPstrkoM+DBDNOWOHPLgRXU9HmSBbtzOPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxpeFmbKSFGA9Cf9qpbXt3ojzx3alt+e7RNf3o5UGUd9wczSzqW2EdLcM2AOsdp9Cy6XhmbrtSv+jwA5n5UiLgwkb0LECnnGdCKYPJYr4Sv9xtOkujSeiuZe7/KcIuRXqDaESB6JkZ7nw0G4cuCgqwQQe1xNTGoD+3sqIz8WELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJemoSMD; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJemoSMD"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso31408685ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 21:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785213266; x=1785818066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbpEiYESyYcbPpVXAmf0MuFPaZ33OeP2HIx7dfPBaM4=;
        b=fJemoSMD1+90FUrXWkPlKVciTX9Co17rdfKWArlkoZj87g9oqZoVw46icPLSWQ/1E0
         Le0YIY1965JNS6BEe+STZZUp2rc6hwuHBahwvU/Lly1ag7QBlCNhbM5rNA0uEIuP7a6g
         6GQzEv+Y6dfxQpMCTM3JIvCac2nwPYlZr8+ZGv9h3bT21oV2Xd4um8rdIcmJ5mrU7+9z
         y3gOcjXoTy9qmiUbGWmN+gE9MkSMBq64mMzsPAYSDfXgXdkYcsiD2nt6Nbzn0lDFE9nu
         f7Wey/kxpwe+TAkr1/tqhFtWXNpJVZls9rciO1yhU9aZqy3ND7Ij+L4ipURiBokTkneM
         2ZQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785213266; x=1785818066;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HbpEiYESyYcbPpVXAmf0MuFPaZ33OeP2HIx7dfPBaM4=;
        b=qTkHaeaU5/1XXnE1ovG2/C9jvAJhBTu0Lt6AI+tbMk8cNVnug93lnrVFTSNSoBUdJQ
         ghmMIBrOZcqFhhhekpRjRsawKtZmvmUdJxWOxO7m5STPjsnuwsBG1oQE22AV5N0Kqi5G
         lCt+nSGgbIq3kTqs33yDSl1FiCp7gydVejsP0Budbx7S9QG3vWTP8ivPoYhU5LnmHdYS
         /Ud4bxBUNfMuP7RF+mGpHVVQ2IMCD3R5vrvTkd0pRahr20RSNqh0AzfNdx4RT3JMa7jR
         G6zWLhUpd/iVmQumuiBb3sWn6Z/WOKl8FPmEPUslE6ldpeKxaEh5J36aRAPyGCChDbsb
         3gqg==
X-Forwarded-Encrypted: i=1; AHgh+RoLCb/QDiNJRt5rfLM9bXRr07lNPM66FS5+zIymnXf+V7SBtpjBaxVbaIg4zukgGRTV2YEpc35eh6ZdGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd70TtxYDSTek68P1QzDhRPwFk6doGj93tM8xudF/Q+p0czh4c
	OOAAr246JQvPTtwp4c3FcTLveOTwUeDJyTEpjA9Hpt8HYRrgYl13cTB3
X-Gm-Gg: AR+sD11unVYBDmnYyW45xbeaWTqFcD+sZCBK1NeChEe0hrWpeC1pAOqdorpV1r225r/
	niEzAWhtPz7n2ksA8YyiDzQa/J+m6dLRx0ojT7I0OXos7S+EuAbelsOOYeq0hg9Y/PT4ow3mfPe
	mnW77LwFBvBMfNTC+YDk66xomfLHg1ECPbirIez4hHVFhbJwW5e0g1vZ752gkhJG0BX+1oynpD9
	GGeZXRHuk+i/wS2/F9jSU1NdUDhHhKTL+IpVOV4rpxfOBktlqjSdwXN7OzEES9juf9smoNPXDfB
	47e//rZLkOz28chHkuyigfKz9Mg7pAaFtKUB3DWanhlPEAu4JYVNaHQ70WcmMq9fPNQx1vlcbul
	RRb1P16NX2rrTaHVfeBywZSSIdbaHGQzQ/HbLW2wT18KnkaQaKCblhEe8zR+irrP051cTS80Yci
	IvQ+0G6s178BaHCkjfnFP8HpHhljcVt2zFZFWxehifHoRrfndZ1pK0hZwimoM7SQ==
X-Received: by 2002:a17:903:1904:b0:2cf:b23a:3e39 with SMTP id d9443c01a7336-2d015d8f422mr8372255ad.43.1785213265610;
        Mon, 27 Jul 2026 21:34:25 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc4f4sm44562095ad.39.2026.07.27.21.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 21:34:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <69a7e430-e7a7-4b84-aa1e-f0f07393b9e0@roeck-us.net>
Date: Mon, 27 Jul 2026 21:34:23 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] hwmon: (pmbus/max20830): add VOUT feedback
 resistor scaling support
To: sashiko-reviews@lists.linux.dev,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260728-dev-max20830c-v4-0-cec034298535@analog.com>
 <20260728-dev-max20830c-v4-2-cec034298535@analog.com>
 <20260728034543.3F7BB1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728034543.3F7BB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 20:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incomplete VOUT scaling introduces UAPI inconsistency and dangerous hardware limit writes.
> --
> 
> --- Patch [2]: [PATCH v4 2/4] hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support ---
> commit 4d1fa3c4cb8d1f4bfe3ca16a79ad028a0dd9bfee
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> 
> hwmon: (pmbus/max20830): add VOUT feedback resistor scaling support
> 
> This commit adds support for external voltage divider scaling using the
> adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties. It reads
> these properties and scales the feedback voltage for PMBUS_READ_VOUT.
> 
>> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
>> index cb2c23672166d..7c1e94c43ac4e 100644
>> --- a/drivers/hwmon/pmbus/max20830.c
>> +++ b/drivers/hwmon/pmbus/max20830.c
> [ ... ]
>> @@ -14,6 +15,51 @@
> [ ... ]
>> +static int max20830_read_word_data(struct i2c_client *client, int page,
>> +				   int phase, int reg)
>> +{
>> +	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
>> +	const struct max20830_data *data = container_of(info, struct max20830_data, info);
>> +	int ret;
>> +	u64 temp;
>> +
>> +	switch (reg) {
>> +	case PMBUS_READ_VOUT:
>> +		ret = pmbus_read_word_data(client, page, phase, reg);
>> +		if (ret < 0)
>> +			return ret;
>> +
>> +		/* Apply voltage divider scaling if resistors are non-zero */
>> +		if (data->vout_rfb1 && data->vout_rfb2) {
>> +			temp = (u64)data->vout_rfb1 + (u64)data->vout_rfb2;
>> +			temp = DIV_ROUND_CLOSEST_ULL((u64)ret * temp, data->vout_rfb2);
>> +			ret = clamp_val(temp, 0, 0xFFFF);
>> +		}
>> +		return ret;
>> +	default:
>> +		return -ENODATA;
>> +	}
>> +}
> 
> [Severity: High]
> Does this code introduce a UAPI inconsistency by only scaling PMBUS_READ_VOUT?
> 
> When in1_input is read, it returns the scaled output voltage.
> 
> However, because this switch returns -ENODATA for limits (like
> PMBUS_VOUT_OV_WARN_LIMIT or PMBUS_VOUT_OV_FAULT_LIMIT), reading limits like
> in1_max will return the unscaled feedback voltage directly from the chip.
> 

I would suggest to add a comment explaining that this series does not support
any limit registers. That should "address" the issues raised by Sashiko, and also
help future readers understand why the limit registers are not scaled.

Thanks,
Guenter

>> +
>>   static struct pmbus_driver_info max20830_info = {
>>   	.pages = 1,
>>   	.format[PSC_VOLTAGE_IN] = linear,
>> @@ -24,13 +70,25 @@ static struct pmbus_driver_info max20830_info = {
>>   		PMBUS_HAVE_TEMP |
>>   		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
>>   		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
>> +	.read_word_data = max20830_read_word_data,
>>   };
> 
> [Severity: High]
> Should there be a matching write_word_data callback here to reverse the
> scaling for limit registers?
> 
> Since there is no write_word_data callback, if a user writes a new limit using
> the scaled unit, the core will write it directly to the hardware without
> reverse-scaling.
> 
> The chip treats this as a feedback limit, which could drastically raise the
> physical overvoltage trip point and bypass hardware protection.
> 

