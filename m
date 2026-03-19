Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CCA3EC2E9
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 18:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773944602; cv=none; b=vEVQV6HrkdowXNiOr7oKdKF5UozJgOVDYUN+i/2HtZEg/VVAf/Nchh9DQZQ++4U575iX0XZzjoWxus/gk3EKsmU1CiYUZ+HVghfijppR9OBGvHZvT5cYgpH3Mtsy64B+nUrrP8ItQEBUhRUrfH0SRq8cYqTRWAuIEiFyJUvHxF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773944602; c=relaxed/simple;
	bh=cPOb8/xTdP2RrHOSA0gkabiMHfB3ej3yzKgE6o2qi1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMUFsxsdc7XEwxJnqVyM8uMn9UDtMKgAvAqx3CUY5k3yEkrPOV7rDq0U2POUIMQW//esqdaVrd4q5DWyE/ZcUosMoa/Qora6rYQRqaOCn8oivBmsdB3xUi4jiNIJmfgzQo6SoXdQqjXrZJYGBMz45OsGOEJJpzWl2CZZb0bi4HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UXESp9nN; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXESp9nN"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-127380532eeso3330316c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773944600; x=1774549400; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mXmpYx5FvbdQdUVERyfihydPyXAGjQF34GKm5VI1Sts=;
        b=UXESp9nNjj6MoCR8y2X1kBguoLWY+fubt41riduNP6GA2xPvPZTlij7dzNrcbFn21A
         FHUkgi6tGy8EXB04FJ8w1mSIVBjMDpsabSdlf7yJhEbMUR6hteU1tZjeIELW9rPlBHAs
         +FEohmXcrNkwQq7slA+F/vVzoH1QkssUiQVgRVGiTRqYZNcNsMcE2dt0R1+IlayjP9Mh
         kDwfS7HMCTznZlHezkEXDf6mPactSY+9ZWpSMOVjXwCTxhyVXEIEk2WuHZd3qJhBFIng
         Wi2I/ciwkUAgTnoWi59KxZ7cp1bLfHwtXBsGDGNzI4Vw0pkqk/ulU6RFgAUsWOcL9L23
         kPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773944600; x=1774549400;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mXmpYx5FvbdQdUVERyfihydPyXAGjQF34GKm5VI1Sts=;
        b=Ot8XvcBp1swxBZZH2lBmxXhFFyqOr09zjUjUmoVjD50YN5a2SR62Rocu8JtSX7vfty
         Rh/yjBwHhYqmh1+/CTi9nsBLKY29cDqEhebwN4B8h1Zt/DvX7yHkBM9dc1Y/tE6wx+zU
         Tu564r8YwU2F6vk828rGMneHs8egax44w8NyLnGWnGTh1JUjJts6X0MmlNwJhVbAkIpV
         Ah9fbxBcAM3rJoLt85UfqM/lumRcb/4phYCTO4c2BH11ALN88XOxG0iVSNNlPeoIXoIs
         PTz3gmg63YKwYhW2IveeLR9m178iSXn+mQik4v30gabAhh7wynAKBK89RFiP3srgjCAZ
         kxXw==
X-Forwarded-Encrypted: i=1; AJvYcCUAKsZs7vqMxHRUtBQZpAVtxAHkC9R6yFOL1f79CyZM+NTYzPZvOP2qGa9902SpSZHfzfCRk0HN8+CtIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM+YTF+edv4LOCjlWeOUIGUa2Em+4N2jEVapcTYtF2tiY+Y67r
	j9sQ37SvZFh+YSu4MtvvW7gXnd+GLxzQNzrmFAJQ7rET7GIFa3WyQ1jq
X-Gm-Gg: ATEYQzxt6OLijbiHtfp2ChDTbNYtf0TdEX19eppJZv8dBDWz/qkcNT/Ks4BjW5cA6is
	q2/iXj6LMsNBT1kl2iLXbPoY+F/xmZjZFZUKj4ppTIymPS0yVm2bA7C0zRlUKTO9g3GEvQkneyL
	XrcshZa5tZAqWS6XCd0KM2bcs4XuMhgvHk06sD04BMuondgUoh7DyIbvm9Q158zPFRgAFq+iK54
	5iZ7vrbK+4OLjeExb6CyGbc3N39QJ0U7L4X7u8fPsV9eUIAGs07SZbFSZU0SdCPlHD5Eq8Api4T
	MbZv8mx91WuIj/H94bWxJzNP64dTqjvyxWlMeTwFc9nvvEk+0R3bfZdRmNXUPlNH80/NkXPs5MK
	Q8LWtZD00z3vaKRdmEO4w7yvPeJupqqUjY8McK5F/2kKZtAwwStUZY9kI31BaoDnBN9plNpPwcS
	aiv5017B4V96YAC9FL815DYT+PCB0MTjOy5oFQk7LRxdgJfgkZ9BUP2G9av9dGy2BllQ1M+Ki2
X-Received: by 2002:a05:7022:4590:b0:122:153:d161 with SMTP id a92af1059eb24-12a7267f80bmr69519c88.17.1773944600270;
        Thu, 19 Mar 2026 11:23:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129b4127b7esm11303312c88.9.2026.03.19.11.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 11:23:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <630e8ccd-e2e6-4d2b-9689-d55e0210e518@roeck-us.net>
Date: Thu, 19 Mar 2026 11:23:18 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
To: Drew Fustini <fustini@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <7f043ae1-c863-4884-a2c7-710a8d9d8771@roeck-us.net> <abwsv3t1jdWJ7sZf@x1>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <abwsv3t1jdWJ7sZf@x1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/26 10:05, Drew Fustini wrote:
> On Tue, Mar 17, 2026 at 08:55:05AM -0700, Guenter Roeck wrote:
>> On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
>>> The G and J coefficients provided by T-Head TH1520 manual (which calls
>>> them A and C coefficients and calls H coefficient in the binding as B)
>>> have 1/100 degree Celsius precision (the values are 42.74 and -0.16
>>> respectively), however the binding currently only allows coefficients as
>>> precise as 100 milli-Celsius (1/10 degree Celsius).
>>>
>>> Change the multipleOf value of these two coefficients to 10 (in the unit
>>> of milli-Celsius) to satisfy the need of TH1520.
>>>
>>> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
>>> Reviewed-by: Drew Fustini <fustini@kernel.org>
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> Applied.
>>
>> Thanks,
>> Guenter
> 
> Hi, what branch is it applied to? I don't see it in next-20260319, so
> I'm thinking I should wait on the dts patch.
> 

Sorry, I forgot to push. It is now in hwmon-next and should show up in
next- in a couple of days.

Guenter

