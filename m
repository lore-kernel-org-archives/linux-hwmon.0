Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E31426F2A0
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 03:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781494095; cv=none; b=M3UuSyJL60FLjfmr3IZyfsmPuEYjHCHeh9jkqdTCuOiRpj08z+nvUaz1TwWmPCN8SgPn4cXeT/Y1noB5ZHrLiKjXXZ8VCsAQLlA5hhYMy61pQDuNf5nLr4rsPV3g9+ztYnGbt6Y6wWw/foM1S+qwTOSjqxCUqzMyzTP5dKJKHtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781494095; c=relaxed/simple;
	bh=R4oxdJg6MFRBM0wLUCdAy4NOHBsgcJPhFvs2qjWwp0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aM4Ueum/hGvw7aWK+zOTeF8ODlVvDZx9+anUbGkBot7tBGwYAASXwME19tnmIYk87NtZiQE3W0ngIDxW/9f76AbMCf31oVzsYAZb3bJ420yUmfYvXlDKXpF4mOT6OgVwwqWCwSL8yXVZYQI01Z+o3loMq70rco/lBEXzkuCoVAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lo+DGXOc; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lo+DGXOc"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3042a388168so2063375eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Jun 2026 20:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781494093; x=1782098893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=F48M7UJZisk3+G8pGHk9mIzYZhroQ1h8yPblS2YzIO0=;
        b=lo+DGXOc9uk2fDnlVp2FSuzA3EvZ3Qc6vjZ1HySjkqtx+iWwLpDsb9UHYZAHdT8eSz
         n29On/7vuXT6M/hpaRL12HgPL+5z+6503sw6hc4+J5yn5qYpFfLYj9Wk7zFa8ngym4Q3
         qq8U37NXHZBaoaFhlmOGldqUZe5QVv/tkTRXWA/ss19a8le+n1cmFE5KzgLCPij8fUNO
         rgZY/hndtd9uKVNRi7uuJ/O+or9dtUcOW+ZOOyN3dW4umH/HbZXklmpj6J96CHFtHpu2
         Mxmiw2jyaza4Hk2ZSl1WITtFPhWKu0ZqKzIVFScNz7+UwcyGRsEcw5R+UldkLyzEdBLp
         nEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781494093; x=1782098893;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F48M7UJZisk3+G8pGHk9mIzYZhroQ1h8yPblS2YzIO0=;
        b=JFym3yOnXLLs89n0Ral6Zm7hi9eXaJGMN/EK/aCRC926d+cALQI/Kh3GC9adWOnBJ/
         MThDjO1W3Scqyp/iMiOrShONUlByGG6B+R/C/Py9WyUxp3gcBYJYoN84hZ5QTYaY9ArU
         SEpIF1DR195tE4qQI8VYWQ7YOanMc+k+3BSrmTtEL6dxI7JQdq85/A/sc6q5gTWG8Itb
         7RUAXpnwlF50cxzsgUuqMFy4OLJEEsfqF08bxKctpww0Iq2Pp4kfX9sbl7TKANagq9Sy
         BqGwSPQjwD+KCWIWdlOUlpJMyWVqEcX/uiwBMBZH9rh8GNECpuYWl7VB7q3mmsDrYdym
         tUKg==
X-Forwarded-Encrypted: i=1; AFNElJ+N34gKvQMY0CNP0tA6Dk96LWuFZsxGX0jald2iJeTAaOS+zYjKn/IiIyvItbXErqDhu/QNgbOlVM7kwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YySU53CF8FWu7pEryvU3xUA7JM9Mr2Xs/9U62tYkIjJ2G/aQyJd
	ZyDo8LAuXX0Lubkrjpa9rhhnizzXaA/NelTz1iAVi7eNI/g4cXSLP68X
X-Gm-Gg: Acq92OFTnSkvUmcYspxLXMDJ/uO4SMSpTkmyrYvemQHLrSUHk+UPcB6Vki9hYXqfVeT
	3+qMNDDofOwHGelcazWOdgvtkLCY4I+QRs6VlipolkURdMhywlE6MazCcML3mpoSgCD7tTsHgXp
	dgeNINwfnIY1yDWgwD7g/KESQcRokj4VdYU5a98nMT5eE1IwSHH0FKICb5H4vc/HCurvciw/dCW
	Wz45HNaz+YvWTebjdD8rL6hUYOQuhfS9wW7iCAGAx40JBjUqc76ZDInWdjNn3EXb2Dg9SS9gael
	0bUjZ9wiKvmkCNbaJW8B7R8aDR8q8YmD05cr7cnSIBOSyMQjpmwsUTg7KNKR/Mp+se9CZYk8Yn/
	EkHALUdIL+OEufCapYtLHPs0EjrHk6snty830YFZTTzqbUm0dVOsZNml8gOQAFj/ghTqlY9i9Tw
	yNMk/73/nnsmp6h3uSCNWhxGR3T3+vuuul08viwhP7iprza8+SdHyNDHBjTvc1k6HjioDlXJRA
X-Received: by 2002:a05:7301:fc16:b0:30b:7bc2:c70b with SMTP id 5a478bee46e88-30b7bc2c7a4mr1067298eec.9.1781494093327;
        Sun, 14 Jun 2026 20:28:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e4898c0sm13606848eec.3.2026.06.14.20.28.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 20:28:12 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cec33844-09b3-43e2-970c-b21cb82f10b0@roeck-us.net>
Date: Sun, 14 Jun 2026 20:28:11 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
To: sashiko-reviews@lists.linux.dev, Potin Lai <potin.lai.pt@gmail.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260615-lm25066-cl-config-v2-1-59be46e67d5a@gmail.com>
 <20260615031628.ADC9C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260615031628.ADC9C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/14/26 20:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Device Tree Schema Type Conflict: The new `ti,current-limit` property is defined as a string, which conflicts with its existing global definition as a `uint32`.
> --
> 
> commit 2d0e259557c772018da03b728b427c7fa9a267ca
> Author: Potin Lai <potin.lai.pt@gmail.com>
> 
> dt-bindings: hwmon: pmbus: ti,lm25066: add current limit properties
> 
> This commit adds a 'ti,current-limit' string property to configure the
> device's Current Limit (CL) behavior to "high" or "low". It also disables
> this property for the LM25056 variant, which does not support software
> configuration for the current limit.
> 
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>> index a20f140dc79a6..53ee98e871ffc 100644
>> --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
>> @@ -46,12 +46,30 @@ properties:
>>   
>>       additionalProperties: false
>>   
>> +  ti,current-limit:
>> +    description: |
>> +      Configure the current limit setting. When present, this property
>> +      overrides the hardware setting of the physical CL pin by configuring
>> +      the register.
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    enum:
>> +      - low
>> +      - high
> 
> [Severity: Low]
> Does this introduce a global schema type conflict?
> 
> Device Tree schema tooling requires property names to have consistent primitive
> types globally. The property ti,current-limit is already defined as a uint32 in
> other Texas Instruments bindings (such as power/supply/bq2415x.yaml).
> 
> Redefining it here as a string breaks make dt_binding_check validation. Would
> it be possible to rename this property (for example, ti,current-limit-setting)
> to resolve the collision?
> 

ti,current-scale or ti,current-range might be other possibilities.

Guenter

