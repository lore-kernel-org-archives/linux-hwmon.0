Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794083593;
	b=M/lKANa6Cb9fhwX9yfuVX9UDr7uc6AQmUALOBzy2kIkMd5Bpdx6Kja1wE1W3V/mqp4kK
	 xkgAJ8+oil36KdQ/1yywCpXKfv3QweQFy2QwxTMmfr3CYtDBwfTxAvAY+TM3UuDJRhKqh
	 0ngEvYVCGY0Z1ASam/W953MUmA/qsodq9zWQKwYTTbGDRQZUe3nEB5lmCauD9Q/6Bta+h
	 sALQYpUvDUr1zKf8nsW0V5SchIlud5lziRGmqyvBzBG1JJBsI1SsreBZAZC3tbuJfXxJz
	 LOZyBD7y3hqVATKQI+6yzbUnOOEqGWmE4X1wz/ol2oI7ZaOvyckaW+t2NxwAWUogcug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794083593;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=dq2J374riM26SV5joazzzkZmilePIOzlYnlPT9M22lY=;
	b=slEtspykCJ0F+bt4vo3NsdMMiZpL1TB/PC6z8UjQYlxhd7oq+N9YT9gmT3wVjnnVeroe
	 uXim3p0Q32XSHi+VIxPgOzlwFTtKfZ4D/VkHKkLjzUgW1Jb+OKJ94mpYrizWVuRYHDZ7E
	 XsLvED78d8Tc2kK2xSdzbJHSoS5Pr5cwnxg3y8oz9DdszqFBEg+hEKcAvFMfSUIGYJ1h4
	 UIyy9xS0VdnomRxjD85A42ZZR6bDwFBCchyZ3FMT0YLydcSu5SB/eJdCReK1QJOSFUHxi
	 SqwCW6HBvwJFej4W3An3x+3VyJGEqezZXQq2MuPeyXcCFG5/3pCdoZSx3Ogk+B2X99Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=FVVtbENR;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C204C606A326;
	Sat,  7 Nov 2026 20:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C204C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=FVVtbENR
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jMSRL4SxRzKp61;
	Sat, 07 Nov 2026 21:33:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794083582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dq2J374riM26SV5joazzzkZmilePIOzlYnlPT9M22lY=;
	b=FVVtbENRg0UROP/9wz2AIAJ/Ynm/3/oBAOSDXKBE9U8cr1BlIzM/NkjTtjpNMN/JSLuGgc
	j+cCtdoWe973tLQZ2GHN5tBHlDxhf+HWrsHPPRG5etQXJRkTkhPOQ2Vj0tcdXvGsV4oxhW
	a3AHxzDXMg8vCJ+vDNZ6dOMM4puN191+KgMMbMs9cpD1dpo3IN4/FG3TddasbsfMOj2MM+
	dNX3qlBVilqIUbAcnDCr0mPvpSyVwEqAfFuXfn/Ik3bBrhxlb35UPXj7sI0Z4482e3uWtf
	Gm5hdJFR/EviKASOql7PgjyjbexByq6Wp4dnjuJe1rujZlIu4h7nfowaW+Q9bQ==
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
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller voltage sensors
Date: Sat,  7 Nov 2026 21:33:00 +0100
Message-ID: <20261107203300.427273-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <e79d3e26-4ca5-4ca4-9159-427a5a6f1129@roeck-us.net>
References: <20261107082821.8257-1-tomasz@bojanowski.me> <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net> <20261107161249.336512-1-tomasz@bojanowski.me> <5e99fd86-d934-49c1-a867-02cc61ab1ecf@roeck-us.net> <20261107181518.385136-1-tomasz@bojanowski.me> <e79d3e26-4ca5-4ca4-9159-427a5a6f1129@roeck-us.net>
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
X-Rspamd-Queue-Id: 4jMSRL4SxRzKp61

Hi Guenter,

On 11/7/26 11:40, Guenter Roeck wrote:
> Please let me know if the code still works for you.

It does. With commit 64e4888, the MS-7E61 reads the same as with v2
(CPU 1P8 1.79 V, CHIP Core 1.04 V, VDD MISC 1.10 V).

> Offset 11 does not seem to show a valid voltage. On the other side,
> offset 15 would reflect a value that at least makes sense.

The vendor software reads CPU VDDP from offset 11 on the MS-7C94 and
does not use offset 15. It would show the same 0.002 V, so I cannot
tell what offset 15 is.

One small thing: if the read fails, msi_ml_read_report() returns
without hid_hw_power(..., PM_HINT_NORMAL).

Thanks,
Tomasz
