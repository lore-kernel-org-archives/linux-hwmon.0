Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245475;
	b=ghiXUvJEaAfkvzwuxshRxiwexahDQzLTGV+RHDsSlft4kcvLnDGoST3/vjTYbiBji0Qa
	 Gz2sbFWdyp8HjKv/0MUFuX54Dqdk9GPISBbH2Xb0yloXO/0AAftN8SZCRl2wlKzOkpapQ
	 MUUSYJoniapBXiyK/6zZ1Pf+KatClvi1ZnCiSVPKwkSULTb1hXjse/peQYXqchx94hGE7
	 yw8Apq689hS52c/qwKv5mGs0fGfZ9bPtjxp8oW7YZVPETqbqibtrqS+RW9H8vKtVDGGPM
	 PX84mCIxf2PPYYbzyr3FJ3nTjwCfY/IToXYLxrassk8e1EB0Me09ehsjFYPzG5SdPJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245475;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=nhLFeCiJmgAXqRFWir2gProEGfGcp5eqJ0rp4zYIthw=;
	b=CqyK81r9faoNLOmZoYWLz8//VC7ShwkA9Bp8MqkQaNmfqb5t3I8jhrtGSRAAAFxcRVnz
	 WKOCGpD/r2UHUKPUegi0c45IqnkOQE8moyCp7ven4vhxYap1YW87IfwgZoK8t/np2meBw
	 W752ZUEm+NZLnE2ifD7QggTEkcULJvSmx5+gx8XpQ6lC+ak92ttASDXs4FbTS5ia5VC0Y
	 ihgG34TLYSAStzQFpIq0BFBxIK4RLCvyXXu+Awc3VnfOA50kZQsidiOYv6brrEjT3FcYS
	 eBO4aV+n2BREYxmrTEn9JXs5HDLd/cKE1xOGXv2pALlYcHNZuazQ/It2FtwKwxUsWiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=DPX5fuK0;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74A606A321;
	Mon,  9 Nov 2026 17:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F74A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=DPX5fuK0
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jNcJZ3pthzMlX9;
	Mon, 09 Nov 2026 18:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794245470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nhLFeCiJmgAXqRFWir2gProEGfGcp5eqJ0rp4zYIthw=;
	b=DPX5fuK03r6ynVDTY1qswsoMiu80CHwRDd6n6r1fjd5/HUNjkgjE0aOqZeMECrBudhd37w
	JQYQw034ICONwR7vD9SSoXYf+Sc1mIp0dkyec2omctcADUb+RnJmLhftMD11ki4RlsLOpr
	1O2s74HtV4zqiwKhkW2J8i2GDNuFARvA549wtFbC7KZvH7ZQqCsUAy278wfnQWBjyKRUJm
	Z/2nu1RoFqn+J+Z5PC0H9K1uZHDGoWOjySygyzrjxxW4Zd/WXx/raCcCgswMkEWjuNKh4o
	2sVUmciquiyI0595bCUQYZVk78aqjDl9gf150uwKksQerGqGctFfnyCFUeegAw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
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
Date: Mon,  9 Nov 2026 18:31:09 +0100
Message-ID: <20261109173109.77246-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <487b2f39-7e22-46db-9eaf-9b1dd9b31d31@roeck-us.net>
References: <20261109015759.24284-1-tomasz@bojanowski.me> <487b2f39-7e22-46db-9eaf-9b1dd9b31d31@roeck-us.net>
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
X-Rspamd-Queue-Id: 4jNcJZ3pthzMlX9

On Sun, Nov 08, 2026 at 09:37:30PM -0800, Guenter Roeck wrote:
> A more important problem is going to be handling after
> suspend/resume. The BIOS will restore its default settings during
> resume, which might be unexpected unless the configuration is restored
> in the driver.

Thanks. No changes are planned for this patch. The resume issue is
addressed by a separate patch, which you have applied:
https://lore.kernel.org/linux-hwmon/20261109163328.61787-1-tomasz@bojanowski.me/
