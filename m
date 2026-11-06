Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793975864;
	b=zsJOGPgewOn2x31807gjcor8ZotbFJfk9ddhsEby/eBzWbjzMbB+qKotd8nBFTXgbbnj
	 ZznFxpeVTQlhzgdccIzIua5+bS81HHv4pMfrvIzWO8Ff/m3+yMIxHB7Pj0vE750a5Lt/i
	 Y9LHKATTW5Oc9CfvkJA675gnIiTb8+10RlrL8cBFUtPOQVuxSwyl1GJsUVkY3rX9U36EM
	 NjQQtviJUGkIl2cHMUR+MR6Cl8yWhR26zZ2xY0DkzlE8tHRgBQy2GMzjhihymgwGg4hHM
	 OUGPWrVCgBvitrGJws+IFyqbU82VNiW8XIqwFQy3X6Ezd3NoklUT3NBnooqZpgzBMDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975864;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=qIn6iBBvwXhLiMImP4GzSaCyCI76Sq1bYbjqgztngUw=;
	b=YPcfzQ9riNTp6Vmgewx+FdscHox1KDI9hpJo+9aAxGkuaYM5gBeJobBvGVXHpz5K+WLD
	 OP34ro4hWBIsErxOV5extKIMhT5OsNvXjxWdls0JY8bwXRdYXyavaLWJZp+QIvJMjbPEV
	 3nWZL2RK8ALZSh3iB7HNKY7rt7YFP06idr6k/aZPgKPO8LwAA3iH9RUJ+02tllw23HT3D
	 2vXdZGvfCpShPK/l/8WrhipWXUIctRjfD8CpbVoVrq/w6+b8hTcSOg5fO6NlNTWkP6E0/
	 4vRfxYTLSxw7YXkP/QoftG1rXy32qOyp14TDAFP1UjwZAlztyzFczrI541D7eDDrf0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bojanowski.me;
	spf=pass smtp.mailfrom=bojanowski.me;
	dkim=pass header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=OTisjvxT;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4188606A332;
	Fri,  6 Nov 2026 14:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4188606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bojanowski.me header.i=@bojanowski.me header.a=rsa-sha256 header.s=MBO0001 header.b=OTisjvxT
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jLhbl6qlXzKnCG;
	Fri, 06 Nov 2026 15:37:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1793975859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIn6iBBvwXhLiMImP4GzSaCyCI76Sq1bYbjqgztngUw=;
	b=OTisjvxTd2an8DdXIXhyIGWKBwehjYMFZbL14TnbolqPVHJ/ux63fJaZhKwbhJboRFA9zy
	P8FZpkrZxQ5rp2QmmDqRYNUprmq24QdaNhiN2mH+CwCloapIMe77g4xjhLQp6AZcHvhWIB
	oyOmLmmBz+ADGgnCQ6sIRY1wahgXMWdSf5Pw5ZNQFsccU4cJi/Tm3QAg1BzaAkPBJitv89
	789ZD3kaQEZptlmdwMyBdVrnW1dUpc7xZI35u+NnsGD0RqGsWUXG8aK9UoEeEYd1B78W1Q
	OSUt24NelqfqS62ViWX/JnuiE7+8xeca1XUuhgxn+0KU6XMRcluHbLhAVxRfSQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] hwmon: (nct6683) Add fan control support for MSI boards with NCT6687D-R
Date: Fri,  6 Nov 2026 15:36:32 +0100
Message-ID: <20261106143632.19966-1-tomasz@bojanowski.me>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004153250.516730-1-someguy@effective-light.com>
References: <20261004153250.516730-1-someguy@effective-light.com>
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
X-Rspamd-Queue-Id: 4jLhbl6qlXzKnCG

On Sun, Oct 04, 2026 at 11:32:48AM -0400, Hamza Mahfooz wrote:
> Patch 1 reports the duty cycle of the system fans, and patch 2 adds fan
> control support for the CPU, pump and system fan headers.

Tested on an MSI MAG B850M MORTAR WIFI (MS-7E61, BIOS 1.A68, NCT6687D
EC firmware version 0.0 build 03/10/25), with nct6683.c from
hwmon-next built out of tree against kernel 7.2.15.

pwm1, pwm2 and pwm13 to pwm16 are writable and have pwmN_enable,
all set to 2 after loading the driver. Writes were tested on pwm16
(SYS Fan 1):

  pwm16_enable  pwm16  fan16_input
  2                98     926 RPM  (initial, BIOS curve)
  1               255    2083 RPM  (after 8 s)
  1                80     767 RPM  (after 10 s)
  2                 -     911 RPM  (10 s after switching back)

Setting pwm16_enable back to 2 restores the BIOS fan curve.
pwm4 (EZ Conn header JAF_1) remains read-only.

Tested-by: Tomasz Bojanowski <tomasz@bojanowski.me>
