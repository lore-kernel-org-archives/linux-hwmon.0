Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA383D5660
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 23:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303849; cv=none; b=V8YiTz5Ykkbet+uG0vuLjacSjr7h8/xrdccKyDPvilzRijRyOgwcPk4oa7n+jDozfjkfC+MnthNX/Bm+Nu3fA5UQ8kBpZoitA3EDYncT5lz1fzfqfB2efO4lU0oEbxKln2hto/CqsZka4N0QWx1AkuYeJUtXluhDgjebCPJoN+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303849; c=relaxed/simple;
	bh=NrgEfLLLs86SYcFbRusP2j20eQNadGH9mCddnX8FlMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cIFrIwM2GPLDS5mupZCCOh58AYbxXdwaRvGHZqPSrbKkkDi5BXvZWbjX95PT79QgSOxJUGL6FHsSs1TFGYOAWHvU2nf9/o4oRFQRDG8myyYz//qiRk7KH4m2Pe4aBXfWzVPrgyHYpzwCWh1umqvyhVldtYpiIEOjuhvj3m5v2r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MjXQZd7l; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MjXQZd7l"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso340102a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 16:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303847; x=1788908647; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tH/J1WzaA/WseOsHRQAfR0s8ObxokYagjZKCtRr3PoU=;
        b=MjXQZd7lmaTha9N+bobO9UblmmF209c1spdRT6X/yk1OfbAyZAs70pn3BCZN1OLqv/
         saDH/VvR5YDsRobK0lSkWXtTSbSsSTeMjYMDZnp1ta0whCLB3q3HAHg+KojBzHwHtK6S
         HKwPKdVFxGgGzpvvSu53EEh7mJYV/4IFzunPE/I3Qbv9qVxw5z9PUouexQAW7SmuqdRC
         NkHQ1SjlJLA/8Or0rNaPBJSwkyHN0eD8/ppz6lmkr1X/S7qBhiIRm8K/Xu1cZGtWS9n/
         A4tgjyJ85nYlrE4xowWorYmI1Ndsb/XPxu+TYapguR8/qapkIsBjqaRs207uZ5uT34kC
         /l/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303847; x=1788908647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tH/J1WzaA/WseOsHRQAfR0s8ObxokYagjZKCtRr3PoU=;
        b=HD5wGvwpl1keMGiujSIMJAnG9vsKttng9WaviEt4koQIlIAKZGnmaE0SV3bJlHZp99
         Bw5bMQmD9t2bT7jShFD+bz/fz3jq8Iqqrg68PWsIhsP9hLNhVUS6smjqV9oY74gYo8Cr
         c+w1LIZ+r1OH+00z8f9eXuQK80N9ijueKsZWfPCFW3AMI8OdC//ZLStq4aS7JsiunhWF
         Riy54pTHP1l+89ifUOHz/hkzIyEynWhcKXgOBDRzhUUCr9ZnOY9Utyi38zk/7d6M/Ro/
         d0kON6iAjbdigOaTKDQJGb/3cL1sYgpvAyr05xhtvVDKqyEKD0LBVPTFCSX3ZoZjz0oV
         ZV9Q==
X-Gm-Message-State: AFuF++mfG7QBv93vVR3P0WPN3paxkP/1LWkr4GX207RQEDs0cd31tDbw
	+P4SlwiVrq7Fa+hXkq70rK0Agajt3pxhFmu5bsmrl+2CUjd1esqT6i8q
X-Gm-Gg: AYBFou25yR7bzygH6VBl9iOjgF9Ua/6tP0RFyV895q1Xj6W3P9GIaacjBnRUQTT+1/d
	Kfv6h50hx5IiqkiJkgLF6++kp8GFvagDGVokORP3ieihagjY1FEkZT1AVAAZcWW6Fp/x3NacJn9
	xhQv6cboZCMvutk+UsGPfjd1y2gA7Rdjx6qgtYmluNyhiCuOwZsaTcpCxmCUl2jsjJasiio+z6u
	Z2SOJIvj4ZqXYEE5TrRkrfc7XEoKtHU/Jv9dSfPyK3IPzy7vjUMjKSl6BUHak+Lp+l1ZcTJENmv
	hSE5Q2KotYy7KEvfTEqfZMAn8zIzaIzlfHDaI/rUZ9ENBPLfY4Uxheg6twrc1KUrUxaXpgF2B9P
	toNinNpNuhjm0kF3bMRBjg7FKqtpAuNvmiVD8M+Rv0NmIgAckcHAFNhml8dtynbfE/VCl5yIR6w
	6YKgLP4TlmUAOnL6Dd4PuDHdPfb0uCBsUF4r3TWPzmvjwkOuqK6Vqx/5Ur3oQaLncr4gtIDVcpB
	g==
X-Received: by 2002:a17:90b:164d:b0:398:c16e:69d3 with SMTP id 98e67ed59e1d1-39aedeb9aecmr518948a91.1.1788303847194;
        Tue, 01 Sep 2026 16:04:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f079f0eecsm1137385eec.9.2026.09.01.16.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:04:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 16:04:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	ggirouard@bungeetaco.com
Subject: Re: [PATCH v4 2/2] hwmon: (spd5118) Avoid probing when 16-bit
 addressing is enabled
Message-ID: <b2174e73-79ad-4462-93d0-2e69582636b1@roeck-us.net>
References: <20260901200142.495319-1-W_Armin@gmx.de>
 <20260901200142.495319-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901200142.495319-2-W_Armin@gmx.de>

On Tue, Sep 01, 2026 at 10:01:42PM +0200, Armin Wolf wrote:
> Support for 16-bit addressing was removed when support for i3c
> was added to the driver. Switching between 8-bit and 16-bit addressing
> might confuse the system firmware, so we are forced to bail out if
> 16-bit addressing was configured during boot.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Applied.

Thanks,
Guenter
