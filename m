Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D6525B087;
	Wed, 24 Jun 2026 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782297060; cv=none; b=AuH/xOmNtAgCNVXmeTQWh8nH/45Cy5Hs1sR1QWIav8fV3tiGR9nRsvDKhOOs+BjRmiXCfaCFSlfXyJeWu7YzfT+6PJ4EBlCbEF2aQB6a2V1QuVM0TTysjdDcmCfi/vHpvPVbw6md1+a9qN4sHmC30hwGGiFq4mo5dhGAFwEIfA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782297060; c=relaxed/simple;
	bh=hRrlj0h4QIwC5fB0RzRJQAmIzTt6+MQSSHJszlDVf1k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JqIcZLDdR32KDyXuHlkEIKzcmrZ77OmPegpjtvpQ9eH8oehg4QbV043Vhjt8hm7ixhePDxq8q9lghIunU1R61kx6lpcMRggFxscY+tprpi30n2SH62WYySPQ7ZDKNbM+yFC791sTsk1kFr1YRMokqBBCQXGasbNlnTWtSAnph2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ds6cQic8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ds6cQic8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D5A1F000E9;
	Wed, 24 Jun 2026 10:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782297059;
	bh=hRrlj0h4QIwC5fB0RzRJQAmIzTt6+MQSSHJszlDVf1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ds6cQic83sgJmRIKt9cF77SIU4gI2+SwNga0ZZjtQ6gFYppCly4CgmxPdU4l7dyBC
	 VEKE2b5a1f7gDjeWB9f6P3Q3rqc0kJGaw3wn80/2UZYQ91ULv3TbiqsNHo6HdY84fR
	 qv6JzyH9/W7oIsP2JSWDHH9+7h9BCjFrK64pOqwhPHk8a3vq8Iseq3onb/qPBiGCYl
	 I0a1VheaYFwyfjzwq6BfaIlmcH3jwNtZKD3UxqYg58Ga5cC9/E2MXa7IUPWjZ9RlGF
	 VfJsrc5k7MWEfcvUoP9IIYl/5oRCQ9s727tMpyhcWppkueMFS1H4XiHVkCDmcFakWE
	 t65TgoAL2pY7Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 01/12] dt-bindings: i3c: Add mipi-i3c-static-method
 to support SETAASA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260624102153.1770072-2-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-2-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:30:58 +0000
Message-Id: <20260624103058.D1D5A1F000E9@smtp.kernel.org>
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
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D1

