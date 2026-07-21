Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A0839021C
	for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643692; cv=none; b=SqQ3EUzy4JbDSFw2+zeND3ZJVY/rgPwIjT5WLYRLl24bYM2PsiJvmO1enMe+FG51G11fxxmNjtxxagWqUN3NJyIHySIoTvu+pRhrdLE+RSTzNk1g62E0B9x/JZ5C2aA4VPCvMrqHRYxz2gGNizrVEVVmG6JZPPqHCvnNIBOeOQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643692; c=relaxed/simple;
	bh=296BtLOLTbroEaj4NUdcvOSUi1U0idxKGbvQ4//hU5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mWbMOSQqCW+NKHVCCg8jXzDwPculXgABaNCYd6Po2V7BWZVaNYybiNfl20mXwuZkfiFtRs0iw2KbEhKrmqm7OaHRsUyVM5taNtMUd3Y0x88+MLQ2ZC7HAb9ynH/X/g/TWcHXZR1UWFAl9HpQtWArFZ9qzpDGPKE2fWDj8iv5zEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkUgc4my; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkUgc4my"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso7468832a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Jul 2026 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784643690; x=1785248490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VqwynvKtmc20/YbYA1Ms6kyZdYO0+BmWn3JxmKfFb2I=;
        b=GkUgc4my5xOXEv4d/hycmp2xnpZ553K/81NxYjJ0sPNUtvQNnbRBcvdMQNAOpx5uBQ
         OXIyj1ex8nedVDF/WyiMxMsIWCXW7OYg3ix7Be1X6w48OvzGqxbry4Gk/u+KRZvsVcfU
         be64rJJCbb8YAH+85iDX7yYdoWVeVPDJ51dE6SFedK1BkBulySLq3T4XGZLV4xMWLJ3/
         Xi0jsqJ7lQvChR6F1pNi5oNhw0lBV5iM5EXmWjRYZGcRVAyWgSIrP6/jMpdProCciJ8c
         QZPRsLDT2QPaba9IjWL60MB74pz7tRmWE9zk7yThY1o2ZdkdWFByL3UzQ9K+mlOq8Pd1
         uFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643690; x=1785248490;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VqwynvKtmc20/YbYA1Ms6kyZdYO0+BmWn3JxmKfFb2I=;
        b=p98EjWlZa0mfJ+kVi6I29NCqMtmDzd1Xoecr8t1u5o8RWAQAi+NQCNpjLWrSf1jvZf
         /sX+2dyozOPPDmYDsGkNZ61p6V0XbJcJEqTObU81VPuMz6J9WkWTglgH/NSnLhuDxpuD
         SsKlctR3kCPlj8xtuDx3wKyqsFf7fECDyf0LFSAJjmI50NYGNNeH5ZDkP37PadYfhC8t
         Jt/LRcVoxyarOuYejZhJ5N7Hv1BxfTlTUWbj5noXReFHJzR1ngX1QQRGtXtnC+rs1o5F
         8WPGhiArt3chWem9WJVMWHa1VFDhvBDr0Em7rXzQCONtjZegYJu6gXEJrf8ALzsHUGOt
         M69A==
X-Forwarded-Encrypted: i=1; AHgh+RpS6nlyQ7iBX+EL+3iERZquR3MPeJzMtJfnwFvmpgCb0NGQ8gsolMfgNDssRUJuUHDE/PlUko0DiAtN1w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgs4JqfLB/aVKTQT+DiX7t4PnulE3xPLJwwfv/r/dbrUPwQTx8
	rn8RsYbryNRtRza3/u3WSYZUvcey+lrTjwUjKgK1SOz4teFv8D0dz00L
X-Gm-Gg: AfdE7cl2he9bCey0f4HqzVjT/186rbpn8Qm0/VzoaH58OYfv/nGO7MzSBV3ZFHUlVQ2
	VUzVAsQad4g7WXwxDkpNWi5oPpFXcLbmUaTl4IyPAXlFi3TuzNdEDEO1VbF7Rn66VU5cUT4osiI
	O0XnqbxCRzoWy2IxqTZWf2xGtgZChq5jOiF16esHpWzFxqSFgbOLP1CvP0darS7K6b5Es2WPGLZ
	dfdE6F3jkVRfTDRnq3sjEd44gOdnHB3MPiaJLRGo5QdyoHNeztsaq/D1AL5x8m3rjMi6e4q8m8T
	eyPgVt1Kgsmf6sBM0HQ1DRwYAymjTXmqkYTFQv3/seyy5PloYl5law3PXMJbFbdNzA36cxlNYNI
	WdJ3jiZaoCcRkiLVZ32KWVUVBl/Y3RdDmLPzopeVqrqE1Jg8318dxQZWztReH7Qr/QOJi8QVKPX
	Qx+IETMgugPDwUFj9cXpGcvr787fIfwM2BB+husSco8g9p2v+tPChOhYvhVfCGlw==
X-Received: by 2002:a05:6a21:7111:b0:3c3:7cfe:b32a with SMTP id adf61e73a8af0-3c3ad7a4367mr20368132637.27.1784643689558;
        Tue, 21 Jul 2026 07:21:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fdcb09sm53997239eec.9.2026.07.21.07.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 07:21:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e19d41ed-1109-4c0e-9cdd-53d72523a68a@roeck-us.net>
Date: Tue, 21 Jul 2026 07:21:26 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: Add vendor prefix for Kandou
To: Krzysztof Kozlowski <krzk@kernel.org>, Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260715-kb9002-upstream-v2-0-2fd390383da5@amd.com>
 <20260715-kb9002-upstream-v2-1-2fd390383da5@amd.com>
 <20260721-sweet-bulldog-of-perspective-bd0bcd@quoll>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260721-sweet-bulldog-of-perspective-bd0bcd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/21/26 01:24, Krzysztof Kozlowski wrote:
> On Wed, Jul 15, 2026 at 05:08:35PM +0800, Andy Chung wrote:
>> Kandou Bus, S.A. is the vendor of the KB9002 PCIe retimer.
>>
>> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
>> ---
>>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
> 
> What's the domain or ticker name? I find only Kandou AI, so not the
> "bus" variant...
> 

Good catch.

AI Overview:

Kandou Bus S.A. (often operating as Kandou AI) is a fabless semiconductor company
that specializes in high-speed, energy-efficient chip-to-chip links and
connectivity solutions.

 From some chip news:

Started in 2011 at EPFL as Kandou Bus, Kandou AI is a semiconductor design
company dedicated to advancing high-speed, longer reach, low power connectivity
solutions.

On their Linkedin page:

Kandou is becoming Kandou AI. Our new strategy is focused exclusively on our
goal of democratizing artificial intelligence – making it readily available and
affordable.

Looks like they renamed themselves about a year ago.

Guenter

