Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468323932CE;
	Mon, 13 Jul 2026 07:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783928915; cv=none; b=gPczMJVUNHRutB9GCk2GoTQuzDz47Id3BPFlzYXPgOtVnlpjPnOh8vBxTT2PZZWxcBrIsgqOJljOCX+0u2DOhu0dEqyaXnZzN2jUvSURvW3d+0ETBxqWtD9d9D2vyyVIqH4mT6xcyUn5wLz0nzDcRVwsl/bAMA2JQfe0Rkqh8gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783928915; c=relaxed/simple;
	bh=1vy6NoUpzG0YM27PymnKN32MzmR9MT/Zsawqmm8jan0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=edA4DWe0ybTL6kG9Wghqp9xp7/DcuP3+rG9xqgxLFRHW84swgqay4jjTlN3bKNWTdwT6e+QjW7mcn6HTOqf4NcDKM+NNEUzlEBbESup1fObTS1EQbfYc5k8fZYA4+0QsmsBQZt7z/XCsWmolRxc4PlKu+nIVvBX08eruZzx9OAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vq44K/J7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vq44K/J7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF9561F000E9;
	Mon, 13 Jul 2026 07:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783928914;
	bh=1vy6NoUpzG0YM27PymnKN32MzmR9MT/Zsawqmm8jan0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vq44K/J7+F6eB4ouPT9F/u2d6d+pc+We+Ck6Gl14qgFlf14H9ZjgnTzU1YLc0oHJp
	 XbnZ1maznWfMuUjbXzLKSougGsz1bLg0Ecd8vI8+80IkaH/krF1YIYzhLYmY9oZbZK
	 +43O/RZrhPnXJ2sWh6uwaVI6XWp6/g/U7n6z9ugvw4JIZOQGMx8L0pHYUyUeKNZ1sP
	 XMQBLcvj4QGaFFi0CYyaSp13ezjIGRaCxk0wnrzfJafN+Pnr7Dkd0Arzb03aZOgJ4r
	 Y5x4ldfE93QNLZhW1MwCeTCnee2eew0uRhLPsszM6lWlxHt2BvacpT/b8T651W9CbI
	 Oo2qUWUhvX18g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] hwmon: (sht3x) Document support for GXCAS GXHT30
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zaixiang Xu" <zaixiang.xu.dev@gmail.com>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260713074559.12196-5-zaixiang.xu.dev@gmail.com>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-5-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 07:48:33 +0000
Message-Id: <20260713074833.AF9561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The GXCAS GXHT30 is a humidity and temperature sensor that is a
> drop-in replacement for and fully software compatible with the
> Sensirion SHT30.
>=20
> It is handled by the "sensirion,sht30" fallback compatible without
> any driver changes; manual instantiation works with the existing
> sht3x device name. Document the chip as supported.
>=20
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713074559.1219=
6-1-zaixiang.xu.dev@gmail.com?part=3D4

