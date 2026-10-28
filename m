Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193773;
	b=iGnWOdT/crjUelAf7JHMEZm0e2CIOQqMhH5a0fetMsxfLN8qS+rTwxp2EjSnpU3uyDWQ
	 +oZc3b2tGQ7PL/ozgwhR+S0moOk2kLlQT/S9df3cvzA5GorBKWWSv06Uc8IPH3R8cEWuK
	 4jSz8p3kucAW2snt3a9TOwR/v+vQJCTW37cZDSmGDbcLOVPhPibc4KoiUvp5JlUb+spZf
	 qiBuNDCLO9I5Fm12a5P02natOcx4D87YmrCc1i5sumWYGD7n4K5pamdEuiua8dgNtHfXx
	 eNFw4myQ4SJZhkmA93Qlhx9D99zHUVIer+gdBPU98dLCOySVgsqTDewwYf3L1A65L3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193773;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OR7Hq1JUepcEG2zq5eg0AegjvNZQAykqwL6tgzQdHCA=;
	b=se3ce1PF8jQ/CZxGf70Dkh7HVeSeFYl7H1R/uCauoRj7t94BZvbmSPVk4GFDWeWuje/j
	 w0YSEmjN5EMv78t0BS9z8vFJ4XZ4BrI42ixevlxNydzM3nMG3urBnIrqjjnmW9uwKC7Sy
	 rfPuGKPCp7xt6Y3CwcA5AYyFlm+604ZO6OHLX5E4s9NR4SIhvPaVsAfGLCVACKN3HpvG3
	 urr+g19AmjiLbkTqd2s6jqwS57qDzI6Sy4Tmsv2TPhtK/4TV3xG1fqNbAgG5qKzQm2PnP
	 /rRGhY9gM+zobLVhYpOxeNCEsl5Ii3ximqQC5uRttUgjcsEoKanGH2iv/PA472qGjhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbMK1UTc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E819E606A31C
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Oct 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HbMK1UTc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597E71F01825;
	Wed, 28 Oct 2026 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793193772;
	bh=OR7Hq1JUepcEG2zq5eg0AegjvNZQAykqwL6tgzQdHCA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HbMK1UTc0D/pOBGalEXIDoOewD5G+fDPJ+vFI3iJJLPO6RH/lLoFA63bajm/nOqIL
	 PLYbGuhHCSNGfqwly8GafMnNwhSNZcG/Lc5n0ChY9ye2Kea0Ig2bB3bQTFOkxNnr4X
	 9XW+8sHqEoQ3Mft3e9G/mRTzCpnkBdYrEYxvOOXfh2bgAaxJxHnhkDuqchnr9/4Mq0
	 m/VGRuJnHplmHLxEYlCejiKtqdZV1cMAsy0iunf2zkiudTYJx7a6Yr8O5NZ/rAijqW
	 uQHB6x8JZ1lQBKEzIGpqWG8rYX/NPM2uL7n9JGTXCbXFLjRMSHVVlEKkJ4gcfQX7+l
	 MsFQZ5V0Qui/w==
Message-ID: <sashiko-outbox-187906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: iio: add: document the MAX34417
 Four-Channel High Dynamic Range Power Accumulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261028-topic-sm8x50-iio-max34417-adc-v4-1-d4baaf3ee903@linaro.org>
References: <20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org>
 <20261028-topic-sm8x50-iio-max34417-adc-v4-1-d4baaf3ee903@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 13:22:51 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> Document the Analog Devices MAX34417 Four-Channel High Dynamic Range Power
> Accumulator used to monitor power consumption of portable systems.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-topic-sm8x=
50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org?part=3D1

