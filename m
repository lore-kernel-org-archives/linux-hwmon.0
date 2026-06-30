Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC73423A87;
	Tue, 30 Jun 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831497; cv=none; b=JHNPwdxQ3zGlEP9X4TG01024sw2B7FQMEolMGDMj7i54mmz6Mu9GwILNH1Cdo/Uhc+zu0lsbiwjxBrdrmzsOeDuRnwoAp3c9sVo1N5uKpgrPF9aO1vSfdWK9+iDVkCrt1at9y+VODu6knbgOBy8bjGbRxDZK78r5TqJUyDFa6FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831497; c=relaxed/simple;
	bh=wsPyVCA4x3/j34bxPqieOHOhQhh7vaCvmLlJ50P2OBo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WHA864XEUSU7q8OtpBsPANl5vuKsXERMgGt9S/29M07nxUOaItTQ5pS6vc91khKzNLykAZ4nzpawXDZmd4o3XzdiABbQRXvPIx9v/wrF7GsJGKDFlX1ivmTpL3hAUUVy7Jfs2s2lulTFqEoS86rsRHdvbpB0fQEZXiirjs6mNpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V17TZ22O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V17TZ22O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 838B91F000E9;
	Tue, 30 Jun 2026 14:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782831496;
	bh=wsPyVCA4x3/j34bxPqieOHOhQhh7vaCvmLlJ50P2OBo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=V17TZ22OIvFe+If3WDpx+/Lv4w5YMV+dVNKykDLaisKBSlCcKCsgUz74wHjYS2J8J
	 zRO5k1moUOZIyVAYoyKhwxPrbMZU5xGEc7AqillBZ1/fgMszb7NtP2D4xxBYlHQtng
	 QofstcounC+kvdYzU76e7qiOR9kxOQ7c4WGjt347nyvfWjL0Due/uE2mcriV/evQz2
	 HwHXFVAwoR4hGVJdOVZqefJoxzBl8CIlmXV9ljh0Xe8NBsptF34xR0ht1+hA1hgaVU
	 C5q2xX6vn0uh85O2PkSkMPNaW/1luJV6OKa5W/DHwYU4IjIKmVxle9Olo7KT6rw1nL
	 mAkdhThPCmDLw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] platform: arm64:: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260630145307.10745-2-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
 <20260630145307.10745-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 14:58:16 +0000
Message-Id: <20260630145816.838B91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Expose the Lenovo ThinkPad T14s EC environmental sensors through
> the hwmon subsystem.
>=20
> The driver now registers a hwmon device providing access to six EC
> temperature sensors corresponding to the SoC, keyboard area, base
> cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
> are exported to allow user space to identify each measurement.
>=20
> This allows standard monitoring tools such as lm-sensors to report
> platform temperatures.
>=20
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630145307.1074=
5-1-daniel.lezcano@oss.qualcomm.com?part=3D1

