Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23ABE367294
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 18:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782845895; cv=none; b=n9X0sN5X0z7vQ53V2gAjia5/zvMwpiE9vD5tKonJT92QC5gLcB5vwHitNZsN9eBcpSxrBUEsEvP4U94dwYZdMcPA6i498OJY5xelvwP0vnylUvPOBEOwgwM/EUeb7lj4GZqamENdRmzsJ3N5tvTAVwt8arQKLiqHwneJD5/i3Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782845895; c=relaxed/simple;
	bh=liAWauqxfOKg8u1XRrlELemjS47RKtHwe0SGtDx/hgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AkNsyUhuQPx0qZkUwgwh/icKeAHDLDz07YwptjbY4uVD7aFR7JUr2AEcV9jSrrNqmCq3BU5p4fUhBA+QVu9AR3ygx68Ldv7DavigrIn2ZqzctJrO2TP025bCXh7UT9I9LFyS//cD0MwjWHoUt1lh1f5XszC7PUMecyMfBjMhGBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mu7pUNv/; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mu7pUNv/"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30e7eb50b83so3707115eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 11:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782845893; x=1783450693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=K0MD1jiUBRZgyv6uUhm4ka/YEfBEnwUyewin9caeOzM=;
        b=Mu7pUNv/RLtkeQD8wGWmounbwbETrojCL9jbCfEiPtGaWoiT04EcBj6Uca7RWvb7k7
         MHXGgZhPTzhy0kTKQMf3UwN1YHaGqAuWFu/oMF2HoPsES+M2Ft+Ptavdpm+GRg/sqZOu
         d4SyFKp3kvSTVco7w5LDxVN40xfCypX0T2MQ8UGipgFwdzaMsEgKmp6TYbP1HxrWlAta
         L2irbMEQ5iYIMREuci14axXQjuHjz7VgxywLGIYkoWtB580Q9khTDwRxCMyhUGq5NIOf
         c8vD/wKt7upQj6UppoWyXu33GjeOTulfKgkIgSmqC+UR4CzMBMu2aFNDixXgouAgE4OX
         KQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782845893; x=1783450693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0MD1jiUBRZgyv6uUhm4ka/YEfBEnwUyewin9caeOzM=;
        b=KiK9YweHBC/7TkENalwIwTazOKTt5oh7MgcI+Fwkhj37tHhjsQEDsQv7j2Nr+Fmit4
         YXH43u2AWc+13nty+XHCK8AdmQi6QrMuKgR+Rcmju5pk+9NBc1zkHHqokS6p9HuSLma1
         XgNq+dIXV/N1r7GMFjrvrf2WAqLJx0hEL3gDUbOzxdAUc/BOYni2FwgyAJoEQdorwaow
         wWzEW87+bbP6HedQRIoQ0oqSRXQy5bpMdbToHnFVACBH28jL9hGxpcOZnkWvNOpemgZo
         hmdO82lZqqiMmTugrFb6UVG2jFhMzIZXajdWOYSBpLIm1SA+Q2DtecWgf+9Sju9fG1Kt
         l0GA==
X-Forwarded-Encrypted: i=1; AHgh+RrRp5xEUxs9IqpAotv7KzWPsQD9HQKUsYXX6miwLq3gzOYFFwK4NapjafcmQKoJNu6HBbDCipRHmQy3Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy08REJs7oNq/DtO6kmiiz1KmYG0lerKErJ7NoBQ1eqt9dZyefS
	XN4r5NEaZg+z+yGYXcwQWc6CuBN1SBC7lGkrqYky6fGfgJuWOePr18aU
X-Gm-Gg: AfdE7cmdJitcE9TXfSFdB0ckeuu1RMx9sNbpdzMtaGeG/EtU6A7t6uAcUsCE2C5BfVa
	VLXzjxgGLfsFb0Wnc5IRDhndonfuX5jCg2EJqoVuyMV1IkvHEcav2mqnnPjOhsevKh5zD4xybJD
	05fMQJddoV8xtQ8RSeGROdRiHi8ImlzVP0feNP4tqcDuydjtOIrLxYttYjyfO109aIRDqgqGZbr
	otd5sYJfXo3s1TMqOQSwDCgYCOjKDqVJZT+PCdZWe+VPy6VyAmUHVWdx7JaGeCFjgczPT65Grrv
	eOH7I6IRWQc2zY1i+/SA+zSa+oDgnXeGkYYQbpGbfHvgDi/Au/1OoDvWII8aNIioEb4/18WbkA4
	HB3uTL8oPp66iLkwisLYCcflUYIm5fCV9HVQ4aon52zy4K+F54vm+I8kYcseTxX7ebFwNgZOShX
	0WgGv8/ivR/vko3+a0ixCNuFAjeZ7olOcugmcbBm0SyTvG6YIPMJXXkc85BYh+e1GufaJIaxDd
X-Received: by 2002:a05:693c:62d0:b0:30e:e786:689e with SMTP id 5a478bee46e88-30ee7866ad4mr1661655eec.31.1782845893207;
        Tue, 30 Jun 2026 11:58:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee2f584bdsm11317161eec.4.2026.06.30.11.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 11:58:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <26438725-805a-4b04-85bc-a22e936c222d@roeck-us.net>
Date: Tue, 30 Jun 2026 11:58:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's
 FD5121
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>,
 Conor Dooley <conor@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
 <20260622-support-fd5121-from-onsemi-v1-2-b31767689c65@onsemi.com>
 <20260623-anybody-gutter-e6ca04f53bdb@spud>
 <CYYPR02MB98280DF78A07EADACFD084EE83EE2@CYYPR02MB9828.namprd02.prod.outlook.com>
 <20260623-scared-judgingly-7efc1c188670@spud>
 <CYYPR02MB9828EECB3F6AFDD2A7BD3E9B83ED2@CYYPR02MB9828.namprd02.prod.outlook.com>
 <eed3e19b-8cc7-4aef-b058-b2242c94c940@roeck-us.net>
 <CYYPR02MB982898B8E8EC0513EF55D44083EC2@CYYPR02MB9828.namprd02.prod.outlook.com>
 <CYYPR02MB98281A2314A718EC3841464583F72@CYYPR02MB9828.namprd02.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CYYPR02MB98281A2314A718EC3841464583F72@CYYPR02MB9828.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/30/26 10:22, Selvamani Rajagopal wrote:
> 
>> -----Original Message-----
>> From: Selvamani Rajagopal
>> Subject: RE: [PATCH 2/3] dt-bindings: hwmon: pmbus: Support for onsemi's FD5121
>>
>>>
>>> One of the problems here is that the chip datasheet is not public,
>>
>> Agree on both points. No datasheets on our website. And chips not available through
>> distributors. Little
>> early in the process. I am working with our product team to see how to move forward. So,
>> there will be some
> 
> Guenter,
> 
> After your question, I realized that there is no point in merging this in kernel until the product is available
> with distributors. I don't have any time frame for that. Sorry for the inconvenience/wasted reviewing time
> for the team.
> 
> Is there any way, we can mark this series "abandoned" or "on hold" for an extended period?
> 

I marked the series as "Changes Requested", which I think matches the state.

I could mark it as "Deferred" or "Abandoned", but none of those really
reflects the status.

Thanks,
Guenter

