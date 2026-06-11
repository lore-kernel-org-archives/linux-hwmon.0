Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE2235E957;
	Thu, 11 Jun 2026 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164510; cv=none; b=iavOUddB4eWcPJE56Sx/jV78QCk1zDkezHeB5Bl9hK+o5CZIKTm+Zsywazsynq3e9L2aAX+kD3Rd/HGstIrVYYjnEec517q4iuigx+puKfvejpg2k6cbEuKmxlm1a7q9tq/HfOGOh03LUurcyB3V/Y3Zf3zvA0iIzjBarFS4mME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164510; c=relaxed/simple;
	bh=0/+W8pphNjt+RhjbEaLAZAg/KX17utLn/JdAkkS+svU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l8Il8WJgP+JQuVPMNWx5rTB5kcpy4gNuApXMADZbjTp8NDm3SSHb4oNX9UraBeJ5xjbFpbLEPxPo9Q4VJW96tT1FPa8b4geuoHmIs5TUGfCgj7WK+8qMRFcuLIm6WrUACVq3dP46sHepAUKJi/LbvImUbJHF6EIDTBFxAP16F8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGppIqnC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGppIqnC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532491F00893;
	Thu, 11 Jun 2026 07:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781164509;
	bh=0/+W8pphNjt+RhjbEaLAZAg/KX17utLn/JdAkkS+svU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGppIqnC+uVVqFLgGNRQZY5fvrPULahfJBklgJK/JSIbjjNVcsYwws1EewL8g5mmk
	 o2Fcq4SOlC9j9KukZOua+hb8stAwdq7V3aHikUjfIXyeN4xfhWTQ3xRdA+D2uUdRmH
	 UPrMrMZdbj6ElWst9MmZWdqNSky6u0ykcxCFBjl2OdQlpbwH/ZT8js8IN3ju49kUJ6
	 C1da3S/3PLKPUBE3FPIxgC4kbN90zieAlfE7c4/xWDIXuDt9sSK5gsw9VRvIMRJit/
	 rxzO4io8v7ZFLIuREugPQsmbreRCd+B1Bcoaf63hNiwqAlS23X6CJJQ/NJx1AijpRw
	 si5ebMfcTsl4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260611074335.4415-2-zmzhu0630@163.com>
References: <20260611074335.4415-2-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 07:55:08 +0000
Message-Id: <20260611075509.532491F00893@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611074335.4415=
-1-zmzhu0630@163.com?part=3D1

