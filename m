Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334223D669A
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Apr 2026 17:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775671095; cv=none; b=U9FwE6DECr1mFWGtcP+wdhGJCwSRh2eZwcNDC2kzOpzC1f77nx/uLvFoe/V6IDiGmgAqqtA+IIMi9jhqg8E3K13KPvSR8+zhgEOC1E/KxAVoXDWQe35NylsI2i/YErvD0tbGohvtBy3xH160qVt4V/uj6qE0tJCMuDbF/jvolYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775671095; c=relaxed/simple;
	bh=0P7CN0L/kYaK5pHB7eKbrUjqsW8FyZIyndQtW3szjek=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a4IHCCH1N4QPX6zI9nk55pisn7wPfyFHoHRvbThrR2fz73PD3XZa2wvGsW5ViMkd8ShomuGo4qQBL0RAkNiNIpB5Xa5hU/Ow8fs2vzfODijBlYqMCumKTLzRzBM9wTm1IzKMaD6j5uFeRo28XAZ66o2H+YYQlt6iHQAlAVjMoh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnsgh8Gv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnsgh8Gv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934BFC19421;
	Wed,  8 Apr 2026 17:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775671094;
	bh=0P7CN0L/kYaK5pHB7eKbrUjqsW8FyZIyndQtW3szjek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=jnsgh8Gvc8G6HE0tVwL1EY7Qh9Hg/jhdzLpjZ72MLJTFeaAkZaBbcFBind3GrY6kc
	 6vHPZyDwitB9uILb8dLkClyRcNS6WzIiLlp+AC/b+e3IEfOqO6yLvwEfLwL632467V
	 nxuTCAJjBxf4YiYuSbA4Ziz9yxIWhEpiI7605S7l7+EFCRg2Hh+wrpcHO/ZG9cYzhE
	 LTeLB0b30qxhPsBEB8/OwfRH9cCo1XZnm0PCAROFvlGkRCvuQFUyF24lujCw/7ZAEq
	 QQj8Fyplg8ZgljFKBfjJam7KSef9ZnqHdRWGL7qPrR8KGwp7tq6n+ZzhiaFGuFn02Q
	 jKMxb2+JPjUoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: (powerz) Fix use-after-free and signal
 handling on USB disconnect
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260408163029.353777-4-sanman.pradhan@hpe.com>
References: <20260408163029.353777-4-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Apr 2026 17:58:13 +0000
Message-Id: <20260408175814.934BFC19421@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [Critical] Unsafe DMA buffer allocation resulting in cacheline sharing an=
d memory corruption
--

commit e52b87f2333c018b83f387af6cae9b706448d9b1
Author: Sanman Pradhan <psanman@juniper.net>

hwmon: (powerz) Fix use-after-free and signal handling on USB disconnect

This patch fixes several issues in the powerz driver related to USB disconn=
ect
races and signal handling, including a use-after-free and incorrect return
value checks.

> diff --git a/drivers/hwmon/powerz.c b/drivers/hwmon/powerz.c
> index 4e663d5b4e330..0b38fdf42ddbe 100644
> --- a/drivers/hwmon/powerz.c
> +++ b/drivers/hwmon/powerz.c
[ ... ]
> @@ -241,9 +246,12 @@ static void powerz_disconnect(struct usb_interface *=
intf)
>  {
>  	struct powerz_priv *priv =3D usb_get_intfdata(intf);
> =20
> +	usb_set_intfdata(intf, NULL);
> +
>  	mutex_lock(&priv->mutex);

This isn't a regression introduced by this patch, but is there a pre-existi=
ng
cacheline sharing issue between priv->transfer_buffer and priv->mutex?

The transfer_buffer is a 64-byte array embedded at the start of
struct powerz_priv, immediately followed by the mutex and completion:

struct powerz_priv {
	char transfer_buffer[64];
	...

While devm_kzalloc() guarantees ARCH_DMA_MINALIGN alignment for the start
of the structure, it does not guarantee padding. On architectures where
ARCH_DMA_MINALIGN is greater than 64 bytes (such as 128 bytes on some
ARM64 systems), transfer_buffer and the mutex will share the same CPU
cacheline.

During a USB read, transfer_buffer is mapped for DMA_FROM_DEVICE. When the
transfer finishes, the DMA API invalidates the cacheline. If another CPU
modifies priv->mutex here in powerz_disconnect() concurrently, those
modifications could reside in the CPU's dirty cacheline and be silently
erased by the invalidation.

Does this violate the DMA-API rule that DMA buffers must not share cachelin=
es
with other variables, leading to silent lock state or wait queue corruption?

>  	usb_kill_urb(priv->urb);
>  	usb_free_urb(priv->urb);
> +	priv->urb =3D NULL;
>  	mutex_unlock(&priv->mutex);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260408163029.3537=
77-1-sanman.pradhan@hpe.com?part=3D3
