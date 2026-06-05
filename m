Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE0B29A32D;
	Fri,  5 Jun 2026 06:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780641353; cv=none; b=hYdekaTfU8M0VOJ7kdvQClBnuUh4Fy9lG10SW0GNGWDqlqzQGMCrF+o0ZPEIv2kaLPGPOOlpCZdQlZFxbKtGLlL/juIM+0CKcm3C8yRwbn9yvDqF+s1EO7QUVSwicOiRh16/frD/Gk+z+71eNZXqYtoK9omJS8fC5IVI0PjVkbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780641353; c=relaxed/simple;
	bh=vTHGQntvE60LKkMZwzWnzB51M5gDPMSgN5lU7Otczo0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f183+7svZlx/9YQCBMTxTmx7/isMDY7Dc8qtzKOUIfYy3It848nZni+nfPvStTAUs+KOWZ7opyO4VIEiUvwUHWHUgO4WZ/4ROC2jHqJEL9YS6fgVcCS8PDYLbCIQJzEnRmPjUm5aYckxLn+XMZvHF24pCNyP9Fq9XRiH8wWTClM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gu3SPRLx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gu3SPRLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ECBC1F00893;
	Fri,  5 Jun 2026 06:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780641351;
	bh=vTHGQntvE60LKkMZwzWnzB51M5gDPMSgN5lU7Otczo0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gu3SPRLx+KV+5opT4vQLxRsb/6mdbZRSNZyBqe6SEQ+GpppwRQtA1vmjaOi/cHoKe
	 Wv1mA5KOeda4v452mTG7/BaebwsTRCNSpSKs+OKVfEwenOz+uGz3jbCBYqkQ7nIPNV
	 FjtZU0LfYkM8Y0hEljZrKeD9X7HBZB9o4+ou/xbcpse1vFc/XXvNZwyVW6mrPoyI0R
	 iWRJTm6Avzr//TPEfW7uoLkuTux1QSqcO1lwliSHeteo6/cePx4QTKHhXFdIMoyS9y
	 3vhOZmJsNdcfbTtmQ76HlgqEvs3VzKbo0UZxQxEaTyYE43LsgHKwGpePrtLOpyxYv4
	 KlHhNfEULNmLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: hwmon: pmbus: Add bindings for
 Silergy SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260605063042.91776-2-zmzhu0630@163.com>
References: <20260605063042.91776-2-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 06:35:51 +0000
Message-Id: <20260605063551.9ECBC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ziming Zhu <ziming.zhu@silergycorp.com>
>=20
> Add devicetree binding documentation for the Silergy SQ24860 eFuse.
>=20
> The device is a PMBus hardware monitoring device which reports voltage,
> current, power, and temperature telemetry. The board-specific IMON
> resistor value is described with silergy,rimon-micro-ohms.
>=20
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605063042.9177=
6-1-zmzhu0630@163.com?part=3D1

