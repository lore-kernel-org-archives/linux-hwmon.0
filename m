Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B746C1391
	for <linux-hwmon@vger.kernel.org>; Wed,  6 May 2026 04:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778040456; cv=none; b=JVpFyXC41aL1S0/C2BwnStuejqCEBJsw9XTT3b7yxC9z15zEagm2djCXASP42w0yJAY3qLxy6MaG+Uiy8pDWlstV9ZNoyBQjK3CV1vUJ1YaoVLs4GEGqQ3aV/Xg5dfb38TVvD8o6qYzQFfptIFrJhxR1b+CiA/rb3acIJoKC0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778040456; c=relaxed/simple;
	bh=upiGCSSkn0tm6yZGC1wnUYI2ShpnKyvxj6G92br9xV0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K2WJpKUzvMf/43VITgaB1ZtafMpY/sc3A/XUX8oZjYFyB8oTkcF+5LR3ws4CjBAPQXSoWt6ZcatTjb4128nLN/Mmj8HFRoPEyBfr5kA0hJp4P0JVAoLFXTGPpHJ2kdBwAwuXokDdxPZNNH7cwn+SEgYo/wCxXvn1T6e5saQ+P8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSr9aSG2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSr9aSG2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5081DC2BCB8;
	Wed,  6 May 2026 04:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778040456;
	bh=upiGCSSkn0tm6yZGC1wnUYI2ShpnKyvxj6G92br9xV0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QSr9aSG2rOiJhC8xs4Q/E3OCwxaVO2HA8gS05BNGevzKEs4Pab3J2zEkRD9ThdPL7
	 pUS6SaRj0hiVTZRgo9FnyKZFD1AOMZtyADlCQlZ04Z1eaNXCsDJeDcm4oJOFZhcimJ
	 c+1MKtCdMywXiz8Av8/o6fYBEp2OKJ2aQeV0nxbH4oQc96NOAX86BdIgX/w9AeWc3z
	 jc6XF4kh+z3pY9mSjK28h22I8QzWThX2hheKu77dw6c9QjbAZJFWQWy5NogqzuwSvI
	 jkuujV8MkqIuLaonaAN4Nu8LO9m/2r3Tebi7pRWf5mUY83lbOMqWcHJz2yPqOgGs/k
	 cc1c2JPh8PtSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] usb: xhci: add AMD PROM21 xHCI hwmon support for
 temperature monitoring
Reply-To: sashiko@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260506032939.92351-1-hurryman2212@gmail.com>
References: <20260506032939.92351-1-hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 06 May 2026 04:07:35 +0000
Message-Id: <20260506040736.5081DC2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Potential linker error when USB_XHCI_PCI is built-in and HWMON is a=
 module.
--

commit 66c564d56813f3e58d95a6491735b26bfb5eb91f
Author: Jihong Min <hurryman2212@gmail.com>

usb: xhci: add AMD PROM21 xHCI hwmon support for temperature monitoring

This patch adds hwmon temperature monitoring for AMD PROM21 xHCI controller=
s.
The hwmon code is built as an extension to the xHCI PCI driver and
initialized during the device probe path.

> diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
> index 0a277a07cf706..da41ebc272b0f 100644
> --- a/drivers/usb/host/Kconfig
> +++ b/drivers/usb/host/Kconfig
> @@ -42,6 +42,16 @@ config USB_XHCI_PCI
>  	depends on USB_PCI
>  	default y
> =20
> +config USB_XHCI_PCI_PROM21_HWMON
> +	bool "AMD PROM21 xHCI temperature sensor support"
> +	depends on USB_XHCI_PCI
> +	depends on HWMON

Can this cause a linker error if CONFIG_USB_XHCI_PCI is built-in (y) and
CONFIG_HWMON is built as a module (m)?

Since USB_XHCI_PCI_PROM21_HWMON is a bool, if its dependencies evaluate to a
module, it can still be selected as built-in (y). This would compile
xhci-prom21-hwmon.c directly into vmlinux, but the code references
devm_hwmon_device_register_with_info(), which would be exported by the
dynamically loaded hwmon module, leading to an undefined reference.

Would it be safer to restrict the dependency using something like
depends on HWMON=3Dy || HWMON=3DUSB_XHCI_PCI?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260506032939.9235=
1-1-hurryman2212@gmail.com?part=3D1
