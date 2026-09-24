Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0470617A314
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 04:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225479; cv=none; b=hymQgiUksnqrYL0FRT/mvjzceQDoZFDbc8VNfpzJSn8IMR9jmDlmG/EGLW4SleHbVqQRGis8uEaDvF2H3788N1W0BDyW66VPkiy+9NzVIlE0LrinRmqtFbvJTVPR/Yxj1ijGja6gPE8XTBaGywo3M9KTYhva1cpqF4j/mvWLp1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225479; c=relaxed/simple;
	bh=Um2/kTnL9qa9cdtiNQiZbJPZ1lZc2Cob4pDgEa75j8I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UMdX9uLi4V8Ie61nc/ULJEWMcf1o+lEJ/4hUnelHNclNjPoWROvQk7O5cC7uUAMgtdIzzoVAZ294A+z8uxitSD3dxpeLxizMEjwZ4dIw/MDH8HlwZv1kKtjhEY0EmgyajpwAtK1gx+gkhnppb1off1Z/gTzlFqqfn/jHU3kZ7yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8+11DHB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8+11DHB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7530A1F000FF;
	Thu, 24 Sep 2026 04:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790225477;
	bh=Um2/kTnL9qa9cdtiNQiZbJPZ1lZc2Cob4pDgEa75j8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O8+11DHBT/b/yXb+Sulg0P6i+WtyS1HrL2nksleMmnyb0eryGOfFNB07C2jwsVPaK
	 LUllxppmB47U9dLS6ua43sGFsLkeQHtrx1i62bDtx9rJPpo8yqnZm7QyUxopLSkSxd
	 FKWr3g3wG8WLO+BvgTP0wFD1NRcRQwRTFVGy0rEVVSlYZoDu9UqJxAZuLoDK7ClX+d
	 coACJwcnkSkN5P+ET+syxc3pDgo3omcIiP2aI9i83PH0XOiEngNF4/XRQOU2PIrWgV
	 aSt9G1gbcXCThMDM+QrzCd471ZMeaJCBv9K22UmwqXQ8QPeiIoBdRNjPKBhf4PcWsE
	 l3JPiUXQm+4Tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell 16 DC16250 to fan control
 whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RW1hbnVlbCDDgXZpbGE=?= <avilaemanueel@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260924044829.2889204-1-avilaemanueel@gmail.com>
References: <20260924044829.2889204-1-avilaemanueel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 04:51:16 +0000
Message-Id: <20260924045117.7530A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> On the Dell 16 DC16250, the BIOS keeps the CPU fan at its highest state
> (~4700 RPM) even when the system is idle at 45 =C2=B0C, and fan speed wri=
tes
> through pwm1 are overridden by the BIOS within a few seconds.
>=20
> The I8K_FAN_30A3_31A3 SMM code pair works on this machine through the
> WMI-SMM backend: after writing 1 to pwm1_enable, the fan accepts all
> three fan states (0, 128 and 255 via pwm1) and reports matching RPM,
> and writing 2 hands control back to the BIOS.
>=20
> Tested on BIOS 1.8.1 with kernel 7.1.5 (Pop!_OS 24.04).
>=20
> Assisted-by: claude-opus-5-5
> Signed-off-by: Emanuel =C3=81vila <avilaemanueel@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924044829.2889=
204-1-avilaemanueel@gmail.com?part=3D1

