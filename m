Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54413D75BA;
	Fri,  5 Jun 2026 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780625497; cv=none; b=TRUwu5IrbslRXZXVV9AquqV+VwRebM8jCSmJjl5EZoxC11c0ZOe5ZRgo/rhr69s81DVTbsKhwj7C2RPL/6dGYZ/ITNxq5zbNVjfoC2lenWaJAPu8IIMgU0KyWljUuSbn39BqjVsDcpT4YcZiUC96187fF1RtC9NMCYSGeBcRqE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780625497; c=relaxed/simple;
	bh=jKovO3CROCcOXwR0pzwTym3N/IXDerF6NM/xl7HcPC8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hEo4QXzqJ8meZ+BGm9Nbmb+Bl63VIwi3wGLpE+NFMnD+YgGBPclFoIcvGRMwtmEZ6eZp2JraYO6uc4NT/ioe4AXCIQxHCUEejo4mnAQu5GRKDfGsYWRFWeefTnYQK4pKg6fjl7lr2QM9uwlkbqjT5fPugk7FUr4/BuxYhWurpRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KERvGLZA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KERvGLZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE4C1F00893;
	Fri,  5 Jun 2026 02:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780625490;
	bh=jKovO3CROCcOXwR0pzwTym3N/IXDerF6NM/xl7HcPC8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KERvGLZASuWypBffDPpiuwZDXdph+s80qnxojBt8urDKHa6PGzHipp5rM3bJCgf+n
	 ET9JdVZx2i/gXRKNIz8tchY9vnxz1b2aB2u8wEBPHm8FvaP/uQzUgx2C4FeVprjFPk
	 fLj6x8UEkvXO513UrigtzabhTxjlYm1BlfIPmoQtj3pROiPZ+T1sSS0t6IIQ5I39kI
	 a5S7YQMYWxoTMB1Jv0nTolnDT6MNcUrapgwJ7XXnAIFHBzv7veerDvxTBE8fPz//gS
	 FEllAlPcDjXtIEuTL82fYphcsSZ29ifBln6/PRsUaF0EEb6e7500+iVJJLWG5HLbSN
	 0vH/e1Q2Nkeug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: hwmon: pmbus: Add bindings for Silergy
 SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260605020450.89638-2-zmzhu0630@163.com>
References: <20260605020450.89638-2-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 02:11:29 +0000
Message-Id: <20260605021129.DAE4C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ziming Zhu <ziming.zhu@silergycorp.com>
>=20
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
>=20
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
>=20
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605020450.8963=
8-1-zmzhu0630@163.com?part=3D1

