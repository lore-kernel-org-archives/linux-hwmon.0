Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27726280331;
	Wed, 29 Jul 2026 02:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292824; cv=none; b=FlYL4Lfb0PRQd9PCL7DW8P5nRo82OsaQ5t2aVIwuPHmy1nKJv3BUktcFdWCkdyQKJPmDYbi6cMnIn1qiUt92Qhjo570twDh97A7Qc0GY/NcTAO2/HtXxntdvJUXHDOT6UAg+qM0pO7euRASZD9IqWDMjpiqJ6k5HGGl3ZIXIhkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292824; c=relaxed/simple;
	bh=KzIS1s3fZWRoWbjjqvJMeglI3r0gmQBe7Qp9vydcZ2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YmnrOXZYmV69UkloCvfF/4uN1pbfRiFb9/nJLyHivDdmL4hldxJgekLwjf3fx5u99HCYQiHrkNVtw8OYR1JDJ8YW4MkdOwt0erQCTXEbUQtfbsmmTrJYdG9wlDWvJ2YB2Bq+4ViC4IZY0uvJQMjxDZlH8Ul7zVwT3xoyGj1edlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBQUyyn7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBQUyyn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26181F000E9;
	Wed, 29 Jul 2026 02:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785292822;
	bh=sbGkU0NnBDyd6f6UDfPX6v9BopWHEItfkdzxoAz16RA=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=HBQUyyn79+157Wz4uqC3HnWWiOKd2aF3n0dB/8jJ8nkvvpGbJrZ21UecpAfQUIhSe
	 qleyy3W+nLIkynq+Y08t82RSrqs2Zc8IgItpNbPr5iG/8+dOx5eD40Tvktx73bfWCk
	 hltwelQgLu0Tv8BDbQy1ZPTVJTdgGfBJ+duXEGrKDNud5FnjV6pJ86Lo5ydGXpCAdq
	 +wt3R9F8Ao6FGjXYPWYEnN3TJjPX/a6UFkKnKnV7cohlDfSoTM1ZMipzY8mwe2iSKR
	 vdWzMllT1hT9tEkb36Lf5bRwgPnWv4416rCrg6EZWJnwKibtxgUNaNBhedApY7eIpf
	 UR9rcUaGbAuwA==
Message-ID: <ab0ea905-dad9-4f29-baea-d99dc7515be6@kernel.org>
Date: Tue, 28 Jul 2026 21:40:20 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] hwmon: add Altera SoC FPGA hardware monitoring
 driver
Content-Language: en-US
To: Guenter Roeck <linux@roeck-us.net>, tze.yee.ng@altera.com,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <cover.1784785709.git.tze.yee.ng@altera.com>
 <d29d05f8bc25a89a0dbf59c8a0bb705f676a58a0.1784785709.git.tze.yee.ng@altera.com>
 <1aeec2cc-490b-44b8-9c93-64caf7f961f4@roeck-us.net>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <1aeec2cc-490b-44b8-9c93-64caf7f961f4@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/28/26 09:17, Guenter Roeck wrote:
> On 7/22/26 23:02, tze.yee.ng@altera.com wrote:
>> From: Tze Yee Ng <tze.yee.ng@altera.com>
>>
>> Add a hardware monitor driver for Altera SoC FPGA devices using the
>> Stratix 10 service layer. Sensor channels are selected based on the
>> service layer compatible string.
>>
>> Signed-off-by: Nazim Amirul 
>> <muhammad.nazim.amirul.nazle.asmade@altera.com>
>> Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> I assume that the series will be applied through some other maintainer 
> tree.
> 

I can take this series.

Thanks,
Dinh
