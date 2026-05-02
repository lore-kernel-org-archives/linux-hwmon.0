Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E078346E46
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 17:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777743444; cv=none; b=qMpMtRprW1Ct8WZj5fbauMy5/DpTjTj49D1x0hKlv2lCOi14xIjJXBZnZccmAQ4AmFgnqsL4Prn2LawLEakfvNx+HkW5VW1X5X6qAQBhs253ttQ5z9DR26l9CMgEay7OLADVFkJlmLflOJbiCeaVuONDUQ+SMXy3xmBRj0viXoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777743444; c=relaxed/simple;
	bh=S97PJuW4AeI9sEviAsgKjBA/u4z18OKl78mL33nFV84=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=cb7Ao3biUE+Aja4r+7bez/czRnXFJLp8lKL/lYeUGB1AS4eclrfTKTK1qqvHyrHHKarzQyQOEenoJ9XXZb1cwJrIR+Fn+0p3ALM2MGcyfcA3yQY7XQnHKxt3thscY5hCmxn17vaCYuYrktlt75L6kr3YYKaMO5FSqi0Uqh07sws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=IpKBegX9; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="IpKBegX9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777743441; x=1778348241;
	i=markus.stockhausen@gmx.de;
	bh=46hHTtAUZOiqhdx8fSNvjI6YW03SOO5fgQr1C5dL8F0=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IpKBegX9Tf+iBcfoLD+5m7wPwXflqiVVahsWmS1tZAzLvhpwvAHIBs99NrTO218x
	 sifWeaLZOGelKbXmd63Qkj+TotCSRmsTEQW9XxfiXAxrzY2D6tGeqf/q8xPPKTyzL
	 V7g+osJrnKgxXBrr4U67Oxr7pxh/V3cW2xg7okQHNgGobfTVjNJQK8aNR5jV2FUHK
	 W94BQHR3EbmrxxbRBbA+O2pUpq7dtswbkZ3zK3+Iy/NoyUuyprE0IpuARB9rWNWkR
	 WbrillWzL3kjSO0jE+fwnaYLZy3jvZkItNT93w0DhQiLh23wi6FiL9yzLH85wXW2P
	 FEuEsToTZGbH4WgQIQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MplXz-1vYIcH3HMz-00grG7; Sat, 02
 May 2026 19:37:20 +0200
From: <markus.stockhausen@gmx.de>
To: <linux@roeck-us.net>
Cc: <linux-hwmon@vger.kernel.org>
References: <20260501120518.3085501-2-markus.stockhausen@gmx.de> <20260501122419.8B1A3C2BCB4@smtp.kernel.org>
In-Reply-To: <20260501122419.8B1A3C2BCB4@smtp.kernel.org>
Subject: AW: [PATCH 1/2] dt-bindings: hwmon: lm75: Add lm75,alert-polarity-active-high property
Date: Sat, 2 May 2026 19:37:19 +0200
Message-ID: <007701dcda5a$542a1c70$fc7e5550$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMMX7il6vSnmZ2F5HsbH7LybFQ9SgKvScFrs4Z54CA=
Content-Language: de
X-Provags-ID: V03:K1:2yYoY9rgs5m0pmFPWoi1ZpTnzKSXe5zXkKeegGgzh6uSdEjDLo/
 MF58yD91aEkpHjIZsNiy0tVYu8pRJPeK7ic/KeiajUWTZ2LVEPOZ5XyquvmdwCIahy1rBL3
 U9hQNvR7EqFqmCw7g30m3I1F10J6BSK9VwoFcZI/ooNzalywlZP94Zz9/D81D6CpIfwCVSD
 DpqeI6DgQxM6D0aqo8Q+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AG5fOsrLATs=;pnWWAO3FYOtECKVEpPs2qLb76tK
 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

> Von: sashiko-bot@kernel.org <sashiko-bot@kernel.org>=20
> Gesendet: Freitag, 1. Mai 2026 14:24
> An: Markus Stockhausen <markus.stockhausen@gmx.de>
> Cc: linux-hwmon@vger.kernel.org
> Betreff: Re: [PATCH 1/2] dt-bindings: hwmon: lm75: Add =
lm75,alert-polarity-active-high property
> ...
> > +  lm75,alert-polarity-active-high:
>=20
> Does this property use an unregistered vendor prefix?

Coming back to this before resending the "real" series ...

Looking around I'm pretty sure that "alert-polarity-active-high" should =
be ok.=20
But what prefix do you prefer for that property?

Best regards.

Markus

