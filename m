Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F642D5C68
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 19:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777662026; cv=none; b=VIts0xfu+dP3zS+xzquNlxNEW9OvDmKpO1CrdcjPZc6as2cky5HE+RYSyI5AKzxBDxRFfOC4k1mRXWukWZMyrfOAiZaRA1qzdjd/eqNiNvBBY2iHR3snBkBekVKNbJKjcoEVAdXF+SqjCAutfVdDi9cTGmcXQhmV5U0/KPS/qx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777662026; c=relaxed/simple;
	bh=q6HAP8/UaRaJbauq+PjYNwhA17z/jS2S2rTIyG8lDpI=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=XUoH6Ysbn50TliDpUOF1A1LbiTuLhelH3BoXWK+Lltn/gk4GUV9uNJm8o/3kDGWtRibDxvnkj1SUL0WplNh8506GeA+v3S5nKYFrM4pgkR+oRAqqu7cWGUj/7CceE/pHtE1MI4OPfAl+9OSrbZNrMl3OEaOG1KejEsh2+h+fDco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=rtfUwDaw; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="rtfUwDaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777662018; x=1778266818;
	i=markus.stockhausen@gmx.de;
	bh=LWl6S+66CGIFrJXE6RRG6TN1sGU0B+16GxAKqwk/nGI=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rtfUwDawMvyTn2tl5cxK6nxLD1EEYiz8+63fGiS0GuCxV7iFuvJQrxMIWFyoIcug
	 ebkW2OUhMac2HKOlfmVKxFZ6Ii8pf+bjeG91WI6CTMxiEzf8vnJ5kyq/XScymMD/l
	 TcvL0KUqzPv+7uLWd0/xfxUug5mocSyb8jhncKr6uMBhUNrTXbxUptoYmQtGHP4IP
	 5VX27jWKzxXZB6CApslziTQQGIKBywtNbINyq+1BPeTJcDqOUkiV6OZbq+n59aTbE
	 0po5q45SGc/vmK4gfuICX+/kHAhKQd9zQPCRsXILcHLp7+Av+Tkfk6aJSYE0K5W9D
	 qcIXR+fAT+EKvoPjZQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0XD2-1vMNAD3Y1c-013kXt; Fri, 01
 May 2026 21:00:17 +0200
From: <markus.stockhausen@gmx.de>
To: "'Guenter Roeck'" <linux@roeck-us.net>,
	<sashiko@lists.linux.dev>
Cc: <linux-hwmon@vger.kernel.org>
References: <20260501120518.3085501-3-markus.stockhausen@gmx.de> <20260501124540.0C11CC2BCB4@smtp.kernel.org> <039601dcd973$bf191230$3d4b3690$@gmx.de> <8776fc88-364e-4ac5-b30c-8a706716d8ff@roeck-us.net>
In-Reply-To: <8776fc88-364e-4ac5-b30c-8a706716d8ff@roeck-us.net>
Subject: AW: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert polarity
Date: Fri, 1 May 2026 21:00:17 +0200
Message-ID: <004101dcd99c$c0ade660$4209b320$@gmx.de>
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
Thread-Index: AQJBhqTliQrjdU864ZtiUq8f1B8xtwFPyIY7Ajaa9PgC7qH24LT8fveQ
Content-Language: de
X-Provags-ID: V03:K1:oFuStwSW15wUpXzCvRVW72MqGwnYylMxiTl6Oh2sSoahxYl1eVx
 smJ1lmWo8q5D5to65SZ6BZTe9f2cVuo63XjkPMB/vZzMEbnV6GXWAdSTIIPlGltBM4hhfVQ
 XEEuH+ktpGjxpK2F4CY+qCp8Z+g1eMWsUgkukPW+0/6DOr6eMXkBjPl0Co3qRqKNEZnBvba
 KDWBtULKVDeiZobwxjXaQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FU6mn4NvZBE=;sZkrbuJamO4BGhuYoldWCfJijA5
 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
 YvtvC0LDI9t69eJvFCQe8gWMWxkWy1jf5qrU=

> Von: Guenter Roeck <groeck7@gmail.com> Im Auftrag von Guenter Roeck
> Gesendet: Freitag, 1. Mai 2026 19:38
> Betreff: Re: AW: [PATCH 2/2] hwmon: (lm75) Support active-high alert =
polarity
> ...
>>> - [High] The active-high alert polarity configuration is completely =
ignored by the hardware because it is not added to the register update =
mask.
>>> - [High] LM75_ALERT_POLARITY_HIGH_16_BIT targets the wrong byte of =
the configuration register.
>>> - [High] Changing the AS6200 default from active-high to active-low =
breaks devicetree backward compatibility.
>>=20
>> unsure if answering to you helps both of us further. So my 2 cents =
only shortly:
>>=20
>> - Issue 1: Existing definitions for tmp1XX devices do not not obey =
"clr_mask is superset of set_mask".
>
> I think you are saying that this is a pre-existing bug and that =
set_mask is effectively
> ignored. Is that a reason not to fix the problem ?
> ...
> 2) Fix lm75_write_config() to add set_mask to clr_mask to ensure
>     that the bits which are supposed to be set are actually set.

I did not expect a bug in the current driver and was baffled by the bots =

response. From your feedback that qualifies a "Fixes" tag. Am I right to =

assume that 6da24a2 ("hwmon: (lm75) Hide register size differences in=20
regmap access functions") is the commit to blame?

Markus

