Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FC93783AC;
	Tue, 30 Jun 2026 02:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782787912; cv=none; b=rYeBDlgwnp62PW2rRrxy86v461AguGYvEM1pPtkXXD8wvt5L6Rc2xL34d4pJs4Ua1uxHuwrCWYILES8wUakBJp9cDc75nP8rMY3NxSb4gXGgZc2jwQaMoANjnE1+mLd8aHD8IvTVHruXB9Rt92kEW/WpTEV+aTtqq5mpH2K43R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782787912; c=relaxed/simple;
	bh=dOTVnxcSYCh1tzQ0LMnCNkZp27DjRG0+3MGVnlqc+Us=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XcwHu1DIHPjEdcnBzJouYYgqQPAl/gyDuEKF/Jn8DacC/Mu8+E3FhDIedTCMVx5XNfDUSpNQ6s/6unRf41N3QeMLQwAJxI4kxpn8ZO7A3bQ3j5eV06lC8YE2aQKijv2KY7ZnyI3bGhclLGpNlOdjwr39dNevJuKAnnos2xNln3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iHKV8fl5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iHKV8fl5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FEE01F000E9;
	Tue, 30 Jun 2026 02:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782787911;
	bh=dOTVnxcSYCh1tzQ0LMnCNkZp27DjRG0+3MGVnlqc+Us=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iHKV8fl5s7kamCoMXZrZAXMjSaR9NCj40wi0bCh3YlC7RI6pcdoS4rnePtp1RIGhl
	 IehIIxI8Y6xgqqodvj7f9Rsm0hEHhUjs99fYS6Ww4WSEdwkQoDP9SvDLFDwG4E0klJ
	 e9GLxo0ZkirTJ6ooBF16fdyXTt1ppbQnhN3cZKLiW+A61Yj9ns+CRj5/oWqizrlwpB
	 Z+BC17neLOQcvnhwuvz+N8ZZwq/X1RCx6LG57V5egU/fNIuII75YOyxBh9F/ZLHjBy
	 pFicWNgRUCJkXU5xn7yT26/sSmv76W+DzTCoeCDUwqNYXxcimcOZcpcGnwjTIEPe25
	 PZzChkXWGgQKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: hwmon: (pmbus/max20830): add
 enable-gpios property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260630-dev-max20830c-v1-1-a02786bde470@analog.com>
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-1-a02786bde470@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 02:51:50 +0000
Message-Id: <20260630025151.2FEE01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Adding a missing entry for the MAX20830 EN (enable) pin.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-dev-max208=
30c-v1-0-a02786bde470@analog.com?part=3D1

