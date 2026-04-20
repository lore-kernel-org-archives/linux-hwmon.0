Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3D539C64C;
	Mon, 20 Apr 2026 11:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776684019; cv=none; b=ppjPTB0289tvDAlTD9urSh3aOiCmIOxx9beLiEVBOuqpK7AGLOAyfDDxbNkUcuFuZSWmrVjMpPig60pBHGGoELkTmiWXJKAXSHJ5Q/I2b/QmMKK065C4TWytw045MBen687/tbroPVbiGWBsU3RCzFQq3uelG+LneZe14/Yh6nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776684019; c=relaxed/simple;
	bh=Y4DgXLtYvcSu5NA8Yt7JLOsZgpbvLybC9EchyRb4Q6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtetEwhhPzoPYHoI1LjIat3ZJOvWSkuNrUePOMJpHYJXDJLpmgIYz5mYgT+XmfqeGcSS43RalwrGIwKUFrEBpn7z7ZxGUO5gkPoxWw7gTZehySthHbH+el+4zmIKPFRvZAeqtKwkV8dZTKzrsfxqsN2cxoFqLk3w8fFDjt/KoYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+I+XyuF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+I+XyuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEB8C2BCB4;
	Mon, 20 Apr 2026 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776684018;
	bh=Y4DgXLtYvcSu5NA8Yt7JLOsZgpbvLybC9EchyRb4Q6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I+I+XyuFRBK2+15Bmz1CqZf8z3tn1/kxml/kX4xic5feL3bauXVDJkRH5u9J1M9ku
	 yv1uDw04QkgJI1JUcEL/kpbJSdNTxb1uT7a6A4TiWXpAshZRm3+7yrkr7d2QEvgY1R
	 4piHmsEIHgmTMoQRMpoRGaQErRKqfMZuiX+V6cj7+DcFrxFMxGY2Z3JaqZQebHnLp0
	 52EGMIsRwu6lMy9LgdpBa4e4tIhjIahpSyTWqKLBIg3ArvqjM/ZXzOsz/jNRKpZr22
	 KssgLB5tA7uXag9TfXzuoSBrcEaMFqykT35yj+e+fklxclPetTyPgI15WVj8ffMkOg
	 FTrVC1fGWxNtg==
Message-ID: <8aa0943c-91b5-4a6d-bb2d-d3ac14e59d34@kernel.org>
Date: Mon, 20 Apr 2026 13:20:15 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max20830
To: Guenter Roeck <linux@roeck-us.net>,
 Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko@lists.linux.dev,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 linux-hwmon@vger.kernel.org
References: <20260414-dev_max20830-v1-1-210d3f82c571@analog.com>
 <20260414043841.1ED2AC19425@smtp.kernel.org>
 <20260416-winged-ivory-mandrill-f1e8b3@quoll>
 <7ia4mrz2ssrz.fsf@castle.c.googlers.com>
 <cb47e2b5-5da8-472f-9c4e-7414b6cddf84@roeck-us.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <cb47e2b5-5da8-472f-9c4e-7414b6cddf84@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2026 20:09, Guenter Roeck wrote:
> On Thu, Apr 16, 2026 at 05:45:52PM +0000, Roman Gushchin wrote:
>> Krzysztof Kozlowski <krzk@kernel.org> writes:
>>
>>> On Tue, Apr 14, 2026 at 04:38:40AM +0000, sashiko-bot@kernel.org wrote:
>>>> Sashiko AI review found 3 potential issue(s):
>>>> - [Medium] Incomplete Regulator Schema
>>>> - [Medium] Missing Hardware Capability (Interrupts)
>>>> - [Low] Devicetree Best Practices Violation (Node Name)
>>>> --
>>>>
>>>> commit 20a4d8dcd2f3344ac22d7d2e974bae1ef57874ed
>>>> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
>>>>
>>>> dt-bindings: hwmon: pmbus: add max20830
>>>>
>>>> This commit adds device tree documentation for the MAX20830 step-down DC-DC
>>>> switching regulator with PMBus interface. It allows monitoring of voltage,
>>>> current, and temperature.
>>>
>>> Sashiko devs,
>>> Can we drop such comments? They are useless - we know what the commit is
>>> doing, no point for reviewing tool to say it again.
>>
>> It's the format which originated from initial Chris Mason's prompts
>> and as *I understand* it's purpose was to make sure the llm is reviewing
>> the right patch and more or less understands it. Idk if we still need
>> this, but at least some find it useful: e.g.
>> https://github.com/sashiko-dev/sashiko/issues/90 .
>>
>> I'm planning to do it configurable in UI, but for emails I can
>> only make it configurable on per-subsystem basis.
>> If there is a consensus amongst hwmon maintainers, I'm happy to remove
>> it for hwmon (in several days).
> 
> I find it useful. Please don't take it out. Maybe there is a means to drop
> it from devicetree patches if that is what devicetree maintainers want. Fine
> with me to drop it for those, or to drop devicetree feedback entirely if
> that is what devicetree maintainers want and if it is possible to separate
> devicetree patches submitted as part of a hwmon series from the actual code
> patches.
> 

If there are folks who want them, then it's fine, don't make exception
just for me. I can skip first paragraphs by default :)

Best regards,
Krzysztof
