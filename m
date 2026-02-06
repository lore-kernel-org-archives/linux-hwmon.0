Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E98B2367CF;
	Fri,  6 Feb 2026 16:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770396553; cv=none; b=rK1gzTB9XydEeYbCHLKIFot2phg+v32X8AHKEJzvFNGd9s0W69eXNuGZn9+E6QaAHfnES6vPm1b6t+G7Zzzk8sxpss7b6m3R7H4mUH26xdxWKVKw+BClJtEEZCMd3uJKouBNwWm2bJh0zXwkLSBJgIU+tL/vhXycDrJKI4pAsas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770396553; c=relaxed/simple;
	bh=Yl4dSccPhR6B3kyqtOX1xwX69pXmeE87NneoQgVKVZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qksoXy7UidbIwk1GIDknvsF/hC7Ya/zXkVJabZWumIC2D1n7b3Sc3y+5QUPynrtmBhPqvrZVRAA6VvPgXH1PXwuPXvDAxhhp9n+VqU56XAOmbWg29+WT8xAGdYDB5DpvIwvOvkuFfu05UWz0bO20sKiGAj02lOLq33huHa4Im3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DrSsuIJ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DrSsuIJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48ECBC116C6;
	Fri,  6 Feb 2026 16:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770396552;
	bh=Yl4dSccPhR6B3kyqtOX1xwX69pXmeE87NneoQgVKVZI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DrSsuIJ90A7uFY7Wwc0xfQFsJbe+a/Q9JgAQFA/PXm6qoZlmbERTqHdZyv1aif9UJ
	 6pXigSlUdK6gPfl2v4iwhkYVK/3GHOrgZCsXDBO3SI0eO4m97NQIiqIHX5ZjhYw3Za
	 zk2e4oj3odNJVR1zQveWcr4B4Y+BUR9iBq00hUNLIrHTU4CnXu+w0+y60dj7HCJvKN
	 Tdz71IwMwFZjsw8uCeSL1QwuERWhbk8P+OprCmJtUgI96Hhly5CC6hOZvPEHYrQEz/
	 /xdiQB/iamKICvuu9jfnX9i+3+vmkOk9B6RTfkepET0yA5fliFsT52IrMHx89tiy7C
	 34X9mM3/UlvlQ==
Message-ID: <942d6dc7-26ad-405a-bb6a-270e2261a329@kernel.org>
Date: Fri, 6 Feb 2026 17:49:08 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: add support for MCP998X
To: Victor.Duicu@microchip.com, linux@roeck-us.net
Cc: corbet@lwn.net, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 robh@kernel.org, linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
 linux-doc@vger.kernel.org, Marius.Cristea@microchip.com, conor+dt@kernel.org
References: <20260127151823.9728-1-victor.duicu@microchip.com>
 <20260127151823.9728-2-victor.duicu@microchip.com>
 <0b3979d6-895f-4c8a-8251-d3c793385bf4@roeck-us.net>
 <595e616ad403e805ee50fa7bc57d25584949924d.camel@microchip.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <595e616ad403e805ee50fa7bc57d25584949924d.camel@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/02/2026 15:17, Victor.Duicu@microchip.com wrote:
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: Signal coming from ALERT/THERM pin.
>>> +      - description: Signal coming from THERM/ADDR pin.
>>> +      - description: Signal coming from SYS_SHDN pin.
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: alert-therm
>>> +      - const: therm-addr
>>> +      - const: sys-shutdown
>>
>> The top-level definition of interrupt-names specifies exactly 3
>> items.
>> How does this interact with variants that only have 2 interrupts?
>>
> 
> The chips with "D" in the family have the sys-shutdown and alert-therm
> interrupt pins. The rest have alert-therm and therm-addr interrupt
> pins. The conditional assigns the interrupt names depending on the
> chip.


No, the top level says you have three interrupts. Do not create bindings
which contradict themselves.

More important I am 100% sure this fails tests if you wrote proper, so a
complete example. It passes only because you made a limited example,
without properties.

No, drop review, fix and request re-review.

Best regards,
Krzysztof
