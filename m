Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E04480DD2
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040209; cv=none; b=Vv3Vwp5cUm7EQ1mZc8TAQBtAVxO/omSmP2vTF8VwVMhkewr4Jr8CdFxAY0Hzlse4AL68STGZoOE+Vh5pPn/reF5UfrYYzPlm5aShFFV6iO0/gTXSxIm/OoCdDUBjZouWi+dtjxKmkK141X3+r8a8rQj+f8l4Dv7MLA/1mIMO+nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040209; c=relaxed/simple;
	bh=RxMbX2oIcOHEOx3nrqO/Q/x4kiEhHqEOHWMjKG7C6gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rc4CpaPrNKoF7dQ05n3N16iQy7gMbzg4Y0qEfEKC784CQqYDAgkfeEs+VSRidG4RtGyJmzEZAUQN3TgMOxw/h1KrsEdSaxnoO2NlYicNE+9B477/nNKFQtD62ZVPfuXfnokWvCLR0/pe4a1ybXY1VLD3X+kgpnxI0xG5pN5i4rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBQuocF7; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBQuocF7"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3059878a91.0
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 07:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784040195; x=1784644995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SW/KsMgZYOFzQnmI+iQwbH4NV7NBkMtaLDUlJWVVryM=;
        b=fBQuocF7nbxN0uumOZcqNhKT4bNKR95sISDjw7BZ3Y1uJoxfTrbAbibuKwgZj2wWIs
         uAhV5Tl8i53fepXQ1oDtwEkWeJOiQDBj7HRXHLBqNdpPl73fMYQifrNsN5R7iVA2quC6
         QX7on1ygF5VOsI775XACfj92cYix7Nbk/dytl2XmTHGyLJg5excJnAQu9KJcL0c3P3CS
         Zf99dZhF5IDlfoaKfgFLaXinFPCYeR553wfXyYMW/orJLMs3Q6Oab5poB9M4WS4I4b7M
         zDaWxHaqsY0NbTZBqskInlf6ZpgGkQdTI20jYuRXFrzlF+btON//Z6CpvljprkSPZQEi
         iJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040195; x=1784644995;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SW/KsMgZYOFzQnmI+iQwbH4NV7NBkMtaLDUlJWVVryM=;
        b=SwB8tdQaS05SAorhWr2TZ/4O7HurOftFFf2ESqAlczuMLV5cat98vHgFUhDJwYkvR7
         OtYzXP2BerbJVTtNO+mN6jfGjdcnYSsfnF9PXOqY1RUX4O586J6XQOpu9cEHOSQy8qLS
         68KykWNVbvzE0Z3nCWyaiR8quqpBgExyNnHZN/rpWacWtCN29ZLyIPzsn1QPVhNHJgyU
         //hjzYLTs2uG57k/jHE2LC0nDrgtUDb0ad2OLn2KDpQj26Pfe1WuHegPg0QyXX+Hmeav
         svnTE2HUNSji0WQAABkkGHbI700wgNyW9MCwP7d7h1CgQIe6d43cVqgLw1jnPKLZB1OI
         h6Hg==
X-Forwarded-Encrypted: i=1; AHgh+RqU4AHsQAvoaEoYblLRRk7IbeagEUG1X0Zfdv1psiGrlVoWbBWkK1oeOxxrRm8rPzjRtr4WF3/959FCGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQHUxoyNFpwmSakOV4v+n5Er1EQsLgHK7wbN40+1ZRHL+iny2l
	9zMo+p9PkEZKqfXmbt6OixG4P63i7h2kNAt/IlcGJ+IQcDmuyEPtZKq8
X-Gm-Gg: AfdE7ckB4VnzRMFeKi+JNO72qEKAB3Mx7auYnmO/Ba8Ld8qG6EtlsaEetgwh5yyRVxm
	AqPk7Ro0hqJbhhJLf4dClUR5tjcv7r+9FwNFMkAnC/N6jnoBNb/BE3uxzZgTdrElzb8lIq0URcX
	2yMLv9BW5RomkgNbJgyIim+4Ii6qqBml7NqLbhyZKWstl7W+Goag/I9nHsp3dKrBu3bw/rjo4Wr
	3T2eF20z6vPOX46JwYLgu7X8tSZFniFPJl/zZXByCc5Zhbc61qvroeqm95pctQdrVTjbUkWUbWF
	jac9VEJ2zotKMqdHLFIlRjPPw03dI1BSF4BsdaOAqFwyPmNZDEBEPh5ib6LfW3t0Txr5lwTLvxE
	Z35Rui13mfsuu9gVWKmBUzD9IH4HKte6zn7zM/MsYCDTwbVMF53sK/OE+tGuq4IH2YasN73zDWK
	35mgELCeBULEY2svNsRM1TKkVdKCIOtJQhQk+E9lVFC06u1Kje45TAmU+esCK94A==
X-Received: by 2002:a17:90b:2246:b0:37f:ad36:8fc5 with SMTP id 98e67ed59e1d1-38e1afbf3b1mr3030162a91.23.1784040195371;
        Tue, 14 Jul 2026 07:43:15 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm78665441eec.3.2026.07.14.07.43.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 07:43:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9b8a49f4-2632-4984-a617-66f4161a3c5f@roeck-us.net>
Date: Tue, 14 Jul 2026 07:43:13 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (lm90) Switch channel parsing to fwnode APIs
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260713190659.4511-1-flaviu.nistor@gmail.com>
 <alYpqifR8RHXZWZ5@monoceros>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <alYpqifR8RHXZWZ5@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/14/26 05:22, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Jul 13, 2026 at 10:06:59PM +0300, Flaviu Nistor wrote:
>> Replace OF property handling with fwnode API in the probe function to read
>> the channels properties, improving the driver compatibility since this
>> method is not limited to Device Tree only.
>> Add also the needed headers for explicit include and clean up related
>> function naming.
>>
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>>   drivers/hwmon/lm90.c | 48 +++++++++++++++++++++-----------------------
>>   1 file changed, 23 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>> index 4b9c0ccdf260..045977e30cf4 100644
>> --- a/drivers/hwmon/lm90.c
>> +++ b/drivers/hwmon/lm90.c
>> @@ -101,14 +101,16 @@
>>   #include <linux/bits.h>
>>   #include <linux/device.h>
>>   #include <linux/err.h>
>> +#include <linux/fwnode.h>
>>   #include <linux/i2c.h>
>>   #include <linux/init.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/jiffies.h>
>>   #include <linux/hwmon.h>
>>   #include <linux/kstrtox.h>
>> +#include <linux/mod_devicetable.h>
> 
> <linux/mod_devicetable.h> is going away soon. Please rely on
> <linux/i2c.h> to provide of_device_id.
> 

My hwmon-next branch is based off v7.2-rc1 and of_device_id
is declared in mod_devicetable.h.

Guenter

