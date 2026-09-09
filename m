Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8664963C1;
	Wed,  9 Sep 2026 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788957322; cv=none; b=SU3o76beE3GSkQVrYxM2iTyFxBKmON2pCr6qFAmnEbw3YWMNFC9qr+gaH7FdbmKUEWMAw8zCkNcMhnflfxKsqze7qUpXjEY5F8Fhm46mzTa+C4BFxI3DeYQpG2VbxAmlg+me6sJ2p0aAtfWRS/yXic6XPm9EH3LFePnjI2AGubI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788957322; c=relaxed/simple;
	bh=/Vp7CWunAk024HQ0TYs7bbQjsGKOYEpHpPtTJhfsucw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FjbPI+8kmBhLYAh6E2ldpLR2deQPuGf+WKic5NuqKDeaeqx8blfM5TFAOJLtbIYqmgmIep72hVY4s3nkyRpx7WIxFdpfm6J1T76x/6OP/mpI8mPS2iQv1lhUSCSFO3NI2kLLOCATVrQMTG9Fm0jQKzaEs5BoB105ZhzmBLldo+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HsCV34v2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HsCV34v2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7511F00A3A;
	Wed,  9 Sep 2026 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788957321;
	bh=/Vp7CWunAk024HQ0TYs7bbQjsGKOYEpHpPtTJhfsucw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HsCV34v2e5TiCHnCgQ7HRH3Nq9DJfqLBsj2OuQklMSgvRz2mJDtyf4qOX90FL2/Yv
	 E0hsa+hvfgIcp/N5TuA7A6+eEzGbEgtBKnZbC8k7maSb4sbL9+v5sdDTZHnknfYIet
	 dqYZh1dfZI8gyjHHfgi0mkEm4GoFsP0V4UyJKHgj5A9Q/ZtSo9tujfPsvjBMGTkfFm
	 jnUX4HUQhF2n8S2SkiPlW74byt39sUIlIT0YAK9IwmquNin/gJ4jysEByeyybtvb55
	 Va3Xbah14P12sJSzY+H8Y4aAO2bvdJQZqiXhSVV7lkkMrRwztzPj/P4YqAuipAfB2q
	 zMX7ZeQOYtlSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: iio: adc: add support for PAC1711
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ariana Lazar" <ariana.lazar@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260909-pac1711-v3-1-dff81003b82f@microchip.com>
References: <20260909-pac1711-v3-0-dff81003b82f@microchip.com>
 <20260909-pac1711-v3-1-dff81003b82f@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 12:35:20 +0000
Message-Id: <20260909123521.2D7511F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> This is the device tree schema for Microchip PAC1711, PAC1721, PAC1811 and
> PAC1821 single-channel power monitor with accumulator. The PAC1711 and
> PAC1721 devices use 12-bit resolution for voltage and current measurements
> and 24 bits for power calculations, while PAC1811 and PAC1821 have 16-bit
> resolution and use 32 bits for power calculations. The 56-bit accumulator
> register accumulates power (energy) or current (Coulomb counter).
>=20
> PAC1711 and PAC1811 measure up to 42V Full-Scale Range, respectively 9V f=
or
> PAC1721 and PAC1821.
>=20
> Signed-off-by: Ariana Lazar <ariana.lazar@microchip.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-pac1711-v3=
-0-dff81003b82f@microchip.com?part=3D1

