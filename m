Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD9A3537C7
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789029534; cv=none; b=tauty8z9ZUrufAGqVvEtak9rDgUCoXYcDmcq9oGzeSjUOYDiK7po6pp2+tgRG+rjXF1MDL9LjvDDQ43aiVBhP0atJ8LEKfsspbqGRSqb3ptMc7qerpR52kutWUZVh1/aHTzPXRZLnMfCHjaLMF+oZNtagLtIY7I9CvgZQV/o7vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789029534; c=relaxed/simple;
	bh=SAYc5jvt3agjAY2/KDFPKS+f5qyvDCYkaIvKyxba8AY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oNgIZwm1bmIB37QjXVIQAlhY1T5rXpIxKSvP6YS7h0aJ64vbE0bwO+z9dCBYNFK+Qd7Fkki6lPBsFpyyfjLJ+/OHePngg1rTQIvEpnQFgph1r+46/o11kDsbMI4Hsv7Q7unUDoAwAkOR8GIQsAfnvUjorTsobYmyxvNBbCM1yYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOeS1MMF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOeS1MMF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EF91F000FF;
	Thu, 10 Sep 2026 08:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789029533;
	bh=SAYc5jvt3agjAY2/KDFPKS+f5qyvDCYkaIvKyxba8AY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gOeS1MMFv58bQISdWulSDl6Eo3rHR/V45btGpPv2uB02xWp8Uw6ABWQqxiXR/Q+uI
	 O98yO671IuC75oPx6kBKfTy67hXUhnb6zz/WeEX0keFgOuJC7y/f2Tui002s/3+s4/
	 nJHubwwxZaabhXldC29GqmxJoRKpx13nBoD2nmQXzOJJ4UDnrMmX+/g3QHq1t8PVc0
	 7M2dMFxok8NB05HzHVomj7GcM4gCdi/PMNiJ28ompBAnaoNjekMB1Fl2hxo+NXJyKZ
	 t23DGwwuWHLmhWA6tdjk6pYVTBVDcCyzCrGMaryvnh+tNjQkew2hRcd3oFPZyC90KM
	 zrEZunsWLQq9Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 8/8] x86/hygon: Add Family 0x18 SMN access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910082734.3771675-9-wanglin@open-hieco.net>
References: <20260910082734.3771675-1-wanglin@open-hieco.net>
 <20260910082734.3771675-9-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 08:38:52 +0000
Message-Id: <20260910083853.06EF91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Hygon Family 0x18 DF nodes in a socket share an SMN ingress. The root
> groups therefore need to be associated with sockets before they can be
> expanded to the dense DF node indices.
>=20
> Build the node-to-root map after DF enumeration and expose Hygon SMN
> read and write helpers. Hold a reference and reserve PCI config space
> for every root used by the built-in node layer. SMN remains unavailable
> if root discovery or mapping fails.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910082734.3771=
675-1-wanglin@open-hieco.net?part=3D8

