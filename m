Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2031A5B9E
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 00:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789088319; cv=none; b=H93Ln9NVRWwrI3drDFVoj11jxAVJuv+B2lHr0fVC4b/MNTYl5Rs7EEpc9ndikzcErBca7cn2YTn726yoRc2r0WwVTEEqcnNQtgAJNrk44pw7J53fDe0wZJea2O3vfLrSYuj2wLktv+5eZiXMFaqHdwuIN6VBSNVEeaJKzl0dZL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789088319; c=relaxed/simple;
	bh=A265HADcB7R78V4B7WaaMJOPNRhCgF3KC+2zEGVJfuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvKgbIT0+damsNrsXFOIcSI15a+h1x2iIULjNPeMgf9mee2+a/m1n//QoYu9GV3X6/1n9/Ag1Uf46ZnVgal9L5+uJczExQHUciP69hq+diBh7M2D9IB3tqzG1URFb6cyhbT/TQTPl4PmFcyDw3Q3b5n80VjomY8NtJILzvxOe3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AO+9+bOA; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AO+9+bOA"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso334425a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 17:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789088317; x=1789693117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3zf8XnoSX09VWqI6ohFXF2kiQZv/9kfAXq5rTnrECXk=;
        b=AO+9+bOAKW+LuY+ctXvo42bX1umc8OwZPhpPtWQJnvdZ0j+Yov/S6HerXDbdEx+Ov4
         Cwf1+YqPvnnudxZFAm4+IP7raj0vJTnxryHHzpNeSeCqaJXHvo5inrydNSym4BXgxOuV
         c2iH1rdB+WyDcKtQpEGZAYa67hHfvN0DtkO0mROQNQGYnDpcaqWFDcXAjENzLBjSrycv
         pZOyMqYy/M8C0QQzcQYOIyRYj0hGHwuUPjeAZJOx29zwcAn8jLEJbH3Co8NdehdJ55Od
         bpN7f7KGHiCqqdNCAZRuGG+9gKd/ourcBvEO3xTP2eU1G5gk6vJQzmLqOu7xKiGQyonA
         1XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789088317; x=1789693117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zf8XnoSX09VWqI6ohFXF2kiQZv/9kfAXq5rTnrECXk=;
        b=nBQnw95oGISPEr9KlTYkEJwQXMs3o31tcpMAkil4j6R4BwF+Lw55Bu++kRyFKiyQs0
         nSS28k+pSDDsA/U4LnrrqNYEh2uT6flSnft6oli6YUTdf9s8TMB6dFWYH0cQpGui6Aie
         dgybDNCdI9gIU9mx+/rtwH+BqbfUtqVJGDuBQ7fploKZCd0By4SliKEqWIDmjKsK65cm
         s7KtiPa7fBMjiJ1WEzLU4Ou7tXDtZZfNJi8J6UUlqBWFWjiAbEXynFcpUylzRXvah/Gy
         DsIwR82cIhaJUGPJ0RIWxQvHQ2yavFD9eG6/NoEpXkglQVYOIqpIY0/ShLQ7Rqtl/VAV
         XeWw==
X-Forwarded-Encrypted: i=1; AKwUvBzr+oNmM4jzVZVy4pQ862JhOtDemfz7t1E+Tg9/xG9TzKSNef7Ucj4RvyAV/OTx/w06UlauaGAvbZpv3A==@vger.kernel.org
X-Gm-Message-State: AFuF++l4wSTGbTiQ+vT7iHELkCrVTN08X+eNMmSzdEdP/ZzVffU7nZG+
	+ijXgFALNQi/1s0g/ZWRYhz+GCli+vtawsMLt7dzGLbdPgqQV43KK2zP8EnU4eXE
X-Gm-Gg: AYBFou2MO9paQRZehvijQRdEVZNS+PDccpsIJCMPZFeN/ZF13MNrKapMNuzwJfyEm9j
	gf9Bon5DCxa2DKg+2abTg0AfP+rM4EpFMVJAdmZTjGIRilr1Xa8xM2GenRUI4wQgmch9dctrCwG
	W9ePAo9fBXZ9Z2p4LHWzTXVOd50qb/TXXKaMOPeQP3fhFSJZMYuhsrnqLqyLua7AElL6Shi7rmG
	EZl4MLnjFXy98Q8+8MaGgZ5HFaKYYfvRvdsHhR5piFre5rwExq//da7gJDKh/Rfh1PRS84leb/0
	JL+C4CbUnWM0uHdSxiSVaHNcoWP3m4UG8VQlgQzGtLmNM+J+mFcRihW4nDtClZOd8OOa3eCBnjB
	HCBefaz3gbYhHjZyHJmQnAbDCa4ZvRiwPD/qPkuCj4EiUmZyMonrDix9JI4ak3ZJqQjUZ6h0Egh
	mSHdRlQWO8OVu7ugcv52+/OMqCdZEkrGKQbnHZUt24k/ipdc4Ez8LcYpFb/Z3vwTPRv41uVA/Ie
	BNQVDztuuU2
X-Received: by 2002:a17:90a:fc48:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39d9c3527b5mr2180437a91.24.1789088317108;
        Thu, 10 Sep 2026 17:58:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b8f1f7sm1919922c88.11.2026.09.10.17.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 17:58:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 10 Sep 2026 17:58:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Werner Gartner <Werner.Gartner@congatec.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
Message-ID: <b7a59fe6-f8a9-49ae-bbff-c3785dc19ecd@roeck-us.net>
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
 <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>

On Thu, Sep 10, 2026 at 03:28:21PM +0200, Thomas Richard (congatec GmbH) wrote:
> Current sensors on the Congatec Board Controller don't use consecutive IDs,
> unlike other sensor types (voltage, temperature, fan). The driver assumed
> consecutive IDs and performed a simple lookup, which caused an unknown
> sensor warning. Define current sensor IDs explicitly.
> 
> Changes the warning on conga-SA7 (type and channel are correct now).
> Before:
>   Board Controller returned an unknown sensor (type=2, channel=17), ignore it
> After:
>   Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it
> 
> Cc: stable@kernel.org
> Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
> Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>

Applied.

Thanks,
Guenter
