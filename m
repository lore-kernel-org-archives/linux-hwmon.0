Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129C1280325
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780693572; cv=none; b=oDC6FQRFOhslnd1M/St5Ef9SrwlLRA9e+BAG+afEAFb5Gqdg1IwyaDXBfHL41eVuU6Q1E6OXs+Aa2ZdNb90y89+s30EGQz0ToAs85gCU+vCt2YwVI323LV4XeJkehQdZO9yLt/8zTkIe3OvuvZI5ziy33RzzuScr1JCf172YZgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780693572; c=relaxed/simple;
	bh=wS8yrKnOHlgVvV5mIfbJDWM5aEF2S/cplCSu7kcWUPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tAEWiWiP2ZUCKWcf7CtbKplm2gDkkr1YkyxYi0fNti0460a+i8c37GIqczox238fCBn/ft0i2bmVXwKTZO+hteoMRhiDoRi58kjCnaVU1I8mUlHkWUi8vY5DOcIA9LLoS7MdT+g1qsTBGbn+psrkRPMcNMeTeUt84XFZpy2dhuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JI++Vwjj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JI++Vwjj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C45F1F00893;
	Fri,  5 Jun 2026 21:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780693571;
	bh=wS8yrKnOHlgVvV5mIfbJDWM5aEF2S/cplCSu7kcWUPE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JI++VwjjWmb1nI5r8TMJq4CWCD8Nft2zf2KKdCYNH6+swFCGgHVm9UwVKOEkEfAI5
	 gi6QjK1i4djr5r37CK+kNK3euD2fGntSvxi79cb7TB10j1RONIoz/i+QrgHvENpAWr
	 kKdJov8oMXxtYEuHEwfnNYdio2a1xhsj28vz6vL3m/gR75J5u76M4BwBTr7ipPwazt
	 Xr+QZI37Gq/xeJZgUF76Pp5qU4XasJsMEAQa9TzSYrwmdGeRZ3QCk6NKoqaPeT/HaS
	 NLc7rLD9Bk/g0JNA3Qvo1+QOfR+ZwyUNq3aa0QhzeVtWXgpAy8t0s53X1dkmnZrTfu
	 F5LAFhJYfAJ1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/9] platform/wmi: Make wmi_bus_class const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605205937.530897-8-W_Armin@gmx.de>
References: <20260605205937.530897-8-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 21:06:11 +0000
Message-Id: <20260605210611.8C45F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The functions class_register()/_unregister() and device_create()
> both support taking a const pointer to the class struct. Use this
> to mark wmi_bus_class as const so that it can be placed into
> read-only memory for better security.
>=20
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605205937.5308=
97-1-W_Armin@gmx.de?part=3D7

