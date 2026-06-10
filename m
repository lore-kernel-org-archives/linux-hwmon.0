Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF033314C2;
	Wed, 10 Jun 2026 15:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781105221; cv=none; b=d/NRQvPPSH6Ng266g8IrYm/ciLRGqCYaNq16rKQHTINR+RO6+3YZuKUD0loNm4cjPM68evTvDKAeyKvUF4hthvW9xxkVQagDPvqaRP/fUgpVSwp9Ku78wrSme7r1e0ERGHhy927VOJ7391+Rp6UHVRgDAs0MsfTee7PQf8oy4NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781105221; c=relaxed/simple;
	bh=05J4jL4vvicjqZIh5x0uCzsGaVYewEyXAkBIvQutAYY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JjYIPkAeAkzXjyi8AxGlGlooA9nn94mntIRmHwBhG+ClAqISvnGRE8xe9m0zGzQL91O8UiUsXmiUsNaBOX1M8+JryR+pbnegX+z5b77t0uts1+1+t80UhSq6m4UAdgIIbAbVKukzdukHvGMJN7/xtrI09E2k5RT7wRK8hwxO2MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNH+vbQh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNH+vbQh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2D761F00893;
	Wed, 10 Jun 2026 15:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781105220;
	bh=rHL/1SvVGos3++XfJ+SDUccixV9Z7hBd00j4hKhwmBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mNH+vbQhg7lcJcXSStBKXa8RxavD10gE7jGvaUa8ywekWJLWOHq4jYCzm/eRaSqnq
	 /77gIw1YEbkdJoXj0B0zlNKEDfkOiftbRT7labzDxyZFNQcJrDMH8t3K5FFe5NK2G7
	 CTX+X3Wa2Kjxj5NcGG1/Xyz6ErfyrlbzSjCzQWRLS+YEkWMQokoRK9U5xRMDFg9mDC
	 1rJnn7+Or2wrhYWUKfp8wg5roMzKcC3LGyP5uJGsYaAwqu1SQzJROpQ/6PhhUDTEM2
	 RDVl+ScleAaw82BjKWtF+opLqfCcDL5ZHsNEDHGG3QgmITZuJxcLJ/5UKH+og+JR1y
	 CLS7I4hajSA+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 2/2] hwmon: temperature: add support for EMC1812
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marius Cristea" <marius.cristea@microchip.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610-hw_mon-emc1812-v11-2-cef809af5c19@microchip.com>
References: <20260610-hw_mon-emc1812-v11-2-cef809af5c19@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 15:26:58 +0000
Message-Id: <20260610152659.A2D761F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> This is the hwmon driver for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
>=20
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels,
> channels 2 and 3 support anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 support anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 support anti parallel diode.
> Resistance Error Correction is supported on channels 1/2 and 3/4.
>=20
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-hw_mon-emc=
1812-v11-0-cef809af5c19@microchip.com?part=3D2

