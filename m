Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145912367DF
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780180343; cv=none; b=dfST7rsfdtNq9cVQNmg8mlBNEr05MObhp1uVjgtLAyPFK7LF9QuOyNSOkcwTRznnOERywpeisCX5JhQ2ajcP6/isOEsta/x74SCV9rwVa19pU2npdxSOjeRgPlhqYbulV+kKCuOR0x3UMiAOjJ5FTtQni49Fnf8ffwKDbmuvT/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780180343; c=relaxed/simple;
	bh=Ot83wU1iyAruw8jTJAcCii7qiezJjXzcFqS2K68lgRk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YvVkB37fL/KwvqR2KCmh4mWZ21JvUZND3LxqHjjIh6nwaINSRGyzzR5BiLxe7XImusFpl3Y1RZCRMKsN7btc09iRE87icmXoVCXvCu86+abCUVE/fYSuHypr+1dEjqPi+G2mA8+7H/bzsPxKlHb/aIAtH+s3vmvIQ455xtbXXy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHCNEswN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHCNEswN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 327631F00893;
	Sat, 30 May 2026 22:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780180342;
	bh=Ot83wU1iyAruw8jTJAcCii7qiezJjXzcFqS2K68lgRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nHCNEswNRsrp8u+21zjgHVhIgqSxCd1QazrfPx0c+GRPn3OTwBvblz8i6kIvoCECV
	 rIaEwYYJ02hQHLFheN1+FH2VJgWYjNC2jFznBhoetJN66hWHgGVcpBPhEUzGw+MtDH
	 WYuTpDiL7HaMR7CG8uEilbJnve30tYEcJ5QE3vaeLd64Hv8umsMxoFOBrqtEEcUUCU
	 8bM102Xu3GXk5YgW5CcuMnmATukKtt/h75UjkGcK9AgWbAgoCs6SDwZXxjzw6URQCz
	 ObK8bCmauDQPUMTje3TZDAm7Kls18ZuHKPS377BfiuV0ZywKR8XZL+3ez4gSRHSsiH
	 fcRgaWrVtheGQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/7] hwmon: ltc2947-core: Use zero-initialization
 instead of memset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260530221353.159461-4-manishbaing2789@gmail.com>
References: <20260530221353.159461-4-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 22:32:21 +0000
Message-Id: <20260530223222.327631F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Use empty brace initialization (=3D{}) instead of explicit memset()
> to zero-initialize stack memory to simplify the code.
>=20
> No functional change.
>=20
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530221353.1594=
61-1-manishbaing2789@gmail.com?part=3D3

