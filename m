Received: from smtp.outgoing.loopia.se (smtp.outgoing.loopia.se [93.188.3.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAC3379C49
	for <linux-hwmon@vger.kernel.org>; Wed,  3 Jun 2026 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.188.3.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780477662; cv=none; b=gi48Y1Vfgv/oS0cth+i0KGNNlKiZkl+t+rcIxcGRCBns4kI3qwFtRgtToVnx0+SZHymrMthVDqxkYM5rQgSWyoirHYafGDZq8AdrSlzXS9xqVn1gPtB96HzzAq15wRNZaqYPG3UPQN6zZnwmERxdA36+GbjF9GYc5toeJgiQC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780477662; c=relaxed/simple;
	bh=GZzDIpCba88oaBGJmylGq0xxI3r2qLCCOKGtHPr4wnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ROEzxmSIMIJb9JdbK7veGGVu9ac/zZzztYqu/Fsj4U08H1fLlQ1VRr5qEw3qB4iseECV6mHhx3XSDJo885rDtyswsWGinoap5dyYnm7v3G4KDNmUbIyIYS6D9oyGX3FlYLwVpsX71hzPNg0IBpKkv+r5qC0710gfLCn/vI4yO6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=erq.se; spf=pass smtp.mailfrom=erq.se; dkim=pass (2048-bit key) header.d=erq.se header.i=@erq.se header.b=Bof6K2td; arc=none smtp.client-ip=93.188.3.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=erq.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erq.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=erq.se header.i=@erq.se header.b="Bof6K2td"
Received: from s807.loopia.se (localhost [127.0.0.1])
	by s807.loopia.se (Postfix) with ESMTP id 56BF2537B91
	for <linux-hwmon@vger.kernel.org>; Wed, 03 Jun 2026 10:57:48 +0200 (CEST)
Received: from s934.loopia.se (unknown [172.22.191.5])
	by s807.loopia.se (Postfix) with ESMTP id 46358535FF5;
	Wed, 03 Jun 2026 10:57:48 +0200 (CEST)
Received: from localhost (unknown [172.22.191.6])
	by s934.loopia.se (Postfix) with ESMTP id 44491A3D613;
	Wed, 03 Jun 2026 10:57:48 +0200 (CEST)
X-Virus-Scanned: amavis at amavis.loopia.se
X-Spam-Flag: NO
X-Spam-Score: -1.2
X-Spam-Level:
Authentication-Results: s472.loopia.se (amavis); dkim=pass (2048-bit key)
 header.d=erq.se
Received: from s934.loopia.se ([172.22.191.6])
 by localhost (s472.loopia.se [172.22.190.12]) (amavis, port 10024) with LMTP
 id zEUscrFsJuUi; Wed,  3 Jun 2026 10:57:47 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: linux@erq.se
X-Loopia-Originating-IP: 90.231.188.7
Received: from mailcluster.loopia.se (90-231-188-7-no600.tbcn.telia.com [90.231.188.7])
	(Authenticated sender: linux@erq.se)
	by s934.loopia.se (Postfix) with ESMTPSA id 792C3917F0D;
	Wed, 03 Jun 2026 10:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erq.se;
	s=loopiadkim1730905327; t=1780477067;
	bh=OZ/y+bkgDX4jjV/dpgyVVxa/MxK1D4rxKGGkZztqNAo=;
	h=From:To:Cc:Subject:Date;
	b=Bof6K2tdLumd4TLF3L5dGVEbEnqtRpy8x1sj5gev4oCE/6ea8k6O8ZsaHEzJIeOPb
	 HEsZzONXS/pMFaNIq0RZDErPKFL+PhOTlmoVMRawpMXe3uJeCHOeyIINWzrfohq80h
	 Btkh9eFX4h87n54bPNS2sTLwK4DO6JyDMkXSvej2bS6Os6beJnlVVx4D5eDkeTvRSp
	 NvY5s7qge5VYriobQ3H+I08YtebqvxQEzOAkrqlFscn6N4V62O0bYKNPhpySLPl7Ti
	 rrEJRf+zlAXGIOlmKiyxL65s6LYr/ueozGSYrbzQbiRJNKRL7ss56nUYpGWRrHNpMo
	 z+JDgjvHKpNvQ==
From: Daniel Nilsson <linux@erq.se>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Daniel Nilsson <linux@erq.se>
Subject: [PATCH 0/1] hwmon: (pmbus) Add support for Flex BMR316, BMR321, BMR350 and BMR351
Date: Wed,  3 Jun 2026 10:57:11 +0200
Message-ID: <20260603085712.659432-1-linux@erq.se>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for BMR316, BMR321, BMR350 and BMR351 DC/DC converter
modules from Flex to the generic pmbus driver.

BMR492, BMR316, BMR321, BMR350 and BMR351 all use the same chip, which
has the deficiency that it presents a second phantom PAGE even though
the devices only have a single real PAGE/rail.  By explicitly
specifying the number of pages via driver_data, as is already in place
for BMR492, we avoid exposing the phantom PAGEs.

Update the documentation with a new datasheet URL.  The datasheets for
Flex BMRs are now only found via the product selector on flex.com.

The patch has been tested against BMR316, BMR321, BMR350 and BMR351.

Daniel Nilsson (1):
  hwmon: (pmbus) Add support for Flex BMR316, BMR321, BMR350 and BMR351

 Documentation/hwmon/pmbus.rst | 9 +++++----
 drivers/hwmon/pmbus/pmbus.c   | 4 ++++
 2 files changed, 9 insertions(+), 4 deletions(-)


base-commit: e7ae89a0c97ce2b68b0983cd01eda67cf373517d
-- 
2.51.2

