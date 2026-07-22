Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB943CE6B
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 17:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784740165; cv=none; b=MuQb5+Pe7omKTtR3fzmIxMUA/33lQ73bFmYfg5rEAv739+C4JtHEpyPO1jC6re8jS5jC/KSX2ey5wyFK45AbOMVJDfP8gqXy6RL8XmairmA7QHS+s7nCZj8eSJ3NZ1l5MHr/oTTUFptFr/K4chjH4pvW3L4CG8BZT5mHwh5zezo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784740165; c=relaxed/simple;
	bh=yztxGVGkEuYG5tXSY+zuB2GlLGlpwA4SpBbNDUBC4c8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n8bNBiB25w1+Fm6vtzu7fhil0nScM+5X8x+3SC32t22Ls2MoHfHg0jEH0LDQ1rjiO3b4i8eHEBfm89kXCxnP0Pkkf0Fftx1vJX93IA8mk5o5hKhsGVk40k8CfEa3BvrnAjoJQjiMrEDFt5fCzjlCTQJKcgpEodYsfyvuisboLX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p1RJl82V; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p1RJl82V"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso7668801a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 10:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784740160; x=1785344960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrTCSIzPcJ82u0tUjUSjSEmR3gxr33ajrULj/zhF5g4=;
        b=p1RJl82VEYinuQnC3qS3ZQSAszDnOwJIhxg4s+1uOB2XOHFtC2gFJIlrpY2dnWeDKJ
         T6wu7lHqlpsjveOPWuPLf4CAsIMh6psI4xp5vB4eMF4L1jRNF9HmGE7lh5lri5Q8V/nS
         bOPXuCAADiRgm9Qf0WBpq6UymQfQyrapiOYI7cMvAIiivyJFwXk76MXFh/9TV2BM49nM
         jewKNxZip3eXDzglo19ONgncIVTG5MVIBGcbHxd6+rCrhWmPS35K84829zU5RQ8v1oqT
         tEEnCLScscKPK9+kwTU4/jgBwbRbQ54kKjkTx+grJN+2mN1v3NtKAwQ80NG+7UYNny0m
         y2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784740160; x=1785344960;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hrTCSIzPcJ82u0tUjUSjSEmR3gxr33ajrULj/zhF5g4=;
        b=K9XuhxTr97ySlwdaSUG9oDI/rSye2x6OX9+PBQg8VU2Dcmt3cgy2wztYRLqfBVvmBC
         zRbRjEbJgR0jdopfS+aa9XVpgRmOpM8po6DwHaxp1zNMJhxh7hUD4W49hSRVyIvbAyrY
         6EzS1hYtVtBOlNYKfoGfFhJk5uP3MTSAdNLc1ZYEnw0ajr0QA8nJrTIZaykimVuIbo+d
         sIVjXavaHwUNmBAS/e5qhgjDd8o3CQtCGVanw+QCuRxyzYR2a2GzCOcOg8cpzSARTp1t
         EHwYHXMrKM1YUyW5jwiG1Z8Ttk6DguZEs/ZVroZ1Q5q1zD1H+OY64K7ZvCvFJ0UeQNvG
         spsQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4bEIZhiDF346tUHV0rUi/YYcASmW1sdeyngdNVfYXIUN9AngPzalRFsKEIxjL1N8I8TmD6rWHg8UlDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6zv5cclLyylp1maS0fme5m7reoj+52vL5re/HhbGbnIQEPqr7
	SR1+JYr45Yzep8UyJCW0AUamRVajQ4s8X/69+6tKVah6BnIzn+P6tPm/
X-Gm-Gg: AR+sD12UWT1R/kj5pMdV9XHXgq1bYRqAsLZ7c2D3nPSpRSBjPf5oWLEuAi3TvbhqVh7
	m0lVQsAoEhpUiqBI5aqqBOM6ytVyqnUY6nFM/hflxx6ao2CNmCR8Au5HYYh4VjTojnts+QcGYtx
	mKGurnFsklzgsTZzKmO1Ae27DjAhqvCcnqjPUIrIhvGS4KFLLa0z/na9NT9zvticPPKCIqKPd2m
	zLVec6K/tiqe3EumtMllMFJKyFam8d26pVR7TPSE1ZMnKlKOPNWt19pTGd4nWeyxl1n32BOqT3d
	lqk2ZQ4pvjyDOCGr0HC88wPGAPHxMYO5OMQ4x3hSJATEEu1bHNl2Yfa+ou1Oo5Qid31oc0cqS35
	3BioM8CfkYPN9B6zAox9qou7WEN5KNFuHqNq21HxRS7vF1qmm8YWIYvX7IZJ+1JgK5o+SDM79eZ
	naoACMhcieKLQYXPMBGRRryOS7B4Z4Aox0L9L88Val8SThF3wJVvE=
X-Received: by 2002:a05:6300:8d:b0:3bf:83f3:b810 with SMTP id adf61e73a8af0-3c3ad6488e4mr25887162637.29.1784740159578;
        Wed, 22 Jul 2026 10:09:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0f58dfsm1471345a12.13.2026.07.22.10.09.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 10:09:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ee6a2fdd-9e6e-49f5-a95f-af44a1a8edc6@roeck-us.net>
Date: Wed, 22 Jul 2026 10:09:16 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] dt-bindings: vendor-prefixes: Add Sensylink
To: Conor Dooley <conor@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-doc@vger.kernel.org
References: <20260721-ctl2301-v2-0-ef5fb342872a@linux.dev>
 <20260721-ctl2301-v2-1-ef5fb342872a@linux.dev>
 <20260721-dill-dab-df15585090d2@spud>
 <673be23a-2a84-43b7-9be7-a661cf0e7935@roeck-us.net>
 <20260722-devious-seventh-9859bb3741b3@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260722-devious-seventh-9859bb3741b3@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/22/26 09:15, Conor Dooley wrote:
> On Tue, Jul 21, 2026 at 10:56:36AM -0700, Guenter Roeck wrote:
>> On 7/21/26 08:49, Conor Dooley wrote:
>>> On Tue, Jul 21, 2026 at 02:48:27AM -0700, Troy Mitchell wrote:
>>>> Add the vendor prefix for Sensylink Microelectronics.
>>>>
>>>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
>>>> ---
>>>>    Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>>>    1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>>> index 396044f368e7..22d0d26f1bbd 100644
>>>> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>>> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
>>>> @@ -1467,6 +1467,8 @@ patternProperties:
>>>>        description: Sensirion AG
>>>>      "^sensortek,.*":
>>>>        description: Sensortek Technology Corporation
>>>> +  "^sensylink,.*":
>>>> +    description: Sensylink Microelectronics Technology Co., Ltd.
>>>
>>> Googling the company to see what their website is, I seem to see a
>>> different name for the company: Shanghai Sensylink Microelectronics Inc.
>>> Their website has that with the Shanghai dropped.
>>>
>>> Also, probably the commit message should contain
>>> Link: https://en.sensylink.com/
>>>
>>
>> Asking Google search: "Why the two names ? Did they rename themselves at some point ?"
> 
> The google search "AI" response was what showed me the different name,
> sounds like I should have questioned it some more!
> 
>>
>> Response:
>>
>> Understanding the Name Structure
>>
>> 1. English Legal Name vs. Marketing Abbreviation
>>
>> Sensylink Microelectronics Technology Co., Ltd.:
>> This is the literal translation of their full, formal registered corporate name
>> used for international trade, customs, and legal documentation.
>>
>> Sensylink Microelectronics Inc.:
>> This is a simplified, Westernized abbreviation used on their official
>> English website and marketing materials for cleaner global branding.
>>
>> 2. The Native Chinese Name
>>
>> 上海申矽凌微电子科技股份有限公司 (Shanghai Shenxiling Microelectronics Technology
>> Co., Ltd.): This is the company's sole, official legal name registered with
>> the Chinese government.
>>
>> "Sensylink" is a portmanteau created specifically for international markets,
>> blending "Sensing" (their core technology) and "Link" (their interface and
>> connectivity products).
>>
>> Prodding further, asking if the previous response was complete, it tells
>> me that there was a name change:
>>
>> According to Chinese corporate registry data (via Tianyancha and Qcc),
>> they did change their official Chinese legal name:
>>
>> Old Name: 上海申矽凌微电子科技有限公司 (Shanghai Sensylink Microelectronics Technology
>> Co., Ltd.)
>>
>> New Name: 上海申矽凌微电子科技股份有限公司 (Shanghai Sensylink Microelectronics Technology
>> Co., Ltd. by Shares / Joint-Stock Company)
>>
>> I don't know if Linux has a policy about Legal vs. Marketing names. Personally
>> I don't have an opinion. Your call, really.
> 
> I don't know what the policy is, or if there is one, but personally I
> wouldn't use the westernised abbreviation since they may decide to rebrand
> that etc and the vendor prefix information should remain static.
> 
> So this is probably fine as-is, just I'd like to see that link added to
> their website.
> 
> Thanks (and thanks for doing the extra digging),

Part of that extra digging nowadays is to ask it if its initial response
is real or if it was hallucinated. Sadly enough, most of the time it will
admit that at least part of the initial response does not match reality.
That was the case here as well, because it initially did claim that the
company never changed their name (of course, the next question to ask
would be if it really changed its name or if that was another
hallucination ;-).

Guenter

