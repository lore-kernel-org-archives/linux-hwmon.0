Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5461B4138
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 01:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775783075; cv=none; b=nijHuEy6odY/dYfxpAU08lsSaxNh3V30juyFToYgPmZ+Xw4G/Tc9NuptaE+8NupxYk7ZqnFRAIyZOxWKWb3LkKCja5+xPOWVbHy//h7hnUrJdFKjFzXagGI0Ubb7hKQr+kqIxb+3Zd0er7ZfZ3335OGEinZmhpq4d75T/cbbMt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775783075; c=relaxed/simple;
	bh=z3ybUXNz8eeig2w5/kaZepRPeNI4uFwgW8vSZMPPxWE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q6nwTh8KEMpx96Mo/IgMgvtvbxFPqwSAi3hSKzShqPGAIpQyd5RZQ2Ww5zrYWH/k/RvG9gHsTptGk6I7Bo++tHP/SRVqIUbOhol3+G9hIFVcskAFWVIcBoaSijr/oOvHyq+cz4TM3LqRGtx2zd9sjs424X0CW2SVRz8oOpT53Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgQfMk2h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgQfMk2h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40681C4CEF7;
	Fri, 10 Apr 2026 01:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775783075;
	bh=z3ybUXNz8eeig2w5/kaZepRPeNI4uFwgW8vSZMPPxWE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=dgQfMk2hoS9Fv+GEhgJLXYbt7IRaPPvhDb2tzXldZPpVxy+r7EjkbW3w8sUE5X1sb
	 /6SQcoNj4vz68zjXeP2C13iODzKJVrwRD+bszIsj8rJgy1bp3T8HI9zmyY95ulcJmp
	 ab10fvsdtUWOK7p2jckbNuxoIh4rtuB/fZIN/LceeQgpqaYhYUE3nopBQ92QS/xsY4
	 Bppo2RwfPNB8HO/12kZkZuqf6g1z0Fw6jqz2rbuu89PwLrgp0yrm22xdHJaEOc9DjE
	 o8ffNom9rUuRkcjBIIsB9gBMSRKcHn/bkVlvHpy7g1qGIokCCsIRZv4M3jecDk9qZH
	 NkTlI2TLL9AUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] hwmon: (powerz) Fix use-after-free on USB
 disconnect
Reply-To: sashiko@lists.linux.dev
To: =?utf-8?b?UHJhZGhhbiwgU2FubWFu?= <sanman.pradhan@hpe.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260410002521.422645-2-sanman.pradhan@hpe.com>
References: <20260410002521.422645-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Apr 2026 01:04:34 +0000
Message-Id: <20260410010435.40681C4CEF7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Unsafe DMA Buffer Cacheline Sharing (Pre-existing Bug)
--

commit f830fe65a5d61278ed5e2ee2dbcd0c937471cfd4
Author: Sanman Pradhan <psanman@juniper.net>
hwmon: (powerz) Fix use-after-free on USB disconnect

This commit prevents a use-after-free by setting the URB pointer to NULL on
device disconnect, and checking for it before starting any read operations.=
 It
also moves the hardware monitoring registration after the private data is s=
et.

> diff --git a/drivers/hwmon/powerz.c b/drivers/hwmon/powerz.c
> --- a/drivers/hwmon/powerz.c
> +++ b/drivers/hwmon/powerz.c
> @@ -108,6 +108,9 @@ static int powerz_read_data(struct usb_device *udev, =
struct powerz_priv *priv)
>  {
>  	int ret;
> =20
> +	if (!priv->urb)
> +		return -ENODEV;
> +
>  	priv->status =3D -ETIMEDOUT;
>  	reinit_completion(&priv->completion);

This isn't a bug introduced by this patch, but looking at the structure bei=
ng
modified here:

struct powerz_priv {
        char transfer_buffer[64];
        struct mutex mutex;
        struct completion completion;
        struct urb *urb;
        int status;
};

Can this layout cause memory corruption during DMA?

The transfer_buffer is embedded at the start of the structure and is exactl=
y 64
bytes long. On architectures where the CPU cacheline size or DMA minimum
alignment exceeds 64 bytes (such as 128 bytes on many arm64 platforms),
transfer_buffer will share a cacheline with the mutex and completion member=
s.

When the USB core unmaps the buffer after an inbound transfer, the cache
invalidation operates on the entire cacheline. If the CPU concurrently modi=
fies
the mutex or completion structures (for example, when a thread is placed on
the wait queue via wait_for_completion_interruptible_timeout), will those C=
PU
writes be destroyed by the DMA cache invalidation, or conversely corrupt the
inbound DMA data?

Should transfer_buffer be allocated separately, or forced to an explicit
alignment to ensure safe DMA?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260410002521.4226=
45-1-sanman.pradhan@hpe.com?part=3D1
