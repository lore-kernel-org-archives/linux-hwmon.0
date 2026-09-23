Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8147ECE5;
	Wed, 23 Sep 2026 10:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158752; cv=none; b=Md1gyc/QQiG9JWkw7chJMx9uH08vYY/NpRjzdLqADxMv2n2MZhRA/SpEM7SOJIqUYF1+LTRqrYTCwjLs/rt1Qn1+YGfeZvMUGw+TBwy1gY8UxfvtRpiE+onwrIvljXKkLHtZmOd8QosMY8PWU59EIB5aeeFNZfXJmUbFFWdwaco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158752; c=relaxed/simple;
	bh=RdE7NmpKqXUUrEkT2CbC8gkYO8ftQHCOPnDSMQ9ggBc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L8U0HKpaRpJsd7E+m3oyZz340H4HsGh+T/ZZw4tXM8/pFfYV4NlVqtciHk0w0F0k5uAa8IOzP/tBtvCFRKWsOw7iB5p5glbZNxUy+/I12YlmX2Bzxtx+UsO0H9no8TmOTsoIj+dFgUzTPcrQAhfQSqTjR0qe7IZEgRGUWblUUws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSjSH7Kx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSjSH7Kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7534E1F00893;
	Wed, 23 Sep 2026 10:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790158745;
	bh=RdE7NmpKqXUUrEkT2CbC8gkYO8ftQHCOPnDSMQ9ggBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nSjSH7KxmvobQyJKHNnjmf9CyrOG+44WEfxetMJ2CWvhk8LN9g0nCRJIA19Du1Obq
	 Z0sdKPGWH6tSYj619AEb0Mgd7fw66P1oYrsW+e/1YTgrSHxiJYIUxziyyOmURR9ksh
	 HQBcc9Oz8NZzGv8I1rPcNP87GR8BKGTfPaHsdabfhPYjBAuV47CUdP+DzC2IkrYo6h
	 0Ykd1aGeqqO+41IA174kXrcmEYR7GX1hV3xWn7KMpeXZwGrJ+uoI85QunoSK0zhNcY
	 1dPnW24tR2iPW9IZPulZkTMyVsYKJ+16fhGzJ5zhr2HScZvOnqDQbs7frUE5gRKZ7Y
	 m8KY94dH8GSgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: glymur-zenbook-a16: Add
 Embedded Controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Konrad Dybcio" <konradybcio@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-topic-asus_ec-v3-3-2bf3bb9da879@oss.qualcomm.com>
References: <20260923-topic-asus_ec-v3-0-2bf3bb9da879@oss.qualcomm.com>
 <20260923-topic-asus_ec-v3-3-2bf3bb9da879@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 10:19:05 +0000
Message-Id: <20260923101905.7534E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> The Glymur-based Zenbook A16 features an Embedded Controller running
> custom ASUS firmware (which is loosely based on the reference Qualcomm
> Hamoa EC one with a lot of modifications). It provides keyboard
> backlight control, additional temperature sensor readouts, fan speed
> monitoring and a number of miscellaneous functions.
>=20
> Describe it.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-topic-asus=
_ec-v3-0-2bf3bb9da879@oss.qualcomm.com?part=3D3

