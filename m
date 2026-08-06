Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A949D48C405
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 18:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786040905; cv=none; b=t5Tx33nyCqmwAOL//LB3c+VFoVrr6ARrhoBMWPkTkzttvumwpXGmCG2jxLYsigZoSRiEG1rrausConIv6fEXSz1obzoB/+GaoB062bOkzJggdZ2JU5parlgAd82XN/tEXFe237OymWAF5nDESWIpAXP6h+GVPL0pb5wcrJp7oYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786040905; c=relaxed/simple;
	bh=4NSTwNQMILqNfm4HfiRMEwkH8No0ajN8H507r+F3nYw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K8NCbI2Y+2fmzpYfUrG80/IPCLXnDhHBy7vZwmalFGUULvQBqWkefxHXdFJEdA2m6yTXvzer3xXYRt5+6QPUdafrFIKgXc5Ze7IRsT8bUXmVq5HRU19uQJc+NM8+s21ysWLT8YHBpiQ9JIoTI7hRvVohMhp+c4PXnZTIKkqi1UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=YJIMNicZ; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="YJIMNicZ"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3787A240027
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 20:28:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1786040900;
	bh=g4FxqZzpMEjSC7AkOrlTOU9WWUNxKuaVvD5DeVTjOlM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=YJIMNicZljN+YaHg+2qC2HEEVtrQtP9JeByQDBR93+U9SSj6TTGvk9tpsUA6PwWHG
	 YKTuHlBXPF2FsQVj5Sv/ZQMqrI+bvMTq65VOiBdS5Y4yj2BeCqSoKGsKTslJVDzyUz
	 VDJ8wgNW1tY2YTYnZyLij7ns2VdC2z+iC99yNjzmdjX4MCCR8BBvoXW0Z4goK+VLAk
	 N2a0gouxOBBdkMQUlogW6cAnyIQKWV8ueW2g7eQfdF8sjCyZsQsdXbOmHkQv+cZMTi
	 rKdrhgWSahRFwRdHRI3JzviimvgPyq+XLKluMJS5XHwmGrhx+yjf62Dec8LS11jspk
	 fHug4r5Rsn4gw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hGG4M3T8wz9rxG;
	Thu,  6 Aug 2026 20:28:19 +0200 (CEST)
Date: Thu, 06 Aug 2026 18:28:20 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
Message-ID: <20260806202818.5d919e3b@posteo.net>
In-Reply-To: <910065e6-8b47-4a40-9c4f-9dc4f41c1825@roeck-us.net>
References: <20260804034811.2385506-1-linux@roeck-us.net>
	<20260806173411.6be71067@posteo.net>
	<deb3db39-e8da-40d2-af9e-bdaf73b9bf3c@roeck-us.net>
	<20260806175645.5e50b70c@posteo.net>
	<f4077f39-0427-4bb9-8b6c-ddba3f492765@roeck-us.net>
	<20260806184233.44124904@posteo.net>
	<910065e6-8b47-4a40-9c4f-9dc4f41c1825@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 11:04:50 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 8/6/26 09:42, Wilken Gottwalt wrote:
> > On Thu, 6 Aug 2026 09:28:34 -0700
> > Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> >> On 8/6/26 08:56, Wilken Gottwalt wrote:
> >> ...
> >>>>>> +	s64 result = mant * scale;
> >>>>>
> >>>>> Uhm, this is a 32bit multiplicaiton, actully a C gotcha I explain the beginners
> >>>>> in our company. https://godbolt.org/z/eM6TbGG5E
> >>>>>
> >>>>
> >>>> It is, but that is ok and intentional: both mant and exp are guaranteed to be
> >>>> no larger than s16, meaning the result is never larger than s32 and will never
> >>>> overflow.
> >>>>
> >>>>>> -	return (exp >= 0) ? (result << exp) : (result >> -exp);
> >>>>>> +	if (exp >= 0)
> >>>>>> +		result *= (int)(1UL << exp);
> >>>>
> >>>> This is the calculation that can overflow, making it necessary for result to be s64.
> >>>
> >>> Yeah, it was just funny to see in the wild. It made my day. :D
> >>>
> >>
> >> Guess I lost you there. Do you want me to change it ? I could add a comment, or just
> >> type cast mant to s64. Please let me know.
> > 
> > No no, it is fine. I just was surprised to see that famous gotcha. But I guess
> > some AIs may jump on it, ignoring the context. Changing it maybe would prevent
> > noise in the future. It is like that famous mathematical "iff" term, which is
> 
> FWIW, one could argue that it is often misused in the Linux kernel.

I actually don't know. I'm one of the people who considered it a typo. :D

> > used in some places of the kernel. A lot of non-native English speakers report
> > that as a typo. Ahh... just ignore my gibberish.
> > 
> 
> Actually, any reasonable AI should be able to find that this isn't a problem
> given the constraints. Sashiko didn't flag it, and if it did I'd have submitted
> a prompt update. Sashiko is explicitly directed to check for over- and underflows
> in hwmon patches because it happens so often, so I am (reasonably ;-) sure that it
> would flag it if there was a problem.

Yeah, a reasonable AI... So, I guess we will find out in the future.

> If you are ok with the patch, any chance for a Tested-by/Acked-by/Reviewed-by ?

Sorry, I did not test it yet, but I will tomorrow.

Hmm, I really wonder if something will actually change. I never encountered odd
values. Well, except for the really obvious ones. Picking every value one by one
results in every value being from a different sample. I think internally the MCU
samples with about 1000 Hz. But getting that right would be some serious work.

greetings,
Wilken
