Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2BB36B911
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 16:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786034560; cv=none; b=HIF2zFaWJflkfkDWok5B0rUEP+bgd1Qd03GzXBjaVo4wuBoLEZzcIgUWUpyj9BbMWm5pFkyEgHOrj8hNWbQWKOq0esO9D1rmhyApdxzc+P3F+UZtX+xlGpe7tBcdmSICgRYlR7uflFbA7zBj9ulHf13HXUEXZaeTTnSZ5VDQlEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786034560; c=relaxed/simple;
	bh=YYpetmGzAXy3DZ34M6IUnDHHUHElTJ/OPi6gi4EPWbs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nc7UgRYt/2c7MxfcORoF7sRo9bYCX/Wo9XKSJ62Yo3OfmW5eOorfeyaPkK4kbhgnmS7y9opjaxg0gsTy9zcTxWQDBpQnrc6dwHdstW16hQ+rzfCyMuFSu2YA8HFI15l15F8GzDSGccAD1uXeoznCaKPUhDxpFMkmXLOYO7oEAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=cEWZzY3Z; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="cEWZzY3Z"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 6A45B240028
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 18:42:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1786034555;
	bh=KQXQaNacmE1ORkdx5jaYpsxeJ32Y7vBUUJnW0IznnHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=cEWZzY3ZLcgzM+e1WtC7ccK7jBvCjFYqPqY44WISyKpMGi1nk7e9g8lrUJ1aFJ51s
	 Xje8h+LOX99EoZ5q7Vnl43XZ8Mj0icRLNG1rVgsyBVcWT1ypxm++epmNA8Z5wZmwHH
	 zK4d6aUo3EM/we4l+FdDHEn8PZZvBVgnSi37ieovu4SoIAN2TC6MpmvBbcSF2ZgnZS
	 23IlGJbdt8+9/0AMRcE/vZK2Ubjp0z6pCzFZ0tAuD+XTBWD1Yz5uNE5x5OL2ElM8xm
	 GMsSz7KWNaocCbqIHRDo4WF6PS6YJ7SFVlX8WL3z0Zovz0EG0O7b507Bl/qkFXp6F4
	 3C3oJfj6/wtvw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hGCkL4ktyz6twG;
	Thu,  6 Aug 2026 18:42:34 +0200 (CEST)
Date: Thu, 06 Aug 2026 16:42:35 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
Message-ID: <20260806184233.44124904@posteo.net>
In-Reply-To: <f4077f39-0427-4bb9-8b6c-ddba3f492765@roeck-us.net>
References: <20260804034811.2385506-1-linux@roeck-us.net>
	<20260806173411.6be71067@posteo.net>
	<deb3db39-e8da-40d2-af9e-bdaf73b9bf3c@roeck-us.net>
	<20260806175645.5e50b70c@posteo.net>
	<f4077f39-0427-4bb9-8b6c-ddba3f492765@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 09:28:34 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 8/6/26 08:56, Wilken Gottwalt wrote:
> ...
> >>>> +	s64 result = mant * scale;
> >>>
> >>> Uhm, this is a 32bit multiplicaiton, actully a C gotcha I explain the beginners
> >>> in our company. https://godbolt.org/z/eM6TbGG5E
> >>>
> >>
> >> It is, but that is ok and intentional: both mant and exp are guaranteed to be
> >> no larger than s16, meaning the result is never larger than s32 and will never
> >> overflow.
> >>
> >>>> -	return (exp >= 0) ? (result << exp) : (result >> -exp);
> >>>> +	if (exp >= 0)
> >>>> +		result *= (int)(1UL << exp);
> >>
> >> This is the calculation that can overflow, making it necessary for result to be s64.
> > 
> > Yeah, it was just funny to see in the wild. It made my day. :D
> > 
> 
> Guess I lost you there. Do you want me to change it ? I could add a comment, or just
> type cast mant to s64. Please let me know.

No no, it is fine. I just was surprised to see that famous gotcha. But I guess
some AIs may jump on it, ignoring the context. Changing it maybe would prevent
noise in the future. It is like that famous mathematical "iff" term, which is
used in some places of the kernel. A lot of non-native English speakers report
that as a typo. Ahh... just ignore my gibberish.

greetings,
Wilken
