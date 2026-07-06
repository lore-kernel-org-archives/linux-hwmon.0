Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912073BD246;
	Mon,  6 Jul 2026 16:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354479; cv=none; b=SJUK0iQl0fgcnC9mEbV0OwscfvZV64T+oa3mvHnGcRlY98g59UNcQadOLzjPf3tOSzlvyOUMM9yZ1uuWmn5PIwItLwkNg5aYcogPUKNsZZF1knaCa8U7d8Nq0t1LnLlYxKg22mxvE+QdJDVKsMvXjLZ7vgxpN6ifRBBYum/pQ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354479; c=relaxed/simple;
	bh=HKM0dExR8kgNiguY6T5otF/5yX1HJ2aKYzELhikm+44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tKnzgYsPUqcHLNpsWlpqHq0CihHUMO7tYR0Gz5gOg/1ZhNNpH8J3cOWx57P+WxFt4dPMq/fFpauB7OiIbCrDM+QQ210boKoisUvTY+dWG9nU3n60pvyvyrDKr8Ln3tlMUWMSjV8bGolXPQ4EBXvMhck0VfaFXwozAK/ftT1Q0TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gbfbru71; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gbfbru71"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C78081F000E9;
	Mon,  6 Jul 2026 16:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783354478;
	bh=HKM0dExR8kgNiguY6T5otF/5yX1HJ2aKYzELhikm+44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gbfbru71TeobpMh6h+KEpnzJcBrDZ+7sCyVZBNeOsSlKTxRCygMINM9x8nX42nK33
	 ZaFHHyd3NCNT3Q69P68bsWfpcN/H2m9/snt1CEXeShGPC2vmGM4Wurpf9Nwud/RnOk
	 NTZXRTJ8oxnhNEAXt8AYqJVq0WP5rKl3OMNHLqWBUD/MWtyRVTwqrW0DBWsw7+2StU
	 8fgKsYb+k5kR9B6wdZ1rme4H9oI34tMdRPCMFJ4TRxkxxxcJ7/KvshY4O7hZ6uMyfV
	 iUQD/M0p3fZbOQ43GKfw/G4WMYERFpro3ozryifU6m/EuW4yev7ET8mvrz+AGLVdOO
	 SzgXjE6lNzhQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] platform: arm64: lenovo-thinkpad-t14s-ec: Add
 hwmon support for temperatures
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260706160830.17698-2-daniel.lezcano@oss.qualcomm.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
 <20260706160830.17698-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 16:14:37 +0000
Message-Id: <20260706161437.C78081F000E9@smtp.kernel.org>
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
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706160830.1769=
8-1-daniel.lezcano@oss.qualcomm.com?part=3D1

