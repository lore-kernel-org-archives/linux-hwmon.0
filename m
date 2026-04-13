Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734E01548C;
	Mon, 13 Apr 2026 07:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776064344; cv=none; b=l4v4V2CJX7D1sbcto3+CNGaCxmrTyphXE+OJWW0mR+UkhE/eyHjjQpuqSt/qzcrBN8qIXnjx5W5Eis0Aerft/JfB0IbOxvQ1xomB4hxOrryFZH4oOGPu+SH3f2cu6+3dl8/9d72758+5a7azpJ+chAwwVWtaBKhClVyCyAN9wa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776064344; c=relaxed/simple;
	bh=Je9I67TMZRFa5F4jEzG3suDHtGOpO9v8Y49nsC7AZdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJntiJ5NOm+JBPIiaRQy34Rm0p/qL+pOxR9sKiB8jCkK6fRvf/MxY2vlrHxtqDkJn92kD0/P6UqNJZ5KxF227+Ls4DS4lMASklsVjA9ZZI8+CjaQmDJfi4XitPtPH+HRm2PQtBK79QOGR4PfezVUdHtlQRBZgIAvOR489i/h8hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XPGkuZWy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XPGkuZWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A1EC116C6;
	Mon, 13 Apr 2026 07:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776064344;
	bh=Je9I67TMZRFa5F4jEzG3suDHtGOpO9v8Y49nsC7AZdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XPGkuZWy6O5T8LbyD0JamhEEc93sl06YpUPsULSiHohQbcr5a36pFxMUoyAdwzeaf
	 uKWEfDRYz5UDxkg4yfGtU4xjm1PI3yjxLHH5udIZ8GPPIABI+HTwT5wuC0G8bLtqKY
	 q1IuE7fYOeivEQQPN/WLrQODWnf+Vq1mhHPY+Q+jN8SGWfvGr53zfMETsbRAzgw352
	 vzoHYmfUq8wu6IAtquOfIkJ8bH1q+HS5G788PNp+S1D1gazi9yoabcG96BwEqGBr7y
	 XWNai/nwNoM5bprwgR73APnsWhPlooDrE5RPR1EOmX/aDAU7WlIZ/d3/8bZO7jv1wr
	 fglENMOpg9pcA==
Message-ID: <3d199d1c-066f-4947-8956-c135fb9ba24e@kernel.org>
Date: Mon, 13 Apr 2026 09:12:18 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
 alexandre.belloni@bootlin.com, conor+dt@kernel.org,
 devicetree@vger.kernel.org, ebiggers@kernel.org, krzk+dt@kernel.org,
 lenb@kernel.org, linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux@roeck-us.net, miquel.raynal@bootlin.com, p.zabel@pengutronix.de,
 rafael@kernel.org, robh@kernel.org, sakari.ailus@linux.intel.com,
 wsa+renesas@sang-engineering.com, smangipudi@nvidia.com
References: <d62130c6-c503-479d-99d8-b4f0f0582a4b@kernel.org>
 <20260413065747.31834-1-akhilrajeev@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260413065747.31834-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/04/2026 08:57, Akhil R wrote:
>>> Isn't I3C needed for SPD5118. Otherwise I understand even less from this
>>> rationale - why I3C is being enabled here?
>>>
>>> And before author asks what do I want to here: no, it is author's job to
>>> convince me to accept I3C in defconfig. Not mine.
>>
>> BTW, all this was asked at v1 and author did not improve the commit msg
>> beside giving quite broad/unspecific "Vera".
> 
> If I am not wrong, the ask in v1 was to specify the product which this is
> getting used - 'Vera' it is. I do not know why you would think it is
> unspecific.

I already said why. Because I Googled it and Google told me it can be
"architecture". And no, you do not use SPD5118 on architecture.

> 
> As Thierry and Guenter mentioned, the lack of policy and 'mix of both' in
> the defconfig makes it quite difficult to understand what could genuinely
> be convincing other than putting down every little detail or do a trial
> and error.

I think the main problem is that people forgot that commits must answer
WHY you are doing this. Now my assumption is that people sending
defconfigs do not understand why they are doing it, therefore they
cannot explain "why" in commit msg.

Look, find me in following nvidia patches any answers to why this change
is needed:

https://lore.kernel.org/all/20260409131340.168556-7-pshete@nvidia.com/
https://lore.kernel.org/all/20240829134252.49661-1-jonathanh@nvidia.com/
https://lore.kernel.org/all/20240509215808.126217-1-bwicaksono@nvidia.com/

I understand that I can clarify what sort of answers to "why?" I expect.
but lack of such clarification is not excuse to not provide ANY
explanation in commit msg.

Basically it is logic like:
"Uh, I don't how to explain this change, why do we need it, why is it
good, why am I doing that...anyway, let's send it!"

Why doing something in the first place if one does not know the reason
behind?

Best regards,
Krzysztof
