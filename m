Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8470C3839A8
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 05:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787031892; cv=none; b=a0yBqqUI523P1RYBy1Xqx3FGahRiKBNDQhCCSSHR1+EjKufmKoCRtGwowB3LttJC23dogozAEskp2zGnlRpa5QU6X7KPavhZ6oNq3jaJGT5aeEVLAojGbGDWbYfiKvkzXQ1XzzwUyPkIpBdossmB51wQEjLTSdptW/PIcdG8F5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787031892; c=relaxed/simple;
	bh=DCp6OkBmdmMv2NePYk30182yMzI7hkHYlF18VTvzjrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhR8W29obWAehsBKMwpn2Dml9VkA71kNO5t7wVkAEgbAZW5nxPar1dgcKEoc+QfkLZrnvmLMb7g3yZQ6PfTQ5dXRakAlm8KTpWRqwhXmbWJmBN5h2sYlVBz5Orcgz3+/4gn9ytz22S0kX5rIWlEmlz5ftCDWlOVlaPgys+oMS2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eo2gJnbz; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eo2gJnbz"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce7d2adef4so7998855ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Aug 2026 22:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787031891; x=1787636691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SCqb7PDBKZR3AHeL/lNxASjVmuk+RezYQY93nwLpxw=;
        b=eo2gJnbzIYNF9UpPPngBnqfZ93MJN8t2JRpApLL2FK6DW8wiTczStbrLukbcsCnlp3
         YVQIfJvXE6VZwBs4kKEJVyflPbAR6dDQDZ50E21qV6HkUF/Dc0dgoF0/I/SGwU5VVRc0
         TYrPZihT9/Zapp/p+b9hmSGf34U0TgGoPKXJu9vctTNonN2WG+5VBLzL+IVHSQf2YEW5
         /T0iml8wbUSnDjDMjZNNDnFg38dnR5mvVJIA+c4sKoQmT6I/d4Xq0BLUbrBcxwFPUz1e
         KRdfytOeCJORFPVSmKSkvwIqfLsZ+KjSV6lhcPnxmFj/WRm9RbJsD38jhY6Q2/eleQyP
         BkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787031891; x=1787636691;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0SCqb7PDBKZR3AHeL/lNxASjVmuk+RezYQY93nwLpxw=;
        b=rHs7mxaINJlVg3arVK0XZ2q4vDaiIUzUbonLXW/x4SwlNTX76BWlXrzUvD7uDMnTnw
         mdwCTOyEqYODy+7CeNhmyqmStCfup0xNr4hxCinFJaJ9Q26tN5jRuqmkUMB48n2jTQSg
         +McgCeIaqnv3oZHn4t/9DGOx3O74Lfhw4mDeRt9sWV3tkFfQQdZJ96yrTIgWGUptvOyn
         qwZVhJ4UmhiDz+yd+8BLqIV8zpxN65NaJm9/Vr844UicjwQVNcLw6dVid9UVdLdPQA0a
         X7lJkWI0pJc75LW9SM4HPgRB6+95KEJUsfhvf0gD5Pm74ROzh44iz8QGqisHVni2ldWA
         Kipw==
X-Gm-Message-State: AOJu0Yw1WG+ANr2vdTcR7kFGUQBJPvQzRPTQCDkC69dBpOPnvJ1XYiRU
	+LwJD39x36jKUYV3tXggWM0HV0pvRon75XbRBm32+LHRRspnWsrLrSlyguZDFQ==
X-Gm-Gg: AR+sD12ATIaaWD3He+kQltRBbhQj9fbrirhn+anjeXBhrPK3+c5MkCHYtWuwYeRU3Ko
	hNKXeDWU0dfjpdUhfYXprM6cp2fpipMknmp8SZMGEWoaXXnbDDoDudqwEXZvsO5+NFYMsz4A1yU
	gC7ieuwtYuOfYQZPCmKeybLMAuLa89p9HwlhrQnJrzSivjwxcBaHRRuHNgo+0T49K5eEFKrAk7Y
	5DIekBDVtUZPBnrxJ+0rgOUkexU05s1PS1xLPYj0ccmWCDXjv/mQ++lF6TI/V/JoZEzT9ZioYXn
	IC8RgEBLSKuTmo+oT7ev9VI/4aZUdAU9kvwnB5bnAw5jF0dVdFkHHMkeQplHGj8KVfWxqXaeQKg
	Hg2yxUPt1pfsmp8DGDb5GIKYMzJ4bGXtMLoNI5AQl6iu96Ax9IXyaZrUKr9Y/Hnqr6ljpaSDkOy
	YoTC+BhhP8HXQVXLrzEjLvVvYYK1CFM9mFiubnrZSyiimuwpBHgfKziois+HiCa0VtEKm3S2Jat
	oN/REVGQ3Ct1x6Ahn/s2zfDnU37Ox5+aU4mrw==
X-Received: by 2002:a17:90b:3f50:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-3933b7213c9mr32388217a91.5.1787031890756;
        Mon, 17 Aug 2026 22:44:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ecb179sm10128985ad.68.2026.08.17.22.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:44:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <519971fa-4ae2-47b2-93f4-fe85cca05e62@roeck-us.net>
Date: Mon, 17 Aug 2026 22:44:48 -0700
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
 <e1d6f669-b48b-4009-980f-a9defe273569@roeck-us.net>
 <d6d4148c-dfd2-499e-a068-85dfa68c2db2@gmx.de>
 <005e108a-a337-4c50-bc2e-aa7d933b7e2a@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <005e108a-a337-4c50-bc2e-aa7d933b7e2a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/17/26 22:00, Armin Wolf wrote:
...
>>>
>>> Looking into the code, it seems like the device may have been instantiated
>>> through the detect path. That makes me wonder which distribution enables
>>> CONFIG_SENSORS_SPD5118_DETECT because it should _not_ be enabled by default.
>>>
>>> Anyway, I guess I'll have to implement a dummy write operation in
>>> spd5118_i2c_init() to check if writes are possible and bail out on error.
>>> That is less than perfect but the best we can do without a flag from the
>>> I2C controller.
>>>
>>> I'll look into that after the commit window closes.
>>>
>>> Thanks,
>>> Guenter
>>
>> I already have prepared two patches for that, i will test them on my machine as soon as possible.
>>
>> Thanks,
>> Armin Wolf 
> 
> Both patches seems to work, but i do not have an DDR5-based Intel system and hand. Still, do you want
> me to send those patches when the new merge window opens?
> 

Please do. We should see a couple of patches applied to the spd5118 driver
during the commit window, adding I3C support, so please remember to rebase
your patches on top of v7.3-rc1 before you send them.

Thanks,
Guenter

