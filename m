Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8580D30C601;
	Fri, 12 Jun 2026 03:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233814; cv=none; b=Xpy+Mwho3FrtffYJiM2zTJKiE81conWm4iHUyvHpd7tfUu/PtSO4A10KUyxF3CE43LHDXUMmtHwb7Nh1UGPCy1xrW4rb9Un1ijWFu6QXyT4c3U0Wx9+RaguhB5jMgBYlP1SZhPJGlZ7eqcecZkExTLBcP4FncSMeNyqkft86Lsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233814; c=relaxed/simple;
	bh=UN704F5JZ90EyeN9BqawxNbMIiHlAgQTY6ZM3ymOzKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VKV8xvl2lVM3tjyf4/txkbaZ7LDesiNCpYwzuz8ws8Pc6tDODNlTJkiSzOguLS6joxy7eqFzq/Vcy67DV82ooLM35aFtTVDwd+9d2HHDCWxYEAnpzU187lmL9lPFSAj2jMPEXgzSEFUGvOIQb8lk18LouVdU1e0osGkwdRSw9+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9AqH7It; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9AqH7It"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7E141F000E9;
	Fri, 12 Jun 2026 03:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781233812;
	bh=UN704F5JZ90EyeN9BqawxNbMIiHlAgQTY6ZM3ymOzKU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Q9AqH7It1ETI0YgDQpuxXnuGBU2pTzO1+I/M9O5v9Sey6MCyB32j2aJrsd6WBKwRP
	 4NjLMAH9TZsu1bgNtQZisboEm6o8t0o3lehClcVXd0Hd/B+Ylni0sqa6JH4YW5n6E3
	 P5kXl9cnpWoQ5sUU3Q6H4j2HaITcrmChlbeS9kSYvJA4+FHwvv6smbbJmHh2O/9Rn/
	 ETBPwN8MyQ37fjAILT0Re+yGmCul5U3Cgapy+Mmw5RtDsTFual6w1iWVQuRv55/2TP
	 KEtaSfaqJdyJLjBn70AkAydkffurRQMK6Gr0y4lhbVTRbFLXoO5Be/uRCkrNz818EZ
	 cE6LmIM2nXllw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: pmbus: Add support for Silergy SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260612030304.5165-3-zmzhu0630@163.com>
References: <20260612030304.5165-3-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 03:10:11 +0000
Message-Id: <20260612031011.D7E141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ziming Zhu <ziming.zhu@silergycorp.com>
>=20
> Add PMBus hwmon support for the Silergy SQ24860 eFuse.
>=20
> The driver reports input voltage, output voltage, auxiliary voltage,
> input current, input power, and temperature. It also exposes peak,
> average, and minimum history attributes, sample count configuration,
> and maps the manufacturer-specific VIREF register to the generic input
> over-current fault limit attribute.
>=20
> The IMON resistor value is read from the silergy,rimon-micro-ohms device
> property and used to configure the input current calibration gain.
>=20
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612030304.5165=
-1-zmzhu0630@163.com?part=3D2

