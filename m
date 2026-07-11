Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED028391838
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Jul 2026 09:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783762947; cv=none; b=BA+KEgutiSnlHRT7C4bE0t+0Hxwbv+fBgXuP0oAQ1j7dj9QxWop/2PjrZa/xv3e9YXMOwtcIA5Cc7P2tL4TAEnYpkN71coAiHQBh+9U4jSW+5rGx/lO7R0FTtZAd8PWoDhOTaj1ShQ/VL+ibNLYNmoZwRfpu3A2flzEF2xliy/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783762947; c=relaxed/simple;
	bh=lM6y3ax1cKFPncTyKOp7ByFsM9LW7kl1oDWQJHeJEUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CpvJPLksYvkZyoFFvqW3cC27bU7suYGp3KtSvIFgKRu3BOkYw16gh/kmWwtPvJXCaLjsAH2yvPtLPTVHi6vyQU25B1nAeXYQ/p8sU2obifRurqD0S/lNLjMeM9EcY1uVGR4ZidX9oLvXVIqHAPcSByt+IxokfoX+aUQ2GPJI3GU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F161iXHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F161iXHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F5F41F000E9;
	Sat, 11 Jul 2026 09:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783762946;
	bh=lM6y3ax1cKFPncTyKOp7ByFsM9LW7kl1oDWQJHeJEUM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F161iXHyHKAyfvPHbrGX9AjL/HPZ51pB7ingHgbrMo21WxYa3xTDGsuTi2LYqkUuT
	 i+09+ZATulb/BCkV9X4iysG43ReROnbTEXiGpg5jegsHLUpn5xEtsZx+4c76ksQGcC
	 Z6WU3A2FOxX6vDSL5l3AI8bN8m7PXhMhlKh227rK1QsI2vt4MZJrlJrw1wlQAh/zKP
	 bXHcd4FMNnO2lh2kOajSF3R8Z31qArjFGqfpySvZNH7HXEPd8cidAAbexrGe294lek
	 rRcImiB7wXZOYvBDSLkqOiFOIA7ToccQoG8Xpa9KGqGTPJ0wotAIqPpYoXMAm6H1ou
	 wllGXw8mrAFBA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] hwmon: (applesmc) Cache fan positions during
 register initialization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shih-Yuan Lee" <fourdollars@debian.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260711093323.14529-2-fourdollars@debian.org>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
 <20260711093323.14529-2-fourdollars@debian.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 09:42:26 +0000
Message-Id: <20260711094226.6F5F41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> To support the read_string callback for fan labels in the modern HWMON
> API, load and cache the fan position names in smcreg.fan_positions
> during register initialization.
>=20
> Pre-pad fallback labels with four spaces to match the "+ 4" pointer
> arithmetic offset used by all fan labels in the read_string callback.
>=20
> Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711093323.1452=
9-1-fourdollars@debian.org?part=3D1

