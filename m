Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794284380;
	b=UepWt7VaD2UZpqMEYyrPpGD1buDgxMPC5kNFjTDuA4TOoM0Qg8Gv7/qj45/mfynaGinW
	 lHAw9eOVTZRNz5eV4rTVOjFrR47LidydKk6tMAVAuJCEutuu7jOAod5U1bdJN3oTjQjZz
	 KTBd17ydv6CF3JiiCgKoSH/vxRXJvMj/k+cSmNfdJrkJT42JtLysxi7lzPUmqU3u+a6H/
	 af80mWj2tcSLJ3XV43CIi1gCYo4yxmqdAwaaAd1GDXQb54j/2PuMHEkYbo06MyQ9EnNKn
	 G1RtEB06NyTSH7EuCHsA4OFAHP0P0FMut7sPTafZlEdE62GxZqbsSFXOWocr0k+Fr2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794284380;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Z0o7XAMLKrmUcWa6cx1ip2Z7jvoUOkjW1MwEtQJdmdk=;
	b=kzarLWNQFYEx8kiBLAhsYff00iQ25yfytPg8Ag1KLtkaWU5LnjjVM491JP82N9D5p9Y/
	 5VaM9HCT8SSwNkATcuUucvqltPmKxH9mEUeK1mpcAlR6lulS/4nocQkv4Rxavnlj3fEK8
	 OUgczY4AEBoG3OyxVB4kvNi3vO1whj54qls2y85xxoid9OUW9SKq1hE24f/QJ2ICWZyi7
	 X0hrszvVs+03WpAds6vm87+1nnztnCpeoQ3tURqsrHyVfPPsSENTxmY5T62FESX1qIwTS
	 8tn9b1SZSL4CgUYS4HoW9yEXXveVsvsTLnv1ZZA89394O4y33UMlSC7gkRON4EkqazA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8L4OHxZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41878606E8DD
	for <linux-hwmon@vger.kernel.org>; Tue, 10 Nov 2026 04:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h8L4OHxZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C16511F0089F;
	Tue, 10 Nov 2026 04:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794284379;
	bh=Z0o7XAMLKrmUcWa6cx1ip2Z7jvoUOkjW1MwEtQJdmdk=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=h8L4OHxZpJ2P5fYOTYkkaDsg0lSV+0a5Y0vadKjoS/vwsxZYnPX5zflcct4FHBdCn
	 Cw2kmpjWY+lDJbHJXdy+lCglfYvqgdb276bRkF1ubplKW2dhSAT0iQAKMIUgzm1L20
	 VZGLbTccSmZL7OcwwiumjDdbEsA2RAnx6i/Qp+boHHGLB0YNlc0TMc334vlJuxt1z9
	 d8QKWYWYFAvNElHM6gLt8EU7/t140ZaJn9bmxuBMYycNImqBxCdn8ZV8IYNTT3/5u4
	 885/LAEU/k1L42p3ml4fViR1scBNVf+uCHnrImuiCVzxn7HmWXDvJ939uTvuGgFmY6
	 bmMN6bAsEO+1w==
Message-ID: <sashiko-outbox-206185@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [RFT PATCH 2/3] hwmon: (nct6775) Fix swapped temperature
 tolerance register writes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261110035955.3968731-3-linux@roeck-us.net>
References: <20261110035955.3968731-1-linux@roeck-us.net>
 <20261110035955.3968731-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 04:19:39 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> sensor_dev_template_pwm_temp_tolerance uses index 0 (backed by
> REG_FAN_MODE via pwm_update_registers()) while
> sensor_dev_template_pwm_crit_temp_tolerance uses index 1 (backed by
> REG_CRITICAL_TEMP_TOLERANCE). However, store_temp_tolerance() checks
> if (index) with inverted branches.
>=20
> As a result, writing to pwm*_temp_tolerance writes the new tolerance to
> REG_CRITICAL_TEMP_TOLERANCE instead of REG_FAN_MODE, while writing to
> pwm*_crit_temp_tolerance updates REG_FAN_MODE with temp_tolerance[0] and
> leaves REG_CRITICAL_TEMP_TOLERANCE unchanged.
>=20
> Invert the index check in store_temp_tolerance() so index 0 updates fan
> mode registers via pwm_update_registers() and index 1 writes to
> REG_CRITICAL_TEMP_TOLERANCE.
>=20
> Fixes: cdcaeceb74ff ("hwmon: (nct6775) Add support for automatic fan cont=
rol")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev
> Cc: Anton Lundin <glance@ac2.se>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110035955.3968=
731-1-linux@roeck-us.net?part=3D2

