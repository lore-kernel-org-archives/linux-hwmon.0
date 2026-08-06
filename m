Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47E4329E6C
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 16:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786033718; cv=none; b=VoRs4kwEHPw9vKBUNo1V9GyHQzHSOmGgAUPEBWul0HeK34Psu7W4t1YXWI2Bh4dPzoWl7IHwB309y09tfCQum9z3PP3pubeXzfYizZy56EJabDkxeE32cJ6QYuyzcgBsyeu0/5OhAH0ar6Kuk//pA1xyTPq8J1y77Gge9ORH1FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786033718; c=relaxed/simple;
	bh=kFDZYy11bspw5vw1uD0EHfLeGfFu1FTSTjo0f0wqnMo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J1lI0pvYGu0hsLtM1x1JFTeiK4HaZnxnq1lyrACY64fssbQMzeiKYqfe6p91+LMvtiyH4gtN1X2A5Kx2zp76EtEeBuofNz9SokP8Z0hLfPYxVVWuFVgmR4QzxmEoz2ePdtks+WAjumxOj02HlRCCK06OGwOIcKtmr8Hk9FPzHdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTZGX2nD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTZGX2nD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848593533cbso1037172b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 09:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786033716; x=1786638516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtFmpGei+n3+2riAAEtY7a5SDaA1chGY5d7i/NDyDg4=;
        b=KTZGX2nDnMgKI9iqDiYuqo0oxRmWKnfb6ruBkIYMqypcL7p+Ts3r2qsLkkdMOktmYi
         dIBF+N8/CDDIFRwh5TlRSF0fTPNfOmhB8f8AjefNn22V4zSzcUBhOScqlPrBd+Iq0IHb
         oHAqELJ2vzslUzes0ALlRlGx+vXG7qyjxzh8XtzMTGBk/mSP+rOSNV3DgOoNvcujE4jr
         Gzp3103D/c3N+CnujQqbHsOQhgSYTbQgCOxlWwlzd7HlojrBfZTnnXCM4HkT4yyd7bSi
         16kRhj/S7h1H3Fx4zcwDSjk+1VZFXUC51UD5enUpXOsn+fdWU6SXqqB7p+bh3fi+Md5z
         2TVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786033716; x=1786638516;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YtFmpGei+n3+2riAAEtY7a5SDaA1chGY5d7i/NDyDg4=;
        b=Uh3FwU7c0SvtCNsUPoruvtu/uwAjTXEILRWEf0XXzlNbMCl7iCsx8Qx5OC0sBTtE58
         JfTLv88afs4XgaBsk5IVxmBOkvukdP8zhDE5fZCCW9OgDKYNs4KtvmIfrdB960LxTTd0
         mdDoIDZ1ly8LgoKcaH/FgoKHbDcuUc7T6I2ajiZPzTWUmTZjZR7Njorou6g4FyVuQiS3
         AJ5L6XRA0B4aLdmgvKXxCe9i8z7i33/SAspdSE8eYL9anz8BW7alIBmNQ6M1SfLnS7BT
         RkWjrkTbuo+P9Mq1Dvp3T0UKOg3YeLIX5ZKHds2i9jGgD0WrvYIWBRNn2eu4QTx66oo/
         c9wA==
X-Gm-Message-State: AOJu0Yx+L2S7K4XXSzIAZ9YsWwOKxIWCC5/qy8O7GFIAKlF5ppfBEMP6
	+GH0hTRC2zz28wS3ZDkOqv26bsEKkPoIF7eSn7Dqb11ReyZIwg/BYM0p
X-Gm-Gg: AR+sD13WZhcDuk888PLLz43VXdDRJCirjpBUxTelzmqJdC2gFCHYUZLXVi18ukig9IL
	wZWEQWgSnsgGhisQnS7q9yHwVrBiL+ZiWfVfb5gqDELx6Jay6EGgDJiMtl4LXWLI1g8k3C6tf/V
	qLWrWbOzOxB8tY8m8PZHzzwKBi+L3mTaezyAkDZqLH2Bs/9G7bUY9iXRPZKunlg/Y3ieEKF0Mff
	BVQuY3riTpcfyu7m84zDwXF5XbBvwnZ/It6DFXPTAorJ1xLVAeduk1XcrTR52KvZRI3byTUE2xr
	NGjoWvfLc1QR3OBBwaRVaHVzkLFm7wZfvqAZJAecRv1nhOi4hy2H4A+pjBgRoSTog/UaQjIOJ4s
	g8Fbvl73r9YNAnfveGM3UDqLRUzTx2W7ftix+WxqkS+IFLSKD3KDiLeyOnIGanUgD8WQTAaduHz
	1rBNsTCvsMLWsh+jtf6V9N3evObtu4mzlDJA/1t2ni5E0iwooX4Bt3WGRIaEopYsV/2aK2xALeA
	lYxpzBEJ2HSGzBkjl0b+cpff0tqfUvMLazfjQ==
X-Received: by 2002:a05:6a00:3992:b0:84c:2e2d:57b with SMTP id d2e1a72fcca58-84f2e05d4b1mr16499296b3a.27.1786033716084;
        Thu, 06 Aug 2026 09:28:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f4538bc10sm1716892b3a.3.2026.08.06.09.28.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 09:28:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f4077f39-0427-4bb9-8b6c-ddba3f492765@roeck-us.net>
Date: Thu, 6 Aug 2026 09:28:34 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Sashiko <sashiko-bot@kernel.org>
References: <20260804034811.2385506-1-linux@roeck-us.net>
 <20260806173411.6be71067@posteo.net>
 <deb3db39-e8da-40d2-af9e-bdaf73b9bf3c@roeck-us.net>
 <20260806175645.5e50b70c@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260806175645.5e50b70c@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 08:56, Wilken Gottwalt wrote:
...
>>>> +	s64 result = mant * scale;
>>>
>>> Uhm, this is a 32bit multiplicaiton, actully a C gotcha I explain the beginners
>>> in our company. https://godbolt.org/z/eM6TbGG5E
>>>
>>
>> It is, but that is ok and intentional: both mant and exp are guaranteed to be
>> no larger than s16, meaning the result is never larger than s32 and will never
>> overflow.
>>
>>>> -	return (exp >= 0) ? (result << exp) : (result >> -exp);
>>>> +	if (exp >= 0)
>>>> +		result *= (int)(1UL << exp);
>>
>> This is the calculation that can overflow, making it necessary for result to be s64.
> 
> Yeah, it was just funny to see in the wild. It made my day. :D
> 

Guess I lost you there. Do you want me to change it ? I could add a comment, or just
type cast mant to s64. Please let me know.

Thanks,
Guenter

