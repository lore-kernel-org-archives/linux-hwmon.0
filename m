Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270C936CE03;
	Thu,  9 Jul 2026 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604765; cv=none; b=NaKQDPIANcRQIttNss7T1QEtoKGsMEEI8yPnFDfFGnKCA4e105+EnsSCsftJhKdS2uL9IlYfOJMPn30gGoPpVHT1jNfUHGJKtuRyh+mycsgybVLfmr07iEa3OiiJIB+UqsUGCuX3/GTj0F9MVto/uc1657VLSU3+a377V4eOpKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604765; c=relaxed/simple;
	bh=cNnxRlxbVdvh+77Yo4JQ+xQypHjlnl1Eic9pJOfQ4Sc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j4pX6Fy1u9ePh6Rn72zhsuWw4DMXc2qUARIFT+hZlj0Ar2mDdsZmiF0XZvCBTLQKxByrHjhMHmjSRcrW43Tk5gIkxAw3TtKEcP37fIraTVDPQVuTBGe+eRByQ0ut/YGZ9P0sTZuz1pYn2YTC4Mn/nsKMI3ecCs/pf9LA27V0NeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dm9D2KYj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dm9D2KYj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 696A71F000E9;
	Thu,  9 Jul 2026 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783604762;
	bh=xyzTtYhYIcJKZLRc5OUAo+s25nPWKfYJkM72Ao+GPAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dm9D2KYjXn+q5ycv/arHYE3+MKgFZ+RTqjKRjYdDuBtXgMkbiiiIYFUtSwtP42MdT
	 PhnBxowpHEtrPI5J68n0C9WELkXDk5QF9K3xdwJFcDY1FtqQXMeQZMBrjKJCLWhzDL
	 TknhpXuVNG9ZUsqBXShYeklniybAN0svrJXnt28BbjiOkfPWRfQO2Gw7dn97ZJZ2bC
	 9/WYsgfsTvwj4FX337UsvWQeOMnRXdRcpsQkh+YIdsD1FBYZhlAJNGu2Gai0jPXj23
	 IbcGXr/gALOiJela+/IckhrTKUp6BlOWMeJxLdTKO6sIneaP9GMFbZHBlwusitqf+A
	 ybf52Kq48KoSA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Simek" <michal.simek@amd.com>
Cc: imx@lists.linux.dev, linux-hwmon@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 13:46:01 +0000
Message-Id: <20260709134602.696A71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch fails to fully remove the 'ARM SCMI' prefix from modul=
e descriptions, Kconfig help texts, and comments, contradicting the commit =
message.
--

--- Patch [1]: [RFC PATCH] firmware: scmi: Make SCMI arch independent ---
commit 60ea398dd3e0168551de4ef6f284874ff73c9025
Author: Michal Simek <michal.simek@amd.com>

firmware: scmi: Make SCMI arch independent

This commit aims to make SCMI architecture-independent by removing ARM/ARM64
Kconfig dependencies and dropping the "ARM" prefix from descriptions, file
names, and documentation.

>     That's why get rid of ARM prefix and description from documentation, =
file
>     names, folder names, MODULE description, module names, Kconfig and
>     comments.
>     But keep origin Kconfig symbols not to break existing users.
>    =20
>     Hwmon, pinctrl, powercap, regulator, reset, clk and cpufreq scmi driv=
ers
>     already miss arm prefix that's why synchronize all of them to be with=
out
>     arm prefix.

[Severity: Medium]
Did we miss a few files and strings during this synchronization?

For example, drivers/hwmon/scmi-hwmon.c was omitted from the patch and still
contains:
MODULE_DESCRIPTION("ARM SCMI HWMON interface driver");

>  rename drivers/firmware/{arm_scmi =3D> scmi}/bus.c (100%)

[Severity: Medium]
Do we also need to update the MODULE_DESCRIPTION in this file?

It currently retains: MODULE_DESCRIPTION("ARM SCMI protocol bus");

>  rename drivers/firmware/{arm_scmi =3D> scmi}/driver.c (100%)

[Severity: Medium]
Does this file also still need its description updated?

It currently retains: MODULE_DESCRIPTION("ARM SCMI protocol driver");

>  rename drivers/firmware/{arm_scmi =3D> scmi}/scmi_power_control.c (100%)

[Severity: Medium]
Does this file also need an update?

It currently retains: MODULE_DESCRIPTION("ARM SCMI SystemPower Control driv=
er");

> diff --git a/drivers/powercap/Kconfig b/drivers/powercap/Kconfig
> index 03c4c796d9931..d3eda4a70978d 100644
> --- a/drivers/powercap/Kconfig
> +++ b/drivers/powercap/Kconfig
> @@ -61,7 +61,7 @@ config IDLE_INJECT
>  	  on a per CPU basis.
> =20
>  config ARM_SCMI_POWERCAP
> -	tristate "ARM SCMI Powercap driver"
> +	tristate "SCMI Powercap driver"
>  	depends on ARM_SCMI_PROTOCOL
>  	help
>  	  This enables support for the ARM Powercap based on ARM SCMI

[Severity: Medium]
Should the help text here also be updated?=20

It currently still references "ARM Powercap based on ARM SCMI".

>  rename drivers/firmware/{arm_scmi =3D> scmi}/transports/Kconfig (100%)

[Severity: Medium]
Does the help text in this renamed Kconfig still need updating to match the
commit message?

Looking at ARM_SCMI_TRANSPORT_MAILBOX, the help text still mentions:
"If you want the ARM SCMI PROTOCOL stack to include support for a"

This also appears to be missed in the SMC, OPTEE, and VIRTIO blocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/d7f7e8c9589d937b60e=
43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com?part=3D1
