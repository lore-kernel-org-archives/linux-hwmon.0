Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEAC33C195
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Jul 2026 20:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785011962; cv=none; b=hZi5V9z66tgqJzxWgG/Y9ZPgeoDUpOYkplAZFe23iEa7XipstiD7ZHZOQOBKtXJIlbQdyX2klpBFwJGN5CYUBDeIzgItVHC05NHD9g72HCNs2o3Qrisrns9ffRIEnmi5aOy1cn6xdTIXhy7GbTCJjNSlYlqf5qcmrRv9Qq8Dpac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785011962; c=relaxed/simple;
	bh=cQAD5iMCEGJFYsQwCH8TxFc9TotOtbDn7lgU79M8sHE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M5D/ph9x1/A/2XxlM5arSkd6/p3TBkRiIthgI3529F5D5Fr24aIxf8Z/ZuYOxCAP9+6m7Q8mf300xSmlwEKnNldTwe2sLHKZboT6+iTMo447NhfUBAN/CaGzxvCEYaU7CEjZZkLfI73XVsZPX2N/Co2Ftua71+t+oaAXvTtStNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8VBQIem; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8VBQIem"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6736A1F000E9;
	Sat, 25 Jul 2026 20:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785011960;
	bh=cQAD5iMCEGJFYsQwCH8TxFc9TotOtbDn7lgU79M8sHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=X8VBQIemPUPOivg/m9DKjjTVWhwgpaDSyEt9/TQdEup8HeY2GIhsvCPlqKYkXVzmn
	 2Qu0LzVeBqejE3yTVAi/c7qVVm/TRIUhP3GlQcygG4MFIB81/yMuZuvjiKOV1o8UAs
	 335Xz5dRiq07SpQomVSLfBeCQwQG0uHhqq+LzEy7kRjRx7yPL2oT5slTr2/QIfNqQD
	 FTx1H2ZNdfZFmOeVHHV38kIGoE2BexE/FQe/TUKncQvPAqzCEPeepoEEgaLmpXBsBu
	 J/+sfNuQwrqbzmQnVcfYI6DBZfLiniCYH9S6JYn97KOdaqkQhG/usdkJJmVL+DYBmx
	 sFAJpUaG58IXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/mp2975) Eliminate dead code
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260725203527.1913970-1-linux@roeck-us.net>
References: <20260725203527.1913970-1-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 20:39:19 +0000
Message-Id: <20260725203920.6736A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Coverity reports dead code in mp2975_data2reg_linear11(). Code analysis
> shows that the parameter passed to the function is always non-negative.
> This means that negative values do not need to be handled, and the
> associated variable and conditional code can be removed.
>=20
> No functional impact or change.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725203527.1913=
970-1-linux@roeck-us.net?part=3D1

