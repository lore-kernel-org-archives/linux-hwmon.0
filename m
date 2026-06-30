Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF8C2DB795
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 15:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831966; cv=none; b=A2mHFv47HL7gddlLayTeLnaseSFyd3mPGae5/RK//rXGDcsKfdgufZZ+w++sRJ/VhSYxk1rZlYBJg8Rs0mMLxqtIXpHeN2xGggZ8rqoApS/i8aINIWKeQdeK8yYEdDwQRdofOsunAVhcbu3Uo8mbiNxCb4AZ9puRlfSvAdoPi7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831966; c=relaxed/simple;
	bh=PJjRJZxJL/UeW4KERlFdeotWgWnB827NyxxhJhOJ66E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MsO3OSN8ytDe7PyaDC3myn8Sk996skw2+pjQWBXlTBuoJLtOg7RZCb+QKsu9OlJner73sdGnhRdiiH7M0IXy+0fs1r+fjpaKa01P7wyIX+IZSB/d4J15qHWKA1ep/HYxVfwNg/KR1JA2unC3aCo+D067WJOEKvCWJ5CyWHgc8fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ywkn2HXL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ywkn2HXL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c89636920a3so1645987a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831965; x=1783436765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UFGyoA2Rfep2QWMuhmcB9t0qic4TnIIqSNqMYevCqLs=;
        b=Ywkn2HXLu8UBrdYFIuFoGWuBiCNrRfBBtugeSXlwTHmnkSAH+8aFaCJD3LMwTRPrjk
         jGMJUQr6FYbfIxQsxf5Gv6nsN5BNfZYCFIiCotNOOsbuypi7DTcrCOJ2ySQr0i64BVFC
         Btq8vE9j+W+ue1g24yd09/x4K9h77kxmzNhopkx2/amOY7+i1MdfUgwHUb3Ngn/nY+sM
         oYz5Vjmd6yQq5K2qWbdgFpM7AbuNlOQqj8RtJXgGS1QY7VbiRAppIcpsgUyKFwncOPQ1
         2DoV8k488EkLEA9rAL8uE0gV1ntLD703/fmeb6UjJIJwJhf5PL4ND4bJSTmzZNrKGtss
         AQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831965; x=1783436765;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UFGyoA2Rfep2QWMuhmcB9t0qic4TnIIqSNqMYevCqLs=;
        b=pMDGlqlWnwr9pALz2KF0sup1Qs+no86ovkkmtFpuv1F0LXs2ddMog9rqRk99cGxbqB
         eixlGuzKzxLcn/5dmwVbq4G4NgwC7VfHELtWan5sQlwXgwH6T0rMSWHZnP17ehRuAnYa
         1igJf1WLT62A9V4BjxLIyZyRlJvldkp12ht6PIh4ZAOXaKjUG+3mnmc5Z4x2rzySAT9x
         6v3RSr07Znq7Egr16J1RU5Ok7BqrN9eAJAyVqdG6x1H4UnhaBIA0XU2IIMToHQ77ubfe
         A/S09chD3DkkU7tcj/LtzQv2j23CvvBDEjdVMaexFkRzDSvb7abJMugUqQzWYOJYvxOP
         9TpQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tJ9K+v+MUVck9h4mHvWPCYPz/pbg3H2IMv2VUoWWQYQ/N4FKlX8YH8I77cvs98lSzi63ivGBZRmfT6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd3s/tYgP+8CvyA5TlzA/ZoNItlAo97ymM03fSGhcnfgGic7f+
	ASHbL98ECF4pFzVUxrG06W95oPDQOFKjIEL2C6c4YAmyOpJ+DS+7yrtJ
X-Gm-Gg: AfdE7ck64Xjw8v8yyAG64R7iaAji8Cfk7FigCDY2tE9dvFn2EUe/fmcsB2SlJx/67mp
	WzZtrwSXraZB7h02D+mbRLhZwes1285Jbp82v925MP7UMQAoFoSDIfakBCiV7tvZ/XUV50g+f5L
	sczCuUs8OmLYW4AiS1CBmkAO+7DuPajRX59RacGhuzh/ooJqLAOeFRC/flSsyujoB42xuB1OAyr
	smGlyBirHm38VT3VlGOVQwlnVDeInMnqpgRjRWraJyXVhADoT7pI4XkMj5ZFJZpAMD6+HnzWJs1
	Q68cq0FtH4+aZO2UDHxFHFRQaPpJ3WuKImi1dz7p4IWC/szMvlccLSaA1RFF7/n15uFl7XEsxU1
	Ewy3hKj87wcIswv97KJNvf4464BP9LxXBuqchR99fuKFbVfxQM+TW5/VPmMtKm5LpemclO5msqx
	QSug0ZIXbRPd9xtfqu/rHgO1vEoJtHl77pjmAw20qPq/yvEFYLkT/5IzRkekB69n6R2GnE0dqZ
X-Received: by 2002:a05:6a20:729b:b0:3bf:6f9f:3381 with SMTP id adf61e73a8af0-3bfc5275c76mr2888665637.33.1782831964766;
        Tue, 30 Jun 2026 08:06:04 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95a7bfsm1775759a12.15.2026.06.30.08.06.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:06:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <22c253eb-d2bd-4e2d-9d8c-baff07306a30@roeck-us.net>
Date: Tue, 30 Jun 2026 08:06:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: hwmon: (pmbus/max20830): add max20830c
 and max20840c support
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-5-a02786bde470@analog.com>
 <20260630-gerbil-of-phenomenal-jest-4dce8b@quoll>
 <PH0PR03MB63512440FF07E171477CD42BF1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB63512440FF07E171477CD42BF1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 01:07, Torreno, Alexis Czezar wrote:
> 
>>>
>>>   properties:
>>>     compatible:
>>> -    const: adi,max20830
>>> +    oneOf:
>>> +      - const: adi,max20830
>>> +      - items:
>>> +          - enum:
>>> +              - adi,max20830c
>>> +              - adi,max20840c
>>> +          - const: adi,max20830  # Fallback compatible
>>
>> Drop the comment, it is obvious. Can this be not a fallback compatible?
>>
> 
> After considering the feedback from patch 6/6 regarding this fallback, I think I
> would not make this fallback compatible. Will edit out.
> 

The chips are technically identical (register compatible) except for
the device ID string. That can be evaluated in the driver without
requiring a separate compatible entry in the devicetree description.

Guenter

