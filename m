Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D550C480336;
	Mon,  5 Oct 2026 12:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204477; cv=none; b=IQPv/o3/ocQo1GQ5LdZwxtIKS/p1gPEE2kBtJdxHOf3GzIkAvBTG9hyggKNOObFNLloUZIObnttADBtCqILVOQi9xjvuWgzcV+zNdQPYZ0R4Lo6nAp51/qemln8AC9mcxWLTtK7lH8+QoxceItCw+OpxrKSwqYsXkexdUMOa0QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204477; c=relaxed/simple;
	bh=y35WiGkKFg8P2EwGd+G/Kxpo5hnfuNLawgMvustZLug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UiILcdgNax0ql8DWzK4RgR6wKfFUrZJxlEdjG37rkJnGdVZCCls64iIEZ9B0rh3AOsrXWmwo3q4EF8I4xypWX/CtzeHe4j6cP/cK4MEoPEAbAENUj9wSI/OGV0khxrZtuu8V8T1jPM0AOoyZaNdiN7ZyxDCSHZzaPiaafdmxxwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZIlEsAt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZIlEsAt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E551F000FF;
	Mon,  5 Oct 2026 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791204476;
	bh=y35WiGkKFg8P2EwGd+G/Kxpo5hnfuNLawgMvustZLug=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IZIlEsAtOlwhc7cMm7nESmTD1aoKytn7PhPJ/YerCXe4iQEegAK/Qnu4VDARAVITr
	 cowjQQqP80DO0eDhC2A00Q3hv+tRAfmGHbqb4p9zcqXlvRx51NBj/pyC8p9O9y7PRm
	 p2ibApiYDfCfpZ1+GcAyzrJm8YdyzGrmFU7gwbSAWWmnfrsw5Zi0EscDp/f2adYqbE
	 jM1ZfGU2+4W5yOgx61L5RjhgJDElTfsp7cMRR0CMTR0WhLKlTn4djIvywvv6Ar6bcp
	 UmIY7e3IYIgBBkTJrGaWeuq9l4x/YNwtR2/Skm+O7uB87bUp+JXFzMLM8im3Y63UMJ
	 +6jsiTWrGeFfw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-12-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:47:55 +0000
Message-Id: <20261005124756.36E551F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for smb2370
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D12

