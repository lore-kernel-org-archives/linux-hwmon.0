Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8970C3603D5
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 17:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785950388; cv=none; b=rs9UmCcaJ+rYxSbPsiHSa0Dfff5zIU8GaxfJwZE/APvuiBBl7wRigmoNj25Ok9IZXRRscD+x4Bciu2k2ejy143JXvKD/r3/Z2pzNgePGWUv6BzeOB+CIvUgdvO8nASgkQAQ+zD9R1EWt+u6J4hkT25I6RyxYLBTpYVJWv2/1G/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785950388; c=relaxed/simple;
	bh=u44e3+yoqxAx3DiRDHHu1C255ndPALBfga61Rc227dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqbtxtsOIP2CymW51MmYIFp7e+s4udPoLz3UlOTq5N0SLgbOA+TWuDcZoJowkPOKofZD+6PysQwYS41LjEKO4iWOKQbSS5Kge+0+UsmJYXu05BshsWNTn+dabhjuPXlAC9wuP+4d5zGkXRsqJS5sUesL4ijw8fBsHdMY1Fb2grY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDGa8ADA; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDGa8ADA"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d004f135b1so16482325ad.3
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 10:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785950386; x=1786555186; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qh6Q9pkuJfEy+sWhxtSL0/pQgASaY20/pFo8x1Uwbgs=;
        b=FDGa8ADAJRoVDfoA5CM9lXfuhn18NPNne+i5YYhjJZHZHdDEOvvoW1Lnn+zbAKrzAt
         J/yMLugQwpbN2Dlx8RWvplMQDi2jnbhjBJbEp6SBWslAJZPs7X3RLCj7G/GLAXs87uJH
         bKFXTtSfHHreT6Lf6LH9YMg21fXp+w2TtFESVpnH9z/1LCxTUKd1U1CpjrDx+uaW/hze
         rWVGsP2F3ylhmwXXYqeGn+1zczV9jKrOF9m4vFbn54JMk0wtqtRGjb3RKbjykQioROhg
         OoHyf0EQn+F2kpHkRicz6RquMPZYAOwhamSJBvNya4TaYvSf8Sfc/MSQ6ogvtox1cZQB
         Ca1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785950386; x=1786555186;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qh6Q9pkuJfEy+sWhxtSL0/pQgASaY20/pFo8x1Uwbgs=;
        b=VgyFPQUbcc2JZU/5YPHmkEir/4HwL7/76nWE6Q3QqEKhBfTw4iFZiZ0E+jjUdlE46k
         neYM62pOUJN2Rmu54v0fjVw0Ib5ZbznevJN98JG/4K6nmEcAxq/s3P4fK+v+gatdx2mi
         VnKfTAuFz/CqT+Uc7M0EdxjedOSlXJ7hx+rUNGl2XyAevGI8E86haw8KQERKEawJ61yP
         5xkZ8L4Y6Xdx9ys3Ov8QfeNPLoRvPHiVz4tdqHso2uSSOvjTQa1iTLenBJcWW9wOqflB
         StX8fIWWzUQgTAUZFqS2mS+xCmZGXeG5i+vOZcjlTsH52WdwrQL3yV7K1RJY+CXH0D9A
         DiMg==
X-Gm-Message-State: AOJu0YyTfSNRZqLtoWDIFdR1IFqhSl6w/m9Ql8QoiWVHJ0kC8mZNeh66
	kcbt16zJeQ2aaBy0/C2Gk1WNmq399GE23TZLQisXn52WSZ4ZnFym/nTO
X-Gm-Gg: AR+sD12GPAaANwwXVaBgP47LtgQkWMm5t4uDlA9o+d/CqyKAMAzhgD7oP1HkoHc9XoH
	FV/100UIEXkL3Aa1S7DfRvs5MSpePIJfB2zUg2lsNVQCrRfNoAkIakgT2HxkJdnLGPkilAgF7nT
	IaXWxP+WP2T9aMbTAz00A0TpaOX/R0kOgO9j3UclVu2BpZUyB9ZEE2bn8g9lp8RXtZisl32DmVQ
	suiYN/DWf2p/pUjPiLXW7Dugkp69duI9o3t22dvKs2S62jW5tyN3oVWMPIN8/SBZuV1jy/kzT1X
	jarTtoWuHhvQ+TFBvUz4sYwkPXoiN7cJHn8nVJzGOf3AnPqRlHzxvhkS6uSXnflonykezioDGlE
	BDBOiIRVYHCy1dgYGIYm6CSpGPH8wTytcIk53S2hXdojluTbis2fYc/LGNclosLJUJglBI99Wg9
	FbWc6bee6IG/hZyKjyy8yrO2E8Gwr1I6frJo6zGJONlMRaTEkCCyfmZ4SXkJH33ggaZCEWLYMYo
	R5lMLxWr8enrZKik9lDQLoMtTJdmOjc4T3ZAFz/78TugubCUdJoc8U9NY+s
X-Received: by 2002:a17:903:2d1:b0:2cc:90aa:8787 with SMTP id d9443c01a7336-2d0ca7b54e0mr105799645ad.6.1785950385629;
        Wed, 05 Aug 2026 10:19:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867bc341sm28928994eec.27.2026.08.05.10.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 10:19:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3754e601-0018-48c1-9629-aff3012c2685@roeck-us.net>
Date: Wed, 5 Aug 2026 10:19:43 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (ltc4282) Clamp negative current limits
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Nuno Sa <nuno.sa@analog.com>, Sashiko <sashiko-bot@kernel.org>
References: <20260805005721.1566034-1-linux@roeck-us.net>
 <20260805005721.1566034-3-linux@roeck-us.net> <anMAcWIbE7_wOjIv@nsa>
 <b1aec4f9-020d-451b-ab5b-af48ab2671bb@roeck-us.net> <anNguh22t_Pvtdri@nsa>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <anNguh22t_Pvtdri@nsa>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/5/26 09:14, Nuno Sá wrote:
> On Wed, Aug 05, 2026 at 08:41:30AM -0700, Guenter Roeck wrote:
>> On 8/5/26 02:22, Nuno Sá wrote:
>>> On Tue, Aug 04, 2026 at 05:57:20PM -0700, Guenter Roeck wrote:
>>>> When a negative value is passed to ltc4282_write_curr(), the signed long
>>>> val is cast directly to u64:
>>>>
>>>> drivers/hwmon/ltc4282.c:ltc4282_write_curr() {
>>>>           /* need to pass it in millivolt */
>>>>           u32 in = DIV_ROUND_CLOSEST_ULL((u64)val * st->rsense, DECA * MICRO);
>>>>           ...
>>>> }
>>>>
>>>> This cast converts negative inputs into large positive values. The
>>>> subsequent division result overflows the u32 in variable, truncating
>>>> to a pseudo-random positive value. When this is passed to
>>>> ltc4282_write_voltage_byte(), it is clamped to the maximum limit instead
>>>> of zero.
>>>>
>>>> Clamp val to 0 and to the maximum supported upper limit before the cast
>>>> and assign the result to a 64-bit temporary variable before the division
>>>> to avoid the underflow and an also possible overflow.
>>>>
>>>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>>>> Fixes: cbc29538dbf7d ("hwmon: Add driver for LTC4282")
>>>> Cc: Nuno Sa <nuno.sa@analog.com>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>> ---
>>>>    drivers/hwmon/ltc4282.c | 6 +++++-
>>>>    1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/hwmon/ltc4282.c b/drivers/hwmon/ltc4282.c
>>>> index bb7f6727c44d..bb1bcb369016 100644
>>>> --- a/drivers/hwmon/ltc4282.c
>>>> +++ b/drivers/hwmon/ltc4282.c
>>>> @@ -14,6 +14,7 @@
>>>>    #include <linux/hwmon.h>
>>>>    #include <linux/i2c.h>
>>>>    #include <linux/math.h>
>>>> +#include <linux/math64.h>
>>>>    #include <linux/minmax.h>
>>>>    #include <linux/module.h>
>>>>    #include <linux/regmap.h>
>>>> @@ -929,8 +930,11 @@ static int ltc4282_curr_reset_hist(struct ltc4282_state *st)
>>>>    static int ltc4282_write_curr(struct ltc4282_state *st, u32 attr,
>>>>    			      long val)
>>>>    {
>>>> +	s32 ulimit = min_t(u64, INT_MAX,
>>>> +			   div_u64((u64)INT_MAX * DECA * MICRO, st->rsense));
>>>
>>> I guess we can do the same as in ltc4283 instead of just assuming
>>> INT_MAX:
>>>
>>> https://elixir.bootlin.com/linux/v7.2-rc5/source/drivers/hwmon/ltc4283.c#L765
>>>
>>> And so we just account for isense_max
>>>
>>
>> Sashiko isn't happy with it. It suggests the multiplier in the limit calculation
>> should use MILLI, not MICRO, and that a 32-bit operation could overflow.
>> With that, I'd rather keep it as is, or drop that patch and let you handle it.
>> Please let me know what you prefer.
>>
> 
> I guess we would need to also do what we have in ltc4283 and limit the
> range of values rsense is allowed to have so we can better reason on
> what can or cannot overflow. But I can't really commit to when I can
> handle this so I'm fine with the above approach.
> 
Makes sense. I'll apply the series as-is. If you (or me) ever get to
it we can always improve on it.

Thanks,
Guenter

