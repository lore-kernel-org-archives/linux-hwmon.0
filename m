Received: from mta1.migadu.com (out-41.mta1.migadu.com [95.215.58.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9F43644BE
	for <linux-hwmon@vger.kernel.org>; Thu, 27 Aug 2026 06:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787812805; cv=none; b=bQLC19OnMSf3FkxpWnGTeSh+JevQLzF9WExCiZvlRZd8WV1i52Li4+4nQIvVzC+yOY4irF0/f/FFW5xhgxJdla+PlQA2hZqEx2HHnSzc5TVFRjBMLBLTygBo92l7EyTTx5q8mY4CozmJqzUgvoKRL84YQ+hgXezN9wvxZJYf1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787812805; c=relaxed/simple;
	bh=m3EBblnKDAGIdH9tcjTA1Ngw0Wg21uv1CZPG3SHJxuA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 In-Reply-To:References; b=D+VS1tt7fuz0djo5ANP6nYKWKkgbH/8Tv58WIG+Cf84HdRhZxIEejbkIramfK8N1SZzwHBK4yvMAZ7pIGkdhCowhQmHO9DFDIBTYmUgHJdqsZL6Dpg0eCIwjtkN/02tSUtTva/E4oW6iBDe/UyXqfj4oLkQwITbaqmLAR1571VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uMNycoz5; arc=none smtp.client-ip=95.215.58.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uMNycoz5"
X-Envelope-To: linux-hwmon@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m3EBblnKDAGIdH9tcjTA1Ngw0Wg21uv1CZPG3SHJxuA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787812801; v=1; x=1788417601;
 b=uMNycoz5nqVOQ9i8+cdDP+jjzmN9IhQLfPDokmNhzeXuUnPueUqSwQHBERR0Ep2XtYX15VGR
 M7ANjiZvBbclQhVluxV9f7r8zeVFhNZpqt0LuTVNJef1RksQ2R2MrVWylo22q8PXn5pHRc6/pP5
 xJjNyxYk8KUkPEFAkbwHPvGU=
X-Envelope-To: linux-hwmon@vger.kernel.org
Received: from localhost (8.211.180.184)
	by mta10.migadu.com with ESMTPS id 5cc20cb2f0893b0a;
	Thu, 27 Aug 2026 06:39:59 +0000
X-Mizu-Trace-ID: 5cc20cb2f0893b0a
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 27 Aug 2026 14:39:49 +0800
Message-Id: <DKZIQPBOE02W.2DFMAOQGYO442@linux.dev>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-hwmon@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
From: "Troy Mitchell" <troy.mitchell@linux.dev>
To: "Troy Mitchell" <troy.mitchell@linux.dev>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Guenter Roeck" <linux@roeck-us.net>, "Paul
 Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert
 Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>
In-Reply-To: <DKL487DPH7KA.3GNYMRSBR1JY3@linux.dev>
References: <20260805-ctl2301-v3-0-fd4b8ffb5b0d@linux.dev>
	<20260805-ctl2301-v3-6-b86c75d1c552@linux.dev>
	<20260805134119-GKJ77474@kernel.org>
	<DKL487DPH7KA.3GNYMRSBR1JY3@linux.dev>

--f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 10, 2026 at 04:20:05PM +0800, Troy Mitchell wrote:
> My intention here was to keep all board-specific pin configuration
> overrides under a single &pinctrl block, so that they can be found and
> maintained in one place. Using a separate top-level reference for each pi=
n
> group would tend to scatter those overrides throughout the board DTS as
> more groups are customized. The &pinctrl block is also placed immediately
> before the &i2c6 consumer.
>
> Would keeping the current structure be acceptable for that reason? If you
> still prefer the direct reference, I will change it to &i2c6_1_cfg in the
> next revision.

I withdraw my earlier suggestion to keep all board-specific pin
configuration overrides under a single &pinctrl block.

After checking existing board DTS files, I found that the direct-reference
style is already in use. For example:

  arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts

adds the board-specific bias-pull-up setting directly through &i2c1_pins.
Likewise:

  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi

extends &mmc0_pins directly.

Both forms produce the same node override, but since the reference-based
form is already used in the tree, we should follow it instead of introducin=
g
a different structure here. I will change the board-level override to
&i2c6_1_cfg in the next version.

                                            - Troy

--f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCao/btSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/6QAEA8dCtfup87U2o
snvjwoIwNCa2Z99Am38hnnyreNWzGecA/03n71wIE+T3csVbRbAT21+VwQ2RuK80
7pZ57h/HWuEH
=bLKp
-----END PGP SIGNATURE-----

--f6f49b862d884bb785fffb47c78ded9bdb2222b8f0b517953386ece06d64--
