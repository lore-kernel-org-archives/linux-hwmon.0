Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68C0429825
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777560779; cv=none; b=AqKfIkeommDIcQZ66QfDo/WQWR5K+cMjxHkj5CLRADCrNEqqJw0liKFt216ETEqHyUNGqBDiwBNssYrhP2ksk5iCo9aOS+OLPkSbbYWpHFLQ6PCyHjpHXhkckWBUk2AIDf+Zz12gAc4AxoUI9LiTrpFOE/ZKqrzPncC60+WJPiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777560779; c=relaxed/simple;
	bh=xXilKtlBu7ORsUeINFBNTicjpEJsSa5+vUSye8RrTVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQgHsYrqWIZJBigaOrPddDov6+gs/YszssfCH6OQdEGv45soQfufk8vOS/CH7LBIYSRYaETSmQyVFxdeFescQUz+VAKgv5IPzafw7qrjA3fRWrVUy8Knt9Twiv77DMGoTl2NIJkNFaIVQgjlfFitugI5kTe/1nRKQMZZLGt/UjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8G3AfVl; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8G3AfVl"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso971104eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777560778; x=1778165578; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=s97kimBkPdgWPFwDad6XY/gtHcLtkIRpBpV5NCCXEH0=;
        b=o8G3AfVlQEXzH/Jbsw8dxXBGec/cq9NkklnA1rBA//8iLS4XmKx1KikF+YxON51DNQ
         T4nLOGejZX5UTXy+eeFeKVhfrmgY+TVjFDb9IQLSmeA+a8UNGg87RNnTenxq6aholmWa
         gX5fFQpJUWugTcfN7SeAvqg1hqWWApf60dZjZoXxHztpPKTGvHgGZBAWQYoZWCEn6BFP
         6pkhY4CFi/Z11QJlxZAsRWN5MnIYaWIXVvk4j6z3ZQml+s4CHLXQm21G1k9zNXD/if2G
         Q9Z3bAkAspN3qxomsDKcMN54spauInfbtWgHXucya4X8F6ChBNrTMo8lXdkGBtKChA/g
         +yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777560778; x=1778165578;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s97kimBkPdgWPFwDad6XY/gtHcLtkIRpBpV5NCCXEH0=;
        b=SAR407WAxnZvir6wK3nrsEdh85vOH/ArrQ71YPHXwCg11kePSBvxrj62PzbU/w+J2L
         V3UlgA8U7GOV+Lo2tjfzFeHLOF+2SD8G+ZskvZ/a6CdjQiISwqUOZbbdcB9EOO1up7Ok
         ++LVsmxp/SiNXp/+DgWoufHqryHi0xImIM/Sh03NxbizxUCNIirVS/gXSIZ//D3meon0
         4xmkt32byCRfkkTYbtJICDMrKvH2w7elVhO2kyNwZP6KsdopHdIS8in+NdH5FaZqQzP7
         of7BlVo/5R83+HRw5CTIYjPk+w6Ku74x4hHbBw0oKFw73D/w53JsEekTD2TG0QCEOSKT
         2EwA==
X-Gm-Message-State: AOJu0YxeP/h+0yzcR8wMCqeUOX2lbkF3N0PrT0kfoFbXIAHOFrFEOKz7
	/GtldYXqGCKEJxxyFa220eHhAbxcSAe/hukRGC8BszT9B/ixrlhYCY70
X-Gm-Gg: AeBDieuz5vTwwPU5eExK2EvPPi0MgMZSIPCNya2C6R5NJ1+PNFjxk48/zkRXQ3R0rS4
	lsdds7GH+NNa9S47FsaGEKDtOwiFrPKAqbRWIa9a/aPRvWCzE2JNDsWtQFr11sm74D1hDSdwX4S
	/P1s3ux/z1Lz7r1e/F+B9ylS8aw0tlYWzqzxMyDa4iTdWwkrTzWo55x4VceZueFNSeumH6APpHF
	jZIZZXhitTM71jfOPKtxuXveF+OZvNObOiZlLHJZXHHJdCVw9rRGqZQPMAE+4BJ10STbPKqHxq4
	MH2862jwAW2yFrhZs4fC9Ldmw7DMaYm6eFEztIfQGmjBdI/2rD2J7bCr0YSC9kNY7hw9jRn5GQp
	fg/GNu48QUct8yKXfMonjKCJufgfffQkKO8dixw1AMhUvKm8JMmlo7WukpEbRPgNGJ/JEUxJS6b
	y6YucRQQmOBzQw70UvP6KPsVXRyqtUdaBHAIMACRniQG+IRapHWQmxeQnFfl2B9V4FccItaqfpk
	H/XlmAzivw=
X-Received: by 2002:a05:7300:1c24:b0:2d1:9b35:4edb with SMTP id 5a478bee46e88-2ed4a7bc357mr846236eec.0.1777560777350;
        Thu, 30 Apr 2026 07:52:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3889d657sm166134eec.4.2026.04.30.07.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 07:52:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e2d14b68-7f3f-4bcb-8687-857e9335deb8@roeck-us.net>
Date: Thu, 30 Apr 2026 07:52:55 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: sashiko@lists.linux.dev,
 =?UTF-8?Q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
References: <20260430-ltc4283-support-v12-2-5dc9901f2567@analog.com>
 <20260430100343.45D31C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260430100343.45D31C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/30/26 03:03, sashiko-bot@kernel.org wrote:
...
>> +	id = (client->adapter->nr << 10) | client->addr;
>> +	adev = __devm_auxiliary_device_create(dev, KBUILD_MODNAME, "gpio",
>> +					      &st->gpio_mask, id);
>> +	if (!adev)
>> +		return dev_err_probe(dev, -ENODEV, "Failed to add GPIO device\n");
> 
> Can this error path lead to a use-after-free?
> 
> According to the I2C subsystem rules, debugfs entries attached to the
> client debugfs directory are only cleaned up during the client device
> removal function on driver unbind.
> 
> If __devm_auxiliary_device_create() fails, the probe function aborts and
> the devres subsystem frees the st pointer. However, the debugfs files
> persist and retain operations that operate on the freed st pointer.
> 

AI taking everything literally :-(. I'll have to reword that guidance again
to include the probe error path.

Guenter

