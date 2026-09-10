Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com [115.124.28.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5510392819;
	Thu, 10 Sep 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028875; cv=none; b=R0gSP9JpVFEeZ61LitY+6rrdKxFuHySr/N8qtcCV6NONubHsuoD3aMLrL4GdtfJgTyu6Mi+4X8gaYOoyO5peSe39S62kSKaEF84SLkcaafdKreCEoqcAP8MlhMbxvhGB9N3MLs5quZE1tNC9rZJS7xkEi7AoCVvHTSjX32aluh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028875; c=relaxed/simple;
	bh=yULHFGmQzjhzhTg8sjHIQqiidY/br5Rgf6p6FBYw5xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gb5m2A34xyDhwe25NvCUZdhsT84uSD8DNjXKemP4QHyw2Zqpc60okrOGQXGtJ8jQ/eAyrtbX0fmb3VlELo5Gf5sCUYqxm4/wrq7JxvgTtM7JwUzKOf5lsmqKp/5sGu3KeGzKIkd/QRxpgVeQwmc3MIKcYL8+E6InQFHce8C5mRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07459524|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.118048-0.0145929-0.867359;FP=5595810601939584147|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037032089;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jAJ34z5_1789028860;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jAJ34z5_1789028860 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 10 Sep 2026 16:27:46 +0800
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
Subject: [PATCH v5 0/8] x86/hygon: Add Family 0x18 DF node enumeration and SMN access
Date: Thu, 10 Sep 2026 16:27:26 +0800
Message-ID: <20260910082734.3771675-1-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This revision separates the Hygon node and SMN support from the AMD
northbridge and SMN implementations.

The AMD northbridge cache maps dense node numbers to fixed PCI slots.
Hygon discovers DF F3 devices by PCI ID and obtains node identity from
DF registers. Hygon PCI slots do not encode node identity, CPU NodeIds
are sparse across sockets, and SMN roots are grouped by socket. The AMD
mapping cannot represent this topology.

Sashiko reported that v3 restricted AMD northbridge and SMN
initialization while Hygon callers remained. However, amd64_edac and
ATL obtain their node count and F3/F4 devices from the AMD northbridge
cache. A failed fixed-slot F3 lookup discards the cache, so both stop at
their amd_nb_num() checks. k10temp can bind, but derives an SMN node
from the F3 PCI slot, which does not encode Hygon node identity. These
existing matches do not provide usable Hygon support.

This series therefore stops these drivers from matching Hygon before
restricting AMD northbridge and SMN initialization to AMD CPUs.
Follow-up Hygon support for these drivers will use the interfaces added
here and will be submitted separately. The Hygon MCE decoder is
unchanged.

The node and SMN implementation has been tested on a Family 0x18 Model
0x07 system with two sockets, 12 Core and DDR Dies (CDDs) and four I/O
Dies (IODs).

Changes in v5:

  - Stop amd64_edac, ATL and k10temp from matching Hygon before making
    AMD northbridge and SMN initialization AMD-only. (Sashiko)
  - Remove the model-specific Hygon handoff from amd_smn_init(). (Boris)
  - Keep the Hygon DF PCI IDs private to the node implementation. (Bjorn)
  - Report the discovered DF topology after cache initialization.

Link: https://sashiko.dev/#/patchset/20260709075549.626095-1-wanglin%40open-hieco.net [Sashiko v3 review]
Link: https://lore.kernel.org/all/20260901071700.3255382-1-wanglin@open-hieco.net/ [v4]

Lin Wang (8):
  x86/hygon: Add Family 0x18 DF node enumeration
  x86/hygon: Map CPU NodeIds to DF nodes
  EDAC/amd64: Stop matching Hygon CPUs
  RAS/AMD/ATL: Match AMD CPUs only
  hwmon: (k10temp) Stop matching Hygon devices
  x86/amd_nb: Restrict the northbridge framework to AMD CPUs
  x86/amd_node: Restrict SMN setup to AMD CPUs
  x86/hygon: Add Family 0x18 SMN access

 MAINTAINERS                       |   3 +
 arch/x86/Kconfig                  |   4 +
 arch/x86/include/asm/hygon/node.h | 191 ++++++
 arch/x86/kernel/Makefile          |   1 +
 arch/x86/kernel/amd_nb.c          |   6 +-
 arch/x86/kernel/amd_node.c        |   6 +-
 arch/x86/kernel/hygon_node.c      | 980 ++++++++++++++++++++++++++++++
 drivers/edac/amd64_edac.c         |   4 -
 drivers/hwmon/k10temp.c           |   3 +-
 drivers/ras/amd/atl/core.c        |   9 +-
 10 files changed, 1190 insertions(+), 17 deletions(-)
 create mode 100644 arch/x86/include/asm/hygon/node.h
 create mode 100644 arch/x86/kernel/hygon_node.c


base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
-- 
2.43.0

