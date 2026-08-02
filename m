Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFF63C1097
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 16:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785687734; cv=none; b=nr67TIYAoTQ8gyx1VXHeaPbrXJ8BvVxmHvLg9k389hgTKPKPJCdsf5SK3E5u2HW/vzZ0ODHlVILtfOnizfRQiWGxPG6IVqM/EK0fiVhNMTgC3Tz8v75x/UjdZUrftEk+Hih24lB3bAgao05+QEgNxCQwKeaP0jg4jWyrBrXn7aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785687734; c=relaxed/simple;
	bh=VbYWcMSvxJv0gaD/C8tMX6pZifoqtP2zSe4jjLb2bwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXwXSmMY86G8Wfs6T9ahJS5M0nAMur+yupX1KXZ8C1ZozT01DfHcSjxxRHYiq1R9p9lQK506bn1JNWQ03/6jZSA6ReiULx3JVX4u470tnd2ZtpU9CCuAp2jd2Ug8jYvH7289ecs6ZKe+xz3pQ5im6/WfYiuPPGOj6+in49r7M88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EnoKug9S; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EnoKug9S"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso26650695ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Aug 2026 09:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785687731; x=1786292531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hV9TxZ+XZLHG9LgqbL6qudS9UjUsglSXMCj5/KHJN18=;
        b=EnoKug9SwfC6m88rg5Z/gQu/iKHFpKSIe6QRnFng1mdgv8RUklISau1AUx/nZr387I
         EwtODZPk9eI26EA2Axcq9p7k0Dxp2L1+fEdBB5dYhr+60brxGEhedd98xh7OE5jAO1aZ
         +1vckaEYlpXRQYrAQ/SekmZUfjedRC1hUufgloECukNXxAIPgC5f0x0Q5kShJ3Yap5Zl
         bBtLNPy+RLfBpR/UhQRdv9T2bAScAVkCODAgkQfAtXP7Yypla0uKynyWtedn31SWA3AY
         QkeL2/1pUwAv4S0YaFRZX8eH2A6RajfNTNRWt3K7ExXJtOEqChp6xvxdkTn8EIwMr3e0
         f/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785687731; x=1786292531;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hV9TxZ+XZLHG9LgqbL6qudS9UjUsglSXMCj5/KHJN18=;
        b=Dug8SJFeNiEocY2g/s1F68Q0hIQKJEXys/KVSnnGtTCeTlWzeIeRWjcp2dpiqPPDOw
         p2b6HkiBZPTdoOwFGbQAW0qMpifXRwpCLOY8DVK4Us1VX/IvIC5yaEGS0UjpHwudcVTL
         BixBn+Qe9z08jMkieRqAweM7cboCHzAkeH/4cRlfiwUqvid/HjiUThj4NEgYHakJ7Fd9
         CI31WEIi1Zhb9HNgeIIQec46CERHVjCWpBRzwrFbu/KlwfCn02WBschtNKNGQe+lHp0p
         1f6ba+zZshkO9K8ZiyPlrzafJQbwF/6tgJ3xk/ca6bxyAzrUSmSOuLp6BnlLk6jaoTZr
         zysw==
X-Gm-Message-State: AOJu0Yx+lcy9aqc8SHCGHzetOEfNAWYiyk1x5qhVo0ZLpJZH9PSj4jLw
	1uSw5cd0d6vlxPntgpwk0EdovYtJufQYUkIy3y+YDoaFnbI/9hMVRQFUE/yIyQ==
X-Gm-Gg: AR+sD13ieA4EaPLuM/ENMQ6zPCF3F1BS0XJ0AB03r0Lx2+u0E8ewW3Zlw8Cn9DTiVIl
	bzHMzA1X17nhNsjUuWOWF5JgVDe/5NcezgMznHIKTYBhsjMZUTUO43qEmJKJqoPr0Jwh7ekjPfT
	8dPCQU7DLmiyGVn+vQDPBpYiY6SHuLy5e90vdDTfm3mVQfIxBVmNDVOubfIGVkW13QEN0XZWcCf
	zVmOu6qb5co/xI2UD/7Y5ECdEFOa5fcfeniS1byarE9pqus4wY6e00WvZ5an2kINDrboCUN8JEY
	KEePm8gJFsj6G7IVJlQz5JejvuP66btXSm5QliRrfcM6wfvJ1pll5sYYTC7wpuDu342Rk+kp97d
	W/9aVKKtafy2z0hRHpq+0Te4Ba0yKq2VJMsQugQkOL66d0Q9iUOmi/DsXOPGiHUD7dkZdYrwah0
	aTBOq3ehAienSo2ggfcF4cB4/pWVyd76eBvBfbIiSkcGxxTX558fiZz3ovY3THYEX/H9SRylQhU
	cmCvT/M8/5scdW5x8Kr0Y2yTXQt+MAoKzjrEg==
X-Received: by 2002:a17:903:38cc:b0:2c2:7baf:139f with SMTP id d9443c01a7336-2d052411d78mr70440985ad.30.1785687730738;
        Sun, 02 Aug 2026 09:22:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b15db1esm26783215ad.81.2026.08.02.09.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 09:22:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6a0cc456-3ee2-4039-b8fa-e159d6d99889@roeck-us.net>
Date: Sun, 2 Aug 2026 09:22:08 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (corsair-psu) null terminate the vendor and
 product strings
To: Ali Ahmet Memis <ali@iusegentoo.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802134244.29107-1-ali@iusegentoo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260802134244.29107-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/26 06:42, Ali Ahmet Memis wrote:
> On Sun, Aug 02 2026, Wilken Gottwalt wrote:
> 
>> The device always provides terminated strings. The vendor string ("CORSAIR"
>> or "Corsair") and the device string (3/4 numbers + 3 letters) are allways
>> around 10-16 bytes.
> 
> Thanks, that settles it. So there is no reachable bug here, only a driver
> that relies on the device terminating the string. That changes what the
> patch should look like: v2 will say that outright, and I will drop the
> Fixes: tag, since this is hardening rather than a fix and it has no
> business going to stable.
> 
>> Actually, it would make more sense to change the memcpy to
>> "REPLY_SIZE - 1". Just my thought.
> 
> That works. One detail worth weighing before you pick: corsairpsu_usb_cmd()
> is also reached with a non NULL data from corsairpsu_request(), and
> corsairpsu_get_value() passes an uninitialized u8 data[REPLY_SIZE] on the
> stack. With REPLY_SIZE - 1 the last byte of that buffer is never written.
> Only data[0..3] are read, so nothing breaks, but the shortening is not
> confined to the two string callers.
> 
> Either is fine by me and it is your driver, so say which you prefer and I
> will send v2 that way:
> 
>    a) memcpy(data, priv->cmd_buffer + 2, REPLY_SIZE - 1), arrays unchanged
>    b) vendor and product as char[REPLY_SIZE + 1], memcpy unchanged
> 
> No rush on the locking patch either, whenever you get to testing it.
> 
Again, please stop fixing non-issues. We have enough real issues to deal with.

Thanks,
Guenter

