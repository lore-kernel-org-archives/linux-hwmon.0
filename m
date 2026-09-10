Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17243CC7F3
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 07:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024206; cv=none; b=fRjcDTj5Au33QfRLBIqjcJgR0o63Eaz3+T+N7OtvDSpLVPoULnnGF+APCDrijsNhw+Hzkh+cf78zyYKCPgHsietRqi6mp3UHfWmsNIUWNsaWObmJ97W3UDOYRAxJtoAfozcf1awp+Kw0PkikTk2nCF/QvyIL4Q4MKd6N3i+u1xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024206; c=relaxed/simple;
	bh=AWEekRyI8NjsLRtqY69OWU7MyQop/Mzu07+T14CMEac=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uUcJUATcKbn/87ig2x1AA5o5YpPpo2Sam33c2C79XB+MZWIc2MIKHSiw6DyvqP9HYoHhO1WVrFi6D3ZcbwxtEo6bgQnzywCL3QXLU1LOC+ihX8YOwYWHeueJGxOt+FQq7NIGHtXrZDL098ok81cOnqwpqj5VzhcF3pBu7VHwN8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQt7b6q9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQt7b6q9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC5E71F000FF;
	Thu, 10 Sep 2026 07:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789024202;
	bh=AWEekRyI8NjsLRtqY69OWU7MyQop/Mzu07+T14CMEac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NQt7b6q9h8NrfqbwAA0Zde8yFc6a9uU8V2K3RcpIHziBF1bKC3938XIl8swDQeYNW
	 WiTUlrCvtiSBkaTXwVgfX/QMj04hyCfVmK80dI6QwvI0uY8ABmscFIz6ROtd+D2I7B
	 7LcaaOeNMoWa/tFWIruzq+CrDg2cdY0tjdrJK97eaNU2SGhDmGinRbictY0fZ5RAHi
	 OZkYUYMz/sT5gI6Er4CYQuY+9RLElu3ybKMT0L5z8Ib3QMkbGJNMgPCdnX9mPTsuhb
	 baNMDpaz90GNm85UEpmiJT4erTQXhikvGW1yi8uJ1+L1XKCWF9SARxXSuD03GMzDRo
	 nP0mATSXokFoQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] hwmon: (nct6775) Add support for NCT6122D
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260910-bootlin-hwmon-nct6126-v2-3-ee629ab35e49@bootlin.com>
References: <20260910-bootlin-hwmon-nct6126-v2-0-ee629ab35e49@bootlin.com>
 <20260910-bootlin-hwmon-nct6126-v2-3-ee629ab35e49@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 07:10:02 +0000
Message-Id: <20260910071002.AC5E71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The NCT6122D hardware monitor is the same as the NCT6126D, the only
> difference if the number of UARTs: two instead of six.
> Add it to the driver using the nct6126 chip kind to avoid code
> duplication.
>=20
> Assisted-by: opencode:z-ai/glm-5.3-flash
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-bootlin-hw=
mon-nct6126-v2-0-ee629ab35e49@bootlin.com?part=3D3

