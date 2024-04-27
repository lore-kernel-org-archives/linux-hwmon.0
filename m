Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB05181
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 17:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714237224; cv=none; b=KC8ar3HNJkXswo9pm7ktzKBNGuVML+nApNc0ADDZRH0GeMssoNKc+KR48LtnQUopIPYEWyL5h1i5JIfWoKkglOxjwqi+GgZ9QAF2y7dlZaYtqFfnchdPgog90F2zKwKj8LK6UVdGAJVLw5qmn7b8p2USgqMJEkJwgkszFPy0f94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714237224; c=relaxed/simple;
	bh=v5SICAXKhQzA9AOZh66nyoqvdr3pjYp1+TLd/ahz9+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2afKnV79vrWoxst7LEa6UHk1/tMcwjinNaD2ZdJLl/mKEFRCqIpnF65uIQok3a9ZCNoZQIt0v2Fhow49FAWsSottBskE2752Oxq74wiJ5EUUHNVzJlC38dkcnRRBGzzvjjdgJ8jBTMsabWtpj5iGlupZAzSObMtd1Lb+/rxtpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlnNizfH; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlnNizfH"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e65a1370b7so29564605ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 10:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714237222; x=1714842022; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CQK5uDRl+st0JUgZKEA1vp0wJrY30DhsN2KpbZQuSds=;
        b=dlnNizfHr17UppzjQOA0CwWMZjwKKazDp8ZFqr6QhRCp4cVCPqsYSee8rA1LoIesOn
         JEVV+gjtnwy6NP45lfKiQagqkoYNA8YzC96fILbfvwmegYyrXvCGro3plMmqyfhbol86
         mvcJGyH/ffafY3E9biN6Re3RPGrtnZPR9N9jvlf7DknRFNADtG/ySlxspjE4bO9zlKho
         Aa9iVYIJLLqVX5+vAhLy7Ys7tLhIKlbtK7Q8/4FMREuwKBEPMHGsUUQZLVfO2znhg+AM
         /PvX7b1g1hOzF1VN4ASuD3DVrXcbnidzj7r1EgYEXZMqBNIWrDjcTYJ3He67f8DBckPU
         l2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714237222; x=1714842022;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQK5uDRl+st0JUgZKEA1vp0wJrY30DhsN2KpbZQuSds=;
        b=dNTK3ytVHqlcGva0rtsIuBciQXdxF3mYVBcw2zp+iFXbBy2Ek9prYsKpj/3wO+NfP7
         fTNFufQ8OxXf5uq6pyJi3DhZ3QIqWgJ3XsQFUOeO+BVo3zwdeoAc3TCnjnMUMz0p+yJ8
         b3NhnLPGlNlwinlDxCIeO2MQ1TMy454jrcpNY5QYcj0pntMlOPKpLhC9bmTna7X8sFWC
         p0rb/WAePfU/xZvLyne89uFIPqJsJ+vyJvGhsE0esV2VRdbVNQtnaR1bxNKZ2JOLwBXL
         qZ5Nfdf2Kgvu41zgfXnQqFVF9WUV+P+aZX/LNAY8zJe1HbxzMYZJknF01qD4z/U7Xm3I
         AIxQ==
X-Gm-Message-State: AOJu0Yw/FRDYJMRvusRdblHNjaJDcRyip+Img8sfOYXSpUDxxcGUEtLl
	2gB8PSJ6W6AxCv1RrnTaP0LuUosVkvDEVSlhILQX07pTbBPbchKcX7ScOg==
X-Google-Smtp-Source: AGHT+IGvuV3c2Qv9ZIUDarWziMsarEiEeXgAxYnkm0s2l9HWcMiGKCyfrDev+Y2k8j5q6Y5yJqDEbw==
X-Received: by 2002:a17:903:41ca:b0:1eb:1240:1aea with SMTP id u10-20020a17090341ca00b001eb12401aeamr7235205ple.20.1714237221559;
        Sat, 27 Apr 2024 10:00:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f12-20020a170902684c00b001e284b9b28asm17616646pln.129.2024.04.27.10.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Apr 2024 10:00:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8382458d-2208-41ad-a0e5-dce77c1fc286@roeck-us.net>
Date: Sat, 27 Apr 2024 10:00:18 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
To: Frank Crawford <frank@crawford.emu.id.au>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
References: <20240427083317.2077175-1-frank@crawford.emu.id.au>
 <20240427083317.2077175-4-frank@crawford.emu.id.au>
 <8d9c9f7d-8a6a-488d-814b-807060aa8336@roeck-us.net>
 <0886c52480f15d3b9754d43642c722fcd9b6e722.camel@crawford.emu.id.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <0886c52480f15d3b9754d43642c722fcd9b6e722.camel@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/27/24 04:53, Frank Crawford wrote:
> On Sat, 2024-04-27 at 04:11 -0700, Guenter Roeck wrote:
>> On 4/27/24 01:33, Frank Crawford wrote:
> ...
>>> @@ -3144,7 +3186,7 @@ static int __init it87_find(int sioaddr,
>>> unsigned short *address,
>>>     }
>>>    
>>>    exit:
>>> - superio_exit(sioaddr, config ? has_noconf(config) : false);
>>> + superio_exit(sioaddr, opened && config && has_noconf(config));
>>
>> If 'opened' is false, this could be an affected chip. Are you sure
>> that it makes sense to pass 'false' as parameter here in that case ?
>> Doesn't that mean that the chip might be one of the affected chips,
>> but the superio exit sequence would be executed anyway ?
>> Am I missing something ?
> 
> Ohh, you may be right, I think I have got myself confused here with
> opened and how it is used in superio_exit.
> 

It took me a while to understand as well. The double negation of the
'noentry' parameter makes it difficult to understand.

> I think it should be !opened, but I will just check I still haven't
> messed it up.
> 

Maybe it should be something like
	!config && !opened ||		/* no or unknown chip, not enabled */
	config && has_noconf(config)	/* chip known to be affected */

which would translate "don't disable configuration mode for affected chips
and for unknown chips if configuration mode was not enabled".

Btw, I think "enabled" might be a better variable name.

Thanks,
Guenter

