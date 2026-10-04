Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A093FFD
	for <linux-hwmon@vger.kernel.org>; Sun,  4 Oct 2026 00:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791074236; cv=none; b=tIdpT9aRpZRlhek/ZieUfGz8Opw3860V0pfXT4jfKEuwrQeuTP00wVWifqmRhN/B3LGe76MhFIKSEAjp0BrT9o84dOgcYN9YjsEQCIJ/laE3PkFY94WzBulL20NSafGk77Eir8cHm0k0q1BFgpPR7THFr3X9uwJm0X98PpNEihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791074236; c=relaxed/simple;
	bh=TfhKg3gInHLXYz/f4WvGjdkht5YR2wJLyi9udd2S6hg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oqMy3iqaCNpn3P4WLIZCGoo8YYBjk0rQK0RUr1r2fYKzZW+JV61qtTk2jKcO5Z3gInzAA7P7ltQ8rCjuXJ3xRxlbBhLrNYm8weayLRgoWJeBzsC4jY+wAV3laPCz9BiydDnLGe2S0XGswWXpHCLtWTGiA2l/hdM/BEQuOBXd8Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGo7w2aF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGo7w2aF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51C91F0089B;
	Sun,  4 Oct 2026 00:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791074235;
	bh=enJ4qHgEyEjTNKrQ+8xV9O3/+bPcpxgioZwjHgJ68p8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KGo7w2aFQEaGUr68nReioM+5CpUmX1W5yfpH8mtV0aVLGXTSeD5GXfq+Mlg22yDQj
	 SMMVnY0hWA6kpg/nwmwfsNvWp4RAmAt8yUaAoTsVvRDK9RsX8U5lfgtGNJejkOjaRQ
	 tK1wor/pr9GfwZQXVpkT+jONpqXd047CvEUXEX1SUFQSjV6IzZsEv3hfwBw41RnSds
	 lQ/bs27Y/8OkwlrYGI2MdVwwMAl3aNbrgu7o9gccH7Xlf9zNv1XZpxsVnBlHPmhKCO
	 I921VPMUKD6282o9qCG2N/JIU4HukgYyxkQdsXiPRyN7dpYptX+Y5X6GjH0/ZKmARL
	 5G2vaIgfUEvCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mirko Jechow" <mirko.jechow@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261004002731.49927-1-mirko.jechow@gmx.de>
References: <20261004002731.49927-1-mirko.jechow@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 00:37:14 +0000
Message-Id: <20261004003714.D51C91F0089B@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] usb: xhci-pci: missing PM quirk for new Prom21 chips and incompl=
ete refactoring
--

commit 88cfe4d5f35bfe8fa1398a1c64bdb16fc99db18c
Author: Stephen Horvath <linux@stevetech.au>

usb: xhci-pci: Add AMD 600 series to xhci-pci-prom21

This commit adds the device IDs for the AMD 600 series chipsets (which feat=
ure
Promontory 21 chips) to the xhci-pci-prom21 driver and documentation. It
ensures they are recognized alongside the 800 series chipsets.

> diff --git a/drivers/usb/host/xhci-pci.h b/drivers/usb/host/xhci-pci.h
> index 11f435f94322a..533efc7db8012 100644
> --- a/drivers/usb/host/xhci-pci.h
> +++ b/drivers/usb/host/xhci-pci.h
> @@ -4,6 +4,9 @@
>  #ifndef XHCI_PCI_H
>  #define XHCI_PCI_H
> =20
> +#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7	0x43f7
> +#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43F9	0x43f9
> +#define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FA	0x43fa

[Severity: Medium]
In drivers/usb/host/xhci-pci.c:xhci_pci_quirks(), there is an existing quirk
check that applies to one of the Promontory 21 chips:

    if (pdev->vendor =3D=3D PCI_VENDOR_ID_AMD && pdev->device =3D=3D 0x43f7)
        xhci->quirks |=3D XHCI_DEFAULT_PM_RUNTIME_ALLOW;

Should this hardcoded value be refactored to use the newly defined
PCI_DEVICE_ID_AMD_PROM21_XHCI_43F7 macro?

Additionally, since the new Promontory 21 chips (0x43f9, 0x43fa) are identi=
cal
silicon to 0x43f7, do they also need to be added to this check?

Without this quirk, runtime PM will not be enabled by default for motherboa=
rds
with B665 or A620 chipsets, causing a power regression when initializing the
xHCI controller.

>  #define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FC	0x43fc
>  #define PCI_DEVICE_ID_AMD_PROM21_XHCI_43FD	0x43fd
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004002731.4992=
7-1-mirko.jechow@gmx.de?part=3D1
