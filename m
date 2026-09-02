Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A40531B101
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Sep 2026 01:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788312772; cv=none; b=NWA5X152IRRRmVqgLs3+MjRZmccUPBXt4ptj9eS4jKkEIv6ympPVvSEFRl5vAMK7fE63ikIO2g3EZhWvqkqdNEJ/0KpfqBv85Ul5yanGSzZMmsI/MT6sAuJorUSOQNIQcOkzsw0rEVUtHtlUsiIpZ2VzpuZZUwdTUJ8GEc7Z37g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788312772; c=relaxed/simple;
	bh=Y8CNqXosf2tz09A5tw5eN6YCkGwJcOPlKNtMf91Qu8k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JmTYxPPl6Sj1enavS6OH86K5YB8hTm9uC0HS26MvrtSBUnulUhVYNvyLCbvq1GeXrRIwHypSZXXDxt0Wy/ErSYSoZB4CoChPve11Fwn1016Zm+8IxKbq9BxTV09gvEOVZSJqgVUK31LkSdDE1zMI3z/u0tPloOXzHcv5FBk0d7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKA4t98Q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKA4t98Q"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-85377c8bc96so536229b3a.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 18:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788312769; x=1788917569; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LH00nxn3+kBAJt7d1ivQPGU9RFIzYw5cIjimdJAPCF4=;
        b=aKA4t98QnoiqNa3PujTKqJiggyz1ByIWeJQphK23BNmsztdcSyxoz/tklJkKjBA1py
         HsuL3N7CpJkYKHNfyiiM6D9YsrY9vOSiQZDqF2rT02Gsno+mvIgqZagLAprJ51Bvfe/A
         kyeEJdAF1V8uii0ANrUg7AJ5GKNnAUMadh4f4bwCkZSngLfj4ADWwmdV+exo6yRB30Os
         /JBakwU0dWdJXT1EL3mIWZoJxFH5kxHg7rQzBpnUVxmz3LVfKSwko/y5b9v+3zJsousr
         M8OzUATgCAuppzNTLoSEfQXAA9ZKRNblTQsVv3+tJh1mfgWRjYmU8iHjnJ/uqsPhePg2
         xlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788312769; x=1788917569;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LH00nxn3+kBAJt7d1ivQPGU9RFIzYw5cIjimdJAPCF4=;
        b=O6fVC5X7XRWJ/AnJ/pL4WFT+Bf57aQ8M7ktk/iljSNA5oJHajJoyV3EprPxGdaZiAO
         Vp6blQEcotuAV4uXnvNydnkxcrX8uWiwHbEukV3HbfbklvbOoCFwrFHgh6qrBP1adAVE
         RDWkt4jd4VWtqNmdWoX6tJw8sDwsJie2xzy/sDlVSlD88XmHgzhKOwT2XqFaVaWhE0UI
         U1JMG+kYn+rCo6Ulw0kzydxgUPqW5fUbTZe95IRC0d5t0mIwcUqXdDpS+TCzsHwtfVZn
         eBudy4YFn37Eal07+zi7n5GvtZwcsPskN4IEfkgwRNtr9YYBNocjdSdTSGzFGItRSv6r
         WaUA==
X-Gm-Message-State: AFuF++mft75JHCtcOcbGno2PGJPCw5RrBvgoX/zeru1AZ0WWz3ekawyG
	wmgwzGfHa1n6yAfkmyi1VdFqEKaWAtzLYhwQYB0JB+FVkpGXiPLrWcVQ57Hchg==
X-Gm-Gg: AYBFou3Xfgya450xga12CybpJuPQoZQSPGe//NnW6RiHr6lqaO/TQ1lS6MU29E6Cps2
	C5m4OZtUV3i0XIjHZwHvDuVFaUpEOMRs7AYHCewBlTIdrwFLvarZCM46ud+NhRto0wOK7bP5HMF
	OFWfmZrCgalkgwwkq236FnTFgFc/xNWHOFcram/H4QGo80n+iQnL5d11g2cWjiJyLhZdTjBDCnN
	rGiFxoRxXoF2/3t9HsI46Cwra5Ev/UKYgm72XSsw2OF74AkBMlqZxaFPdT8yoNYjp0nZ7d+mUZx
	FgFgj+dZRCjCl5RshwKjIJTJYQSWU3YOBi0O1JTFYvgUXGSyNFQ57DJN/iAXEiyRczFWrWgn1Si
	YnMQfHwqyrtnwKzXxdzsuamoZ40AW0ZZHc2Z+84oHs0NvveDmtEfbkSvvvP/cjgQIVqXIHOV8Qh
	TJQXSD9g1xsPuLpOlxGeF7FBm/a8QxhXYEJ26w6csGWRRCWzFVlfGcmDB3LlVf4Lzz06fYPlxUU
	2O8qvE7gODZvOovYZmqOm0Tw59dTLMJLnLw8Q==
X-Received: by 2002:a05:6a00:420c:b0:84f:a170:4f5b with SMTP id d2e1a72fcca58-85ed6790ddfmr2887004b3a.8.1788312768811;
        Tue, 01 Sep 2026 18:32:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db2ad6122sm576937b3a.15.2026.09.01.18.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 18:32:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <67938f6d-d60f-44cf-9b03-fa472c8a8499@roeck-us.net>
Date: Tue, 1 Sep 2026 18:32:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
 <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
 <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
 <5c17ea39-c479-4f88-adc6-9a86f3dfb96a@roeck-us.net>
 <d80cf68e-a6cb-4b0b-807e-313be29ca8ae@gmail.com>
 <49cafd78-2468-4b43-a376-a8b2e2de2c19@roeck-us.net>
 <11de1daa-702e-419e-912a-db37c9f28e92@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <11de1daa-702e-419e-912a-db37c9f28e92@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/26 17:57, Matthew Bettencourt wrote:
> Hello Guenter,
> 
> These are the only boot up messages I see for SMBus/i2c/piix4
> 
> [    1.848113] [    T272] i2c_dev: i2c /dev entries driver
> [    6.093885] [    T727] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
> [    6.093888] [    T727] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection

So bus 12 and 13 share the same controller address.

There is one more thing we can try: Print the selected port before and after
the access. The code to access the port number is in piix4_sb800_port_sel().
If we are "lucky", we may find that the selected port changed.

Unfortunately that isn't going to help much since we'd still have
to figure out where that happens.

Another idea might be to decode the ACPI data and see if there is anything
in there which accesses the SMBus controller.

Thanks,
Guenter

> [    6.095020] [    T727] i2c i2c-12: Successfully instantiated SPD at 0x51
> [    6.095981] [    T727] i2c i2c-12: Successfully instantiated SPD at 0x53
> [    6.096039] [    T727] piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
> 
> 
> I don't see anything on bus 13 or 14, I added 10-12 as well for good measure.
> # sudo i2cdetect -y -a 14
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> # sudo i2cdetect -y -a 13
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> # sudo i2cdetect -y -a 12
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- 15 -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- 49 -- 4b -- -- -- --
> 50: -- 51 -- 53 -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- 71 -- 73 -- -- -- -- -- -- -- -- -- -- 7e --
> # sudo i2cdetect -y -a 11
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: 30 -- -- -- -- -- -- 37 -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: 50 -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> # sudo i2cdetect -y -a 10
>       0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> 00: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 70: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
> 
> 
> 
> 
> On 9/1/26 5:36 PM, Guenter Roeck wrote:
>> On 9/1/26 13:53, Matthew Bettencourt wrote:
>>> Hello Guenter,
>>>
>>> I updated the piix4_transaction() (code below) to only print when there are failures. I then left the computer idle (~30 mins) while reading i2c info and SPD temps and I never saw any failures.
>>>
>>> I then did some sleep and resume with cycles with spd5118 driver enabled and that is when I started to see the error messages again in dmesg.It appears like there is always a failure but not every failure causes corruption in MR11. From what I observed it seems like any `CMD=1a` cause failures but no corruption while whenever there is a `CMD=0b` there is failure and corruption. Not sure what that might mean be but it is something I observed.
>>>
>>
>> No idea either.
>>
>>> I then ran sleep and resume cycles with spd5118 disabled but still polling i2c devices and could not produce any errors, however this was just done via my desktop gui console so the script might be getting suspended before whatever it is in the sleep cycle that is causing this issue to occur.
>>>
>>
>> That is not surprising, as there is likely no other I2C device on that bus.
>>
>> So we know that this only happens during suspend/resume. The corruption
>> seems to be happening exactly once per suspend/resume cycle, and hit
>> either the 0x1a read or the 0x0b read operation, but not both. To me this
>> still looks like there is an unprotected access to the I2C controller.
>>
>> What log messages do you see when the system starts up ? Is there anything
>> along the line of "SMBus Host Controller at ..." or "Using register 0xXX for
>> SMBus port selection" ?
>>
>> Also, is there any device at address 0x22 of bus 13 or 14 ?
>>
>> Thanks,
>> Guenter
>>
>>>
>>> --- sleep/resume #1 ---
>>> [  179.066004] [   T3736] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  179.066616] [   T3713] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  179.068576] [   T3736] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>>>              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>>>              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=00, DAT1=18
>>> [  179.068814] [   T3713] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  179.068888] [   T3736] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>>
>>> --- sleep/resume #2 ---
>>> [  235.947153] [   T3700] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  235.947827] [   T3699] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  235.951600] [   T3700] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>>>              STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
>>>              STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
>>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=00
>>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=00
>>> [  235.955119] [   T3699] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  235.955778] [   T3700] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>>
>>> --- sleep/resume #3 ---
>>> [  298.628115] [   T3703] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  298.629121] [   T3730] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  298.631589] [   T3730] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>>>              STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
>>>              STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=18
>>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>>> [  298.636234] [   T3703] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  298.637812] [   T3730] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>>
>>> --- sleep/resume #4 ---
>>> [  631.979533] [   T3021] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  631.980193] [   T3017] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  631.983008] [   T3021] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>>>              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>>>              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=18
>>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>>> [  631.985028] [   T3021] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [  631.987201] [   T3017] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>>
>>> --- sleep/resume #5 ---
>>> [ 1288.503455] [  T10850] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [ 1288.504462] [  T10813] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [ 1288.505927] [  T10850] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>>>              STEP 1 (PRE-START)    : CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>>>              STEP 2 (START BIT SET): CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=18
>>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>>> [ 1288.511883] [  T10813] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [ 1288.512541] [  T10850] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x08
>>>
>>>
>>> --- sleep/resume #6 ---
>>> [ 1339.566042] [  T10863] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [ 1339.566679] [  T10887] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [ 1339.570157] [  T10887] i2c i2c-12: [PIIX4 ERROR TRACE TRIGGERED] result=0
>>>              STEP 1 (PRE-START)    : CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
>>>              STEP 2 (START BIT SET): CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=18
>>>              STEP 3 (POST-WAIT)    : STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>>>              STEP 4 (POST-CLEANUP) : CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=18
>>> [ 1339.572182] [  T10887] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>> [ 1339.573363] [  T10863] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 (0x0B) -> Cache: 0x00 | Bus: 0x00
>>>
>>> --- piix4 transaction function ---
>>> int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short piix4_smba)
>>> {
>>>      int temp;
>>>      int result = 0;
>>>      int timeout = 0;
>>>
>>>      dev_dbg(&piix4_adapter->dev, "Transaction (pre): CNT=%02x, CMD=%02x, "
>>>      "ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
>>>              inb_p(SMBHSTCMD), inb_p(SMBHSTADD), inb_p(SMBHSTDAT0),
>>>              inb_p(SMBHSTDAT1));
>>>
>>>      /* Register snapshot variables */
>>>      u8 pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1;
>>>      u8 start_cnt, start_cmd, start_add, start_dat0, start_dat1;
>>>      u8 postwait_sts, postwait_cnt, postwait_cmd, postwait_add, postwait_dat0, postwait_dat1;
>>>      u8 post_cnt, post_cmd, post_add, post_dat0, post_dat1;
>>>
>>>      /* Step 1: Read initial register state before starting */
>>>      pre_cnt  = inb_p(SMBHSTCNT);
>>>      pre_cmd  = inb_p(SMBHSTCMD);
>>>      pre_add  = inb_p(SMBHSTADD);
>>>      pre_dat0 = inb_p(SMBHSTDAT0);
>>>      pre_dat1 = inb_p(SMBHSTDAT1);
>>>
>>>      /* Make sure the SMBus host is ready to start transmitting */
>>>      if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
>>>          dev_dbg(&piix4_adapter->dev, "SMBus busy (%02x). Resetting... \n", temp);
>>>          outb_p(temp, SMBHSTSTS);
>>>          if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
>>>              dev_err(&piix4_adapter->dev, "Failed! (%02x)\n", temp);
>>>              return -EBUSY;
>>>          }
>>>      }
>>>
>>>      /* Start the transaction by setting bit 6 */
>>>      outb_p(inb(SMBHSTCNT) | 0x040, SMBHSTCNT);
>>>
>>>      /* Step 2: Snapshot immediately after set start bit */
>>>      start_cnt  = inb_p(SMBHSTCNT);
>>>      start_cmd  = inb_p(SMBHSTCMD);
>>>      start_add  = inb_p(SMBHSTADD);
>>>      start_dat0 = inb_p(SMBHSTDAT0);
>>>      start_dat1 = inb_p(SMBHSTDAT1);
>>>
>>>      /* Wait for transaction completion */
>>>      if (srvrworks_csb5_delay)
>>>          usleep_range(2000, 2100);
>>>      else
>>>          usleep_range(250, 500);
>>>
>>>      while ((++timeout < MAX_TIMEOUT) &&
>>>          ((temp = inb_p(SMBHSTSTS)) & 0x01))
>>>          usleep_range(250, 500);
>>>
>>>      /* Step 3: Snapshot right after wait loop */
>>>      postwait_sts  = temp;
>>>      postwait_cnt  = inb_p(SMBHSTCNT);
>>>      postwait_cmd  = inb_p(SMBHSTCMD);
>>>      postwait_add  = inb_p(SMBHSTADD);
>>>      postwait_dat0 = inb_p(SMBHSTDAT0);
>>>      postwait_dat1 = inb_p(SMBHSTDAT1);
>>>
>>>      if (timeout == MAX_TIMEOUT)
>>>          result = -ETIMEDOUT;
>>>      if (temp & 0x10)
>>>          result = -EIO;
>>>      if (temp & 0x08)
>>>          result = -EIO;
>>>      if (temp & 0x04)
>>>          result = -ENXIO;
>>>
>>>      if (inb_p(SMBHSTSTS) != 0x00)
>>>          outb_p(inb(SMBHSTSTS), SMBHSTSTS);
>>>
>>>      /* Step 4: Final snapshot */
>>>      post_cnt  = inb_p(SMBHSTCNT);
>>>      post_cmd  = inb_p(SMBHSTCMD);
>>>      post_add  = inb_p(SMBHSTADD);
>>>      post_dat0 = inb_p(SMBHSTDAT0);
>>>      post_dat1 = inb_p(SMBHSTDAT1);
>>>
>>>      /*
>>>       * Dump full diagnostic trace ONLY if:
>>>       * 1. Hardware registers were mutated (pre vs post mismatch on CMD or ADD)
>>>       * 2. The bus operation returned an error code
>>>       */
>>>      if (pre_cmd != post_cmd || pre_add != post_add || result != 0) {
>>>          dev_err(&piix4_adapter->dev,
>>>                  "[PIIX4 ERROR TRACE TRIGGERED] result=%d\n"
>>>                  "  STEP 1 (PRE-START)    : CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n"
>>>                  "  STEP 2 (START BIT SET): CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n"
>>>                  "  STEP 3 (POST-WAIT)    : STS=%02x, CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n"
>>>                  "  STEP 4 (POST-CLEANUP) : CNT=%02x, CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
>>>                  result,
>>>                  pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1,
>>>                  start_cnt, start_cmd, start_add, start_dat0, start_dat1,
>>>                  postwait_sts, postwait_cnt, postwait_cmd, postwait_add, postwait_dat0, postwait_dat1,
>>>                  post_cnt, post_cmd, post_add, post_dat0, post_dat1);
>>>      }
>>>
>>>      if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
>>>          dev_err(&piix4_adapter->dev, "Failed reset at end of "
>>>          "transaction (%02x)\n", temp);
>>>      }
>>>      dev_dbg(&piix4_adapter->dev, "Transaction (post): CNT=%02x, CMD=%02x, "
>>>      "ADD=%02x, DAT0=%02x, DAT1=%02x\n", inb_p(SMBHSTCNT),
>>>              inb_p(SMBHSTCMD), inb_p(SMBHSTADD), inb_p(SMBHSTDAT0),
>>>              inb_p(SMBHSTDAT1));
>>>
>>>      return result;
>>> }
>>>
>>>
>>> Thanks,
>>> Matthew
>>>
>>> On 9/1/26 12:04 PM, Guenter Roeck wrote:
>>>> Hi Matthew,
>>>>
>>>> On 9/1/26 09:31, Matthew Bettencourt wrote:
>>>>> Hello Guenter,
>>>>>
>>>>> I added additional logging into the piix4_transaction(). I will put the function call on the bottom. But as you guessed we are seeing not just MR11 corruption but also can trigger on other addresses as well. I was running the suspend/resume cycle and caught on both MR11 issue and else where. Here is the dmesg log output.
>>>>>
>>>>> --- Other PIIX4 transation ---
>>>> ...
>>>>> [29287.881787] [ T204580] i2c i2c-12: [PIIX4 REGISTER MUTATION DETECTED] Pre: (CMD=0x1a, ADD=0xa3) -> Post: (CMD=0x01, ADD=0x45) | DAT0=0xff
>>>> ...
>>>>> [29312.945873] [ T204570] i2c i2c-12: [PIIX4 REGISTER MUTATION DETECTED] Pre: (CMD=0x0b, ADD=0xa7) -> Post: (CMD=0x01, ADD=0x45) | DAT0=0xff
>>>>
>>>> It may be a coincidence, but the two failed accesses are exactly 25 seconds apart.
>>>>
>>>> Would it be possible to drop the messages except for the failures and run long-term
>>>> accesses (for example by reading the temperatures and/or the nvmem continuously) ?
>>>> You should find the nvmem at /sys/bus/nvmem/devices/0-005[13]/nvmem.
>>>>
>>>> It might be useful to know if this only happens during suspend/resume cycles
>>>> or if it happens all the time, if it happens randomly or in specific intervals,
>>>> and if the failure pattern is always the same.
>>>>
>>>> Thanks,
>>>> Guenter
>>>>
>>>
>>
> 

