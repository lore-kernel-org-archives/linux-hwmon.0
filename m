Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A8E3A9879;
	Wed, 13 May 2026 19:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778699012; cv=none; b=VjHL7ompIiEfFICoiGoNEbSt85pizS0wojrLMjfPOqKLGd0df+TBMgp7SwEV6Xh227mFbZwuXBl08BykCp1qh8sVhKOBmzjYgGRtmRfoqZsfASr7C5nmqb9yjT7saWRHAqg7Qj7Bj36ehgYrwxbNYhil6bZrrooWDcERt/zjIAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778699012; c=relaxed/simple;
	bh=R8J80YvmLhMOmBdZFT7puP70blpffHrZpnD5bteDKgo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLeShJapiHYTdO3u88DaLHfr9b4g9XDaFD+4tlNSd1wAtyGn/1Jrj4jfrpIT873Q46j2Tohqrr1k8JUSCzXxiB7MkyO9KwO1lLOXrZyzElPBN2DcYUKybdzGFzxX9xMCK2VW54O/M3t8ErTt+oNxWQKGFSCAEAJQARkImfsdF2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+RVWSyw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+RVWSyw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B774CC19425;
	Wed, 13 May 2026 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778699012;
	bh=R8J80YvmLhMOmBdZFT7puP70blpffHrZpnD5bteDKgo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r+RVWSywHJxGE/cZLc7Lesx0+2oZhSbeRCkq+UJkVIMSNWSTUxbrwaUud/rODy21W
	 sPv2FJ1MOsuivckimOLNMJ50EFYs/XNwA/NW4k0f1bF+f7MD8WIwWDdaJkU+RXgk/f
	 aZ5K8aiaRiRKPSxHNPaDUHFE9wB8RUJfxnpUwSBiO9oKNZdmYnWhFThE0334vdtvKL
	 9WUltDJLrDILxq2hffy/SxYiEv45zYaeYG5qYE3SPl/N9XhNbZwL7LdBFCeez0VtgN
	 dn6oURINTCCnvpYYDBLPhyxHv5G/AnvBtFzHT0VgSK9MLeSjE32B1JsZYX+6yKzBai
	 4Rg7M0KqV5lHg==
Message-ID: <d525673f-4b7e-43c3-af6e-39b679036914@kernel.org>
Date: Wed, 13 May 2026 21:03:27 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
To: Huan He <hehuan1@eswincomputing.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com
References: <20260430064107.1598-1-hehuan1@eswincomputing.com>
 <20260430064444.1615-1-hehuan1@eswincomputing.com>
 <20260503-brave-bullfinch-of-innovation-942914@quoll>
 <4339b90a.6169.19e1b798c90.Coremail.hehuan1@eswincomputing.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <4339b90a.6169.19e1b798c90.Coremail.hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/05/2026 11:16, Huan He wrote:
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

From DT ABI point of view, that would be fine, but as Guenter pointed
out - it is not correct for hwmon.

> 
> YAML:
> -  label:
> -    enum:
> -      - pvt0
> -      - pvt1
> +  label: true
> 
> required:
>   - compatible
>   - reg
>   - clocks
>   - interrupts
> - - label
> 
> Driver:
>  static int eic7700_pvt_create_hwmon(struct pvt_hwmon *pvt)
>  {
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
>                               pvt, &pvt_hwmon_info,
>                               NULL);
> 
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


Yes, assuming this is some sort of sensor.

Best regards,
Krzysztof
