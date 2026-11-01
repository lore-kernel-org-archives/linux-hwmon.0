Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530517;
	b=pFNy4Pu4+lMQW6LbevPtl7aNHO9OmExdFzS4fjUYTzbisdil0shTUBbpYk/vh0vK9sWT
	 tXCFbFIX2es4kG5uneI1FZ/P2lvMjfKZNMeb4NsERJW437mg+FTU3Cnxt38s4Ve2/VwtZ
	 p8xdpjt1FHCXXrPZwnhOj9yWplHhiamb4dsEfnGjuBsKZzKCmEiRhHinGM1yf393mhuDh
	 4hUladFmdo+9ra78+uuangb2MH0V+zyIP3U6k2yTZl5hKKHGMlDDZhUwVwnbpQspboH0g
	 lpUJA3Nx8GA7i2UgLFxPnRJr4nfTETNk9k/nz1eP0bS3Y/00j9p20YWHAF+5YLaHLNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530517;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CBFdaVjjoYiGEa/mmS0oT51Ry2BICA84LpVZDFl/HBI=;
	b=GdkWC6mzJ9MYu91D2DBEXBOmYbNiPP6MklvSOCLBnHZli7uNC4yiZAiH23DtSaEfyx7G
	 B4PPPJrAyDJfXJ/a9l41rGoC+oKgb27mLjDqWeqSSFTBRKQkFRJanEY0q09oD95lEV4Yz
	 IVBZnWf7kt6YEF/kM55uxxop7ACPiwAGWuf9m+JeePIsmJeAzDwyCJ0hoK6w/iaP+gZlJ
	 /bj8m5aeqs329wsoIQZ0gUEgVNspFwpW7aPwa10tO9Fx2Jf5qQVo9wXRQU5iGCklDNb3Y
	 Fex8PYpzcr3RHqAEEDjzEuJXUZHMRlApz6vfvN37PIa6hea4c5Yc2RFIq3sF0pirzaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lnLqhjbg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F3B606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 10:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lnLqhjbg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124071F000C1;
	Sun,  1 Nov 2026 10:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530517;
	bh=CBFdaVjjoYiGEa/mmS0oT51Ry2BICA84LpVZDFl/HBI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lnLqhjbgEG2nBCMs8ZrgL9rLQS9mOghsHf9sFOF0l2yGDrH+FtXUa6M6nMkg3adXU
	 +TB8FfM1csUJ0vAWC1x0FOpmx7/JRx1ntv640a3DMexlImyymQUpSMzBLxzQ6Rjbli
	 Tg/d6puraKpSJ+pBm3YBYRjuSGLvCOX36FE1JC1pbD/qzXmdgRsBzAafoOhc2iNNGu
	 AjlXtS/RG7/PMgtJmbjcmZfMJY0vT5889H+4yvixh11rmCTWrcJEAVXu2RRNvThMZX
	 jSjIxvRJa6ve0kK8WPrCYeELW55j/J1nrCSg0tcJx4khOODsShu8nd3UyFG6EL2AFV
	 zTuM/JJ8lTlAg==
Message-ID: <sashiko-outbox-192370@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/7] platform/x86: asus-wmi: reject short fan curve
 replies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartu Alev" <bartualev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261101-asus-fan-floors-v4-v1-5-b8d1c31a99a9@gmail.com>
References: <20261101-asus-fan-floors-v4-v1-0-b8d1c31a99a9@gmail.com>
 <20261101-asus-fan-floors-v4-v1-5-b8d1c31a99a9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 10:55:16 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> fan_curve_get_factory_default() passes a 32-byte stack buffer to
> asus_wmi_evaluate_method_buf() and copies the first 16 bytes into the
> curve without checking the returned length.  Because the helper only
> copies obj->buffer.length bytes, a shorter firmware reply leaves the
> tail of the buffer uninitialized, populating the curve with stack
> garbage.
>=20
> Zero-initialize the buffer and reject replies shorter than the 16
> bytes required for the curve.  Known curve getters return 32 bytes,
> well above this threshold.
>=20
> Signed-off-by: Bartu Alev <bartualev@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-asus-fan-f=
loors-v4-v1-0-b8d1c31a99a9@gmail.com?part=3D5

