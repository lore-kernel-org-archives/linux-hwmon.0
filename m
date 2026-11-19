Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795117888;
	b=CnbME3eZPqT/aSd7cTvUxDjX5i94gi5uZ1Qu0XykdUz8fMVvgCrvlVPB3vsyZQx7FoJf
	 4uHx0IC/EEfMdeYHj8/BnN4C3ZsdbsnEmfAug0uQ59rGQonxYagjpcuYQxAjlJeWVLyqq
	 JkT4uTogfopg0b+HhhwVr+0lBLqeAmhzKFAg/Pq1H4ii5uXCbFXXhnsVLtZQJWeAZh75D
	 v92x+X4jUQ4yOgo5HYCkFSB4lfR17N18iCATfBzqybyfQznWduG8wsIEbDR3ql3JmNCw+
	 Y71vTOt3vL8+uEUYNbv4eBlVZhM0lLIaw9E7BFxt+AiePL/EFPWY9EQMlWJATC43/Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117888;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tcRVbx61XK/b59xmfrF8cePeyw/T1IY5MPMTnj1OsWs=;
	b=yGPfO6d3/dwfItePnmYD5rL8uPReAm7ovFNSwS34okNgcN8Yq3M91x96d6czcJNtAqas
	 pUcZNoB2JvvuZMlUJSzj/OhKZfmJ7KVqmfqcMzvNev+gzyPiLToeXFg54g5QQPDXNtByh
	 nUEOIc4itSRZOiMhrwzvv71ciKyumCSnAojg5+Il3bVEkUsdhXZYf7u63RRsae/OAye/S
	 49bYlrfsAkiw/PoNG6YRXPAf/BU+NFgwGHT3HH0o4SS25D+Is2hyhsj03OWOJIfemHnp4
	 LakY90zqmPnMpI5IwvRlR8ZyPggMOIoU0vcjwQzR4FPG5umaUX0Nr/Fyf41yJU9fEmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gHPoduAX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FF5606A320
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Nov 2026 19:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gHPoduAX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064AC1F000C4;
	Thu, 19 Nov 2026 19:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795117888;
	bh=tcRVbx61XK/b59xmfrF8cePeyw/T1IY5MPMTnj1OsWs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gHPoduAXmTOJ2onIyT8VendxOYNouoTxq3pv2CiHS/ZtxrzhgKbgUSW7JVgcbB2wi
	 6fo6w1Uo7Ag74yzbOLhby04F4qYNVj/LlW7Kn1Ywx7iges/IXi2RAProuSz6MEYZRZ
	 fL8d//ydL9HmxtsYzMN8s0a/Ua/eYDIEN6UJAZcf228KYBp44MYRKBDpgbbpP+DI6V
	 bvLRKLqjFwEw6np/JBNw90ldrzXv4y+LFltgiRhv5zT7NU9OMrnHBSY6syUzaZ7rap
	 mRNj507Fh0evVQuBnUBBNXccDZP2GwfM2ajBWcNmjcLj1GtgoenLLBYYUQnyjdghJD
	 jaBikBBDZB6yQ==
Message-ID: <sashiko-outbox-223976@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: add Raspberry Pi PMIC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sander Speetjens" <sander.speetjens@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261119-hwmon-da9091-v3-1-15956035d7b5@gmail.com>
References: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
 <20261119-hwmon-da9091-v3-1-15956035d7b5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 19:51:27 +0000
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
- [Medium] hwmon: raspberrypi-pmic-hwmon: invalid hyphenated name in
  rpi_pmic_probe()
--

commit bf488e2ad9a7e713389ee9ed507b4faae9e4ba88
Author: Sander Speetjens <sander.speetjens@gmail.com>

hwmon: add Raspberry Pi PMIC driver

This commit adds a hwmon driver for the Raspberry Pi 5 PMIC that reads
voltages, currents and temperatures via the VideoCore firmware mailbox
interface.

> diff --git a/drivers/hwmon/raspberrypi-pmic-hwmon.c b/drivers/hwmon/raspb=
errypi-pmic-hwmon.c
> new file mode 100644
> index 0000000000000..cb6ddb5b7d4fb
> --- /dev/null
> +++ b/drivers/hwmon/raspberrypi-pmic-hwmon.c

[ ... ]

> +static int rpi_pmic_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct rpi_pmic_data *data;
> +	struct rpi_firmware *fw;
> +	struct device *hwmon_dev;
> +	int ret;
> +
> +	fw =3D devm_rpi_firmware_get(dev, dev->parent->of_node);
> +	if (!fw)
> +		return -EPROBE_DEFER;
> +
> +	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->fw =3D fw;
> +
> +	ret =3D rpi_pmic_update(data);
> +	if (ret)
> +		return -ENODEV;
> +
> +	hwmon_dev =3D
> +		devm_hwmon_device_register_with_info(dev,
> +						     "rpi-pmic", data, &rpi_pmic_chip_info, NULL);

[Severity: Medium]
Should the hwmon chip name use an underscore ("rpi_pmic") instead of a
hyphen?

__hwmon_device_register() rejects '-' in the name attribute with a
dev_warn() ("hwmon: 'rpi-pmic' is not a valid name attribute, please
fix") because userspace tools such as libsensors use '-' as a delimiter
when parsing chip names.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-hwmon-da90=
91-v3-0-15956035d7b5@gmail.com?part=3D1
