Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6CC3D0BFB;
	Tue,  9 Jun 2026 07:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780990142; cv=none; b=RMpcfsxkzlSKf0byOZUcRiPHKmjsKGa/UfCV9w6fRcfANQodZlaKTMbwSWe84c15TU8p876fGiJzK0OKQysnD7izPHSh20sl86EKs45jkqUPxwELLTQM+axFgjSW6Wx9xJGqnLXlbsYM1FajIgH2WXbx8q+1NFSjCmfCKT+8LlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780990142; c=relaxed/simple;
	bh=K6MV2uLS5lm+4Me4t24fR79hY+O5WdtNRqvbGy0JzzE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C6+6sQt9jtseQjCi2ZLL4NrVYeza++YwugMPXqugZy3UHRe2FePxMRx21ridI34BmVv9ddvj8q3135vn/JMIS7fPIdLCPelkHEHdNCgkbp9v+LGYqE6pLuAMv6ohdCX2Rsr3jBWBgyEWe8Yyj6FkKvq0yecaAcw7IMTEDGt9BhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hC+a0w0L; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hC+a0w0L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62071F00893;
	Tue,  9 Jun 2026 07:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780990141;
	bh=K6MV2uLS5lm+4Me4t24fR79hY+O5WdtNRqvbGy0JzzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hC+a0w0LARUFxJIhe3bMU6EX4vRWNNCSlNyvCoToF5pq8QevkMuc3tbtXlgRTROks
	 SsnT5F0UyEU3mcaMtPowIGoraLQldOpKs6vviwsIgJpvGPtYXrd58a8tbvvl3X3URX
	 eYTCASGsGGWNrV/TE+1O98b/LWCK+gz90HVp2o6g9kl6xXl8AoDIbR6+lKbFPNpv/K
	 8sorbFgWJNgqGz5OVxgvq5/dBKzvoOt7Ty82bwrV/lQiDzKDfMySGPOrXTzImpvMVW
	 IuwXZRrV273Tw7Ny5pjF4fgKt02eshs3OIdrYhXB461w0UIkqOy8P3pk612VafhB3e
	 98agtSjg9DXNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] hwmon:(pmbus/xdp720) Add support for efuse
 xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260609072231.15486-3-Ashish.Yadav@infineon.com>
References: <20260609072231.15486-3-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 07:29:00 +0000
Message-Id: <20260609072900.A62071F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Adds support for the Infineon XDP730 Digital eFuse Controller by
> updating the existing XDP720 driver.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609072231.1548=
6-1-Ashish.Yadav@infineon.com?part=3D2

