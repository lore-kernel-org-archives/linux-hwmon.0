Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794084889;
	b=n8pfh5PFKGF87PgJG8BTuGFbIorpVeSHQabyLtFruKQ7UuYGi9eOHm3UVYG+CO/zDUdV
	 VV0uAI4Tk7Ap7M0UEHWu84+YJ/QzpOhaMrA/xK+2ZPB0Mc4BZrg8FElSDQ4UrglftZ3gb
	 rkALUD0muPf3IvNEtff/YcgbSjEimGkwk3bivDwT7fO/8HRhnn+Q2YZ+oW8JteYq5JgZN
	 1XfFUo0KX24S1heP2pC25TE0iVwGEhFfA3g0NXHKawcNbbww1NWwzXyWw2mEb5WJy8CfQ
	 pThw4IsmHm6ZJsZj0muWRmh2SfCBkkvinQAaV9xz4XRpnxIDl25O4HJo2K+FJhx29Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794084889;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=tREVUEUf9bCitrWRPmhokHLgiBPXJLteRSjyxCcR6Js=;
	b=DupFnrUNz8YeeFt9iU4zJWSLPU6N9Hf2VgntCZrA9iaQl2mlqS8zU3MUwMfjMSKeOY/3
	 Kk6A+/KYb/SPm8ftUqolMW3C0AnmRuiDJszW73Em9u1+mBOQiuBOGw1P+4yQAtE9DRehy
	 ekjCzRJ2pgI+5a2DRgIux0HhqI/eaizjtiZTh/N47Zw921BHhWQXbl3SnNZOhaZviBX9C
	 l5VquS1O8zSHx/pfcBsZ7haaEohwPzgmcA7pQfiSqRlFXdAttb1puxONAjXyfpSC2iETH
	 V9MJv/ckxGunKE92QfRRcgCk5DtFIIK/Nd0s06zznPxlBbCDnKGJox3kerMZGSsRq7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=p8+sUpVt;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCD3606A326;
	Sat,  7 Nov 2026 20:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBCD3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=p8+sUpVt
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jMSwN0tmGz8tLh;
	Sat, 07 Nov 2026 21:54:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1794084884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tREVUEUf9bCitrWRPmhokHLgiBPXJLteRSjyxCcR6Js=;
	b=p8+sUpVte1jstTGrw1LgkBC3mfewBSbepVq/8jzTA0y667tEu+1nfdgsylv+pwyP059Ybb
	dNimNtaQqqDqPhj7Lj/W3KjbFG3hm/gYwkdddEsQKsdDAo0WYpUhpcCZvTvzZpe2PcBqPK
	daSLY6PpAiemD2Zb/amEaRCDkntTy1QZqJEY8JeIUGpHXveoodYgRKq7gg3LeWJTixjbCF
	oeaNaIX0aB/uarvGFoihlSqGllGi2DINChdOd6C1BDKPTWJ04M2gNfUABTubFpm6qRVILU
	VZBxgYjyvIDhswu4B9+XPgELhzlMQWmvrj4jfbnnJlGV1C8EwHBPPLcO2xQsBw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: Add driver for MSI Mystic Light controller voltage sensors
Date: Sat,  7 Nov 2026 21:54:42 +0100
Message-ID: <20261107205442.431992-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107203300.427273-1-tomasz@bojanowski.me>
References: <20261107082821.8257-1-tomasz@bojanowski.me> <812ee6c0-82ac-41f6-9eca-1f17c6ef715d@roeck-us.net> <20261107161249.336512-1-tomasz@bojanowski.me> <5e99fd86-d934-49c1-a867-02cc61ab1ecf@roeck-us.net> <20261107181518.385136-1-tomasz@bojanowski.me> <e79d3e26-4ca5-4ca4-9159-427a5a6f1129@roeck-us.net> <20261107203300.427273-1-tomasz@bojanowski.me>
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
X-Rspamd-Queue-Id: 4jMSwN0tmGz8tLh

One more note on the MS-7C94, after a closer look at the vendor
software: it only lists CPU VDDP on that board if the CPU name
contains Bristol, Raven, Picasso, Renoir or Cezanne. These are all
APUs, so with a CPU without integrated graphics, the 2 mV at offset
11 is probably expected. It does not use offset 15 on this board at
all.

Tomasz
