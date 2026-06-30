Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741402DEA74
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 15:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831873; cv=none; b=WilXuihxvlfyPd5s3h4H3CZbIeMCnHnF1yGsEkK9tF+fGyis5Bid6vBSkaQmt27+QFLkBDeYaKPZhIOPWKcAXf0Mn5oE7HslbKOddtpaDkjjIdmKqAIGSSrapFO8SD0foG1mWklKbaxjjKH02RRGdNI/r81x+KY1xct8C+3Qorw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831873; c=relaxed/simple;
	bh=5lDDuE8sF6kNY2fJhhlJq4uLAFQQc2okOrHn1iHu+Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3WH7yK21PlLv9ga1+U83fiGkMER75Qjf+nmkWS4ImOqpiiwuwBv3uQmXiw6W2d0KnTDSxpaGx3T3S0wTgHqu5UrJMM9EawkYLfdeagustvmbUw43SUPEL0WPqzAEKLHgE1dYxkXzDumZX2at2fO+NEhTmLgfmNFJ4pp4Vl//rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piOq93U5; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piOq93U5"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37febcda057so869264a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 08:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782831872; x=1783436672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=joxhazWjMjnT6/LFzkaTg751wYRM1xoJ6XVmP2fPgN0=;
        b=piOq93U5GifRehseEE6sTt1aVMHi0rz1VOA5WjJ7W/il9YHe8cznrMxnfhxSKzJnZB
         nUd4xZzBWEdcqGQeL3NbMQuxX7k/3eY9q1cavVgilOuXyl7AIOyON1ZTajzS6MjBjv7F
         5lIHztkDLDtUV8HyZkQCB55YiTPHZw97dVp4NBi08VvxRfWe7RXVfUtOpP5/VkDxQH7e
         tpPFbBS9aJEiztKdaOWimXUZGEu4wkve1pXBgr4guDA3nTjraqM30MjQL5j9DlFxGZwf
         7OCFlYbDgigzHrwO47UAeaXdTdRNC4AwlvIkT6Y2slzw8RAas+31qZ3Q7imgkG3g2pCy
         qElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831872; x=1783436672;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=joxhazWjMjnT6/LFzkaTg751wYRM1xoJ6XVmP2fPgN0=;
        b=pOK5CYgWcQ9isfdRF91pEzmMB645tuDocF5KFdso680a/gYl8jPIat7AJ9spD7ahaU
         kRXUg1UR2GNYuWdt39CMENAzOcjopsA+kspbCQCB5sKWyGlIi3dvQDSsc6e2gW6R0zT6
         o+lJgp+NgMUXSdUXMG6OjDL/AInPFIMmWdzQh3zA61CBNJ5Xa0r3uRJ+q3fJEbdkJTL2
         RXuOxXZQtYNaY0Xnm/OK2sioOinsX/KML13zMgWBklBCFMjOy5TFN6lPcX3ddkuJOCz6
         yV0FmBcjo9RbmPtenvKzrsxI4iC0BSQw2pSzBsLSp/vPfkTOxiQQINKSUQzpTIkV+Q1B
         +WZw==
X-Gm-Message-State: AOJu0Yw67+ciTNBKwNT+vU6C61lCYar8M2e330lvTt0R13AewLGCHZBt
	uN2D6oQt6KWxI9wYZNSs1eoXq7oeahI90mxFut/pcQzj4J2Gny8ATBfN
X-Gm-Gg: AfdE7cmfY6Up4DCYg2Q/FtzbQTHZ1/NcMFvDBDJGlFYjlvqiaDjnK1DUttX2P5BN9fo
	1jF7u96vjIAJgNEWDMYwOoXc9myNHwDI56EfMlt18geyW4BCq317Hqi70tyXRZL3MdlV/QEpsbS
	BxdE+1Yzu9+f39HlRE/2NaItvsmfX+G1yJjND0u2e7M9K1PC/njkkp0Y/wYgQ2EeKmPNLFQtoEc
	3iiWHun1ybXMeiAjlpVmXIXMySN8utfNvNHoS9Yw1FMrH41+WJmWGndiZQun6spvuUu3KVRCic+
	XX05MtHUKfMNBELHICrJg8q+iAug/4XYc1TcGTViI27+iKOSVux2Q7MKB8FBoEun9vqlHnAKSC4
	Nga/J5RFRaeOOdkvKdicZOYXZGS60pqbFirBWo4HZEwVek8EN1PkcF3w1t+VEo6Enh10vs3HHoH
	mJZnd+2JvHz0m2PK1CPDkR2Q02Wl/rF6tujpUdyQfVxLz3nIOJpQ9sJtdVq9n8zQ==
X-Received: by 2002:a17:90b:1cc6:b0:37f:caeb:69e3 with SMTP id 98e67ed59e1d1-38052757ac6mr2977364a91.23.1782831871633;
        Tue, 30 Jun 2026 08:04:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9bbf95b8a4sm1765218a12.18.2026.06.30.08.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:04:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <adfd2c4d-6d42-4aeb-9eff-6a059550ec80@roeck-us.net>
Date: Tue, 30 Jun 2026 08:04:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-6-a02786bde470@analog.com>
 <e5c7fcae-57aa-4461-987d-7f004d066873@roeck-us.net>
 <PH0PR03MB63514C57CA17984F0B6FEEC8F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB63514C57CA17984F0B6FEEC8F1F72@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 01:07, Torreno, Alexis Czezar wrote:
> 
>>>
>>>    static const struct of_device_id max20830_of_match[] = {
>>> -	{ .compatible = "adi,max20830" },
>>> +	{ .compatible = "adi,max20830", .data = &max20830_chip },
>>> +	{ .compatible = "adi,max20830c", .data = &max20830c_chip },
>>> +	{ .compatible = "adi,max20840c", .data = &max20840c_chip },
>>
>> "adi,max20830" is a fallback for the other two chips, but that is not how the
>> code is implemented.
>>
> 
> I may be inclined to just not use fallback as it seems to be more complicated
> and a bit unnecessary. There's also other devices that may be added on top
> of this so it lessens the complexity. Will edit the bindings regarding this.
> 

You are missing the point. The fallback is perfectly valid. Technically
the driver does not even need to support adi,max20830c and adi,max20840c.
That is only used to validate that the chip is supported. That does not
need a separate devicetree entry.

Guenter

