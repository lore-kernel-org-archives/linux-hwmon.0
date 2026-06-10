Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B8F47DD7E
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781124056; cv=none; b=RgyXS+iuypqj1e3bRfcMFbXi78wIjLxk1Zfm5PyTnJz/6JcL/1dpLzDiNLpnsFBoLU6J1md/y2cbrq2X825z1T8rzFj2N8DYfGC0EIrMZPlUQt6HflDiJL3t/fpy8NaeJJBXFg8tLJtKd2MMGbGCXzVUH4MKbHNvjK9lw7BGWzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781124056; c=relaxed/simple;
	bh=oewP74Oj9zPKwOUqNWlIOcbmXwUD0yyiopTCxCL4RLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=guNDRkktmFUVmehiFNn0KUT6QZv2D5B30dc+sQL7LbokyTmhMl/TJ/crKIobPFed3mvofszZEl5B3wYSPw9cqNGaC4vWbLfFh+BSQ7qUo6pmd1Rwm28dgqMEhYZv/rAe5KihbV4E6ORBwtLpdNaOk+ixzMvnVhGsgJVufMsbJ5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHBl0Yfp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHBl0Yfp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCC3F1F00893;
	Wed, 10 Jun 2026 20:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781124055;
	bh=oewP74Oj9zPKwOUqNWlIOcbmXwUD0yyiopTCxCL4RLQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UHBl0YfpZHbkhsiBhw0e/sUH45PGdsvzyHrXRX3ZhMPaJxAk2NfxNFLJeGRJbsscO
	 SoyRMWV4NjXe3hSyOjJM6vu0XEvJ7YP+gldj7fgTDZ5cOP/aZGvo8y8N0fxkfoBEzB
	 /zVkpKFTXeimG5CvkWeuTnKuTITnIJT7wEqry0Wrw44uwp1I9gtPya8hgcHGhX+dZG
	 95ZxAgQbFy2pwqLEaHjryjfRz0zRJ1w0A64+FybM68R1qhACqnAI/5ZUhq9I9sI8O9
	 0z4g3ARxJspQ9g+nZ8JSbDgrgYDgTqX1D5Ap5XVuYkC8IJHug5HoocOA6QZlUwnxWV
	 1pRTHrgRIVeuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] platform/wmi: Make wmi_bus_class const
Reply-To: sashiko-reviews@lists.linux.dev
To: "Armin Wolf" <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260610203453.816254-8-W_Armin@gmx.de>
References: <20260610203453.816254-8-W_Armin@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 20:40:54 +0000
Message-Id: <20260610204054.CCC3F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The functions class_register()/_unregister() and device_create()
> both support taking a const pointer to the class struct. Use this
> to mark wmi_bus_class as const so that it can be placed into
> read-only memory for better security.
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610203453.8162=
54-1-W_Armin@gmx.de?part=3D7

