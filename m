Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794040070;
	b=nhDeKWAHUGgR9Gm5gUOCQqUxkvur/t33H3z3KpnM55EngNVCMU7C77IJnCv4wF9LK+7C
	 23lDi6icdYr1l34i4YHnl5ZPkZqahQFrA6abj42c0KRVRDrQfuutwOydAZzD9wudjfhYx
	 DLl2xvmSfMAB1de/ZyeCHSmBg/U0dhOfUIzzxhdI63AI+YlPgKgrfvmjSQ9QBDN/2V5Ef
	 4npBTTGH0KWe/YTVwpqLZsO3o4MKkYTvZ01z+ZW6dTuwjXcvka5HRbHfvr8lVTA9J18fZ
	 XFVF0wrecOGCIPfEGHQkOFR7Q35ualUSvvT46cJHLogL8RxdhcyV3RBAxHQk+n1XekQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794040070;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=ZQTnReXy1BB4uMEnwdBQTP38mtL4x1nGn5bJn5wkyJs=;
	b=xGrZjUwbFTUa8X8XRH5PtHOM14v9DwOx5gR9Lw7BwyPiltQaK020VHW2dZpGGx4ociuE
	 6y0VXehqirPRBZtp1BIOnV7Dt95ZK5PoqEjtksgVfmFtcuzZwIaKiqd7eOHyBaM8AaSKW
	 QwFZlfaozNQgxzX9wWiQx7nauKuVG61lts3MiCqCQp58k1NCIPPdgh9TNfCfRYrlAFhru
	 C7zDVA/uXRbTpVuQMbgEO3UMcG6ymp6OTabgAHkAj1gruR4SH074TLXYtrAswkw2Vm/sG
	 gic4+6u3zaviJQ95mpzO7soJvhWpufiyXjy0KR74en5KtHgtW9m1osXaj7PP/xTca6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=ZB4oTaYO;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242C0606A326;
	Sat,  7 Nov 2026 08:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 242C0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=ZB4oTaYO
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jM8LV0JFNzMlLN;
	Sat, 07 Nov 2026 09:27:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794040066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQTnReXy1BB4uMEnwdBQTP38mtL4x1nGn5bJn5wkyJs=;
	b=ZB4oTaYOOPy3jvJhdHPU7HFbW/Kqf3fShS95w9/1NNPrHeWyvuH9Nb3LeKpRd+TIZik9kl
	N/pwlb1LhMP3WnPnCojK1+iY/xJ0fX6llyXC+mgtgdZZYOmjiWBhBCBIwHaYCKSCgpgAR6
	6eJLBxzlSEZcQ0cihZwSJHX5ikoUkdAuw03kProkOeQWvfAanLVAiYVn9PAUCC+nxxLyNs
	EuUYHw2J7fRG+8Ls7RCHiBJDuGlUkL2prd9dRMsevr3nQkKG4lW2JRldRodXKoM6N9QXxl
	fM6wOlfpyfBtLSA691g386POCZhSNrAReU4EIh+cEDS8FwCmBlO0Lli+squKPg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add driver for MSI Mystic Light controller voltage sensors
Date: Sat,  7 Nov 2026 09:27:28 +0100
Message-ID: <20261107082728.8035-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <db51c24b-4b41-407b-a20a-b87ed7c0dbaa@roeck-us.net>
References: <20261106184357.27763-1-tomasz@bojanowski.me> <db51c24b-4b41-407b-a20a-b87ed7c0dbaa@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4jM8LV0JFNzMlLN

Your reply did not reach my inbox, because the spam filtering at my mail
provider was set too strictly. I have fixed that, and I read your review
on lore.

Thanks for the review, and for trying the driver on your boards.

On 11/6/26 16:36, Guenter Roeck wrote:
> Using the USB serial number to detect the device seems fragile. If the
> USB vendor/product ID can not be used for some reason, it might make
> more sense to implement a DMI match.

Agreed. v2 identifies the board by DMI only and no longer looks at the
serial number. The driver is only registered on supported boards.

> This will require additional per-board data. On MAG B650M
> MORTAR WIFI (MS-7D76), the USB IDs are 1462:7d76, and
> hid_hw_raw_request() with the parameters below returns
> a length of 0 bytes. On MAG B650 TOMAHAWK WIFI (MS-7D75),
> the USB device ID is 1462:7d75, and on MAG B550M MORTAR
> (MS-7C94) it is 1462:7c94.
>
> That makes me wonder if the parameters can be associated
> with USB IDs.

On these older boards the controller uses the board code as its
product ID (1462:7dxx, 1462:7cxx). As far as I can tell from the vendor
software, the sensors of these controllers are read with a different
request, not with feature report 0xf0, which would be consistent with
the 0 byte reply. I have not verified this on hardware.

On the 800-series boards the controller uses a common ID, 0db0:0076.
OpenRGB lists more than 30 X870, B850, B840 and Z890 boards behind this
ID and selects its per-board LED configuration by the DMI board name.
The vendor software also handles these boards with one class and tells
them apart by the USB serial number. So the USB ID does not identify
the board there, which is why v2 uses DMI.

For now the driver only covers the 800-series controller on the MAG
B850M MORTAR WIFI (MS-7E61), which is the board I can test on.

v2 also addresses the issues reported by Sashiko and your other
comments: it reads and validates the report in probe, fails probe if
that does not work, only exposes the rails that return a reading, and
no longer returns -ENODATA. I will send it as a new thread.

Thanks,
Tomasz
