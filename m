Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB381586F2
	for <linux-hwmon@vger.kernel.org>; Thu,  1 Feb 2024 07:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706773633; cv=none; b=B1p4dn0I0gsABE6+eAL45/d/0DWvPNz5Q/shAyPJKZLv+k3CZd58eVqJDD6eKTgtPt2T8iGAGaxyTPcQkZSdqIbAVEjCxtG/C6uJonKUsFNukGwaG9TcEg3RAEHD0wkizl66XlAR7eyPOYQQvbfLJ5aLiFYMylcp7CjSvH2KnVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706773633; c=relaxed/simple;
	bh=KPUF3I2gwCZplZ3t8IIUhm81HX3c0JWZCBOL8bNyZ3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AbOzNBmSEjP/GTZmMx9+BixNVmINciVo5WqpWOa41aJDkkklXGf1Htpn/Kwk8iUJBVARXnQVRLhMByeBaB8qCtbUbikEcUpAaBE8yNwCAcZi7/CXnBya6UhZQmnO/cVfOxzmzEMOAovXAe/egQsaQZL3oMfkussZUFUECZXu/mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VJ+qZ9zN; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VJ+qZ9zN"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a36597a3104so74281466b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 31 Jan 2024 23:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706773630; x=1707378430; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PU8R58r+KXKaOneKKYQ2DEBWgtfSjbnDglXSUn6f0Zk=;
        b=VJ+qZ9zNuGQMuwTRkZlLEXbL7+3ELCJLkE7he6heGng1eUXCXDnYy/pV7Ax2SjpOnD
         T4ad+Whsq/qCzkkGTeBg6I5JSYTadIUmxrub8ATv5wlu3ifa3YwsTgqVbt/ZotuqIcCj
         qY6m68cPlkUI3TeVee7Apamf39Dx/8jocF2d/+uKzEewSig1rXqiB6aKMCuMRzU6X6Xw
         dP51Xv1SLxuz+QXxq+4o9RjD9MPOnx3Py/ORnZ++65TpryL5XpQ0UsIPzEQW9muoofgJ
         ESm8qlNDOwnll+1cc3TavNVnzxH62+uvlGH493wm+ZqS0J5FrkmDQhB3lwpNaOfMcoy2
         QTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706773630; x=1707378430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PU8R58r+KXKaOneKKYQ2DEBWgtfSjbnDglXSUn6f0Zk=;
        b=F87TaSd95ou7tLn09PA+Tm0czo5SYRHgOMvQ4QI3SqclxjAWoGl5nu3Hx7I2b1k+r7
         uWVJH+oZ0pqKy3N7HMDfEgDM/PGbemPeNpET/hoAcN0vC9gl2+mX2WIK91qiej87yu7n
         opNSF1Bfq4D5GdzkaCo36vbTlazdc/bNsvcTU0f3cMYQS4M4VE1hBMcdA0CQyq4QRMLN
         V+qM2fI8GENuSgbmCtxjD1E5qb5x1EBr0VFDw8EZNftijFW5NCjWeF/GW7nuJ+9waJn/
         pYTmp1jDgcffb7AMQDEElLlLYnHDAVdUl3MnytrVfUJd52cGalFP1iYAD/S3RTBcetaz
         7YOQ==
X-Gm-Message-State: AOJu0YwMaZDvEZQTRovd570y6znxQvzLqs+smmP8rfYDY71hLqVQKZEo
	IrMwbU4M/iI1vY5tcOnEIGl7uV/sEcdbRkcaoWaTctTJx/iE17/tyPZZkLVV/Bo=
X-Google-Smtp-Source: AGHT+IHWKzvbqYw4ct9BFvpoIz6ginN+TOnUMh3QusX15u4tHhN2/933tc7/Rna5Yb8NWkbKi2/vcQ==
X-Received: by 2002:a17:906:d791:b0:a36:3819:940e with SMTP id pj17-20020a170906d79100b00a363819940emr2668583ejb.27.1706773629774;
        Wed, 31 Jan 2024 23:47:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVIMyMqnCRpU+8sPIiaV02F0a5rwjJf09pDjEOIYgTfQpmYw6fK0SmQGo0G2gAvzXQLz1ZhpQyPHAlBWZH12aYySr472wNbZtZUukkeN1h5H54syJVIKqzRkPV/Q5NU6WKFFztorUvo7V7yxR6LmT7HncRBZ5YkfV6SYKC/5HgB1lxr6E+fM1m8GlOPgoX9hZfjAtBhwu9G8ljwLU/ieG7N3IHUIu8G2N+okPAhoTLEmYFvtDzMUfmN7rM6vkjKdBaZwhhWnArbt/0g4BHgw5tMe8bevWhaG6X3xWmhL6Rrgw4DpR2B3j0ZH9m3ctqNoozlpd89rZqLuxh65/2bDqrkMWQiRv3KHkVVHzkV43uZTJswOfppkvEAGqWKYXOq/c4O+Kq9zA==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id pw20-20020a17090720b400b00a2e9f198cffsm6892853ejb.72.2024.01.31.23.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Jan 2024 23:47:09 -0800 (PST)
Message-ID: <f99af7ee-1a6c-4e00-9a7d-3a1ddc9574d2@linaro.org>
Date: Thu, 1 Feb 2024 08:47:07 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] dt-bindings: Add MPQ8785 voltage regulator device
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, Conor Dooley <conor@kernel.org>,
 Charles Hsu <ythsu0511@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, Delphine_CC_Chiu@wiwynn.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240131055526.2700452-1-ythsu0511@gmail.com>
 <20240131055526.2700452-2-ythsu0511@gmail.com>
 <20240131-eraser-given-8381a44f41a4@spud>
 <d20e1f93-4e6c-4c18-b4bd-19412eb4e8da@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d20e1f93-4e6c-4c18-b4bd-19412eb4e8da@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/02/2024 01:41, Guenter Roeck wrote:
> On 1/31/24 07:41, Conor Dooley wrote:
>> On Wed, Jan 31, 2024 at 01:55:26PM +0800, Charles Hsu wrote:
>>> Monolithic Power Systems, Inc. (MPS) synchronous step-down converter.
>>>
>>> Signed-off-by: Charles Hsu <ythsu0511@gmail.com>
>>> ---
>>>   Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
>>> index 79dcd92c4a43..088b23ed2ae6 100644
>>> --- a/Documentation/devicetree/bindings/trivial-devices.yaml
>>> +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
>>> @@ -129,6 +129,8 @@ properties:
>>>             - mps,mp2975
>>>               # Monolithic Power Systems Inc. multi-phase hot-swap controller mp5990
>>>             - mps,mp5990
>>> +            # Monolithic Power Systems Inc. synchronous step-down converter mpq8785
>>> +          - mps,mpq8785
>>
>> q sorts before 2, otherwise
> 
> It does ? Not in ASCII. Am I missing something ?

Also `sort` agrees with q being after numbers.

Best regards,
Krzysztof

