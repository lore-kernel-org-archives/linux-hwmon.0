Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A163B1036
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596017; cv=none; b=XkiMMlyjHzryTIsp8rTbSxaxiowP/WnZfzv2v1FVae0v0jvAiFeSgQMC6y2stxbmZvroG5qx0SY/RQ4TtZ/R1JrDECldV2mnxaKxvzUaL7Qyr8IwbwKOtkjQOg0yWpkvGxYlIO3dKV60cOORKblPHvOAdAn20z3tcc1uxJNepdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596017; c=relaxed/simple;
	bh=LHxGHDQg0A8g0ZoFxTIcO/DG9cbc9wUb2DfSBybA7C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDKIRct6WLc5TKcMMVo9quJrM6RCEJX/mbii0qOsiKSu8P7eiEhNt1HIYsNlYznl/K7avAdn0asHLLQzLCKkOEfXOaQ9qYuCO5UwmB9tIBLXC5PwvxLwVEidOtUEtI50EZ6NUhVhkAaF2WLstdbqtMd0ZFElnUq8Bu75PRZcpz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyJMqtK4; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyJMqtK4"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c8025500cc7so4053214a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 07:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778596015; x=1779200815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mVwixBMlzgK8411ArAJ0OyYAcRwgADMyDeeatOBedHg=;
        b=gyJMqtK4yROvZ8QgiDbHcIlJ6bGW4JhMm/VQU95vqnblfSmBSHJYs5dTc2hgOf7En0
         nWxacDxcbWJaCmORlMHOWp8SeCPkvNXT0e0VzqikxlAlR6xShAzkgFlvhoOqJKWnd4Cx
         FcDIhM9/GtdsGnS/oNSfYFLyjn0zaAsTne7SJtHcGcKHJv0fbJS4uvp2tl/lSduDPRCF
         Bds1odYJTrSeRPXyfEbksStcLME2pMOhtQzUUCZ2JIzjzUwXdu4zKce+XjKub2BsTiz5
         RiBBStv6SNPrXkWRT2+vEFHtm/yr7dw+hOz3Q44iivxA0hIupDzY0gbLsDMU3ee8c30L
         Jyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778596015; x=1779200815;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mVwixBMlzgK8411ArAJ0OyYAcRwgADMyDeeatOBedHg=;
        b=punQnMIVqob6yKBdjpkLtWuwKaiDsbhJmLGFJ4+/cMoUdF4rnCdwNJjkcKP6zZ8FiZ
         D9o/M/nqrJlA8ycNe8HQXDhajFESMN7q+I4EOSPOz6A2wZuLRXl/kH8jsN2OBLhv6rPy
         A4+85uwrKqIMWkLsGRndBtiLYJDRqOr1qB+n0mh63j7hTP8k8QiA5uN5tkkGksu6g7G9
         qYHz4t/OLvQuDsIwsLMDGg63D4LAhIJSdL+JPjCI2h8kKGPtCpJ+SoJqgrYlDj4WDWLA
         uYLeIABjQgpWH8Z+hnb7g1CztL8XUnQIiX7QPOvrrYfOLgU1NV3/Gwmkqrh+GQTqCd+T
         Tw5w==
X-Forwarded-Encrypted: i=1; AFNElJ9kal43BmCCrgabCgfF0m8HDGxIH+2cMQfwl2TP5OFETALNan4aEmNMAcoZS8q8JxdW+Rhw6wBfVUh4QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/9Khs8a9k9rpzhkDbGva0MnYSfj69wN4n4ulmB3jpSeNqRtpA
	WZXAJn7kYl2W4tG1lL5+8sAqAtNkvMUG5G1ge2/hFsJ1/cqqBPsJFbrA
X-Gm-Gg: Acq92OHSQqDoW2shR5A+/x0uWmTNzyKOrkkqVI+aMveFkdaQyP8sMCCPj00lu7km5Dj
	RIwk+mUSOlMmAtsZ+DQB+7LtM+Ga5+kOOivgZjgtrm/RhG1s0BXUeHiPXR0m4tJ2TQBVTlsUWwS
	D0BK8VgoVdQstCU1vxndi6xTlTDz+p686WzgyKi+EXQ/O34GSJzaHtK/DbVY/lWtij2gEmvfLHD
	4gYlekhWbi1lqnZ1J5+3+r5RGO6YS/VePG1ktiw1JebH3r25NuM2H5NRa5F/5looxdLHjhlN+ux
	lcNvJ7E8Ffq3X5Y+rL8sZQ5bDcXcqbBg/GcKUejRGxWqRXSqyhVV/NCB4z9YnUqQu7vKRQUXlMw
	dvxZS4Zx/xuLI24z/a4JT5WIGsg67ZAGeVSjMAeAp8uheBimzjrmbCkHLgrX0LX9UWoMg0Gqf8O
	3zcOWsKgBPqRBDwiyVy7IDRExUhggphd9hRkji5TDq7VZqQTNZ58ejo7SgMb5nGUOHgawd8dMG
X-Received: by 2002:a17:903:1ad0:b0:2b0:a980:3687 with SMTP id d9443c01a7336-2ba79291460mr327409235ad.3.1778596015206;
        Tue, 12 May 2026 07:26:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d2700dsm141284675ad.2.2026.05.12.07.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 May 2026 07:26:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c4082788-9e2f-4108-9d2f-13648bf4e5bf@roeck-us.net>
Date: Tue, 12 May 2026 07:26:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
To: Huan He <hehuan1@eswincomputing.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
References: <20260430064107.1598-1-hehuan1@eswincomputing.com>
 <20260430064444.1615-1-hehuan1@eswincomputing.com>
 <20260503-brave-bullfinch-of-innovation-942914@quoll>
 <4339b90a.6169.19e1b798c90.Coremail.hehuan1@eswincomputing.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <4339b90a.6169.19e1b798c90.Coremail.hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/12/26 02:16, Huan He wrote:
> Hi Krzysztof,
> 
> Thank you very much for your detailed review. We appreciate the feedback.
> 
>> On Thu, Apr 30, 2026 at 02:44:44PM +0800, hehuan1@eswincomputing.com wrote:
>>> +
>>> +  label:
>>> +    enum:
>>> +      - pvt0
>>> +      - pvt1
>>
>> No, label is user-visible name. Can be whatever user decides.
>>
>> Please read writing bindings - instance IDs are not allowed.
> 
> Thanks for the clarification.
> I am planning to update the next revision as follows. Would this be
> acceptable?
> 
> YAML:
> -  label:
> -    enum:
> -      - pvt0
> -      - pvt1
> +  label: true
> 
> required:
>    - compatible
>    - reg
>    - clocks
>    - interrupts
> - - label
> 
> Driver:
>   static int eic7700_pvt_create_hwmon(struct pvt_hwmon *pvt)
>   {
> -   struct device *dev = pvt->dev;
> -   struct device_node *np = dev->of_node;
> -   const char *node_label;
> -   int type;
> -   const char *names[2] = {"soc_pvt", "ddr_pvt"};
> -
> -   if (of_property_read_string(np, "label", &node_label)) {
> -       dev_err(dev, "Missing 'label' property in DTS node\n");
> -       return -EINVAL;
> -   }
> -
> -   if (strcmp(node_label, "pvt0") == 0) {
> -       type = 0;
> -   } else if (strcmp(node_label, "pvt1") == 0) {
> -       type = 1;
> -   } else {
> -       dev_err(pvt->dev, "Unsupported label: %s\n", node_label);
> -       return -EINVAL;
> -   }
> +   const char *name = "pvt";
> +
> +   of_property_read_string(pvt->dev->of_node, "label", &name);
>   
> -   pvt->hwmon = devm_hwmon_device_register_with_info(pvt->dev, names[type],
> +   pvt->hwmon = devm_hwmon_device_register_with_info(pvt->dev, name,
>                                pvt, &pvt_hwmon_info,
>                                NULL);
> 

This would try to register a free-text name for the hwmon device,
which would be unacceptable.

There are lots of multi-channel devices out there. None of them
have those problems. Why do you insist in free-text names instead of
using, say, "reg" to distinguish the channels ?

Guenter

>>
>>> +
>>> +  resets:
>>> +    maxItems: 1
>>> +
>>> +  '#thermal-sensor-cells':
>>> +    const: 0
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - interrupts
>>> +  - label
>>> +  - resets
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    pvt@50b00000 {
>>
>>
>> Node names should be generic. See also an explanation and list of
>> examples (not exhaustive) in DT specification:
>> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
>> If you cannot find a name matching your device, please check in kernel
>> sources for similar cases or you can grow the spec (via pull request to
>> DT spec repo).
> 
> I will update the example node name from "pvt@..." to the generic
> "sensor@...". Is this acceptable?
> 
> Best regards,
> Huan He

