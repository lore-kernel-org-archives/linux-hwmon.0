Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFC63164BA
	for <linux-hwmon@vger.kernel.org>; Mon, 21 Sep 2026 06:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970657; cv=none; b=Xi8YnuLG/fVSmd0bJskIqnLkmMoczEnAZtnUL8uz9HbzdkN6ytiThU2pQ+Yffq2XyH0ZCwIgmhpT4cyZMXxLxwYU7sYZZQ3+0ILyhPnXwq6rO6quqEPd9kN7jvKmbJT9isXiFG6eSvzYt16Go7gU+44r/6wr6xXf/J2FEOWiv3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970657; c=relaxed/simple;
	bh=7zm9SxEhZnjCd7RN7LvPJ2d31IyaN/mPeV60nPTaMyA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZRQK+6Lixr4QKGO6HnuQcplZ9gJajKiR1g75ljJyoE5taOqKsEeWZeDzyVq0XR2C9Yqm1R1CW7aCCap26m8656n23LrnvskAcpQyntFIWlWMQWp966tQYsW3zFahIu7Yyzuo+Hjoz7KQXlO1IXPjuBZQvv9NUAdw7B0XEiNfXgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SCsuQrxW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SCsuQrxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667D21F000FF;
	Mon, 21 Sep 2026 06:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789970655;
	bh=7zm9SxEhZnjCd7RN7LvPJ2d31IyaN/mPeV60nPTaMyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SCsuQrxW46xHhs2PpPfWmMqjwDabEX5FznyCqOJBTxUUwk20IpNyOdLF8RjbiiiOo
	 OcTA2FzSgkEI314fO+ZKk+5gx9dlTg+ZL4lEEWyIpUjCzCKAwGYn+9HdW7IStHDOwr
	 hLyujaxBuhrIhEV3r91pAetBpBbnnP6mg3AhmLbRGhve08LTXkm9GWRYx+Is0XFKt+
	 dCAbokfWjBN23L8rXLwoDG7nRI38SMt6qY8Xcr6vFVbvJKfmgWOcDhgbkXbxRpF9SI
	 SxrbMbx2cDr0/8x7riH7+6pFBpZCr4CUE6m6QyTVBkULqpqKZxXE7/zXbWyReBkMHt
	 iEooqsSaWfsDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/8] x86/amd_node: Restrict SMN setup to AMD CPUs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lin Wang" <wanglin@open-hieco.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260921055603.25112-8-wanglin@open-hieco.net>
References: <20260921055603.25112-1-wanglin@open-hieco.net>
 <20260921055603.25112-8-wanglin@open-hieco.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 06:04:15 +0000
Message-Id: <20260921060415.667D21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> amd_smn_init() divides host bridge roots among amd_num_nodes() entries
> in PCI enumeration order. Hygon DF nodes instead share one SMN ingress
> per socket, so the AMD root map cannot provide Hygon SMN access.
>=20
> amd64_edac, ATL and k10temp no longer depend on AMD northbridge or SMN
> state on Hygon. Restrict AMD SMN setup and root discovery to AMD CPUs,
> leaving the Hygon roots available for the Hygon node layer.
>=20
> Signed-off-by: Lin Wang <wanglin@open-hieco.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921055603.2511=
2-1-wanglin@open-hieco.net?part=3D7

