Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5891C3FADFD
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035950; cv=none; b=XhIKS1uk9fhMS9is2p8QPBeNE8m2H1v+Hg1sqt/NwP0n/7Gf/5ikF1kk4VodarlWRUZN4DRDB95yXpANcQqd4Jlx5M0nF3jpF7M2cFO0m4PE21+hYIzodxEFfzSpc4DILk/aLcJH6BzL1zbmmo4jEplZd445uZyJqRwLm1bAKV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035950; c=relaxed/simple;
	bh=oye/mWCajTKc0yacA+6swkGxga7tqtscCum11Lbe1Cw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fFnT5EO91Pr8E7ntonLWhc3+xlPRC0wAG/fxjOKpDbfpmLsM1iuqc3q8onA97ZyyJqnDapwVv9g2ZRLUHUoUtVWWQJd+JiBPAzThzK2ES4CE9SWLOoiJXeVt/mEZ7Oa16lse3W/nMlIEcgITTn302x4BC+/OUFmQ/QgByx5U1gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvVcauhc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvVcauhc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3C1E1F000E9;
	Tue, 14 Jul 2026 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784035949;
	bh=oye/mWCajTKc0yacA+6swkGxga7tqtscCum11Lbe1Cw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PvVcauhc5HGwCeB5DhCtFqBCLKpn9qczT6bVPnMso5iX7CQ0bprm90SYENaEKt9v0
	 ZE+YaMQLGDS/iLzlt9SYE7Fvsj19m/3YiXxvlLeP/+r9YB77Yl4rLeCC9JlePHVwZt
	 RIRakxmU6yfnEDbh6vOOoR2+TgfwiQZ5r1bkK9MkrJCiSR4Dc/H7SemH5+V2Zf0pB5
	 avSPsG+Qb6moowSO1AuqYaf5QKrWW7gtTAlPeviGnCtltotvy4sCkQqSglvx7Gls89
	 qBn8yVOVKJgx165R6TDS3KwwrJyKQqqCJr1lQSX+oaUXcPhxgxT+5ubHLbfyJz3GZ4
	 olOTRJFRP8nOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260714130228.449233-3-panchuang@vivo.com>
References: <20260714130228.449233-1-panchuang@vivo.com>
 <20260714130228.449233-3-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 13:32:28 +0000
Message-Id: <20260714133228.D3C1E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The devm_request_threaded_irq() automatically logs detailed error
> messages on failure. Remove the now-redundant driver-specific
> dev_err() calls.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714130228.4492=
33-1-panchuang@vivo.com?part=3D2

