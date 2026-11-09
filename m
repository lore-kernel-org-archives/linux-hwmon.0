Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794250423;
	b=Oos5BhibdnC3sSbl7N6u5ZXd9k0ylw6eoe2DpIFsdRHfVcHnra4Hw74QO4jm4qYmGkX3
	 dkajCQc5VyJ6rHMp+ekj4fVeYcfCSSSijtO1XRS757QvJigEd/nLqijls0DYrob0OYFj3
	 jBUloWh+qULKFWE1a7PwAyPU7+sk+JVAe1myJRJt83jeHhT7+i5xmKQdxYvjjiFci3STZ
	 5I2opaZaBdkQbCddQMn1lj67TYmMPbWXiDFtUztWJld4F8NYqg+3v0AmLW3YGMoc06ZfX
	 k/QYmrnUgl6Z5cYZ0MFmEcOZ5dctD9VpmqC9rGb56a3+NQwHQUPSBhxnEU0BY7kndig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794250423;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=YjzUZB+X7tHX1gt4W84NHzmu4XEbAGyzapOO/tnSdkU=;
	b=qfKAtBeK5jzEhAtgvobtdHV2osQwlnyi8fyxOs7EsbysRZy0FHYyzYFBWaziELMPk0ei
	 5dz7ZIXL2inb/FFMXUzNOp/PjxMZ4GeqBklOe0dwSrnYjPncHrTJH/P5FEMVdsx0Qpbdq
	 EuY6FzIVeoR9z6d3rP+6eAMXkGFvtXDaP3d5u2gviKwKIi2YrennXVljfPvF0bLsQC7BH
	 FqiaW+C77Fjy5DV86nWTHt8ryzpkz+LbykPzdYMBCrAK7gnLqEdl6XweODLeU5tnap7Jf
	 1b8fe2boQZVdKauP3TAnCWGbjJ2Z4qXa5kCswhgaJVZq0Rot0JJlcKRIMTuNA4gRuwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=wDg0k5Vn;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B450606A326;
	Mon,  9 Nov 2026 18:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B450606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=wDg0k5Vn
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jNf7l0tYszKn1W;
	Mon, 09 Nov 2026 19:53:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794250419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YjzUZB+X7tHX1gt4W84NHzmu4XEbAGyzapOO/tnSdkU=;
	b=wDg0k5VnYlmKsFsz2n286lCR4fi2w0TKouLLH0WYfImRGDE3tBQwaw+3KMa7FpyDU22D1V
	d/QSvHThyQ15usXRUn4BCDNSxhBDsp/mm/MxDuBWamRrEUfVWv62YJJpanmE7gsUcM/fi3
	E0zMHDUF0+OLUA1fnIh2ccghEMJP82uMpNX3ZRi1I7WcACOvTTAWzfz7WIqbKt6tQHJkVF
	pft0aafCSrj2lMgGcuLlcH17ZqJhuElzr6zK74xfjcWCl+QgoXpNB81Uj3eKspqiEYuw3S
	VqIWLgEANqlmU0ynfInzN7MGt9xjDZXoAPFkW1tg67LLpRXD8tB4cJhFgad+jg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (nct6683) Report the fan curves of MSI boards with NCT6687D-R
Date: Mon,  9 Nov 2026 19:53:37 +0100
Message-ID: <20261109185337.130731-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <3ebb15c8-cef3-41a9-a603-335a9dcf4d86@roeck-us.net>
References: <20261109015759.24284-1-tomasz@bojanowski.me> <3ebb15c8-cef3-41a9-a603-335a9dcf4d86@roeck-us.net>
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
X-Rspamd-Queue-Id: 4jNf7l0tYszKn1W

On Mon, Nov 09, 2026 at 10:24:06AM -0800, Guenter Roeck wrote:
> I don't feel comfortable enough to enable it for good on those boards
> (I don't know why pwm3..8 are skipped), but it is good enough for
> testing.

On the MS-7E61 (customer ID 0x20d), the CPU and PUMP_SYS fan headers
are on channels 0 and 1, the system fan headers on channels 12-15
(pwm13..16), and the EZ Conn header on channel 3. The board has no
other fan headers.

I have no board with another customer ID, but the vendor's Windows
software lists the system fan headers of the MS-7D75 on channels 2-7
and those of the MS-7D76 on channels 2-4, with the CPU and PUMP_SYS
headers on channels 0 and 1.
