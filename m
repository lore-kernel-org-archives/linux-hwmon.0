Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213430;
	b=ijP4XbAMhxsQs2d8J3iDUX0IhNKY40emATVVumW7SBfJQcBl4XZ3cbTHDg61uDODBHlh
	 UndJOQaazqVA4amB4sLavkpGZcffIArsXHdpkZ6KWB+aGE1lz34iMs7k/+SWiREONEDpC
	 E6Z+pX07zVIX3vh1LeoChQfEFxVXmDjpW0y5dT3xvnib9ZWAtE3rpleXBUfccE+ebRIUa
	 EViedXPf3iNtspYFPX09Y1HydGA05JdciO9QTWYBFN+BfYdm26fB+pqjwWuIKCqvilMeW
	 zlZJKeR+hgx+/OWV783oxrv1jNgm1X7U/ctEprXeoE+U07ODuziUwcK7b9uu6gAFYEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TZejb55ctBmfarcS2d/fw9swLo8UGkdOOL6x7rtMNJA=;
	b=UmpwlSttVHrNF6tJ+RCZ4G0K2bhi3qYMegg0AAL5xy7s8jYjTugsWVw1DyypX8Et6FQo
	 qOT+snvuJWBXVva0gfUNzF/5pl+mwXSFWENHTFijPXwX4nHJnqXnSo/Z3JWWblYpN9dKZ
	 qNb3CgFqoaMsVftZXOJY12qJTH+HZwgDw65qC4zTNucI5fL4gR6UTujfeTlbZHYUmFIId
	 gLTUSP2vIhljA55Fje64Toy2LfoKLrrf8bshM9FwNnx3a/5Hbg7XZy5ubrbFI5PVepzlc
	 3vBWKfZhqKjGV5fNX1gdrKs/sd8nDxbbhjyuho22uoy056h30rNXEn5RJqjzjKCzR6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzEV9k7b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1294F606A31C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 08:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZzEV9k7b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 894631F008BD;
	Mon,  9 Nov 2026 08:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794213429;
	bh=TZejb55ctBmfarcS2d/fw9swLo8UGkdOOL6x7rtMNJA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ZzEV9k7b9Gb2bB2/5lT4oTaN/OrVzRji+yP1o+HySy9h+TVSavYDnsqEFO9Dc1MsO
	 LM0a2j4PgoTBOHF5Z8hqfRs+Yko7z4EkqORipegNsvZQEkCRSUSdaY3eNtwqe5xVv+
	 ifHXx3CTlN8or5xN/3rVdtnh7iA+a/L3Xen7ChcBQKg08lAnTPVk5erErg2jSHMPQt
	 Uo7FLCo45MIN425rB9pejh3JdA6YGcnfWRvWOsXq+Uf4IzmBrwcPdtc7CSWnmddlb8
	 8kXKLuobUs7NE3/qZGyS012I48+88Gt3NlK81t9H9hKxOXIaI8F+T8GZWfQIa3dUGC
	 LJR/ggVbzahbg==
Message-ID: <sashiko-outbox-204594@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: (nct6775) Handle dual use registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anton Lundin" <glance@ac2.se>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261109082511.851377-2-glance@ac2.se>
References: <20261109082511.851377-1-glance@ac2.se>
 <20261109082511.851377-2-glance@ac2.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 08:37:09 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] hwmon: (nct6775) missing Fixes trailers for REG_TARGET
  word-sized bug
--

commit 07bbb498967ba79c83375f58dde7d2cb44db82b2
Author: Anton Lundin <glance@ac2.se>

> hwmon: (nct6775) Handle dual use registers
>
> The REG_TARGET register has different meaning, depending on if pwm is in
> thermal_cruise or speed_cruise.
>
> This means we can't assume it's always word sized, so we need to handle
> it differently depending on which mode we're in.
>
> The code already does this, but the register was configured as word
> sized for the speed_cruise mode, which would do the wrong thing in
> thermal_cruise mode.
>
> Signed-off-by: Anton Lundin <glance@ac2.se>

[Severity: Low]
Since this fixes how REG_TARGET is accessed in thermal_cruise mode on
NCT6106, NCT6116, and NCT6126, should it include Fixes: tags for the
commits that added those entries to nct6775_reg_is_word_sized()?

  Fixes: 6c009501ff20 ("hwmon: (nct6775) Add support for NCT6102D/6106D")
  Fixes: 29c7cb485b32 ("hwmon: (nct6775) Integrate new model nct6116")
  Fixes: 437b3c2a4bdc ("hwmon: (nct6775) Add support for NCT6126D")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109082511.8513=
77-1-glance@ac2.se?part=3D1
