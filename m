Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30CBA3AD535
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Aug 2026 18:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787683887; cv=none; b=uUjo1wZ7aWG+DETdNyV0ZA6Mj58VnQ73rS0j4XSuuYgkVvrUFFjUoy5sjyUEenn3hvWlqxg8UdC//q9HyLvwT8ZeGBX5EgauOPHB28FD9zMaB84fm9LZekbXlmrAe20UePm7EgxxGruCA1UJM29Pv1f7NSXROThS7pRx7MykQSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787683887; c=relaxed/simple;
	bh=XBDPNvHcuO7OAFEHcgb1dkDguB9jXZbEmHjChTqRlhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H9JI62JONBzo1f6RYoDRHhqT4uX/wDlhI9aMmDVG5fPUo9SzQ/zQewJNPzsv8qujBOyEkeRUHFJPPHMlmo/jCUKqVhAAecgQEaB9Rc8XY+1D2XAInBR3QzuR3OBv6KmjyMUMRSGgosVcF+tsihTxXyOKOSqIoFIpzCsA6QT00Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i89WVNEa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i89WVNEa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82D51F000E9;
	Tue, 25 Aug 2026 18:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787683885;
	bh=Bfyx250tCrGnHq5lPbD75BPluAncQblDBgrMq1J0ajc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i89WVNEa7bRMJm2bw6kP7MttvTHKZSL8NrgojEJafxn0GFtr4BBrRv/f0D6GNNl7O
	 GGxg8Hx9xjaC+plBsTPFERECUzDm/VucE6C11h4I1rdakU7q3sTPkJVXFJoBNqdYnL
	 YYXs/3AzDV702/s/gbTfMCljG4+sVhmuWpL+k+1eO+lm6wiCFfcerktN8g+7Qp5P3H
	 9eikf99QHkrjAG5T9BeFkf6c8ykZrTwvKhrU5uyQD4y//gBNKHwSw/6JXiMUySIY2+
	 8jCUimfpwrFbNm/3wCrEDRCxDmnP5FFFrtf7/gydC9SWiHUi5cWxMtfQiklw+8i8pW
	 gATVcnOojlAXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring
 and fan control
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U2ViYXN0acOhbiBQZXlyb3R0?= <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260825184107.355980-2-speyrott@gmail.com>
References: <20260825184107.355980-1-speyrott@gmail.com>
 <20260825184107.355980-2-speyrott@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 18:51:25 +0000
Message-Id: <20260825185125.A82D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing Kconfig dependency on ACPI_EC leads to undefined reference =
errors at link time.
--

commit 95c2944ab1799dbc9f42157b5a4c6a9050da57ae
Author: Sebasti=C3=A1n Peyrott <speyrott@gmail.com>

hwmon: Add Minisforum UM780 XTX EC monitoring and fan control

This commit adds a DMI-gated hardware monitoring driver for the embedded
controller used by the Minisforum UM780 XTX. It exposes CPU and system fan
control temperatures and tachometers, utilizing the ACPI EC transport.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 81a9a1d40eec8..45ac04c89b23d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
[ ... ]
> @@ -1490,6 +1490,22 @@ config SENSORS_MENF21BMC_HWMON
>  	  This driver can also be built as a module. If so the module
>  	  will be called menf21bmc_hwmon.
> =20
> +config SENSORS_MINISFORUM_UM780XTX
> +	tristate "Minisforum UM780 XTX EC hardware monitoring"
> +	depends on ACPI && DMI && X86

[Severity: Low]
Does this also need to depend on ACPI_EC?=20

If a user configures the kernel with CONFIG_ACPI enabled but leaves=20
CONFIG_ACPI_EC unselected, will this driver fail to build? It appears this
would lead to undefined references to ec_read, ec_write, ec_transaction,
and ec_get_handle at link time.

> +	help
> +	  If you say yes here you get support for the hardware monitoring
> +	  features of the embedded controller in the Minisforum UM780 XTX.
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825184107.3559=
80-2-speyrott@gmail.com?part=3D1
