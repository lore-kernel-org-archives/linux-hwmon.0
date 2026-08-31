Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B826D47886A;
	Mon, 31 Aug 2026 16:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192487; cv=none; b=RQGZk14vT/f+8G0P9bSikJJaiYK8ytmqo7fAd64P3rzn3va2cMOT0kXPguPaF9oXlDtEL2Xsldg+FvHAxVKyjidcVpP8J+REdLewbEKchmKC9lJbeYf/xaKoiESiVNal2Vwu4pCcjLbZzUo/NZMCInpqfxcZnAF3er3yBd3J+fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192487; c=relaxed/simple;
	bh=cNouqJSFGk7o1gi/JFfduMgOJDAmPT0y9zupJi5vcpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L2b/tRY6pd4VRZ3+tVqJeCHAtDKtANJt+vbj0iewcSXSaqYw7rgRklwlA9VLu/Gph0pQnh0+1LwnFqIupXHLXJGxFNRnTGl6OO/yzl8e7rfA/PenYyiK/WInFTzN1Eu+zE9IiEK3HgiI78Z7W/O8sf1tKcWPTntXHozPmlRmepY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJoY9SwV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJoY9SwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145EA1F000E9;
	Mon, 31 Aug 2026 16:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788192485;
	bh=cNouqJSFGk7o1gi/JFfduMgOJDAmPT0y9zupJi5vcpI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gJoY9SwV7toC9p5dYZN0tk/cN0g6qXgvAZEsRJN3epzesKd7QwcPJfyXSh0FlE7f+
	 PwrNq9bDxzaeV84n16atVKaY9Fj5lDhlf1nDt2fT6aroN5zEaLh1MSNYczHOLHX3sN
	 z0MCFtfkcfg5XXTKQlu4IK4g8O9L+kHBiBx6V54cxXpmxPIIrObE1tXJhRYGsKsU4T
	 4qf/ey6VYWF2+gxJskPi4rTz5qT4tHMc0azR85OrG32WlQas6q2yP8eAYvBgO8Pofk
	 +ic6H167/jRR3rCbBov7c1tXf2AaK6u0tleb107NnHDAGYMxFK1zbIDGFJFZZZVkbK
	 cYf7b4eMTBq+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] dt-bindings: vendor-prefixes: Add Sensylink
Reply-To: sashiko-reviews@lists.linux.dev
To: "Troy Mitchell" <troy.mitchell@linux.dev>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-ctl2301-v4-1-b335d52a0570@linux.dev>
References: <20260831-ctl2301-v4-0-b335d52a0570@linux.dev>
 <20260831-ctl2301-v4-1-b335d52a0570@linux.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 16:08:04 +0000
Message-Id: <20260831160805.145EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add the vendor prefix for Sensylink Microelectronics.
>=20
> Link: https://en.sensylink.com/
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ctl2301-v4=
-0-b335d52a0570@linux.dev?part=3D1

