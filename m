Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD9E331203
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 08:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784966880; cv=none; b=ZND1hnl+8SqAPptM+ArGJzoWn3P/ng8jgkgiHMVhkinys/+lAbyUDsVOdY5g3fNDPQY+6GJ/pmnksywnfGd+4ncPWSWRSP6csZoDJQah0lj9jhp2qZQYG5csBPzm7tRXJ/1e4pB+QZQh5iJ/mEEbbjfnwMUE0L3/EL+zUJAG+yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784966880; c=relaxed/simple;
	bh=qKlnhOPCS5ccrmCEPxsg8NGemCPNixQYYAXZpEnqL5o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FSWfUWaD8zTy2QGWJKmE6Zz+FtLflc33UF64DoNJ9x/kWDYPHMED7BhCKdZ+NmGF11iuT3thoebOtg2UjJIfjRAXcffw06qzSdVq51m+0mi13LauUTb7drLvOtQ+H9NVIQQ+r5AMKz2/jCSGYmahh6aKd4dZy+aZvgyN55V+SXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvCN0gNi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvCN0gNi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C932F1F000E9;
	Sat, 25 Jul 2026 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784966879;
	bh=eyXz0FsJuLSHkJ5tzeTsZugIdBNlnHxLx63rj9A+K4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PvCN0gNi6rYqOr+nqyKX+3v2nlC/zNvLFFpUEhrFcIUebnGLMtFzf+QJG+BHfTU8w
	 7omJaxi6vjkJFgnOtEzS6jhEVzoYa76/CUnFv7q8+iWHa47VP9b2CvmrPoNcF6M4HY
	 tTFXwe0suJlU03woPDi1Q1/p2LR7emcGNV61elZSUlBfvKvFFbgri/j/8wHmz0Wjna
	 6RbOjUGxj1kcEo8fYHs1RnmxZ46KqPGT/4+9940UdloU8hM8sYLLhJis+mhgYOumPv
	 5u5d710tbjdsAnkzlR5VeGfYY5nvRfDBveDoHzZtfVM7cMRclMLyMUpEuegCI7d3Gi
	 m2/sHP3kHNsSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] hwmon: (ina2xx) Fix various overflow issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260725075800.346566-1-linux@roeck-us.net>
References: <20260725075800.346566-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 08:07:58 +0000
Message-Id: <20260725080758.C932F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Sashiko reports several integer overflow problems in the ina2xx driver
> caused by unbounded multiplications and inadequate types for intermediate
> calculations.
>=20
> Specifically:
> - In ina2xx_get_value(), the return type is changed from int to long.
>   Intermediate calculations for current are now performed using 64-bit
>   types to prevent 32-bit integer overflow before the division by 1000.
> - When calculating power in ina2xx_get_value() and
>   sy24655_average_power_read(), interim values are cast to u64 and clamped
>   to LONG_MAX. This prevents overflow when regval or accumulator_24 is
>   multiplied by power_lsb_uW.
> - In ina226_alert_to_reg(), the clamping logic is rewritten using min_t().
>   This safely avoids integer overflows when scaling user-provided values
>   for shunt voltage, bus voltage, power, and current limits.
>=20
> Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Fixes: ab7fbee452be ("hwmon: (ina2xx) Fix various overflow issues")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725075800.3465=
66-1-linux@roeck-us.net?part=3D1

