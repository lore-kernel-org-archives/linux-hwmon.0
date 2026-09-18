Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2938E8CA;
	Fri, 18 Sep 2026 13:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738718; cv=none; b=NOmZO+9NoVwJDWRx26kbYnQHUkKFwb6tZnW6aetRi5R2A42uxH3D19W8/mlSHyxQZ9MgIuIdwDiwGVrG1KOcITV+90b8EbP9MYgmVu/pWIIUp0UVvTYQhhsgD7gnoI+pZsZN9wT1q/jTyJ+ikdWGuJLKHoxR0/+WV9xn7DMDp6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738718; c=relaxed/simple;
	bh=uHxRfFpeeeqM0dj1pBYqYINu37TMxuN+a+TZg+JofAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k1J3i/qvh+p+oU69XfHXYAggSndgXH2Sbw/Ax8DmyUpXLex1YSRkhdI/48Xbn5Glz9Qn+0dNGcgvRg+krad/FAOztm6ByDxaLtAANLioLG2Pa8p3Q4Bl8KM8bgFZmSZ7LZAig5GDMBqBS8P6kA3JQkIcrKS5HZfDhwRj0dp+/cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFidbsMm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFidbsMm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419D81F000FF;
	Fri, 18 Sep 2026 13:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738716;
	bh=MKGYAMvXjOap74e+UNuv2FfLwh1OSEeO0iMecbj8vYY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=YFidbsMme1vbL1Pbu5WDdBTx7bbuMUuYKYZOHQcou5+9zUr18QfZDDZ8LRHiEYMM/
	 IVXEAuRddREGxRAArD9+mRc+ppJktjoJfqT3uAkaQXW8Brz97BCZtZsMO39213MBBO
	 tysBNnZGUXzdbyaJ5si/IVn0F+NG+LRPRtmCNbwIVvEvSu0PwbPotZzFxwCbWHyC6K
	 eK0qB8GVKGQSj4rAYciiMgLV5F02qO/4jxImXUbQAdKAZnhaW3D37bys/9o699Puxz
	 odWY02eK9XRozJH0Wi71yfABkHtmeBG2r8J+wNFpNIxMbbUc2LcmKbTYSsiDO1eCBP
	 CgR+6vXL0HlqQ==
Message-ID: <8f7dd986-ac78-4a87-a8bc-228fdd05e9b4@kernel.org>
Date: Fri, 18 Sep 2026 15:38:28 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: embedded-controller: Add ASUS Zenbook
 A16 EC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>,
 Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260917-topic-asus_ec-v1-0-373516d347ae@oss.qualcomm.com>
 <20260917-topic-asus_ec-v1-1-373516d347ae@oss.qualcomm.com>
 <20260918-objective-okapi-from-neptune-cbcabd@quoll>
 <92b7a87a-c086-48d1-8487-883dda7c4d70@oss.qualcomm.com>
 <372e9dc8-ec28-4d8e-a349-15145b82385d@kernel.org>
 <9709e146-0f9a-42a5-bfcf-2e5f8b49df2e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <9709e146-0f9a-42a5-bfcf-2e5f8b49df2e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/09/2026 15:23, Konrad Dybcio wrote:
> On 9/18/26 3:21 PM, Krzysztof Kozlowski wrote:
>> On 18/09/2026 14:29, Konrad Dybcio wrote:
>>> On 9/18/26 1:34 PM, Krzysztof Kozlowski wrote:
>>>> On Thu, Sep 17, 2026 at 12:54:56PM +0200, Konrad Dybcio wrote:
>>>>> +description:
>>>>> +  The Qualcomm Snapdragon X2 series-based ASUS Zenbook A16 (and similar
>>>>> +  machines) come with a custom EC firmware, loosely based on the
>>>>> +  Qualcomm reference ("Hamoa CRD EC") implementation, with a lot of
>>>>> +  customization.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - asus,zenbook-a14-ux3407na-ec
>>>>> +      - asus,zenbook-a16-ux3607oa-ec
>>>>> +
>>>>> +  reg:
>>>>> +    const: 0x76
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  "#thermal-sensor-cells":
>>>>> +    const: 1
>>>>> +
>>>>> +  wakeup-source: true
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - interrupts
>>>>> +  - '#thermal-sensor-cells'
>>>>> +  - wakeup-source
>>>>
>>>> Wakeup source should not be required. If it is, then it is completely
>>>> implied by compatible and there is no need for DT property, right?
>>>
>>> I suppose it's not *required* but it's highly desirable.. should I
>>> just drop it from the required list?
>>
>> Then why isn't the device driver setting wakeup unconditionally?
> 
> The i2c core checks for wakeup-source - I can remove the property
> and call the equivalent functions from the driver if you prefer,
> but that feels a little "rough"

This is irrelevant here. If we remove I2C core handling of wakeup-source
and rely on drivers, do we change the bindings?

Required means either hardware or software cannot work without it.
Interrupts are required, because (supposedly) it is impossible to create
a hardware with interrupt pin floating, which could be argument to move
to the SW, but compatible cannot imply them. Saying that wakeup is
required, means that something requires it while compatible cannot imply
that property. Kind of contradictory to logic, because this means device
has such characteristic but we need DT to represent it. That's odd
because we should not need DT to represent simple bool - driver can do it.

This is basically the fourth device which requires being wakeup-source,
so something highly unusual and anyway if it stays, needs explanation in
device description.

Best regards,
Krzysztof
