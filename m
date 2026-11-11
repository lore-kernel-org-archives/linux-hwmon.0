Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413536;
	b=jWOI8Euy4UyxvEVBBmrIZkNhvxi1t5a0z4eQas/vD1h7gCJCz5xoIBYMGiG54qmKmZ83
	 crmEo/4AKkKr4BNZSJeayc2ET4ckZ5keHZFHVl5h2JYo9AMZbnwgyEK2/VQ7dolmwqNFh
	 mgDkCkOeNmZm580H+2ZfQUXY6/8Hud9neQ36not+FurKnFMfr3pVumEsWwt3fcHNjet62
	 3VuKExD5yVJazukJkJofduSqAkevi7UTlD9OT4v4sgNQ8w/U0b1HWwvnellGVmD+QUfJw
	 Wr1QrskhLEEfKTHZcvs47Ob9CoLX8CUaH2KmoSeEm1NqEOFJZfgbDWFRWiFqwbU1UmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9XO+kBaJYwpzwnc+YLm8DBOT14P4f5tPfORR5LtHLrU=;
	b=VPHwy1CdFYx1HJyrgsoCcJ0aWAZnqDpkHTmYfOekYjSkqB6sTNIebFGrmV5Ryjeg/SOY
	 O7Ab6HAiK2xvhbvyethgd0LDzCaZvEGR8JAijp02/k6jPDq6CT64cvFe3MuxoL3gFB765
	 C4LPBqN3rM+x4AasCYupKkQ+tdj5CWQ8hUqN5zdhzqGxPCdcJSU3Ch520XIN66DU09ByL
	 LBaJpKpfuk5cAhgL58Te7+fDTbFpoVlx4JidK/bSEkgoacvqh7dYi1OoZSZVpzYxgcGvV
	 rfX9NeqJFHeUltcaE4cEcuTpA/hCsKJZASzGOAzlq5hiUd9zR/Mp+eJwhF/yfbYp47A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghzVe9Ua;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB778606A332
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ghzVe9Ua
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4308A1F00A0A;
	Wed, 11 Nov 2026 16:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794413536;
	bh=9XO+kBaJYwpzwnc+YLm8DBOT14P4f5tPfORR5LtHLrU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ghzVe9UaL2Sa7+h9S/ltVqZqXMloQhy7+M//9MlcplTUDLaUTRAe2kNH3DK8ACtpB
	 RXwx/uUhTK04wwvgkyunrL6YNorvNg10FBGgJgPfjcLOmw0XL3jqoG+Tp2SxGl6LyC
	 xRyKM7fXa6PqhH7ya28rWJM9XOOkbVtANudn0EtuW5PnnzrzWbc7WXagyXPMo0nh4n
	 s3FXSiJo6Y/VEmdGaqszHJXnh2H7PlJ8URb1qrqir+w2lJkUzvHpzvz2lqGBtfjoo+
	 Wg4B19qtcw16b+d/03KXNIT34yKZPSsgJtdCLLEdCXzuQqUZHywcjbY8lulBFfq8ze
	 SuCLo/t14u9Qw==
Message-ID: <sashiko-outbox-209261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260
 to fan control whitelist
Reply-To: sashiko-reviews@lists.linux.dev
To: shadyabh <shady.abh@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111150435.75965-1-shady.abh@gmail.com>
References: <20261111150435.75965-1-shady.abh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 16:12:15 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] hwmon: (dell-smm) Signed-off-by trailer uses handle instead of
  real name
--

commit 161e915af112903c97c2188511e02fe97cd0316f
Author: shadyabh <shady.abh@gmail.com>

> hwmon: (dell-smm) Add Dell Pro Precision 7 16 PW716260 to fan control whi=
telist
>
> On the Dell Pro Precision 7 16 PW716260 the firmware fan control
> cannot be overridden using the default SMM method, writes to pwmX
> are ignored and pwmX_enable returns -EINVAL. The firmware AC fan
> policy also requests speeds below the minimum sustainable speed of
> the fans, so one fan repeatedly stops and restarts every few
> seconds at low load.
>
> Add the machine to the fan control whitelist using the
> I8K_FAN_30A3_31A3 SMM codes. With this, writing 1 to pwm1_enable
> disables automatic fan control, the fans follow the requested
> state (0: off, 1: ~2500 RPM, 2: ~3950 RPM), and writing 2 to
> pwm1_enable restores automatic fan control.
>
> Tested on BIOS 1.5.0 with kernel 7.2.15.
>
> Signed-off-by: shadyabh <shady.abh@gmail.com>

[Severity: High]
The Author header and Signed-off-by trailer use the handle "shadyabh"
instead of a full real name.  Per the Developer's Certificate of Origin in
Documentation/process/submitting-patches.rst, patches must be signed off
using a known real name rather than a handle or pseudonym.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111150435.7596=
5-1-shady.abh@gmail.com?part=3D1
