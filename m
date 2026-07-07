Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9CC1F7569;
	Tue,  7 Jul 2026 19:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452648; cv=none; b=XJ7nOgYNE0HlRnTe7SrCxwBK54YUdv+eYdszMeAROlymIKJzHQsCeFXa7oDePA6PshbFCXMADYZpU8VPOFFR0JdRnlFpZfgQ7ySulNkIah30tSqbQ/jAbAt5dgqjsi5sEvFV0uLPpbwTz4HLBm6IrryJag92Cnj25SEFuJALlUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452648; c=relaxed/simple;
	bh=QE6xOwkPJpFPr8J80BaVj2EFL6HzCTojUjxwhhiQpvo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DWO1ex8klUbP99lZx5Pp2dvtUtThe9qssRXSfCji36jHNocQKTe81nkxOUUvCaBzkfKDrW+l2d1L8h29baG4WQtY4l7qX3n7/ofFnL6AIACad/EXwyCExoguKITM51NNvg0dwDNLtj7Pa9MZY4ifr0ZuDznI8C4CiuCxiyVBqVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiidqUme; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiidqUme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4621F000E9;
	Tue,  7 Jul 2026 19:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783452646;
	bh=QE6xOwkPJpFPr8J80BaVj2EFL6HzCTojUjxwhhiQpvo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CiidqUmexCG6pNsOQzuDzcXFNlmn8X5rZ6IIV1/Sq/BYGames8+80jU6xQzf8vyLM
	 pYt565n7cBhOp/vNNySVCf1c2n4qJ6dB6tIiJpeFJP4nGZu4JjuWC0qa+0y/PnF/VV
	 Bx14HvcoY0r1cT3+zyNFO0/HACtEB2GIZ/97+cR8nuCLd9QTG9QI4ittVppgzc9WRZ
	 3+ERoGxQngPOZtpUjdfWfRMytZy6ECXmTu6ox47qUAZK+X4Yau846uCQDL3gbfubhB
	 CslcdSt5zkigcfDxKlY3sl09AkMK1ZOIhyfLgRZb8EA0psH9Ej/ItVQj/vKpKFFI46
	 2lSW/1u6i4pUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707192228.14647-4-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
 <20260707192228.14647-4-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 19:30:45 +0000
Message-Id: <20260707193046.4D4621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
>=20
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.
>=20
> The keyboard thermal zone defines passive and hot trip points, while
> the charging thermal zone also associates a cooling map with the CPU
> clusters, allowing the generic thermal framework to apply CPU
> throttling when the charging circuitry temperature exceeds the passive
> threshold.
>=20
> This integrates the EC temperature sensors with the Linux thermal
> [ ... ]
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707192228.1464=
7-1-daniel.lezcano@oss.qualcomm.com?part=3D3

