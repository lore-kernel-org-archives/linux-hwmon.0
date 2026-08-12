Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76158367B8F;
	Wed, 12 Aug 2026 19:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562565; cv=none; b=S/pLUPRuTn/TWlPTdS/ySFo1XmG2XICp8cku4Jo0iGXns5IY6UP9ruYDzZj3mnpvC+935IE44/MG9QZrXerka3ciH6UqySVF7fzU6uXexqR6sBlHIa1uL2Lubnki86QKOJPf/x+kgJzgk9N00sj3vDCfpuDRMn+iRZhsL6e/e1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562565; c=relaxed/simple;
	bh=gr9XkUvCavU47HEoaD4l6HWFtc0hCiuDxRBiDKobiE0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i4POy1Dh6qsyzyNTWxghkWNCOoFzSA0c0EftG/qJHTg/MFFebFWBRe18Dbf2ebcmPhCJNMUcI4oUIBdmaEjGhNQtOTkM2/Iryp/MOW6uMsB6TMBgeotrqrWLUpDCdTe72Ol8SA0VnHWSgwk1F5gO+PxWqlHOrVVnUpin7aQKBk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqfmBlLP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqfmBlLP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3301F000E9;
	Wed, 12 Aug 2026 19:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562564;
	bh=gr9XkUvCavU47HEoaD4l6HWFtc0hCiuDxRBiDKobiE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YqfmBlLPy+tjcoigLZQiB7f7r8a3j3edcLA34f5B8hDMcbiRqfbyeO6vxEczy3fo1
	 m5m2ACsu2wiY6X1v44ktjnOhYi33ilyY23xqskSV90KjZX1FWuHczOO9GqZ3mCgsJF
	 Hy2y7I1mbwhMbHCbs/l+cbz8UzN6e1bQAfiY1C4Wp2GEpNCmbSU6Dg19yIBksO2E1v
	 8WCgRR/qeMfW2x0oM2j51NFtNqJfiJLyUO4hxqR8pQLxC+sXxNJyiE+vCYROs+N3jc
	 dQBpIPzCDjclydkU9ogF/YttFzCEQyIsgBVGOUgcWYQmFUFUK0u4MEYMyUaf8DYY6y
	 XWq8vjkjgwNZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: tmp102: Document TMP110
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Vasut" <marex@nabladev.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260812191021.65304-1-marex@nabladev.com>
References: <20260812191021.65304-1-marex@nabladev.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 19:22:43 +0000
Message-Id: <20260812192243.BE3301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The TMP110 is register compatible with TMP102, document it using
> a fallback compatible.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812191021.6530=
4-1-marex@nabladev.com?part=3D1

