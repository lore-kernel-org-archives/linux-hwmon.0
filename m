Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF6138332F
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765722; cv=none; b=C+8qaPQRXRGj/+l6utK2mvXJa06g/aA6L0IHGqm4hAGVl77f61ZdzDCU5vBBHCBLPdTnOeGZuzisaWoepdXAUlln2xIUcmERQwR8C4rSdWXdHp37p8KjI5ZQRgBvIig4ZTM3eUWc9vo14mwAtjSYETLpS2cdGRRgYRVRI8JZV2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765722; c=relaxed/simple;
	bh=3W6m2W56Pc4MQqTL9khWXC22Mxn0+KEbIbk0FfGBo6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GY1abnuiXMnFF7pjpaV+v4qMGxVIaiqNoeLVQL0c7mvSF6IFDtB7+G3RzlDNAzNGL69OclR8UHsdMfhOJGauS3g3yG34mq7Hzd84L9n4saOICqXw1MJAZy4Lj6SuHuxNV4292Rs+epcz0aoLyGJnAv/dnapFRMztzTycQ4ZvD+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pp9ftdPm; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pp9ftdPm"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30edfd9cff9so541891eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765720; x=1783370520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=geN/BbPdcW+Cts3PZsYZqanllkuBCZlJY/mSbP3HT1s=;
        b=pp9ftdPmjhf6dIWJ0dDWO85x6Y8CdBfE5Yyop57I6dQw9GsUbnKO2cS1cyi6HPMU4V
         pVlgd/FTH6/Vw3XacVLYj8Q7bsoaeGoNMtT4ADCdhca0RhLZUXyGFUq6TV3BMg75xx0F
         Xyib8lHk7OUWPjFAcf6i1Qzxslw5BH5HLfdP0L9OqBl1JEBu46n+3rEuRs/iMeV31dVU
         xv+52k+rwF2LIk5fOomnnyNgloLD7sH/iwOeqpttiyslhDY/HmVgrffXgFO4ih1La8ey
         3QyQdQaWqdeYrSvtc3voOtfEygGwvaaB0YJd859+XCqHpB6RMbmJC392prvrJlevDBSi
         Dk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765720; x=1783370520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=geN/BbPdcW+Cts3PZsYZqanllkuBCZlJY/mSbP3HT1s=;
        b=j93OxfcX3ibCoPmXTYgpZ3vPvGSXrS9oY2WqO7rPmDYXyM0Z8VaOV5GohmdrZIvcIm
         PEthyCjdRqP+O9HUxQcIYqW92Am+pncI098cYK8Bq1bjcJsFarXHrTn2PdhEZrZgwVJH
         OTAWKupu31CiX7r0dE5Qjmt3U8J0fsOvEYGQgnG5D+PwrWniqueigzN5iphF4uLt9Hmh
         F2ncPD+kv+DsFCydmTQ3+DJxg8vsXTybeGeAUrbz8Z9GIrTOOjWYrkpFJOBAjadrg2wI
         isv5+4gNxTzW16xrVjtIn6lObq903fCPrlOp3u3CqXbFlfYDKTw/nYhFsbz2ssgAIKfT
         Ikgw==
X-Gm-Message-State: AOJu0YzCfjQwxVJ9VDAljMwLUsak3pAaM1bfA1lX34u5BcJKhoWQVb1b
	O1qRvnV3wY6xwPp9kMvth55z5AOPQymj8vjql/Khj8Izo0djBBCmDCvf
X-Gm-Gg: AfdE7cnf5l4wqUJCiuVbob2IJ3p7Z5WPhYoqnvTnAxK8hN5C5ssoYdqZXT3rf2oMgFs
	SeFctbzRrnglREkMFzLS/ooW+u1A8ZGSx7kf9Mk6odLYAvgjOp72C5WrfzpCWdSc2ytFKJjO/4E
	YCGmxd4MB0nj7A7l5PXl0MoojWTfd8yc0KOrW2dkE4cxhwvSO1Utrzrb0s0yMRo1o1S0DMAfg+N
	/VDM1N5XokMEejWMsSEg/8c8JL69GCIUrHVmq7uQK97CveC665mZSm60D0clcRUK54IQw5AJVAD
	OWsZfFUjZpgZjKxiFhtwH77ecVZl/NxwP/rpLVn3k92CmTXWEm+j/lvnIyBLLAiWMwUXguxMbds
	1fDP4rJoxbZsITJ2cVsiAxZ0kWAJQw09+4zsLEGPDxIl62ROhr/O1mWiv+bJ6y6vAaijzbP8w4x
	DJli7KE1sbOxL+CE+zt4DmK/WBfqhS+o+YjoWTO3remCJOcwgnE1DwsCd49tcIpsanrSMhLd+e
X-Received: by 2002:a05:7301:100d:b0:30c:1739:67f7 with SMTP id 5a478bee46e88-30ee1472600mr617951eec.35.1782765720285;
        Mon, 29 Jun 2026 13:42:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f5aeb0sm915454eec.3.2026.06.29.13.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 13:41:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a9ab619a-263e-4131-aca1-26de74045562@roeck-us.net>
Date: Mon, 29 Jun 2026 13:41:58 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
To: sashiko-reviews@lists.linux.dev, hehuan1@eswincomputing.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061214.1648-1-hehuan1@eswincomputing.com>
 <20260625062201.5FCA61F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260625062201.5FCA61F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/26 23:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing Hardware State Restoration after System Sleep / Runtime PM
> --
> 
> commit 90e30b4d9c6082a265da7f7091bf9e2cd31aec81
> Author: Huan He <hehuan1@eswincomputing.com>
> 
> hwmon: Add Eswin EIC7700 PVT sensor driver
> 
> This commit introduces support for the ESWIN EIC7700 Voltage and
> Temperature (PVT) sensor. The driver implements temperature and voltage
> monitoring using polynomial conversion and provides a sysfs interface
> for accessing the sensor data.
> 
>> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/hwmon/eic7700-pvt.c
> 
> [ ... ]
> 
>> +static int __maybe_unused eic7700_pvt_runtime_resume(struct device *dev)
>> +{
>> +	struct pvt_hwmon *pvt = dev_get_drvdata(dev);
>> +	int ret;
>> +
>> +	ret = clk_bulk_prepare_enable(PVT_CLK_NUM, pvt->clks);
>> +	if (ret) {
>> +		dev_err(dev, "Failed to enable clocks: %d\n", ret);
>> +		return ret;
>> +	}
>> +
> 
> [Severity: Medium]
> Does this code need to restore the hardware trim value after resuming?
> 
> The driver initializes the sensor mode and trim configuration via
> eic7700_pvt_init_iface() during probe.
> 
> If the device enters system suspend or runtime suspend and the power domain
> is disabled, the hardware configuration could be lost. Since the driver
> utilizes pm_runtime_force_resume() for system suspend paths, should this
> callback re-apply the trim values to prevent incorrect sensor readings
> upon wake?
> 

Huan He - Please take a look and fix if necessary.

Thanks,
Guenter
