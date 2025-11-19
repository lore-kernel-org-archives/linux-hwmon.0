Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79162FE04A;
	Wed, 19 Nov 2025 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763543844; cv=none; b=NkcmYwiolcXWlBwBGvduwzCk3MH8oOgSNY1jIz/Wi1obheqHvIpPkG9ohmOS25hipEUt+i2Ru5vONPWLsU3JyVsKhl48JZONmTg4kP06UqfS5JRWsGJk0h1GQm4CcLNvfR2o25s2XoV1qAaAvxITzrj8FbiYD/b2ws9d/8nTLuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763543844; c=relaxed/simple;
	bh=3cAunmQcrmE+ScH/u7fsJaBupjtTDeGKN4sqjaO1IEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lhCOdVTSO33I6u/4caRJtfQXw+cI3evgN8DkL5p2kmDvkS1kwNJs5u8vaYsEyrosgaFmOM5qW0DF0QZja3aZRbZ/v94KZI0MiFMA0xgCH5nLlLbUYXAfnXofi2NqDBVmm/7dfgoxCWNyqlbn4BZSn5g8XeWMjbfHegCxQpCUZVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r32lf2+A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r32lf2+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F742C2BCB4;
	Wed, 19 Nov 2025 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763543844;
	bh=3cAunmQcrmE+ScH/u7fsJaBupjtTDeGKN4sqjaO1IEY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r32lf2+AS1UJa0fXO3/leUMbbFo3CJowloRFEMtGtX3g2jWSb7CLTP+JzxW/bs2hi
	 PC6FvAugHrmR0aDyX4IFORWdwaYQh9bdZ80ujoua5twgogZIjiUgRCqo/CUAMgSw3F
	 qDKEFFZuWxIqxkqAGLaSWzNlrvj51MNrkO45rOw5zHqBXPeVIQ8YaHr8P9WX/RQ2Bi
	 +N07cohi5dH3/lc8d2UzRwLDV42/9K7aLNXWmIHGWLKYuXw4bAcwkJ1odtq1TRqMRd
	 bxmK+uoNKzKllducUeVEDdhvPVU5CSgv2AeWjFaW6L6ztKRH62bKKD3Fo/5vm9+5/3
	 3HSPIv8F7Y+xQ==
Message-ID: <b37737fc-5e43-4599-ad20-73fb37c2ff7e@kernel.org>
Date: Wed, 19 Nov 2025 10:17:18 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dt-bindings: hwmon: ti,ina3221: Add SQ52210
To: Wenliang Yan <wenliang202407@163.com>
Cc: conor+dt@kernel.org, corbet@lwn.net, devicetree@vger.kernel.org,
 jdelvare@suse.com, krzk+dt@kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux@roeck-us.net, robh@kernel.org
References: <20251119-tremendous-skunk-of-science-aab7fb@kuoka>
 <20251119090618.60538-1-wenliang202407@163.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251119090618.60538-1-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/11/2025 10:06, Wenliang Yan wrote:
> At 2025-11-19 15:22:38, "Krzysztof Kozlowski" <krzk@kernel.org> wrote:
>> On Tue, Nov 18, 2025 at 07:51:41AM -0500, Wenliang Yan wrote:
>>> Add a compatible string for sq52210. The sq52210 is forward compatible
>>
>> forward?
>>
>>> with INA3221 and incorporates alert registers to implement four
>>
>> But this suggests opposite.
>>
>> Your driver changes confirm that even more - it is not forward
>> compatible. And in other way why wouldn't compatibility be expressed in
>> the bindings?
>>
>> Best regards,
>> Krzysztof
> 
> Perhaps my use of "forward" was inaccurate. I only meant to express that
> at the hardware level, the SQ52210 contains all the registers and
> functions of the INA3221, and builds upon them by adding current, power,
> and alert registers. However, these additional registers don't require
> adding more specific properties in the binding file.
> Are you suggesting that I'm missing the description of SQ52210's
> characteristics in the documentation?

This is backwards compatibility and if that's the case - driver can bind
via old compatible and work correctly with previous functionality - why
not expressing it in the bindings as compatible devices? See writing
bindings.

Best regards,
Krzysztof
