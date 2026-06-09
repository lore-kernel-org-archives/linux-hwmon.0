Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6826536AB49
	for <linux-hwmon@vger.kernel.org>; Tue,  9 Jun 2026 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038178; cv=none; b=az45zLM84hfzuzZkFKjTXmHEsY/66SsSInigo8OPUOKk3SXjYfUZdBhqvGKUsGFj2pizNTCOziKODd8S5R6vN3O8LReFTAx1zSAFR4bU0nB+LfH8+U+99cg2U18QTg19blzsnNN0fwcOz9fsKKu+vglAXpkItwLVsByEDjqYxt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038178; c=relaxed/simple;
	bh=C7Tdahsero8RIs0zIirpqMGINCiA9rl3mcNltjRVAVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NwRxlWXLygnndSJCrOrwA6rzuftd64acOfqZZGMOF+1iy427cuNeSnx4ZtOWBNk5vhzRLlnrEXSlREQ2BrZw4I1sY3ndWfKreGcZOQdsLIqP/HTISxbMA50edtVoLlLVNxGnj2WlcnWc/1P9vOYtTiFguC+RnX7W6vYu0gYsrCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oW2U6j5O; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oW2U6j5O"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8422f395a4aso3791581b3a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Jun 2026 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781038177; x=1781642977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PNaSbbKc3kV/mFOGFU5J1gAuNTvmvZQI05v3tB2CJWg=;
        b=oW2U6j5Oe0Bbw4RzlDyHU7oL6K+vAdyueSUsxSjkXwciDReTt4YyNTKxXywHKvTCN5
         675TlWwG3qiQEtysquAsYZLvHrCbcvPklHGAVFhe24eOnpEEg80qSJKqgM1cDLFRqGdv
         UWXW583VqTOnOTn9JQyPz6prmL2O0B94z3ezNaMafaF+3YlsTrvdr6l64jMwZeBrFwFT
         BiLiEx0IZA/z3T1HHVQ3ui8EjAxN03JJUWKN7mW6/KFo8wPKBEcTq4948W8K7ptWkZw3
         yNJJl9pz7ThAh7VJ1XioYl9Q0wZuHyzwxrxXHEBCN+hS2YHB11Y5wkaK7aQjNbHSvsXx
         hxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038177; x=1781642977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PNaSbbKc3kV/mFOGFU5J1gAuNTvmvZQI05v3tB2CJWg=;
        b=FfO6I3+moaZCZToBDuislZWdWpuLh9nH5Z4KQ+dMJP6qTaseHuUUPtlZsEAs0nmFcR
         i/P+EjXF8bh61mj8J/8i3l2AWydqlbSn2O2MbyVlzXsbWy6ST8Buiac4FG+RbUaDBxwv
         eBnZMpNDZ+GnH4YraRwnvlFRURcRt4fvXhdeVrQ+IN6oPBhzvu/CCAK+blfmmPkOiIpD
         nQu0eV2NEjj4gjF5lYDCph2FfvmlAjCt4Hm0fFz3dOhEo6G+G6lL4NK+PijSOOICtFqa
         NRHYbLvVvxq0h7fiwStUWSqs6N82CBtyg+sHquzROM4O4/+oTFUk6i+17OjOe7YE0XNS
         58Dw==
X-Forwarded-Encrypted: i=1; AFNElJ/xyCciQUBjdf3/5JpjEEeoSYbrMtkDF0F91CXXGptRuggkzpYiY40UfpFbwEhN8Eq0icv3YPiwloUxxA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYoEzO/1HTW5vOdVOoKcdjr1hCNBbyKok1ugQwsNnXTva75Wm6
	D7z+Xz8HiXfw+P+1xyLdjFCiUXV5R8zk6OfyrX0KHD+Cit+EA7iAAa7M
X-Gm-Gg: Acq92OGqNi1As+ZOTq0MquFvG1tviGumLRg3aHNA82AnGaaXqdB8kx7k1V/IRvXw4Ji
	rNVYkxHgv/xr483z7EwBfd3DOFxJtBa9q5anQvaNfH7np7AZ0wTmYSGKhZA2tAFaAtrkqB+6vhX
	1Z5rNMAJ4yLFCMiLKJwPiitUcZKTXQnfHyPGJEmHCB9SE1R9vEb059OaSTe/TcfE2zuclm3CyU6
	ucl64odJYm7saXXoRC9yueiUt8SszsRCHFuc5az/hZxYVwRw5XaTshMgpkJtyT6geKpp6szSTxb
	CYtbGbdirLWVPRPHvR4VkIhvsOEkdAbLJyR/jFu2USGk7y2xNSUWMhCFkH7c04i8Nfbmc2wIN1C
	dv6v18Xpg6SwfdJCqfPDV8qKOgD/7Ms38wcXo9rbm/tmxHN2gC2OE6GcuZz9xM+l0CxQpjMdgz9
	+aupjPvvnRRtD1MYkUlnRaltC8Bj1UTVHrsPmSCfEKDYogEo8=
X-Received: by 2002:a05:6a00:4f81:b0:835:3861:812c with SMTP id d2e1a72fcca58-842b67b0a55mr16936350b3a.23.1781038176594;
        Tue, 09 Jun 2026 13:49:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282915fe8sm22543272b3a.54.2026.06.09.13.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:49:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 9 Jun 2026 13:49:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	richard.leitner@linux.dev
Subject: Re: [PATCH v3 3/3] hwmon: ina238: add update_interval_us attribute
Message-ID: <4ba162f3-5204-4f93-830b-0423a833f5cc@roeck-us.net>
References: <20260609-hwmon-ina238-update-interval-us-v2-v3-0-016b55567950@advastore.com>
 <20260609-hwmon-ina238-update-interval-us-v2-v3-3-016b55567950@advastore.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-hwmon-ina238-update-interval-us-v2-v3-3-016b55567950@advastore.com>

On Tue, Jun 09, 2026 at 09:43:12PM +0200, Ferdinand Schwenk wrote:
> From: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
> 
> The INA238 family supports eight conversion time steps from 50 us to
> 4120 us (SQ52206: 66 us to 8230 us). At the millisecond granularity of
> update_interval, the four shortest steps (50, 84, 150, 280 us) all
> round to the same value and cannot be individually selected.
> 
> Add support for the generic update_interval_us attribute, which reports
> and programs the same ADC cycle time as update_interval but in
> microseconds, giving userspace full access to all conversion time steps.
> 
> Both attributes reflect the total cycle time including the active
> averaging count: the reported value is the raw conversion time
> multiplied by the number of averaged samples, and writes apply the
> inverse mapping.
> 
> Signed-off-by: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>

Applied.

Thanks,
Guenter
