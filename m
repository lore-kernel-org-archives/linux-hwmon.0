Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E000B493649
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 21:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787349312; cv=none; b=o0fKrBwWY611ypDPLlD0xoEoTucRGAPCEKTZMr8HMCZRtIAJPzR6pDeiQSN3G7x59DnQaDsM2V0NTPxXw32neKk0+nEM2p70Tg5xtINbAOiT9Bssa9+W1KqEZsLpYZGgkGCbMUALBj5XQzBd0KMAxQ4PNT/kPc5DFH8Wibd5JtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787349312; c=relaxed/simple;
	bh=T4Hs9+U4w1J0oCUaXcESkIGNpfjLU46ebSuurerr168=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d4fOhWg9pxl+efNpwfaf8SgzeTx1QzdszWvqvBmuxOXPyxyv9/f6p7BvzeuE/i+xy1arVVoo0YRch+tKeuMZMoaAZDDX8KzgvWxhdfowT5Ygsb9Sw0LooxgZJL+NTk0a+43KFQijfxVcChIPuw0e90SdtuZq27ItR/Hnjr1ITo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALvb2t5T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALvb2t5T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4914D1F000E9;
	Fri, 21 Aug 2026 21:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787349310;
	bh=T4Hs9+U4w1J0oCUaXcESkIGNpfjLU46ebSuurerr168=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ALvb2t5TFyaNjyQcffXGI/l9qlSS2uKLJsqHvS0D544GzLeE+3iTREoFuJK/o+laK
	 KzmabCo9o0TixUx93rIAK80z8T2jpXMLdjixo3g4SYG02LhNqeS+XxnS29/DT2rDGo
	 Xn/XOw0W+8j7bY+fc6BylNvqRpGX682pGdCpWb6PyvRWP2h4tK3N2BgEWLUA0/J+1k
	 /5nblJlCwsi/2AcDqk/stYzfagCWIg8e0fKDfR7Cp0Eaube1aPs+5mvLjqgsXRBZGR
	 i3ZC2uahC7Wpw6txzyS22nnRrqiGLYB0sktHBBItoIa8wYUIX3K0wofXft7ivjfbET
	 NOxrs9s5FDCCQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/3] platform/x86: lenovo-wmi-other: Add Legion Go
 fan RPM fallback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aditya Dash" <mradityadash@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821214728.87773-3-mradityadash@gmail.com>
References: <20260821214728.87773-1-mradityadash@gmail.com>
 <20260821214728.87773-3-mradityadash@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 21:55:09 +0000
Message-Id: <20260821215510.4914D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Some Legion Go firmware does not mark fan 1 RPM as readable in Capability
> Data, although Other Mode feature 0x04030001 returns the current RPM. As a
> result, lenovo-wmi-other hides fan1_input.
>=20
> When the normal VALID and GET flags are missing on a supported product,
> try one read from the Other Mode feature. Expose fan1_input as read-only
> if the read succeeds and does not return 0xffffffff. Treat a later
> 0xffffffff reply as an unavailable reading.
>=20
> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821214728.8777=
3-1-mradityadash@gmail.com?part=3D2

