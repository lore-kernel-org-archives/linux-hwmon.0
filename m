Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A98C33D6CA;
	Sun, 12 Apr 2026 13:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776000106; cv=none; b=FlcwLwIg+xqZskyYLxX3YCHcobIinzkwVmM2faFw0EB5Dysjx+tnD8LZ37sKsteA6T7q3f/WkiG7dUIj+WzPlk7FqlC65ATyNKVZTaj1qgiUcK7i5gNFk/00GSojvNvnDHabeE0nhaa1i8IQkl0gSR6cd7gnybDQXG9LvEQcloI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776000106; c=relaxed/simple;
	bh=5SZyBkE6asksdQJY2MgtgFUkYXkx6F6xTXUq/bmwqKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oopsvl1rbFzUJWkbvBqqmJZbv7gPHpcjDPsgH2Umxu1L27ZJ6ePcnUqLqw0tBlAbY8GUJFYuCBwy53ih3/t3MKbEf9dL1GZMgs5syWhnwxGwaXoJNGUj/3IH+ifUtWv1B93WWtDmo8cnaIhK5H9IOT/xzji4UBVcWzb7Hy43ivw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mZQsKP32; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZQsKP32"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546D1C2BCB0;
	Sun, 12 Apr 2026 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776000106;
	bh=5SZyBkE6asksdQJY2MgtgFUkYXkx6F6xTXUq/bmwqKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mZQsKP32Gl9lZPeZBwcB9Bg1fNsSTq3NcLmaMijXOrEM9wwUZ5nTfNQxAtbYR9N+Z
	 3Ekz4U+uiqRFlCYzuzkeEVxi/5hkiiFRxp/oRptCVIe7OaIq87VR4Z9rQO7lyM/gcj
	 IEskTIDc2z8qb6Rmnse7OfzpxWHHnsWCtPdaa8w8sdfQCvILiwrXkqyhl09aQsRiZx
	 1FXUcz+Co9PH6pfadMITdszEKMeDe2DVDcfzbP2S26/Bl1QC5+k1X6lcNqV2vS/TBv
	 tVQoLXSs3P1hWC81meQ2fVjiHiiPrlb8XRXi96M6/+25XsPVU0za96yxkz0frvWVcM
	 5g2fpauKjAD0g==
Message-ID: <5751aa6f-ee7a-4031-99a8-b64f45e9084b@kernel.org>
Date: Sun, 12 Apr 2026 15:21:36 +0200
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
 wsa+renesas@sang-engineering.com
References: <5c751739-5044-4d23-9648-8d46dd0945d1@kernel.org>
 <20260411053433.49655-1-akhilrajeev@nvidia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20260411053433.49655-1-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2026 07:34, Akhil R wrote:
> On Fri, 10 Apr 2026 11:57:11 +0200, Krzysztof Kozlowski wrote:
>> On 10/04/2026 10:37, Akhil R wrote:
>>> On Fri, 10 Apr 2026 09:18:48 +0200, Krzysztof Kozlowski wrote:
>>>> On 10/04/2026 08:57, Guenter Roeck wrote:
>>>>> On 4/9/26 23:39, Krzysztof Kozlowski wrote:
>>>>>> On 09/04/2026 12:57, Akhil R wrote:
>>>>>>> Add I3C subsystem support, DesignWare I3C master controller, and
>>>>>>> SPD5118 hwmon sensor as modules to the defconfig and therefore
>>>>>>> enable the support for SPD5118 sensor on SOCAMM found in NVIDIA
>>>>>>> Vera platforms.
>>>>>>
>>>>>> git grep for "Vera" gave me zero results. Are you sure this is an
>>>>>> upstream platform? Please point the DTS using this.
>>>>>>
>>>>>
>>>>> I think this is an ACPI based system, or at least that is what Google search
>>>>> tells me.
>>>>
>>>> Thanks. Following Google Vera is either a "CPU" or entire architecture
>>>> (at least that's how they call it), so it does not have SPD5118 sensor.
>>>
>>> SOCAMM is a Memory Module. SPD5118, as it's Kconfig mentions, is a sensor
>>> found within such memory modules. I didn't quite get why would you state
>>> that the SOCAMM present in Vera architecture (or CPU) does not have
>>> SPD5118 in it.
>>
>> I said that CPU or entire architecture does not have it.
>>
>> Commit is pretty vague in helping me to figure out the things I asked
>> for in last email.
>>
>>
>>>
>>> Pasting the below from the Vera Rubin product page [1] -
>>> "NVIDIA Vera CPUs add enhanced serviceability with small-outline
>>> compression-attached memory modules (SOCAMM) LPDDR5X and in-system tests
>>> for the CPU cores."
>>>
>>> [1]: https://www.nvidia.com/en-us/data-center/technologies/rubin/
>>
>> So this is for Vera Rubin? For what is this exactly?
> 
> SOCAMM is with the Vera CPU. Any Vera based platform would have this module.
> Vera Rubin is one such platform.
> 
> SPD5118 is within the SOCAMM.

So just mention this, instead of giving imprecise "Vera".

Best regards,
Krzysztof
