Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D45147FAF7
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786031573; cv=none; b=q/a5FTBVFDFylu/dTXB4Y4g9A+BQP2Uds4PH+VzN2XtjzZ6zO+N9HJmOcTWwbS11O8em0KTJlYepltNS7Qkne36a9f/ZMqu7gkvDx1Jm+yVAPp5CghPxvC5eJc4vl/Mt70fLB6+feg0deh5pVSfH2AD4gX10u2gLGeqe4U0sPhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786031573; c=relaxed/simple;
	bh=es/SR4mDG/KTPTsf8DwWFOOOiCZ0TfD848pueS8M0OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iHZp+wYVD53Cc+yNOBXE4fNKf9xb9p3QBHm+zFcxq4DUflaJy0kWU9llVaAVpsP8VBgifp5h0ltsFupEngwRAUaLAjrcDMgwxAJVVByfRQvvUkOrCavXNNftGfQBqZ8knujg+k1/v3Jn4sz1SFWhOKGVZ1APoaCSYV6KVoHCrHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/1V2V7o; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/1V2V7o"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1737186a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 08:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786031563; x=1786636363; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHB6kc3DsHbZXQt8y5jFpVQxBtNDvo5vkQaoqCMrrjk=;
        b=d/1V2V7oW15bgca6cnSfY/FhDDAr7IjRjqu47ljOvXr8LGeDtHYYvv/sq6YqP4vYR0
         23B5By3nDAHq+JMrkYg8G+1esTYDf4nlNQ0r7dLEjGFeYi8W3vCcaInTBo0Aescd8ALS
         mpQrLPfQej//hO7UYPAEIqLq6mAVI8375gjEuArK8yuZ3Wa7fpBEbURnXIfhtyC/68Up
         tlmkx/Jw1e7AKhxnWph3wM2p1lV4X1IQtTiZx6bMDjUMJShtU3z59/XiG+9l0f9O0SaH
         4GH8M7SoN6d0kngYXpPCOBZQOGVuRaYPLdlD7E9GfQP4F6NOy539v9x+idcLMD87GkLe
         IrbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786031563; x=1786636363;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aHB6kc3DsHbZXQt8y5jFpVQxBtNDvo5vkQaoqCMrrjk=;
        b=SNjHqWkJ9nM45lwUHGs1k+rizhlRzeofmZHz7cdJ2AmiagBgWe48GEqVEsbEpxaNpI
         nbukifWN5xUJX7ltOwoHrZCCId3ZLc3IfkQMGqaX489KkdeTnmIGLlmrfPPBMtkMn74r
         WCEO4/MuvSjk+GLEBCl8Uo4n9je25rqmCU+V0rPFnrk7AFSp81z97frB359hE2XxIeZi
         P15dIbbLRiFTAiDk0KOTnS93OPEuTHp/XEZedChTxi0ENxO5hZABVyaYTp+80gqRdOef
         EVsDXAKaObYP+G2o3lGvTqsf9btYae7iHWvCeyZqGPONiunEn0ixjmNkEt+EMw+ohpK7
         M65w==
X-Gm-Message-State: AOJu0YwJkFgp1xQ1Lm/kFysCcytUUuTbZNgI23rhKTTwH6+L9JSNrMR4
	fFAMN5zS/UE3Tv1wAt2oC9IocPAYuom3uETaOzUzBnyyqZvGf6ZjeRcL
X-Gm-Gg: AR+sD11f3RPSUsaCvIcCTzuUoFToT4mahBc0LXcY3s+xZ8C/d0gaIgZsluSxknxNQoT
	uK9X8cVrSKa/Oo0F+w3lei6OgLo7pCDd/zDIt0CQjKIn3xgSOU+dO+3Wf2Vf/dE38/bnr1WY+28
	xQFfAkN29klSiXA38gMT3k6ANKpNWNFGN/rj/ALDf+qrIZp8KYlrKrZp/iuUUtb859JJwL9qBDv
	W9BLrsb2TlT32AnvSbi14o3yV83xuYxAS76BUqeIoMF/o3SHNlgxP5engHKyJ8sF1FvCWs30k8f
	Yd+P5X/2Kk5doKVrFhRqSYFaSfHdNB46WQizqdYi9ziREujTYaZphBImgSJLNBKQJHfu4GGq0jH
	+0lfmWgvrKc5eubRmfpLoko6tsgLF+Wi7LZeWt0TTS2uGw/ogr+WbLAy26sJ1cxO/ZDtK2JWzoi
	Q5A/J0HzsoQ8yCNEc2M/HGIjmLp6msUnHIYQHh+NwWc2+gSVWrdFEFZ3Z60S3jSaGjUrTxtNQFA
	CuWtoPAkAg8Cf36DeO1zqGPQ+ud06uqKGotpQ==
X-Received: by 2002:a17:90b:51c1:b0:37f:df85:272f with SMTP id 98e67ed59e1d1-3903c5d7c48mr17194088a91.19.1786031563323;
        Thu, 06 Aug 2026 08:52:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm27674301eec.12.2026.08.06.08.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 08:52:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <deb3db39-e8da-40d2-af9e-bdaf73b9bf3c@roeck-us.net>
Date: Thu, 6 Aug 2026 08:52:41 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260806173411.6be71067@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 08:34, Wilken Gottwalt wrote:
> On Mon,  3 Aug 2026 20:48:11 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> In corsairpsu_linear11_to_int(), the mantissa is extracted using bitwise
>> operations and cast to s16 before being shifted left:
>>
>> static int corsairpsu_linear11_to_int(const u16 val, const int scale)
>> {
>>      ...
>>      const int mant = (((s16)(val & 0x7ff)) << 5) >> 5;
>>      ...
>> }
>>
>> Due to C integer promotion rules, the masked value (which is always
>> positive) is promoted to a 32-bit integer before the left shift. As a
>> result, the sign bit is never extended to bit 31 of the promoted integer.
>>
>> When the device hardware reports a negative temperature in Linear11 format
>> (such as an ambient temperature probe reporting sub-zero), the negative
>> mantissa is parsed incorrectly as a massive positive value. For example,
>> -1 becomes 2047, which scales to 2047 degrees Celsius.
>>
>> Fix the problem by type casting the result of the left shift operation
>> to s16.
>>
>> Another problem is left-shifting of negative values. In C, the result of
>> left-shifting negative values is undefined. Use a multiplication instead
>> to avoid the problem.
>>
>> Also use a local s64 variable to store temporary results, change
>> the return value type from int to long, and clamp the final value
>> to LONG_MIN and LONG_MAX to avoid under- and overflow issues while
>> retaining as much information as possible.
>>
>> Reported-by: Sashiko <sashiko-bot@kernel.org>
>> Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> v2: Skip handling right-shift of negative values
>>      (since it is widely used in the kernel)
>>
>>   drivers/hwmon/corsair-psu.c | 23 ++++++++++++++---------
>>   1 file changed, 14 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
>> index 24100519cd83..c437b469de5c 100644
>> --- a/drivers/hwmon/corsair-psu.c
>> +++ b/drivers/hwmon/corsair-psu.c
>> @@ -137,13 +137,18 @@ struct corsairpsu_data {
>>   };
>>   
>>   /* some values are SMBus LINEAR11 data which need a conversion */
>> -static int corsairpsu_linear11_to_int(const u16 val, const int scale)
>> +static long corsairpsu_linear11_to_long(const u16 val, const int scale)
>>   {
>>   	const int exp = ((s16)val) >> 11;
>> -	const int mant = (((s16)(val & 0x7ff)) << 5) >> 5;
>> -	const int result = mant * scale;
>> +	const int mant = ((s16)((val & 0x7ff) << 5)) >> 5;
> 
> 
>> +	s64 result = mant * scale;
> 
> Uhm, this is a 32bit multiplicaiton, actully a C gotcha I explain the beginners
> in our company. https://godbolt.org/z/eM6TbGG5E
> 

It is, but that is ok and intentional: both mant and exp are guaranteed to be
no larger than s16, meaning the result is never larger than s32 and will never
overflow.

>> -	return (exp >= 0) ? (result << exp) : (result >> -exp);
>> +	if (exp >= 0)
>> +		result *= (int)(1UL << exp);

This is the calculation that can overflow, making it necessary for result to be s64.

Thanks,
Guenter

