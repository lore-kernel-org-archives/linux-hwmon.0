Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EFC3BCD26;
	Thu, 25 Jun 2026 06:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782368523; cv=none; b=pApri9xFoyTQQjBANv9HDAywt1V/LlQR1vQs0DQ1zabfOtn9UFl7bZqxwQAJ1ICu9muxN7rUYwyGIy+byc/2S0mrM0FJ/O37N6X78kVCDQsTLQVHH0tQNpTx39uVV6L/lxNnHBHT0FSiK5ZuNwZCa2J9VuSMIAqE/48UHWc45FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782368523; c=relaxed/simple;
	bh=O5k85Bx+ZBLyQvUsHRkJ5sFp9Xcy/pvD+CUR7hvaeF8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CaoCiOpzy/wPhIAQeM72fzjHFRYPz8eA3N2hm8rKjf8aC2mDqn25UE8pyIDfJzGqKw3wACCSLHg4+3chP/52x/dP7WSeZMWNcpDigiBzecTYfyxG6UNgBOgW8KELjX6uSCIHPCBtmy8bdHHUqIPAZWSxE/Giynw1j9xh1/CosS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7RUq7uP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7RUq7uP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FCA61F00A3D;
	Thu, 25 Jun 2026 06:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782368521;
	bh=BXwiHZnXo5Qz8K39q3ecM+/Ya1NhDwUPey6CHKiese4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C7RUq7uPGVVh/EKt4kLKXVN0pLMAa1nncC6GbfjY9eMidzAZcjyf0Sb4WB4+RkQGt
	 nVpQAUCK5z9TP6G1soxJzc0pg2NVT6/seeGKv+Fp0XBYTOfI6PFuUPHOWXOs+MbEKx
	 x4FAIznNIN+dVoRF0wvQpQ1gj6mUzg+eB6pHx//Qt8zDrMVONhj78OOv/8XFyBfLZS
	 QGCuQvS5rfa85GWWGI+SqG0/PQk/a0F+6f+ylbgCC4F4PhSoTex1uywqIdUeacN5Fa
	 Y7oNEPFGnnIMJMion6l1c/lv9uVWwAnHSR79xXsAFtWtpdtbdzD3dMWEsX3uNwEXjX
	 8EF3YBgCljgCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] hwmon: Add Eswin EIC7700 PVT sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: hehuan1@eswincomputing.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260625061214.1648-1-hehuan1@eswincomputing.com>
References: <20260625061049.1614-1-hehuan1@eswincomputing.com>
 <20260625061214.1648-1-hehuan1@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 06:22:00 +0000
Message-Id: <20260625062201.5FCA61F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing Hardware State Restoration after System Sleep / Runtime =
PM
--

commit 90e30b4d9c6082a265da7f7091bf9e2cd31aec81
Author: Huan He <hehuan1@eswincomputing.com>

hwmon: Add Eswin EIC7700 PVT sensor driver

This commit introduces support for the ESWIN EIC7700 Voltage and
Temperature (PVT) sensor. The driver implements temperature and voltage
monitoring using polynomial conversion and provides a sysfs interface
for accessing the sensor data.

> diff --git a/drivers/hwmon/eic7700-pvt.c b/drivers/hwmon/eic7700-pvt.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/hwmon/eic7700-pvt.c

[ ... ]

> +static int __maybe_unused eic7700_pvt_runtime_resume(struct device *dev)
> +{
> +	struct pvt_hwmon *pvt =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D clk_bulk_prepare_enable(PVT_CLK_NUM, pvt->clks);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable clocks: %d\n", ret);
> +		return ret;
> +	}
> +

[Severity: Medium]
Does this code need to restore the hardware trim value after resuming?

The driver initializes the sensor mode and trim configuration via
eic7700_pvt_init_iface() during probe.

If the device enters system suspend or runtime suspend and the power domain
is disabled, the hardware configuration could be lost. Since the driver
utilizes pm_runtime_force_resume() for system suspend paths, should this
callback re-apply the trim values to prevent incorrect sensor readings
upon wake?

> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625061049.1614=
-1-hehuan1@eswincomputing.com?part=3D2
