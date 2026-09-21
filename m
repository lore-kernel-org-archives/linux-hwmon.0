Received: from out28-217.mail.aliyun.com (out28-217.mail.aliyun.com [115.124.28.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF823546C6;
	Mon, 21 Sep 2026 05:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789970182; cv=none; b=YFoEUzV3eCBpWnOZ2sCztnPodrA5DwnS6PnQz4pzI4VNrO5J4D4QJVdFn4zo40qdKaYcZ8+6K1cTaErVEo94t5pVYHfv2+H3kYgDQnkXKjaY2iTc+6aIKBv7So+TgVg1/BC3K1YEf9y/+AgtR2CWVSu/83UiJdU3LpjCbpwD1kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789970182; c=relaxed/simple;
	bh=8IPj77BeQcIRme9TsVnXSVUYMQnjTVZmDH3ow+sjtWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m1Rfu2umDuP1E0U9hWEFMKZmGkx2O6ydGMPQxg6yf5ue7PP3+XF7d1/zD/5J0RamXhcOMmiF6vgVlNkRpBnkn91HowfysBe36xLJxxVgACqBrBywuJKM3vcch/WtFBnlipczEAi9eFQ3Gifpq6lPYGtx3qDOvMcoOphxuWlV75w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07453828|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0529914-0.0053801-0.941628;FP=5010334953258964115|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033032062159;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jIkm1d8_1789970167;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jIkm1d8_1789970167 cluster:ay29)
          by smtp.aliyun-inc.com;
          Mon, 21 Sep 2026 13:56:13 +0800
From: Lin Wang <wanglin@open-hieco.net>
To: Borislav Petkov <bp@alien8.de>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Pu Wen <puwen@hygon.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Guenter Roeck <linux@roeck-us.net>,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/8] x86/hygon: Add Family 0x18 DF node enumeration and SMN access
Date: Mon, 21 Sep 2026 13:55:55 +0800
Message-ID: <20260921055603.25112-1-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series separates the Hygon node and SMN support from the AMD
northbridge and SMN implementations.

The AMD northbridge cache previously discovered Hygon F3 devices by PCI
ID. It now derives the node count from CPU topology and locates DF
functions at fixed PCI slots, removing the Hygon PCI-ID discovery path.
Hygon instead requires F3 discovery by PCI ID and reads node identity
from DF registers. Its PCI slots do not encode node identity, CPU
NodeIds are sparse across sockets, and SMN roots are grouped by socket.

The AMD mapping therefore cannot represent the Hygon topology. The
northbridge cache is discarded before amd64_edac can probe a memory
controller or ATL can register address translation support. k10temp
does not use that cache, but derives an SMN node from the F3 PCI slot
and therefore cannot identify a valid Hygon SMN target. These matches
do not provide usable Hygon support.

The series stops these drivers from matching Hygon before restricting
AMD northbridge and SMN initialization to AMD CPUs. Follow-up Hygon
support for these drivers will use the interfaces added here and will be
submitted separately. The Hygon MCE decoder is unchanged.

The node and SMN implementation has been tested on a Family 0x18 Model
0x07 system with two sockets, 12 Core and DDR Dies (CDDs) and four I/O
Dies (IODs).

Changes in v6:

  - Update the k10temp documentation after removing the Hygon match.
    (Sashiko, Guenter)
  - Follow tip-tree comment, declaration and whitespace conventions.
    (Boris)
  - Build and validate the DF cache before publishing it.
  - Use the SMN root array directly as the setup state.

Link: https://lore.kernel.org/20260916155956.GBaqq8_BsuLkBKp-Ia@fat_crate.local # v5 review
Link: https://lore.kernel.org/20260901071700.3255382-1-wanglin@open-hieco.net # v4

Lin Wang (8):
  x86/hygon: Add Family 0x18 DF node enumeration
  x86/hygon: Map CPU NodeIds to DF nodes
  EDAC/amd64: Stop matching Hygon CPUs
  RAS/AMD/ATL: Match AMD CPUs only
  hwmon: (k10temp) Stop matching Hygon devices
  x86/amd_nb: Restrict the northbridge framework to AMD CPUs
  x86/amd_node: Restrict SMN setup to AMD CPUs
  x86/hygon: Add Family 0x18 SMN access

 Documentation/hwmon/k10temp.rst   |   8 +-
 MAINTAINERS                       |   3 +
 arch/x86/Kconfig                  |   4 +
 arch/x86/include/asm/hygon/node.h | 191 +++++++
 arch/x86/kernel/Makefile          |   1 +
 arch/x86/kernel/amd_nb.c          |   6 +-
 arch/x86/kernel/amd_node.c        |   6 +-
 arch/x86/kernel/hygon_node.c      | 910 ++++++++++++++++++++++++++++++
 drivers/edac/amd64_edac.c         |   4 -
 drivers/hwmon/k10temp.c           |   5 +-
 drivers/ras/amd/atl/core.c        |   9 +-
 11 files changed, 1124 insertions(+), 23 deletions(-)
 create mode 100644 arch/x86/include/asm/hygon/node.h
 create mode 100644 arch/x86/kernel/hygon_node.c

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137
-- 
2.43.0

