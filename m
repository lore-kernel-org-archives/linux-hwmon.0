Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4B5410D0C
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777666459; cv=none; b=Q762SGiebOouAOTT4wM/667qZzGMgvBOw8Bx4kxas00RjfcBxpFYfsxIfgEKbR0LPPCPLm9GAxd4K/4aoHfGiDEV0To4Xjlf3FFovSSYrOnXcpSDrEblvjt1+ymzfofh2TjxV4noQkm5qoANWx1WZIlUyz14ajk47/TcALH1G3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777666459; c=relaxed/simple;
	bh=uuvLsLWGR5q7nyZYvnkjWumDlhXNso2O/+PPF8+kmTw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OymDz+amFnsdXoC34NlpYaH4XrVhmRNdVNyx2904CX0LjeAjdMq3prQ7GQfgaeaZIgDQYWtUkftsJjJsGOhqcYnuMflH79EEmGQhDuv0pCSTf4nd5o7+4asyFqLOwEZs/kCoYR+m8Yy5rdH+zkWlz/h5zUJNAF+fO+ipHRZHINA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt+3xOC9; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt+3xOC9"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so1093049eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 13:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777666457; x=1778271257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=n2SSH3vS97MZdCvp0tglDYBZWuXG5RkG+igKiDZHuRU=;
        b=Bt+3xOC9G8z5EEfohlQGrIXpyBNqL8bEI2rjV181DFM9kpUck3UvmlyzlmrHqSra+F
         Ef3RSwLXxre3w/sixTa/K1lw7XpLA+4Ad4z/vRrwgUyWJtxHk4FZpF6s46O18H/YxV+F
         t/Ow7xGNz5CvqLGs5w0uyJ2vrsxpV65a9ViCFd4CewNe1AJKPiOKM/Kjg4G1Gh9s4P3f
         H/7BuhNZfOb1Y6MDiQSJ0uCPTx6CUZLIwpf5h4/Dos0dQDeJaR4mVTNZjhUwOEXs18VE
         ZOLH56w6mqNCWdXMAYInlz8vR/kZ3Mi4DsCessAEjuf3ZF1Dmip26xCL49hVhykm7Qch
         NSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777666457; x=1778271257;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n2SSH3vS97MZdCvp0tglDYBZWuXG5RkG+igKiDZHuRU=;
        b=QfcYx82Sq0P/dtOUKpGhuAt4lGMcFLP548FGlA/qpTx1ueJHmhbzeVehYb9u7M53u6
         o7hNk+ZDtR1DfS1HwtIRkrkfdc0fZFlBb02C5NMQusjzjHTq+v5W0Pp3E/m0mIY+XaxC
         SbqmoXNWT0NV8jafrNoVX33kD6bPTQSNuIIOUS6l+lg8WYZTscGekIlikBWQvTKynlXF
         9Y9tqBAZk37aZwyy995YKya786ojV8Fn0S1areW2ybuUDr27TIfgBvoGAH/G22cMBwRc
         xMW1nkTFYo2AX8gXpUSjecnx9L5WlzJwD0lFsplMAAYlfr6DY/6VQUORdBPdpb9X1mJE
         lYOA==
X-Gm-Message-State: AOJu0YzLlJrYDrSrISj13D7c5fSNWiLMUHopSBcTta1JwS7fBkdW2Hbx
	cGgDKMWjuKmWWDJvZogUtS0oaTXKUiHs7vZKFeH0ibwm2oATdZ8iI8eO
X-Gm-Gg: AeBDieuG22CNxAACtvdKDw3ApqAU3UP8tAIwVI/CBtZatgC8VYXceDpIDoFmDPAuuWc
	qI0lA1Yt3L567z3tCbAeH4eYNTqcQ9Fjij2CJbf/FsZxCjx8KZQiq1ctMx/Ypw8xzdTPDPyNoNY
	fUMyWOHrlII1Y8SnZS2MLsU+PEXzwCut2eB8Jr7Ekg/96gR4VsbkSoAyE/XkyoimyhNGZZup+kf
	RxVN3K3hUqM9ZnOrBJ5i0IsSEDj/AqPyNcC4lhd9q83Omt+5mT9eFnb7H2WVU/NdCWBghaszks/
	fK/zokK1EQ2cIT5JKkABuXemHwV7UTQ7mnyy0DYfOGmadZcfHi0CEyS75Yst/37PpW2pOXsRHtb
	favBgfvpyQYxEer8dZ3Yo69CmlDIV+euY9sSxY0BsDiY6bTdgiA5Ybe3LFnEEkDUcYfWaqoP7wG
	O3MvKyCiHzuyLFSIvTvH4OphWs0O4xj/okhlN9vyusmc8vQEw//YHXJoREKzP7RPp+vdl5f9RAm
	hPFps2cEdM=
X-Received: by 2002:a05:7300:8c28:b0:2ed:6f94:9d94 with SMTP id 5a478bee46e88-2efb9e807aamr355887eec.19.1777666457205;
        Fri, 01 May 2026 13:14:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b29b1a4sm5728277eec.18.2026.05.01.13.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 13:14:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b9e2db74-d2c7-4ca6-911d-0b59c68cd187@roeck-us.net>
Date: Fri, 1 May 2026 13:14:14 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
From: Guenter Roeck <linux@roeck-us.net>
To: markus.stockhausen@gmx.de, sashiko@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260501120518.3085501-3-markus.stockhausen@gmx.de>
 <20260501124540.0C11CC2BCB4@smtp.kernel.org>
 <039601dcd973$bf191230$3d4b3690$@gmx.de>
 <8776fc88-364e-4ac5-b30c-8a706716d8ff@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <8776fc88-364e-4ac5-b30c-8a706716d8ff@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/1/26 10:37, Guenter Roeck wrote:
> On 5/1/26 07:06, markus.stockhausen@gmx.de wrote:
>> Hi bot,
>>
>>> Von: sashiko-bot@kernel.org <sashiko-bot@kernel.org>
>>> Gesendet: Freitag, 1. Mai 2026 14:46
>>> An: Markus Stockhausen <markus.stockhausen@gmx.de>
>>> Cc: linux-hwmon@vger.kernel.org
>>> Betreff: Re: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
>>>
>>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>>> - [High] The active-high alert polarity configuration is completely ignored by the hardware because it is not added to the register update mask.
>>> - [High] LM75_ALERT_POLARITY_HIGH_16_BIT targets the wrong byte of the configuration register.
>>> - [High] Changing the AS6200 default from active-high to active-low breaks devicetree backward compatibility.
>>
>> unsure if answering to you helps both of us further. So my 2 cents only shortly:
>>
>> - Issue 1: Existing definitions for tmp1XX devices do not not obey "clr_mask is superset of set_mask".
> 
> I think you are saying that this is a pre-existing bug and that set_mask is effectively
> ignored. Is that a reason not to fix the problem ?
> 
>> - Issue 2: AS6200 datasheet states BIT(10) is polarity. Thus .set_mask = 0x94C0 can only align one way.
> 
> The reverse bit order of that register _is_ a bit confusing.
> 
>> - Issue 3: Please advise.
> 
> Above you are saying that the set mask is for all practical purposes
> ignored. As far as I can say this is correct, meaning as6200 (and TMP112)
> will default to its chip default, meaning the bit will be 0 anyway.
> 
> Looking into the AS6200 datasheet, changing this is not straightforward:
> Setting the polarity bit to high also changes the value of the "alert"
> bit, meaning the bit will be 1 if there is _no_ alarm. In other words,
> this only works accidentally right now, and it does not really matter
> if the default is changed. On the contrary, changing the default would result
> in unexpected behavior since the alarm attribute would report alarms when
> there is none.
> 
> So this will need separate patches:
> 1) Fix set_mask and alert handling for AS6200 to be low active
>     and to report the alarm correctly even if it is high active
>     (xor config register bit 5 and 10 (translated to 2 and 13)
>     when reporting the alarm).
> 2) Fix lm75_write_config() to add set_mask to clr_mask to ensure
>     that the bits which are supposed to be set are actually set.
> 

Turns out the default value for AS6200 has more problems. It is set to
0x94c0 which claims to be "8 sample/s, 4 CF, positive polarity".

0xc0 reflects the samples/s. So far so good. However, 0x94 is wrong.
It sets the single shot bit, effectively disabling the sensor, and
it does not set the CF bits as advertised. Please change the default
to 0x10c0 which reflects the intent more closely, except for the
negative polarity.

Thanks,
Guenter

> Then add this series on top of it.
> 
> Thanks,
> Guenter
> 
> 

