Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6E9B495524
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Sep 2026 11:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781322; cv=none; b=goxcx0PfSQ0rrXAdxJZHzZYe1sLZO9AM9Xhn1z8IPNvV0uEQCDaxtcjVrHgJ/1hR1BGpt6IaCgb4D8yAjye8rOF3fQwTYVKCIiazre/efGHD27Scj+OuS722959dRmhOQTseG5fyR1uC+7SxOGXGn3YveLkfb281jRzcCLOlK8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781322; c=relaxed/simple;
	bh=tXZcSVqv8UB8KT/rDYBCFx8+9D7+6LLB5/yY0VjJeFk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=geqcAmnh/tkSUZCmNeuDZ2y/jFNsCrsZrUe1qIMplvNYuDIEHr8Q29TnrFLkf4xQry6QY0twzrjbVXDuX4WX/xYDv67vhU7eypauIU0xYn5puh4hBeGvgD13rxQHknijYamX4y1kSvHspM5H3KGKvbRi5YuIWCl9/ZgmDe1RBh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDzV2qzZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDzV2qzZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1651F1F00A3E;
	Mon,  7 Sep 2026 11:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788781320;
	bh=nHZkqiSXvxEjUjFi0r9PC9pd+9z9oUTQJG714JjvCIQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oDzV2qzZU7Cn0i78E47RJ1IAw9Tixkt6JHz+xolnCSapNg+N7DYQfi4kJ1pG2krj1
	 nxVivQmGET9d1eqmNCtOcKelGX6FabXLv3+SlxNPPh7HcHNgBWR/ZXxZb/oVIhyLJT
	 jb3m5HpBYyHcM5qcSYCIC5h8B+Skf9w477CM4tWmV7Uy5tmvcXQNS2qG2Gg/rR+2Sn
	 VQah8I0UEfP3moMpqEsq6FgDLgOSrWwLgjiv7ECl6q2xJinRvyfBRLIHf37ky0+bIa
	 RZrVBlQujBUMgwVxjCrDPLXHkGUNEEiHji09n041LYGwwBwWfbHh6bf1qhZoTV/dQ0
	 nIYoht1BbrYlA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (yogafan) Update reference database and
 contributors for new models
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergio Melas" <sergiomelas@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260907113029.1532654-1-sergiomelas@gmail.com>
References: <20260907113029.1532654-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 11:41:59 +0000
Message-Id: <20260907114200.1651F1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message and documentation claim support for new model=
s (Yoga 740-15IML and IdeaPad 3 15ALC6 Ub), but the required driver code ch=
anges are completely missing, meaning the driver will fail to probe on thes=
e devices.
--

commit abc418693a23c59c4a3eff683b30c6c57e8bcc13
Author: Sergio Melas <sergiomelas@gmail.com>

hwmon: (yogafan) Update reference database and contributors for new models

Add documentation entries for the newly supported laptop models
(Yoga 14cACN 2021, Yoga 740-15IML, and IdeaPad 3 15ALC6 Ub) in the
master reference database table, and include the new contributor.

> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafa=
n.rst
> index 9ff5db5dc08ce..5c21c50b7c4fa 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -87,6 +87,9 @@ immediately to ensure the user knows the fan has stoppe=
d.
> =20
>   MODEL (DMI PN) | FAMILY / SERIES  | EC OFFSET | FULL ACPI OBJECT PATH  =
        | WIDTH  | MULTiplier
>   -----------------------------------------------------------------------=
-----------------------------
> + 82N7           | Yoga 14cACN 2021   | 0x06      | \_SB.PCI0.LPC0.EC0.FA=
NS        |  8-bit | 100
> + 81TD           | Yoga 740-15IML     | 0x06      | \_SB.PCI0.LPCB.EC0.FA=
NS        |  8-bit | 100

[Severity: Medium]
Will the driver successfully probe on the Yoga 740-15IML?

The commit message and documentation claim support for this model, but the
driver code changes appear to be missing. The documentation specifies the
LPCB ACPI path. When the driver probes on a Yoga 740-15IML, the generic
Lenovo Yoga DMI quirk is matched, applying yoga_8bit_fans_cfg, which
searches for the ACPI path \_SB.PCI0.LPC0.EC0.FANS.

Since the device uses LPCB instead of LPC0, acpi_get_handle() will fail
and the driver will return -ENODEV.

> + 82KU           | IdeaPad 3 15ALC6 Ub| 0x06      | \_SB.PCI0.LPC0.EC0.FA=
NS/FA2S   |  8-bit | 100

[Severity: Medium]
Will the driver successfully probe on the IdeaPad 3 15ALC6 Ub?

The documentation specifies dual fans (FANS and FA2S), but the driver only
contains a single-fan configuration (FAN0) for the IdeaPad 3 15ALC6 DMI mat=
ch.

When matching the generic IdeaPad 3 15ALC6 quirk (using ideapad_8bit_fan0_c=
fg),
it will probe for FAN0 instead of the required dual-fan FANS and FA2S paths,
resulting in probe failure. Are there driver changes missing from this patc=
h?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907113029.1532=
654-1-sergiomelas@gmail.com?part=3D1
