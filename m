Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A00A36605F
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 03:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729064; cv=none; b=cEe1m941lPDaQen+6hNIIbsU9uqOVmJTeh1aZEZR0i5sx9lIng10t7VvruxIRtGIYWXmUSpuqA2SvEeiL8I8LvRu3zpBy7O/pGEvCoX4sBecTnz1502gVkzufCsYEAxfy5EG07JezYZreiFc+mK5GI4Y4csUDqtrLc3Gkk4D5mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729064; c=relaxed/simple;
	bh=+9PEBNhchsavENdDc7DjpqBqyK0FalZZizu+MLovcoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tVrnU2zT/b907dBRpoTGLhfdYFJKPxyLOZ/a53kzqpymijjyiQp08L6cU+dsysva2IQq18ZZ0SfDu+QPxcSUpm4c2T+MlBT7nea2YZ6ij5MgPyqp5uJr5OXku/CxQEqsBHFrznHGdKhr7KYOSBDqvYUlFzkmeYuuFqqorMI9/+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEFpZCFJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEFpZCFJ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36643b96b99so5261730a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 20:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778729062; x=1779333862; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WTenbK2k7GmQ75X4K/yTmzUiC9XdOvBzndqE06xsXaw=;
        b=GEFpZCFJnSPGdLpgvNkYHqtiLHpdFwWCg2t35SDKZMM7pEKh4cjcf16/CHcqKSIe1Q
         NIdKHBV/CgSXqI2tZ/5Mcm+vfJsUBcN3Ht10finKe6yDTHBJNxzg1GJ+qut0OmShX4gg
         s2hEWdd42cIsG7K9qaOpafz08JHYjdUvZ7wo5pXmZCykR67PQwxRzOIDr9s0ttTfk4l0
         hCEmVnrvaCKEhlMd2OnRy/R3KPVMRNXPaNH4wnbmIpg/aa81KLbx12Eaxo0fnFJ8XrmJ
         1TJLIKSfwuECONXWqld561uSt35MWRCr/0+/sFteg5xRI/AieLhCxMtjiTKoUS07XhXH
         Vuqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778729062; x=1779333862;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTenbK2k7GmQ75X4K/yTmzUiC9XdOvBzndqE06xsXaw=;
        b=AnoiwW5WCGFKJM5Nh7GWWdLPO72SW5JN/PzzUzTkfhsVpU0ddNjIAWFfhQHjfVErp/
         ZNeFEEo06jXK2jTBmFMfKQ55CzYu153UeVAfr5IIfAYUbW6apdVSMr55JCd35H7e8lye
         EG0mRa8e5mkT0sfgkuHQNT3Op4UmR5tmo/XBjRFnt1muJiZUeP2sVSQrFaz82eiINApU
         dm7N3UQ1XYWbuktOEOv0q8V8L/0r9SNy8lrcuTBjEdgVYSBrvtoNrQerzThVURJDCZwp
         Yd/z2cZifebhJ6Dw7tKwjo0Bn1iLaBictk4FHmeVN2bIf8Kq7mAMA/+TDOaDRmpkhK4i
         PaOg==
X-Gm-Message-State: AOJu0YydG4aNHW1oEg7WeJuNguAjSbNA6I7coSNx4kmUGDQcHIJ3exFp
	vVA/HlDA9tOkGWO0e4iqqHB/l1UxrRap5QkxfwsrAX0f8elc0TDu59A0
X-Gm-Gg: Acq92OHk/msG+aZoTfqMSKPPPbua+3N/HjnS9wOBeUttEHPeLf7d+Q2W2KNZgjsqbNo
	MozYzgjingf6iq3pr+A6f+O1fg+58b+83OedZYsI3HmQPiFtPgdh5mXzLpcoGgSYiqegsyNo0WE
	6wtph5Kl81efsnN9Niq59if1UHJk5sqocXw/KNFWMyQbu1gW/LGMvbi7RqUjlNt93Sqz4aIUewq
	Xl8J7ay02/WnVDXR+j2PHbKKD1qbgIxGljZVVoav9aCd4htlmg4/RXlcur3UdEqfLyHqbcBibYR
	dIdWR0MCD55kXaeJSpf2VTvxY7Yfs4kc7eb+RTsRP8+t8lMNrruuMbf1cF4WrA+ZdLKaQgviyC3
	m1RkCX8T3Oy30tFqicCV5r04OThD4bVpyJUs/creA2K3DA/C36AzjEhOzdfw/imbgzPOXvGnDPZ
	XF6tHhvOmJnK+KtA1iSdIIpaKA6+ef3wJte9sd9Zz16Y+FmpHvQJ/QUyHQQObuh2Ia3k0QVdlm
X-Received: by 2002:a17:90b:3f83:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-368f7993ccbmr5851968a91.14.1778729062269;
        Wed, 13 May 2026 20:24:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3692f4a038esm958531a91.15.2026.05.13.20.24.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 20:24:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <40e8a830-4e2e-4627-8745-a1f05d8d31ba@roeck-us.net>
Date: Wed, 13 May 2026 20:24:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: lenovo-ec-sensors: Use devm_request_region for
 automatic cleanup
To: Mark Pearson <mpearson-lenovo@squebb.ca>, Kean <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260514011411.4167069-4-rh_king@163.com>
 <6377419e-da4c-4b79-86f5-25417fe6db06@roeck-us.net>
 <1d6239f3-6383-4262-97b5-01c289dc5e7b@app.fastmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <1d6239f3-6383-4262-97b5-01c289dc5e7b@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 19:39, Mark Pearson wrote:
> Hi Guenter,
> 
> On Wed, May 13, 2026, at 9:36 PM, Guenter Roeck wrote:
>> On 5/13/26 18:14, Kean wrote:
>>> Replace manual request_region()/release_region() with
>>> devm_request_region(). This lets the device-managed framework
>>> handle I/O region lifetime automatically and fixes:
>>>
>>> - A double release_region() when probe fails after acquiring the
>>>     I/O region: the probe error path releases it, and then
>>>     lenovo_ec_init() releases it again on the same error path.
>>>
>>> - A release-after-free in lenovo_ec_exit() where release_region()
>>>     was called after platform_device_unregister(), which has already
>>>     released the I/O region via the platform device removal path.
>>>
>>> - Missing release_region() in lenovo_ec_probe() on the DMI match
>>>     failure path, which leaked the I/O region.
>>>
>>> Remove all manual release_region() calls that are now handled
>>> automatically by the devm framework.
>>>
>>> Signed-off-by: Kean <rh_king@163.com>
>>>
>> Why this empty line ?
>>
>>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>
>> How do I know that this review really happened ?
> 
> The reviewed by's are correct - I can confirm I did review these patches before Kean pushed them upstream. We did some internal review first to discuss the issues he identified.
> 
> We sometimes take this approach with the platform/x86 patches. We can do it separately next time if preferred here.
> 

Kean <rh_king@163.com> is not a full name, has no patches in the upstream
kernel or in linux-next, and otherwise seems to be a complete unknown.
How do you expect me to know that this isn't all made up by some AI ?

Anyway, when you do that, please at least ask people to run checkpatch.
I really don't want to have to deal with trivial issues such as

ERROR: trailing whitespace
#135: FILE: drivers/hwmon/lenovo-ec-sensors.c:611:
+^Iif (IS_ERR(lenovo_ec_sensors_platform_device)) $

in this patch and the first patch of the series.

Guenter

> Mark
> 
>>
>>> ---
>>>    drivers/hwmon/lenovo-ec-sensors.c | 13 +++++--------
>>>    1 file changed, 5 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
>>> index b0f2a04ce679..ea74bddbad5a 100644
>>> --- a/drivers/hwmon/lenovo-ec-sensors.c
>>> +++ b/drivers/hwmon/lenovo-ec-sensors.c
>>> @@ -519,8 +519,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>>    	if (!ec_data)
>>>    		return -ENOMEM;
>>>    
>>> -	if (!request_region(IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
>>> -		pr_err(":request fail\n");
>>> +	if (!devm_request_region(dev, IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
>>> +		dev_err(dev, "Failed to request I/O region.\n");
>>>    		return -EIO;
>>>    	}
>>>    
>>> @@ -541,7 +541,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>>    	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') ||
>>>    	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') ||
>>>    	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
>>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>>    		return -ENODEV;
>>>    	}
>>>    
>>> @@ -579,7 +578,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>>>    		lenovo_ec_chip_info.info = lenovo_ec_hwmon_info_p8;
>>>    		break;
>>>    	default:
>>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>> +		dev_err(dev, "Unsupported platform type %ld\n",
>>> +			(long)dmi_id->driver_data);
>>
>> This is not documented in the commit message and, on top of that, pointless.
>> It isn't even noise, it is just pointless (the default case can not be reached).
>>
>>>    		return -ENODEV;
>>>    	}
>>>    
>>> @@ -608,10 +608,8 @@ static int __init lenovo_ec_init(void)
>>>    		platform_create_bundle(&lenovo_ec_sensors_platform_driver,
>>>    				       lenovo_ec_probe, NULL, 0, NULL, 0);
>>>    
>>> -	if (IS_ERR(lenovo_ec_sensors_platform_device)) {
>>> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>>> +	if (IS_ERR(lenovo_ec_sensors_platform_device))
>>>    		return PTR_ERR(lenovo_ec_sensors_platform_device);
>>> -	}
>>>    
>>>    	return 0;
>>>    }
>>> @@ -619,7 +617,6 @@ module_init(lenovo_ec_init);
>>>    
>>>    static void __exit lenovo_ec_exit(void)
>>>    {
>>> -	release_region(IO_REGION_START, IO_REGION_LENGTH);
>>>    	platform_device_unregister(lenovo_ec_sensors_platform_device);
>>>    	platform_driver_unregister(&lenovo_ec_sensors_platform_driver);
>>>    }
> 

