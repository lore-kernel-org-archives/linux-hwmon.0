Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE3D334386;
	Tue,  2 Sep 2025 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756829509; cv=none; b=KngmD5LHovCjvT8rYvl23qi4tz9g3vuod8H4g0l+2E291NsnXPaQsLj+/FaMA4uRQZTQIouuRt83ixmC2SuMMlaXEaEgNyfW3dB8dxSIQec/RNjRhEKKgSPyxAeWxxpVvIK7kqGc9mDWIY5tmq2QrblXm7/EDp/hWFLjoOHyWDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756829509; c=relaxed/simple;
	bh=Dz+KTcqGggqrUqZTNHt0tdHkzZHcpyxUEsw+RC+3qhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E2LfLdpvQrVX8xRjoyCg77ZLLtJzBrLlXV4ZCoT0Ir9weOJL/Z4rL7oVhajVR8GpDRvJMHJHauyO8JGgi/15Ougv1RPuesbUgOnG/h4+hLDGYoeOhea1IhpJbxFPZBVDNR2T1SO7DnDx8zKu9BCBSetLfKf2zWHksN1XkDrA/IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=el05CqMv; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="el05CqMv"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-772481b2329so3074137b3a.2;
        Tue, 02 Sep 2025 09:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756829507; x=1757434307; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xFnRYEumCWrJpfQcLVU5DLwppTzwZKWCPkME/qDQZKE=;
        b=el05CqMvBZsfxFdVALWTIJllLCZ2bIPWkSH6uq3DVI+rIOt3wE/mfbTJwD07p6q62U
         VslmkL+IXROj446cSRo2MG6B9NBh/Y/DKcwVlRAtLKdPeoxefwpXztizFDq7IXLl+q+g
         srbI7h/YYWmPZHutPrOyoJYgmr5W521JY0i2QZEoR/NDt3oSAH/fPDlee1r0VXQDZhSj
         SQ0V2MbMkt3EpITFrKRw4Kp/rImB07pSpXS8zGI+Rg8tSzrgx4GRs1f1W91CE4cu6s34
         dLtEb3k0F1x8XwqI0FCidC5hk0x+nx8FxTP9SyTkujxm4r9rK+0BwijhTQblxZfelylD
         RM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756829507; x=1757434307;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xFnRYEumCWrJpfQcLVU5DLwppTzwZKWCPkME/qDQZKE=;
        b=Mu9Vc5N79Vevgk6eq0fF/EoyEbOQjSNpu2F9WVyk+DihvVYUiAoqTxXru4WzXtUp2i
         HfcudW1H4LjP8MzeaHlka01OpsLYM16fs+2OV+66ACoTV998VesR2qw5wMPIEjj54gyg
         Sf78hjIYTDshSv15jd+A2W7vdLVDx0DI3I9DVuoarEE9m0wjRfthgsxI1e1oSYXZsKmQ
         fl3zCqIgX3qi6KZHYQyzeu14mldLl1aMR1c+N00QqsIqukD0rIoj3JagPxGnDpuWi9Im
         ht0AxnFtsXrCU/+hSX7Fhs0JKCt0KWTfqbFTpryaxCJaV3Ran5lnDn9AnL/lvllhjIlQ
         Nc4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUmndqIyUS9QB3tvGt/NOibQraPS+eoCKVYxAZ4Ne1qSVAfsINitjI/q70JW6q2/eJmm4f4K+WT2DEa9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXwqWFDdJN0eML2SvHdlv6T0aFRMEEayAhTEh8pD/ToVeErA/L
	65KMDPSPsGKmXBooTb+VGidm2CRtsqgX6NgJOSViku2fmSqDvcakak4v
X-Gm-Gg: ASbGnctGKoIB1ml/xJqbjcsjxQhYyrMpLMq0IgreHRBP0VEs3tgR/lxGrVP4KHzAf+5
	ew2tjvlxlVygy8qWQUNL3K+6axejjCUa+vL3s3DtIYT+g1fk8+M2MKK2pb5UXJadAQCcOMyPb/v
	QVWjyMW38mMFyoOp2AeQPkJYgOUEqJac8BhDDVi4tOhQ+rje2si3gq0vNi2CN8ge4L/hrvWWWv2
	4MBJrd6aw2GnlZsKFjSidaaiRRgpqxncaZaxzjx6iSGkPq+NFs4h6FwhW6gH0K5GVINi9XnsSTJ
	uGLcPEP8NLT/QZfg8NMLOOmw7JHdVxrjW6mc/GePp/z73PGq+XVJK3cyJ5vJ6Jwhv41SiaG0JBP
	2FrMw91+1MI/KCPl6c3y3l89hDsqTA+rEIIqIvzzZv0DM6CBB+r1z9FPKoxTqY33KYVEYke2OMI
	3qM93oZQ==
X-Google-Smtp-Source: AGHT+IFjDdcMjKZ1LSVyat+2HIWdIgmVpYMDNPjss9Y3C9T0l1flbWvHrIVxwcg4V4wHMSC5B9bglA==
X-Received: by 2002:a05:6a00:4fc3:b0:772:6493:7e77 with SMTP id d2e1a72fcca58-77264938033mr6116809b3a.5.1756829507457;
        Tue, 02 Sep 2025 09:11:47 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm10492763b3a.4.2025.09.02.09.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 09:11:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e0a2ec06-241a-490e-beb3-470cdeae6fcc@roeck-us.net>
Date: Tue, 2 Sep 2025 09:11:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: ti,ina2xx: Add INA700
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 Christian Kahr <christian.kahr@sie.at>
References: <20250901215648.2696843-1-linux@roeck-us.net>
 <20250902-purring-lively-aardwolf-dca3e4@kuoka>
 <c37bf116-9250-46fa-9a6c-24cb9b3af661@roeck-us.net>
 <2c649ee4-5b2a-4f8e-b61e-8847885e877b@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2c649ee4-5b2a-4f8e-b61e-8847885e877b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/25 08:45, Krzysztof Kozlowski wrote:
> On 02/09/2025 15:48, Guenter Roeck wrote:
>> On 9/2/25 01:39, Krzysztof Kozlowski wrote:
>>> On Mon, Sep 01, 2025 at 02:56:48PM -0700, Guenter Roeck wrote:
>>>> Add a compatible string for INA700. The chip is register compatible with
>>>> INA780 but implements different ADC ranges and thus needs a separate
>>>> compatible entry.
>>>>
>>>> Cc: Christian Kahr <christian.kahr@sie.at>
>>>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>>>
>>> Please mention in commit msg where is any user of that.
>>>
>>
>> You lost me a bit on that one. Christian had submitted a driver, but missed
> 
> And how do I know that there was such driver? commit msg should tell
> that one way or another.
> 
>> the devicetree documentation. That is what this patch is for. I frankly don't
>> know how to mention a user as requested; I don't easily find an example
>> in other devicetree patches. Typically the commit message is just "add <chip>
>> to <bindings>". Please give me an example of what you are looking for.
> 
> "Document existing compatible string for INA700. ....."
> 
> This is an easy way to explain that it already is used.
> 
Upcoming would be more appropriate. NP, I'll resubmit with the actual driver
patch series once it is ready and keep that in mind for the future.

Thanks,
Guenter

