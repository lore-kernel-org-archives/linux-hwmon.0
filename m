Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A27A37F8D3
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Aug 2026 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786207384; cv=none; b=e6v1BR1GS1EJpCTcHo9W8AuQvJIB88dR+Crpsbw8src7Ip4JkSDwhZg7MiqUmOwzYB2ST85x3xwFgwJBJHRtH8y202xV1QZb8SCCLhdDurRE11r9RCrJiBxmBqUduFuR8DjFYp/HHD5gYt7beKOnk3qvOFaE0u/Q8RPplvrnq7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786207384; c=relaxed/simple;
	bh=XCI+PkPtbZgTta62fL/mdym4iY/oy3X8GH+Tn6qip28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhNlRzeICaMPLATVHk7Aol5m6Es11uz26Ej9nrGaZ+L7gH/DNuzit1vx6U8cMrqAHbJ6brcw2KOc6vzOC9w6tpp02CbRcapIBT544agqgCB9ICaqw2pUJk0e0uydTFS1Hj+Jg+mH1OEfMC/2OvPvj6tTFdWrHecUHFM/3IwLgQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Smn6IPuO; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Smn6IPuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=XC
	I+PkPtbZgTta62fL/mdym4iY/oy3X8GH+Tn6qip28=; b=Smn6IPuOmtmK1fBNrc
	iFOvzZYh0Zd1QPMMzpAYQhi6mShQh/hO7BfOKrUxRnmjrg2FQHiJWvc+AbSUkHLf
	TTyPV+N2NCB45LWFisCEUEUPvmV1CtMvydYb0GZt7zLdPWG+f8bNsVoPnJb6/Rte
	1qx0+rvSvr1JKDtQrHLT16duc=
Received: from fedora (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wCnKSt0XHdqm1dLAg--.24998S2;
	Sun, 09 Aug 2026 00:42:30 +0800 (CST)
From: huangjia2hi@163.com
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [Question] Upstreaming hwmon driver for Nuvoton NCT5584D (NDA / licensing inquiry)
Date: Sun,  9 Aug 2026 00:42:20 +0800
Message-ID: <20260808164220.17986-1-huangjia2hi@163.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <da245e33-a441-418c-9942-9847dc2696da@roeck-us.net>
References: <da245e33-a441-418c-9942-9847dc2696da@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wCnKSt0XHdqm1dLAg--.24998S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvj4RZManDUUUU
X-CM-SenderInfo: xkxd0whmldjxrl6rljoofrz/xtbCxBas4mp3XHaZ1gAA3k

Hi Guenter,

Thanks for the clarification.

If my testing on the hardware shows that adding the Chip ID mapping to the existing nct6775 driver works properly for NCT5584D, would a patch like that be acceptable to the community?

If so, that would neatly avoid any NDA issues while providing functional upstream support.

Best regards,
Jiazhi Huang

