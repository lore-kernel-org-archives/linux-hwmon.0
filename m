Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA6F355F4A
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 17:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773856154; cv=none; b=rc4h7mHjqw5wmqBbsym727z5c1K2Qksju2DPgfOHT+lzvm+3ugl03yd2DGSl7A6nCfVrDTycoekL7ZraoywRpI0zeGQD5VpJ2w2zKkoze71nOw1UfUiGdJnqPOWyWsUZ7sF7EhC4a4/4Uk3jwLw6S2PDJn4fqVAh/BbEV3UbmkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773856154; c=relaxed/simple;
	bh=7foqOo4PO1+dY1J9snRPo3pULD+nFZ65/Jc53Tf6BUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvCk2Skheg6TRYRoeiyZz9swu5jmlYaCiZhGJmUJykoghriXqPoyLI1ByvWQLvSvab6vUAWO87q0x+VceCWLYjMLMTCVfBTDTolMuimlg9ZCge/vkknuak7L2ZCcax9BmHkCNZb+xdVJlPDpgXZfbRpOqf+ZiCDtCoh4tOiNiJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2pRfzic; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2pRfzic"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2aecefc7503so438165ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 10:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773856152; x=1774460952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kweWB3MHB0sQFqv3t56LlX9dg8y07f5j3ZR4fhpqzGk=;
        b=R2pRfzicrEth/rmvQIt78s2xyxoRCQd63voZ+mMyEJnGU9WX7jxOySDIWfDcvm0JtZ
         wRgZ5vbDgCfLaw9MzbBTZWYMB+wBZvblhyZvsIl+OUFCBowxwp5I8A/lUphHO619vqfi
         S4Dnuk+2wTmhOiUsbmRDbppKWK7e6Vn61jpPNEJBnPd313pbyelMdPpv5MVpZr5V45DC
         QMbZNzwVohf/ehlo/yI8wcpqdUZH98eomckDA0+jkgMsECYAG9hXceZhQis2pgofskEz
         X776OXl+WZdaiZuLZVPiizbjnHuSh9SQTaVV4hv57DDhj2EkBj9mSFA0ELpJqLPNAyj6
         CIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773856152; x=1774460952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kweWB3MHB0sQFqv3t56LlX9dg8y07f5j3ZR4fhpqzGk=;
        b=MSNo9IWtUXzcZ8U7C1lyVpzwjxyNQX1TM9MQdDoWnbmx3bCpoctEk5uGv4K2+CAXmB
         wU+YD6JqcNQcUt01Fa3/o5tyhY3QTpWo8HNd81CuGSlEqSCRhtL9OkLy55jbVfcWb3Z8
         8jzaODaEuyw6g/eti9tezla/L0g7saeEEATfw/z0wdrUEgNkHOUrUbqBLVD9XrmlGLnq
         77Rdr2Xj/AnI36kuvmdeGJbqQkDS1eM2iNkFPopawywJ6UaN9oVI+RixuD2qTyC9kXfv
         NJ7WsX2Tuw0hpmd4NAIgnHOzG4F4be/qwNq3WK0jrBuU8rHBnw0RTgnmi1aUHbEZWqx3
         C07Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh3nmA/wq0T19OsS1cpUsE8qTwCkv865pGXatX9hnWeD2C3bb7hVPJix3tC134POJcQSqKJuaStHhrGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJCuHJIkdeAYxV86TluHjTb+hztAWKhqnfms6lJQZKyQDlfWLj
	IaOcaGbO9aRGqs+tol1NlHbwZuTT6WzzP6YHQxIA8CJ2tCULm4xTEiZT
X-Gm-Gg: ATEYQzyCynN1a1XoH3XFC87Oit7Bi/dbeU9BuhThf/llSmjumlOMr34kRSCcn4S1qIt
	v/qN3UHBXAkgdseSCHt7sba0TJKAaU303fLgo1crTBIewQTVNKAKf3NH0ekEKn2nEkllI+2g68L
	FHK8L7uq+URyzma4CoZB83tgd/c9pgZ3FAIVLrMeADDw9pMCSuzdGewyElm/+8EmZkpi+Tktpg9
	7R3dhi/5GOx9//Vce0u6Gj436LSQav6AYGuPLoWCTJFnqntRIMnt2Joj1b3ZFbY2p4c0iDHpWAE
	DQZbGiWjVH/q4SbOfRUYFv0L9gEJUBUCNPEqDfNoIT+08Enb3Y8SvakPXymlon6kTOOR2zYp2x+
	JSt2mFLzvxP4AsBeLfZPpqxHS+Gmm8CinstSMz+bQLjVoOn7aIbVH7eli4qvxvMk0HzSTYYK1DX
	yXQjmtWilaHlBfSNQUOfNqlNf4TgcfTuoJJko20ND1AG2jaMDzGfvn6XXTnU2lNCqR+gNgb5R+8
	z+6if/Bu14=
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr40969735ad.43.1773856152438;
        Wed, 18 Mar 2026 10:49:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm34123755ad.57.2026.03.18.10.49.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 10:49:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6101afc-b1df-4f6d-9e32-09b09e17afa9@roeck-us.net>
Date: Wed, 18 Mar 2026 10:49:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/isl68137) Add support for Renesas
 RAA228942 and RAA228943
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dawei Liu <dawei.liu.jy@renesas.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 grant.peltier.jg@renesas.com, linda.xin.jg@renesas.com, tabreztalks@gmail.com
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-1-dawei.liu.jy@renesas.com>
 <20260318021921.75-3-dawei.liu.jy@renesas.com>
 <9ec35dce-5f6a-454a-9ab5-e61b22796325@roeck-us.net>
 <20260318-elite-archetypal-porcupine-a5d2a5@quoll>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260318-elite-archetypal-porcupine-a5d2a5@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/18/26 01:25, Krzysztof Kozlowski wrote:
> On Tue, Mar 17, 2026 at 10:23:57PM -0700, Guenter Roeck wrote:
>> On 3/17/26 19:19, Dawei Liu wrote:
>>> Both RAA228942 and RAA228943 are digital dual-output 16-Phase
>>> (X+Y <= 16) PWM controllers. They are PMBus command compatible
>>> with the RAA228228/RAA228244/RAA228246 family and use the same
>>> 2-rail non-TC driver configuration.
>>>
>>> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>
>>
>> For my reference:
>>
>> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
>>
>> Note that technically the devicetree patch should come first,
>> and I can not apply this and the next patch because you dropped
>> Krzysztof's Acked-by: tag from that patch.
> 
> Was there an Ack? I see only one reply from me, but maybe something is
> lost because entire posting is completely mixed up (v2 being part of v1)
> so it all appears mixed in my inbox.
> 

My sincere apologies. No, there wasn't. Not a good excuse, but I got confused
with another submission.

Sorry for that.

Guenter

