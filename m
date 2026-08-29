Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC83783C3
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 21:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788038147; cv=none; b=gtNy6bVrcmMt7vOOBMUwZwCoja8UuWtzYzvKj2p+TVFKFDXcIqAFePP2AKkWJHkqSx3LPPoBSTAUO3PHD/76ruQinULpAbjX+A02OcWyEJwZcnHMmYIEW86FMlVP8CZP3pJrd2own5s9n0pCuQoyLzOkl0tyx0fyft3+42ggba4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788038147; c=relaxed/simple;
	bh=RvQMALwvr8g32ZEwo9x70DWyk7LcuQsZEeoyR4eup3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hAmsG5Wyzk9MebG9cPlo2gJfKJm0guCZlSCKH8hNOqvUZVjWuFN37Foukn4GOPHJLt8mMLJxmKYxufVTNMDX84UfxG61y3CkzB/CoHcIz2MvVkPHnuqjZTneR6+V1arCuZvQL9HYCIjHVGJ63UqKGZrCTwloLpmunH5tZWPwKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mgBv4dRs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mgBv4dRs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE0D1F000E9;
	Sat, 29 Aug 2026 21:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788038143;
	bh=RvQMALwvr8g32ZEwo9x70DWyk7LcuQsZEeoyR4eup3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mgBv4dRs+l6YXMcP+/JaeAQF3uNfXS1/9y4bQ4VSWvvxOF+i3ToZivqaM1EIA1slx
	 WADAmGikHgsLmCnnEQuHs2eYuW303Gm05NkqjM6cGqolkCQKD0AlcGn4rKzSo5Z6xE
	 q9OxAQ9BonixCZ31YzhhqygZfcsuDtQrFg6/pFImpMFikv53ljqaplPB4/w0bYNdfm
	 r0hzcEdP+3utpYwyWfm6Rxe1AKXBGnYe3FX92NLItbMu/ghK6Zt6v8yCO6eW6WPecg
	 BVkMHq3A4fhU/Jla4uis8sdfag33Br59CKKCywowtOdSTvj8FaPXVvhLBWyMZy4uyO
	 Ve0bQex9feehw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] hwmon: it87: add IT8613E support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Tollet" <jerome.tollet@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260829210036.61136-4-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
 <20260829210036.61136-1-jerome.tollet@gmail.com>
 <20260829210036.61136-4-jerome.tollet@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 29 Aug 2026 21:15:43 +0000
Message-Id: <20260829211543.8EE0D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: "benoit.masson" <yahoo@perenite.com>
>=20
> Teach the Super I/O probe path to recognize IT8613E and add its hardware
> monitoring configuration.
>=20
> Add feature flags, temperature resource counts, 11 mV ADC scaling,
> the IT8665-style PWM register map, and GPIO pin-mux checks. Only three
> temperature inputs are currently known; the six limit, offset, and PWM
> map resources do not imply six temperature inputs. Document the chip in
> the hwmon guide.
>=20
> Signed-off-by: benoit.masson <yahoo@perenite.com>
> Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260829210036.6113=
6-1-jerome.tollet@gmail.com?part=3D3

