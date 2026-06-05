Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2097C3D47D9
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 18:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780685569; cv=none; b=OHRBsuzYBYiz582Un/4x6eGLl00239vRZ3NFW1BZVmDcSar5ajVEvWG26ILBvpZYYtR8OzprTxQSMSPZUhWPGjmyYK9jRHHKfxNyA5PpsqGjGtkYBxUjCCem45ZNmDLbIn43sHKxy6GiPmIKaq6hLoz5KCCjWHUyXi4Zisb131A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780685569; c=relaxed/simple;
	bh=/Q2p0gVkhBjgkHUgnr3Ir0nNnQSTusifZsVdw+xP2RI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aJZu49plSoxP1c+c9aGjcdXhVySLBzeE38ohoe5uPxRgqjM6MsfYjodnABnBYNejMWOZV303yMonOcjqzcF82XcyigXCd76xXJ7iNO4dEBDSzkPIruPpsSH3eIJYVMFFB+bzFYuSLVAwN3yYu0yJ1bR20EYEviAYbkbLXZ/erNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjPCdp5M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjPCdp5M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BCCB1F00893;
	Fri,  5 Jun 2026 18:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780685567;
	bh=Gmg2qhh/eTH6qpqMy+rKgn9d5+BjnSuwRorv/ZcXWHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VjPCdp5MzuYKm0/OWoYbCMNxP07QFd6p7AhWeRYoaRbYmgr/TXshety3KwJKFcztZ
	 aUkl3s0Q3vHDafRiqIxPPS+wYH9QNme4xhWRkhvwe7eDaU0BlG22+MZtxHZ1FPB3j2
	 /DpuZ2vBgFVjuE6kFI8Qg5gHgfFgEb66xBfjQ0qM+upXHQy3ROTx4FYwl9JLj/ZSvI
	 ALITRy2C0kIYA3DloOhvkE/l94X/OPTEAoVW+V6IpvlQjJqXywE6xuSd0yy/MstWl+
	 4vi95n3VklbhnD+vnRL6ScAnf1BhE8FT/NE5kZDv4o3i/URmS3ZJw4riZNAGlnpmn5
	 tUUgOol/EnbaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/9] platform/x86: dell-wmi-base: Use new
 buffer-based WMI API
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260605181433.188847-5-W_Armin@gmx.de>
References: <20260605181433.188847-5-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 18:52:46 +0000
Message-Id: <20260605185247.3BCCB1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds memory read in `dell_wmi_process_key()` when process=
ing eprivacy events with short buffers.
--

commit 24a36598ab5922d657cacfad988fd975e31c5cd6
Author: Armin Wolf <W_Armin@gmx.de>

platform/x86: dell-wmi-base: Use new buffer-based WMI API

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for the event data.

> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform=
/x86/dell/dell-wmi-base.c
> --- a/drivers/platform/x86/dell/dell-wmi-base.c
> +++ b/drivers/platform/x86/dell/dell-wmi-base.c

[ ... ]

> @@ -446,15 +448,15 @@ static int dell_wmi_process_key(struct wmi_device *=
wdev, int type, int code, u16
>  	} else if (type =3D=3D 0x0011 && code =3D=3D 0xe070 && remaining > 0) {
>  		dell_wmi_switch_event(&priv->tabletswitch_dev,
>  				      "Dell tablet mode switch",
> -				      SW_TABLET_MODE, !buffer[0]);
> +				      SW_TABLET_MODE, !le16_to_cpu(buffer[0]));
>  		return 1;
>  	} else if (type =3D=3D 0x0012 && code =3D=3D 0x000c && remaining > 0) {
>  		/* Eprivacy toggle, switch to "on" key entry for on events */
> -		if (buffer[0] =3D=3D 2)
> +		if (le16_to_cpu(buffer[0]) =3D=3D 2)
>  			key++;
>  		used =3D 1;
>  	} else if (type =3D=3D 0x0012 && code =3D=3D 0x000d && remaining > 0) {
> -		value =3D (buffer[2] =3D=3D 2);
> +		value =3D (le16_to_cpu(buffer[2]) =3D=3D 2);

[Severity: High]
This is a pre-existing issue, but does this bounds check fully protect
against an out-of-bounds read?

The condition checks if remaining > 0, but the code then accesses buffer[2].

If dell_wmi_notify() encounters an event with len =3D=3D 4, it will call
dell_wmi_process_key() with a remaining length of 1. This satisfies the
check here, but causes the assignment to read two words past the end of the
WMI event boundary.

Could an unexpectedly short WMI event trigger a page fault here?

>  		used =3D 1;
>  	}
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605181433.1888=
47-1-W_Armin@gmx.de?part=3D4
