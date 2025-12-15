Received: from mail.monolithicpower.com (unknown [12.33.0.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE1818C2C;
	Mon, 15 Dec 2025 01:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=12.33.0.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765762873; cv=none; b=BDiH8mtZYy55uNHk/491iy2jQma5SZZf2Mp2AVQ2uOaSw4uwLQDN4LIPUr1XX7AekaJQA77IBX5D01S2hKnLDFQFOM02+sGHz+WNKCY3ybPDfoDwAOd833e8aWHHzDmUP7xuTpIYnflKPfLgeT1Zsjn/CqS2aZEDY1rZp00EzZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765762873; c=relaxed/simple;
	bh=OYv/2cm8ZjgmBv1Y9zYXeD8VsLZKK9EOOc+vTiAK510=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KS718QR/VMNPvoOWoiOqUkYRei+cLXJs5A28WNWwA/kbYLKsf4fU7XgtOtSrl4CZ+c15b5On46kACRJGuWAOVgSaV0ZNcEDv5oSdAzevCn6HYKbxGsyHbEqnA9S2xMwMwbvqu/XScNFCCR5IIoIvxFThhQESzgQMlap022mmwok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; arc=none smtp.client-ip=12.33.0.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 mps-mslbn01.monolithicpower.com (10.10.10.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sun, 14 Dec 2025 17:41:05 -0800
Received: from HZ-200D-C0727.monolithicpower.com (10.53.66.137) by
 CD-MSH04.monolithicpower.com (10.10.70.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 15 Dec 2025 09:41:03 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <Yuxi.Wang@monolithicpower.com>
CC: <wyx137120466@gmail.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 0/2] hwmon: Add support for MPS mp5926 chip
Date: Mon, 15 Dec 2025 09:40:50 +0800
Message-ID: <20251215014052.1215-1-Yuxi.Wang@monolithicpower.com>
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
 drivers/hwmon/pmbus/mp5926.c                  | 190 ++++++++++++++++++
 7 files changed, 302 insertions(+)
 create mode 100644 Documentation/hwmon/mp5926.rst
 create mode 100644 drivers/hwmon/pmbus/mp5926.c

-- 
2.39.2

