Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17AB3C278A
	for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 07:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782371145; cv=none; b=NQ2iZNcK6kdqqwBnxbjmnZYlwwqhxJOJLC57Z3HlAJcdk4Tt3wSXGzpFtG2cX2C5umGXd4XFAFZDotGuNn1nJ8lnxTeJlFaD5Pio7S/wHozXeR66abzqWi+JBrcmBmZe+3do4M4w6kJGr9ZUPCSUNq+AbcWDFH6dwDY9fUORp3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782371145; c=relaxed/simple;
	bh=hMwm8OC6yMV7o6k5gEjXCIGVhLhyVKJEh/qwAVYMJDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GlXnj+oq8GjTeEh0Q5WrSehZXPyQRWSpV9xu6mDjAuIwCUKEmrSFFGoZwBKZGvgz9AefqEjAEy5o15DT8ctMG5AYSM7Q+P2SPVlkWaVK2YYmBomeH9NndmK5bt2koujK09RpcR553tci2FPmlGvPeO8IvCP1wUXPKpl4/Z0WAHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjGa/KDT; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjGa/KDT"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ad583dc41eso1860092e87.1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Jun 2026 00:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782371141; x=1782975941; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpu3IC4RSA2zDkdsuH0CS1/1RfLLmW5/oNEdfMnmxUI=;
        b=kjGa/KDTab7ZHSnmJiwCEfT9thordCzwXAsK6WjDJ6nO8gQJtu7E3aMtdgw9grXakZ
         bqHhoAQs9BKoAdFB9bdnnQ0rFphHeXshPfRmZx07hBXT3dw1tVRoHYfw5fDAYrJytNNb
         K965hKhwDQzh2G9bHsbTfIA9sDDU+2/qEAfR3dVSRmsFQ/mfRDBrayq46jQFhRV7VIXI
         6rXt4hqMbsxY6altS3ptbYrKqZoMvIPFY5SxNjyiLU4RI4pfc86alkqSsmdyF4KlZRA3
         t1+F+8B91m42b6s5zg0FE0eZAGvlxMpWk4ij3bMOCPCn67AJm2mYFyCabNjcpkdDGRuX
         vwrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782371141; x=1782975941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpu3IC4RSA2zDkdsuH0CS1/1RfLLmW5/oNEdfMnmxUI=;
        b=T6qNB7mIOIQtD7Mki68RSplW7PDa5fXgSII05Y0sxGKraZbfySSLmFoRv0nwpEvxRZ
         eiTRl6IB0geR2fOTfDp0JczWuu0GeuW3xqvJvk+YeRGZsvT/grj2QDawAeWi18VLXgYU
         bzwhF5rdqzfmUG4cGwYD0kIYaJx7dU8C0tPYgyopfW3A3wGyqJmADwy83QUjuQHhKKvA
         K0rG5/NPWiNmq4dq7awWR02Aq9MBv7XOhFkBP1ypfTKb/Go/7Lmqt93qLGtqviHZ4CWc
         MQTadAKV2jUrKyibvf2vLlJu5h8T8H5H9KQvfPGfR7P4qC+3GnvTcI8gI4aOjrbcgAG6
         cslg==
X-Forwarded-Encrypted: i=1; AHgh+RqOSvznxcRldQZpFQymoRna1F23NSyrLaDdY6LqFtA0BFxIk3254U7RzhBA/bTOWW405AcWHPzJhb/0EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4hTMpXIvCm5cmBHRRbcpX/TjT7v47PHkCS8hToV4K1rzoR9uM
	oKVYgAlfvqy5vxnxzYXbfO6TzbGWQUBnXkdNCplcf9K3rj+RVX2uAPgf
X-Gm-Gg: AfdE7clJhazXZldmG31m/fhmJzzpllZJrFZOpwG/PN1n1GNaGgDQIWC27jyIjBDZQLZ
	qvkMKXciTbo3p1LTnZNZwNdb9ejVxxc0PgQa/JwbRKIFE4HZ77XruWVuodwj+5GeKHLO7hCsP0e
	DbI5fjtSHdIPhC02T3wylWCciZozJtMEBwsytGefeIeR/eosxHX/otIv7i9qHzCs03IxUeKNgVE
	/wMdJlKTFH+0/Nzf2hGECW40dQr36U9E2TJhVe4x4bBHZWX7d1DSmdj2y3GNEJ+ZyNdnPM7SBeP
	k1jLfMD8RPFMIuT+xJMPhMPR2KHuqr/eCOQx+UgnPqhNOto+ZzoClmgSk83/LkqDXPPxgh1ALnS
	JrTnX0wHLCh+UEik1v9QUoQqz3+zDK42f8dffUrEDfgn3dTQSrNEu/fIdDLjqwVN34WnwJhKnWv
	xFcS63mWcR+qwQYuQ7qDL6zg==
X-Received: by 2002:a05:6512:4405:b0:5aa:7779:803b with SMTP id 2adb3069b0e04-5aea1f2a590mr336006e87.5.1782371139184;
        Thu, 25 Jun 2026 00:05:39 -0700 (PDT)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6954a538sm2433685e87.7.2026.06.25.00.05.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:05:36 -0700 (PDT)
Message-ID: <bd9419aa-1a21-4ca2-990b-ad1bebf5c9c8@gmail.com>
Date: Thu, 25 Jun 2026 10:05:35 +0300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: adm1275: ROHM BD12780 hot-swap
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Matti Vaittinen <matti.vaittinen@linux.dev>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Wensheng Wang <wenswang@yeah.net>,
 Ashish Yadav <ashish.yadav@infineon.com>,
 Kim Seer Paller <kimseer.paller@analog.com>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Yuxi Wang <Yuxi.Wang@monolithicpower.com>,
 Charles Hsu <hsu.yungteng@gmail.com>, ChiShih Tsai <tomtsai764@gmail.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <cover.1781591132.git.mazziesaccount@gmail.com>
 <d63c4df5e9df845bc4f94b4abdcd068a23929974.1781591132.git.mazziesaccount@gmail.com>
 <20260617-uptight-sexy-hippo-f4bc62@quoll>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260617-uptight-sexy-hippo-f4bc62@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

I think I (almost) missed this review... Sorry for the belated reply.

On 17/06/2026 13:28, Krzysztof Kozlowski wrote:
> On Tue, Jun 16, 2026 at 09:35:35AM +0300, Matti Vaittinen wrote:
>   +
>> +  Datasheets:
>> +    https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_switch/bd12780muv-lb-e.pdf
>> +    https://fscdn.rohm.com/en/products/databook/datasheet/ic/power/power_switch/bd12780amuv-lb-e.pdf
>> +
>>   properties:
>>     compatible:
>> -    enum:
>> -      - adi,adm1075
>> -      - adi,adm1272
>> -      - adi,adm1273
>> -      - adi,adm1275
>> -      - adi,adm1276
>> -      - adi,adm1278
>> -      - adi,adm1281
>> -      - adi,adm1293
>> -      - adi,adm1294
>> -      - silergy,mc09c
>> +    oneOf:
>> +      - items:
>> +          enum:
> 
> 
> s/items/enum/, so:
> 
> oneOf:
>    - enum:
>    ....

Thanks Krzysztof. I am always so lost with these bindings. Giving the 
concrete suggestion(s) helps a lot!

> 
>> +            - adi,adm1075
>> +            - adi,adm1272
>> +            - adi,adm1273
>> +            - adi,adm1275
>> +            - adi,adm1276
>> +            - adi,adm1278
>> +            - adi,adm1281
>> +            - adi,adm1293
>> +            - adi,adm1294
>> +            - rohm,bd12780
>> +            - silergy,mc09c
>> +
>> +# Require BD12780 as a fall-back for BD12780A.
> 
> No need for the comment, schema is quite explicit.

Eh... I know it is explicit for one who fluently reads yaml. Not all of 
us do that :| (See my reply to the previous comment...) I am not sure 
the comment hurts - while I am sure it helps occasional binding reader 
like me. Can you please reconsider keeping the comment?

Although, I am not sure if Guenter suggested me to drop the compatible 
for the bd12780a and only use the bd12780 - or if his comment only 
applied to the i2c IDs.

https://lore.kernel.org/all/751cd5eb-104f-4445-a6d2-8119ad5d5660@roeck-us.net/

Well, I will keep the bd12780a compatible and drop the I2C ID unless 
something else is suggested. Again, the BD12780 and BD12780A do have 
different hardware properties (at least in I2C slave address selection 
pins), and while it doesn't really matter for the Linux drivers, the DT 
bindings should ideally be generic and not Linux specific.

Yours,
	-- Matti.

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
