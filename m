Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44937C932;
	Sun, 12 Apr 2026 13:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776000836; cv=none; b=IbvzDYYzk3zvQlW7Fu1gDtRj1Qq/34rzOpu74epINKk0cSX4zESh6a4zAdbWhknw3zS8F2IVnGfxjtNW7NCSo/nlNceHTxf970RfWvKNrvbpbZKGd3AuXSBps99ox+h7Zgqqusf2HXw7uilP5Oyt9mk93IbIjJaIZZaq+9Oo+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776000836; c=relaxed/simple;
	bh=scSfjuZM69nzVpL4Q8vryol1tcjFhxl84aCJjNlkw+M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZYxbvtiZgUPDjvquHf/rCuBJlyQ3CWTjZYtoJIEXuAZSK1eUzi/ExUfvVA0CdITMqQ04EAcUS84fvllu1zJ8r3qBOyJQRAQshTN3rp3318xOEaPeN872tR8r6oWg7gpyTkhh747ZhldXil2ttIvyxn+8na6ISvUN/3gMSLH2lwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjdnM7yK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjdnM7yK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FC2C19424;
	Sun, 12 Apr 2026 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776000836;
	bh=scSfjuZM69nzVpL4Q8vryol1tcjFhxl84aCJjNlkw+M=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=sjdnM7yKk3w3+vX3F2/CKZmXC6zvSq3UwtS73XT7Fy0FLrsxD0yS4e0EGI4Ldz212
	 XPw9knSR7Pm7G1b36XE8RfP87CQOX6e++BTlBcrFx9YQrJ2kjNp1JNAoAoZf4c6K8G
	 izRkdXaUX64ETeTab5Oeg3GAWzdw7MCkt2ZuhlFRD9TJuiGLaYlpwTKs+EvlA17Tra
	 mA94DOPpIkPDnYu9on2AxThuWhgQcz3C4E8vtOlLc5tl2ADLK2lYehQwIa4Nwo0mz/
	 tO+z6co/14zCoH8doVebQG29y1tTc1FikvQozh2PkzedPvnVUlIkkSZxT9d89UNeYn
	 lCiwMFIRnzbFw==
Message-ID: <d62130c6-c503-479d-99d8-b4f0f0582a4b@kernel.org>
Date: Sun, 12 Apr 2026 15:33:42 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>, Akhil R <akhilrajeev@nvidia.com>
Cc: Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org,
 lenb@kernel.org, linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, p.zabel@pengutronix.de, rafael@kernel.org,
 robh@kernel.org, sakari.ailus@linux.intel.com,
 wsa+renesas@sang-engineering.com
References: <5c751739-5044-4d23-9648-8d46dd0945d1@kernel.org>
 <20260411053433.49655-1-akhilrajeev@nvidia.com>
 <d0f1f053-589a-4681-8c8f-8e4b5daec145@roeck-us.net>
 <ef05d6fd-97d9-4795-9626-e69895e5df74@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <ef05d6fd-97d9-4795-9626-e69895e5df74@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/04/2026 15:32, Krzysztof Kozlowski wrote:
> On 11/04/2026 09:20, Guenter Roeck wrote:
>> On 4/10/26 22:34, Akhil R wrote:
>> [ ... ]
>>>>>> And it
>>>>>> should bring me clear rule what I can or cannot remove from defconfig,
>>>>>> if in 2 years I come and start pruning it from symbols.
>>>
>>> I am still a little confused on what information would likely accept (and
>>> keep) these configs in the defconfig. Would updating the commit message
>>> as below work?
>>>
>>> "These configs enable the support for SPD5118 within the
>>> Small-Outline-Compression-Attached Memory Modules (SOCAMM) LPDDR5X found
>>> in the NVIDIA Vera CPUs. The Vera CPU uses ACPI and is part of platforms
>>> such as Vera Rubin."
>>>
>>
>> It is quite interesting that we argue about SPD5118 which is mandatory in
>> DDR5 systems. At the same time, CONFIG_IGB_HWMON, CONFIG_SENSORS_MACSMC_HWMON,
>> CONFIG_SENSORS_RASPBERRYPI_HWMON, and CONFIG_RTC_DRV_DS3232_HWMON _are_
>> enabled in arm64:defconfig. CONFIG_IGB_HWMON is even built-in.
> 
> Why CONFIG_SENSORS_MACSMC_HWMON is weird? It is part of the soc using
> the defconfig?
> 
> The author here has troubles bringing any arguments why his drivers
> should be defconfig and keeps asking what do I want to hear. If one
> cannot make an argument why a change is needed, then maybe the change
> should not be sent?
> 
> It's the job of the author to convince why the community needs this
> change, unless it is obvious, ofc.
> 
>>
>> It is kind of difficult to understand why those are more important than
>> the temperature sensor on DDR5 modules (or the temperature sensor on DDR4
>> modules, for that matter).
> 
> No one discussed this. I have no clue what is SPD5118 and commit msg did
> not explain that. Did not even provide accurate user of that.
> 
>>
>> I don't know what the policy for defconfig is, but just based on that it does
>> seem to lack consistency.
> 
> No wonder... people write poor commits and send that to upstream. And
> when asked "why do we want this" they got stuck.
> 
>>
>> A separate question is if it is time to enable I3C in default configurations.
>> I'd think so - more and more chip vendors support it, and presumably they would
>> not invest in it if there was no demand, but that is just my personal opinion.
> 
> Isn't I3C needed for SPD5118. Otherwise I understand even less from this
> rationale - why I3C is being enabled here?
> 
> And before author asks what do I want to here: no, it is author's job to
> convince me to accept I3C in defconfig. Not mine.

BTW, all this was asked at v1 and author did not improve the commit msg
beside giving quite broad/unspecific "Vera".

Best regards,
Krzysztof
