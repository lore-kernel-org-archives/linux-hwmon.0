Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9E931D74B
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 12:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180433; cv=none; b=pY3qKm01S64/2w8Q4/FTkPb0S4yGtvDXRniFYlNsQIDtadbba0/9JANARG0KtXXxbGRmnICjLR7+pUgGBbgkLbGW2h8qm5Cq3BzeKr0rwH8HIi7UmJ5KL8swbdYBlc0+SKVQHcyeN7ZMUlys2JQnmKOJ/fdMfqD8NbNzjTG1FMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180433; c=relaxed/simple;
	bh=B1wxz+0Np9sLSAVTR6MifFCXLq0dVzmxSBUJgRXPIl8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qFglQy0IZFLafWSHaYQhtlZ5Ax0CHm+uap1QE6nGnfGYMUOWkO3nhybQlvthAKlHpQ9aY57cdJEEwJABYnOgqVFWJikBT0xk1qVVAUX8x2NC3nV4kYtGIO0FFdc/ciRgbJ/s+4rhh6oCdYSvItbDOuoyduBQfZK/+ccOZ8GbX2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jY4R4q/D; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jY4R4q/D"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso75284055ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 05:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781180431; x=1781785231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MXNKXMLzWIjU2Ycb8dhzGFNxNx32Scj3Bq4ZZZi3acg=;
        b=jY4R4q/DKFXSyEWuFYbQvnBGlfgMMsdQSlBbzKLi4PZdcQXur1Y3aMK62hcT6wMwQC
         LBooskrt0xgKx2qzoP+4gA1cv7747KTeXaC6wg9Dox186eHCq0KNfhcLImPX9+2N3dum
         Ymr4pyRprZfabnZ+6DEMyCBRLRJ4MYMRm9OacWiXi8Gy/xHPyO72VGzg4w7R0hJsp2+K
         87Z0i0WeSzDjKhKKaV/NFpj+dnv6mg85DRHfJatofL7dCO4iv6czD20dTV3lrbIV/7xw
         PIiDrp67k9NToZw6dYG09/K6yJSk1+KoOll9a6qGbuIfA2Y36kVWQ8IQdO/jNmegQa7y
         PYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180431; x=1781785231;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXNKXMLzWIjU2Ycb8dhzGFNxNx32Scj3Bq4ZZZi3acg=;
        b=qmwzP71Ai9JbtVofrATSSqRiIc4ykplSUv52QEiShpyBDTSK2ibOMBTYErawT4VcjJ
         /gNacGb3qtZJFklDnA0OPU8pXAHemK6Wy+uXWVLDiBWa54IsUlecuCzsCL9h4UWhbIF7
         Ed4bAy5UpcaCzeknPkerQvJn14HZKy+FvXVMxijcDqFdFOZs+fEIKWliIZTM5Xjew0Uk
         4YCT3+RiX4yJ71o3qYB0nc96fqLz6YAqRzpiFVsNJ+7+suueMx1Y+7VAVBccQ+AwUmwM
         EFCgRg5QqU3nLOK1myLyipVxNHRxtKyLjUrYsiU6HRkA+LXsrJCJ6NBzFrMCxz57X6b5
         qsrA==
X-Gm-Message-State: AOJu0YyeNNhAjZTyWX1UNxpuwGXhRVLn/uWlc3DM4rWboN++6eabRX6Z
	9ch20NfUB22qUDNtvUcgXxG3rhPX0jU2IV9bR/2r4kSe6K/cu3UsUKJo
X-Gm-Gg: Acq92OHvxfJYiXhWg6/4yFbyP9spYx41T36CzUluJrDp8mAPMGnCp58gEHB54e4NbD8
	w8fCixizzOVDyT9yFRBzBC33Znli4uilTDB8E43yc3VS6LVCOSditDYoRkEvSkLUiyGiwU4QHfX
	Dsouvr9dQe8XKuqolizjs+X7l1xYdia0vi2LEIADdhJ4JTd2PfCFnSSagAI5nOB7CA1vAFkustx
	/tcIYDgom2r3/nTONn+tubCKQE0Mz5CAKsb3lHRSts4pTwfHL6D5bGvg7fE2iYCKiEZ2QlfYIqV
	/K6muEyxbITpZwRHlRpuR+0l2knUAydu3WNOBpLM+IX0QAzB2AV84eVG8z2FZ9goMaYUkoP13W2
	ZjgHv2cZVKDq9/FP8SvNyJG7z+E94PuOqatvpSH/uUE4rgSZWArd9JbgGvJnD67SpWpOaArkcFd
	jQUah9KXLRFKAa2a0GFhh/F3sEvUAH851OmHHqloYrhix14bDo+qubtjMD78obTVnwKxR5gYY9F
	MBsAeeDbpiBEs+AkRzJYw==
X-Received: by 2002:a17:903:1a88:b0:2bf:2e06:2ebf with SMTP id d9443c01a7336-2c2f3054645mr32066765ad.31.1781180431415;
        Thu, 11 Jun 2026 05:20:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6e294sm276802375ad.6.2026.06.11.05.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:20:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6b99683d-5030-4c4f-a37c-7c1328b8f08f@roeck-us.net>
Date: Thu, 11 Jun 2026 05:20:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hwmon: (pmbus/lm25066) add SMBus current limit
 configuration support
To: Potin Lai <potin.lai.pt@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@qunatatw.com>
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
 <20260611-lm25066-cl-config-v1-2-02e567bf3d91@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260611-lm25066-cl-config-v1-2-02e567bf3d91@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/26 02:58, Potin Lai wrote:
> Add support for the mutually exclusive 'ti,cl-smbus-high' and
> 'ti,cl-smbus-low' devicetree properties. When present, these properties
> override the hardware configuration pins via the DEVICE_SETUP (0xD9)
> register to set the Current Limit Configuration bit (bit 2) and
> Current Limit Setting bit (bit 4) to SMBus settings.
> 
> The Bit 4 mapping to High/Low current limit is handled dynamically on
> probe because it is swapped for lm25056 and lm25066 compared to other
> supported chips (lm5064, lm5066, and lm5066i).
> 
> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> ---
>   drivers/hwmon/pmbus/lm25066.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/lm25066.c b/drivers/hwmon/pmbus/lm25066.c
> index dd7275a67a0a..20e114bdc882 100644
> --- a/drivers/hwmon/pmbus/lm25066.c
> +++ b/drivers/hwmon/pmbus/lm25066.c
> @@ -34,6 +34,7 @@ enum chips { lm25056, lm25066, lm5064, lm5066, lm5066i };
>   #define LM25066_READ_AVG_PIN		0xdf
>   
>   #define LM25066_DEV_SETUP_CL		BIT(4)	/* Current limit */
> +#define LM25066_DEV_SETUP_CL_CFG	BIT(2)	/* Current limit configuration */
>   
>   #define LM25066_SAMPLES_FOR_AVG_MAX	4096
>   
> @@ -464,6 +465,8 @@ MODULE_DEVICE_TABLE(of, lm25066_of_match);
>   static int lm25066_probe(struct i2c_client *client)
>   {
>   	int config;
> +	int config_new;
> +	int ret;
>   	u32 shunt;
>   	struct lm25066_data *data;
>   	struct pmbus_driver_info *info;
> @@ -484,6 +487,28 @@ static int lm25066_probe(struct i2c_client *client)
>   
>   	data->id = (enum chips)(unsigned long)i2c_get_match_data(client);
>   
> +	config_new = config;
> +	if (of_property_read_bool(client->dev.of_node, "ti,cl-smbus-high")) {
> +		config_new |= LM25066_DEV_SETUP_CL_CFG;
> +		if (data->id == lm25056 || data->id == lm25066)

LM25056 does not support setting the gain via software, and bit 2 of this
register is reserved. These properties need to be disabled for that chip.
That will have to be reflected both here and in the devicetree file.

Thanks,
Guenter

