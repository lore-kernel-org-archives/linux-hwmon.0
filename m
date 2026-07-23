Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816EB3AB466
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 21:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842379; cv=none; b=jL2I8Y+iYl5atIJXzYK7E+2yl1OCIaySCO+Hzv1aDjxTBCrdp4i+mhSK5+hLCmhyqO8S5bdYq2eruGYCUF61wEQPbIhrdbVeOD+pY68AE4ruEFx/fXM1JCvWf3tW87TVkt4u9RgzXiFOGxGRn51Fe2a0uSBx6jRbfHIdYJnbcFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842379; c=relaxed/simple;
	bh=JTc8UDr/ZfAvsEEvNs7uiFZ5hzVTe5RzTo7e/Mg5ALQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+nEXfZAmTY3cznlNXiBFREVRU1DgfpkgZITTWwXcKOxLQMdQrPIsr9SBtdWvTPyGwwtAQvlInYyh0IGVlWwwJIvT+z6IHTqlB7fbzBk4Gf0wZhDLfxGaEElHIVXWleE7IJ9Fbk2ZfBoyCTFtKMbB+tqC7nnwDQzlgH6UfhTKD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=frxeVJie; arc=none smtp.client-ip=212.27.42.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="frxeVJie"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:8906:6856:2485:2c53])
	(Authenticated sender: vjardin@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3716E19F593;
	Thu, 23 Jul 2026 23:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784842374;
	bh=JTc8UDr/ZfAvsEEvNs7uiFZ5hzVTe5RzTo7e/Mg5ALQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=frxeVJiecXWV/uR895FcZ1w1S+4qFh5bXYPItVLD/AOdwzGqI0L7q5tFyA6jXrziS
	 cTR79jtWouUp3Rhr+USYxa3hpkKxSWwGhALaT9VpQmKGLQ21eAqjhhDSp5hDPAzqL5
	 KMHVmQ4qPo06k7XR8cJqKUDKGbVpxm9lq4VojWB5u8yL+4a2EtErSpJeUi9+4EJ7u5
	 VhtF4ocFheVfsKRz9ntKRktbx90jqTUTNW4R14720DIfYVX8Dd2zstLDmcplGPyBxI
	 Wex/Ulbqc4XgkkDp27u5WTjFnmulfCv8VmWZSEqP2T9rXcixsxHYETNeQKXjCHReF0
	 gDEaadbNr8eAQ==
Date: Thu, 23 Jul 2026 23:32:51 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [RFT PATCH] hwmon: (pmbus) Fix type confusion in notification
 logic
Message-ID: <amKIg2RnOX2ZbCqX@L30177.local>
References: <20260723211336.3046042-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723211336.3046042-1-linux@roeck-us.net>

Hi Guenter,

> Fixes: f469bde9afd1 ("hwmon: (pmbus/core) Notify hwmon events")
> Cc: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> RFT: Build-tested only

Thanks for providing it so quickly !

Code looks ok. I'll test it with the MPQ8646 using the serie I sent
so I can confirm it.

It'll may take some times since I have to run many tests on a WIP board.

I'll keep you posted,
  Vincent
