Received: from mail.monolithicpower.com (unknown [12.33.0.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B462315D20;
	Tue, 23 Dec 2025 01:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=12.33.0.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766452983; cv=none; b=Sx+Latqjiz0MRhgV5iwFnsCWnlTC58RKWJm4S7CtIOmt++/blFHWaK6HI8jPzMC8i7Nrnv84c976BEbbtKKYJs27FWlz5tRdOJaYHIPTbpys1eizY8VGH53PJwKgp/DkW3/d3qaKwUWLYn/TjTvMT5xidjRNvp2inneaz7pgKYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766452983; c=relaxed/simple;
	bh=BPtVeorz4/7evryUVegbkO+/Ksxg6l0yRcLy37KjR4M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oB4lTEG4IuCYiD2mPvlR4QXeStmtgrMDVcVgFLedap4UzfoWMq85Zz36o3uEGzb+Mk05LpOLbvM+NfpEVXw34SjJSlJcQcrCQCizPlYWleH+fK02vNncTAr5uCxgKFyzdYKJdttxFN35UJ4bYa8hJtOC5XpI6VbOaKQUr+HC1z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; arc=none smtp.client-ip=12.33.0.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 mps-mslbn03.monolithicpower.com (10.10.10.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.6; Mon, 22 Dec 2025 17:22:53 -0800
Received: from HZ-200D-C0727.monolithicpower.com (10.53.66.137) by
 CD-MSH04.monolithicpower.com (10.10.70.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 23 Dec 2025 09:22:51 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <Yuxi.Wang@monolithicpower.com>, <linux@roeck-us.net>, <corbet@lwn.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <wyx137120466@gmail.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v4 0/2] hwmon: Add support for MPS mp5926 chip
Date: Tue, 23 Dec 2025 09:22:29 +0800
Message-ID: <20251223012231.1701-1-Yuxi.Wang@monolithicpower.com>
X-Mailer: git-send-email 2.51.0.windows.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CD-MSLBN02.monolithicpower.com (192.168.86.32) To
 CD-MSH04.monolithicpower.com (10.10.70.213)

Add mp5926 driver in hwmon and add dt-binding for it.

Change log:

v3 -> v4:
  - Add return dev_err_probe
v2 -> v3:
  - Add Rob's Acked-by.
  - Removed unnecessary content.
  - Changed dev_err to dev_err_probe.
v1 -> v2:
  - Corrected dt-bindings description.
  - Corrected Kconfig description.
  - Removed useless comment and code.
  - Corrected the alignment.
v1:
  - Add mp5926 driver in hwmon and add dt-binding for it.

---
Yuxi Wang (2):
  dt-bindings: hwmon: Add mps mp5926 driver bindings
  hwmon: add mp5926 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp5926.rst                |  92 +++++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp5926.c                  | 183 ++++++++++++++++++
 7 files changed, 295 insertions(+)
 create mode 100644 Documentation/hwmon/mp5926.rst
 create mode 100644 drivers/hwmon/pmbus/mp5926.c

-- 
2.39.2

