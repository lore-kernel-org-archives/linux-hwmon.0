Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571773783C6
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 16:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440119; cv=none; b=S9esdwaWe5y0mGLjWkUmN8LAGYM9OGuO4HhXBdDLfhAQVPkbPjEiFrq8Dy22z79D5GsyAUn1ippAT60t5EE7iiGPwRcjqUcglV8W8QwIlr12IY22UDdraXHvRIY+UkNU/eYbSUvxT+5gor7OlMT7rlHpRz33xUTlhpxXodRfWKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440119; c=relaxed/simple;
	bh=Y0Zs1mtJGOrsht8AitZ3i+t/aqdFlJvZJZGcCXGA9t8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uJXThu7ok3M3OqNJJNKnG5z8nlTHdjazJxLxmdyr0ghcf+DqryAc+1GD0TVg57vhFZFNlQtE2+WUzSXWqYGaHQ62/ziwvHactwvKU3zobfZ7+Pq5O3AeTrdYL4dzkPgi2nOCUpOXiJLgpPwJk7c5/yUudYOZSW/fPahztXjeTy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlF/Ypw1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlF/Ypw1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DAD1F000FF;
	Sat, 26 Sep 2026 16:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790440118;
	bh=Y0Zs1mtJGOrsht8AitZ3i+t/aqdFlJvZJZGcCXGA9t8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mlF/Ypw130GmKa3qSdMUXJnPFM6tFk224e8frHmDu64DQ0trKfsqJw1+Kv8X39OBk
	 ouqH7PLkWPmMmoG1GKvwfpIayuC49ASMm9DxpqVKWginRpScxf+HY/tlVGNF0V0ByV
	 pCuKenH2MDdxHHmtANty4IGM4f1VjafrJyFprU/GMW/mK7WEurjxRBjULD3vZLQxKw
	 6O4KCGCxBmHQVvmpS8j+4JnZAGT0Ilt1hCR4HdpJ6T+Kct0R+DUplwpDegZmqbEPUb
	 BLBokd3mo8DID/+27KgbEACrl4gbLpAWW1BDAxrIeXj1odZP14y6v92g3R+EvI5vW4
	 mU35AogQNiUTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/mp2985) fix typos in comments
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zain Aboobacker" <zainaboobacker33@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260926162539.25432-1-zainaboobacker33@gmail.com>
References: <20260926162539.25432-1-zainaboobacker33@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 16:28:37 +0000
Message-Id: <20260926162837.C7DAD1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Fix various spelling mistakes in comments found by codespell.
>=20
> Assisted-by: Claude:claude-opus-5-5 codespell
> Signed-off-by: Zain Aboobacker <zainaboobacker33@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926162539.2543=
2-1-zainaboobacker33@gmail.com?part=3D1

