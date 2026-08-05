Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EDE32C94A
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 06:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785911012; cv=none; b=ccgFbMULiw/IHfOUIt4b0ZTEb7pqERDpLLNkBlD9m2ZC5qAvobFDUKaKmgA1PSXDfsnnKLAGoEj1AblHXsOWyT2HDwS/qkcA71nIKxNQIs7sRc/JoXlr/blHlvc9PMEjPHmezIIaQf9u/lAUQF3gmcjMDwPQKlMM4/WIJq4KgyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785911012; c=relaxed/simple;
	bh=9Yso+9x1b+YPe1XceToOu4DaPdwhMiFOJzPP0AEr0mA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pa0BMfW58oBK1OTgcSlNiDsZ36xeZyhLdRULtv3sjCwEZRykfFUb3LmQKIvRXcE+arIIx5lWqE1Co0O4iKqSa6+El0ioRZpFEGWFIQ05hmHO8w0gitp1Fqd5YqqVoyrIij7wWR2oBtCc2KbasvKW2wSSOAr5ZjaQqpoxOPbqqUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fdjVxgXu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fdjVxgXu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3162A1F00A3A;
	Wed,  5 Aug 2026 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785911009;
	bh=5hcnVRPpf18UropNnzD9E3SzeH0pWi7A5ALmUi9qpaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fdjVxgXuwgKbIBe+vOzvzKHOZYhblaKWuiI/YL/Zi9+A3T4iC5qYvNsXuIrM5UupS
	 rBmExxE4/j6Y9ED25m0La1mT0Fg971wnrTwLju/Gj20PQuoecHgTliYgDEsswJ1MaM
	 A73OEBb+luFPjwph1lf8fp1LwQBmWP2aUWH+D6dqR7+GfoYQmR6V0aYseyyR1tNQ/m
	 5BfdUZikwVSVOSnAq/8bGnfihJUba1zkxMjNCZECw92YG62wyg7bYi8uzQ5KZGqu05
	 +L194BZ0GMbNEZzm69GmelSPQTeID1I1ubcM6iRNtPoRCHJoes0AAHVXzTtuY1NP8D
	 xvjk+FbKyWcIg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] hwmon: (ads7828) Fix external VREF regulator
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qingshuang Fu" <fffsqian@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260805061645.1331652-1-fffsqian@163.com>
References: <20260805061645.1331652-1-fffsqian@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 06:23:28 +0000
Message-Id: <20260805062329.3162A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
>=20
> The driver currently has two issues with the external VREF regulator
> handling in ads7828_probe():
>=20
> 1. All errors from devm_regulator_get_optional() are ignored, causing the
>    driver to incorrectly fall back to internal VREF even for transient
>    errors like -EPROBE_DEFER or genuine failures like -ENOMEM.
>=20
> 2. The external regulator is never enabled. The driver calls
>    regulator_get_voltage() without first calling regulator_enable(),
>    so the VREF pin may remain unpowered if the regulator is not
>    configured as always-on.
>=20
> Fix both issues by switching to devm_regulator_get_enable_read_voltage(),
> which handles regulator get, enable, and voltage read in one call.
> Only -ENODEV (no regulator specified in device tree) should trigger the
> fallback to internal VREF. All other errors are propagated to the caller.
>=20
> Fixes: a8ddfea09566 ("hwmon: (ads7828) Accept optional parameters from de=
vice tree")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805061645.1331=
652-1-fffsqian@163.com?part=3D1

