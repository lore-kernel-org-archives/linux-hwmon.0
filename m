Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6526C3C9EC2
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262411; cv=none; b=jp9ZZwLIexph0l5l1sOIoe3Q0nxGohgpFzIVwYP/ziTBxKxLRN9S1ejvSAtJY62k1g1KlLCtFdy6e6DpLXnRORVqze0irZhviotWrMA16nuiraMC4tGjQxBO/r9BSlvPQDYQ54nOpVbYZIiH8kbU7eLN/tR6Pb/FmMkfQGqyvwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262411; c=relaxed/simple;
	bh=jY6dnqvHqg10KwmO68TrPmov0yHK8C6hEToNCKrRsr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6oFpnP01hRewCt9DH83qLDXWBVHi1W38++z31oEXGf3MiuVQkwziQT1OZuWqQJDDjq0jKKSSD877dEN7IlZ6uOg8UCnqlKae44Pj55BCgFKPyyQ4kzk0vHNm4DJ2zGkEHsndZPsVTb6yB+kiDtrXJuc3xBdQcQ2uMZIg4qhp+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuME5CsZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuME5CsZ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38511175ad3so82886a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785262409; x=1785867209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YMSPpx6yGKTGt83Sgz1eRa+q8wGQ4JN++szdtt2dYyA=;
        b=UuME5CsZQjqyb2mrQUATIO4vZ6+C0hSQdhuMNCT3jWqVdCo+gGA6L1gidOn7INn8e8
         JD5Z5HFpaRRZKWBNf8D7JN6xTgSWqu8kag02bZ93t4Zv2DCSRl+DgH4v6bSmX9DgC8gr
         h5xdOhnjVUrk/RDHquYuwH/qLwnqACfMVvyyqLsVUPagF+SoDevAXpvt2cysVGJv01/e
         svfmMcJ5yD+eD+urMqaBc6vECa0+FKWsNkCZS7Q6WxwNUgtuVek/Yr46iJuhjxIWlQy0
         Ix1mPrtWCI9yszseN2PsfBt6HNPn+P85b5m96pAj5wrMqe6CjkBe9GntTILe8ms4p298
         uR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785262409; x=1785867209;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YMSPpx6yGKTGt83Sgz1eRa+q8wGQ4JN++szdtt2dYyA=;
        b=mdMJVABPpbhozkWpd2XOtpka+zAvw4pTUAZUuIH4ele1ykOZ0r8+Tfcrfm4o86GYr3
         HxRXpZLpng0udm1HclkXm99ZiByl/jLgQjcBnu18uojJzF/qcAN4rGNt4fnlszqjfmuj
         2gQqCz/chXF3U312G/nZ/p4nlDy0rPtfa9jx4qcAi8aGEMTcsD013B5jreD6kfLZJloB
         XK+N2+agAP8xQwKNfFOqdILnEC/PY02FAyjuQkvldDpBfkud5EU+6J3Y0YxpU5bD7XG0
         zMNCA1Ou+6CxdX44cSwk12vpcnlIJjcNORmsE6sN4bTUM+yDNLAIiv2y8rkJRsTd6XZP
         /JAQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEwPQKFIixa/jkeOxBw0a1iY+2c8026qkkMQmEX3NFx0idh2d5KGZ/lFav1HTFoFEoWLKl0Cj7z8kGpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAPXV2FacMFgK31oSqcilqXUkbyJ2ULd1dfx32pod7tPKWuHDq
	Nkt5ZXTHGsvqq1Khs/ztc6u10YpRwuPKy4RlrMMrafhK3ZR+nQQQq84p
X-Gm-Gg: AR+sD13rCEjCXYBbgdzo8r1Kh6TMBHKlufo60M/Z6aPBdhn78TFeGqVfPwwIFqYJKXJ
	9t92215fNd+AY3GPF5khx+mL6UTQHxFmgg+hNuavCZpWYe6+WLpkC7dMRpjsVAacCOCWdSFnNXV
	EZWW4sfqeRcesVJE6ZUnHgmN3gcY1sjiXLDGBHqzJKWGi/D4hvqXue8uPPYFOsvqu0DIWD+gl4V
	NFuwo6xGatQQIpHd+hD1MpiUBN4fxwNTdM/YqYXMpkAsBGoq9653vQqKNhK6aqkGFdeBFxDr4SP
	cz4FEv9nUzY20pfA7N1B8MQzrH5JmQm0/5kZ296MQdAJRgZwXnuOcnIw84v71RjugNBECObtvOn
	8khP28ut8zmhoi1rdXcUMZPEMnNlofoemQXYbtUIU3tSafi2gXcxg/TuEwL91+jlm7qt4k24Jpp
	hzBGS+mxaSe3nKs6MemYQLAKO/LiE7lYHU/elv43ulKXDPEhdUsj0=
X-Received: by 2002:a17:90a:d888:b0:38d:e658:595a with SMTP id 98e67ed59e1d1-38f6a30d87emr3634504a91.2.1785262408610;
        Tue, 28 Jul 2026 11:13:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d373c3sm915235eec.23.2026.07.28.11.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 11:13:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e8ba1c8a-cf68-421e-9974-f31f31e90e59@roeck-us.net>
Date: Tue, 28 Jul 2026 11:13:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
To: sashiko-reviews@lists.linux.dev, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <20260728162749.A42051F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260728162749.A42051F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 09:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Stack buffer overflow in `pmbus_debugfs_block_read` due to unbounded return value from custom `read_block_data` callback.
> 
> Pre-existing issues:
> - [High] TOCTOU data race on PMBus hardware page selection during probe.
> --
> 
> --- Patch [3]: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data() ---
> commit c4bd4d03203a9fd14a7a2bcff69ec842b441fa68
> Author: Nuno Sá <nuno.sa@analog.com>
> 
> hwmon: (pmbus/core) Add mapping function to pmbus_read_block_data()
> 
> This commit introduces a mapping function to pmbus_read_block_data() in
> preparation for adding support to a device which needs to use its own
> read_block implementation.
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>> index 3d5586c67f840..d697939ec8921 100644
>> --- a/drivers/hwmon/pmbus/pmbus.h
>> +++ b/drivers/hwmon/pmbus/pmbus.h
>> @@ -459,6 +459,9 @@ struct pmbus_driver_info {
>>   	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
>>   	int (*read_word_data)(struct i2c_client *client, int page, int phase,
>>   			      int reg);
>> +	/* size of data_buf is I2C_SMBUS_BLOCK_MAX + 2 */
>> +	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
>> +			       char *data_buf);
> 
> [Severity: High]
> Does this API need a size limit parameter? The comment specifies the buffer
> size is 34, without providing a limit parameter to the callback, which might
> encourage callbacks to return values up to 34.
> 

The maximum amount of data returned must be 32 bytes, not 34. Callers define
a larger buffer size to be able to append, for example, '\n\0'. The function
itself, however, must not return more than 32 bytes of data, plus the data
length in the first byte.

Guenter
> [ ... ]
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 7b58f71985741..ff4572c473b70 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> [ ... ]
>> @@ -678,7 +698,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
>>   	struct pmbus_data *data = i2c_get_clientdata(client);
>>   	char data_buf[I2C_SMBUS_BLOCK_MAX + 2];
>>   
>> -	rv = pmbus_read_block_data(client, page, reg, data_buf);
>> +	rv = _pmbus_read_block_data(client, page, reg, data_buf);
> 
> [Severity: High]
> This is a pre-existing issue, but can this lead to a race condition with
> sysfs accesses during probe?
> 
> Looking at pmbus_init_debugfs(), it traverses pages and reads registers
> without taking the pmbus_lock. This indirectly invokes pmbus_set_page()
> through pmbus_check_block_register():
> 
> pmbus_init_debugfs()
>    pmbus_check_block_register()
>      _pmbus_read_block_data()
>        pmbus_read_block_data()
>          pmbus_set_page()
> 
> If userspace reads or writes to a sysfs attribute concurrently, it acquires
> the lock and sets the hardware page. Could the lockless call from
> pmbus_init_debugfs() interleave between the sysfs thread's pmbus_set_page()
> and its subsequent I2C operation, causing the sysfs thread to hit the wrong
> PMBus page?
> 
>>   	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
>>   		rv = pmbus_check_status_cml(client);
> [ ... ]
>> @@ -3564,7 +3584,7 @@ static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
>>   	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
>>   
>>   	scoped_guard(pmbus_lock, client) {
>> -		rc = pmbus_read_block_data(client, entry->page, entry->reg, data);
>> +		rc = _pmbus_read_block_data(client, entry->page, entry->reg, data);
>>   		if (rc < 0)
>>   			return rc;
>>   	}
> 
> [Severity: High]
> Can the new callback return a value large enough to cause an out-of-bounds
> write here?
> 
> If _pmbus_read_block_data() delegates to the new read_block_data callback,
> and that callback returns a size of 34 (I2C_SMBUS_BLOCK_MAX + 2) or greater,
> would it cause a buffer overflow?
> 
> Just below this hunk in pmbus_debugfs_block_read(), the code does:
> 
>      data[rc] = '\n';
> 
> Since the size of the data array is 34, an rc of 34 would write past the end
> of the array. Is a bounds check needed on rc before using it as an index?
> 

