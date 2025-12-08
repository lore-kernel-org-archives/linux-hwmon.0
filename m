Received: from mail.monolithicpower.com (unknown [12.33.0.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E67025EFBC;
	Mon,  8 Dec 2025 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=12.33.0.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765179145; cv=none; b=bssnhHMlcAqz+vFfI/NfVIYP2Gh4y+BDqMWISCAETVXf4Sa0aXiRtEahE6Y+8hW9VBp6B2Q63fC2gtHgvGfPRsR04nzWeSuPtoDElTFMU8Gv7Vdi4uvz/C7VFv5GXpO/ymWEjYwu1wwNWjRwgZmdjSOnYRJeavT2JsMIzTPcFSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765179145; c=relaxed/simple;
	bh=bSF2QFHD5bMxHOl8lJ3PkVKBz/BrciRRpYKk8qPfBdc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KW9UYXN7YMKZDkFJ7fn0HxSbrInzaBTGXaBXqn5qfD8KuKi79dI3hqbxcCtgUm/6LWxehRx5YceVIgrndXb6CX6PqRoGXytdh/Rc2njaaccXiz/sDKZekfbMC+6y5o7IA2p4EsyROIPWpUR0+XBvNmAFWWmbqBBqVQxAZiMli+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; arc=none smtp.client-ip=12.33.0.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Received: from CD-MSH04.monolithicpower.com (10.10.70.213) by
 mps-mslbn01.monolithicpower.com (10.10.10.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Sun, 7 Dec 2025 23:17:12 -0800
Received: from HZ-200D-C0727.monolithicpower.com (10.53.66.137) by
 CD-MSH04.monolithicpower.com (10.10.70.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 8 Dec 2025 15:17:10 +0800
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: <Yuxi.Wang@monolithicpower.com>, <linux@roeck-us.net>, <corbet@lwn.net>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <wyx137120466@gmail.com>, <linux-hwmon@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH 0/2] hwmon: Add support for MPS mp5926 chip
Date: Mon, 8 Dec 2025 15:16:57 +0800
Message-ID: <20251208071659.1157-1-Yuxi.Wang@monolithicpower.com>
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

Yuxi Wang (2):
  dt-bindings: hwmon: Add MPS mp5926
  hwmon: add mp5926 driver

 .../devicetree/bindings/trivial-devices.yaml  |   2 +
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/mp5926.rst                |  92 +++++++++
 MAINTAINERS                                   |   7 +
 drivers/hwmon/pmbus/Kconfig                   |   9 +
 drivers/hwmon/pmbus/Makefile                  |   1 +
 drivers/hwmon/pmbus/mp5926.c                  | 192 ++++++++++++++++++
 7 files changed, 304 insertions(+)
 create mode 100644 Documentation/hwmon/mp5926.rst
 create mode 100644 drivers/hwmon/pmbus/mp5926.c

-- 
2.39.2

