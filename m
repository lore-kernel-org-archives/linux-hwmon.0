Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066151;
	b=oFxF6QTN7DeCAZGasg+t4p6lTYfX/Z1U1WsYWJyXRRBE3Z7LXgR0Bc6NTaVdArWgKa4V
	 jAF9q1heHY7Q8zdf7TLpLiR6en3949X1QP9cLSJW8SSDMxuHL8OvJnJzyvWG8zTn1qP78
	 zpROFbyc9X3SWiSX/0uD/JYJEWh5QpshAbg03wmkQtMM4RqJG7SJ2guYRXDGAlgu44E6p
	 47dXZXrkRuDB4kT/GX3SJHpE1hs4pYSpEZGUg1eb5G/aoqMVsmtzz/wgwMk0eHXohMRUO
	 g7KcqNlZfa/zqk30TSyoQIxAhswwXtIwLkPoe68pM8fglg8mgZbn1vdHL3OWEIfeSLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066151;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=no5aW8Fmoos1dOAAdLJ0Tkk2u4hUBYK6yZlGmp7fre4=;
	b=SnflNXLUcIJJzDLA+G/7FefvoeNmQFVcKtrzlqyEsAMfpWqOgy2EAJ03W42qjjyE/w1t
	 dNU5qWwrJQjNOCz7mhLXE8xfiicZmqtSF6pXUUWblMBWapCsnS/KeWBT8DsA5TpmfwSsy
	 Ua27oDloo8bjNhpamgfbI1hYKCZUpuMxn4rEyNGHvPLsV0kVhA/NbtdKF0R0xg7irdacA
	 WIKBayeQ2dh6aKqaZxqccP5V0wo71CviHIeMQGsCpa2WI6LwEizh4AL7TDm5Q9qQGrfu9
	 WRSurLz20ydW8TDhHaq0EfT82cL5VCDrgeJCjL4fCZn8rVFN6HIg3RynVyR8M4I43fQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=gtD9gNiS;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206AE606A326;
	Sat,  7 Nov 2026 15:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 206AE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=gtD9gNiS
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jML031zY1zMkxw;
	Sat, 07 Nov 2026 16:42:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794066147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no5aW8Fmoos1dOAAdLJ0Tkk2u4hUBYK6yZlGmp7fre4=;
	b=gtD9gNiSaQ4vlqE9zAktDSYd+XAhOvKwmh6TPIyasLWDEKotvHCfsYbrlemVChPqqdWBDj
	TgXORTfAOZ5E/aFs4BLsHo5ffm+oqhnBXJj+jRMqRwxr+80rgoIOicMrkwysUj9lcGc3+e
	HuRsilFpXZF7+u6V2zCZAf8kgmkqtZw9U4307wUGKqRxrZQJ+kw+seaOZ1CzENYznLDGHL
	B0eqSX/LtLlTxpWQLD211wE0QY/RdfLchisLU0GlqSdT1BwtnKj+4l08EsiW28SDN/jggg
	Ww0R6HqiGJGJ44jfeIIAVaZliz26v8UPBJFTvHyPvf7tJ5tECzoImSwy8Lkhag==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add driver for MSI Mystic Light controller voltage sensors
Date: Sat,  7 Nov 2026 16:42:25 +0100
Message-ID: <20261107154225.325003-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <9aff5480-3be5-42d5-b0c1-b3d7b4de8e9a@roeck-us.net>
References: <20261106184357.27763-1-tomasz@bojanowski.me> <db51c24b-4b41-407b-a20a-b87ed7c0dbaa@roeck-us.net> <20261107082728.8035-1-tomasz@bojanowski.me> <9aff5480-3be5-42d5-b0c1-b3d7b4de8e9a@roeck-us.net>
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
X-Rspamd-Queue-Id: 4jML031zY1zMkxw

On 11/7/26 06:57, Guenter Roeck wrote:
> I have the ones mentioned above, so I could test there if you want to
> add support for it.

Thanks for the offer. I looked at how the vendor software handles
these boards. There, the controller has its own USB ID (1462:7c94,
1462:7d75, 1462:7d76), and report 0xF0 is never used, which matches
the empty response you saw. Instead, about once a second, it writes
a 64-byte output report

  FA A0 00 00 00 00 00 00 00 01 FC 00 ... 00

and reads input reports until byte 2 is 0x01. The values are
little-endian u16 in mV:

  MS-7D75, MS-7D76: VDD MISC (bytes 11-12), CPU 1P8 (13-14),
                    CHIP Core (15-16)
  MS-7C94:          CPU VDDP (11-12), PROM Core (13-14)

This is from static analysis only.

Note that output report 0x01 with byte 1 set to 0xA0 switches the
controller to its bootloader (0416:3f00). It differs from the sensor
request only in the report ID, so the driver would only ever send
this one fixed request.

As a first step, could you send me the USB and HID report descriptors
of the three controllers? After that, I can send a small test program
for hidraw. Support for these boards would be a separate patch on top
of this driver.

Thanks,
Tomasz
