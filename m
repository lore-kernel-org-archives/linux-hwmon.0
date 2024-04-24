Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867EA16DEC1;
	Wed, 24 Apr 2024 22:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713998436; cv=none; b=VRsTaSmb4QDWQ7fusn2rK3eVpgLg10qrRMt4Xgg/7kMe8SCJN9sDOJ2TPn6KHhq5xyn1lxo7P0odPRqekfpKMLTADLZ2MN9u47eO5+1eG6yQz1XHUIHI8r3YSCVSOovyy94isCLaAYA1SzJOm9cLPDUpoybh/NJrqpJ1aW4BnBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713998436; c=relaxed/simple;
	bh=yWTu+Ro0Q8pXAF+ytfHMy/NERfiA3bEuy3YTsdlZPSE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vrul4Z0oRWc5q/KbAtDDv2hQQ6E2tvrDCVZA9rZ518VAW61EUphai++03HT8c8eeutfJMVsvAqGsFZVBUW0F1QrZUICXccZSqhuQ+abiMLmh6iaMv17KAJ6tWS2Q4xqw+smTMkndEYNi6/nfHa0Xi4KweyfCcUaiMoXcEGkqWfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJWxc5b6; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJWxc5b6"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c70b652154so309327b6e.2;
        Wed, 24 Apr 2024 15:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713998433; x=1714603233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=i9ydyggHonmZTeHDmQ1TqtlgRqFlGkx0UVffasxxkZE=;
        b=HJWxc5b6iqytC6Lz/EqFVVosVhUCZ/41ylml3lYcJ21oPUxE4d/k5zeKRZgBGvSdV1
         rqAvAWyH6j2iz/Z0PO0ByWXSy+xOPNeg0/R5vFcqOkg97LlYLgLccO7u1oM+eXENzWTW
         o6puj0miTH8wH07AKyF6bGu7Q3z030NN9s+9lkztcTG3xAETCEKIUaksum9JDmyd7IFe
         m24VsUzvErOr495PZcEwZvO+fzkB8v1w5Wt8WiS7BH+UC9Shvr8PKpUYsZJn2Maeroo6
         D2q//b4EOPIT2OUJ03oRxrX9pVKOVmbj9KrIGt6iHVa2SY/oYk74YPE4IKwYYlGu6YJb
         qy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713998433; x=1714603233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9ydyggHonmZTeHDmQ1TqtlgRqFlGkx0UVffasxxkZE=;
        b=Rvfv8Qkc3p/hWXiYIZ7y15Px5tPoZc7VEa2tnt+q0Nn1OurmzI3sapcKQ8PRko+zD7
         Ljttq2CFwdJn/lOSJ8NGEzDhgBxEyDiy+Zf56La/OP1wR2jugU+ijOKBCKUDSv4Omkmc
         Qz/TkpZry/CAH/dbNapz2PP3rfqMbNPWlq72eHzDX4QZ+/XPdanqCm/3M66ace41vHPr
         6ydQFaFpiRwAn40cCF1T4p7xnaz8A2bTpqD9RsELZIamoL7WAIDQqz7wj6S3Zqm1ZYwp
         uSBfLX0G/yDKEdaFHm1DhyETrvW9P8j6hSS5O6f47hh1f/ZCWcY7yKGrrZY0rlJ1V+bV
         rTwg==
X-Forwarded-Encrypted: i=1; AJvYcCUp9Q08PTOTYclYRz9IAALiGLuaQJLCVExD4AJ43cBNGahL+Cerd0alY6WpSo93fBa+5+gQmwPThuFwDGcQPO+nDyDNEHKYHJDS+Q==
X-Gm-Message-State: AOJu0YySsL98fgYc5N1i22bTGI/ziAd8C9N54Xz4fV+rP2JiSYbdGOeX
	gwsn8DKtSHAh7zdtQJE1jMfRGqm/he3uJrVQRwH4hqq+qDGYeOoIAjTlNw==
X-Google-Smtp-Source: AGHT+IFOVc8IW1H5hORIApL5jVVXT+BkCpW2raxwe+1njGBDv4NUi2qUNiDcTVh8Dbdg3IQb/9a5Cw==
X-Received: by 2002:a05:6808:bcc:b0:3c7:351f:b3ff with SMTP id o12-20020a0568080bcc00b003c7351fb3ffmr4962364oik.14.1713998433520;
        Wed, 24 Apr 2024 15:40:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 192-20020a6301c9000000b0060795a08227sm1200573pgb.37.2024.04.24.15.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Apr 2024 15:40:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b717da30-1d4c-4e09-b98c-4aa41a235234@roeck-us.net>
Date: Wed, 24 Apr 2024 15:40:30 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document target-pwm
 property
To: Rob Herring <robh@kernel.org>, Peter Korsgaard <peter@korsgaard.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20240424090453.2292185-1-peter@korsgaard.com>
 <20240424220417.GA782554-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240424220417.GA782554-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 15:04, Rob Herring wrote:
> On Wed, Apr 24, 2024 at 11:04:52AM +0200, Peter Korsgaard wrote:
>> Similar to target-rpm from fan-common.yaml but for the PWM setting
>> (0..255).
> 
> IIRC, we have a map of RPMs to PWM duty cycle, so why can't you
> use that plus target-rpm?
> 

target-rpm is the target fan speed. The property defined here
is the default pwm to set when the device is instantiated.

The two values are also orthogonal. The fan rpm is fan dependent.
Each fan will require a different pwm value to reach the target speed.
Trying to use target-rpm to set a default pwm value would really
not make much if any sense.

Guenter

> Anything new for existing fan bindings should ideally use what
> fan-common.yaml defined or be added to it.
> 
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>   Documentation/devicetree/bindings/hwmon/pwm-fan.yaml | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> index 4e5abf7580cc..58513ff732af 100644
>> --- a/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> +++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.yaml
>> @@ -46,6 +46,14 @@ properties:
>>   
>>     "#cooling-cells": true
>>   
>> +  target-pwm:
>> +    description:
>> +      The default desired fan PWM.
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 255
>> +    default: 255
>> +
>>   required:
>>     - compatible
>>     - pwms
>> -- 
>> 2.39.2
>>

