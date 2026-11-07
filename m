Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794088065;
	b=WS8HAkkFnNccEqWT1mOAe1utu1lsWTF9fbNoaV3JAX8obGHmtWjIHmWGwDZ9/DVBM5gJ
	 FxywAwWDXLOjw1+8U0a2js5IeZoTP0srRJmifdRScva6kBeOsQpQChG+2X0rNmBUoqR3n
	 wjeuIy/XKqWgPr9FipWhTByV2BjX41sw2EokvF2eyMK+yCZzORxde0QpIbchYfLG3lJz/
	 8yIczKx4XqIjOb3Ytw8gZ0c3ICQcuDijAeewPJA/zGnIb8Lv03xkUSdHh5Ji2W/lB2kzf
	 tdnymLaxeOtQSCuBf5/CpwzOCG1wvaAAP0XOE1gWBMPrSdV7IwgHNSZUxnmW0/DBIzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794088065;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=i5FK2w6G5F6gNXO/C12RD0Y/02t5FF/ZVmylJqCrDnk=;
	b=emrq7n1MMaL+QxpHAgujPl9k6aQwpsyb6hT/UXgG1GYjQirKlAIXicIw5zpfvI0Q8HM8
	 hfZcYjJdH5DmuXKxpwykffw/C35OHDcOJUSfPFUGHzBEQOHxV2ODLpu75/FCY+J9iNwpi
	 YR66sLlS448LoW1fboos5OgnA5nE2Hy/OclKpn4A6CSvRy1cNbk9DuxGUVpvWTD4h9bxU
	 seMnuQcOnE4CJKuLDM9QmlCpfoJ4YPiqBE93ovf6RtU8aTEl+HwCVFe8lg9efEta4Iaf8
	 ecEmDTxe8Hdw+3FO2MduVWH5CIs95TgkzQwyd4KsFZ8XLyxS4UJFRbtcYpuljMD8blQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=U1pPkP0J;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02320606A326;
	Sat,  7 Nov 2026 21:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02320606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=U1pPkP0J
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jMV5S4952zKnDk;
	Sat, 07 Nov 2026 22:47:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794088060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i5FK2w6G5F6gNXO/C12RD0Y/02t5FF/ZVmylJqCrDnk=;
	b=U1pPkP0JmE23VwaSgOoiAazLuSd2gImCbJsgPJ4LG79w43mdYhEfJrpKRyGxVO/XGKE6Hw
	xBi5fjLBF7X1VcEgfNKXuFVao0606C/fo8lccqHZ5PzQR32lDk3vsyupFOWXICTckxlDre
	BeiZKU+XuKFhuUrRBMX2iQap7iqw3TniGcE7kItCeRJV+NY7hpMqNl2bw6YwgcBCs4vnHa
	uJnGKOhGrw3S3S5O9v5++y88+juyd1+Yl+5yDg7tDJ61VA6rKyjCwEv8L7s7/HVHAQfHyi
	luIxYzHwMCfbuf8kjgzDmjO5Z72SO+TzMb0yPV4vauCL23sVCmJs39jn6/6JEA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller voltage sensors
Date: Sat,  7 Nov 2026 22:47:38 +0100
Message-ID: <20261107214738.439967-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <81c1e042-b06c-4a13-9251-a967532e21cd@roeck-us.net>
References: <20261107082821.8257-1-tomasz@bojanowski.me> <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net> <20261107161249.336512-1-tomasz@bojanowski.me> <5e99fd86-d934-49c1-a867-02cc61ab1ecf@roeck-us.net> <20261107181518.385136-1-tomasz@bojanowski.me> <e79d3e26-4ca5-4ca4-9159-427a5a6f1129@roeck-us.net> <20261107203300.427273-1-tomasz@bojanowski.me> <81c1e042-b06c-4a13-9251-a967532e21cd@roeck-us.net>
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
X-Rspamd-Queue-Id: 4jMV5S4952zKnDk

Hi Guenter,

On 11/7/26 13:06, Guenter Roeck wrote:
> Either case, do you have evidence that this is even needed in the
> first place ?

No. On the MS-7E61 it is not needed: the controller does not support
remote wakeup, and while hid_hw_open() holds the device open, it does
not autosuspend (runtime_status stayed active with power/control set
to auto). I added it in v2 only as a precaution, in case the device
autosuspends while the feature report is requested, without evidence
that this can happen. I think it can be dropped.

> That makes me wonder if the vendor software is buggy. I have
> two of those boards, and they both show similar values.

My follow-up crossed with your mail: the vendor software only lists
CPU VDDP on the MS-7C94 with an APU. Do your boards have CPUs without
integrated graphics?

Thanks,
Tomasz
