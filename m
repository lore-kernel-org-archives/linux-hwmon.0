Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244A9472521;
	Wed,  5 Aug 2026 13:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936643; cv=none; b=RbR6yWXuuGY5gUPq+7HmORxstlkwbpSRnN0+NRuJKEF3UTDd2Wddo19NXT0l8ZsyrzbD0NTi2SPFq7vLDdVXP55I8EROEX5xvchIgvtHR48Ypz0k7S9YxRqvrypt30UUAj3OMdvRNuUYIGDwsuCTmUInPPQzI2mFlqcTVvlXOhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936643; c=relaxed/simple;
	bh=5hXkygvI2NV5n8HKxfCPL+T1joFtocLTRHJiyvGCuj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hZq6ulaVL2y2MkddOBoV/uv3N7xKgZpQiSWDFRlxT1h0GNLPAAu/TBNazAaJ3xAVyBaIyaRlY/EXClSyuCegtwCntNjOwTROJjCj3CisCV7UBgtqYUNMfHRkaP8oVXMx94vsK109gygkuaI98x7RvVPDYOp9rgyeKfW4S0YmRAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8luRJK4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8luRJK4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B461F00A3D;
	Wed,  5 Aug 2026 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785936639;
	bh=5hXkygvI2NV5n8HKxfCPL+T1joFtocLTRHJiyvGCuj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U8luRJK4D4qdHJbuI0436BKJbm1TTubEbQ1t24KM2y8Q9lcPpVxoRQrbSSjIM10Wx
	 akc3jg90KawwagGZJsME7mbzVlDC1RFGRgbAYk4ArIWSEOC7qUzJmxwLq3W4BCaQ2g
	 4q5g5JesEIiWoba2nbZQ4WUiPIf/bI6l4ls0meOL6+9lM2LxYo7xZb8G430ZDeLt1c
	 hf038xOs/Rml5xAqLXqqjXrmiuVOxwogOm/rPjdfaEE5/9w4iIEHdKQanqwKcENE7/
	 dhxWi0gx11e9cyAaJ04YjnkZ2rP7hFJHVPQxb/7nZGdHnchThwLpmzPwA+eUANYVS+
	 gZuaDeV/ht5Fw==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v6 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX
 macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-adt7470_thermalzone-v6-2-5605a5f95467@gmail.com>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
 <20260805-adt7470_thermalzone-v6-2-5605a5f95467@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 13:30:38 +0000
Message-Id: <20260805133039.36B461F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Instead of a magic 255, use a macro to refer to it.
>=20
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-adt7470_th=
ermalzone-v6-0-5605a5f95467@gmail.com?part=3D2

