Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219855;
	b=Eri5j00g+mv6s/cgUQDjjCDv2+sA3YQjmdIIERn0HYr3EM1B/0KxImjfXiKw/PWcLE7d
	 Bxbq35RAfau/rvVzn9NAxOs3jkD9PTq8GtkhIJ4EAfs4/l/UcwC2ViPQ3Ujy9GNYOi5vP
	 xXRdbleomIDoccWWGj3BpBxe2ZLNL6KnMYxOvephk2vLj4m/8mBt8NwNxom/8It2ADFTX
	 b7LDqUS58V+5uzJxJfeOrIRPhs6EWL+y6FcgXgmelxBZjZk2o/9+w7Ewot6wsY2Ib/yw4
	 j1yJCXEb7QQRvEWjst5DKrVFrhL3oi9s5tNvq/5NCGHEsTkLQJOR2c43MMFkfuH0DYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219855;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=o/3XrWX9uUBloRkNzcggq9KFBSRz2GCghtRCFmPwrho=;
	b=0VRaqHsM3oOSuo+R8VxRBuvpzUITMwRqYJVD3m5CzN9rB3IPUQ05FlT6zFnLSjUg/MYr
	 ndGqASj09xaGB2gT4hIF3ZKK9bLnplMWCXcaYRvyFwrTXshYO4Fx16KAOKRJ2B3P/UsX8
	 oJMilU3z7DDbt2yvglV/ZECj0mTWDwnwobMGlHp5XhsCnOzGRaQm/hg5+/t87tURh4xfc
	 YbCZoRaDbue1UWwdt7bonC+hxazg5yAVrDi6yXtyp5s1MDnabV+9UakJPGQAkZTIaZeaj
	 qsvdO8zNKBTBdpE6hPw+7TR0HKjQ0EeyEmxMvw/KNf7mLzT4vOPwia9w6/KNlZeKiFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4dOpDCo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622EF606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4dOpDCo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85691F008A1;
	Mon,  9 Nov 2026 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219855;
	bh=o/3XrWX9uUBloRkNzcggq9KFBSRz2GCghtRCFmPwrho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b4dOpDCo9S/PvhZqryg+/XL/fQw2ThD2gIqalN7decibQAlLS/gQU0VmiWchCHXqk
	 9E12XNH/Q341PkIV+m+NFf8ORRpqm13PJggCPXdrtuUfqw29wwLVQ3VZjfQ1rUeJvQ
	 GUdAyfLHOBLnquTOFsYSLwqOuAYWyURi2+WEe+uK55TdYY+FlHHzMZrJqRoB1xd4nS
	 D2CcfFrzhTbXG5KYcCd6kccbRKxvMBKQKRV2SJNWyzKrljXAbcNK8W52THUJqT2u/h
	 Azh+/tDulds4U99o/JRAstE6V8hhplkuTSrCDDfBKUjWx88U0wA/JKVuTWstJwiY+x
	 93jKmHODA0FZw==
Message-ID: <sashiko-outbox-204811@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (it87) Clamp temperatures before rounding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109101743.16955-1-zhujun2@cmss.chinamobile.com>
References: <20261109101743.16955-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:24:14 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> TEMP_TO_REG() adds or subtracts 500 before clamping the result. Values
> near LONG_MAX or LONG_MIN can overflow, causing a high temperature limit
> to select the lowest register value, or vice versa.
>=20
> Clamp the requested temperature to the signed 8-bit range before
> rounding to whole degrees.
>=20
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109101743.1695=
5-1-zhujun2@cmss.chinamobile.com?part=3D1

