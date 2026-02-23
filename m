Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424733612E8;
	Mon, 23 Feb 2026 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771845790; cv=none; b=K5OalMRNjgELsB4n4epeDIeIK6lDOMNwh3HQKdOaVLp1QYtyX2xkwefFCPyNgSAg71AjRkgJJSrqCanYnttCS1NBL73hxjuK0NFfoWYtXMX9NGCcjBinsZb8gvpWUtEDR9AIZogd5zjQJkZNEJtxPdFKssBguU08/ZdEBvXuziA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771845790; c=relaxed/simple;
	bh=6xnCWigIQzu5vJRf6CSz1vmaj17UI0XXZhoGjHSoQOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hGExJNFkbkJZABSLuNzCIRLxrAmy65SGjolrN9WkuoNZQxNz5z8l773Ai4LytqLkZX0CoYsEl+G2Kd7NGTQYpAblkkk29mbR3ybe8fuUbrYdnKQBtzfoslDjnBKlIp+lhF8bYSt0G7QLAurr3vgTqZ9JU3RWA4lEcUlwbg3okW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pl7ySDXA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pl7ySDXA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A64C19424;
	Mon, 23 Feb 2026 11:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771845789;
	bh=6xnCWigIQzu5vJRf6CSz1vmaj17UI0XXZhoGjHSoQOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pl7ySDXAp4rtwA/P9m8i2BPL5dAuhtzjvXJIryzAhuLlDvH1M2mFoq8hF/5uZVTht
	 EU2nMSki0WllpjRe5hgIZ3/QZ2VLuDY2gMc69NgK2Tdrmuv3yTeNLrecUv3is/N1bD
	 T6z8i9iyXL7wYDEic1liEmVD1js8+Y5+trM4I/Me+pjaHMHaSM+XQ8dPqUkqD5Efj4
	 XRM4KSTL9FsTigjl7sr+DxOAt8H8pyCNoOPmPGK3sL3VdU9jj+W1bT2Szay4YITiFB
	 1+BAyf4j+5aELKvOl5ocOrYlL+uSjVU2c23FZFsytgiQhwdkF864DksSoVCGiOXWTJ
	 odJP400MYPxcg==
Message-ID: <17f4acc7-28ff-4325-b628-cf8d9307754e@kernel.org>
Date: Mon, 23 Feb 2026 12:23:05 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] dt-bindings: hwmon: add support for MCP998X
To: Victor.Duicu@microchip.com
Cc: corbet@lwn.net, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, linux-kernel@vger.kernel.org,
 krzk+dt@kernel.org, linux-doc@vger.kernel.org, conor+dt@kernel.org,
 Marius.Cristea@microchip.com
References: <20260217-add-mcp9982-hwmon-v10-0-5e0aaae6f289@microchip.com>
 <20260217-add-mcp9982-hwmon-v10-1-5e0aaae6f289@microchip.com>
 <20260217-sincere-spotted-lionfish-d7abca@quoll>
 <9a39d9f1d97eea245dd194a2db481297b92c6fbf.camel@microchip.com>
 <4a84d57c-ede6-4038-9883-42aeafce2687@kernel.org>
 <e32684ab5fd4e86ad61d2ca0e4f219fa29bd26fc.camel@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e32684ab5fd4e86ad61d2ca0e4f219fa29bd26fc.camel@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/02/2026 12:09, Victor.Duicu@microchip.com wrote:
> 
>>>
> ...
> 
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - microchip,mcp9933
>>>>> +      - microchip,mcp9933d
>>>>> +      - microchip,mcp9982
>>>>> +      - microchip,mcp9982d
>>>>> +      - microchip,mcp9983
>>>>> +      - microchip,mcp9983d
>>>>> +      - microchip,mcp9984
>>>>> +      - microchip,mcp9984d
>>>>> +      - microchip,mcp9985
>>>>> +      - microchip,mcp9985d
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>
>>>> Your interrupt-names say 1 item is correct, so these are de-
>>>> synced.
>>>> They
>>>> should be always constrained the same way.
>>>>
>>>
>>> We want to allow the user to use none, one or both interrupts.
>>
>> Who is the "user" here? IOW, can the *hardware* work correctly
>> without
>> the interrupt line connected anywhere?
>>
> 
> Yes, the hardware can work while the interrupt lines are not connected.

Almost there...

> At the moment the driver does not support interrupts.


...and ruined it. This does not matter and using it as argument means I
do not believe you actually checked if hardware can work without
interrupt lines connected. You only checked the driver. Please read your
datasheet carefully.

Best regards,
Krzysztof
