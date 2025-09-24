Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA9F2D7DF1
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729343; cv=none; b=RwN5s+dc8EDKRzRRsw/ZVfyjtuOHPtSjK6MYgUBA88MtW8nayZLMDzQ7tCYxLTnEhGhAnsoE+OlNQVRI+igwlsHF1gB9MNn8CwM31nFA3octfkfmhoZQMhR6vQNtifzlw0vHY+4NMVNKp8gueClk/IAZ2wT6RiCb52W9R/fSsW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729343; c=relaxed/simple;
	bh=zJ7d8s1rwiyu/J8jcfkv+3+IBbAvrY+XyNKu2L48AY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KEFY/kzTgeGsT252wIK07SR2FXf61I60l+kV+daqLdGxweJHOXlAhMhbPVBABQyiVWQz2rqvq32cTOXcpshWrM5dzWfsMokZcmZ8ZspMGGaBGrQehdF+aB/FJEDn0cVXuLcKfv6LIGJCZ7DexqV/7WMoWb36/jfSCRtKjDeAKFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gN7U/AVW; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gN7U/AVW"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3306d93e562so6288747a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729341; x=1759334141; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=MJG+A4b4XGXvAmd5Cy9/fRi1nZfal1btirOi0rjtmwE=;
        b=gN7U/AVW06C95IwAEwISbRHUjlkCMrktpGGlaqX076k7gRZ053ykfpluxH7DdZ2VrV
         WRPFHuYpFe5ACEq+58X7wgqdIT36zj3/D6pUYUbJbSiGL7lKjTrTQa+Mvt+Otfn17Ov8
         AcrqY79ueEDdXEbD6cFLXsWfgsPIhElnZxsOsF8DT+WUCDSizKa2CKTLA0F0IuDlknu2
         Qjcqs25alYoOga0aWJEe8D/T2DP0XJH4kkDEEpEeDUiJizTem5V0fY2dOoOOBO+04p4g
         xREfiqIvF2aEBSlj/slKpU/2vRd0U8UCZNM8PF1b6NJwQgYyNguwTdyE3XN0WvHEc3JO
         j7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729341; x=1759334141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJG+A4b4XGXvAmd5Cy9/fRi1nZfal1btirOi0rjtmwE=;
        b=vIkRQWzp3KI9dujmE+yGAZnW5avdGk0REkX00cqTAVn9a6LINT9nk0cFBT0xBEhhAS
         riEZ2VQeaUvf9Vqw35HwdXrkGBVoRbwKqhettyPGlHgDVHjVzwA6XqR0rjGI7nufk9AO
         PqkizE5eHzHuqH/gbYeA+8FhTqb1gkPuePWxIi/M6fOdGFkbf4ptvXwPad+MTTXgUndy
         XB6IAfXxXB8U/l8SpWYafY/bg4MBykbmQmVgNyYV1GGPrbbamrF7zes9aAfTaIiGOO+r
         OverlnuPA11CXW+Zzxk2nAOejv7bP0wRyUfo/eQ3dLb+wIB4PKlaiEaqDxCpQl/ziLdY
         qYnw==
X-Forwarded-Encrypted: i=1; AJvYcCXQjZUslVu3flW+SMtvptW1RUZvWXCAt24p8DT+O6mqq82IX5KyuMUE0uUrSOHrAdYhi1JbfFfhT/VZMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj7EL9TBdMHpVjkvAveVF0pidw4pQxlg4YOtP2wi5qRak0JnHG
	97IEsrPLUr4PiYNaUvKgGCsnGChO3ZM1qzjx2yYX9IeXg9VqfzGZd6vs
X-Gm-Gg: ASbGncsfXMn9XlJ5ehGIx9scTfWCZIL6P5P3+6eXbpcaibxGmOco77dE6Gxt6kRrE5X
	Q3WSJ3QeiKEihO1wiT6XIekRpmMc8KZEy6+2kfc+0O56GJBl2oRyA4V4BcS/Kzz+jreUMIZiv4w
	NF8qhu25zYKyOVQoHbc/MT8ndUXqICbr3trjWigPxnx/n99z2ZYR78fRXO+/XLluj/uIWBRmcXZ
	ZJ2PDcZ0m72TR5edyKSda9olzAAUpT7jlltNjStNANNvwZ02be9c/S4MiRBtjDaIvdDN1KWzTrS
	rhbBAv9J+ZowzCGBeEZX9lReYLdmayoy0C1N/uzY2WHVzpbE5kjmBpu/C4PMoA3ma1jqJcxgcnW
	fp45/EtGrmC56pO3tj1IWM/LoiBk6tH0rkgapIa3renBO44iBeQIh9/mTrx95X6W1QXdFozevb8
	if+xxUqA==
X-Google-Smtp-Source: AGHT+IHioNe2Al0isElzk/+bpyel9roE9gkAZO5Kg57mbX7Nlk09CM1bUoJw20y8xkQ6QsAIHRC2fQ==
X-Received: by 2002:a17:90b:384d:b0:32e:64ca:e84a with SMTP id 98e67ed59e1d1-3342a2436b8mr312606a91.12.1758729340986;
        Wed, 24 Sep 2025 08:55:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdd6befsm2778606a91.27.2025.09.24.08.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 08:55:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5162f7ae-b822-40fc-a966-c7684e5c0997@roeck-us.net>
Date: Wed, 24 Sep 2025 08:55:39 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: tmp102: Add TMP110 and TMP113
 devices
To: Conor Dooley <conor@kernel.org>, Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250915170819.126668-1-flaviu.nistor@gmail.com>
 <20250915-undefined-woozy-15e27ca89a36@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250915-undefined-woozy-15e27ca89a36@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/15/25 10:18, Conor Dooley wrote:
> On Mon, Sep 15, 2025 at 08:08:18PM +0300, Flaviu Nistor wrote:
>> Add a compatible string for TMP110 and TMP113 devices.
>>
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>>   Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
>> index 96b2e4969f78..840b5306a8cf 100644
>> --- a/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp102.yaml
>> @@ -13,6 +13,8 @@ properties:
>>     compatible:
>>       enum:
>>         - ti,tmp102
>> +      - ti,tmp110
>> +      - ti,tmp113
> 
> The driver has no match data and no compatible based decisions added in
> your patch. Why is a fallback to tmp102 not suitable?
> 

That should work for tmp110. However, tmp113 does have additional registers, and it
might be desirable to report the content of those using debugfs. Fallback for that chip
would work for now, but that might have to change later if support for the additional
registers is added to the driver.

Guenter

>>   
>>     interrupts:
>>       maxItems: 1
>> -- 
>> 2.43.0
>>

