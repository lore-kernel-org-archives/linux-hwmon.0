Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCB01D86C6
	for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2024 13:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732197391; cv=none; b=O+bMf7540Y6WDLfSeEj4GEqzS60wtV0F/iYXsWs+g1pmKJzH3HvSQD60C9UcdhzS8gnp5o/PJjWAwcZddLS0WlWENkJGZ25fhQSzDxrfZvZlRQhXTVvy2jodgLz6W6KOjpD6bj6WUY4cnV1ABpTiHtiiDBG8u0tA9eU9GZ9gZzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732197391; c=relaxed/simple;
	bh=2CM+HO8UOVSFwLlBPrRXAk6XrVcyUQqYrZB8JWY5hMw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYSsMutmfC5SQa3TIK4P0ntyIud0eX2obtdiUL4yvgt+UnlT48pxaFpk56tK7cCMtvSuCTvfwZza/TpvkuOZMRB7JmkJC4Ne23RKyY5K7OJamqbavZJjvYDvmGBEMLeYnzby1dytSBHPLnvk6biO2+uK5Xpxp5WZhfIzPlM0vok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Li+/DNNt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li+/DNNt"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720d01caa66so912870b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 21 Nov 2024 05:56:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732197389; x=1732802189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/nMFUrrvjPKG/gRq2OuQKkXTIUfSAqdD5kzA5bCrYIk=;
        b=Li+/DNNtDZQl5hFv3WAG06M+pW2T+GPZ0sDfQwjoHNM4U0/AXFzNI+0mjbU5NrWztI
         jbH4NBVSJxtLWeZRaXNpXWimgciswzVrBdM2lJnrMvyhemQkGWFQjqofzL2t5ilSg6uk
         C7u8c8keZcVDUqQAAiUPMpiODCAFkmxl/2BPg70tBJnPQ0x0A+9t7Wd/dpoI3P27mleK
         P7/oviuluHPafSUV64R+WDe0fQRJmasM/lcIcIMxsu+GjH91yGmb39XhdEICBM9SpKXH
         ZYIEVVIGYDqYoooteoPghs1EjHSW1PjiJQJ2pA/3qGulSY/4SXSOTc9QHq0d4nuq2651
         FgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732197389; x=1732802189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nMFUrrvjPKG/gRq2OuQKkXTIUfSAqdD5kzA5bCrYIk=;
        b=AMLxiYw1RZs/8uun6hXAUjjYPrZTBojKLppMxHfFpueWmofKTMa/JH1c0vYej9RRwl
         BJQC1WrnC++ftuSTXGHxk59jq1Dk9s3bfr5vI1OiExPq8Es1c1xUVtv51AnpjqsNF95f
         f8r4jjKq1E6heTXMIKpaeX+AbBVpUteCMIfGxjK6IInJdsbZ6WHjCzLZ/gadcE7q07K2
         ElqE8ftN/2s/qcxUDYPOiL5u2RpPL/kHWlR71NTJLkXTR6KM+DHI7DriJGni1RqNEuL9
         Ovz91b7ZOKfnQHBuPnTiEG0xQu2WLT0XGVSnc1uSHVK1jVfQVPyB29SPbcVOtLkZHdut
         /VmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtrDpG+iTlD+O9pZ/H4cJa6hdH45ydJAMsiXq1hFMT//WW+q61g6eeJzMR5jqNPewUsdBApiMEtJ6m+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeeZWM4SMHiBbGzP+GbbmXpIEnJFFG9lvNberjHf6aYLqNFmgb
	0LPVHGxo1qDkdMUwDxY2ZsEBf/zvQ96tQLS0Hi19Kt6HphPeAM8j
X-Gm-Gg: ASbGncuEaMacxWx7r+7bxasKXCuLZ5w27oDPL+QAV7L1FXOS1VwnY1Za5j57/evslgD
	byCZCWx/rXFXPXCqaQeMFsGc597STJmd6qBS38QuQGcC6uLiybod7wvI9NpnfV2qAlRyZ4cxHB+
	yKMiiZQ3ibMTHDr433FG3nYEPks+gID7nP1uppAWLr6i5dJDmIA48bkbsbT+yGETqF5o/WhOlEx
	2t+sf3kfsMT95fS2POfiuEVXZ2kmD9kVjUsbzBoWfVeosj6DW0aoHUVYQwEts8KPoNhZGi5vv0M
	JqW3ru+zRjgVNhrCPB+suVw=
X-Google-Smtp-Source: AGHT+IEbFSDrkNoU3vaRHpAWp8t8+V+kD5AvOn/gqVZOTdEF7TK5OzuSVgEKHuQAVIFI5VC7mE9zMQ==
X-Received: by 2002:a17:90a:d40e:b0:2ea:95ac:54c7 with SMTP id 98e67ed59e1d1-2eaca732926mr7923282a91.19.1732197388678;
        Thu, 21 Nov 2024 05:56:28 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ead0392f0asm3203614a91.43.2024.11.21.05.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 05:56:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bb64fe04-2c49-4f21-9dd4-5dc4d98af870@roeck-us.net>
Date: Thu, 21 Nov 2024 05:56:26 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (tmp108) Do not fail in I3C probe when I3C regmap
 is a module
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Frank Li <Frank.Li@nxp.com>
References: <20241121121819.393104-1-jarkko.nikula@linux.intel.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241121121819.393104-1-jarkko.nikula@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jarkko,

On 11/21/24 04:18, Jarkko Nikula wrote:
> I3C device probe fails when CONFIG_REGMAP_I3C=m:
> 
> 	p3t1085_i3c 0-23615290090: error -ENODEV: Failed to register i3c regmap
> 
> Fix this by using the IS_ENABLED(CONFIG_REGMAP_I3C) macro in the code.
> 
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Thanks a lot for the report and the patch. Turns out the ifdef isn't necessary
to start with. I have a patch waiting to remove it which I wanted to send
after the commit window closes. I'll just take yours instead and modify it
to remove the #ifdef.

Thanks,
Guenter

> ---
>   drivers/hwmon/tmp108.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/tmp108.c b/drivers/hwmon/tmp108.c
> index 1f36af2cd2d9..3dcbbb05ab2b 100644
> --- a/drivers/hwmon/tmp108.c
> +++ b/drivers/hwmon/tmp108.c
> @@ -452,7 +452,7 @@ static int p3t1085_i3c_probe(struct i3c_device *i3cdev)
>   	struct device *dev = i3cdev_to_dev(i3cdev);
>   	struct regmap *regmap;
>   
> -#ifdef CONFIG_REGMAP_I3C
> +#if IS_ENABLED(CONFIG_REGMAP_I3C)
>   	regmap = devm_regmap_init_i3c(i3cdev, &tmp108_regmap_config);
>   #else
>   	regmap = ERR_PTR(-ENODEV);

