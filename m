Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D6C34A797
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 14:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556947; cv=none; b=YhSHpfrxNAGWqRkJfhvPiqGZVESoRcggGrBuhKkJfp6i2gkgtGJecjEv44mhvNVQ/SuXcFyXZyF/YoS4NSVJ77misMmgby1GpnljTz8GYakY5HgCksSBof36fVyFo6q6P82d+NCk2cBFpETeNH1we2Aa3yUt8+tURH19aNYCy8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556947; c=relaxed/simple;
	bh=QBtnpUmzwEs76uzXRXMUkZDBljHUXWDX4HPSI14i/Kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mScYtNgArr1+jKbZ4UjWiHz7MksHIN+ZJEk5mTCmBkeU5g4ddPK3oB3fatDhLN6/w06gc7iij7gaGLNOenZ7kFMXMGYELYGH8KyQMy8HVLUV83lyFOXaZVBbGfQnrbbATYCQLX9KZXW9cq7GPRFC97QfGjrEMTjtJ/6hN8sUX0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbUEsSOh; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbUEsSOh"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso6411998a91.3
        for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 07:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784556945; x=1785161745; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2smu081M92JydpW/GkNCCgzBHHBM37fo4EUySmlOCzU=;
        b=qbUEsSOhTY8HyrMAaadCJ+olce9qbSu5xM+YQrrLdnyxiin7DprpwPJLTRNVV4ePqT
         Ta9N91jX+jCkki4CFvc/nsn6V82XDF/dLdcTVsg0vCzh9zv5XUhVS09IJeAihj3LHGiq
         xZEH6t3Ggs0YXrq/RUzoZcrJrUyCmiHDJujM8hFaJ3zCuEZLX2sQxX2EsLCon3f27PW7
         xM95/bmFUTj0rBGtenSxJFXhEjWdWCLoQggMdM1m5iGZX937J77k9g6HlfPsIpCzaHs2
         jrMPpWgJboMI6GldbLXoNnxyA5lWYxJr3nIQGUmMgDp0Ubq4b5dMTihc8ONRkQiywbaA
         dN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556945; x=1785161745;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2smu081M92JydpW/GkNCCgzBHHBM37fo4EUySmlOCzU=;
        b=CGi+jbmFIbLCYmZcB6+CjC146U4Dkzrmzs+4yfHdd/HbRuB62GtCBCN5T5Yj2nlg+F
         LEJHD3Do3liYhKLn+Bw73j02/n26xvmWiNlcK/vCrt3dBSPTE8nVPa0+a206QLHGMtBI
         cNthCWVuU2bi/a4ZOfUm6hjC2kwauOtSDpFxFhuTOFIm3sVPSVPEr7Y/dqdk7amrMmNA
         u6K6LtPbzayMpaAjX8/5KbFQJrRxJsd4oQpy8IM5v0E+lp+j7PpabrTFyjJAfU5yjUKS
         dXddSoIQ9tIDSBRJ+oUzRBjzAmyMwqfUkOzTiBv1wmPn5iLP6QSMcdTskCpAyTyfXyba
         bUgA==
X-Forwarded-Encrypted: i=1; AHgh+Ro10FxVtsg5kngK3fYRUbvbwUdWKXnWAfqho9Je6rLV1cOotmW3EGkM+QjS9Ot2xwIL3jiHFSZ+Cl5L/A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2qGfd46bStv0GE762BuSUAQCbj060wBu/79YJnKoqtqVufXnd
	kUO3YuY2ZJHIDNOvrW3l6MZLVlOk9WckWACXzrLyfZmlWEcrq8Ismfoq
X-Gm-Gg: AR+sD10aEk8/Nkj6RsP1LjFDkZy+uWnZ+NkogqxcnXmo9Eq5qLqKlLLFtDYCv7A/X0L
	adoRT8I2R48qZCzD2u/CPdIefZZfb2vQYbZBqXgRVGRsprsPkqRQKyqs7EXt2ZSMCYE+F4cG/Z9
	XNnap/7G2/7IaTMajD0sYgO6ttbV+GnXim/7XjXb0JiZg3/ZHWxBIxn2cedXN3LfQBdBQdW1NPl
	saIiMTrJoayXVuJyWK5xHUgGwvHWE1paXMY615cyOpiNjJsnoI2AVAyMjDjYY1fYm2uXCyQbSXL
	OQPDYUSeH2KRR98INEEf5LjcScV5wyjp5swngOzVSzeQ85n3HAw6WpFwMYInni5KBTFinzA6QAX
	xK2DM2QnVfc5vgZq1bHX+yCB/aZk9LMcxhN7mgWGJEB5Ven8BAf4KMJJ84v/OyGGscgGl0jrulL
	n2fkxCtuwCAYoXgNE/iI5eXLXWLwwQE/KgFGy3RmO+KVRoz97VfOgokVU67h8HqA==
X-Received: by 2002:a17:90b:5608:b0:38e:488f:7068 with SMTP id 98e67ed59e1d1-38e4b43108bmr15838831a91.2.1784556944689;
        Mon, 20 Jul 2026 07:15:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd764fsm32324799c88.12.2026.07.20.07.15.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 07:15:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fe0ee4ea-0b47-4ea0-9586-b06555a74e78@roeck-us.net>
Date: Mon, 20 Jul 2026 07:15:42 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (lm90) Switch channel parsing to fwnode APIs
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <edb03ab2-1211-4bdd-b4f1-21f80065ef6a@roeck-us.net>
 <20260720135550.10654-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260720135550.10654-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 06:55, Flaviu Nistor wrote:
> On Fri, Jul 19, 2026 at 17:06:00, Guenter Roeck wrote:
>> On Fri, Jul 17, 2026 at 09:37:30AM +0300, Flaviu Nistor wrote:
>>> Replace OF property handling with fwnode in the probe function to read
>>> the channels properties, improving the driver compatibility since this
>>> method is not limited to Device Tree only.
>>> Add also the needed headers for explicit include and clean up related
>>> function naming.
>>>
>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>> ---
>>> Changes in v2:
>>> - Remove <linux/mod_devicetable.h> as suggested by Uwe Kleine-Konig.
>>> - Link to v1: https://lore.kernel.org/all/20260713190659.4511-1-flaviu.nistor@gmail.com/
>>>
>>>   drivers/hwmon/lm90.c | 47 +++++++++++++++++++++-----------------------
>>>   1 file changed, 22 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
>>>   
>> ...
>>
>>> -	err = of_property_read_s32(child, "temperature-offset-millicelsius", &val);
>>> +	err = fwnode_property_read_u32(child, "temperature-offset-millicelsius", &val);
>>
>> I understand you consider it to be irrelevant, but temperature offsets can
>> be negative. Please explain how this is handled.
>>
> 
> It is no about the fact that I consider it irrelevant, but rather I was mislead
> that of_property_read_s32 maps to of_property_read_u32(), and the new fwnode API
> does not have a dedicated function for signed values.
> I see as a solution to add a similar approach to include/linux/property.h. Add a new
> fwnode_property_read_s32 that maps to fwnode_property_read_u32, and then use it in the driver.
> I will try to send a new patch series to have a working solution.
> 

Type casting in the driver and adding a comment explaining the reason would be
perfectly fine. What is not ok is to silently ignore it. Also, it will need
to be tested if it is working as intended. For of_property_read_s32() we can
assume that it works since there is an API function. That is not the case
for the fwnode API, which either means that the fwnode API does not support
negative properties or that no one needed and/or tested it.

Guenter

