Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=143.244.207.79
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506340;
	b=muCgsEwjVuWSjpi/gTPiIOZh3QPwXb9UjjODjpU4mgJ/dSYcU5dvKnNfZJHvE5rIEjQN
	 iZ8E5OP+/bs6ULtiY6YEWgZRLEINhChJ2XmjdLXWdXAb6MO41VE7B91L0YmpbYa5EUz/Y
	 dcaBTgv7z7ZiFEGvchRs8inesz9xz3vDOZLycb4gF86+eP8lk5coLRgYAougw9XTIvecr
	 q2M6+kWkYUJW5OEAvOENeunxvVEDwQMNzMWSWwiEl03USSVLHJJmFY3zDfMz/FlXmb9jI
	 qD8kXFPg8X0F1G1qPiH7P23twG7Ivfxv0ieZCF2UFWXPbn1MVPq7OSwYantVC5YbfMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506340;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Date:Content-Type:Content-Transfer-Encoding;
	bh=aYF/HEUDm76gfL+wC4hXPsZI2t2dHNPWYywmlerUfvg=;
	b=AxaL0p3By7cOv2QgJGBZ58y5J/TcjrSNf94XPEfc8FiRtJD9Wq/kIjgOXxORBajYj5HZ
	 Ur7/xv2N0RafWgB2eJndrGGiyetUBZAeNiEiM5e72JgMl06ED1S7rTGmRdNAhLFCd6mfc
	 r4udgvAGGyfCO7K5Scp+oZLmCo6t2rH8eRPZ65tVBiaDDbS+Xg025wRMj+wFlMQRM0yE3
	 5ptBcPC0XeOuZ8by8NGc0YTh6udinQ7cTjRs5bVIzb9KVFOileXgN/jreoFh/Ujlkfo9W
	 Qqrkxs2tBxq+jhCoJcF1xr/CzyCY1ysjz+XbqSn5ynm0+Zz3+4F22dcmC1ocyBuAs0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=detoutefacon.com;
	spf=pass smtp.mailfrom=detoutefacon.com;
	dkim=pass header.d=detoutefacon.com header.i=@detoutefacon.com header.a=rsa-sha256 header.s=mail header.b=SqmrnMAM;
	arc=none smtp.remote-ip=143.244.207.79
Received: from hst.foliovision.net (hst.foliovision.net [143.244.207.79])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F495606A327
	for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2026 17:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F495606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=detoutefacon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=detoutefacon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=detoutefacon.com header.i=@detoutefacon.com header.a=rsa-sha256 header.s=mail header.b=SqmrnMAM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=detoutefacon.com; s=mail; h=Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Message-ID:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aYF/HEUDm76gfL+wC4hXPsZI2t2dHNPWYywmlerUfvg=; b=SqmrnMAMFbdmK0RJTIOYcJTwL2
	RO1GQkkRdjlxEBzEYBrUobfMWvOt6ES0M3HB+rS6hpqinbvdM7RaDoJeB+p7AMEGZnaERxITHDXMu
	7b0ptSYdjlmaCf4ny4nBGf0lmwRr5F59jyFRi6yyZ8NSmjGmLbI0lzD9JWle7/SwShSa0PEwhva7Y
	h06iIxPC/MT7TO17g2pKxsLmWu7kk0a8NDqqrRsff/ZNXLburlstiZKo54RPMEpHSHeqTeSb+8XbU
	gt4KyntVqKbdxUoGiNQosUKbdpJqD9eJ3ZqxMDwxqIA9A7Lk0ngbJxIsVI1gTLndd3J4sc/aW3gWg
	FOAz0vEw==;
Received: from proxy.recruitment.sk ([82.119.109.194] helo=[127.0.0.1])
	by hst.foliovision.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.97)
	(envelope-from <alec@detoutefacon.com>)
	id 1xRZ4c-00000005lGq-2tiG;
	Thu, 12 Nov 2026 17:58:58 +0000
From: Alec <alec@detoutefacon.com>
To: linux-hwmon@vger.kernel.org
Cc: rydberg@bitmath.org, linux@roeck-us.net
Subject: applesmc: include Mac Pro 5,1 Power Draw in hwmon reports
Message-ID: <hylki-k6w7PeynXP0LYj6yqn@detoutefacon.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Thu, 12 Nov 2026 17:58:58 +0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

This is my first mail to the list. I have a Mac Pro that began as a 4,1 and=
 has a 5,1 firmware. It runs Fedora 44. The applesmc driver reports the fan=
s and the temperatures. The same controller also has current and voltage ke=
ys, and the driver does not publish them, so nothing on the system can show=
 how much power the machine is using.

I was interested in this number 1. to see how (in)efficient my Silver Tower=
 is and 2. to gauge how long it would run on an UPS.

When running on macOS, I monitored power via iStats Menu which does give th=
is information. It turns out the power readings are available in SMC which =
hwmon already reads for temperature and fans.

Temperatures are collected in applesmc_init_index() from the sp78 keys betw=
een T and U. Fans are counted just above that. Both are published from appl=
esmc_init() with hwmon_device_register_with_info(). The current and voltage=
 keys are already in that key cache. The Apple Silicon SMC hwmon driver alr=
eady exposes voltage, current and power for its own controller.

The reading we are missing for power is not too hard to get. The 12 V outpu=
t. Key Ip0C is 10.5 A, type sp78, and Vp0C is 12.125 V, type sp78. Multipli=
ed, that is about 127 W. It is the supply=E2=80=99s whole 12 V rail. The 5 =
V pair, IH5Z and VH5Z, is only the drive bay: 0.19 A at 4.94 V. The 3.3 V k=
ey, VS8C, reads 3.30 V and has no current key beside it. The revision bytes=
 are 01 39 0f, which is 1.39f15. At boot the driver logged key=3D404 fan=3D=
5 temp=3D75. The eight old 4,1 branch currents, Ip1M through Ip8M, are stil=
l present.

I have not written a patch. If you would like the sp78 and sp87 current and=
 voltage keys registered as hwmon channels, with one power channel for Ip0C=
 times Vp0C, I will have a go. I could not find an existing thread about th=
is.

The numbers are from my own Apple Inc. MacPro5,1 with firmware 144.0.0.0.0 =
with a single Intel=C2=AE Xeon=C2=AE X5690 and a Radeon RX500 running Fedor=
a Linux 44 (Workstation Edition: Linux 7.2.15-200.fc44.x86_64). Grok helped=
 me isolate the correct sensor keys, the initiative and the reasoning are m=
ine.

Thanks, Alec

--
 Alec Kinnear

Creative Director
Foliovision

