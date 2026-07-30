Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5634A395ADB
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427641; cv=none; b=sHSuyYVh3vlEpVcAcHf4mpUZAD53no7yNWigLjOYTZRYoLB31BIsFNYr/7e8QAkZL/1c5FkJbKy+S2seWH5tYtX9CIEBccThM0ei3DFv8lNEZm2FTDmPgsA61ex2VIEzuzOfmZ+RCFSRcZvLFyk/jDWfBNXiq+LUKOBU8ZrZsNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427641; c=relaxed/simple;
	bh=2kTQUIkse279EpSD0a8zG6snrKEqIBMVL1xU9N6thIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vb4fzJ8sm0bVAQZJ3T0twpwjbwokCC5j0Mv5Hcw9XYx6BFZoTAcTD2GrJm9K1RYVKZhRPmm/qwp61rjS/IqTxoeavI6ydkbJnITylVNev1Sg+PFwYDUhzkpj810SYilPqLIxC+I2eCNQNA7KTZcSSRjBzFWW/jwmQtsps9hmjCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGTaq6rc; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGTaq6rc"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-848761b5897so27635b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 09:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427640; x=1786032440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uVpoohlHWAaAnbXRBzGkUNvmXJnbW2cGQzPkvuJFpo=;
        b=UGTaq6rcMQJBoaIxh+sDGVHHDfelAlQpRvf5lfj7M7fCedh/HpXHXs5EBCwt2y5EVl
         CSpS8I/StQsKgkgrk64RmDDoVAY7AbzFxf8Zmwl08B2TuBVVV6IWNCLOgVLWidCrVlL9
         l6hLXxNARB2EBvzEXlLMtxG76t0MOp8DO+6vSOwmNOdvcX8KG9068LAJE/KtVtdIDtfH
         1fl2SsmA8YK+EaOrqlBg8iKLGeoHgqh1YGZTjKG2Nu0iuN4buqIfl/cBt9wnrt4NARlt
         h9hmVur175Se6Bf8G2qP89DvOyo6Z83tMsSDzB+CO41XLnqlvx4Nt1EAjpsN6NeNYf2V
         dosw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427640; x=1786032440;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1uVpoohlHWAaAnbXRBzGkUNvmXJnbW2cGQzPkvuJFpo=;
        b=epCbMBnzCxoj5NLEBB3MWCv63xj5+0or/0YeuRCqm0uj7v46DLdGkyXmIKIWL4GhCM
         S5tFcHWnxpCj19O1K/SjpBZ8Xa8YpbfLFA+Xh/UqTmtvrwF/0vEobvfOEoXJtnphdv+H
         bVBDOrTGfI8EcaANYmncM4u3LU9vrg1CrooobyUc+h5iYY14kWrp3fANFPDUm1GR0uh6
         ox4paUKTj+KhQ1qC/CIz3gPjBO7Rrp4DQP1VYYHOYbqO4q0O6S7P9hzhkSTfS5Yxpwva
         LUKuagleTUuQItGCWtrgzhi0eb2aogDNC0SDXM1l59jrIueOy2vBhdrRkKZGcB4MdT1T
         hlIg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7d39g/cV2q3ygiA7dLENLa6jtP6+LBrLasSDbr6ucycOzeUBDSKIKfFQ8jw0x7cfZTAah3Y+aI3TxpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzTvHPg1R/BoyolkgKi3Q33g9UPs+Jof7XIg63j2G94hGhtX8R
	m3hziR5QS7c7VvYgx2aGwPE0y06Af0ZGyB0d12vof4mwb/sjDIT8+UIy4ZTUnw==
X-Gm-Gg: AR+sD10lbH7/evtFQcMmYmPStvVyc1KdpCHkvj9tKjLOO+8Dud3cfP8yWZmCuqcSB31
	3qwYj70o0mxev1wbZJ/Ahi4ed51IARNU3zhH9lHz59/wog+QDAyWeB9j02miqO7aYbEh/yrGmpt
	6yZFCZCR12nTKAYBnHiuJWOJ9AW8BbmPapmET9EXWSzJGvUo0UdtI0O6nYOgZT4dOTsoEXODnR8
	amQvSQh4E9zvxudJiS8NiFUJPMSQ3ph89d9WaofSKoGz3BwPuUKRXU9/ZjdK7Xjo60/3xwJzX2H
	qhJhh4G6+v9CpgWvc1rMJEkMCU4R0TYS8mzOF1hTEUSXvu0uzQx7sec5YjMLZW3sh6SgMxI/3Kz
	ADteDEtAcQgG4rm0YmGFQ1hVADDoxJ5D+XPacNH/f9nge05MvkY4QZ72XRuq7uMas8Nmm77hxI9
	W60bNY6griEfTUR9clG+/bTRRntQEMyaKj9FaflTpisvZvtDZAjglnD6uMm6ZAyNSss7C5Kjv35
	aXSXg/7E+kwwnqfWKP/VtkPURc25slZlucOJKqmVw5XsjSVPw==
X-Received: by 2002:a05:6a00:2283:b0:84a:2a88:fbd3 with SMTP id d2e1a72fcca58-84ebc215ac4mr3069179b3a.20.1785427639698;
        Thu, 30 Jul 2026 09:07:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e9fe20e35sm3342701b3a.1.2026.07.30.09.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 09:07:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <de535ebe-bc46-4a1e-82e0-f347ef3f16a8@roeck-us.net>
Date: Thu, 30 Jul 2026 09:07:17 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] dt-bindings: hwmon: pmbus: add MPS MPQ8646
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Charles Hsu <ythsu0511@gmail.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-2-98848151cdb4@free.fr>
 <44db442e-95c8-47f0-92b6-81279710ff33@roeck-us.net>
 <amr1ar1eLeZ69oGY@L30177.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <amr1ar1eLeZ69oGY@L30177.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/29/26 23:55, Vincent Jardin wrote:
> Hi Guenter,
> 
> Le 29/07/26 21:10, Guenter Roeck a écrit :
>> On 7/29/26 14:51, Vincent Jardin via B4 Relay wrote:
>>> From: Vincent Jardin <vjardin@free.fr>
>>>
>>> The MPS MPQ8646 PMBus step-down converter uses the same
>>> mps,vout-fb-divider-ratio-permille property with the same constraints
>>> (maximum 2047, default 706) as the mps,mpq8785, so add its compatible
>>> to the existing schema.
>>>
>>
>> The driver is a separate driver, making this a bit unusual.
>> I'll leave it up to the devicetree maintainers to decide if
>> this should be a new bindings file or not.
> 
> Because of Krzysztof's review of v5: he asked exactly for it
> since mps,mpq8785.yaml already carries the same property, the same
> constraints and the same defaults:
> 
>    see  https://lore.kernel.org/all/20260727-sceptical-finicky-waxbill-d7ecbf@quoll/
>    "...Everything is the same as mps,mpq8785.yam, so why it cannot be added
>    there? Just grow the list of if:then: to cover your specific
>    constraints."
> 
> v5 had it as a separate mps,mpq8646.yaml file. I'll follow whatever
> the DT maintainers prefer, but so should we consider that it complies
> with Krzysztof's argument ?
> 

Yes, and I guess that answers my question.

I'd like to see that documented somewhere for future reference, but either
I don't find it or the documentation is vague.

Again, the question is: if bindings for two devices use the same properties,
but the chips are different enough to warrant separate drivers, should the
bindings be combined into a single bindings file or should the bindings files
be separate ?

As an interesting twist, the actual binding (mps,vout-fb-divider-ratio-permille)
really applies to many PMBus chips, specifically those supporting the
PMBUS_VOUT_SCALE_LOOP command.

Thanks,
Guenter

