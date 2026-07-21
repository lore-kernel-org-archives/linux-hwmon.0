Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA79F233941;
	Tue, 21 Jul 2026 04:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784607387; cv=none; b=RsxSzHpZnf+uAphe1zlq7uOtQeSOXjrY+nNxEjHC43rW+IKbfzLDzz129RRXIC6N3YbKDUE62oLqPwMIRVDWVGVCvTCxF7SpnOFb1ssq0MOz/2qwgPXsFJamCJy9nZLCSHWl0L32bmmNUQkbH3whfFPv2NxM8lSe83UeQovoi7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784607387; c=relaxed/simple;
	bh=ZcbVNUy6bdPG2VBbKcu8MGYUrEFaPv6zYVkLsJGnjtk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d6IUaV/U7Drwdfya6YeBwmq+36uVXrTCCZwh0wwt//yWYlRFQ1+REB8muwyLbnpMvxl6S/ORcHK79to5vG4ExaWjtK2DkDUKwXs9i3wlKBPNz2JR9plGxsV7Cs6dXYbbo4mzOQPbmvSUnefne1tzej7AZgTswcjN/hHnLyWa0fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFnO/jO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFnO/jO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098A01F000E9;
	Tue, 21 Jul 2026 04:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784607374;
	bh=ZcbVNUy6bdPG2VBbKcu8MGYUrEFaPv6zYVkLsJGnjtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFnO/jO3M396EgAoVcY1O3pffiPxhM6tKOZ0ovG+20ZnUSWgBqPdbzv2C6Pj7+c80
	 Mbut6fh+KbmOWY7F9neYoBN0UBWlxRBwhyJeMy6+tM6EbbbzACfioNo6eX+uYKuynw
	 Kzlwnsk2LYpcgKvMEhZHMrVPPk2zU3BNnFL6df8Azq6y8WC8HueeI39DQGnb0dEDpC
	 XJyHx386iFf5l4d3PbmPTw8nbjhxKICM3UNUHaodrd2UHnWbTTGUzbHBbJ7OXy1N1s
	 mcjF89DoNzOrjTgjWoTEUl9J3IrFKcrJWH9M30fUVNs3GF5B0a6h4B4caPPw5TT+Lt
	 S9gVduqdv4r5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/12] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260721040805.1696503-2-akhilrajeev@nvidia.com>
References: <20260721040805.1696503-1-akhilrajeev@nvidia.com>
 <20260721040805.1696503-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 04:16:13 +0000
Message-Id: <20260721041614.098A01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the 'mipi-i3c-static-method' property mentioned in the MIPI I3C
> Discovery and Configuration Specification [1] to specify which discovery
> method an I3C device supports during bus initialization. The property is
> a bitmap, where a bit value of 1 indicates support for that method, and 0
> indicates lack of support.
>=20
> Bit 0: SETDASA CCC (Direct)
> Bit 1: SETAASA CCC (Broadcast)
> Bit 2: Other CCC (vendor / standards extension)
> All other bits are reserved.
>=20
> It is specifically needed when an I3C device requires SETAASA for the
> address assignment. SETDASA will be supported by default if this property
> is absent, which means for now the property just serves as a flag to
> enable SETAASA, but keep the property as a bitmap to align with the
> specifications.
>=20
> [1] https://www.mipi.org/mipi-disco-for-i3c-download
>=20
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721040805.1696=
503-1-akhilrajeev@nvidia.com?part=3D1

