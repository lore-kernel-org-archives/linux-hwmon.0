Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC29039183B
	for <linux-hwmon@vger.kernel.org>; Sun, 10 May 2026 15:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778427385; cv=none; b=NPMycaiVTzcy/dfbWCxpWiS5J35GxTuP3ZoHpO5pPXPqj+Ip2k0nk9WkLktH56M3qnSHRWwNoIszigDFLU3Xv/QylcRLfTNHerGKorf0BshUIb/UGYZROpkqOpowk6pJcZsK9MufeDGTPvKm2OC4qn1wXBKXBbib9W/oNxT2LRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778427385; c=relaxed/simple;
	bh=ZWt2kmzD3XDNP+orsTt152+yN9VgZ8TeDqRFMeRXm3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEgrcA32H+X2SGLwG3MtB5XQ0Jyrwy73KQI14AnZlT5UK5rxlRmDgnkE0ifZYHqGnKC/2q1A8ShfrKkPyUyqDUH0EWeNUdroAa0fPj3zAytoe+l6t2FVyrfvfG8OrAHYcSX9RBmJ6oJyJlgtyAQKPBWudfQ1Vu4xkPsUerMXF5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQU3afRB; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQU3afRB"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-362e50b4641so1911147a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 10 May 2026 08:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778427384; x=1779032184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f3wI0g0Kl66xRE3n9J94cTr1dzxpIkaXUYnM67n/zLM=;
        b=YQU3afRB2zrphFh+LDl6SlFzs/Q9sQp88YeDYT3ObnUpLCOOnUmlBCt0DzlPVyZolv
         csPxCQSmoIsFkRtMh5tzvQAOUU/d99km+dWzF/cNiBIM7Ky3Nshzyu5F4qtf5Y2nxFo4
         W4pEsXpcDf1c+Y6Jq851t/MbsSSypHJ90HT7FLVQJmv5s62fm87A1DEmWZ1s1Z4KMhdb
         DwEZC5OB2MFqYsmgXvw4dzSp6hyl5bWJzCgwMAEqXinBKvQWoqkRBRdD7CsaJ7bvI3wJ
         w+C9N4We2Z4nRUmeenuE6e8w2Fe1wAN/lEL5cxC52fQAfezeMY521rOqjCidgmGlbbkA
         8bGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778427384; x=1779032184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f3wI0g0Kl66xRE3n9J94cTr1dzxpIkaXUYnM67n/zLM=;
        b=CNoP9doGsj2sBwufoJ8HnvB9odzCH6EUdpw40QBg7P7kj1pxG9F7zZ5lfs/MBtwfn4
         bMjCIyvlvQxWqkn+T3rj171sor4V2QfSljszjRpwptU6bDvQa9DBqIWbTtF8ztgFl4ox
         Smp50LQZWqEgmmX/H8uzZxJ1gM69z7drxpA2p6ZvXtgPUGuprZJ2uLt9EYxxt8eAntNn
         xxuuyfzx/Hia1mG8rJU0RFv7WaZnpBUXbFFAV877JzExqt3qcWI+HIO+BaJd0VVN+LUl
         lai9vXLY1gtljS58hudAuWrPhAYPZJ0rn5UpjYGvzK1L9+bVk4Ai4pclQGk3+cuMR0KT
         4dBw==
X-Gm-Message-State: AOJu0YzljucYamxZ89REeJe2GGDPI5A/nYkdgVhoaDx7Hz7815F/aYAv
	b8l/sZ/ObMjarvYaq3Wnrm46/6M/NbAxvgGbkj+ODRr9OyKMoSFe7zi/
X-Gm-Gg: Acq92OF9e965jjIqazAKj+Yqoz0mOLvwbI+t9eOLaZWpJANUvLrPBNo4FBPt34tHVEY
	qKo4Mpm+u4Pf/heq10HPFrXkD8VzCFczkoNb4hCWjGEaf+rkKc6el3J02Y6+BGbDFUdFkvDNz3h
	++BOHEaNV/6wFr/x65aqA40JQ+bF58OEXPXvDOS7oHIzdZdwDh6ESO0PfXD5Env3JAtZZG7wRJ/
	i4SRG3x6mTYfJshoPy6p7osekx2+JESMrN7kfBZOPdqviXCvoBsM9eDNszUDohXxwsTkH94ubFb
	B4T5bht18PgFcanoQR/FA/MzfgHMgXpdmPNwmZ2CG7xmurNKF3wk58sPnhBagOjtHqZI/hRsR8e
	KytHxrAFAuFp+CrbufehmuvZ3WD4g1c1iQAC14mbVeKDNDUTJ9W43jsZZma5flPvmFvaoYb4MLY
	mdJhUYqUdqrS//sIKVkS5KGRJXVzzuVpzYnJII
X-Received: by 2002:a17:90a:118f:b0:368:1e58:5b01 with SMTP id 98e67ed59e1d1-3681e58672amr1924502a91.25.1778427383992;
        Sun, 10 May 2026 08:36:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be2c82c7sm2084211a91.7.2026.05.10.08.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 08:36:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 10 May 2026 08:36:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (tmp102) Use device_property_read_string API
Message-ID: <be4e7c29-66fa-411c-abdd-48da2c820be5@roeck-us.net>
References: <20260510092543.12352-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260510092543.12352-1-flaviu.nistor@gmail.com>

On Sun, May 10, 2026 at 12:25:43PM +0300, Flaviu Nistor wrote:
> Replace of_property_read_string() with the preferded
> device_property_read_string() in the probe function to
> read the device label property, improving the driver
> compatibility since this method is not limited to
> Device Tree only.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
