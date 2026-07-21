Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FF7415F14;
	Tue, 21 Jul 2026 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784661376; cv=none; b=hse6PmYWBmlc0FiVIb5LZx+ov99Ia3MuqgN8c2zvdRSBwLNuLYVmYV1SZd1us0oSkJaXEF6GByUKR2YxuMxPjgChrTqrtSZ7sRLWuqLvul0Jhfl9579f0x5UeRHj6uveCeSXWHENqLRugtbbOeHQcdzwJHfYcvT21S7H7PAwjsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784661376; c=relaxed/simple;
	bh=hWAecT6MgtNmOtM91U90oGnvMn0Q8qSNNxxOz9Ixtuc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZmtTUPZN7Jh+HDRX4xw0ccV8avvNuATgeg8YWEw2EmiDMVLhrF9XKvol90pZpxqbicM0XUGnRzyFCkXahzXnjXs7mGZdQns2YCKClVmZMT7/91zrSf/4zBr5jsZrR/6JqQqYqaD7D3/jHgu2Ic62rXrz2xEoWNh85xXpGM8wUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gu6ItFAv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gu6ItFAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A5381F00A3A;
	Tue, 21 Jul 2026 19:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784661375;
	bh=hWAecT6MgtNmOtM91U90oGnvMn0Q8qSNNxxOz9Ixtuc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gu6ItFAvN1HqyMUipwsJGiku4zgTEFzbrKGtekKsUT6G4yjhYq8kWN3uC3zWA+zz8
	 OpqN6lJWAIaBUgQbJR4mwSD+RAJ/A/gPpRpMovbRQRdiN79/0JOgdIsr6oMe72uLgG
	 y2NN7L2f2n8zzhvlQlKgFjQIto7VvAlUhagpVZUk+i701oDOjHo68h7GlwMedSq1m1
	 h99EOwxTpE5XX8DOpcAGHOvveoHNTPpc0xiNiYmMFbTh7uYKvWEimtD5MZhFNZJvtW
	 h2jYr6Z6f1KoRuVHcwQ/2Qq/RgaIfvyq9BBldG+Wo5ZNHSUxZc0UrhQ5G26DnW13lY
	 Uc1r/HFmXrfmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/10] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-9-febe2805e17b@oss.qualcomm.com>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-9-febe2805e17b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 19:16:14 +0000
Message-Id: <20260721191615.3A5381F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-qcom-bcl-h=
wmon-v2-0-febe2805e17b@oss.qualcomm.com?part=3D9

