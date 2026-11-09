Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794217664;
	b=NDgnp+DsubFVD/rI867jjpMl0kkyU0quJ0n0cWc0r6Y30otgrJNua9qCFogKQrrxKDvd
	 5Z2+QMLMyc+HU4KMQ+KlwL3Psjuae5LZb/X5AVHyhutgR6n75gR+vkvSyFx4HCtjLV+Vh
	 iNW7A1w8eeBo87HJBv6+letRuUUSA1SoAKAkUzqVpugs/ESwQSfb+A7gr9DKQrE1S6j2m
	 hPz2dHPXRYTcdVRoPTRAHaE0doLnSyoq5dAX07Vbrr2JVDQ65KLkRvTjh79B7uEGC5Qgl
	 p2seDGI+vG5DnQglFKJmUTEQuGeYMEbG+yuGdV8tsF5Bt02CJ3QhC0DM2vmpb35n0Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794217664;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=lEuYaTb7EGh0d1YgKVOPOtdNLISKHC0+3HlVovA3JS4=;
	b=5R33+euevs5R/BSIXYcw7Gs0zd7VKEYSaEsrApT4WlPJOw1z/yiT8iG6X1R/ymFMKDIo
	 VbniIdDvunJHT29pdgqHfeyfutpfg8j6qyGwhe3zCGiBTJ9UJJkVMHT9v/AAULiiQ2NHf
	 f66qKS16nA8/0ORDsYUB6tT73GR6KSioklei/mPiEZT1CGOKlu0s6QQpj9TbJLe4fOHi/
	 53sY7sRcwdtd8EMwci1NJNpeKNGxokG9dytTd5YDCnB5LuDFI7/Jj/rSh3KjdjAqNNKF9
	 XS9/phnz1qco+gHK3RD47wRBLTBffay1mm83HtrA8/BuQcVVPZrOXYGQRy3pCfQ+m9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxoUp66p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785AE606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QxoUp66p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CCB1F0089F;
	Mon,  9 Nov 2026 09:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794217664;
	bh=lEuYaTb7EGh0d1YgKVOPOtdNLISKHC0+3HlVovA3JS4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QxoUp66p4Si3ZlwZjlJuBIgtqQHzpvx9SGE/VJdksXNTT8TOxEtK39yqbKn4mvU1N
	 8RYxd4MzB+9O7hWCW2xZpclpHA3r7fqapmyisp7IHNwhvnOFWRQ/zJsc2XFE51x6A0
	 7Oj5kYTmEL3k3tnMyLwIVbhI1U8fKA57JhG3mRr+DDuC3UqqyGNjek/438c362OPbU
	 c+WaoNnhBYtRwyeTIuk38HcLvlVYhPqWIF5w/Ssk26M8gNS9phjMLucXTSRGJP40Fc
	 izuJIAXkytUVl7OBiMRJOiKdvUguy+5E0bdCDG82VGVzwXn+pESdDLUsNR1fA9gNzX
	 JK9U3nbIkbebg==
Message-ID: <sashiko-outbox-204742@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (vt8231) Clamp voltage limits before scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261109093739.5539-1-zhujun2@cmss.chinamobile.com>
References: <20261109093739.5539-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 09:47:43 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: zhujun <zhujun2@cmss.chinamobile.com>
>=20
> The voltage limit stores multiply an unrestricted unsigned long before
> clamping the register value. Large inputs can wrap and select a low
> threshold. On 32-bit systems, writing 4483265 mV to a regular voltage
> limit selects register 3 instead of 255.
>=20
> Bound the input before multiplication, using the separate scaling for
> input 5. This preserves the conversion throughout the representable
> range.
>=20
> Fixes: 1de9e371b89e ("[PATCH] hwmon: New vt8231 driver")

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109093739.5539=
-1-zhujun2@cmss.chinamobile.com?part=3D1

