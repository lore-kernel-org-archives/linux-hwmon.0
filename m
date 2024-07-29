Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9719383CD6
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jul 2024 03:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722225526; cv=none; b=utg7nQTNwSqgc9U2FnudvmnK7WKoPDFXArwaqfQs99ilwJsWUSPzbevJpl4gvb/9TMWcfd4yHp8PURAShG6vA5o6ixoxCI33YX3ifX9R2l0v/9m5mD3MVtBYiV0K2sPuuWMbkarIcjlrsr83SqllNAc4i4fJuV6M+OkB4BpaF9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722225526; c=relaxed/simple;
	bh=9DddguxozJV5pflcX3mHjcvMGzvB3U0GqujxdbhIUiU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xw3mPwcSuORCQfyQdTyD3ERab8fHjiWfCKvgMMKp5EvP7DltEEg84088ZcWpnuDTFwdajtjZOA3QvaEuUuMp/iiMHBGCrRLxHwevrDudSw0Avr2sPD4TGcgYyWQrtDZShj6vm/LI+PKmmRw4J/mhtxqVFjqMjpeFjfmNrf26xrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YX5Fczyl; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YX5Fczyl"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70d162eef54so1713606b3a.3
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 20:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722225524; x=1722830324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=lu82eOrVGA51x6eJP3G/CJ3NiAxWjxtOjSBRSgPRex8=;
        b=YX5Fczyll/hdOOq3JoqxPq59/R3kmgFkk6f/E8ra3dJJj4DwoGPlOUc7xIjSCz4UGG
         7FOM2gvYRYUPTSmLdUeV6F4IMS9xnqoPXm5V00AhzCtqn8H8C2d+da1NodptMIv+3Vfd
         JR7zjpzzYMNd9jngoHK0FU9B6Exr40JeszxdJmpS9IxrfdKDW+Ri1UbbeDRCtW7DE8Ux
         t4VSLAqY/fap8w/bCRZSWBjXGLjzMVhV+ei3CQli/6eBz0wEO7Xu4MbbvusSJ5ryxmUM
         Mq+NQaKh0l37nyae4XqwOmNBXzoibEoy53tevoPWTQ0RvipmAMMIhwQVyEWiLsGAr58/
         kVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722225524; x=1722830324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lu82eOrVGA51x6eJP3G/CJ3NiAxWjxtOjSBRSgPRex8=;
        b=I5B2FifJ1YulT4tFsMJJw6Oj0dsPQ7lBMUdmBfRSsq8FjhCnqnoB9MzsTqYZ2PEAIp
         pjwO1TwT+e9/+i0wivC9azpugLKTcVrhT8o7UCw8gFf8KWNEVe5yQepEANi855HS60+o
         uzVkgk2goaViZpiXRKBe9vzdA0TVYOysx1S2On6JM+03Vf5XDVfycYt10yJKJ5Z7uGKF
         k5PrSXc7wtPAeyuKGNGutg8NFQK1HvIiXf0Gm2vekvkpWhNYWMPFb7Xe2rnx3x/HP8g1
         mljucUINseKYAA366wSfMAko+mb40aoP0xZ4A1Bp9ZwIfZGkj4FrfeFDcMC9s7cstPVH
         1NEA==
X-Gm-Message-State: AOJu0YwAwaxLIy7j+JPJ8HwyI7ECuz5KYy6nlwCSkmsa2YbnUcmko+iu
	+PSHnJ7ZzZOtgUoVu4JY9t+yIE/E27FXdShPODD4sYHaaudivgSb
X-Google-Smtp-Source: AGHT+IGmxPPI7de7NXA3DsNKTC8PneVWe5FX+2Vg+25okb6M0xA3x1VMcOgUOR7t2mjcMgr6HBYqfg==
X-Received: by 2002:a05:6a20:2455:b0:1c3:ea28:3c0e with SMTP id adf61e73a8af0-1c4a13afc2bmr4482309637.33.1722225523816;
        Sun, 28 Jul 2024 20:58:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cf28df0816sm7448896a91.40.2024.07.28.20.58.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jul 2024 20:58:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <597c61c3-db92-4c8a-b74c-05b2aa49ac70@roeck-us.net>
Date: Sun, 28 Jul 2024 20:58:41 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] hwmon: (max1619) Convert to use regmap
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20240728143715.1585816-1-linux@roeck-us.net>
 <20240728143715.1585816-5-linux@roeck-us.net> <Zqb75Ue3NjENz8g0@google.com>
 <ea599334-5916-4d03-a662-a0d02d1296bc@roeck-us.net>
 <ZqcLUDCtxKPs-sRN@google.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqcLUDCtxKPs-sRN@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/24 20:24, Tzung-Bi Shih wrote:
> On Sun, Jul 28, 2024 at 08:16:35PM -0700, Guenter Roeck wrote:
>> On 7/28/24 19:18, Tzung-Bi Shih wrote:
>>> On Sun, Jul 28, 2024 at 07:37:12AM -0700, Guenter Roeck wrote:
>>>> -static void max1619_init_client(struct i2c_client *client)
>>>> +static int max1619_init_chip(struct regmap *regmap)
>>>>    {
>>>> -	u8 config;
>>>> +	int ret;
>>>> -	/*
>>>> -	 * Start the conversions.
>>>> -	 */
>>>> -	i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONVRATE,
>>>> -				  5); /* 2 Hz */
>>>> -	config = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONFIG);
>>>> -	if (config & 0x40)
>>>> -		i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONFIG,
>>>> -					  config & 0xBF); /* run */
>>>> +	ret = regmap_write(regmap, MAX1619_REG_CONVRATE, 5);	/* 2 Hz */
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	/* Start conversions */
>>>> +	return regmap_set_bits(regmap, MAX1619_REG_CONFIG, 0x40);
>>>
>>> Should be regmap_clear_bits()?
>>
>>
>> Sigh. yes, of course.
> 
> With that,
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 

Thanks!

Guenter

