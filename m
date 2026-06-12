Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12B63911CE
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Jun 2026 17:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781284759; cv=none; b=UdS0lRPsma30OIutRPWIx+wkJ10hS+b2spXhnPhcEqBdd5SRUTouTBX0IaoVMJZQJNWL/7w9uqwUE7mOyljzd+xDDvrgzUcgX3amCRLs9HvdNlW4lzfgAVwhhO/U5xbWNYlwmWRmPSL40cC2UlDQvlalR3+kcJu8jM40BkUaI6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781284759; c=relaxed/simple;
	bh=UJm8Y1Ze3t3ZWR2WvzjsYjLkQhqNgHrl15d0xrOMLyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYyR1+zJzA9yn6LZ5D/7k93lffJqmKDloEODkTGCnxQm3R4euW/UeBNr5jMjoyxm3cqGMbT9y2UXCcEnFSmRgv8L5HVFWMRI3wsfkeG40B/Di4eTgqUejgOU6N3anqYcrST/XgTL+kYu/HsAwET/yvTmqrgYvhwKsgmIFjnNPxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZF47yJH5; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZF47yJH5"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304ec41197bso1568043eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jun 2026 10:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781284757; x=1781889557; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=X7RDWcS37p/W3LlNv6yhW6WhP4eJA/sDKvMdX+uD5t4=;
        b=ZF47yJH53Gj7ny2b4p8bZmfDwUaYZmygTu52CKM2nEPk5nklQA0ut5/ACSMStxstfR
         om2kJ3pHRFLcdA6qoHxPBPAjLxHGvcX5ZXFZeW3kH98U+V5kI8+9k5+SsmNlhee/MXrz
         NxOUJ589sTtCJWjFHYk/fYji3TiCaHZllm51vPDr/2rOPz0DdnmK3R2zA+X9tgwIUi9e
         mfVBGTl45XwST/8FIrhlWiZESW7m+Pfe7H9B3ORXP2Jn+Ot0uRLCZ0S2CoO+aRPBj1ca
         KR0pxbRHtY75JBv62A8E9SkOrTxJu8eskJffmtqOKlYdQZbjaiW87Pkpz+fy2aSv4Rwl
         /tIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781284757; x=1781889557;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7RDWcS37p/W3LlNv6yhW6WhP4eJA/sDKvMdX+uD5t4=;
        b=sUV/yMYfuGBpTGJzfbT322zQ3ikH1wRR+Uqy7LfDNhA1AT0Ahkg1wh/q53vwOa+Izy
         W4ddMfbpYYlAM0yixlh0W9bI6XqBD4T8FNTgVosdkETQ5oqyFTGFaUUnNNPpiB3HobCR
         mnHf7PsOzSZ45V4y4xCT5iHqbOrSl/xZv14vXfTdy/9BPl44l4W99Vj6N2sa/T1XiBNp
         TOJ9+UTKjllzHQWVsXXbacahVrWN6xHLO8B5Y/gtBf2QamxiVltVudDP0Y5NRBYv2AMT
         9KyHIW9/b1MU7i4I9tk4Si3NWVzofYIZWMCyGQYO62U8pmmgum7NWf3iK/3O8fLDqH3W
         ljOg==
X-Forwarded-Encrypted: i=1; AFNElJ/E+4QQFyneuZPX0CY9j2njP2OV5pGwzHrRGh62rBnEvSuBl5a124+HEsPNJuA21J3khDiZu57s84JnHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzY3kXyM5zMHxTxkmEIfl5O+lAv4HkkWkwLC27u+mcUf+I3Pd8C
	y867NwpaGyuYYHoj2MjNZYjFlpXUszLICnYkeXglLvvyfZedLHAw5WIl
X-Gm-Gg: Acq92OH6x/PLwitJ1d0GiB3b6GDcv7bIqQ8siYeUivK2w9S1jZZZ/d2Y7ft9EbCLm0Q
	pKwjHJGJM50g8TLz3NMaGWfEwK1TLsI4ibrhxZwelZPNzw4SsNRhEieYcdYZ3Bm+L7XlMlS+7cW
	a2D7g6GG8/X353YoMvpldK2seFVlgiLNB8O7sUVH7X8VApqqopLu+XXOdSI9K1mEpQe3xjgmYTm
	ooI9SNUW3tl8P6h2uGZ355NU5OjymCz0pPKrZptOGnJ5ZLbqQh0Mmhgrje1QlUZI05hAgEhTcwg
	E461VpuQbqlHsAf2fWn9ppVGdw8hZK6afBtMqtV9DLNA9Eb6U0GTKB7VqGCkq3ePbYjYgMGiR6e
	/sKw3oqskF9AM7sL9s7ktvOJLBhq9v9J7+LbIufPG6ABsZi5h6q9i/ppJGkvTE9fPIyoZL/GIhP
	NEnUKzuJ9kZIpwGTNJNcKkDxWYR1/A7uAfBuHsWXhCG3umOXgr3g/X6VJTK7r5mawVwN4D1u7HJ
	MlS8tQVJ+Y=
X-Received: by 2002:a05:7300:aca5:b0:307:91f9:c1d9 with SMTP id 5a478bee46e88-30820098ec9mr2338669eec.29.1781284756851;
        Fri, 12 Jun 2026 10:19:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm4552771eec.10.2026.06.12.10.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 10:19:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <059f9ce2-39f0-4553-909d-58585d46edd3@roeck-us.net>
Date: Fri, 12 Jun 2026 10:19:14 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
To: Conor Dooley <conor@kernel.org>, Potin Lai <potin.lai.pt@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Zev Weiss <zev@bewilderbeest.net>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>,
 Mike Hsieh <Mike_Hsieh@quantatw.com>, Potin Lai <potin.lai@qunatatw.com>
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
 <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com>
 <20260611-mocha-strive-a7f3265dd3f4@spud>
 <CAGfYmwWPhdpTLGhOdddJ0hSj-H86+XOVGTR9eDkZSVqGRLfJvQ@mail.gmail.com>
 <20260612-lecturer-unclad-d80218119ae5@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260612-lecturer-unclad-d80218119ae5@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/12/26 09:12, Conor Dooley wrote:
> On Fri, Jun 12, 2026 at 05:10:38PM +0800, Potin Lai wrote:
>> On Fri, Jun 12, 2026 at 1:27 AM Conor Dooley <conor@kernel.org> wrote:
>>>
>>> On Thu, Jun 11, 2026 at 05:58:44PM +0800, Potin Lai wrote:
>>>> Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-low' boolean
>>>> properties to configure the device's Current Limit (CL) behavior using
>>>> SMBus settings instead of physical pins.
>>>>
>>>> Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>>>> ---
>>>>   .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 ++++++++++++++++++++
>>>>   1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>>>> index a20f140dc79a..95ea7c26dec2 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>>>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>>>> @@ -46,6 +46,26 @@ properties:
>>>>
>>>>       additionalProperties: false
>>>>
>>>> +  ti,cl-smbus-high:
>>>> +    description: |
>>>> +      Configure the Current Limit (CL) to use the SMBus high setting.
>>>> +    type: boolean
>>>> +
>>>> +  ti,cl-smbus-low:
>>>> +    description: |
>>>> +      Configure the Current Limit (CL) to use the SMBus low setting.
>>>> +    type: boolean
>>>
>>> What's smbus specific about this? If the pin was connected to a GPIO,
>>> you'd then need to have different properties or use these ones with an
>>> inaccurate name.
>>>
>>
>> The "smbus" in the property name was originally meant to indicate
>> that the setting is configured via the internal register over the SMBus (I2C)
>> interface, rather than physical pins.
> 
> Right, but if you do it via the physical pins using a gpio, you still
> need a way to say what limit is. The status quo only works if the limit
> pin is tied high or low.
> 

The physical pin is supposed to be connected to ground or left floating.
It seems unlikely that anyone would ever have the idea of connecting it
to a GPIO pin, and doing so would for sure mess up the driver because
its state is only read in the probe function. The configuration here
is for setting the limit range (scale) with a configuration register
to override the configuration obtained from the external pin.

Either case, even _if_ the CL pin is connected to a GPIO pin, the status
of that pin would be read from the configuration register. A devicetree
property is not needed for that. The properties are to _override_ the pin
configuration, not to reflect it.

Thanks,
Guenter

