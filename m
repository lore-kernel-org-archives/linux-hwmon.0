Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D319217BB21
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970734; cv=none; b=lTwhEBS5yeVADedomZcaflEgTvC/vCPhtIDKB/rM2gOwDr+5h2ElRFkBMnl0637JhMeBhBgQWmD4TznDEXPulGD+pLtLvPs56qad4C71gFsU4hsYDjuoW76oVw7RZPl8Zo8BoyzFJGFuv+nnSMLbv2axucHJGiwHfsxjF672134=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970734; c=relaxed/simple;
	bh=Ns5BYQHS1BFCD2un5d8vKs48WlUewODgdKofMsFkDR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQi6Tpz/CRaGrKbFfvWse2nrKfhms7xJUynwoXifftjLt3oXSnlNg51te+hiMxWM0S3/7fKnNR1wU4MssgGV4oTeK0agHyBEeQjQmaKBqwcGew9If5qERxplJ7oSsIwpIeJsnpPPcbp0/2EfzRkZTEtqXXJfoAJNCg78kdPSgtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kY4s7jmk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kY4s7jmk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E55571F000FF;
	Mon, 21 Sep 2026 06:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789970733;
	bh=Ns5BYQHS1BFCD2un5d8vKs48WlUewODgdKofMsFkDR4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kY4s7jmkRbwT2G4BDyA7wtY5/+xC8VjctoOjibunNJSBAOMJYFU2VeUJlCfvb++FT
	 tOT4Ey2t/iZ5JBCPz+M8Krx+/I28WodMbr8823nQ6WN1MujfzcZBt8qNsYW4xVSD1X
	 VYD6YffK78MYrEYTordOeAUWa0wxmooJMPottl4QxvHfBq4o9vK8aSV/XN32xrPp1d
	 VMMLg4AG3DOe4Cj2YvS/h7jJjv6euwX3cps3/V9VJmITVdwSyvq6B8W1CminwZ+v2Z
	 B654dg+Rd7JFhxByUYbgtAW3znq+WQ3j3KQJnt+s0RqI/RklVIAkD7Ti/vwVZkMbZ3
	 o0gahEQRQ/07Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 8/8] x86/hygon: Add Family 0x18 SMN access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260921055603.25112-9-wanglin@open-hieco.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-9-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 06:05:31 +0000
Message-Id: <20260921060531.E55571F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Hygon Family 0x18 DF nodes in a socket share an SMN ingress. The root
> groups therefore need to be associated with sockets before they can be
> expanded to the dense DF node indices.
>=20
> Build the node-to-root map after DF enumeration. Retain a reference to
> and reserve PCI config space for every enumerated root, and serialize
> each index/data transaction. Make Hygon SMN access available only after
> setup succeeds; a failure leaves the DF node cache usable without SMN
> access.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921055603.2511=
2-1-wanglin@open-hieco.net?part=3D8

