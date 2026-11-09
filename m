Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794263694;
	b=mbvlXaLtmKYrinyoOLlx+Zx/WW+xtNJZAiuxBH6pgOb2RGKdZML4Nf6OJqiXIdPdSnvg
	 cgtXVFgwMXRFFAZ2WsxG0c2QhaVGUWi6ig0KieYXf9AU1yLrofKs19Swq6dZiYxDNsf9Z
	 n1Wl+dJHmg6uafrjIrKAHEfbhgF6P54BIus5Ym8Nyyotz+XaGUlkD396nT0/OaeZGmW1P
	 DKjHzN8SsiHsc6yo82Om6Zlcz+qi7t9anorfgA5CfTrsr3b3VWHDUNGNRmPEkwkS136FP
	 14oQi8H4ys587JPg0rip9jUETxbX0ujp/LbwCGnHBE7DEffIXB1m8dXhBtUjfMy1GtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263694;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Rspamd-Queue-Id;
	bh=M/XPNOkxi1dKro3AJBTwfR3EZmH5M37L9K/Sk1U/zqU=;
	b=M1RNVYosgGoosOyCHMDzbrDfuqpGyqVEd9uY8SgGfGSEhIqXgGARbZtYPUoJEm7mfASE
	 NZAXg+L+C/Ekt+vOuXe1xGSE3hjHx9OvsiY+choY5JJU+a7bfgYjSZvNV4E53f6hTscZC
	 PjTHxht8JRzf07gf41UirOEGnarsTeVvXKCN/FKWmCOlWGP5opO+FWuXljGUa1fJYbEks
	 4Wa/01FrdBMwwmXB2MDxBl246lrSvTK8LEj4c2a8pc2g8ctFBhzjx6Oyns0IIAhRq30ns
	 TuPcmxIkU70A1FY5+OYHSRbNtOrzDQwopZiQmCGohbqiasHMX7ko8xR1LZ9zBnGsucA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=ih2QknUe;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DE3606A31C;
	Mon,  9 Nov 2026 22:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70DE3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=ih2QknUe
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jNl2r3LN8zMlQ4;
	Mon, 09 Nov 2026 23:34:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794263684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=M/XPNOkxi1dKro3AJBTwfR3EZmH5M37L9K/Sk1U/zqU=;
	b=ih2QknUexReiJQmqSM/4fQdyP9zmHWLtBaK4KzbbvjOwcN6b1ejJOIS8ZCTpmPscvOgl0c
	9CChCpbQvZVoEgA0LKSf9pq4jdvvS6olzM5WZ4EsfkrLjixCrY1ZHsUGtZJYem9+2E7uNk
	KZModAJGtbesemnJrhEghuxyQSpg0PUq8ojXVnvdMCPZ+rQ0jJIm4UMQhLYSWvsWvT8zcW
	fu9VpUAgkRi2/KzhdR1txINH4f0iK1V0tqWsqbNUgVI7MpCVTutvyH9MeHjfhXw1TT+gSP
	HltIzjpcKvswWIL80GRthKNBfqFLcrTVavYh102j9GS2+en9XNE6lIXA1RJ3/w==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Hamza Mahfooz <someguy@effective-light.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (nct6683) Writable fan curves for NCT6687D-R
Date: Mon,  9 Nov 2026 23:34:40 +0100
Message-ID: <20261109223442.509238-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
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
X-Rspamd-Queue-Id: 4jNl2r3LN8zMlQ4

This series makes the fan curves of NCT6687D-R (customer ID 0x20d)
writable through pwmN_auto_point*. Following your reply in [1],
pwmN_enable is unchanged, and the curves written through sysfs are
restored on resume.

Patch 1 moves the fan configuration transaction into a helper, without
functional change. Patch 2 makes the curve points writable.

Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61) with pwm16: curve
points written in automatic and manual mode, including clamping, a
written curve kept across suspend to RAM, and manual mode still restored
after resume. Only pwm16 was written; the curves of the other channels
stayed unchanged.

The new pwmN_auto_point*_pwm attributes clamp out-of-range values, as
sysfs-interface.rst recommends for continuous settings. pwmN keeps
rejecting values above 255 with -EINVAL; changing that would be a
separate change.

I used an AI assistant (Claude Code) during development. I reviewed all
of the changes, tested them on the hardware described above, and take
responsibility for them.

[1] https://lore.kernel.org/linux-hwmon/487b2f39-7e22-46db-9eaf-9b1dd9b31d31@roeck-us.net/

Tomasz Bojanowski (2):
  hwmon: (nct6683) Factor out the NCT6687D-R fan configuration
    transaction
  hwmon: (nct6683) Make the fan curves of NCT6687D-R writable

 Documentation/hwmon/nct6683.rst |  35 ++-
 drivers/hwmon/nct6683.c         | 378 ++++++++++++++++++++++++++------
 2 files changed, 330 insertions(+), 83 deletions(-)


base-commit: e0fdadf444800610828d01b299743f79ae3bd27f
-- 
2.56.0

