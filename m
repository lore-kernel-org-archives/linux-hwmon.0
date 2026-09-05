Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BAD936AB54
	for <linux-hwmon@vger.kernel.org>; Sat,  5 Sep 2026 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788617527; cv=none; b=dqeDMEyefbjK+DDjD4ihcB+T6I7cCZ1NIlEopMG7bpk7WLNE+2ptjHZtf44cT9BIALkvtOId9xWD9ayN7XIaRw6mhzqSYZtI6qQg34z4fpuYq3fq0lFAh0gOkPtfhqFXlo3YM+NZkv7mfJloMLD7TWSNvYrGJKwvknWWhr5TIY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788617527; c=relaxed/simple;
	bh=dVRcGzv9h0irsWyILqEtWRT0KkdEsucKXFHPvFGGb5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUF4ngIr0MA2zO+OeevjPFMQ3JFxY33wTpjSEB0UWOZ24EfsocFEyq/jpwjvsRS2zXH4sqiuAKnFfg6Pu3qsSXuNMH7MzZb6ULrHx9nJ5vvEfe0Z04vo9p6Vd47IiRLhgk0ThSmbvXNFaNCjcrO8wYMFocp55KJQosHI1trQL+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGJwXF9Z; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGJwXF9Z"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1995552a91.2
        for <linux-hwmon@vger.kernel.org>; Sat, 05 Sep 2026 07:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788617526; x=1789222326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irbYyE9Vb2d5N7dfKu4p+oTxnQ486yTFt9QMjpZO6mE=;
        b=iGJwXF9ZL3/HvqaQZTD402+RyJXAhiB5+9rYkb8tuOd2DerG2/xwMEKeI172fpaHnt
         g/JqeyuDUYGa5Nr0JZB1B3K0xeY4eunzklXchrr4qzo4rZ0fo2pVHOwTW/mKY2hZJQ9a
         hjpOlkSYaBpQIJOPDzGfU9Bord7uNo0RzqFeC3xzxo7kKLUh3KJR8vMDKzIpPi0/2H6s
         /rIf/gCl9XkbfLVrM169NsCod7WnjQwYYl3YWXcWR5LjSw67gGK2fyvHgV70WmQSk707
         cQU2KUbEjsWJfMbKl1YUKOGnfmKDMYXus93nLzsA/lilxG7eb34DLVkP8OspxS2epnQs
         lg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788617526; x=1789222326;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=irbYyE9Vb2d5N7dfKu4p+oTxnQ486yTFt9QMjpZO6mE=;
        b=IKKCdljYCb5onNeJFPm5mJmoWlZShov7iCpQgJI2JdvVIVwZo30Ww5q+AFQdkL7Gf5
         3Ricz+D4/R6Vig1S8j3oAzji3PFvdvMW3DMOxH+yNDNrm5Gv0eNenfNeXWwwuFarAoRa
         yGUhCvcVILhHb9usFBNjK+j70A+gET5oP9HWU89yoP3xrMb8iucLbBz2Nc3HR8OT/FTg
         Q9/G/sQxPVv3thiKtyqRY1d9hLTO+gPVfv9j8a1LzzHSNSySmkbvYA1+gg36FibLgNMT
         KtlgrFIQAh8gIRWc2Ucemyc0wlwM035iNH5Yhd52LcYLiS/+1wRvXBOLPZNPWPyZ/Rye
         Pk5g==
X-Gm-Message-State: AFuF++mLxb2fB4iBKBa2swnpSqHG+K1YFxiCRAtTXV6n5/i2GupDYe+/
	x5MLo0lFmJ6Dejrd3rwAbQ/oJxO+EjO/SCVqj7PZ5889ZKc8a4QIwkRb
X-Gm-Gg: AYBFou12pMS06l8dt+X1PIxobMJ2V9QI5A5JEw2HaFRDxs7eIbBtwOdbtckHuRVUE/W
	kq0pKJJ4Qeb8CEUlSjqTqJt8TJ7nP72CBS4j/50v8CGhffQ/poroenyjY13kgvwYBc7IeuEb+jg
	eyx9CVJw91Y7wU1UvJymG5DT8VntWKKE8BxxKbXVpj+vQkdFdsn0Cy7WTQt7++am3xn6ykslspQ
	cwjw1qzLV0yQVYJFhQgduHn6n1UidnXDRnXTKZQAWgv7oC+1tMvQ/YAEPY+qfEumags0OVWjoms
	HP4Gq6+T2bfnkM0UhhovTixXWrZfwT+RAaWBQnllVF2pBx7Z1a/4vg6s1Fqpb12BuH7zx8C1NlO
	+TdgNP3/QWRRA4lmLKUSyaLFORJX8rv8E1BOzWibxZeuhOJu7s53rAZAHrxx4A01dJRQXmo0EOj
	62R9CLLZPcuiZe7pA5u/mIGWl4XLlEa3IhL7t0cXfO/G5ujrX+vDJ72UQLv6e/mbEFqbhauJPPV
	Y7fwyTuCoAA6P1EK6Q7Y33Ie8pZE37JpLjS3Q==
X-Received: by 2002:a17:90b:3b8d:b0:398:b426:ca4b with SMTP id 98e67ed59e1d1-39b2624f10amr18330008a91.22.1788617525368;
        Sat, 05 Sep 2026 07:12:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2ad8028dsm2877512a91.4.2026.09.05.07.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 07:12:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9064a049-698f-4ac8-b827-ac0826ca1b07@roeck-us.net>
Date: Sat, 5 Sep 2026 07:12:03 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (xdp710) Publish the OF module alias
To: "hpp.iscas" <hppiscas@163.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Yin <peteryin.openbmc@gmail.com>
References: <20260905133800.65749-1-hppiscas@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260905133800.65749-1-hppiscas@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/26 06:38, hpp.iscas wrote:
> The XDP710 driver registers xdp710_of_match, but only exports its I2C
> ID table. Device Tree clients emit an OF modalias instead of the
> legacy I2C alias.
> 
> Publish the existing OF table to make module selection available for
> that enumeration path.
> 
> Fixes: 35fe06d94e39 ("hwmon: (pmbus) Add support for Infineon XDP710")
> Signed-off-by: hpp.iscas <hppiscas@163.com>

.... add a line saying::

         Signed-off-by: Random J Developer <random@developer.example.org>

using a known identity (sorry, no anonymous contributions.)

Sorry, I can not accept your patches. hpp.iscas is not a known identity.

Guenter

> ---
>   drivers/hwmon/pmbus/xdp710.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/pmbus/xdp710.c b/drivers/hwmon/pmbus/xdp710.c
> index 494dbe4..bd062d1 100644
> --- a/drivers/hwmon/pmbus/xdp710.c
> +++ b/drivers/hwmon/pmbus/xdp710.c
> @@ -108,6 +108,7 @@ static const struct of_device_id xdp710_of_match[] = {
>   	{ .compatible = "infineon,xdp710" },
>   	{}
>   };
> +MODULE_DEVICE_TABLE(of, xdp710_of_match);
>   
>   static const struct i2c_device_id xdp710_id[] = {
>   	{ .name = "xdp710" },

