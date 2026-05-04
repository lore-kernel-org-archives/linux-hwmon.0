Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B13379980
	for <linux-hwmon@vger.kernel.org>; Mon,  4 May 2026 15:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777907030; cv=none; b=d1CmrJJXYtnsz7ty3XE+jxOfDaoFxhcg35PGGzSLm2GTVu3N+H16xCJIiGDvoaybzhYTNxceD0DvoS9roXu3XIjtJzm7JZ1B1qDQiS6nIGdbrqujOIDMTHoGHsb9kviGxm/Qawt3t6MzUblvOnMjTW0TasEdoRsiWVulkZD/Eiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777907030; c=relaxed/simple;
	bh=PrLw8H0/JQih1Ap1FpnR2qgyQtUyt+dtAhpY2qUh+TQ=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=VELkhMvPCd+W0RoM6tKT1OHRF7TwOCQPsW4Xwjy1beIL6pJj11RyhjPzWGtrY9g7M7e6Ysi/ds4duJAVPKpq9/hYYINapM6ARmPTI9Xh/cO7enVDSKSFvXRLM3e32ALbxhmpJkU9fq6IQ8mX418q28JiTpZKZ6ROy8S8YruzxhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=ihBujNW6; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="ihBujNW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777907027; x=1778511827;
	i=markus.stockhausen@gmx.de;
	bh=9k37Guw/ixmAL37x76BGRqPT3BmNSfDzMQVV5gWgCTI=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ihBujNW68k8YthFv2DPR8O8gHHb8ZPkw7dc3VsvfeH69V881wztiNpN7Q3zeqOfP
	 UrVEr7SCMcBsiblyS5RyEe7SyDh5WHyy6tU9szfC/w5xYtE+Y6hRFtzEUFDn3lhNU
	 DYdF1PI6f60YQ/dDtXqN5yQJw3GY59imvaiHrtmqGd8h2ii6arWIofWkvvMST00xz
	 x8AhiuKDN7VKlIYVsM2O3vVIwa0/JqHUZTe+wTEZrHUNpKwIbu1UViEwK/6bI436A
	 IbC5NdUxXv7TK8ePjfcHnQTm3UDx+t+6PJvmmDmfSoJCAPE6DMfOsS/3S5rHolBpG
	 N0gg+BQyqhnSTq7A3A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1vSEFr3QdB-0185Wo; Mon, 04
 May 2026 17:03:46 +0200
From: <markus.stockhausen@gmx.de>
To: "'Guenter Roeck'" <linux@roeck-us.net>
Cc: <linux-hwmon@vger.kernel.org>,
	<sashiko@lists.linux.dev>
References: <20260502094524.3358193-2-markus.stockhausen@gmx.de> <20260502101009.DFDF8C19425@smtp.kernel.org> <8928c046-69fa-4578-9a7d-87b98fc7c5a2@roeck-us.net>
In-Reply-To: <8928c046-69fa-4578-9a7d-87b98fc7c5a2@roeck-us.net>
Subject: AW: [PATCH 1/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
Date: Mon, 4 May 2026 17:03:45 +0200
Message-ID: <003b01dcdbd7$34d247c0$9e76d740$@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJjOC1/JYaNtLrnaUIsQhbvuKJY5QG3qj3HAiMlboq00mN1oA==
Content-Language: de
X-Provags-ID: V03:K1:sfJpsTGpsi1kG9h5cldmOU/hvNoVVLCnsoRXWOAWdXyJZqeX2qU
 1y4mSXokhk1GSCZAFTd54NmHZBYaoevq0LpypHB6GMIUA/6HKI2ftCruu5QNM3urovzumJD
 u2UJA5s+ob+goQdLYAcTPGJG9O868N7ENEVcA/NSWWy7M43c8Jr3BdChyYtu1OETy/KLia0
 et9PRqjoXP86NWowFyjxQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ULaWbNcYyYA=;cnbNqjA7nltmPuj+sbR1eG5w4nA
 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

> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> Gesendet: Samstag, 2. Mai 2026 16:45
> An: sashiko@lists.linux.dev; Markus Stockhausen =
<markus.stockhausen@gmx.de>
> Cc: linux-hwmon@vger.kernel.org
> Betreff: Re: [PATCH 1/2] hwmon: (lm75) Fix AS6200 setup and alarm =
handling
>=20
> ...
> Either case, I ended up ordering an evaluation board for as6200 and =
samples
> for TMP112, so we'll see how this works for real once I get that.

Looking at this again that is a good idea. device_params says 8 bit =
sampling (aka=20
2 consecutive bits =3D 1) is in bits 6/7

	[as6200] =3D {
		.config_reg_16bits =3D true,
		.set_mask =3D 0x10C0,	/* 8 sample/s, 4 CF */

	[tmp112] =3D {
		.config_reg_16bits =3D true,
		.set_mask =3D 0x60C0,	/* 12-bit mode, 8 samples / second */

But lm75_update_interval() uses bits 14/15.

	case tmp112:
	case as6200:
		err =3D regmap_update_bits(data->regmap, LM75_REG_CONF,
					 0xc000, (3 - index) << 14);

This confuses me and maybe the bot ...

Markus

