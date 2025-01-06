Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B021C69D;
	Mon,  6 Jan 2025 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736176001; cv=none; b=LLHAhN6gX88CuaJ25S2lSZNgOS988XxLz7TWI+12uN41sLMtrCfKie8u59Sfu63+JiFS+/nLS+poLDxfLpaEILPqR8cwgC9a2GLDpguDIqfgiwpR/Lt90Bt0Ah591aH/ym7W9aJLCR8/REJO3SWL6iOQhi2hCayFomztJhNcm3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736176001; c=relaxed/simple;
	bh=7MrQJ3r6mSbPKuckh1m+7uu5zztQ0hqcka0Kr5b/qxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BMK0wc/9GzbpyUrkGRxoBgDGRjgnZUJb2A7ww4xAZFpGp8QVv4WcNy74k65CDojzo5YWEMf9AEvHC7Ia0uN0ssR5y12+nl0t60iiWLg7vIWr1bO10gsvw+2jA4p+hERcXEgpDGPZC22K/myaroDXprgQ0fwlFLDBGo9YbH8lI+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuSczR4D; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuSczR4D"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso16905694a91.1;
        Mon, 06 Jan 2025 07:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736175998; x=1736780798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VJKEJlulI18/Qi+7k18S7rwm+KabCNcrOyoabZEd+kE=;
        b=DuSczR4DgAr7q8WoYZhBKE4mhLlsVa1B7vVuMnRRC0E7UjtkjQt0w7gJcgXgp9SFUo
         HniXJb97BT/kgkyANZCul+QjFP+JBKdBpDe9H+onYfr1IIRnrN+hDZIfQE5VdD5wSNkl
         ssAeKC8WIlkQnseDh0SudEyRbsY3VXiNQyFkxa6DBdkubHplCniksoDaPQVy8DbjgGzA
         haRiaZDXEetkTaKHaG2IcERgRfobBFjEZPHrSAY+4bGbdpJWZEZewXfssajC6t5Dm/hf
         h20LcdwBsErhvs0DuUVM8s9fDgfZ1LcZF4H+q9qzFTI9LcckvhaxUPBoSnws3hzv3/bZ
         k4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736175998; x=1736780798;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VJKEJlulI18/Qi+7k18S7rwm+KabCNcrOyoabZEd+kE=;
        b=o3eFyZ9YH+MvVGm1rW1RNowGb/lNZ8U/8oIH8nqL1b+vUhi2K9zFsA+lEAPKB6Dxdz
         FYj71DC2cLqmpq/fp2Dv+BBW4E+tv3o2CGq5/7xEjA8ud8Y6Z2fldeXfQfppcrjQNrTx
         WIaWhoiFhULSjzKlh2vXy3WErc2WcW7fOtQMsJLMw9Ns9HCLMn6n+gzw0Q9NI9BgMOfm
         7LYSXqttaWKapklGt8UA3L4oQSOhDiVp0DLSCVgBY8i/Cg8HF/pop4ncG9Kv/euHJ+Tl
         3Br6gCWqO3U9byhnaiDgOlLKACrR6+BCmVOfyCtk0a0PYXrM7yh57AM+FmnpmcGbV4yS
         kjOg==
X-Forwarded-Encrypted: i=1; AJvYcCW2hdjRvf1qIYsBE7yPJwhFCt6RsaucRC655sE9i2t6DM7bIImDemWOdQ5Tgtn9X5/1hx4fzc4qglQ+@vger.kernel.org, AJvYcCXQMVzUga8uvMIfWFBbOW1p8yNFSzmiZO9msP51Sgcg22C/cLfhe1f+GMraiejLvp8aKUtp9Kj+8i4W@vger.kernel.org, AJvYcCXg1hwrBsJnw43Kzz3G/yBYN4PZx53B86629kX2wdcn3MgFipeV0SfkX5QOn4ra79+0ZuCvIJ9j7cwwUys=@vger.kernel.org, AJvYcCXqu6g3YrSyTXpHueO+Y94nuoL9vRcOYntveJ7NSOTVBMTZSGtjE+1pDxBKmpcfCRb4GQJT87EegbKrCxy/@vger.kernel.org
X-Gm-Message-State: AOJu0YyPJKhomYYrHmS9Gq9dTvvA8eEf+PNPSkilr0luwGtnLVY0rOmy
	TFkNBYBElGza7/84RzIMhJtJKRGVoLOnXrIgIDa/jcKnHEBYck6K
X-Gm-Gg: ASbGnctADF2IlZpq2xYckwKZsb3go43QUZivoRr6ZB/7oWbTwZCAnQT85nXubV3Y4KO
	kYpaKdJI3KokzuoZgthZYaAlN7pALFuiiakxWx7hjRUZGw48+l/o7xOnM0bE/W6tjhLF6PfZTCP
	xS0cSxmViQGJVu0zPoJkCXWAoW8vBZSyTDuFIKwK8BP9AD7Gvx9U/QZdKCDsrf1M5zuWDxX0zhO
	59z5I9oY1B8utcu3FgpMPS1zibZPLMnmudH9PCnK81quWmQSC2Kk/TcWeExsNeJTjq3rtCPvPzJ
	U2ueuwrqs4bPtkW8JbTeIDm9HaCOfA==
X-Google-Smtp-Source: AGHT+IHMQMZX11RrJfAJxnEk1Lte1C88F3XpNBYl4858wPY4LUsOrJ1ayMydlamti3jAVqcYAItK0Q==
X-Received: by 2002:a17:90b:2d4c:b0:2ee:aed2:c15c with SMTP id 98e67ed59e1d1-2f452ec376amr77569031a91.28.1736175998177;
        Mon, 06 Jan 2025 07:06:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca028aesm292623325ad.264.2025.01.06.07.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 07:06:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b3d86db1-cea8-4a42-9401-6fe3291e727e@roeck-us.net>
Date: Mon, 6 Jan 2025 07:06:35 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: Add INA233 device
To: Krzysztof Kozlowski <krzk@kernel.org>, Leo Yang <leo.yang.sy0@gmail.com>,
 jdelvare@suse.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Leo-Yang@quantatw.com, corbet@lwn.net, Delphine_CC_Chiu@Wiwynn.com,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250106071337.3017926-1-Leo-Yang@quantatw.com>
 <20250106071337.3017926-2-Leo-Yang@quantatw.com>
 <abdd156e-0c9b-477f-877c-0309c84c9d5b@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <abdd156e-0c9b-477f-877c-0309c84c9d5b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/25 02:50, Krzysztof Kozlowski wrote:
> On 06/01/2025 08:13, Leo Yang wrote:
>> Add TI INA233 Current and Power Monitor bindings.
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
>>
>> Signed-off-by: Leo Yang <Leo-Yang@quantatw.com>
>> ---
>>   .../bindings/hwmon/pmbus/ti,ina233.yaml       | 57 +++++++++++++++++++
>>   1 file changed, 57 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
>> new file mode 100644
>> index 000000000000..2677c98dadd1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,ina233.yaml
>> @@ -0,0 +1,57 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +
> 
> Drop blank line
> 
>> +$id: http://devicetree.org/schemas/hwmon/pmbus/ti,ina233.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Texas Instruments INA233 of power/voltage/current monitors
>> +
>> +maintainers:
>> +  - Leo Yang <Leo-Yang@quantatw.com>
>> +
>> +description: |
>> +  INA233 High-Side or Low-Side Measurement, Bidirectional Current
>> +  and Power Monitor With I2C-, SMBus-, and PMBus-Compatible Interface.
>> +
>> +  Datasheet: https://www.ti.com/lit/ds/symlink/ina233.pdf
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - ti,ina233
> 
> This does not fit existing ti,ina bindings?
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  shunt-resistor:

Should probably be shunt-resistor-micro-ohms.

>> +    description:
>> +      Shunt resistor value in micro-Ohms, Please refer to the actual circuit
>> +      resistor used.
>> +    default: 2000
> 
> Which schema brings the $ref for this property?
> 
>> +
>> +  current-lsb:
>> +    description:
>> +	    Calculate the Maximum Expected Current(A) / 2^15 in micro ampere (uA/bit).
>> +	    e.g. 30A / 2^15 = 915 uA/bit
>> +    default: 1000
> 
> Missing ref, missing vendor prefix and missing actual explanation what
> it is for. I don't understand the description at all.
> 

Also, the unit is missing.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        power-sensor@40 {
>> +            compatible = "ti,ina233";
>> +            reg = <0x40>;
>> +            shunt-resistor = /bits/ 32 <5000>;
> 
> Drop unusual syntax. Please take a look how all other bindings and DTS
> is doing this.
> 
>> +            current-lsb = /bits/ 16 <1000>;
>> +        };
>> +    };
>> \ No newline at end of file
> 
> You have patch errors.
> 
> Best regards,
> Krzysztof
> 

