Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A5648595A
	for <linux-hwmon@vger.kernel.org>; Sun, 20 Sep 2026 22:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789945131; cv=none; b=aQk1S5Fh6NFzVA/BAQlp444rWeuAOeGdax+/AVm8G7/9eWfyszoHEZdhwbxfZkNSCl23q03wZSfg95yTXnzL9uY7uRfRChNfASmAxNU0v1x8O6oyd5h3l8Jkgwb1stX5cjxqc4IAyWBeC+SchGwIvNwR/F2TkXgReri5QcSpDU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789945131; c=relaxed/simple;
	bh=iw7RgN2BwgdyrmFZhNPKjrOarIyMaXsZWrH6SVwoH8s=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Pk7+uOl41lPAnKSLg+jVNoWDyOAJvVcY2kmFu9d6wW/BX6UFWGodATaB8PLdlHgujS6igIxUL0WgTIzq1SOY4QF3lJgBokqHuyk8ULHbdbW316isjvOZQCi5Hg3+o7GdkDUUQWW0FUwfkIZY/CnzfkTAT9CDBG/TsorjHBPgi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Vfh1bU6Q; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Vfh1bU6Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1789945124; x=1790204324;
	bh=yRHs48k1rHENR3BeH2Zimlxng6X5RN91GR34qXDxoeE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Vfh1bU6QazK8we9NRQLnPxGGZAWZM7e444eWip/5Rk2O1MWkwyNb4iThKNTsJ6eAu
	 p6LCYMVpCyj9/DOIHg6/WIq5zX1KwhwJYpiV0aB86yyreCSPbpxR/Ckjy+Tf0Shl3i
	 zZOjQEeLoQaP7CfFp7t8S/1ge8Z9VfujJxFlr96fL1k8gCKYnEJPsGMdNdI/r2Ce3N
	 nxL75yugE3zsV+3AjipJgBgOQxqgTktSKj7Wsr2b7vlF8oB8zdFp+0rvn7eZ/OeMbC
	 9NjPyIGkJwAiDzoKJn7OeLCGkvRsv+dVYkKOHylPirn99pfMYH5vCo476waN5tkHic
	 CY1WA8lF/flJA==
Date: Sun, 20 Sep 2026 22:58:38 +0000
To: "rydberg@bitmath.org" <rydberg@bitmath.org>
From: giosue <giosuet@proton.me>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: =?utf-8?Q?[BUG]_applesmc_fan_control_does_not_work_on_iMac18,2_=E2=80=94_fan_remains_at_0_RPM?=
Message-ID: <wpJ3geGyPY7638DqTwQVVjZR0xnwwPcQg9_-6GBR3phAdb0FXZc_cbYNFVs0x26fPq1F1TUfgYZgrjPKESiDBg-ZqoEODMEXsyneOKR9QK0=@proton.me>
Feedback-ID: 220127777:user:proton
X-Pm-Message-ID: 065de0f3d562a3da06c6d5d3fbe43d3106206493
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Henrik,

I'm josh, a below average linux user.

I am reporting a possible applesmc fan-control problem on an Apple iMac18,2=
 (21.5-inch Retina 4K, 2017, Intel).

The machine is able to report temperature sensors under Linux, but the syst=
em fan remains at 0 RPM and does not respond even when attempting direct/ma=
nual fan control through the Linux AppleSMC interface.

Hardware:

-   Apple iMac18,2
-   21.5-inch Retina 4K, 2017
-   Intel platform

The problem is reproducible across multiple Linux distributions and kernels=
:

-   Linux Mint 22.3: fan remains at 0 RPM
-   Pop!_OS Live: fan remains at 0 RPM
-   Fedora Live: fan remains at 0 RPM
-   Fedora currently runs kernel 6.19.10, and the problem is still present =
there

This therefore does not appear to be specific to Linux Mint, a particular d=
esktop environment, or the mbpfan configuration.

I initially used mbpfan, but changing its configuration had no effect. Sinc=
e mbpfan operates through the applesmc interface, I then tested fan control=
 at the lower level rather than relying on mbpfan.

The important observation is that direct/manual fan control through the Lin=
ux AppleSMC interface also does not cause the physical fan to start. The fa=
n remains physically stopped at 0 RPM.

At the same time, temperature sensors are readable under Linux. The machine=
 therefore appears to be able to communicate with the SMC at least sufficie=
ntly to retrieve temperature information, while fan control does not work.

On one occasion the CPU temperature reached approximately 100 =C2=B0C while=
 the fan remained at 0 RPM, so I powered the machine off to avoid thermal d=
amage.

I have also considered whether this could be a distribution-specific proble=
m, but the same behaviour occurs with Mint, Pop!_OS and Fedora. I am curren=
tly also considering testing Debian 13, whose kernel is in the 6.12 LTS ser=
ies, to determine whether the behaviour changes with an older applesmc impl=
ementation.

The particularly interesting part seems to be the iMac18,2-specific SMC imp=
lementation. The current Linux applesmc driver contains support for SMC fan=
 keys including:

-   FNum
-   F%dAc
-   F%dMn
-   F%dMx
-   F%dTg
-   FS!

However, on this iMac the fan-control path does not appear to have any phys=
ical effect.

I would therefore like to ask whether iMac18,2 is expected to be fully supp=
orted by applesmc fan control, and whether there are known differences in t=
he SMC fan keys or their data formats on this model.

I would also be interested in knowing whether additional diagnostics would =
be useful. In particular, I can provide:

-   complete dmesg output related to applesmc
-   modinfo applesmc
-   the complete contents of the applesmc sysfs directory
-   all fan-related sysfs attributes and their values
-   kernel version information
-   DMI information
-   any other SMC key information that can be safely obtained under Linux

If useful, I can also boot macOS on the same machine and collect informatio=
n about the SMC/fan state there, so that the SMC keys and values can potent=
ially be compared between macOS and Linux.

My main question is therefore whether this could be an applesmc compatibili=
ty/implementation issue specific to the iMac18,2, rather than a userspace f=
an-control problem.

Thank you for your time, and please let me know what additional information=
 or tests would be useful.

Best regards,

Josh.

P.s: most of this email was ai written because i'm no expert and i wanted t=
o be precise with the details. Hope you find it useful. Thank you again.
