Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D23C27CCE0
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 01:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782439175; cv=none; b=iXCRUDXZcjsZqiOaRzuSOpcFltzOjb3bHjA+OWi2iw5LT1aXxasj41laXfd+uDbT3cHLea+O/tHpRsF4RbtGLzMnfeOQsOj7oO2E1ccBZGyFHeZMi1f6JHc94tvudc7UgOQEoc3skcWZ+Mw46z0XK8GVgr0YAyqFz8KZh8w0Hcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782439175; c=relaxed/simple;
	bh=efwhtvak9LYnnIrj/9Pc+Nk0CXhxJiM71PhRnRJhoBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lXcGs3keL8H4Ei4ezHnuw8AVXe1nwteeUWOmX8+jkGGINqDQD4iQbe9kcfI8vzOdx1qVVRJcnfgGBg4EKMjmmhAltv9CJlx8O+dZIZmG8ZsGXenmLtTpdEe/iZgYiKnUL203TX8jns2pBBFBe2aZu/AySiJiVdUfArfTDxbYN6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nJsCoxfl; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nJsCoxfl"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30c591fb1cbso736796eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 18:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782439173; x=1783043973; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rLNYgsfH6RVsBouFO3iTPBJV8WQrEpvVwaOlmtKq7eA=;
        b=nJsCoxflhfu/pIWImLGD6yhrAcFXYdFi/wWBXHvgqQKwGCpC7HkpSK4DwtgldD6cfo
         +P9WGqlgpe+0CPB2PbmiY0bZAZjJUcHyEFJoG0VnqlG2CHVc2kpvh9dONUsvZoRy6E58
         44/5M27SP4pJS6GUxdnhChNRrxCqNL0J6SON/beMlZiiaUkRqQrI7ZSLN/AvuL1/YeGc
         qHiZBL3QJ3q4/ZF6TnsBAf9rMzQtp3NaThaY7bTLuUfpyso2s/h07yhu2B3xnJWJNdic
         3IfikBBnDyweQ0iCDa03i/hE4jUQ1Q/dqgSkF/XTBB3uY+0Gv+xs4nnHMUF5S55+YL5C
         q17w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782439173; x=1783043973;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLNYgsfH6RVsBouFO3iTPBJV8WQrEpvVwaOlmtKq7eA=;
        b=kUPbL8581RoePXitfH66uzd7ffnp/KCGP25pMyuUtUggwH6uSzXoIqJrkq6FuF/dwk
         7m66iVF7FRfcxxfbpGIsbhRBp/Ef+w5zH0EitO4D/JEcMuHQ9ZWasYo0PJuQTadSqjMs
         1y9s0buVFffLG7mqTa8viEppcZixD4zommNaGszigg3z3guLjzPdPw1yxTgAndxGZ3DY
         x6OCLc5pbE0LVDKyO0zVzyHdAEJSR18qx49n37GGo3IzmNxzgg7nMfnbqXw+b7AdwshG
         aIj51u8i4AEU/Qq/rB8rEuOHV7Bpt57sQtpKOCdi1GCo/VYIeeyFfJW9JSjjKVdQpwgi
         ty/w==
X-Forwarded-Encrypted: i=1; AHgh+RooTByEHcj03A3Pf9fM+oWH/f6D6O7hSXeR5oHLT9VVCFuibq5CZfkm8WiIlEZF6o1t7DrjFdC2VgH/pw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ReIoiTxoYzWcQ2QSqws3WOxEU8gLhgIpPk0w7uzguaE++ccD
	0vDY4P9RIzcdKIt7tKJ5E5gmEm860pwP7QsJmYcn1W/rT8J+EXgjvRY6
X-Gm-Gg: AfdE7ckwXsde1qvcUKJxH+SyMdL75XTA/DQRZK768lTG3VKCNki/JL7VdFjbntNL4ak
	nluEBArCVs84jqGaULnKn+QaTnoRt0trN7LOgpVjyYqPJxNY7w15BCs8ryu2vqCqeVraMlcYQhe
	06P1Ss95T8QVxdM8iEVua+NCBt9tjNy9z0UsmtphxI9kBDf9eUWp0YaR7rYvk5aT5fycWgNihVi
	geSnQKJ+7EfsPVqt5Y7QTUXNekvWq8YMj/zyAg2uhVF0D29LBTzmg4lhNEQxRujnWMdoahrvP8S
	oQSuoarv8BBsBDfekfz9LgjHEfC/ieAaFQkHdNPf6tGFDr+QtpHZd3DjZfWi6K0ssLQ03Bfbr38
	avbX+tlI91SQR7CTuYAaGloZwwnQcwLqXoQdpUDKhAI4CmOvCkEWDuuSTJ3H62B6BvlqUPq66wM
	FskS2/BZrswiXstwlxGywFaIQo7wVky+mo0q4BZBNG8IZUc/yGv67V3Tl4wYOWsmzYJ/v454jX
X-Received: by 2002:a05:7300:1896:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-30c84b1f43cmr4512622eec.2.1782439173134;
        Thu, 25 Jun 2026 18:59:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cac87dcsm14289019eec.31.2026.06.25.18.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 18:59:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5cf25e6a-1d58-41c4-a628-3ff125ca5f42@roeck-us.net>
Date: Thu, 25 Jun 2026 18:59:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] hwmon: zero-initialization instead of memset
To: Manish Baing <manishbaing2789@gmail.com>
Cc: jdelvare@suse.com, nuno.sa@analog.com, abdurrahman@nexthop.ai,
 bartosz.golaszewski@oss.qualcomm.com, linusw@kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, me@brighamcampbell.com
References: <20260530221353.159461-1-manishbaing2789@gmail.com>
 <9d78023d-9a00-4bd5-839f-2a79aef4b7a8@roeck-us.net>
 <CAJvdc_fpMR1T-p0YWOcmFEZ+YB+LHAQtxRSgMCaDti3E0cLqGg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJvdc_fpMR1T-p0YWOcmFEZ+YB+LHAQtxRSgMCaDti3E0cLqGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/25/26 09:04, Manish Baing wrote:
> Hi Guenter,
> 
> Thank you for catching the struct padding risk. You are completely
> right—Patch 7 (it87.c) would trigger a KMSAN uninit-value warning due
> to the kmemdup() copy in platform_device_add_data(). I will drop that
> patch entirely.
> 
> I have audited the other six drivers in this series and verified that
> their variables are never passed to memcmp(), kmemdup(), or hashed, so
> the = {} initialization is perfectly safe there.
> 
> While this does not fix an active bug, the goal is to follow a cleanup
> pattern  recently discussed for the IIO subsystem [1],[2]
> 1.Better performance: It removes the need for an extra function call.
> Instead, the compiler clears the memory directly and more efficiently.
> 2.Safer code: It prevents accidental memory leaks that happen when
> developers make a typo in the sizeof() calculation.
> 
> Would you be open to a v2 that includes just the six safe patches to
> modernize these initializations?
> 

Not really. I would not mind if there was a safe means to initialize
a data structure without risking holes and without memset(). In the
absence of that I rather play safe than sorry (and apparently we have
a different opinion about the definition of "safe").

Guenter

> [1] https://lore.kernel.org/all/20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com/
> [2] https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/
> 
> Thanks for your time and guidance,
> 
> Thanks & Regards,
> Manish
> 
> On Sun, Jun 7, 2026 at 9:42 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 5/30/26 15:13, Manish Baing wrote:
>>> Hi all,
>>>
>>> This patch series cleans up memory initialization across several
>>> hardware monitoring (hwmon) drivers by replacing explicit memset() calls
>>> with empty brace initialization (= {}).
>>>
>>> Following similar cleanups in the IIO subsystem [1], this series updates
>>> these drivers to stop using memset() for stack memory initialization.
>>> As noted in those discussions [2], using empty brace initialization (= {})
>>> is the preferred approach.
>>>
>>> Beyond simple replacements, a few drivers (nct6683, nct6775-platform, it87)
>>> were using memset() inside a for-loop. To fix this, the variable
>>> declarationwas moved directly inside the loop and zero-initialized there.
>>> This safely resets the data on every iteration and makes the code much
>>> cleaner.
>>>
>>> Testing:
>>> - Compiled all modified files using `make W=1` with no warnings or errors.
>>>
>>> [1]: https://lore.kernel.org/all/20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com/
>>> [2]: https://lore.kernel.org/linux-iio/202505090942.48EBF01B@keescook/
>>
>> That discussion does not fully address a problem I had seen previously,
>> where {} did _not_ zero-fill all holes, causing subsequent memcmp()
>> failures on affected data structures. It took a lot a lot of debugging
>> to find and fix that problem. Given that, I am not inclined to accept
>> this series unless someone convinces me that it fixes an actual problem
>> _and_ that each and every instance of the changes is not used in a
>> subsequent memcmp().
>>
>> Guenter
>>
> 

