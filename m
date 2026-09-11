Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571C1489899
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 13:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789135075; cv=none; b=rAmQyQBW5P/FfXM7JA7LGJj0U8x6pQSyZgg4gZHxfJ0RocbGoncJz16FJeJZfQ7y0ZALb0QPyHhrBWILyeJSAWQFLJMkQgKlff7o5lcTAm4sOl5YimsOAUg0F5uJ0Zt8ElvCd/aabDpGCgQ7EqxlVlscOMVGIU8auukTvHvE8K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789135075; c=relaxed/simple;
	bh=9eBuKjDz3ny53uBf6WqQdXwuOegweo9jZQOeUFrlVok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tJmNMsUhaH4bbQTJc7245RG00JZ/xK7+52I1BYFA1ndtOfyEUGRyE59Wkx4ZFU52VU/w1b8mIYcMR0UWhbbtAUefbLQSBGS8aypZhSeoo+kVnPY7PncZ9VeWvl9j5zpNhwF7e5BZHy4QeAclr8L1oo2ngka5lrZN42hwusppvtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1qhPjKu; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1qhPjKu"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1026029a91.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 06:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789135072; x=1789739872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKIOM3kpSjMhFc76Q4cEA0mjbhU13/mUJ6uhz3Hv6NY=;
        b=m1qhPjKuBNjeoueWgBxxJabysTKalNhYf0wedS/vH/xjv9jyMRdFnan0BZHIFTYbIn
         GghZh1SSJ3fD7oDY0fktAsBdwdcIF5j+7zY37tdZPLRvYunKxdVx6irdKI7kUixcT1W0
         qRnWJGOMpeRgo5dAZZIf86oQHRiHWPZC2kmeJWFbht+KFCs+dRQ2SAjZghppC0wuhjNc
         tEMPuX7Aw8HAQIWnAGo/75J2a2Qhu3YBki12yPRTqGTODVgGbe3BOQmGAWvKI9CEcTY1
         +VHXWlLDFUsw1+qz0AN0JDMcm5MGFh8CGxjdou+3C3v9UHZ7NX1MwnVb6nsbkxa9FaEi
         UklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789135072; x=1789739872;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qKIOM3kpSjMhFc76Q4cEA0mjbhU13/mUJ6uhz3Hv6NY=;
        b=RVaRAylpuqA1vuTzrB/adD7qLcN6yU3I2nSKXgnLJ/xu8NCXT8VLgKMfjVqmTGKiy6
         seCAl7SknvnZO3NQKa04Ap90MYP9Oo8V7du3AW0xzsXPGo/tgGYMZdEofPIx8Km6WqNb
         0v9oJscw28B7FIUURu3qdR3RfjQ1mY0tynYZIzZPSCdbjZbw+Dk4MQTReGMQBMfsD206
         a/9hRy/P8RR7CgL9tGIHzC36dsqOfo5J77Xf4/2cG+GCZYRtZ73hvSVnb0Mc6rXJGXUG
         mECViSPTNIIBCkMD2zxmO6/iRGZ2PZ/2qFJJzJI0PCv/8vp2rohmTM8N8ZsCEr1vuCC6
         DfGw==
X-Forwarded-Encrypted: i=1; AKwUvBwjDzIhIcXLRv2GVqphF/xrqvkcQ9P/yLU6hf0eK27U/IFOLlcQzV/sAqOqk4hzBoyGgx4HzkEdnewreg==@vger.kernel.org
X-Gm-Message-State: AFuF++mtKXTxEK6U8UuAQJQIOt5bll15TcWMu0+XHjpLldsxIwX/LSFy
	Kh21rshktonkXZ0EML9XuKPAbTx8Ajx9/+xo5c36i6NHVIbULj8dBXOn
X-Gm-Gg: AYBFou2HWW9bUa7oRyDrwaI3pdLcOhqvMLt4y5UnWz3MExInXXaGuHOqvKVr5mhuk4y
	/0VhAyLa1eCwrPChYQertn/e4ylu18PJS4QQX5auBxlXwsQ65A2PZ4kzHhdzP1P4EzYLAoz9tbC
	5xJIMX5Su6O8qcCbk2WCaI9tgg6HjzX1xs5+Jlzh/+3TUEizoIpIHUoQYmPr0dZSyQYJcZhLknS
	xhRjxc3/OkQDEjzXEUs7cRJgnXDWUzrRVU5FcY43kMP13R93LDkq2bzn9I85Z5+Bk1stsbtmmoG
	IZfHlzWMXFWXxu78atuDXyBh+70URstdfVhEUJWJXf1zx7/iwU7o9XmJLk+GngTS+ijNbNQ9wdG
	hKDTutOja4EThTGz4oIui/4c62f71i1rdXqLOaWZRlCw3nNEzjiL2an05hkmotlJJ0Jwap1gnYM
	RXtNrQ/XlvSQhNT9FDp/84iO/UsispsUpPtZ8G9FtiBW2jZ/fpFVjVJLdYZwXXgCDeKSx+3jukt
	h1iRz2f1qbVh1J1D1f8TWdZf7crGNUn540HzN1nrpAiptqkEyi+eAhc6+I=
X-Received: by 2002:a17:90b:5291:b0:396:7c01:553f with SMTP id 98e67ed59e1d1-39d77b1d014mr11751578a91.21.1789135072379;
        Fri, 11 Sep 2026 06:57:52 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365ba729dsm10784182c88.14.2026.09.11.06.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 06:57:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <af677e7d-a605-4e63-8fad-6bf491dade07@roeck-us.net>
Date: Fri, 11 Sep 2026 06:57:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Werner Gartner <Werner.Gartner@congatec.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
 <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>
 <b7a59fe6-f8a9-49ae-bbff-c3785dc19ecd@roeck-us.net>
 <21dbb615-25c0-457e-821d-6cfd6945a3c5@bootlin.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <21dbb615-25c0-457e-821d-6cfd6945a3c5@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/26 00:23, Thomas Richard wrote:
> On 9/11/26 2:58 AM, Guenter Roeck wrote:
>> On Thu, Sep 10, 2026 at 03:28:21PM +0200, Thomas Richard (congatec GmbH) wrote:
>>> Current sensors on the Congatec Board Controller don't use consecutive IDs,
>>> unlike other sensor types (voltage, temperature, fan). The driver assumed
>>> consecutive IDs and performed a simple lookup, which caused an unknown
>>> sensor warning. Define current sensor IDs explicitly.
>>>
>>> Changes the warning on conga-SA7 (type and channel are correct now).
>>> Before:
>>>    Board Controller returned an unknown sensor (type=2, channel=17), ignore it
>>> After:
>>>    Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
>>>
>>> Cc: stable@kernel.org
>>> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
>>> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
>>
>> Applied.
>>
> 
> You pointed me that Sashiko reported a missing cgbc_hwmon_info array but
> you applied the patch. Should I send a v2 or an other patch to fix it?
> 
Sorry, too much going on. Either way is fine.

Thanks for the reminder.

Guenter

