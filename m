Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D92C288D2
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Mar 2026 00:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774569918; cv=none; b=Vx15dFjTQwImZq3cHpcG3zlVtxigbO3qtIoSsBknzIw9TxdwR08CQljEowmftRAvojMjWRV2yLda8HGOuUv4NJGgJwbL40J3SX3DKAOhgZVZi/YIiWxrrTNgV9xgFLtCl9IWtASBotiBq7hJI64i6P8zzd5EkDYovkuDD1nRRiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774569918; c=relaxed/simple;
	bh=u91Ohs7XNzcjVhK6N5vUyrrXK/Knq6q0/d7MhGtioUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iypg8N+bXgjQWb7/84uYofhyAkz0k74ZBiqNnDUaksrjed7mlLv9l0CtNtUkVkkb+gpazwak9sDX7doQgdoAZ5NFQjXmFu5Y/V+71t/W+GpMU7t3OX4sHHfZiuKQ7IHWzP6jyIqdELBLADRm3pq/CgCjK43EFmLQypxAQVVXYdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nxmzg46K; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nxmzg46K"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c0bb213b16so2760372eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 17:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774569914; x=1775174714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PhroeB6D3lKl0g8IbmiLnJUa0EnwxSL05/NicE8waEg=;
        b=Nxmzg46KSUVKv2q8XZrVwQ994aM2iNN7M4sxUhB4eWdZ+DYapgiD8RDl0Wmb7kYUDQ
         5KAHMSefhf9ocmjjk2xP367bef3OJuMCscjn7W6b15dZ2CL8szdZs35Zt7xKrbMZktW8
         e/0dSVILvKvSs4sEMHNaL7qJyLHv8rL6JWVcHlQ0t09QG120uXztboJ9vG6U+Vn/P14y
         q8OFdG433/wV9dUC+Lf6aRyI7rFsknY2ttPo3dlxuN8fKZxZBWYUGCWFoef3PCyfsSgR
         tc8bJL3oDC2XX4xiOdMCq/RAoikBGrIJDbaQecAUzppMCwB+3tYzjC3Yf2z0oH+ST3uD
         SMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774569914; x=1775174714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhroeB6D3lKl0g8IbmiLnJUa0EnwxSL05/NicE8waEg=;
        b=Vr3kyRoJR5Ljfz/86Soy1DMQXK2H56SJbe5OWHbl74n7O9XDwx0lDY+8RQI38VKUSf
         4YDkaYDNfy4DqCjBz6gsW0H1FJrVcJKRx4RSuzBUZ6GY1D+VALIC5C8lmeDEv//zRwQz
         jJ8YHc6yX/J2FLQa2HCyJJYaNDCwUu6aejsqq5RepKak43RDq1ZU5ZC6r5oJCd9QN8/T
         GLXWhScsFek1r6cXy0M/Rl1rWRqT/VaPGPoJYzh5Mq9JIeNXSbZ5/qEUo+6nQ4uVVKYq
         mTWJ/4G3yEFaTWrUlRRryHiDvQpXgQeHJVMBdcQOoEiIP1inRex8/gGfRJg23hiY3MVv
         mNSg==
X-Gm-Message-State: AOJu0YxM30c63BUr50Hgq/KjtFX8XufbXoGs+keZW6MfhJkiGY5SHzv0
	AyOpEXb6jHDoxGik21PmFp/b+aZfz+hjQZLEIuE4R9hf3ERK/7XO3zz0BHnzeg==
X-Gm-Gg: ATEYQzzTZhj8QgN5tBNAao9RddUpXSS8SbR0XdpLkg0bx+EfNDfxu7zewlFrShSfLFW
	J7Y7APmI5l1m/SzXxP4cIfDvf5PbUUdGwaxqE1c5b6dUW1pY56menAUkPVagbhv874l72fXbfJm
	cEmIO+m0FpTYJcwkO+66WxL2JYQL1UZSjB5MIAwehm5snyiwUY5B+VMSN9Kso/QBOUdf5v/csi2
	GPG5amFkbOgln7Gqhqmah/YjX4Z1RiZigaA5REtRrxcZL6SVHJZTwyI9VeANsi4IGIFxZkHXoUM
	BdNe4c+qajgyPnGvkWl+vtf0SOrtfsspNnfsWWLgrG+/Y4kS7wB0dBpYJK2N+3AYZmj+niBHQRL
	z9dspFExcfulALiG18m5LgBn9o9uHPSGiPjTPw5Xepq0Z/u1Hqb/RYI0Ag/nVyLnf7ETDq5bkrp
	IW7KsSLbCbHnFRP06K9sqdCkCHdYdynp0q7yB8VfWGVelpXtxb3d4WAJ9RQah+lse9Lq43C5Vd
X-Received: by 2002:a05:7301:1685:b0:2c1:6676:5ebd with SMTP id 5a478bee46e88-2c185d47c62mr365694eec.10.1774569914244;
        Thu, 26 Mar 2026 17:05:14 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec49615sm4001393eec.11.2026.03.26.17.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 17:05:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a3a8eb58-b2fa-411b-81be-eb70dac86b4f@roeck-us.net>
Date: Thu, 26 Mar 2026 17:05:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hwmon: Add WITRN USB tester driver
To: Rong Zhang <i@rong.moe>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/26/26 12:19, Rong Zhang wrote:
> WITRN produces a series of devices to monitor power characteristics of
> USB connections and display those on a on-device display. Most of them
> contain an additional port which exposes the measurements via USB HID.
> 
> These devices report sensor values in IEEE-754 float (binary32) format.
> The driver must perform floating-point number to integer conversions to
> provide hwmon channels. Meanwhile, they also report accumulative float
> values, and simple division or multiplication turns them into useful
> hwmon channels.
> 
> Patch 1 adds label support for 64-bit energy attributes, as the driver
> needs it.
> 
> Patch 2 adds a helper module for floating-point to integer conversions,
> so that the conversion, multification and division methods can be used
> in this driver as well as other drivers (I am also working on another
> USB tester driver that needs it).
> 
> Patch 3 adds a barebone HID driver for WITRN K2.
> 
> Patch 4 adds hwmon channels and attributes to the driver.
> 
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Rong Zhang (4):
>        hwmon: Add label support for 64-bit energy attributes
>        hwmon: New helper module for floating-point to integer conversions

Nack. This is not a hwmon problem and should reside in a driver or in lib/
(if it is needed by multiple drivers).

>        hwmon: Add barebone HID driver for WITRN

Nack. This is the wrong place for such a driver. It should reside somewhere
in drivers/usb, or maybe in drivers/misc/.

>        hwmon: (witrn) Add monitoring support

This should be implemented as auxiliary driver.

Sashiko has a lot of feedback that you might want to address before
resubmitting.

https://sashiko.dev/#/patchset/20260327-b4-hwmon-witrn-v1-0-8d2f1896c045%40rong.moe

Thanks,
Guenter

> 
>   Documentation/hwmon/index.rst |   1 +
>   Documentation/hwmon/witrn.rst |  53 ++++
>   MAINTAINERS                   |   7 +
>   drivers/hwmon/Kconfig         |  14 +
>   drivers/hwmon/Makefile        |   2 +
>   drivers/hwmon/hwmon-fp.c      | 262 ++++++++++++++++
>   drivers/hwmon/hwmon-fp.h      | 212 +++++++++++++
>   drivers/hwmon/hwmon.c         |   1 +
>   drivers/hwmon/witrn.c         | 691 ++++++++++++++++++++++++++++++++++++++++++
>   9 files changed, 1243 insertions(+)
> ---
> base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
> change-id: 20260327-b4-hwmon-witrn-a629b9040250
> 
> Thanks,
> Rong
> 

