Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0D3CF68
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Feb 2024 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708556024; cv=none; b=kV9CRkzvlvJJBE1H/vfOiJAyiNrM0mH0HwYwSTKngafutY2DLkhvE8kPFN944LLbK/hy17T/2zGu3QaZut/TvHMI5ksAqO5I6uzrHmeT56LEuve/tJsoHki+43L69zA2pM7jN0+vVgzNQlG+uZtmXJx/OKpQP1k71dq05gb6VdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708556024; c=relaxed/simple;
	bh=guq+mjs6q9FiEtjlKE4NvK+Mwht2pVLr2bt0hZ1Uh/U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R9B+dw568CRyAK/puDSsFcEnMkbuXU3v9ta4LTJSGyZ/hr4qhhPKhpgF5pO5CsfNo9Z9gG0kkZem7muut470szqY5q46RY9fKymPiqWESdHV1yyJxM94y0fEiM9riHoTjL4JpumKN71b88TauxqZ1rHvJlmnsUgSYXmf8ksZbs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Vh6gMDvG; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Vh6gMDvG"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4TgBQV2mDjz9scY;
	Wed, 21 Feb 2024 23:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1708556018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8yt0OgR/KYxVkeXTDDSFF7f8cNT6WvpwD+g/Drqr0Y=;
	b=Vh6gMDvGsfsnxwoOfKeG4mR74AR5C1+8QfwlmUVzKtoCvdY5A1qUa0B5hQN7qif35OzUbw
	yW95j/phkPowMTivJ0hkfNcVI4otB7Awqlfwtl4hmnC3ico8lUS+Ds07nHzpwUkqnK5LiN
	/xrJyxld4SiWc9Z2DwmcaTaG8nYZ3y7xy91qxs8gbXnJitmv1lEXjkbNzAOzzfQhDKSXZI
	a80PremxYO8kKjM3vn4JCJuQjHrFW+vtfWTCNDxGfoS2fhWu1h2phvU83ttMYLMH3d+Eya
	iNMo+h60wZk5n13hziZMOGyPEVrzJLuWRYxBvw+Ms5uRkavzio0mp7YrV7lxpQ==
Date: Wed, 21 Feb 2024 23:53:35 +0100
From: Erhard Furtner <erhard_f@mailbox.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, Jean Delvare
 <jdelvare@suse.com>, Ahmad Khalifa <ahmad@khalifa.ws>
Subject: Re: [PATCH] nct6775: Fix access to temperature configuration
 registers
Message-ID: <20240221235335.136d61e9@yea>
In-Reply-To: <20240221141345.2231350-1-linux@roeck-us.net>
References: <20240221141345.2231350-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: rhnaq5oeuichxmp3hcq7njqpeaqo9ges
X-MBO-RS-ID: 3753fabcc6e986dec0c

On Wed, 21 Feb 2024 06:13:45 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> The number of temperature configuration registers does
> not always match the total number of temperature registers.
> This can result in access errors reported if KASAN is enabled.
> 
> BUG: KASAN: global-out-of-bounds in nct6775_probe+0x5654/0x6fe9 nct6775_core
> 
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Closes: https://lore.kernel.org/linux-hwmon/d51181d1-d26b-42b2-b002-3f5a4037721f@roeck-us.net/
> Fixes: 578ab5f0e4b1 ("hwmon: (nct6775) Add support for NCT6791D")
> Fixes: b7f1f7b2523a ("hwmon: (nct6775) Additional TEMP registers for nct6799")
> Cc: Ahmad Khalifa <ahmad@khalifa.ws>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> Erhard,
> 
> it would be great if you can test this patch on your system.
> 
> Thanks,
> Guenter

Applied your patch on top of 6.8-rc5 and 6.6.0.

Works fine in both cases, the KASAN hit is gone. Many thanks!

Regards,
Erhard
