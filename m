Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BAF3F4125
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 16:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786119812; cv=none; b=HOzQb5cqwPOdFiDX2+GogarE0/VJapBFA96I4FYo3SeC7ZCVWR2XChZw6EUR4Qtb37JWu9i0xtnHV+MX8PH+WTEM9rCIA2tahthHaU7mZzThxhrFDX6Nh4Uoq675PtYXNwnWZSLt7jSRcCelSwyLfuWXVvqBl78qVndrhqn1loA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786119812; c=relaxed/simple;
	bh=a96Mf96znda3wB24VCfSnMLF2jUrnc4dPuZWxt7e3X0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r2od0s7sJJJX5riPFxNACqd7pHtR9Wk1EIxiwkZug9Hhgjbtn448juu734RULd26aS7m9TzUN6IgJD1V5S0oLfn3vOR1zyYYaM1/blOgr95JBIT4wzjv3pqvSaNdPSxyP3Yep+MhLSJo1vvr5lssAylnQ7lgER2OU6zvPKeGTnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=jVjfbZ9o; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jVjfbZ9o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=a9
	6Mf96znda3wB24VCfSnMLF2jUrnc4dPuZWxt7e3X0=; b=jVjfbZ9oiFceAUXBgx
	mga7brPidGTTPsjYuWMM5lfNh/bz6l11c/yZpkBA645uE1SZtPXICCVwupRc/gXX
	qtaAT49ofvUAv93enFLtFdjc2hclDbQWuIXtCAG/LKmAGmSxMTejBJvK32m93AV9
	LBtEPuVfPtF7pgmTG/Je13Wv4=
Received: from fedora (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgD3PypoBnZqZo5_LA--.9256S2;
	Sat, 08 Aug 2026 00:23:06 +0800 (CST)
From: huangjia2hi@163.com
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: [Question] Upstreaming hwmon driver for Nuvoton NCT5584D (NDA / licensing inquiry)
Date: Sat,  8 Aug 2026 00:22:56 +0800
Message-ID: <20260807162256.10456-1-huangjia2hi@163.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:QCgvCgD3PypoBnZqZo5_LA--.9256S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr17Xw13JF47CrWfKw1kGrg_yoW8WFW7pa
	y0ga4ayr4rt3WrXw48Zw4xZ345Xws3tay3Ar1kKrs0yrn8KFyIkrnFk3Z0vF1jkFn5WFW2
	vrZF93WDuaykZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U9BM_UUUUU=
X-CM-SenderInfo: xkxd0whmldjxrl6rljoofrz/xtbCwwrTCmp2BmpXygAA39

Hi Roeck,

First, I would like to express my deep respect for your immense contributions to the Linux kernel, especially your extensive maintenance work on the hwmon subsystem and Nuvoton chip drivers.

I am currently interning at Colorful in Shenzhen, working on BIOS/UEFI development. I have prior experience in open-source development (mainly Neovim plugins), and I am now eager to contribute to the Linux kernel.

Recently, I have been working with the Nuvoton NCT5584D Super I/O chip and have experimentally written a working driver for hardware monitoring on our boards. However, because the hardware documentation is under NDA, I want to ensure I follow the strict legal and community guidelines before attempting to upstream any code.

Since I cannot directly share or reference non-public datasheets, I would greatly appreciate your guidance on the best way forward:

1. Is it generally acceptable to upstream a clean-room driver for NCT5584D that only contains the minimal necessary register definitions (for temperature, voltage, fan monitoring/PWM) without attaching/referencing public datasheets?
2. Alternatively, should I attempt to contact Nuvoton directly to request permission/public datasheet release for upstreaming, or look into extending the existing nct6775 driver framework if the register layout allows?

My goal is to strictly abide by both community standards and NDA boundaries while contributing functional hardware support back to the Linux community.

Thank you for your time and advice. I look forward to hearing from you.

Best regards,

Huang Jiazhi
BIOS/UEFI Development Intern, Colorful

