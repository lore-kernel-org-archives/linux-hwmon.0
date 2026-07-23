Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9430B318B96;
	Thu, 23 Jul 2026 15:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784822013; cv=none; b=OekeZd/BwGoS+0lkUe+zrATSuF99GGoKXCgqRXTi4yewuDEuec8uYpzR6HYML3aNGa800t79+wVj2n5+BAEisb2SaeLCw6QR0cxB8EkLQOFrVSkvRJx8LkzaQX9eX2LQFYc+NuVPZjuL34LUKFPvLNCeTu3LXBgDdaF8xke7xX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784822013; c=relaxed/simple;
	bh=dHBtZGR7J7+WB6veQIIiFvRv3Zr+o8ll5nbfo6g+pAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=V/ZcjzVHLobGQ5eXICXTyNIzkJaHbn5jOZ/IcUTGZbR0JfnU353aXtOxDoUBarBnuMHCEsOwvEPYKyytT51c3huP+NM31VTnZAiv/ls8ANSrg2vFfaUe3ERXWxsOsOt6PYnhzJZdp9xDd0WQY9b5lTRQbtJGxU+8eXTfe4T6lLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ER0bdsM5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ER0bdsM5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48971F000E9;
	Thu, 23 Jul 2026 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784822012;
	bh=dHBtZGR7J7+WB6veQIIiFvRv3Zr+o8ll5nbfo6g+pAg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ER0bdsM5xdZ/aNR+6ilOl1SZe/RcVdd7VgIndbDOwMnbfvfreHFMvRWF+od2FcZa+
	 B3C1xokl7eivEAg5vxThOBY+sELSGStYKCAPfUj4gdyh1dSV3FDuvKgSbgQHUxAzPh
	 iNj/rjGB3Vwx5u9f8RBZ5xLOj29sdZf7DWI6gkM4Z9XEYI7RLAgFzuoovy9xBBPLrL
	 zsepleSUfR+BlUos/SvdjLSZqdyPo4c+qMwBKa2Qn3fJP2J9YRBcTsMTxL/iEr6l7Z
	 IFl2LIZqbDvMuGthJj8/p+GRvt01hI5CdrAb7YcUTJmU68F3uhL4tH2SEcom5SjqCq
	 bE1wfmmjoDWmg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723-mpq8646_v0-v2-2-3c4cb71f23c0@free.fr>
References: <20260723-mpq8646_v0-v2-0-3c4cb71f23c0@free.fr>
 <20260723-mpq8646_v0-v2-2-3c4cb71f23c0@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 15:53:31 +0000
Message-Id: <20260723155331.C48971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Add a device-tree binding for the Monolithic Power Systems
> MPQ8646 step-down converter as a PMBus device.
>=20
> The schema is inspired from the mpq8785e:
> same mps,vout-fb-divider-ratio-permille property (maximum: 2047),
> and const: mps,mpq8646.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v2-0-3c4cb71f23c0@free.fr?part=3D2

