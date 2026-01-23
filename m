Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB40D28FFFB
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769180746; cv=none; b=Pw0eR0SS9mLtnADjB9wlAWjLFShGmVuVsUK2QYXCYb7ngCNpXRWxXIVPJvSx+00BOOB7H5XJ+Ufg1pV4J0CrMqhKnVQiJCwFCxZI0XQlWdl5ibewqOmWmUiJqYyEwQlqYWy6HflBib70QaWAwNYxiX/i6fpygvfWNG+2ibN0X6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769180746; c=relaxed/simple;
	bh=MJWOrsqu1ozIpS9Hn0QM4c2g6j7Zunz0RRgLifdsaXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f31N2wof17R2XQgh3v/sc0zUyXJ39dedoLcPHvA4kbTLzomk//bRL6YX8UWNcZ3AtdBAnMmKEz0DjlL+ZC5sw6+3ZQeockE3uWJIfkmvZ/HaWwTnYar3Ao/9+EJQiAzlmeozsucMJJHOz2MrNyzqClgfy3Fox7F5BXclfkKA9rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrztauW+; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrztauW+"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b7070acfdcso2425351eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 07:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769180744; x=1769785544; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ipp9qmjRkxMvUuONG/HSeKJSYeaTzHE3nlSbsD5unT8=;
        b=TrztauW+QJAdiAZP19chiwRX279rP/GklO6ktDMs2273npop3BTGu8YVFl3bqmQCC4
         6IEUU1lR2fSt75BfxK6MhRkVwoJ5UcjfRCYRJWv3nKde7+WG5tbM072i7BvyavZxucnR
         JCLQE8rN1S9BOb0OGtEnofdUlIbvL0Xj6+gWutV242d93VOs46yarvuM6RC8uFkMQyTe
         ctEN2a8LPNLXjAbJ0l4JATNlwbnHyKDL8cKVUVf85jR3THCkWCcrKIe8SXz8NUNgrEI+
         9S4xumoYmJXHWhewRhpztKYY/I2gS5WaRTjQNgfYwVn8ol8Ho7pj0NCf+kd1qc/FXPkR
         Aujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769180744; x=1769785544;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ipp9qmjRkxMvUuONG/HSeKJSYeaTzHE3nlSbsD5unT8=;
        b=uC22APMuObtB/dWBzj8FgNgKgyyp1YzA9JVVquQJ0YfurM4lGKrspjhVJWoisP+9Rd
         jU0JIacPXofPF7E5SUMWdFWl1JN/VVWkvGmA77oWriU9vkFbZ83ZI0w8G77yOW8ueAWe
         VqcoPm/bplXLOIK/KlfDAqfcN4UG7xkLJ3hWk19VUtylZiux19PvO5Kt09lbvV030nsW
         q69qgjGbhtNEo+o8Xhr69rKteUrwampon465ePGZq8f8dpII/mW99wNCmMwZ+VrkDPeU
         khp2zW0njBwHyBOQF6tfnUCZXu+cZwO+eneMyJVAwivdw8wxyelsTSZEzm7Ou4GiuSm9
         srXg==
X-Forwarded-Encrypted: i=1; AJvYcCX1+YSq4Yz0X6BLM7J27mXA3w8sD4Ep5VUwVoBA98AKkt+UZOSSTRKSFe/51xqm95F5YfpzykGVEKRV2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2JUQi/UYPfhAhPFlZ5FodmlNNLf11jhfcAruNaN5lWxAIHJUK
	a64PmAFKteVF1sFpHfW3+pShKaceCQa7gx/xAffPBaKk38NE5iSGn524lFGVCQ==
X-Gm-Gg: AZuq6aLSUp7F+2J5CVBBRHEsVGfdbNGtKkhxCqe5tmfSFU85bsbEmymv+g71/HUESni
	YjS6r+Ok9qvrtX46wsKC92cVafVJ6H27Kdk1hCdKFKw4nNGPjgU0uLm4qKjp98MY2OQBBGh6qNJ
	zyegITQsP4AmG0Bq0ZOpFqwMLEPwKrYnXFo7fvBJNLUg3F59ej5hYDhFwPz6fH9u6f/yfq7Pr1i
	YcB6Nv/9Tod6ASp17cZlkaj4WGIWs16vpD3INdNh5M3UX1WhzQut9z/IqYqUTdbiQKaDw7GQuSj
	YMRAOkLITxTg319SrLhixYOiS8BDmnHQqvuCKMH3A0KAN6fwQB0PSWnTisER/1MnCJDBZV84B5E
	W8Rm1KO03jRsXQen3DU4BU/oV31DtqX/C+Q118ItWxUJOZoR1YdpQ25RgSyfxpwtyF2BoUawqHt
	5Vgpy/63FVyaMp5YVDic078nMIPA5DJ1eseZ99E0y4Caej+H0MOl1Q8I5JGsby
X-Received: by 2002:a05:7300:a49a:b0:2b0:4c5f:c05c with SMTP id 5a478bee46e88-2b7399b0eeamr1435896eec.4.1769180743450;
        Fri, 23 Jan 2026 07:05:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6c31basm3228902eec.9.2026.01.23.07.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 07:05:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <176c91e9-aba6-4b4b-893f-99e5ef9e4b8b@roeck-us.net>
Date: Fri, 23 Jan 2026 07:05:40 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: tmp102: Add TMP110 and TMP113
 devices
To: Flaviu Nistor <flaviu.nistor@gmail.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250929170730.8285-1-flaviu.nistor@gmail.com>
 <20260123125747.4270-1-flaviu.nistor@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260123125747.4270-1-flaviu.nistor@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/26 04:57, Flaviu Nistor wrote:
> On Mon, Sep 29, 2025 at 08:07:43PM +0300, Flaviu Nistor wrote:
>> On Mon, Sep 24, 2025 at 19:12:26 +0100, Conor Dooley wrote:
>>> On Wed, Sep 24, 2025 at 08:55:39AM -0700, Guenter Roeck wrote:
>>>> On 9/15/25 10:18, Conor Dooley wrote:
>>>>> On Mon, Sep 15, 2025 at 08:08:18PM +0300, Flaviu Nistor wrote:
>>>>>> Add a compatible string for TMP110 and TMP113 devices.
>>>>>>
>>>>>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>>>>>> ---
>>>>>>    Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 2 ++
>>>>>>    1 file changed, 2 insertions(+)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
>>>>>> index 96b2e4969f78..840b5306a8cf 100644
>>>>>> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
>>>>>> @@ -13,6 +13,8 @@ properties:
>>>>>>      compatible:
>>>>>>        enum:
>>>>>>          - ti,tmp102
>>>>>> +      - ti,tmp110
>>>>>> +      - ti,tmp113
>>>>>
>>>>> The driver has no match data and no compatible based decisions added in
>>>>> your patch. Why is a fallback to tmp102 not suitable?
>>>>>
>>>>
>>>> That should work for tmp110. However, tmp113 does have additional registers, and it
>>>> might be desirable to report the content of those using debugfs. Fallback for that chip
>>>> would work for now, but that might have to change later if support for the additional
>>>> registers is added to the driver.
>>>
>>> In that case, only the driver would need to change not the binding.
>>> That's fine though, of course.
>>>
>>
>> I am a little confused and I would appreciate some advice if I should leave
>> the series as it is or send a v2 only for documentation and Kconfig updates,
>> droping the binding update?
>>
>>>>
>>>> Guenter
>>>>
>>>>>>      interrupts:
>>>>>>        maxItems: 1
>>>>>> -- 
>>>>>> 2.43.0
>>>>>>
>>>>
> 
> After some time (probably to much) I went through the patch again and
> based on Rob Herring response:
> https://lore.kernel.org/all/20250922162004.GA199858-robh@kernel.org/
> and a similar example for sensirion sh20, sh21 and sh25 sensors,
> where individual compatible string were added in the binding and the
> driver even if there is no match data:
> https://lore.kernel.org/all/20250908-sht2x-v4-3-bc15f68af7de@gmail.com/
> https://lore.kernel.org/all/20250908-sht2x-v4-4-bc15f68af7de@gmail.com/
> I think that the patch can stay as it is for the binding, so different
> compatible string can be use in the device tree in order for the real
> hardware to be describe.
> 

We'll need an Ack for the devicetree changes from a devicetree maintainer.

Guenter

