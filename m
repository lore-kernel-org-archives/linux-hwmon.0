Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB6C1805A
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Mar 2025 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741559846; cv=none; b=ZUM1l+2K+cp+coo4QtqbVt+nv81szVjldlNqgAp8gxAbUmfHDB//STNsgW7VhRNhhOZIrFnZlpYYtvclEsHnC3jYiTKMeD2S0VdSNVxTICGKwd1eui9toZW55GBNc9W5J+iVadzFF1XwSkhMII+28NuDz95UseQx40p2YOJzwdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741559846; c=relaxed/simple;
	bh=IW1g2cDRBQXHkLl1fhedw4s9tWfPKLquTjVzdbRzrNs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMxFHVl+TLfKlCCeZOTdOzhfji/B/nu95Xew3ZaHLdxVdLmd8CFDanTieZpw3Zj+JsbPkwyz9gVOAtiSGYP6veTynGY2uHLn9uky7tke53fKXLxJGVJdbm11d6wwknQbzDOA81FyuI6CHP68HNajcon0IwscX3VMLx+eGn/LuqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hf+wLdQ9; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hf+wLdQ9"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223a7065ff8so48435725ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Mar 2025 15:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741559844; x=1742164644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TIxp7ZnxZdIzLeIvgFLwYBqF9QoyoTJrZ38JDdpub34=;
        b=hf+wLdQ9zbHvEXBlwtNnwB5VWmz/BA7cUbR0pViPKII7qbHfCJrlcEHhb4JiRovQ0V
         0PfZ7S6knr5Ihjq9SH+t0XfS8cFkAYGN3ZfWUdbiQ9b7hFfVzS1gvJ0rBBkk9ZLRMYwQ
         nAkiZ8Fhpq7QqCBAdVgYXKZXptRmWyrUPOidG7muf+QUNFbhWHMoDf+a78CIAW/pdhPN
         xhLhAO5YM7gn0LcrkFx/O+3S3nRATDZg06jSzMrdJdnSOjh4NxbMU/tg6SFE8zCha84b
         5twmtCvWM/BKe0D81mInz7Lhp+0Yh25m0CPpWFsFLINU77e7nYQPKXfUMnVwY3rKBGHf
         sVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741559844; x=1742164644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TIxp7ZnxZdIzLeIvgFLwYBqF9QoyoTJrZ38JDdpub34=;
        b=pH4Vu/YS/vKvmPHFpjnqp69E0StjdZn/1ZiZePiU82+Mml3gaKN+AMSagNaL8lWmqp
         ZiODEouYP66+ztcLc9LXSBGCybsEC0irUO0i9FPfrqWCaO2gh9K/syYlqASc2gmvxWMW
         esChvQxBEKW+gVI99xIFMiDD48eJUF5+lWPxj5cUVHuNFKo8WZbuQxEOC/urPcbuO+5p
         9Mfl0W8MsvXuq/gd/7ZhEKDyKnuxDXJLtJISfa5+lOWUBXSq9Kno2Gie81x9Yw0UtghH
         D7ykf0C4PXxeo24IL72tjUeJspgKOD+Y9fGcY/EL7WhyNMzjyM//mRXyE6dtXYzVQqe5
         KT8w==
X-Gm-Message-State: AOJu0Ywt/aL/PX47uq6RDSwu/KL2cH4GjMft6kLSH/ER9bC+415M/Zn3
	3jXsPysgGUiW8ypEmoVNWjVr2mmhn9ZIfG3m8IDZ/iMTNCDoGCc1
X-Gm-Gg: ASbGnctfGFqg2d/dQILVDnwWWyQ+us/hmcPwsN5PrwmTL0MMZcOIxlFysYO4bic0efH
	3RgdaIDl34yD8+7F9M2kA++7jztN+vSqMQidzwxFXzxFF+0jBz0i75+Y/y674VcFz0lkkPMMeaL
	gPncTN5BpKelBdZUgfYRqNbHomlYt1U3j0NG4G2s6aqqrZxebiTicLumfu+zw6sEPGgBlPGnEGD
	UEbIOXxXLokYXVG9Np5rVCwiH+P+xisWiUCAZsMW586AD/3kCVtukYK1jciNG6y1htuGsjQAKVI
	rL8XLSKX4BuaAIOy94XaLPx2HlwQagg5AoP0BSdbpeBKPkm6Lp3qXCyHvyI+3xiF+jDtAmRokrt
	pY+xoLQQTm1QJEkX+gA==
X-Google-Smtp-Source: AGHT+IEwRoJP9WJj4QtniXfQvbRocZmYf2i9cqYm9UV3188pFIoXCDesXrBecZf6scyFVRfajmRc5Q==
X-Received: by 2002:a05:6a00:b84:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-736aaa00c36mr16451810b3a.14.1741559843938;
        Sun, 09 Mar 2025 15:37:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736b307573asm4802802b3a.92.2025.03.09.15.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Mar 2025 15:37:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c4579d5c-98a4-4bc1-a6fa-343ea77a9043@roeck-us.net>
Date: Sun, 9 Mar 2025 15:37:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Add KEBA battery monitoring controller support
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 Gerhard Engleder <eg@keba.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
References: <20250308212346.51316-1-gerhard@engleder-embedded.com>
 <f684a381-2eab-4c7b-8173-f8d8634bd237@t-8ch.de>
 <f534db33-3464-4d75-ae73-c1a3a63e3c3c@engleder-embedded.com>
 <054c5313-8b54-4afd-9457-26b89a4a7bab@t-8ch.de>
 <f65dd656-2195-4686-b2e7-bdd5df47ede5@engleder-embedded.com>
 <27859459-2640-4e33-93af-dd9c2ca0f16d@roeck-us.net>
 <71f2d248-9bcd-4b50-8044-7895e23a0d68@engleder-embedded.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <71f2d248-9bcd-4b50-8044-7895e23a0d68@engleder-embedded.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/9/25 15:04, Gerhard Engleder wrote:

>> FWIW, all those COMPILE_TEST dependencies are pointless:
>>
>> drivers/i2c/busses/Kconfig:     depends on KEBA_CP500 || COMPILE_TEST
>> drivers/misc/keba/Kconfig:      depends on KEBA_CP500 || COMPILE_TEST
>> drivers/spi/Kconfig:    depends on KEBA_CP500 || COMPILE_TEST
> 
> Ok, I won't add them anymore.
> 
>> On top of that, both SPI_KSPI2 and I2C_KEBA select AUXILIARY_BUS
>> which is equally pointless because KEBA_CP500 already does that.
>> I2C_KEBA depends on HAS_IOMEM but I2C itself already depends on it.
> 
> I'm sorry, I didn't know that Kconfig must be strictly minimized.
> 

It doesn't, it just has no value if it isn't, and it is to some degree
misleading. Following your logic, the unnecessary COMPILE_TEST don't
matter either. Of course, if there is some problem with those COMPILE_TEST
dependencies in the future, and someone will drop them, there will be
a bit of a surprise when the drivers are built anyway. _That_ is why one
would normally avoid redundant dependencies.

>> It is also ... odd ... that KEBA_CP500 depends on I2C. So it isn't
>> possible to enable any of its sub-devices without also enabling I2C.
>> It is not immediately obvious why this would be necessary.
> 
> The cp500 driver uses functions of the I2C subsystem to find a defined
> EEPROM.
> 

Ok.

Thanks,
Guenter

