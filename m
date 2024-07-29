Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174A27E563
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jul 2024 03:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722223000; cv=none; b=pK1Jokh7qKcwmFajR2X1D414fuCO0eBWRxZCnQ4z4yTunrn/zD9szgAG2fz4g9qDIluirglOyxpwgp1o9ixbGGTOVsP5R1oH+MND4NtXD85ofQZm64AU3A/QBrHSa3nDs5p074nmf7s8AyjBSgGvJG858LFlsxLxLgIwlPSK2sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722223000; c=relaxed/simple;
	bh=XqqdQYwoG5+1gzIXk37TZpbkJSU8F/gi0nIxCfM8mpQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MTPQSNP2xFoQkGSezE/mVT9zQnNFch+R+rOs4bYFU8YcuHyZx5ZRYSKp1+LR37LJ82iPRnQZuWftL3dVxLk8GmbYwZFSNIMuHSEpnJt81xFBgdAjYphSKAh7GQ4Z8DrPda6b6mxc7u8mUMmLgcmZaZmn3Npk4sjDuqwtWaG+/v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Is7CUKER; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Is7CUKER"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc47abc040so13213965ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 20:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722222998; x=1722827798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=K/2ms6sV91UTLOQMx9ktOyXpX+5Cot7DPRoAAia+I5k=;
        b=Is7CUKERBBW7MiU0wu9xxQlN9XxuzxLvzqc/RrlbCgpAy45afwPAiXSZrXyvWyCtqR
         YqxbmDtkEHUK6glsvMU6zU3n0ql9iz2qIMf9L6c0pyHqIWUvaGAqKq6qGBo4NRnxN72f
         k4Gd4cYtFK0zy2j2XaI50pRdvpfiDuXyHk8hDQ4FtqiAeMYY9NK8q3DtfkBp4wP6TQwR
         A/PRyWh7+sHkgi1Y8lFk/LDBeZNDDXw9M5/W0luseumQMux0qqimEmA1HZgTz8W9DCep
         qSU+NKljj1H4k2lvuW6zknleJg6Jgop0EClFI4eE1+XuMN/WYf/Dq5t2pEAnd6Gjlocx
         777g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722222998; x=1722827798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/2ms6sV91UTLOQMx9ktOyXpX+5Cot7DPRoAAia+I5k=;
        b=n1YjGo7hFMuad7UexriLUWZR4gi2xFaHc/FN8zLAXIqQkf2xpdbIqo+wTqyDaWPf9E
         4aB53ykmTDDGSNSr2lUAH2aJXpZmHTQXCzJUW+huYiI/juNzbk/b2x8MBckXCPqf4tbF
         QZ2tx12TzwT0zG3ufanEIhbS0aQViphhvwU1TEfg+OAY5Att1v6OEBFF49c4d+ORCiwR
         b4PkuO8uvTAShc+29mS3anXflgbhc2xHx0QhjjiJPgWnojdWPheJiKO86kRtv1gwzqyN
         ihFU5jeqJtU3qyyX9KY6AknbAtyw3AOxyKFYlPo5LIq0hpw9XUcTXmVXk/ri2/HLHB6/
         yuMA==
X-Gm-Message-State: AOJu0Yx2MG/mZxsKXf++etfCjWfS01qDptkHAnBQa7SJ3Iyn6mx0tZPT
	z6pzBvzg8aKVnN5lPgg0lXlFAMrhq3ir5Jjl+UL2rywY20tK9wii
X-Google-Smtp-Source: AGHT+IHfjED+g4ieKmRfnBh8kglsI9o9909hM0G/zxabAD+ndp+IjaonZ5Scv8vjF/HG4TCBXr6pFg==
X-Received: by 2002:a17:902:f551:b0:1fb:fc96:757e with SMTP id d9443c01a7336-1ff047df750mr42941005ad.37.1722222998286;
        Sun, 28 Jul 2024 20:16:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f614c9sm71263725ad.224.2024.07.28.20.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jul 2024 20:16:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ea599334-5916-4d03-a662-a0d02d1296bc@roeck-us.net>
Date: Sun, 28 Jul 2024 20:16:35 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Zqb75Ue3NjENz8g0@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/28/24 19:18, Tzung-Bi Shih wrote:
> On Sun, Jul 28, 2024 at 07:37:12AM -0700, Guenter Roeck wrote:
>> -static void max1619_init_client(struct i2c_client *client)
>> +static int max1619_init_chip(struct regmap *regmap)
>>   {
>> -	u8 config;
>> +	int ret;
>>   
>> -	/*
>> -	 * Start the conversions.
>> -	 */
>> -	i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONVRATE,
>> -				  5); /* 2 Hz */
>> -	config = i2c_smbus_read_byte_data(client, MAX1619_REG_R_CONFIG);
>> -	if (config & 0x40)
>> -		i2c_smbus_write_byte_data(client, MAX1619_REG_W_CONFIG,
>> -					  config & 0xBF); /* run */
>> +	ret = regmap_write(regmap, MAX1619_REG_CONVRATE, 5);	/* 2 Hz */
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Start conversions */
>> +	return regmap_set_bits(regmap, MAX1619_REG_CONFIG, 0x40);
> 
> Should be regmap_clear_bits()?


Sigh. yes, of course.

Thanks,
Guenter

