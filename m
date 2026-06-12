Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096BB1D61B7;
	Fri, 12 Jun 2026 03:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781233663; cv=none; b=g9LDS3AlOBaViM5FFFsFsXe57wzr5ut6ARp7UOeJEPRNelokvSXwzVAKK4FP8x/tV6Yk0e2t0ZJQ2H6FPmkKEwdlk6x7Zxp8DEwTu2Q/FKAnriHvVYtUvpnW2mpIwi4oQ5teL8wHIWTOToTaN0jC7HDic9DDwaqS0I/wSN54aW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781233663; c=relaxed/simple;
	bh=OOPRGI+ZpqArszG/z43VRgAw3XokJpDVOlwxFWhBk7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qEGNa8ZnTQkgWmGWjB6ej0K9o5B9z5SbKv6wn6go74ecg4HS1L39YmzP+7h7iVAR3yduXO+1yhshKMawixRzeqf5wOH1XwOsmPfleu4WJqg+RpXUt0VKI+Ca3iop6ERTHumWGV/Fjb1buW8uUCzRybBD7Noxzcspooc+al9p8Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbie5sUH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbie5sUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB971F000E9;
	Fri, 12 Jun 2026 03:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781233661;
	bh=OOPRGI+ZpqArszG/z43VRgAw3XokJpDVOlwxFWhBk7g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kbie5sUHYNbSQU2Ez4/7HU9i4FJkI2uhj6V0asRBFnuj27Nc6pHKL/7t9RaLSkhvH
	 cUiLwfw1EBNv5Lv+fPMgXRb9y2HAhJVGWPppaX3ZFAOt7IB7g3xr38v2ajw+qTkf9S
	 +U7rmMeUhkIUGcEzl6SOhAS8s5qctVHvQnhDiry5qZsCJdnb86lvS8G6Bj5JWhJpSm
	 7Wlpe8G0q0qC2Qzte7gcnJgH346dJ0WeFKw1z22BvnfEBXmHSqdGxNgPfUUm77Qita
	 s0rRGA5hHFwB1MD35mY3ldAF6vy6g1rBqM5K8kIv7ETx1ypx/04qCzlVHA3+2n+tKt
	 q3UunI8qSydJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260612030304.5165-2-zmzhu0630@163.com>
References: <20260612030304.5165-2-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 03:07:40 +0000
Message-Id: <20260612030741.4DB971F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612030304.5165=
-1-zmzhu0630@163.com?part=3D1

