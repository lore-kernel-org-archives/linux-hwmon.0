Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E719407CDA;
	Fri, 10 Jul 2026 10:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679135; cv=none; b=hZEY4spzScXMLU1w0JlZ0bvQ9jO7kifdCtKczzEswxgRjFUxA/j13QqwgfMdSegN27MnPfiCzRo8NCrAkScY1WGJ3IfZLSt0HiNVn7tyMq+QLylmtn5CQuQ/5BPoyqrPIh9bvB+zYaPLW5OWDnih9uw6aoJWckkY63io4PZb198=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679135; c=relaxed/simple;
	bh=IOpWaUyPOQCtmqUn6Bb0rKnZdKJaeXbKWZhlgXsR+Qc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KM8sYlhLrCE48bzOAbtk0hOcBAz2XKCiksRX2k9d0IdvSdGn2jnmQNsBirHiliR9KpFaYRWwgyfGnyACHVtAtXP19nVanSqJVSewtBjuCZ20i5rhvtynSXyzwYudw/vWueJRaqT0Da7K2yTUss4GI0AfViqkzGXSKcZd1cE9zjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPxkQNmJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPxkQNmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9FD1F00A3A;
	Fri, 10 Jul 2026 10:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679133;
	bh=IOpWaUyPOQCtmqUn6Bb0rKnZdKJaeXbKWZhlgXsR+Qc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YPxkQNmJnctiUqTFfY9mhwmLKIZgwQpoe1PMa86/5L97dKr2Kdw2bYxhs2X5NwL1V
	 AbCAf6UhKS1A02vc0Zrjn0brPsRtHVF869LU3AaBLiI6ITejqLAiVAix4FA1l3wrJL
	 ymGeHcVqFIxdOl9RbcMh9QY9FLQsaYq6sIqQdM+yKQ9LjkNlLirRxOLdMAq38B4tLT
	 Z9MxqIF/BUCTGjxo6KI+yiVhdsLBL80e1GOzjAzm3ZUwDqPYZBe2o6a8Q9IRxWLORC
	 uO29t18kzbdkASy/LCaJ7s5rlRSd/f3fmGWPn2G3Ca+z+TNUxwn+C4MDsiomKvWV/o
	 8xIU8NXBDTWmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 6/6] mux: add NXP MC33978/MC34978 AMUX driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleksij Rempel" <o.rempel@pengutronix.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260710101358.2606941-7-o.rempel@pengutronix.de>
References: <20260710101358.2606941-1-o.rempel@pengutronix.de>
 <20260710101358.2606941-7-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 10:25:33 +0000
Message-Id: <20260710102533.9A9FD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a mux-control driver for the 24-to-1 analog multiplexer (AMUX)
> embedded in the NXP MC33978/MC34978 Multiple Switch Detection
> Interface (MSDI) devices.
>=20
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710101358.2606=
941-1-o.rempel@pengutronix.de?part=3D6

