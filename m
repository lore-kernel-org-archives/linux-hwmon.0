Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AFC153580
	for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711355531; cv=none; b=f8Lr6XM3piBSRgMy0STJDzfR7CEcU93G/D3odm6KEHI9CEolV5cz3UkMWfNIbdh4ppWaVJcXL26ggN68bCyhgBCRaDJagROziaue0fSQcNYnmaBzKwk54Hi8hzOnqAXB1fhFlZru7Tmo/8NNZv6wrkispxQBH4TAdEiG1Q7rJz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711355531; c=relaxed/simple;
	bh=nUzbBSYPjv8N+H9xKIEdwIMIeUjkj38bj4UVIfyqSWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhMYyk7+yNQSmXFOn9GSzE3PEkTHRyUjTuZsJ9KrZRi91pm2Sb6JwgyIfW0JgziSL6F1ZVpsJdB4az3ZdUM2wUBf786TgtOGITHsGjZNzrPiZxPWoVumXG1l5ThxIDNZo5jAAkwTL5M2G7wBUaGxk+RnicAo+KTILg7enJHd/Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nb32IC0y; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nb32IC0y"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-41485f6da87so5587605e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 01:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711355527; x=1711960327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EJVN0cgUQnfYRe9h1VVQ0MrOz9M5AG8Pfe5rJ4y9IdM=;
        b=nb32IC0ybswF2xq74mik/4DWvgaPO2MX9Xa7eNzbz4BcqlcGebxrnY38jGEuwvohFW
         WdHAhDU+nVvqvvaCkW8+A1o4efT8Fg4pFVFIqTzCO/Rviz7v+ParWk+ZOT4LF16CzzdD
         ZUWEq3SGUKXsgJ7GCOuh8rkB8LWQYVRmp4XwnwpslYROTxHrbiGSSadpIH+tiEuEa0Q/
         9qhaZ5PZr6THu8MR5R7PWuU06qTrRG3nl+ECtslP+QTV1KLUgWQCKOlxNFmyW6tB9UYv
         H66A190RVpZo+mcnMc1+pmT9jYjF/xXhd48iHXK/r9FMlm1zgnElQHBQKIWsMRwRZTzu
         a2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711355527; x=1711960327;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJVN0cgUQnfYRe9h1VVQ0MrOz9M5AG8Pfe5rJ4y9IdM=;
        b=pNFK53yoF7kPUx8BqHJ7W4UZBUpv1xMk/exAEJrNe19gBlaXTpPMPultZEqXEBsuD/
         gSujp8H4yRiVErLN3y53junCjCO/UPuq7gTg3PE9yBgeOws3X9tSwmDe0kaPf7A0Pj5q
         l+Rgyl1zAJxQHHrZDi/4JnIrTDRBElAMchUTu13h4DDLnAeHwncc01SOBcyO5YQ4Ryc/
         E+oHQvuFOMClHWbb9SNi4G+vRd4Xi+N9ECHiYIB/4o40GZBc42k2XEBCad3s8mbNUuDe
         D2602OAsZotFA4Hug8LFV70ZL5+VV4v2CTo8kl0OZFgxNQ6ry3BrjHPMe8qjabDlRKqq
         4FGw==
X-Forwarded-Encrypted: i=1; AJvYcCUb/tq224Yxg5WYu/wSND2jnQl1jIJLLneXSJzhivGBxDZ7yQ8TuHbMJ5Lepxwp0SddDu3lcqULNOGCIHnvyASnK1X707i4dbpfKFI=
X-Gm-Message-State: AOJu0YzHsIQcMi4tlQs8OoTocQTJXlSLMFx4v90UbcBkpuc6QpMR+EnJ
	yFtpJblCsNjukcGU7ZLXSNf6JmhTYa1tE6tjBufR/C8H/naLdZCpZPHkPsGNkW4=
X-Google-Smtp-Source: AGHT+IEfSPV4hQK/OxtuNuY45jUFIPtq6au32J2QP9/J5O01fmDJJZnZBiQk3fcOQXpMfE0Cbkv3EQ==
X-Received: by 2002:a05:600c:3c8c:b0:414:61d9:d1f5 with SMTP id bg12-20020a05600c3c8c00b0041461d9d1f5mr4619016wmb.10.1711355527510;
        Mon, 25 Mar 2024 01:32:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id bn22-20020a056000061600b00341d2604a35sm379156wrb.98.2024.03.25.01.32.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 01:32:06 -0700 (PDT)
Message-ID: <c3f296d2-63b0-493e-a2cd-5010dea84adb@linaro.org>
Date: Mon, 25 Mar 2024 09:32:04 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: Add maxim max31790 driver
 bindings
To: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Justin Ledford
 <justinledford@google.com>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
Cc: Phong Vo <phong@os.amperecomputing.com>,
 Thang Nguyen <thang@os.amperecomputing.com>,
 Quan Nguyen <quan@os.amperecomputing.com>
References: <20240311111347.23067-1-chanh@os.amperecomputing.com>
 <20240311111347.23067-2-chanh@os.amperecomputing.com>
 <6fb70adb-aa85-4b9c-b093-afa4ec7ed056@linaro.org>
 <ab8b45c5-2ef0-4a87-87bf-f797954b4574@amperemail.onmicrosoft.com>
 <a224e752-d99b-45d3-b5db-761a698c347e@linaro.org>
 <21256600-d94d-4287-b22f-f22258121668@amperemail.onmicrosoft.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <21256600-d94d-4287-b22f-f22258121668@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2024 10:53, Chanh Nguyen wrote:
>>>>
>>>
>>> Hi Krzysztof,
>>> I have not yet understood your comment here. Please help give more
>>> details for my missing! Thank Krzysztof!
>>
>> I expect many more properties of a fan controller. Resources (clocks,
>> PWMs, supplies) and FAN specific properties.
>>
> 
> Hi Krzysztof,
> 
> I'm creating a base binding document for the max31790 driver. I'm basing 
> it on the drivers/hwmon/max31790.c. Currently, the max31790.c driver has 

Binding should be based on device (e.g. its datasheet), not the driver.

> not yet implemented other properties, such as clocks, fan-supply, pwms, 
> etc. So I just introduced the "compatible" and "reg" properties.
> 
> In the near future, if any other properties are necessary, I think we 
> will implement them in drivers/hwmon/max31790.c then update this binding 
> document.

Please instead read:
Documentation/devicetree/bindings/writing-bindings.rst

> 
> I look at other binding documents, I also see something similar. They 
> just introduce the "compatible" and "reg" properties.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/hwmon/adi,max31760.yaml 

Maybe these devices are similar, maybe not. This should not be excuse to
come with really incomplete binding.

...

> I think "fan-controller" is a good node name. Do you think so?
> 

Yes.

Best regards,
Krzysztof

