Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B079365A0E
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768235808; cv=none; b=Idcw2n5CB7kOQnB5HOLEsNofQnOsHKWnxYRlBl/XKtYCdWn2PtPz3BmhheLeL55sUV9ThoS3WCKBQdQee+a0SfzfV7CygyI/6Y5aeaZIprFJB+xto6EHAEwDehT6q/rcUGQpMS5v50Q+L1OCyt04vjyj/ACX2IU4xJ/IG18bObI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768235808; c=relaxed/simple;
	bh=v52Ky1wOh5BZoi029NmMPPgmN3RaD5fSz//WIwq6+Io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAZ1qmwqEfAkH/+n4U2GFjxtQuV2X9lanAfA1/V8UkgehJK+Ibt+qUlHHlHdbIoQ1i/ni1IWFZglGLxF3VaHauU5YME8Ccpt1Z4Y2E8yj9LlHdCbCKlXjb9KUr1tkfzQiQEhdz4KsOfrsI6MSQK6jrWExdVLPuSzuaYueonNC8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRf9OpJS; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRf9OpJS"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso7802112eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 08:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768235806; x=1768840606; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qEwj3Z1+yz4D+602dS3e3VxMgHdpbmLRd9kEAo0I53M=;
        b=CRf9OpJSEKz6ybvT3RhLLoS+uTMAx8lGLXsPpQD7t/pXfMBBTUuA1y/tgEuYnuogPm
         +0LDJKYLo3doYlFUzYTzz7AIN0PWN9goZoOOPzCZh/EuHB5WbNjm9rsfVBmXw9tacBvc
         CPQHXS0pYsp304U5e+AZOSopu3Osub5o6saMlGIBHcw0PAk4KT+L9z+Yw7mfd7+3LA0L
         cXchISHXHZLuqf0U1js7hfnzKz/Qx44zNEFqjy9FL1wnvhIwRVygctolPEmUCGNfY2dG
         rTydFlUEmnWrTrpMbaFG9YcbhGxqtoSZIViuq/wHeC+xGrOAz7QNFu6rNkdDRmKPzeC7
         6fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768235806; x=1768840606;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qEwj3Z1+yz4D+602dS3e3VxMgHdpbmLRd9kEAo0I53M=;
        b=PxtXLlsBNfbjT+wgrw+tXBDc8cTncIy2ezZ1LGlHfUSf49SQbjlsLPGmhfsBjnyH11
         sSdjkpryUKOF6AEhCYaGjDco+pO2n8PYYkJdlvUUaczx07a16xf3seJ2ey+2hFmuyFQk
         i7tUHCAzR6gU4IPgjSnsvGgq59p66V8wd1YPFp5vd1drtICOCcgQpGIls0MCac4ZqCdw
         013Ij2rp5reGYeia3Ivh5ZgsY2K2zaMQ4i9m4AfPPEoZjlzFBAmZWc+nSOnYHHBebBOo
         GK/FmHbk5qVKynVPksI8gzKkTviWFxnwawgiycwCCUU3XEcfZpFHvVbgegpFHcjEtNzL
         r1lQ==
X-Gm-Message-State: AOJu0YxZxEkqlMuVJsif5L0sRizBl8L/b+94n+Iak/vy96Rnb9pWEA0v
	vRHtplQF+h79kS6wpoSkMmQj5/sWjwwatTp2mmc1Gv97mwTEH4YDJVfP
X-Gm-Gg: AY/fxX5Q90bpob3jQN2MKVt44hTD3PyQ+ndCO9d0uiIbPZ06baCb0K5vp4oNhlhmtwd
	UfD8gEMI+aXx2DU9ViBeiQWMsxXXMWQ9WMFfCRc7dmJS+JveN+cJ7+4JPcAC5/KbbKg96Gzb1c5
	m/eGJ2wMKXs3FteDVpIMAjjahST3FSDj8kmBtM62KkQFnsXWfv13LYXtEMbFNYICnbpAME79xRf
	GwVKkJXfWj4ucK2rUs/DPBVjZDD4lV+KC2291ofNl6wZpLRYm2HscMkKcs2xgCuqIzqV/gFfoi6
	9Yab6yFAeaVumsZ++V039znUxy1UhkErt9tzqQC3aGP8lQ81TPd27jBm1vonym8INY6NQ0mkiXI
	Qob8Dbh5Hp8M/M2ppzFUE6ogKfIZkZ07RzPH2AAL+wG9T0IJ991SlsEndvZyv8TTAv8UoKmg64A
	aEH4Q39cHEr+zjeZCwaCqjSze1s0O4IIRLy2cXFN9OZN3E6z3lNGHZkVXiAK7g
X-Google-Smtp-Source: AGHT+IErz7eSUttdzFHG3zYzPJcQyaJDJQ/fjdBZZZyDn9DDCbg0cFuBnYW9OC9gKOPwBRUDUbpW0g==
X-Received: by 2002:a05:693c:2115:b0:2ac:2c08:9017 with SMTP id 5a478bee46e88-2b17d295122mr10547622eec.28.1768235806512;
        Mon, 12 Jan 2026 08:36:46 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b0b2bsm15861092eec.23.2026.01.12.08.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 08:36:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6da5b1c1-bbe5-40a8-8363-3213265fe848@roeck-us.net>
Date: Mon, 12 Jan 2026 08:36:45 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Armin Wolf <W_Armin@gmx.de>, Tinsae Tadesse <tinsaetadesse2015@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260110172003.13969-1-tinsaetadesse2015@gmail.com>
 <d08f3edd-f5bd-4e6b-b174-e768d42df281@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <d08f3edd-f5bd-4e6b-b174-e768d42df281@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/10/26 14:27, Armin Wolf wrote:
> Am 10.01.26 um 18:19 schrieb Tinsae Tadesse:
> 
>> SPD5118 DDR5 temperature sensors may be temporarily unavailable
>> during s2idle resume. Ignore temporary -ENXIO and -EIO errors during resume and allow
>> register synchronization to be retried later.
> 
> Hi,
> 
> do you know if the error is caused by the SPD5118 device itself or by the underlying
> i2c controller? Please also share the output of "acpidump" and the name of the i2c
> controller used to communicate with the SPD5118.
> 
>> Signed-off-by: Tinsae Tadesse <tinsaetadesse2015@gmail.com>
>> ---
>>   drivers/hwmon/spd5118.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>> index 5da44571b6a0..ec9f14f6e0df 100644
>> --- a/drivers/hwmon/spd5118.c
>> +++ b/drivers/hwmon/spd5118.c
>> @@ -512,9 +512,15 @@ static int spd5118_resume(struct device *dev)
>>   {
>>       struct spd5118_data *data = dev_get_drvdata(dev);
>>       struct regmap *regmap = data->regmap;
>> +    int ret;
>>       regcache_cache_only(regmap, false);
>> -    return regcache_sync(regmap);
>> +    ret = regcache_sync(regmap);
>> +    if(ret == -ENXIO || ret == -EIO) {
>> +        dev_warn(dev, "SPD hub not responding on resume (%d), deferring init\n", ret);
>> +        return 0;
>> +    }
> 
> The specification says that the SPD5118 might take up to 10ms to initialize its i2c interface
> after power on. Can you test if simply waiting for 10ms before syncing the regcache solves this
> issue?
> 

It seems to be highly unlikely that this code executes within 10ms of powering on the memory.

Guenter

> Thanks,
> Armin Wolf
> 
>> +    return ret;
>>   }
>>   static DEFINE_SIMPLE_DEV_PM_OPS(spd5118_pm_ops, spd5118_suspend, spd5118_resume);
> 

