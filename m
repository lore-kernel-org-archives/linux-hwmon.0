Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10192494FE;
	Mon, 29 Dec 2025 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766992926; cv=none; b=fsqNMQ/Gl2J0gGWmFhCKBhKaWRW2UWykxMXSkj7youuevCqA39yi/YJ1bk3ZqXSmbaYY4uXd5LnbMgP96NPShzL5kY/LQNCgdTfdgfi7Xnwl/X8xjw0z9D4nMbn5aKR2CAz6cOrz8kvZndBKMl3eGm/365RGhBTpwuUSD2zV6/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766992926; c=relaxed/simple;
	bh=SxdXLPAWz3KHwvb0HKuudiCfH3vDRUQB1x0W+Jkuy0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWE+k/jaEa3P+wweVJVJDGBzd9ZGBHVlwr4eYTlNxA9vEAftKD0/NM8vDUtF8P6NKGm6Qo0s+zHLhieMAeHPlmdByXV3KGFdVIm2N9kYsLUKcAQXctHp8ZydisYK+VndrOEGgPRs6E2j6DWEcn6kIbBR6C6J38HRRahEKw9p4vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obgoeUrq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obgoeUrq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1FC4C4CEF7;
	Mon, 29 Dec 2025 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766992924;
	bh=SxdXLPAWz3KHwvb0HKuudiCfH3vDRUQB1x0W+Jkuy0s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=obgoeUrqMXVrucgONq4BEX7wy1ZvGZKmz6idLcSfmcFu1vUoq/g1X7j+UkRTsfmDH
	 6KSGwUAFndLB4/vRnJN9XkuSKbkrynM2qlUXYbFxPNg4zhPHwAbDbwJEKsQkb+Qow5
	 FkGQ4iRZQHWia2GeCmNobV4dpktuigC5P8bq0ZbpEyLr9qo8ygjITALW7jRqG+ejyI
	 ffcTMpDFHmH8wbm3dGSDxauJdKz7rTIsAjxKvaji8QhEBEk37zDkQcCzO9Q+zbYQFk
	 +V9ZX93hodhPNBqxY1BU58k70WWEO+iaFZqWiT1QRulO1fyYxb/cqXsRW9js0MSuMf
	 +Q+Zkqlx8fNNg==
Message-ID: <8690ccf7-2033-4dc3-8a4f-404a93301d6a@kernel.org>
Date: Mon, 29 Dec 2025 08:21:58 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: add STEF48H28
To: Yungteng Hsu <hsu.yungteng@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251224084821.2092169-1-hsu.yungteng@gmail.com>
 <490569f8-a434-4297-b11e-ad34ddc4ae1e@kernel.org>
 <CAFT9tykPEt+zTREF9C4AXtGp0qDh_65LjHZCK9F=NFhE-K4dGQ@mail.gmail.com>
 <06f97147-5752-4a82-9958-89b138a7d4fe@kernel.org>
 <CAFT9tynYM0u_cAqA9YPpoUp7EcVpvcwr_sxrk5K=VNMXDwBE=w@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAFT9tynYM0u_cAqA9YPpoUp7EcVpvcwr_sxrk5K=VNMXDwBE=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/12/2025 02:02, Yungteng Hsu wrote:
> Krzysztof Kozlowski <krzk@kernel.org> 於 2025年12月26日週五 下午7:10寫道：
> 
> 
>>
>> On 26/12/2025 03:46, Yungteng Hsu wrote:
>>> Krzysztof Kozlowski <krzk@kernel.org> 於 2025年12月24日週三 下午6:03寫道：
>>>>
>>>> On 24/12/2025 09:48, Charles Hsu wrote:
>>>>> Add device tree bindings for the hot-swap controller STEF48H28.
>>>>>
>>>>> Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
>>>>> ---
>>>>
>>>>
>>>> Where is any changelog? You keep sending versions but you never
>>>> responded, never said what happened with this.
>>>>
>>> Thank you for your feedback.
>>> I realize now that I misunderstood the process.
>>> I previously thought that the changes needed to be included in the cover letter.
>>> I will follow the proper procedure for discussing updates in the thread.
>>
>> There is no cover letter here at all. You sent only 1/2.
>>
> Thank you for the clarification.
> I would like to confirm the correct approach.
> Should the changes be documented in the cover letter, or should they
> be written directly in the commit message?
> I will resend the complete submission accordingly.

Does not matter, because the problem is  - there is no cover letter. You
wrote that changelog is in the cover letter. There is no such!

Best regards,
Krzysztof
