Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28C431AA87
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 01:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778722590; cv=none; b=WMpw6lGmaLusitS9C8bCS5Lbsyfv6Mpv4TCgf/bEkt3FKNHJ8iRiLhyKrU6N8YovDkZAnKukqOe8UmbmLCbOkMiIFfRL5XluCXdmQC1RjNZq31aXAuhTjv87HvdJLdZCuEq+34xiqOM8qE7nWehf01u62C5LKkegY6MZlF3Ukh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778722590; c=relaxed/simple;
	bh=LFppPWSmOXeJo51++aAC0TLdHXWDtbCDvMrxMQtueHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UC6BDV5RYdU6HQydkH0HAI1nA2Cw3LywsgXjs+h0HtxwrLV7O92SP/AxfPBokPljErLV9iHWXcJfk/2mV/xZnYPAcTei+tvesMHkZ8xPiqVN7hPtc+l6NHTRmC18HQaYc5/Qe40G7i8E96rVIrHsbhLkW5sKr5sVx8i6AAIdO78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QseZA+My; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QseZA+My"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36608b2f2dcso5304304a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 18:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778722588; x=1779327388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=HyzUK3ipgqV9IXR7iiEoV2eo7NR0IJ/lnsHXhN3GONU=;
        b=QseZA+MyaOGpAodzOBxVLmUfK0M1zTpCZTg/9kRZhNZ0IGYRBx3J48s1cbqggVDoaA
         1yzgwyP0NmxaOT2VSWIXl+SehS4EGaMHUVy8dv50xLkr4WG7K2JEyWfkLTg2u2fcWlS3
         pPjqjlYqQd67WJvEYITVMZt+lOkVrdj5Y9iPekxD19zuFeHlnN7XOywl6npmcMNamd4L
         mLbMa8hTkAKdYY8JNTZLjbTa01qUbevihpPdqpkpA8K/Ao2wrCqqNlCYI3m7pOlEAcfS
         JrximblCbvBVcTbwbj0rTMnGQOTDTrzQuGQDwJVIY7Wstz/EIBFFspCHdVdru1dija8F
         rP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778722588; x=1779327388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyzUK3ipgqV9IXR7iiEoV2eo7NR0IJ/lnsHXhN3GONU=;
        b=bTK87XFsdhtOLCxZp4IoTzLkDagn9BeCWYypNVNA92nwtKq+4Yst3z6N9DvX6MXSAa
         K7TmL9MJvrozow72iOOo4NZb6Xqoo9fdWJ4dNQ5/KMnivRbMBZnBNh48GTQTDOGQh0jO
         s525XlLDcdAXgBIEKrxp8XYvywqelsNCfgzOiSS32rg9Y6btp8PbkQh6LsJ+IkdJE81P
         2V76HOp6iYh/K50UhPE+2xWiOFUV6iT4FWt2BfXNFvPa3yTu8LLOtLbMLhoEd9C0vu7d
         8fF4fCgWkEylqlUXkMog+nHJfhNwjIUWDVnUv//TX1X/ky6OdvePh96JT/Jj9qP7o18T
         a7cw==
X-Forwarded-Encrypted: i=1; AFNElJ9R8q78fK2oPbSg54l9xVDsXWBPGz7cp6ByLhpT36Mrdzd8lf0IhtKFWvFh0GS3UEVdw/YpABBYlkzE+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YygxAoQHlmHLfWRzHetifP9HRqjsFOLPn6J5CD3UevBLGhfa5VI
	OuUsxfPoyFaly1kRynY9GcoVii67loWsEeOkYRD91UI+LlsFYP8LZdlC
X-Gm-Gg: Acq92OH4dcSUsXIAalRRJwFwtxNhzcM840dHssdjrA7Xd611/ojMmzxltH0ciZ05/jv
	7u4t0deVXNj+VKNHYO1rolFUwMfgS0oxET7ILsVYxsP5nbaLP003YE388KAkUMKqvYobCPMhJiU
	2EILIkBN16sIr7x2RoC564gK0V27PRa4Kq0S6hsI8XXaz76mDlR3v1rqvT1yeWwJxGnGYoK4a51
	P0CRCzO4A8tUSs9JdGX6iInHuHTsaSDWzWiV0uX5sGPcWeXQ5z92vMxSR1GhBB1kf2s02KK6Vou
	MPGWU+tQl9l3A5FM+wP+ELe1l9OYmdFG4LhfM03kEQWZsX8zKYtBHe1PN5GkXSJWA2HGXSs1Np2
	IJy/zCwzhVllbtRKMnOy7X8W2NODJRFnwMNjFlhcaoGVZy3hrpfKp/t8wQJ8bmw7J/wjIRQfSJx
	oV+VGuDHWvtqabiK97ct2gK3Wb525I8kkTF4SkD96nWbLoz26XobxDs0cfKuyEvYnJ7U+roDa8
X-Received: by 2002:a17:90b:5628:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-368f77c87d1mr5215861a91.3.1778722587959;
        Wed, 13 May 2026 18:36:27 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb121ccasm464806a12.29.2026.05.13.18.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 18:36:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6377419e-da4c-4b79-86f5-25417fe6db06@roeck-us.net>
Date: Wed, 13 May 2026 18:36:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon: lenovo-ec-sensors: Use devm_request_region for
 automatic cleanup
To: Kean <rh_king@163.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260514011411.4167069-4-rh_king@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260514011411.4167069-4-rh_king@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 18:14, Kean wrote:
> Replace manual request_region()/release_region() with
> devm_request_region(). This lets the device-managed framework
> handle I/O region lifetime automatically and fixes:
> 
> - A double release_region() when probe fails after acquiring the
>    I/O region: the probe error path releases it, and then
>    lenovo_ec_init() releases it again on the same error path.
> 
> - A release-after-free in lenovo_ec_exit() where release_region()
>    was called after platform_device_unregister(), which has already
>    released the I/O region via the platform device removal path.
> 
> - Missing release_region() in lenovo_ec_probe() on the DMI match
>    failure path, which leaked the I/O region.
> 
> Remove all manual release_region() calls that are now handled
> automatically by the devm framework.
> 
> Signed-off-by: Kean <rh_king@163.com>
> 
Why this empty line ?

> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

How do I know that this review really happened ?

> ---
>   drivers/hwmon/lenovo-ec-sensors.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
> index b0f2a04ce679..ea74bddbad5a 100644
> --- a/drivers/hwmon/lenovo-ec-sensors.c
> +++ b/drivers/hwmon/lenovo-ec-sensors.c
> @@ -519,8 +519,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>   	if (!ec_data)
>   		return -ENOMEM;
>   
> -	if (!request_region(IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
> -		pr_err(":request fail\n");
> +	if (!devm_request_region(dev, IO_REGION_START, IO_REGION_LENGTH, "LNV-WKS")) {
> +		dev_err(dev, "Failed to request I/O region.\n");
>   		return -EIO;
>   	}
>   
> @@ -541,7 +541,6 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') ||
>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE2) != 'H') ||
>   	    (inb_p(MCHP_EMI0_EC_DATA_BYTE3) != 'P')) {
> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
>   		return -ENODEV;
>   	}
>   
> @@ -579,7 +578,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>   		lenovo_ec_chip_info.info = lenovo_ec_hwmon_info_p8;
>   		break;
>   	default:
> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
> +		dev_err(dev, "Unsupported platform type %ld\n",
> +			(long)dmi_id->driver_data);

This is not documented in the commit message and, on top of that, pointless.
It isn't even noise, it is just pointless (the default case can not be reached).

>   		return -ENODEV;
>   	}
>   
> @@ -608,10 +608,8 @@ static int __init lenovo_ec_init(void)
>   		platform_create_bundle(&lenovo_ec_sensors_platform_driver,
>   				       lenovo_ec_probe, NULL, 0, NULL, 0);
>   
> -	if (IS_ERR(lenovo_ec_sensors_platform_device)) {
> -		release_region(IO_REGION_START, IO_REGION_LENGTH);
> +	if (IS_ERR(lenovo_ec_sensors_platform_device))
>   		return PTR_ERR(lenovo_ec_sensors_platform_device);
> -	}
>   
>   	return 0;
>   }
> @@ -619,7 +617,6 @@ module_init(lenovo_ec_init);
>   
>   static void __exit lenovo_ec_exit(void)
>   {
> -	release_region(IO_REGION_START, IO_REGION_LENGTH);
>   	platform_device_unregister(lenovo_ec_sensors_platform_device);
>   	platform_driver_unregister(&lenovo_ec_sensors_platform_driver);
>   }

