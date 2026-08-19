Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5623C37C0F8;
	Wed, 19 Aug 2026 19:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166727; cv=none; b=icS5/IRdDTS/gpLeaZEim71oocp6ubnywAm5nbYlmMop0nvaGcACNvwzGanAgfEHxSTZfC7RYUy48N+OpTma+6+j6YKvfyp1pg+ElzOueHRRanbBBeWDwVe2Rug8LyReL3ping1IwZIQO6daDWkutV0EOblY92TKjLjoFFmqk30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166727; c=relaxed/simple;
	bh=vuv/py9bpzeVQlwLyPt4mhdUXZYkeJTupWG+x3si3kQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PFpZASMqYFJrbczt0Zjr0Adw+xZg0ckfgR2pHMrMzi9oehphoobq1+sQZn7DglP4pLvs7qzWq0CjATf/7X/7bLJkY1emHyeli+grp6oCfts76SVgeywLnRO2RjutNs1XPVTUgQLAap71KWhJBlZ6k698SwedSsYDwJefxv079is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnAFG3Q8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnAFG3Q8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F201F000E9;
	Wed, 19 Aug 2026 19:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787166726;
	bh=9TgllrluCeYu/YAyEp+bbwM4z721z1J3oqvcCNmbno8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnAFG3Q8gnBWrOVlbnvfWskJ2x3+R22O2ZmAac4ynGOGROH3heWJ3g8iSGh0rwKmG
	 G3tRZeKKXiU9KAAPv441aX591NJxL6KzWLmqoR9ljcQbPivlVtH5lbiR+aVd4tmTvo
	 aFXr26clmuXxbyHW6746WXf6tm8e617P50NmYD0D/mPH72C2ULCOEQVKhYP5O6vWjZ
	 P01NcKRQM0uWJnOG9yygIaOykD4/v8EBLIdO54V61dtp79xY5TwNmDj2orJAoUTJli
	 hFx+QukYIfRTZAt2P97p/gtYFEwQN/gzNFA11RVsfhH1Q9NJRe/JRboIYqGpblHc6A
	 moHoLCu/+fZkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data
 is fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, linux-hwmon@vger.kernel.org
In-Reply-To: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 19:12:05 +0000
Message-Id: <20260819191205.D0F201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>=20
> ltc428_clk_provider_setup() does not fill in any parent clocks, and
> assumes that init.num_parents is NULL.  However, the latter in
> uninitialized, and thus may cause a crash.
>=20
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
>=20
> Fixes: cbc29538dbf7d740 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787165329.gi=
t.geert+renesas@glider.be?part=3D3

