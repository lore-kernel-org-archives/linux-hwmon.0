Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556099;
	b=IYOgv1zihLYJmeHTG6qjxBmj6MIChM2/lmHC6rJjKZVTf8Tkq3J1+YqoFRbzrUm55+P1
	 oQbUl5pWpmqHW30u8W+DGDkTuLTxTGGe/qaHNv9yKCLPzVl1/KlRUoWjns4NPBnUsH7D8
	 Ioeq+0WhvDdiQUC9Gd3TrYp02605bcTKsPub4SUMriYcOHE7v1+mG2YZZTQ4X7YDy2rt6
	 tRpJLw2HLnvvkECe3htKZatj9BoxdViJ/kIWsjHqOGYLPoUMJBEujgFB+qbwdc66nv9qq
	 XO/HtRtG76bGAOXHQVXp7Qm7kCOhNW8LwdhkhGGD6o6uX6gQWYdfoBfapWigTbhUpeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556099;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3xGFjppLBtcVr/lH+AvwGNS6vsfd+tT+jmCb3qTy84Q=;
	b=L5/4rYQYavy/65ROzoBm6yiQ8LTWlHsXOfc75rG0V9Fi1Yk1qRDUeHy7MQAWLK1CLSQy
	 F8ADKu7i/PH09hxl0cCbHmtYog4/pBwJVL1O8ut7sfybdXTaBDc+7SlSq43XZgZl/zezO
	 RJo6Rrk39rL0Re15XNaLiqaTKjURg2x0cjChzKIxSliymdgvzBSsGn4mVKxkBGLrzuyLV
	 gZTBG3/IQvzMR4wMJYdVYCJBzH6olJF4SSSmzBXTtzFaEUp3mIYtvwYQoHuqmtNRfsIkU
	 +WwtAaNbYDaeCPiBAzFBE0hySnT0F7Kay5+GtcfZoe0jhPuaM32YOl9kNhZ5lhXKYyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHXbh2U+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E3A606A31C
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UHXbh2U+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E161F000C4;
	Fri, 13 Nov 2026 07:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556098;
	bh=3xGFjppLBtcVr/lH+AvwGNS6vsfd+tT+jmCb3qTy84Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHXbh2U+K0ycbWFmegZXedQash5R3UREcMkUSOUVChe6p52/ZOH0plTJG5s8Xs5aU
	 B0s1EgSIuopYcj98Qgqa5HZhPhuvX1qeYjJRLwOVM48nfNHVHxBLtsKb3R+SYdOigo
	 Eceh+vx67UHxPa1y8fAE0glHZ5KKHlExt0PtWjQMbvDml9cKE/6CLVqqwosv4JYHVC
	 ARhfW6AKxElyDubzavW26fr7F37KFb7uils+ZvHoiEJqsW9QU/VugxCJ4NliIkmBY7
	 WSTpYeJmRsCcWGlxyqDRmW9PDNLyv30RUp0p+VYXMEMyjKLTMmdFL3Z7Q7UUoGpmgU
	 ZX38eMt4DOJig==
Message-ID: <sashiko-outbox-212368@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] platform/x86: dasharo-acpi: Extract dasharo_call()
 from dasharo_read_channel()
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RmlsaXAgR2/FgmHFmw==?= <filip.golas@3mdeb.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261113074347.2301465-2-filip.golas@3mdeb.com>
References: <20261113074347.2301465-1-filip.golas@3mdeb.com>
 <20261113074347.2301465-2-filip.golas@3mdeb.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 07:48:18 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Move the ACPI method evaluation out of dasharo_read_channel() into a new
> dasharo_call() helper, which additionally accepts up to two extra integer
> arguments after the channel's group and index. This allows the upcoming
> write and fan curve support to reuse the same code path.
>=20
> No functional change intended.
>=20
> Signed-off-by: Filip Go=C5=82a=C5=9B <filip.golas@3mdeb.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113074347.2301=
465-1-filip.golas@3mdeb.com?part=3D1

