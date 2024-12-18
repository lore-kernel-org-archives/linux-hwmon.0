Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADB01C5CC4
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 14:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734533220; cv=none; b=E5kEReUw9apdjtGEbEfxR05IhtXiiaL9T86UexZ7g8VrbUpELoOAO91zr71PX7JDYrHmxcXE1uQIMytxGCF9UMFRBXDxWz3Tnaycytj9FL6t27vlDvamoyceSHqGb7lcijphtWMHmYj3I4SThsuQzUTdpUk5PUkr5rDT3Jg6mBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734533220; c=relaxed/simple;
	bh=tlkErINc3KYjWmKsGlBvvm8DkR77CNexGghjwvkzPUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m1a3x+9DLPrXpSBFvI/LNaZa7Gy03W+8mdnHPcE5B7MAnS3IarRE+D8hzoj6V3TZw8GVaDiKCNTWfy81QN9ByCGZnaQhqtmdkiubBdDZw/74utwI+s0LZi9i+zmBoURtsyOF1COD1L3fAPnEHYJ6R9WwArYROPRr6de1esLWGVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B6RV2ft6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B6RV2ft6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-215770613dbso45379175ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 06:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734533218; x=1735138018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X2DQPTjAgR5Ztrq4xlnbDLIZBfJXq7ZHrsJZOnuFhLo=;
        b=B6RV2ft6dHUU3eVkv+HlX2zdoE52NvlZ92Kjf4srfGYvA/7XeoI52c4cajrP/fNvt7
         Y9U0eZOO0iTKQgiHVGSOzTBlg+woIIT+TuLaIJ3I/7yqcomM6WoUDyQo6yMto3y556M7
         4B3tc/AhAp2/RQ3YCjpHu58HiM6+RqBx5u/sLHaSTqjDGv59mu4bZRG6/7vWaJwcTpg6
         ILgLGvz3rWV+GzSPt/jyZqhUktiA2+CeHu2qjyjkWdmI/YK219O2guoFAIqh8hljD3Uv
         LNp0i9ekz2HPtM8Lt8xbYV4Sjey4x4i7xzz/pcUQOSToY0wFF5/0lLGTMWEYzfgz+P9z
         J9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734533218; x=1735138018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2DQPTjAgR5Ztrq4xlnbDLIZBfJXq7ZHrsJZOnuFhLo=;
        b=wMM+ya9c2P58vd23hyc2x4BfuQTrZS8llCQTrD5qqu7rWcPRKHonVygazBSczZsO4V
         ds3M4J2f6nxDuHjlGa/GiPLPgQu3+Ey2Hq/m5MuwOfIQO4nnBF1ZKergoXg5uCOZTYo6
         m4iGRiUpzHQGtfXvTvXdJMXVcfgswzIRbAl3PXx3ya0taRnSoAo947u0r3UowJ1IEH0B
         krA1pPnOZeGBAjxOSNeuiLiVTpZyL3k5LZXcKT2xSCN8ZQWye032Bc8+SuGNwTLD54s7
         jfojQZCs4fm98vJGjCmzl1r8H7R4Q0HkoxjEtldQY7tcl94J6AwxkrbYhY72T7/I9Rtl
         u0Xg==
X-Forwarded-Encrypted: i=1; AJvYcCW19vE1Vg4hadYgLdSG/a0Tb/uRrk/5w5oiMqmP120v52Jkqp/vsWz6nMrtHktGtDeg7oq6Od98Svh6zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0R+wCCUPidQeg2i99i8ygTXBVJIYIZdUIC72NT+JecNqI5YQs
	DU/GzsO/YoWBsuPksyy1Ko9whvpyA5XYFef477fXndzePe2qCd8NrZzY8g==
X-Gm-Gg: ASbGncv5j2nLr7Ect5IWgTC9aFzBK3iX2QT5++OSR57GlO93Yk0CMnpzJHz81F8VmTQ
	2DAnatLwsIA/7UDdcbpIVifvmJPp1VR3NfRpJHPgTNyMoJkdOLfYUAOgXg+rV8B8qmIlQeFYsVu
	WcJrEIfvxAF4xtT1fUgKs61oLVxRkyYxh8+Hfm/nAW0815DoTCwjAG5/6xTdXDWRxjD5/XYYhrn
	kvlOb9IOvBU6AhET9iwqif5H9xlU/nJ01/q0acDM5UddZKia0JvTG4G8pn/OnzsBeZNXT2S/KsE
	ynnXHC+2cELl1DRMyf05s/4Si6uhag==
X-Google-Smtp-Source: AGHT+IEZIuV3FIS52Vk9aHI/afzsG+ULiqhwbgstrQ9qVA+kRM6gAqq1u4Or30iKF7N82Gh0ZdC2ZQ==
X-Received: by 2002:a17:902:ce92:b0:216:2b14:b625 with SMTP id d9443c01a7336-218d7223345mr47405615ad.31.1734533217762;
        Wed, 18 Dec 2024 06:46:57 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e720fbsm77016545ad.269.2024.12.18.06.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 06:46:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f195e1ba-b16a-4643-90e2-56328a23fc16@roeck-us.net>
Date: Wed, 18 Dec 2024 06:46:55 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH] hwmon: (lm75) Hide register size differences in
 regmap access functions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241217225210.3298091-1-linux@roeck-us.net>
 <Z2LEH8mvVf4Uai19@ninjato>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z2LEH8mvVf4Uai19@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/24 04:46, Wolfram Sang wrote:
> On Tue, Dec 17, 2024 at 02:52:10PM -0800, Guenter Roeck wrote:
>> Hide register size differences in regmap access functions to simplify
>> runtime code and to simplify adding support for I3C devices. Also
>> use regmap API functions for bit operations where possible.
>>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> This should help with adding I3C support.
>> Module tested only.
> 
> Does that mean 'build tested as a module only'?
> 

No, it means tested by loading as module, simulating a LM75 using the SMBus
stub driver, and running a script on it testing the various attributes.
The scripts I use are at git@github.com:groeck/module-tests.git.

> With the following small patch on top, it works \o/ I suggest that I
> will include your patch in my series for adding I3C support. I have a
> few patches on top already. I think this makes dependency handling a bit
> easier?
> 

Makes sense. It needs more changes for chips with 16-bit addresses, though.
I'll send another version.

> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index f2550f623bee..1ef47ba6b458 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -653,6 +653,7 @@ static int lm75_probe(struct i2c_client *client)
>   	if (!data)
>   		return -ENOMEM;
>   
> +	/* Set this early. Our custom regmap callbacks need it */
>   	dev_set_drvdata(dev, data);
>   
>   	data->client = client;
> @@ -662,7 +663,7 @@ static int lm75_probe(struct i2c_client *client)
>   	if (IS_ERR(data->vs))
>   		return PTR_ERR(data->vs);
>   
> -	data->regmap = devm_regmap_init_i2c(client, &lm75_regmap_config);
> +	data->regmap = devm_regmap_init(&client->dev, NULL, data, &lm75_regmap_config);

If  devm_regmap_init_i2c() doesn't work, it would be better to define a
regmap_bus and use it to access the registers. This way the actual regmap
configuration would be the same for i2c and i3c, and only the regmap bus
would be different (or at least I hope so). I'll do that in the next version
of the patch.

Thanks,
Guenter

