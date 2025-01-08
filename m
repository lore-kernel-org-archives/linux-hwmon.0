Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6638F6B;
	Wed,  8 Jan 2025 14:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736345925; cv=none; b=gIbZckrKiGIa8MyeEi8ZCR6I1COSDw0yyzLAEa9HJ5CORf5aYRqLTM7oBYGyu3FFtQ5AjvhxfSYaR42OjWx6NtA9vj0iwc1KnRAn5ypd4AEjV4owRqGyrbEDnEmyL2PeKlHWnGIHexlnhQukLG+01nv6MTDRe8XF5r6UFAztvOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736345925; c=relaxed/simple;
	bh=DUiEPnqYwY8o5oQC/29t+1Mb97yg+UbOxYzj8aOXktg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GjNhhLgBPsO2glGdM/JHJPh4bm4zLo+zvCD83/Ck1+TmBw1MNL3uX/TTCTMx0vs9ZqmGMxAtzau1X2JKYbVGZta9zs6eySnuOj/fxz1MtrIaSp4VSExvFSbg9PKXWA0zdO6I3G9Zz/25phPk53SoacuaFk+taAMq8XAUS2Dv9sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j66f+jvL; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j66f+jvL"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-216395e151bso12669675ad.0;
        Wed, 08 Jan 2025 06:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736345923; x=1736950723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jRXktoWTr4+FZafmsMTVxwJ5YiyGZJ6jh59oduqbzKM=;
        b=j66f+jvLnnARhmGwVJduV/DpLQ4Y3V18PWVO1BJVMvG7ivKb9f2+6JCJIWdDQ73V7Q
         0atonoyr1i473YobT3DAABDJpzoUgufMtZVZRSZqtI370JIm7LEljaRG/a8xkpUsSVsI
         muZbkwLcV+tdwpamcD2pyxOAJSA/0DUdNd45FblZiHUWoPebYzS2ag9T68uAJDcD4KUK
         7mcWAyJotqgO3GoFzsvcyT4Dpu4rooclH+HzNC/tCrJYV4sebG2Qmr73wBpNN0hsf1DY
         0J2bh9bmMqADQ7e1dvDW6o+GATzywYfgzAbaB/tHlapTbuw6MkhudbGVpg9mfuMQl+e9
         fOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736345923; x=1736950723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRXktoWTr4+FZafmsMTVxwJ5YiyGZJ6jh59oduqbzKM=;
        b=QPqVJ/W/kwk6tBUx5ywTLNknZXz+67UplWqcmsvo7Ks6/sRM70qs+DUYppE3/hnI8m
         gBcJSk8wHeagdCO4Goh1VaRcYXC6MO7yS5E0PFwS1RuvM45XmQWhfhS3OE1xcczpjRVT
         wdibBT3dAAZG7KsVyDT/fW6/ViRla5qP3PTqYpuxcp/AD/qYWpiObsxkpjS4srWm/hpY
         C6vRyf7OrIz0LNEK0Z2reaYfVFFCq/TYezxj/O3aP9ouh0C+1xQCcL8m7nzZXcmv/mC7
         F0hAMyIWNYu33QBK+6/Y5w4Ydhk2dMc6zDSdKxDXlO8HGtpdbLqW09pkTtSuSyFl1b/I
         N12w==
X-Forwarded-Encrypted: i=1; AJvYcCVSRyblJVaz2tNTjM45hVSqlCIAdIm50PuB3oB66o4aS4BgTnfJsl9+thzFl+AEl/OteJ0QkVulSoJKzWiY@vger.kernel.org, AJvYcCW9+dHfePV24+j13sbYEtzpPqrf1piGIA/Vfk73LiXdT3Gi7UcRPQ+sJEIqcZ5r97R4Fzec32Q6V0xL0l8=@vger.kernel.org, AJvYcCWvyVnc8JN62LW2kp5a7C0aP0NGOhv9wvNrAuEJAiETBNs535v2YTtd+EmD9bSkvUvhkp1KvX2iVvpN@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+zNEHRhoesltvmt0GtyX0KBDsQQunGf43vAZu1Fkm+/V8Wamx
	v91KgXIKEHhBOKA3q1W29WFyapHDSXmGJU2c3/rtuCEQAg7x8kFF
X-Gm-Gg: ASbGncsP2VEo/YwFPCk4ym4hynQjVjqAssdeGan4VOHPptu1P7RSRQHO8CYquK3I1nX
	okJFOUEcn75l0VGByR0tWzrEZ7EuRonFlrUSg6FGFf8RcpEm5Y5IodALkblaX0jQLm6aH4vSed4
	isqXNUf+Jx4NoQJsk9n/XiOD/mCo7xMQObWygeiatuEgEv0gVmyDBXcUsOwwMzEmbR2n0cinYeq
	YKRDmG50tHlFeGCDBYWqqWbYrKmIMe3rid/1kjXcWwncsd7yafdf7JpU6eD04xG29v8urBHRFFr
	HOQafVBMbfsUYIAuQmhAGoHRY9mclQ==
X-Google-Smtp-Source: AGHT+IFEu1Mct2/rqIFwi7V7f3ZUcKiGm/OV2PjTMHla0zNtfrSez15MgIVMVB3MRyidOoH6iOJ/IA==
X-Received: by 2002:a17:902:e948:b0:215:3998:189f with SMTP id d9443c01a7336-21a83bb9916mr48110195ad.6.1736345921651;
        Wed, 08 Jan 2025 06:18:41 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f72d1sm328051925ad.189.2025.01.08.06.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 06:18:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f96bdc15-1308-4b9e-9fe4-e92505eb9d8b@roeck-us.net>
Date: Wed, 8 Jan 2025 06:18:38 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings:Add SQ52206 to ina2xx devicetree bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Wenliang Yan <wenliang202407@163.com>
Cc: conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 jdelvare@suse.com, krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org
References: <srkay6cpegcxwx6q4jexs7iajydqqossfjctwoq3tctsanruxk@t44w4tbq3t5x>
 <20250107130110.25525-1-wenliang202407@163.com>
 <450da9ec-d754-4dea-99c7-d5730e35a284@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <450da9ec-d754-4dea-99c7-d5730e35a284@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/25 23:06, Krzysztof Kozlowski wrote:
> On 07/01/2025 14:01, Wenliang Yan wrote:
>>>>   Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>>>> index 05a9cb36cd82..f0b7758ab29f 100644
>>>> --- a/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>>>> +++ b/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>>>> @@ -20,6 +20,7 @@ description: |
>>>>   properties:
>>>>     compatible:
>>>>       enum:
>>>> +      - silergy,sq52206
>>>
>>> So it is compatible or not? You said same bindings, but not compatible?
>>>
>>
>> What I mean is that SQ52206 is compatible.the datasheet depends on
> 
> 
> Then compatibility should be expressed in fallback, but OTOH, your
> linked changes suggest these are not compatible. Confusing commit msg.
> 

It is 'backward compatible' with additional features. That means it is not
'compatible' in devicetree terminology.

Guenter

