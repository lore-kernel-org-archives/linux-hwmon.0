Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532E52E6CB3;
	Mon,  6 Jul 2026 02:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304215; cv=none; b=HF8QzZWcMRI96yc/f1oAOgPqjkIylJQLs0GTfB/fnv170LIcbc+H72F4CodaAP/bhQAS0uTnvNEY5CR77DE3tRDb8HOiHDnDx7wa5jNQfBkCGm4hyQhs498UKYWmbIjbpreE0NQ9wLkxfRzh+Jv9PyxlxnwmVjp/C9Xd+BcPSj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304215; c=relaxed/simple;
	bh=qGfki+vop4e6v7zfWpUeuYT2rGggdkk9U0nabuoQCnY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tie9nelV+nrN0vrvMB1uXMpT4RgBxMTK+Ew9cFd8KX75l/tlqCAdYg/qnhWts0Cs/xF9yHflA85rP/40W+Km3WHjjvW/R7at1VB6pWotOGY4QjmUiexUbaxyqsD8kw+AxF05vk2CAcUcRrWBu9dxvAeM57DfpUPBh6qbqiYcD9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wva9WTsL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wva9WTsL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF771F00A3A;
	Mon,  6 Jul 2026 02:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783304214;
	bh=qGfki+vop4e6v7zfWpUeuYT2rGggdkk9U0nabuoQCnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Wva9WTsLtEk4xL12EkcZV10vA3sdGJL31hF6H5BIIozFHD7vchryfLSe+pcn9vIlU
	 V3LgKcAl6/iwO+k6Dg8YQvynDeCgpBexKUujQNNm6m333vqimScQ5PBDpoBI0ftpxn
	 fy2PmL7cuSAQ7Cl707YFAquGrpRqNn2RWSPPDT2aJcU4ckvQSslCUChwZG1IwcsdiP
	 EI7ZgTIxc21H7FLsTWwPAbFgKtb2tT22ziU/Kdq+8QCcJT1RHlzDEBN+h8bxmhgJoF
	 D1s2LuXFFyVryuKfnlD8TfBybD6h5GeSiyKOl7MpmGtRLbqY5vy37RFB8Gie361lvs
	 Hk3yK29Fu4KvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: hwmon: (pmbus/max20830): add
 max20830c and max20840c support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexis Czezar Torreno" <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260706-dev-max20830c-v2-4-37761e89bb5f@analog.com>
References: <20260706-dev-max20830c-v2-0-37761e89bb5f@analog.com>
 <20260706-dev-max20830c-v2-4-37761e89bb5f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 02:16:52 +0000
Message-Id: <20260706021653.6DF771F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add compatible strings for variants of MAX20830 which are MAX20830C
> and MAX20840C. These devices have the same register functionality with
> MAX20830 but with a longer IC_DEVICE_ID.
>=20
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706-dev-max208=
30c-v2-0-37761e89bb5f@analog.com?part=3D4

