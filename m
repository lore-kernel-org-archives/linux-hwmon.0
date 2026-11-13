Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567002;
	b=l646bTcvS4hW9C4GZ5wDp2QdteJAP432IMuwjO4c9lamwDyph6B2p5f4lojQtwbpYaq8
	 QKuGw0C9ll+HAIwpOk46hnWVklMltS4po20Ae1fQBhcDaX+zQEbdmIIsuQ9kYf79qfTm8
	 +cjBQtXvTGQaARgbSPbPumFbEr76HC+vUtQYObQ94AXtS1CeK+9LKduNN4PxE4++hk8X7
	 Aap7RjIL0QaH7VwwxqUsqeDRaT54PHlDYRCtsCV/nyFBNikMaGWPoJby6JdreKRNrZ2u4
	 UUwun4lMPOzZln5qrsIdsOX2rToXunX+e6YPEChZcyyoeLYNBowwas4Uv7cnWNfjk+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567002;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0l3bqFWPfvkp8VHEjr1tEhoqdCFrn4DW803zk2hLwxg=;
	b=Krf+KLRqPYxOePH2LeXm+zM/ZtntonkgZFSONisdApTm+6ymKkJRscXrN/tAPAGEVh7I
	 mBsrTIRwBtVxBlBISRCy1/Umtbr07mQ3VWOX6cyAIaAG0w9arHtw/RbCtIQb8zljozKub
	 20zrN7cnz6wn3Ev4vbfQmNLWYAYPvYF5InEwdnwtsZNCXFNLR87DqNTwoh8I9adSS8TcX
	 RuhfxIY4FlqMGmESFiQXPL9DbGoV5r/WHb89z7Hf7/F5uUR5Xh5n/aEN5YkdqBNtEcasx
	 UmP/8xYBya+8hRODXb8v+U/bnYf19gwWpstybZQeqvSkk7uMqefkj28yb5fvjRxColA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="e/N2tMuS";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE65606A327
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 10:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e/N2tMuS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABD471F000C4;
	Fri, 13 Nov 2026 10:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794567001;
	bh=0l3bqFWPfvkp8VHEjr1tEhoqdCFrn4DW803zk2hLwxg=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=e/N2tMuSw7G9S72cqQPHmWf5340psi0GmzqJ6glv//6iu/8/E7ZJiwCOJL+e4tgul
	 lyuLLEyp2cvf7tS9UI3ybBp+MdaUw3Kfz8TehAfTBbNeXSMxdiWqPTwi87idsh+VZq
	 yplggAgbCjXld4YCY2VtMtArMpHqV2OEaOvg5Srd5N0XBzrLFbE9s22vvGIA4XAdnc
	 MSAKN6jMHeJxKJuLW66Dr6uWHhDaEbeD8GnD70D1r+yy72yaM5opQj1P5VBRSaWB1D
	 QrH7lEcGfQ/+Nknu/HlRqetvl0nyoUSe7KUn9qDt+Xdo9biZhskzmpepAe+sQrIp9q
	 R+177lGKje3Ug==
Message-ID: <sashiko-outbox-212637@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] hwmon: Add driver for the NCT6801D EC sensor
 window
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiqi Li" <lijq9@lenovo.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261113102544.893158-2-lijq9@lenovo.com>
References: <20261113102544.893158-1-lijq9@lenovo.com>
 <20261113102544.893158-2-lijq9@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 10:50:01 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] hwmon: lenovo-shm-sensors: lenovo_shm_init() ignores probe
  failure and DMI
- [Medium] hwmon: lenovo-shm-sensors: unchecked chip ID and 0xffffffff
  base in probe
- [Low] hwmon: lenovo-shm-sensors: missing Documentation/hwmon/ driver
  doc
--

commit 9f416da4c0f5af4f99bd963bf60bcd4e26a13658
Author: Jiqi Li <lijq9@lenovo.com>

hwmon: Add driver for the NCT6801D EC sensor window

This commit adds the lenovo-shm-sensors hwmon driver to read fan and
temperature sensors published in an EC shared-memory window on supported
Lenovo systems.

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index 8d397fa089fac..d020a2a25b98d 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1100,6 +1100,24 @@ config SENSORS_LENOVO_EC
>            This driver can also be built as a module. If so, the module
>            will be called lenovo_ec_sensors.
> =20
> +config SENSORS_LENOVO_SHM
> +	tristate "Sensor reader for Lenovo EC sensor windows"

[Severity: Low]
This adds a new hwmon driver without corresponding documentation in
Documentation/hwmon/lenovo-shm-sensors.rst as required by
Documentation/hwmon/submitting-patches.rst.

> diff --git a/drivers/hwmon/lenovo-shm-sensors.c b/drivers/hwmon/lenovo-sh=
m-sensors.c
> new file mode 100644
> index 0000000000000..0aaf27eade57d
> --- /dev/null
> +++ b/drivers/hwmon/lenovo-shm-sensors.c

[ ... ]

> +static phys_addr_t lenovo_shm_find_window(const struct lenovo_shm_layout=
 *layout,
> +					  const struct lenovo_shm_chip **chip)
> +{
> +	static const int ports[] =3D { SIO_PORT_2E, SIO_PORT_4E };
> +	struct lenovo_shm_data probe =3D { .layout =3D layout };
> +	u32 bases[ARRAY_SIZE(lenovo_shm_shaw_reg)];
> +	phys_addr_t found =3D 0;
> +	int p, i, n;
> +
> +	for (p =3D 0; p < ARRAY_SIZE(ports) && !found; p++) {
> +		const struct lenovo_shm_chip *c;
> +		int port =3D ports[p];
> +
> +		if (lenovo_shm_sio_enter(port))
> +			continue;
> +
> +		/*
> +		 * The chip ID is only used for the log message. DMI has
> +		 * already selected the layout and the window content check
> +		 * below is what guards against a wrong mapping, so an
> +		 * unexpected ID is not a reason to give up here.
> +		 */
> +		c =3D lenovo_shm_identify(port);
> +
> +		lenovo_shm_sio_select(port, SIO_LD_SHM);
> +		n =3D 0;
> +		for (i =3D 0; i < ARRAY_SIZE(lenovo_shm_shaw_reg); i++) {
> +			u32 base =3D lenovo_shm_read_shaw(port, lenovo_shm_shaw_reg[i]);
> +
> +			/*
> +			 * SHAWnBA_3-0 =3D=3D 0 means the window is disabled
> +			 * (Datasheet 5.3.3). The Core side WIN_BASEn
> +			 * register has its own disabled marker, but it is
> +			 * not reachable from the host, so the only further
> +			 * check available here is the content check below.
> +			 */
> +			if (base)
> +				bases[n++] =3D base;
> +		}
> +		lenovo_shm_sio_exit(port);
> +
> +		/* Validate outside the configuration-region lock. */
> +		for (i =3D 0; i < n && !found; i++) {
> +			/*
> +			 * Claim the window only for the content check and drop
> +			 * it again right after; probe takes a devm-managed claim
> +			 * for the lifetime of the device.
> +			 */
> +			if (!request_mem_region(bases[i], SHM_SIZE, DRVNAME))
> +				continue;
> +			probe.regs =3D ioremap(bases[i], SHM_SIZE);
> +			if (probe.regs && lenovo_shm_window_valid(&probe)) {

[Severity: Medium]
Does lenovo_shm_find_window() end up modifying LDN selection on other
Super-I/O chips and mapping 0xffffffff when a probed port does not match
lenovo_shm_identify()?

Because lenovo_shm_find_window() does not skip the port when c is NULL and
only checks if (base) is non-zero, an unpopulated port (or an unused SHAW
register) reading 0xff produces base =3D=3D 0xffffffff, which is then passe=
d to
request_mem_region() and ioremap(), while a different Super-I/O chip at 0x2e
has its LDN 0x0f selected and its registers treated as physical addresses to
map and read.

[ ... ]

> +static struct platform_driver lenovo_shm_driver =3D {
> +	.driver =3D {
> +		.name =3D DRVNAME,
> +	},
> +	.probe =3D lenovo_shm_probe,
> +};
> +
> +static struct platform_device *lenovo_shm_pdev;
> +
> +static int __init lenovo_shm_init(void)
> +{
> +	int ret;
> +
> +	ret =3D platform_driver_register(&lenovo_shm_driver);
> +	if (ret)
> +		return ret;
> +
> +	lenovo_shm_pdev =3D platform_device_register_simple(DRVNAME, -1, NULL, =
0);
> +	if (IS_ERR(lenovo_shm_pdev)) {
> +		ret =3D PTR_ERR(lenovo_shm_pdev);
> +		platform_driver_unregister(&lenovo_shm_driver);
> +		return ret;
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does lenovo_shm_init() succeed and leave lenovo_shm_pdev and
lenovo_shm_driver registered even when DMI does not match or
lenovo_shm_probe() fails?

platform_device_register_simple() does not propagate errors from the driver=
's
.probe callback because __device_attach_driver() ignores probe failures on
the bus. When lenovo_shm_probe() returns -ENODEV on non-matching hardware or
-EBUSY when FAAS bit 3 is set, lenovo_shm_init() still returns 0, keeping t=
he
module loaded and leaving an unbound platform device and driver registered.
Checking dmi_check_system() in lenovo_shm_init() and using
platform_create_bundle() (as in drivers/hwmon/lenovo-ec-sensors.c) would
propagate probe failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113102544.8931=
58-2-lijq9@lenovo.com?part=3D1
