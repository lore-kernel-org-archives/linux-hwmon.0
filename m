Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E379A1C01
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 00:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787011900; cv=none; b=OAwNRR5JvX0C8f/QtBge23xw4szBvI8duuPGuz6GSxWrehfIQqzsta4nobxYNrhAcpvKyxvqBHxfljwM0zxnBOlRpy2B7jTFuuFU4nbpMMmMahYJxhs6xmNxUmxQlsTvDASem6eszRSVBqug7yFcs/AsOzIk55TFLU/Y3vpxPAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787011900; c=relaxed/simple;
	bh=Vua39mGgQNNULnKmc3uHyi43R4Dxv6s8JHhWzGNNKCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3gpPmnaJfdyk0s1tbiaTR7W7FXS2Gv72C+g4fREqmwrCy0fu2BJEqpxyAhuXLU1hEEr1IzptfRKmqtjSb0KZFtAh8nIKNTJB8mzUzPaEmk9FSZ7jUvawOZOU87McHHf9mhWollW3kkopIf2KOr2VvSGPtMCgE930F1XpyTzI1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kn/xbUsq; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kn/xbUsq"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbedda4c154so2243344a12.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 17:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787011898; x=1787616698; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+GYihHL51Jz0YdZbT+snV59RZmY8r/7lt0RLqBtISw0=;
        b=kn/xbUsqrcsmCulSNDoYHQM1bTqw78bC2d4Fp6j8ic+tfdoe3VCqdMVoKgc8t+mvCi
         MjhojT5IwmLmqAkUhgqn5YY2nKr1nfFW9nPojVu+6rv6XpXTmV904oKWp4+phz34Dti8
         IKn42ldk2otinuejE0qttpkA6vVNxAzIz28XwF+L4qdzATr+SJWWnY4dGvSZ7E5F8pAm
         7sFJXr6lw/zT+U0nOVbIdImB/1lwknQWpNyZ18xb2nNCccsF89+wsaIQhmeUBR7DfuRP
         CV9bkuDM+pAoXCeE1we9p7vxwJ4NUjucb1jzOu90BftfuOGTFHUuHj7dMw0Zv6NQ/V0C
         OQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787011898; x=1787616698;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+GYihHL51Jz0YdZbT+snV59RZmY8r/7lt0RLqBtISw0=;
        b=pBvqQhgLqITdJ0vVFdw5btq1XKeJEto22/tyDCCXALVqQJrZJz0J6ZV8dvpWuRUKfZ
         aLg70KmOmLzuMlqaHZX976B4tMrP+BhFpKCbXga3rbJOTPjxzE/4+0HbAUhyGQAPEtZM
         ZBbLb1ko5aVY79ztFLMCMTyFwGpc1GCAbN6AcHxqPErk4drtfHP1XBUAQOgFDzLu8wMT
         8o9sUIb4kY+keCu0BBT4yxEqNqoxDyZCkRb5bnhTinocPqopWYiJv3eVQuA/8zdBFDbJ
         KnVUVg+7pzIv6SjnI53WI7ikjyuEwsAbIfhdEd9xs6dGG+3tvLs6qA1uHUDPzlKpUYWT
         5Ocg==
X-Gm-Message-State: AOJu0Yxcx9khHz0epfhxco81tiYKBoNKe8vnivTnFrshZnDr1ltJEH/O
	ADL3VEXy11ByVvjTkVKQbZlkrOvbSQ+9jNlUq5Jm+REDnOnsPR+QxSzu
X-Gm-Gg: AR+sD10EmAaujU/enE7Ijz0MZruD4n/E1yNpR76ddjGHnfUBlDVYbQVi8wNmvi8rCCh
	NaAJ7TwcXzX0i3hGbfxrwqmeQF2DZylkZiBjpbOmQ2R0kWAwKn26q1TXnr91lqqBXORxI8doFSy
	m9KAEHE0FKClB+/Ft/jv6usJnUIem05M9fsS+Z7hE/EBC72163uUZ9wzi/DTdDQDknF1yQdN8aV
	y07H1Xy4ecId7J+upZUypg9ddD4eSKfYaw8yXRiR/+g387v53ClfOj9cHycshXcrrV3XOXHANBn
	O/tFrH/rPxCVtHKJW+jqtSQZk0PPaY8e7W4g03FXpDgBKZuxVCODhQkwanUrUddCQ02z9OTDdYI
	ZMybJ9Mb/2ie1bLqw3+nI+sLw/drp9GCas1hVkZDtN/2FjS82bibGMRHbbNU5Y0XKodgaKfpwUO
	iTYvsAMG2rDip+U1DSqInCpLl7PQcP9Q+2S9Tb4DMsOU9OLt457bv4A032xdJ7R0mAPpJYC/2xX
	L2HsLiTwz91zsnRGZo5vsyKQWo4G5W+6y+5xg==
X-Received: by 2002:a17:90a:1547:b0:395:4de9:b30 with SMTP id 98e67ed59e1d1-3954de91bb4mr5941700a91.5.1787011898197;
        Mon, 17 Aug 2026 17:11:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32678dd08d6sm14804102eec.4.2026.08.17.17.11.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 17:11:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e1d6f669-b48b-4009-980f-a9defe273569@roeck-us.net>
Date: Mon, 17 Aug 2026 17:11:36 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] hwmon: (spd5118) resume fails -ENXIO on write protected
 hubs
To: Armin Wolf <W_Armin@gmx.de>, GG <ggirouard@bungeetaco.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <-r61PJXRNuWsDjnDETHSh2v7ASrtpweJe8hLjf7CbNH8-rQMiDXscPp7F_K2wLsYg0gvrl9gt7M5vyV-rPLIPSuHIKjIUr4ipRD_2jeCsmI=@bungeetaco.com>
 <vPlYOTmuxKCPw1cRvxIWJfqFl7p8endHIMWS9DZwINEUCPql8VLF7GBkmEBMokDKtHop6K5TAPUAlk-17CFWlA8extBUV7XGnuVx1KJK3iU=@bungeetaco.com>
 <1050e9b0-ef6a-4bdb-9510-572c2a93b485@roeck-us.net>
 <jjJPzuDEBRVJ3kZwlt43bdlePFCpQRMREjsEVngkNZLaCQDi9wBEEZb4U-2nvZ67qskaP8WSEbux8AmWenQGHT0WIvFQ6ZU2G4zQl3Lb4Vw=@bungeetaco.com>
 <ebcb1afb-26db-46f6-8e9d-30218190870b@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <ebcb1afb-26db-46f6-8e9d-30218190870b@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/17/26 16:02, Armin Wolf wrote:
> Am 17.08.26 um 19:03 schrieb GG:
> 
>> Understood - thanks for explaining the page selection part, that makes sense. I'll blacklist it for now.
>>
>> Appreciate you taking the time to get back to me on this!
>>
>> Gabriel G
>>
>> On Monday, August 17th, 2026 at 12:58 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>>> On 8/17/26 09:42, GG wrote:
>>>> Sorry - I should have searched the archives before sending my last email. I've since
>>>> found this from February, which is the same problem:
>>>>
>>>>     https://lore.kernel.org/linux-hwmon/20260205102942.28745-1-tinsaetadesse2015@gmail.com/
>>>>
>>>> And I missed the obvious clue sitting in my own boot log:
>>>>
>>>>     i801_smbus 0000:00:1f.4: SPD Write Disable is set
>>>>
>>>> So my kernel already knew. Apologies for the noise.
>>>>
>>> Unfortunately that knowledge is not passed on to the spd5118 driver.
> 
> Yes, sadly the patch series adding support for this was abandoned :/
> 

If I recall correctly, the important part (a I2C_AQ_SPD_WRITE_DISABLED flag
or similar provided by the I2C controller) was rejected.

>>>> One thing I'll mention in case it's useful: that series above has spd5118 refuse to
>>>> probe when writes are disabled. On my machine that would lose me two working
>>>> temperature sensors. Reads are completely fine here, I get correct temps,
>>>> and my temperature limits read back properly. It's only writing that fails.
>>>>
>>>> Happy to test anything on my hardware if it would help.
>>>>
>>> That can not be done, as I mentioned in my other e-mail.
>>>
>>> Problem is that accessing temperature sensor data on spd5118 compatible chips
>>> requires a write to select the correct chip page. If writes are disabled, and
>>> the BIOS selected a page other than page 0, temperature sensor data is not
>>> accessible. Since the BIOS can do whatever it wants and may have selected a
>>> different page after a suspend/resume sequence, one simply can not trust
>>> the status when the driver is loaded initially.
>>>
>>> Guenter
> 
> Would it be enough if we always select page 0 inside spd5118_i2c_init(), thereby
> preventing the driver from probing on hardware that does not allow us to write
> the page select register?
> 

Looking into the code, it seems like the device may have been instantiated
through the detect path. That makes me wonder which distribution enables
CONFIG_SENSORS_SPD5118_DETECT because it should _not_ be enabled by default.

Anyway, I guess I'll have to implement a dummy write operation in
spd5118_i2c_init() to check if writes are possible and bail out on error.
That is less than perfect but the best we can do without a flag from the
I2C controller.

I'll look into that after the commit window closes.

Thanks,
Guenter

