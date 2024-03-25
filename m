Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B466CDDF
	for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 18:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711391360; cv=none; b=Le+5cHS9r0HEmptlP9nIEPTaZMyaNMLJntXt2sCFkhVTHFOOHmIVhQXcOXR0EwM3LTAFfW6Al7lXa4jFYPOrqF1r6gzBwnpvwfbjzKJpKiHggOvSTmlCW78D80DXSOpBauClj96qJ93lpAvEmnERq8YnR48aZMIWth4Sk5L+qkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711391360; c=relaxed/simple;
	bh=RKemoSCMJmay8Q4AAWcS4fkiVyKlawD0gqq7MpzU3xA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kzZ88DvLS74NEXICod2kCJv/EwB6BLeAh0Iqyoi0LomTCz6eKPegFLWTa5p98Y7MnRoOGOapLYMm1I4/O6jnA7eeS7ovQ5Kt9WVJzZh/JYibeO2NcM6KZozP4IWHtwezE+acQDaBlm2sADEphvaNN6ucI3LJfrQZZb9CdaSD0Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGmOYzoa; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGmOYzoa"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a472f8c6a55so403122566b.0
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Mar 2024 11:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711391357; x=1711996157; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pAf52300GzUarxXXk9Ah4vdY1BazR7olcwFpy4xuyN8=;
        b=uGmOYzoahnigSubnS4z0Q33FbVMNPD+F3KOHmZD/ZtPKJaYjaNSD+edGdZn7o3cwqo
         Xn9JYVPH7yasPcq2AXdoxwLSYpsyzMXh38Rj7o9nSVZcK9H98pNb3oCcvlkfyMapCln8
         iAavj7j72Egf1X2yTx9CW0w3xK/hNgr2EDzrA53fAXPjPuEn8kZh+5zBu9uP3LqF6XFa
         Ko0rYKMWO48b+8LvswR2n0O5Q1XRUAyynRQL0NZXYkZ28WN0wEREHMt21tO9oHcAUca2
         NgjoLnOKHrsrRxuDEJ6m+0YE9I3W0p59iDYeJVnyNHPvOw51Snr8IgXFpV/6xbFpq/lW
         O1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711391357; x=1711996157;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAf52300GzUarxXXk9Ah4vdY1BazR7olcwFpy4xuyN8=;
        b=wtDWVcQF0aogLwS5VDhwx+Jr99bzU5rtEO38GZ6iTaGFrDmor2wcRrRnTNBZSHjmyL
         SptumGpcsq/4mnVSTHPxbrXHGq1OXcSkj+qtajI3AixtZ440EV6PSvrISEs0d+WEJH5l
         5Xgm13BnQfTHOvkDjHACb1JQ0DwyfmCiNkl/Z7mDHGwZb52lLgEiDIFKMTFflGLNbi48
         a1xw3U1sE/d6u3rtCRC/IsC+1NKKkaN7nnnzwiJLhE0iWJs4pdwnlSofXqlAYjbZl12R
         GBhJjUNFNfVpXqrJ4RioiMsFCj3VdwkND6+mLPKdrgk7C2k4jRkfpJXQXoHeGuMzHW1m
         IFWg==
X-Gm-Message-State: AOJu0Ywodk5e8xGw0RdQr5FRYo9nD3GBz8Pg0ozAvwB4w7KYsdu0S9ha
	jxenkCK6yJl3mmTWb3SJFul6aa0a3nDh9Z1l5de7sKDtZTL63YKdIzSsgrVNtV8=
X-Google-Smtp-Source: AGHT+IGLvdFI2xcWRHN9AndBFm3I8fBOsHTHr9SHXzEI2Si+U8/C2HY6fwDf6c2+uUbZ6rknoo+pIA==
X-Received: by 2002:a17:906:a06:b0:a46:8856:e6bf with SMTP id w6-20020a1709060a0600b00a468856e6bfmr4710589ejf.44.1711391357316;
        Mon, 25 Mar 2024 11:29:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id i1-20020a170906a28100b00a4668970f74sm3327413ejz.108.2024.03.25.11.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 11:29:16 -0700 (PDT)
Message-ID: <e1102a00-0c94-4d35-8de2-1173ee417bdc@linaro.org>
Date: Mon, 25 Mar 2024 19:29:14 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: hwmon: Add NCT7363Y documentation
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 baneric926@gmail.com
Cc: linux-hwmon@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net, jdelvare@suse.com,
 kwliu@nuvoton.com, kcfeng0@nuvoton.com, Paul Menzel <pmenzel@molgen.mpg.de>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Bonnie_Lo@wiwynn.com, linux-doc@vger.kernel.org, DELPHINE_CHIU@wiwynn.com,
 openbmc@lists.ozlabs.org
References: <20240322081158.4106326-1-kcfeng0@nuvoton.com>
 <20240322081158.4106326-2-kcfeng0@nuvoton.com>
 <171109961635.307786.7810067768607811171.robh@kernel.org>
 <22fcad13-dd9b-4e9a-90aa-d20fb78e6a0d@roeck-us.net>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <22fcad13-dd9b-4e9a-90aa-d20fb78e6a0d@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/03/2024 18:09, Guenter Roeck wrote:
> On 3/22/24 02:26, Rob Herring wrote:
>>
>> On Fri, 22 Mar 2024 16:11:57 +0800, baneric926@gmail.com wrote:
>>> From: Ban Feng <kcfeng0@nuvoton.com>
>>>
>>> Add bindings for the Nuvoton NCT7363Y Fan Controller
>>>
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>> Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>
>>> Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>>> ---
>>>   .../bindings/hwmon/nuvoton,nct7363.yaml       | 66 +++++++++++++++++++
>>>   MAINTAINERS                                   |  6 ++
>>>   2 files changed, 72 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml
>>>
>>
>> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
>> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.yaml:
>> Error in referenced schema matching $id: http://devicetree.org/schemas/hwmon/fan-common.yaml
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-0: False schema does not allow {'pwms': [[1, 0, 50000]], 'tach-ch': ['']}
>> 	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-0: Unevaluated properties are not allowed ('pwms', 'tach-ch' were unexpected)
>> 	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-1: False schema does not allow {'pwms': [[1, 1, 50000]], 'tach-ch': b'\x01'}
>> 	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: hwmon@22: fan-1: Unevaluated properties are not allowed ('pwms', 'tach-ch' were unexpected)
>> 	from schema $id: http://devicetree.org/schemas/hwmon/nuvoton,nct7363.yaml#
>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/nuvoton,nct7363.example.dtb: fan-1: tach-ch: b'\x01' is not of type 'object', 'array', 'boolean', 'null'
>> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>>
>> doc reference errors (make refcheckdocs):
>>
>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240322081158.4106326-2-kcfeng0@nuvoton.com
>>
>> The base for the series is generally the latest rc1. A different dependency
>> should be noted in *this* patch.
>>
>> If you already ran 'make dt_binding_check' and didn't see the above
>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>> date:
>>
>> pip3 install dtschema --upgrade
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>>
> 
> I am a bit puzzled by this one. The patch has a Reviewed-by: tag from Rob,
> but then Rob's bot complains about errors. hat am I missing ?

The warning is a result of missing fan-common.yaml in the tree used as a
base.

I checked now and I don't see warnings on next or v6.9-rc1, so it is
safe for you to apply it.

For the record:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

