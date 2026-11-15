Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753681;
	b=nv8KcB+VWhjE+dZFz9zZib6dauo2O0kqrSfzZzCFg5tM4Nxi9Xk69iVUd7QF9l5MBEMz
	 +27HLUZ59CtUyqZzSeTZEOn0xPFNYYjNsWPFHNnvdr3E6BuD4yGUE61h2LPk4zUS4ajJP
	 h43z30FLAckRTNxnj+bOuFuHkJyrUZmuNxjh79IDD+EFyfBK4sAnNtY0XgmeSEcYAhMlv
	 OlxIg3nl2NvtB5by50286fMkrS2C0pbjCW7OHqd7AuIQEwtyT1EwsshYbs/pP2tJ1exmk
	 u6oKUc+Anf+YfQAQH6JglXPeII69uzLwMMsU/U2RnbPB8+1pzmJhA0H8EyjTdeKzRnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753681;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f15A/MscD3qzDiaRVv38lGdmq6IPg9tS2k5ldVs+6Hs=;
	b=eEr7t4YUIAnR+QMaMMnZQTWg2Dc5Vy3O4ikaYGB4jvxFvpbaOcB7kPjhhpyf6/Bx7Un3
	 8uzn30tx8ltbjhDRpODcWA7NCfsgiczDxSgGyxiIp2V4D2wz/Dgup22XI4VJT4J8XkkKa
	 rNR9oOzL7v6akpFtr2xjIBZVdaJQc0RwB2rBXvqtF+1AX9bQZVQ7vHukkpT4roJKXPPlD
	 +fBttSgdOUxFdT8RP6QAyv2vIkjf+xbzWaJSdp5coEe47r8WJ42iJWBbYBambUO9C7I3A
	 POuVmiWayKQtiNJaWYvofiz4+FFpdHTAUEujoAy8cJ6IDOZDhktcYBnKOw5cpUJMKaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AANTUtFI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBA8606A31D
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 14:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AANTUtFI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740FF1F000C4;
	Sun, 15 Nov 2026 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794753681;
	bh=f15A/MscD3qzDiaRVv38lGdmq6IPg9tS2k5ldVs+6Hs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AANTUtFI2zPEUXuqElgwaf6kbL/46NOG6Lb0PPXoa6tNnRtEvhnMgN7XY5nhWFQLU
	 OqkZ9F+ZC0f8fPLlI/FDBjKI9u5pkylTVt2ah4y9t+I68xNBa7ncARZCqSu1HZnPSS
	 I0CP4i0UoGL2bjPdCxXwHWT4ujurEKsXOkRHUgOIXRMeu3hFcCitNyKKp0XOeEakHp
	 +17584LFlqEBeGBwhb10B0oHatJ5VNK6TzbF1nSJ5tlRHdfEMSpXNVgS1I/B44zqrF
	 vO201yJwDOM3h/wcrrNY/r6Cm8lWFU16xIIpRzWg8GBpFA3nbJPQFC9dMXdXoCuF5C
	 oEqjnWY1J6SrQ==
Message-ID: <sashiko-outbox-215587@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (asus-ec-sensors) add ROG STRIX X670E-F
 GAMING WIFI
Reply-To: sashiko-reviews@lists.linux.dev
To: "Eugene Shalygin" <eugene.shalygin@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261115143708.492883-4-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
 <20261115143708.492883-4-eugene.shalygin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 14:41:21 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

> From: John Roden <jonathan.roden@gmail.com>
>=20
> Add support for the ROG STRIX X670E-F GAMING WIFI model.
>=20
> Signed-off-by: John Roden <jonathan.roden@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115143708.4928=
83-1-eugene.shalygin@gmail.com?part=3D3

