Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501292DC322
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Jan 2026 01:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769822478; cv=none; b=ENJDkU3dUNjpYWfAjpM0BN8dTHcr74abJmRWkbfCKsZ9fUgxwd622qCCBBnxfwFTuMSjS5JSfTlk3kXrodj5iIouVT+o3vFjHF7ax56DeEjGUKLiryHPrO0bPqBe7Wqo68csa0jWKMWvlNGEvHbRfkPhOMQ/QCrDJhwNfZyG058=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769822478; c=relaxed/simple;
	bh=llZdVPHsczQwoVJAA0UCflSxNPE2cZwUfdV2DeSJt8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWxAQ3owCNd9GllSIo7QEfchrIoEgCS+GfdRTxopZTgHu98VgzJkZ/CuY/eJyeseSUh60C5jfndastmfxSzVeZbiN+3oxLp90pdhoZ38WloEFCzWGEeZSPlmzjwOlb3Zvx4hN6ZPJ7iMXxXJKDMBUg1Ci42JYXyYMsQ8bWd8x0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNV5lShL; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNV5lShL"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b704f08e73so1528283eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Jan 2026 17:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769822475; x=1770427275; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X5gYpxukYwdjYv584Eh/4r6iJYMGZvI9ErGJu+Qcq7k=;
        b=DNV5lShL0kv6S+zg+OIEllfLqh+ATZQaLrZi6TDIOTUZJbbqRYEn2/P3gM90mXngwN
         1T5+MoyktTCnSL2t/tKoPub1N3V3oqAB3sFdMtvVK3FCgv1IZNfLG6mhwsJIgV/3Nvyh
         nE+LyDoUMBUY9NU3BLfUgv1A6i45by/T/eBRQUeXSwAatxw/3zdKAhUIU4sR/3kqocev
         neWEPtew5d+tq1x5BEOwo921AsHgPhKlcy8huRt8XCEnxCTttsmjGdjO5t4J6J6Cnoio
         jva2VD0DHf7mcbF03qzZ18VvKde+3ZDsarQkPryQxQZ7+wpXWno67ieBYdgznUfhQ7qO
         y73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769822475; x=1770427275;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5gYpxukYwdjYv584Eh/4r6iJYMGZvI9ErGJu+Qcq7k=;
        b=rlvny+DZ5UKBOgYo4+OSmqjHrkHn/E3Y3XsZEo6x01tbxIhwUK6z81zTQiCOhKAiL3
         KuVmA5xSEUD1z8EVYUnXKhQCCyP/g1QuWsK4aeYuMYUI34HbtciIHDGyal+vJqpPt1aE
         g++YifARgeTJouazxpg2hZ4+V4UTJ0SPGSc0a4gNxopZ0L8EsNs/+nsZlC7Z4NWBCtq0
         BIqIifuAtt6U0VjLSGpeD2qhLp/nKYLyqAb5jrJ5MxIVlqzOMJXpe/8K8/7hxIOpt/xK
         7zJg2+k+rBHUPDnUIK09rfIZlAAYhJDl6ZVLruSQl5cnWRro/QimUGOVAwFO0x7wlYBO
         mbLw==
X-Forwarded-Encrypted: i=1; AJvYcCU8bhTaW9S9LtHImLCGF4bPdjop2loeLeAM9KNPT5fLIVaCknTpfb8Q470iLAkQxFXm/Ug7VqsoeSxAUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6TPLls/MM1hHI2Jx+WaAcmx0zYn8/+DnkObaHF2BNDXRGWsmT
	WR5dpo22tzRNEF6VMvJy5DTmdpy/Y+lQTWJKStycw5s25PAjRw98Ag+I
X-Gm-Gg: AZuq6aKR9InNuww/3eB7l5Jp1xVs8xz28i0oq8DlRmHHbeYpvlSUdkN5+knBK7rf9KN
	Zd6pfajn7vl7Bh2igxjen3Q3S13zTZwC0wxQJEB8Ni2098mCXazecPkRKuHXp6AOMlSlnycdYMe
	bNmo7iPaAr9EwHxhN3VikdQjgjE2gXdKMLJ/sfbglLPgZ0AWUChX0B31AUi9tIhxw6tx/QFgjhT
	2bsf9HWCRILbjY5f/3BhUOhS5aQSujdOG7jhMrCGkIGv6ZV7GgLyqzijDp1dPfeEg9/D3aOOFil
	8NYssgV875zyZIeZpDiSv6oaQiyIpJDPyW8kg39DYfObpN4wkcgbh531hbmo8+EZSEohJ98lM99
	x+Hi0Vh/tQvPsh1s9tuNLUrQvR+e41SLDPP/AMDDo1ugY5AhZ+cKj5DPvu27vzKsFbjLMYt4hR9
	l2ImS1nDxVzy3sRm0DmhjSAJcgMBA3wyQmlZzVHwFwqWc3Lmnjp+J6mdXkTSlf
X-Received: by 2002:a05:7301:9f0b:b0:2a4:3593:ccbb with SMTP id 5a478bee46e88-2b7c9124abbmr2171030eec.2.1769822475331;
        Fri, 30 Jan 2026 17:21:15 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abe938sm14331226eec.16.2026.01.30.17.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 17:21:14 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f9a4e815-bb21-468b-9568-b4acfd792527@roeck-us.net>
Date: Fri, 30 Jan 2026 17:21:13 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: spd5118: Do not fail resume on temporary I2C
 errors
To: Kurt Borja <kuurtb@gmail.com>,
 TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
References: <CAJ12PfP+Dbxd5fFAx-zAaJQ0B53Z1nXAiPbkmivk6smKajf1=Q@mail.gmail.com>
 <e994308a-389a-4d67-9ec9-39a5f0d3f4b6@roeck-us.net>
 <CAJ12PfMC_Potx9aNxaJJ3y=sX=rzyhm-6LJ8Z8OjUyDxiDUNsA@mail.gmail.com>
 <39b48803-e236-4acc-84e9-18162770f9ae@roeck-us.net>
 <CAJ12PfMN5SOcYc6vBJEz57YVcxXAOker4WA61Xh1znP=i8aBRg@mail.gmail.com>
 <5ecc96da-0c87-45f6-ab57-c3ea8eb28de1@gmx.de>
 <b4ce70ec-7a7a-4ee4-a9bf-55d0a64f8644@roeck-us.net>
 <CAJ12PfP_P0cz7NrAMBehVtutQn4-OibK33KTNtjec5Qd2msdnA@mail.gmail.com>
 <6249756d-7e49-464e-bb7e-11dfba3085f3@roeck-us.net>
 <CAJ12PfODdy+rgBumHv5gUeaqikUGMkADg-UoBLuZPrtBanF40w@mail.gmail.com>
 <f6c1e5d5-61ad-44ba-aa7c-231334d3e821@roeck-us.net>
 <DG2D60UNIM2J.3BXEHP4RJU0BL@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DG2D60UNIM2J.3BXEHP4RJU0BL@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Kurt,

On 1/30/26 16:55, Kurt Borja wrote:
> On Tue Jan 27, 2026 at 6:41 PM -05, Guenter Roeck wrote:
>> Hi,
>>
>> On Tue, Jan 27, 2026 at 10:23:24PM +0300, TINSAE TADESSE wrote:
>>>
>>> Disabling CONFIG_SENSORS_SPD5118_DETECT completely avoids the issue on
>>> affected platforms,
>>> even without any code changes. This confirms that the failures are
>>> triggered specifically by automatic
>>> SPD5118 instantiation on systems where the i801 controller enforces
>>> SPD Write Disable.
>>
>> Thanks for confirming. Can you try if the patch below fixes the problem ?
>> It is a wild shot, but it might be worth a try.
>>
>> Thanks,
>> Guenter
>>
>> ---
>>  From b44c31c2c779a67827e3144b818cf21f5efacea1 Mon Sep 17 00:00:00 2001
>> From: Guenter Roeck <linux@roeck-us.net>
>> Date: Tue, 27 Jan 2026 15:32:32 -0800
>> Subject: [PATCH] hwmon: (spd5118) Explicitly enable temperature sensor in
>>   probe function
>>
>> Instantiating the driver does not make sense if the temperature sensor
>> is disabled, so enable it unconditionally in the probe function.
>>
>> If that fails, write operations to the chip are likely disabled
>> by the I2C controller. Bail out with an eror message if that happens.
>>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>>   drivers/hwmon/spd5118.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>> index 5da44571b6a0..3e0e780014f9 100644
>> --- a/drivers/hwmon/spd5118.c
>> +++ b/drivers/hwmon/spd5118.c
>> @@ -552,6 +552,11 @@ static int spd5118_common_probe(struct device *dev, struct regmap *regmap,
>>   	if (!spd5118_vendor_valid(bank, vendor))
>>   		return -ENODEV;
>>   
>> +	if (regmap_update_bits(regmap, SPD5118_REG_TEMP_CONFIG,
>> +			       SPD5118_TS_DISABLE, 0) < 0)
>> +		return dev_err_probe(dev, -ENODEV,
>> +				     "Failed to enable temperature sensor\n");
>> +
>>   	data->regmap = regmap;
>>   	mutex_init(&data->nvmem_lock);
>>   	dev_set_drvdata(dev, data);
> 
> Hi Guenter,
> 
> I'm experiencing the same issue reported in this thread. This patch does
> not fix it for me :(.
> 
Thanks for a note. Well, it was a wild shot, so it is not entirely surprising
that it didn't work. I suspect regmap doesn't actually write the register
if the value is unchanged. Another option might be to try writing a value
(e.g., 0x01) into register 0x13 or 0x14. Those are "clear status" registers.
If that fails, we would know that the chip is write protected.

Thanks,
Guenter

