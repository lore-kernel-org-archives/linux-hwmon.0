Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117877;
	b=2d8GtmSs9XQQ4lzWNBM0rJtsOKlRE8YxkhvZNCpXGMx130OdyBX3theHcReM40UotDWB
	 ok/21XRZVd3RToHkSJEscPVA77TGL6UfyNrz79vJcwHz4MMu4okbbD7PYT4jKjEs53F9n
	 QyRKA8JxKkB+/CkObHof6E9fvdErlyPwb7kC7aMbfzbBGyPOcFu95QOSScb4XohwtFrM3
	 FcOgKKv+g5X5akKbMA5vfX+WfrYd1GdUhMymmpqglDnnEDPmqtXAO9bIF5aRWxEw+0vz8
	 9r/mkXY5fNblInEEPQRnxJQJW8yghHW5Fdim4TnAWsRd7v2xZOBtPCpmn8cl/xdSP2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117877;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6dmsazDFc1NIvUMFEYTn34UOC4h8dNmYBGBglDzgC/s=;
	b=ChZRgR5XXGx3aQLMWeGAwCZTKQw2juru/mpxno02e08txWS34CnRQgRi9IdyqS0l4BSU
	 cDKmvelDZ5f9XiaHVniogxPXs/iAOmgLhCMNcbR7xkCWdmceXZqb0trUiGtSkoET0wMAE
	 DramH3hm+XKLBrA8mRMrh8imgqPZFi8QIVPXR95s1pBaaD73PfjI6UFN62l8RMqw+IvGJ
	 WFbp1wcRVXzw0ZN5qcVrNBtPwCCE307VMcvM/YefjT+hM9qV1QhmOkE5viLP2q4xH4vbs
	 Vqb49aLY46yGJUcLjtIvGSj+TO3v13KAYEhncI0PU/9PvabmIYvTZqkP1qfGGzxlYsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cqE+zWke;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB39606A320
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cqE+zWke
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A7D91F000C4;
	Thu, 19 Nov 2026 19:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117877;
	bh=6dmsazDFc1NIvUMFEYTn34UOC4h8dNmYBGBglDzgC/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cqE+zWkeIPD2BB9HMOoVpOCk+BMym/CS3gTp3EX1NCaD0vWwxkgMY95Rf+ZiRQMJq
	 bq0RlYzrr+EdSfFeaYWWXnIPsgNKeRloD43nBpIENz2Rip3aNGfPmqAKL51r/9e86M
	 2/lCPIn028KxGkEO1HJD6xcDX5pFJe3VeN4fJQ4i9AbM24IFDKjK/iOG+MgocM7dbB
	 iOOjsZrxCoirAfM+vrEapJKnzLFrWKg1QyMQ2f6oatQrKbgcyUE2cuYvn8nVZHsvAf
	 AQukdW0TwNdpcIRACgpjgsSTbo/p5y2UJudBZe4THmptn+pNhVx3ZrTyNKvMCJzYPk
	 pj/qR0xYJ9hvw==
Message-ID: <sashiko-outbox-223975@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] firmware: raspberrypi: Register PMIC hwmon
 driver on Pi 5
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sander Speetjens" <sander.speetjens@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119-hwmon-da9091-v3-2-15956035d7b5@gmail.com>
References: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
 <20261119-hwmon-da9091-v3-2-15956035d7b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:51:16 +0000
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
- [Medium] hwmon: raspberrypi-pmic: invalid hyphen in hwmon name in
  rpi_pmic_probe()
--

commit 9f0a6e3ed58944e55b16d88389defd31010b2d46
Author: Sander Speetjens <sander.speetjens@gmail.com>

firmware: raspberrypi: Register PMIC hwmon driver on Pi 5

This commit registers and unregisters the raspberrypi-pmic-hwmon platform
device on BCM2712-based Raspberry Pi 5 systems.

> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberryp=
i.c
> index d4f4753d39656..4184cc072a373 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
[ ... ]
> @@ -249,6 +250,23 @@ static void rpi_register_clk_driver(struct device *d=
ev, struct rpi_firmware *fw)
>  	fw->clk_dev =3D pdev;
>  }
> =20
> +static void rpi_register_pmic_driver(struct device *dev, struct rpi_firm=
ware *fw)
> +{
> +	struct platform_device *pdev;
> +
> +	/* Only present on Pi 5 (bcm2712) */
> +	if (!(of_machine_is_compatible("brcm,bcm2712") ||
> +	      of_machine_is_compatible("brcm,bcm2712-d0")))
> +		return;
> +
> +	pdev =3D platform_device_register_data(dev, "raspberrypi-pmic-hwmon",
> +					     -1, NULL, 0);

[Severity: Medium]
Does registering the "raspberrypi-pmic-hwmon" device trigger a hwmon warning
at boot because rpi_pmic_probe() registers a hwmon device with a hyphen in
its name?

drivers/hwmon/raspberrypi-pmic-hwmon.c:rpi_pmic_probe() {
    ...
	hwmon_dev =3D
		devm_hwmon_device_register_with_info(dev,
						     "rpi-pmic", data, &rpi_pmic_chip_info, NULL);
    ...
}

__hwmon_device_register() rejects '-' in hwmon chip names with a dev_warn()
("hwmon: 'rpi-pmic' is not a valid name attribute, please fix") because
userspace tools such as libsensors use '-' as a chip-name delimiter.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-hwmon-da90=
91-v3-0-15956035d7b5@gmail.com?part=3D2
