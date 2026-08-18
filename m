Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DD741B8C6
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 08:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787040628; cv=none; b=JwxKHtmGmm52osupRk7HWRrNVOTk0UOr+xxiS8zB7IoQH8MtorLmVDhZoHDqaM/v5R0dwtcfruH3/HKxj7mTLC4QylGQAg+FQ041D1+clwGU6fts3LgmfuEdFzuwbp/I9+lpZquvXzt2uPGtxVB5bLwJVysvR/nZKK1m+X2IAnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787040628; c=relaxed/simple;
	bh=UmFzMNU6Pd8lT028uQd7yxRJAcGBpvuuKhOYdsDhgpo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cGVaZw1XEFNrMP4vOCgDMZl9yrSwwT2S3SPgSEmG5/+K1WckPuwMU4ecjfXQI31B4IgXyFtq49y/a3qSgaishxKrNmxxbLO/oYr7OVkjnuIm8Q6Ea0OhVCTs2m+ekL7hhOOEUy5BxDigwJjEVDvjOuFrUaJHTAnIsI1r+PvdeHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErQdvuI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErQdvuI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACE11F000E9;
	Tue, 18 Aug 2026 08:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787040627;
	bh=F2rbOEBoAzjAlKYc6f72Wg9awb+SvPwhVCjrkRSqk7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ErQdvuI8CupbcY2xaal2bmFH2sOr7ayqtq5vB6zg8u7xcXt5Mwd5anxIYUFNPKZbr
	 GAJwqetZalFTO2luZz0lBESv3uQrqGrORT6DtycbkZHFhbiXMEVECEAlF/KWTCi+go
	 qrkjhhGjtTy6u4Ma9DHUuz2c43868sFCBACwjaclmgezD6ZRw/stlPZvTXrUj59vSo
	 zIez6DuwRmcETj+GWiKazkT3wNjOW3s+jrd85q1n3AJe0oAzeqX6mEztrpkNRMrhGz
	 ZciFzZj5rKNmG6yko+lFl0tRG5b/JHcZCZUoY44fH0BtXMJByMdrqV3Q8akORAzMlC
	 ixKvGK6g+muCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] Documentation: hwmon: replace full-width colon by a
 standard ASCII colon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antonin Godard" <antonin.godard@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260818-doc-hwmon-remove-confusable-v2-1-c1dff1ec01cd@bootlin.com>
References: <20260818-doc-hwmon-remove-confusable-v2-1-c1dff1ec01cd@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 08:10:26 +0000
Message-Id: <20260818081027.5ACE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> It prevented the pdfdocs target to complete, prompting the following
> error:
>=20
>   Latexmk: =3D=3D=3D=3DProblematic refs and citations with line #s in .te=
x file:
>   Missing character: There is no =EF=BC=9A (U+FF1A) in font DejaVu Serif/=
OT:script=3Dlatn;l
>=20
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-doc-hwmon-=
remove-confusable-v2-1-c1dff1ec01cd@bootlin.com?part=3D1

