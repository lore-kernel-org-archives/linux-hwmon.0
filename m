Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9643D0926;
	Fri,  5 Jun 2026 02:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780625554; cv=none; b=GgER6zIqYfWFcMqHw3S2ErC5jHQ5K43vwM0N+E6Hzvt74Ataij9g5a497vj1bSF80dhNZ0ovb3Bah4u2usrRn7u1/e2FrQAGVBmSlrZYRt9SSZ+PypKwOLJosh3IdIK7ahceodo3sJYC6fwqKTjErB11nfO8ND/6P+gcA9wBMVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780625554; c=relaxed/simple;
	bh=wB+yKI5FC7YECoRMDwTgACC294gY9pDj/O5pTF+q4Xs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lKTYdQplB+P1/xpAC1etHD17sFH1gIEZFng3l/9DTJyWAYopeAd6pss31/DkMoRwFA2SojL1+AZLbPfI5kpcuMq908kgumFT4f6Gupd/NQRt71hZchVMwElRuFOlilg2MS6DALyIv4ecCeOAkXGgZVGUVdiS0mC65W3Qxg0eh3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkpMz5uB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkpMz5uB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618D01F00893;
	Fri,  5 Jun 2026 02:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780625546;
	bh=wB+yKI5FC7YECoRMDwTgACC294gY9pDj/O5pTF+q4Xs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NkpMz5uB+yL6Nd8yWThqmxquTe9+kbGBXJxTugROv9jFXJJKTs9HyW/HPLFucQ+Cp
	 2Gcq+fuyO1VajVCu1tLVBUabqIKbkOFWHX+tjrJB337BXKCW6PthH2SZJiE0bIIQfV
	 5jyo1Op9oz6K92YWjHck0ZjmTjvtQMzaFUUKXSqItroO01MeJCqzyqS2mYkxgKLqJo
	 yi2xGYT5FJPkC0RoOFZ4+xjvE31VpabNyKmdjAxYeb8rQsob3+BrMOgIdbW6SBoQU5
	 2PkXKvTBNza5mBe+Z1rdtBqYiDQD9moX3t1BNuKxC2PNN5IJLhr5KdsGF09ZKW9BN1
	 n67ic0FzMmXtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: Add documentation for SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605020450.89638-4-zmzhu0630@163.com>
References: <20260605020450.89638-4-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 02:12:26 +0000
Message-Id: <20260605021226.618D01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The documentation incorrectly refers to the device tree property as=
 `sy,rimon-micro-ohms` instead of `silergy,rimon-micro-ohms`.
--

commit a85c00a013d8414f7f994a494095e98e35abc82a
Author: Ziming Zhu <ziming.zhu@silergycorp.com>

hwmon: Add documentation for SQ24860

This commit adds documentation for the Silergy SQ24860 PMBus hwmon driver,
detailing supported sysfs attributes and device tree configurations.

> diff --git a/Documentation/hwmon/sq24860.rst b/Documentation/hwmon/sq2486=
0.rst
> new file mode 100644
> index 0000000000000..7029f612e1b96
> --- /dev/null
> +++ b/Documentation/hwmon/sq24860.rst

[ ... ]

> +The current and power measurement scale depends on the resistor connected
> +between the IMON pin and ground. The resistor value can be configured wi=
th the
> +``sy,rimon-micro-ohms`` device tree property. See

[Severity: Low]
This isn't a bug, but is this property name correct?

The documentation refers to the device tree property as "sy,rimon-micro-ohm=
s",
but the driver code explicitly expects "silergy,rimon-micro-ohms". Could th=
is
discrepancy mislead users when configuring their device trees?

> +``Documentation/devicetree/bindings/hwmon/pmbus/silergy,sq24860.yaml`` f=
or details.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605020450.8963=
8-1-zmzhu0630@163.com?part=3D3
