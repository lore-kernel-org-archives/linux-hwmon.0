Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD4F2D94BA
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777644410; cv=none; b=r+EjfWbCCKgALNd2jo/b5xoDjLdKN3moznRVUxkFCUGpQI97zrnWiNGoQ/N3VD4FD2FHOEABOHI5qYefF2mFXXlIsZiM+bESjWjOf739qwLZ9a8Hfr7UbFuHfIprmtJmhU7AM6EISSuf1ZT+M5TMzkV+VrVVThw9IlaY+H6EIkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777644410; c=relaxed/simple;
	bh=TCo+q2RU9TTloFl30oWt815/zfKYEj7k/ZRECTMJhK8=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=T/X6y6XdwHIb7mslXO0RrIXZ3uig7dAmaNpsRRaSanCzBiW8LDsnrrvwfOG/sCtiEk4+ERYaiUPhJ5sjs70cO3c7vUby3WR6XxP1JCdB9fuq1KLhQeOx92LKjmpL8jOQkzGBHzqnplkVKup9GtCo9Y+6cC4QxhXzc7hRiTwlIBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=JUFnn7Jw; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="JUFnn7Jw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777644406; x=1778249206;
	i=markus.stockhausen@gmx.de;
	bh=TCo+q2RU9TTloFl30oWt815/zfKYEj7k/ZRECTMJhK8=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JUFnn7JwTbc3EAdHvs3CwXqsdX9ky1xHCnMRZ+KLpTTDdE3tsFPgy73fT//UnUwc
	 OeyTl5h/qsGQgnJHVBUgf8LsgjR/dDSFBYL7I+Yoe+eaZZzUGmXxNut9lGCloYW5C
	 hUYHyX/MgXbFT/gdoE/BkWZ2tozX2yesoeIGLOEJHThHDDe8wRkhvzTmIs6nc2hjS
	 QIsY7uAMkI91Me7S6zoBa+ONonxfbrppGYeuaOahctMzh3BMsK5Bipbtk5eroHHRl
	 GMPGXV+DYzPI61/Wq+HILXnjmaHf+PN+IjR70tbQeYEbVOwXNJ3RVWyzirGmafImC
	 43muKQ2/hKq9a8YLVw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MXGr8-1vph282PXi-00LGJI; Fri, 01
 May 2026 16:06:46 +0200
From: <markus.stockhausen@gmx.de>
To: <sashiko@lists.linux.dev>
Cc: <linux-hwmon@vger.kernel.org>
References: <20260501120518.3085501-3-markus.stockhausen@gmx.de> <20260501124540.0C11CC2BCB4@smtp.kernel.org>
In-Reply-To: <20260501124540.0C11CC2BCB4@smtp.kernel.org>
Subject: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
Date: Fri, 1 May 2026 16:06:46 +0200
Message-ID: <039601dcd973$bf191230$3d4b3690$@gmx.de>
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
Thread-Index: AQJBhqTliQrjdU864ZtiUq8f1B8xtwFPyIY7tSVWLCA=
Content-Language: de
X-Provags-ID: V03:K1:sq5iu7uDXOAHIUJjfq4aDjyevCnh/0+29CGQpLkwhR/CxXeXXTq
 qlAcnF34AwLqjtUcVaiC0ibYOwofAmTXgBYDhUtv6xcbuviLLb4KcazOZVNC9RRkRr5X6fd
 eSnbHL65J4Fg/QRj1PEs3Wx6xpzmu6fHagQQPU6i9v5PWmAtpvc5/oTMsdjuIZuM0CrpxLR
 uC/0SX3v/08/5zoZM9d4g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jT40+oXmHeY=;WN3G6FelvRKf03JycPLEStilmpn
 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
 WRvfVeNQrGhMjjQ==

Hi bot,

> Von: sashiko-bot@kernel.org <sashiko-bot@kernel.org>=20
> Gesendet: Freitag, 1. Mai 2026 14:46
> An: Markus Stockhausen <markus.stockhausen@gmx.de>
> Cc: linux-hwmon@vger.kernel.org
> Betreff: Re: [PATCH 2/2] hwmon: (lm75) Support active-high alert =
polarity
>
> Thank you for your contribution! Sashiko AI review found 3 potential =
issue(s) to consider:
> - [High] The active-high alert polarity configuration is completely =
ignored by the hardware because it is not added to the register update =
mask.
> - [High] LM75_ALERT_POLARITY_HIGH_16_BIT targets the wrong byte of the =
configuration register.
> - [High] Changing the AS6200 default from active-high to active-low =
breaks devicetree backward compatibility.

unsure if answering to you helps both of us further. So my 2 cents only =
shortly:

- Issue 1: Existing definitions for tmp1XX devices do not not obey =
"clr_mask is superset of set_mask".
- Issue 2: AS6200 datasheet states BIT(10) is polarity. Thus .set_mask =
=3D 0x94C0 can only align one way.
- Issue 3: Please advise.=20

Best regards.

Markus


