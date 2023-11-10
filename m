Return-Path: <linux-hwmon+bounces-2-linux-hwmon=archiver.kernel.org@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93878C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:48:53 +0000 (UTC)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D60B21DE1
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Nov 2023 17:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B7293B79A;
	Fri, 10 Nov 2023 17:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HPzpQXfp"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4E13B7A8
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Nov 2023 17:46:50 +0000 (UTC)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5E022BE18;
	Fri, 10 Nov 2023 01:43:24 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6bd0e1b1890so1623431b3a.3;
        Fri, 10 Nov 2023 01:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699609404; x=1700214204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iorbhtxe+SuUlX9pZn59oXYfHVn9gJDUalRXUUEqouE=;
        b=HPzpQXfpovJFXzPCvoevCTAwmr5GPOfmNV9T/L2PFLcsvDJUB6x1DKjLvVfY8cF5V+
         4MTt35O1iG2kn3MLCVjhLr8AIjGOu3ECvgunp8G9FNebXCVknuzQ5gEQ1dEV2vrwhvB9
         uK7xZ6Gt+fD2pL7AMi7MWqsrXUn4/5WRiHSFITh1VO4CMTrMUOC+6AtrxqcRG/ZVna1z
         s6VBoD0a2zfFP2zTZb3u6Q6Oui/Rh0r8QwCLJSoxPPe2f3UYzF/AK4bVZ7Z3AYw2oqpP
         mawyAFPW0cJpoyM3/4tMEj5MViTsmW5O4KHndmAL23B367l0jo/kIb7aaHC11yR+k1xk
         8FpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699609404; x=1700214204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iorbhtxe+SuUlX9pZn59oXYfHVn9gJDUalRXUUEqouE=;
        b=Iie7dXPJ+c6SHtlRuFtYod38iL/pCRZE44hb9oqyDtj//9KfHZw/TTLEB1v1e07BK3
         Aji9jtIT8lckIgQAZT9pMrKr+2SpKFzZYSlKS5tAgpCfsp8L6PZ5B3WqRKxJI3gYj2mU
         +AN4+CHwI7lIghUS7uQlYIxsLqzBoh2UW5qTzB/yQTW0z9y+3VjM36ysYy8E7qRIW3EI
         LUrfUo/vAZ0dLRj8bjRkxzHQXmXUkw7i3IaMZDuZkSHfp3/Hr7RL/t2qX2SO2GZ0z2Hg
         Xu3qniqVknUrdAGEDn8E89tCw8y2jl7OZZoL/RPR6hIAgNybdW9ovumAH8XLpXmgaEJD
         4KQw==
X-Gm-Message-State: AOJu0YxcbdbOQ7Z75CJMayCJrqZ9x0oKPGNx8+aUAsLqifzJuG5cqfl1
	msfrfwfKlI+FTQPNq0GPKtM=
X-Google-Smtp-Source: AGHT+IF6iIKwi8qPcC3X/WAVbk7h0MDTocQ3QffR5jmeGKuAy6EQr9tQLUI3Nk+mN2nGhDGHW1ZJ1Q==
X-Received: by 2002:a05:6a20:e119:b0:15d:2bff:77b with SMTP id kr25-20020a056a20e11900b0015d2bff077bmr8946305pzb.34.1699609404192;
        Fri, 10 Nov 2023 01:43:24 -0800 (PST)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090282cc00b001c0de73564dsm4924848plz.205.2023.11.10.01.43.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 01:43:23 -0800 (PST)
Message-ID: <d1d7428e-ab0d-4483-b28d-3a8599cbf73f@gmail.com>
Date: Fri, 10 Nov 2023 17:41:09 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add mps mp5990 driver bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, patrick@stwcx.xyz,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20231109044844.614007-1-peteryin.openbmc@gmail.com>
 <20231109044844.614007-2-peteryin.openbmc@gmail.com>
 <f9d25b19-ef26-480a-ae47-60dcba704ee5@linaro.org>
Content-Language: en-US
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <f9d25b19-ef26-480a-ae47-60dcba704ee5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Krzysztof Kozlowski 於 11/9/23 16:56 寫道:
> On 09/11/2023 05:48, Peter Yin wrote:
>> Add a device tree bindings for mp5990 device.
>>
>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>> ---
>>   .../devicetree/bindings/hwmon/mps,mp5990.yaml | 41 +++++++++++++++++++
>>   1 file changed, 41 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml b/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml
>> new file mode 100644
>> index 000000000000..bfd0cf7d3470
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml
>> @@ -0,0 +1,41 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/mps,mp5990.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Monolithic Power Systems Devices MP5990 Hot-Swap Controller
>> +
>> +maintainers:
>> +  - Peter Yin <peteryin.openbmc@gmail.com>
>> +
>> +description: |
>> +  Monolithic Power Systems Devices MP5990 Hot-Swap Controller
>> +
>> +  Datasheets:
>> +  https://www.monolithicpower.com/en/mp5990.html
>> +
>> +properties:
>> +  compatible:
>> +    const: mps,mp5990
>> +
>> +  reg:
>> +    maxItems: 1
> 
> This is missing some properties... or is a candidate for
> trivial-devices.yaml.
> 
> I guess it is fine as initial submission:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 
OK, I will move to trivial-devices, thanks.

