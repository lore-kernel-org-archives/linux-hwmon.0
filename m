Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A4A3DA5CC;
	Tue, 28 Jul 2026 07:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222533; cv=none; b=Y3RpIhztc+gZFczXtHVV8NGhipgwR0ixfMkTx35y67+ucujOZ9vfiqVh63QtW8mj+0Kq6k5Klf2HxziXB5Qq4lU6tiqKC6X6jphxupZzmcPDBWVpYbXHmUqGlxdtkLz9nFNvZBK6xuKBO9qyRw+WQvFkrqy1fQIIQwf6izW/gsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222533; c=relaxed/simple;
	bh=55A3f7h+OAAIgPZfAQMgR2SUEVtD5lmHb79C6kwLmpY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XsYShiABY2pcy2k7RJtKc5bAHKUWTdL/NwM4enHMFLphoj6USEf+ZrXFli/92yxir7943jEpd1Zvpr62ni8Gpg9/Dc6dlq+HPKWlVR9N70qEBEk6bh32K4NlFZ8yjX4jfm8mLK8RNTGEwYM5cxVoTBL5YFal7GjKzw2ucKTnpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hR5Mvv++; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hR5Mvv++"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE801F000E9;
	Tue, 28 Jul 2026 07:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785222529;
	bh=55A3f7h+OAAIgPZfAQMgR2SUEVtD5lmHb79C6kwLmpY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hR5Mvv++54XnWDhOv9KvdV1CsJruUv3ifVQYt7ggf+Tb6L4dpEow4qAuRdor5giGL
	 OiBEZ1t8OEdGzGzCndMYQBQWMVfGGsA+Ei9qHymnE3AIE6VfK9PphsjMVARWfagE7X
	 UZtfWcbQlYrGVI57JPjvCSAe9HRKthA1psjYWoaNVQkSUfkr817HmjloEwughnhZOD
	 qe0105C8QuXCPeAo3SvwQVje/vMmUnYwJn1LId+fP4HBpXwkmU96Jlihq6QYFiUjdX
	 Q7KUPE3mrU+hs5wG9Wkz/PSjT59xKCl9pEEj7Dz6tA64LACjZ9BGffbmZ6Wlyb7FLQ
	 RndgvlNYySt3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 01/12] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260728065955.809445-2-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 07:08:48 +0000
Message-Id: <20260728070848.CBE801F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728065955.8094=
45-1-akhilrajeev@nvidia.com?part=3D1

