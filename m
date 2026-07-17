Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642622F6560;
	Fri, 17 Jul 2026 21:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322339; cv=none; b=j8ZcmssfAN1SO6uzX1G0oP33MsbtJpFkAPvnw2WJbM7vn93nQl8PEA3pCU1xGTmIpeCYyC1kQI6Zzr8k28nnBZRjXgwt2LNP7id1G9Eknb6NhNvfQyTfEccZYJLCTfhD5zLeOknGARCjqQ4epTYBGHcQgDV3ONz5ktZEv7QAVJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322339; c=relaxed/simple;
	bh=iDO4xQljIsjds/69LUW5F899ccReFxBs2nzdEPigFkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bW+kLqumqOyWheQJRmF1orVkez4e/I5maag4B2Cusj6A9Nd8ZLv/i2wEZjIXKot6xWLiw+2m3lhjuuwDw8pTzwRHORo+fxXfDFKBfzbNxSINF8TxGHKla2Tya5ggVQkS8APozrPt+MFp67KL46nbathcM5n3qqu1ApsXZU4c8fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4fXqEyz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4fXqEyz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68111F000E9;
	Fri, 17 Jul 2026 21:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784322338;
	bh=iDO4xQljIsjds/69LUW5F899ccReFxBs2nzdEPigFkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4fXqEyz/ZjoIxdN+1eUAOdodl8M69NMG6COjjT7OT77zZgQyOpG12090glpfrSJY
	 GEuzkBhWfPAPCAajSZO7++oAuMGNC0thIGarkJKw68WjEmTt7pwYvHYTx7GdB/qQFo
	 dZn3LIVWaHuYGlPnahW3ZMwQRWUkKl3etaQ+LwbdoccV5v7W3GLvYDZ1mNqOOGMuWb
	 A4ynBHKZt4mRvGMi2hFB56gtngqzdXCPH7y/oeC6Yz5N26YRk3ClNxvZ16UStKkC+k
	 kCFgpoxDzAP0FFEzoo7niIkcCEszJNmqs4m45u0LQ7p4kx6+8cMXBe7KpIlqBRWfbd
	 urv73C0E661TA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/6] hwmon: (adt7470) Add ADT7470_PWM_MAX macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717-adt7470_thermalzone-v2-4-a55147958fad@gmail.com>
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-4-a55147958fad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 21:05:37 +0000
Message-Id: <20260717210537.B68111F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-adt7470_th=
ermalzone-v2-0-a55147958fad@gmail.com?part=3D4

