Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A7D2FCE07
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Jul 2025 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752770556; cv=none; b=KuJFGjkx46dwVG4KfDgU3I//SGoj441OTGUhqqslrEIJdDOd6wMbNZS40witUoFccczUlFBO1KVkJ9iwHt/dvWp/2aGjg6PxAZkN/IJK0hQZk2aON2Fkd5NyswILMZGz0TT410kofsTfQZ47qI2QnLlgIEv6FjG9tqbNXQ6Tc3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752770556; c=relaxed/simple;
	bh=pwzmXDwJ4zUMLHJozgllRu/mzzAcAPdj9GK36HNatug=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UQPJItkGu2Tugv8/I5LznLawEwCcpy2RGiIS8XHHr/7fey1pgANpyjGfczykao4m+bt6V25isAXCmEmJW/Zx6ag5RItXJqbhRzrVG0yfch5RB6Ha6V4cZ7TvrhiYc3FyCCx+ojFLM64Li+f02h/vRzU38MAjBN/3jrVyXv14OB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=m8fg2IKA; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="m8fg2IKA"
Message-ID: <f180b5ac-131f-474a-be5e-70787972a772@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752770541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I57bGWW9HkB2BD1T3Qt5kgqxhjLDrfo2Pvi/xORSNyE=;
	b=m8fg2IKADa4qU9gIaAHsRTO2qJ11Wiblg7fZdxmnZZ4N9E9weBx+d5aaL/MFgkSieN0onb
	yceX37QtsrrwWTo4DeQQ97vjAE35CGMvLn16a+4kdvA4SmG7GHO/jiR72M+xcEGi/Aees7
	qyybYucPF9Oo9NtlJ47+98oKRR3xKGs=
Date: Thu, 17 Jul 2025 12:42:13 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/7] iio: inkern: Add API for reading/writing events
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, linux-kernel@vger.kernel.org,
 David Lechner <dlechner@baylibre.com>
References: <20250715012023.2050178-1-sean.anderson@linux.dev>
 <20250715012023.2050178-3-sean.anderson@linux.dev>
 <aHYOuzdQ_jSKA898@smile.fi.intel.com>
 <8bb7d291-f94a-4e96-b3ec-93fbe06c8407@linux.dev>
 <aHdwzFk-688ASRx2@smile.fi.intel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aHdwzFk-688ASRx2@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/16/25 05:28, Andy Shevchenko wrote:
> On Tue, Jul 15, 2025 at 11:42:05AM -0400, Sean Anderson wrote:
>> On 7/15/25 04:18, Andy Shevchenko wrote:
>> > On Mon, Jul 14, 2025 at 09:20:18PM -0400, Sean Anderson wrote:
> 
> ...
> 
>> >> +EXPORT_SYMBOL_GPL(iio_event_mode);
>> > 
>> > Can we move this to namespace? Otherwise it will be never ending story...
>> > Ditto for other new APIs.
>> 
>> Never ending story of what?
> 
> Of converting IIO core to use exported namespaces.

What's the purpose?

>> >> +			if (scale64 <= INT_MAX && scale64 >= INT_MIN)
>> >> +				raw64 = processed / (int)scale64;
>> > 
>> > Do you need the casting? (I mean if the compiler is dumb enough to not see this)
>> 
>> AIUI 64-bit division is not available on 32-bit platforms. The cast
>> ensures we get 32-bit division.
> 
> I put specifically a remark in the parentheses. So, the Q is if the compiler
> doesn't recognize that. Can you confirm that 32-bit compilation without cast
> is broken?

inkern.c:(.text.iio_write_event_processed_scale+0x14c): undefined reference to `__aeabi_ldivmod'

>> >> +	*raw = clamp(raw64, (s64)INT_MIN, (s64)INT_MAX);
>> > 
>> > You already have similar approach here...
>> 
>> Well, I can spell it 0x7fffffffLL if you'd like...
> 
> Nope, I like to have named constants instead of magics, but actually are those
> castings needed for the clamp()?

Apparently not. The checks in __clamp_once are only for matching signedness. And
the ints are promoted to s64s when the comparison is made.

--Sean
