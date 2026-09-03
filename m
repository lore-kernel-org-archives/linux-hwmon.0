Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0B04028C0;
	Thu,  3 Sep 2026 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788419720; cv=none; b=oIEO1Ue+dXiUkGD/yjSQeUHdqO65Zsh0ngcgSubH3l4550u07aIJGe66NzHx9vfiiQL0U4DE5vVHxl5gCqOyxTWgNkaeuKarEtw4DNSo4BeCt3ORGgTlZIcexow6MBLyz7JShMJGT/aGCJ6erO5/sWJT5QyMS/d3p/IDv7wTp+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788419720; c=relaxed/simple;
	bh=OEqF+Tounpnl1FGN+EhHG6M21xX4IipiRv3yHpgtfXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iwr5rYOcczNHppyz0CsYrKCPzABllSDjUyMVM3pNn3IP3sojtfz3+VG9dVrWt3RPpRj3LbJNIuhHmPti8ZeBKoZilfiz3CgRM2yMS5HA+ihXY+m6KYZWBgP3hou5PbeY3c7Zm0AXaPApZQNay3O9UNkfFJrZQ0g3WCLC3Fj1tRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRXh1Pxl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRXh1Pxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4206A1F000E9;
	Thu,  3 Sep 2026 07:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788419714;
	bh=OEqF+Tounpnl1FGN+EhHG6M21xX4IipiRv3yHpgtfXA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VRXh1PxlVcY3PgdTqPsN5+NnS7sMuCpQvuDLxe6VBPqeY4Gajspm/Yyu01WM4JbOB
	 QR6TK5jNmDtdpr1MvqKxED6LvySm+Kgsxkph6tJALQfrjqOC0NmbgL6Et0aVVizuG6
	 UWUABdGJ5n4HzJ4p78dHJ03PRmaM+43KTQYvLW/QG/0HMAiqynZXhc8/9yqliq7hTL
	 V50iYtlZ6eeztE+bSJhl1VqKCv9zrBg7zPiMnfovm/lq6qFiUWsiEEfF2J1yiintc0
	 m3LoJyl964/0ckQ5x1EKMcRbR0ASR6yI3kb7dOEsNl9GnHNBNkzKmS2J3FJ/lrlkDb
	 rOlFMQJaaudCA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 03 Sep 2026 07:15:13 +0000
Message-Id: <20260903071514.4206A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a hwmon driver for the temperature sensor ADC (TSADC) controller
> found on Axiado AX3000 and AX3005 SoCs. The controller measures
> temperature at locations within the SoC silicon die.
>=20
> Each TSADC controller is registered as a separate hwmon device and
> exposes one read-only temperature channel. The sensor is configured for
> continuous conversion during probe.
>=20
> The current TSADC hardware does not support threshold or alarm reporting.
> All TSADC interrupt sources are masked during initialization, and only
> the current temperature is exposed through temp1_input.
>=20
> The averaged 12-bit ADC code is converted to millidegrees Celsius using
> a lookup table with linear interpolation between adjacent entries. Raw
> values outside the characterized lookup-table range are clamped to the
> nearest supported temperature.
>=20
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903-axiado-ax3=
000-tsadc-v1-0-a8a0f3b251f5@axiado.com?part=3D2

