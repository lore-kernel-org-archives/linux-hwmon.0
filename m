Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.122
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792654956;
	b=m71OuKCrwZRZsMX2fSk1UzHg8JmjRJ4pLFgvuhl3ZNOkVoPKKFmuUn5abDBkUW2W68/E
	 u496KhatZ0Gq9IUJrT7gCUe5Y7jg4cRQMoqkcy9AerMRPFJxiNx7NabvOMTR0jI6Ezgah
	 aAFdUwVN+2HeON7G8+6Fw5wKOoHzQbu3mlO/4icQhN2WlLXQzvHoIkURHEaKMaLgPEzQO
	 7R2SpVK6bXBA2FS8Dn7e4LRYWLucHcHRMOMwx1fdUDrACtjD1XQgTZGrQF0hNhH0WveLi
	 4G0Rv0hIbHR42+aCtBDGyuk/NYwiGaUvKTMWQaUAIjbMypk4eD4G8SMfy9TMvKCUJKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792654956;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Cd3z3ZXL9rcgF9rv5BtFdenKHDU7UPEfJnVQ8lYJhF4=;
	b=q6FGII145oEMwepnEnRkZ8eo/8k4QZ8NwVYdJUjHDrNNaUCeCoeQURWL1m33IYZkmuCB
	 BSbUe3pPFC1ZcpxZoijDatPf84afBkN2dSV2WNVzDjCysmTOEVo+bdsW/MeetIRqLAJOY
	 ceHRY13BG41RJKlXFO/rO/apj/NfP6tZ/B+g58QHcWLi7h2GRDWTZ0sL9nZaeMTjmvKp0
	 crINIfTpXImvyIEuQjyU7rnF39mgY3jiyWNIIT8B7KulQL2ZxqLynqiO3nc+6ACbtNieZ
	 lPam8JrEWiBBnb/TavWCcQQVFgIM5WQCkCB59zvHOcMqJoUzz040IQR4Rs9gB2HQjVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.122
Received: from out28-122.mail.aliyun.com (out28-122.mail.aliyun.com [115.124.28.122])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9FE606A319;
	Thu, 22 Oct 2026 07:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F9FE606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07658315|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.121067-0.0168798-0.862054;FP=4693402100946556363|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=14;RT=14;SR=0;TI=SMTPD_---.jn83zPl_1792654940;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jn83zPl_1792654940 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 15:42:25 +0800
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
	Guenter Roeck <linux@roeck-us.net>,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/7] x86/hygon: Add Family 0x18 DF node enumeration and SMN access
Date: Thu, 22 Oct 2026 15:42:10 +0800
Message-ID: <20261022074218.667049-1-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
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

v8 addresses Yazen's comments on v7. The node and SMN helpers remain
local to hygon_node.c until Hygon consumers are added upstream. The
cache-build warning for -ENODEV is suppressed in guests; other errors
and bare-metal warnings are unchanged.

Patch 6 depends on "hwmon: (k10temp) Stop matching Hygon devices",
which Guenter has applied to hwmon-next. It is not in mainline yet and
must be merged before patch 6; otherwise k10temp still binds on Hygon
and its SMN reads fail.

The scope is unchanged. The series adds Hygon Data Fabric (DF) node
enumeration and SMN access. AMD NB/SMN initialization and EDAC/ATL
matching are restricted to AMD CPUs. Hygon EDAC and ATL support will
be submitted separately.

Tested v8 on a Family 0x18 Model 0x07 system with 2 sockets, 12 Core
and DDR Dies (CDDs) and 4 I/O Dies (IODs).

Changes in v8:

  - Keep unused node and SMN interfaces local. (Yazen)
  - Avoid the -ENODEV cache-build warning in guests. (Yazen)
  - Align the CPU-to-DF assignments. (Yazen)
  - Simplify the AMD SMN commit message. (Yazen)
  - Add a separate HYGON NODE DRIVER entry instead of changing
    HYGON PROCESSOR SUPPORT.

Link: https://lore.kernel.org/20261009090111.151878-1-wanglin@open-hieco.net # v7
Link: https://lore.kernel.org/20261017145226.GA359037@yaz-khff2.amd.com # v7 1/7 review
Link: https://lore.kernel.org/20261017153308.GE359037@yaz-khff2.amd.com # v7 6/7 review
Link: https://lore.kernel.org/b292d054-f0cf-4695-94a2-40f0d71563f8@roeck-us.net # k10temp applied

Lin Wang (7):
  x86/hygon: Add Family 0x18 DF node enumeration
  x86/hygon: Map CPU NodeIds to DF nodes
  EDAC/amd64: Stop matching Hygon CPUs
  RAS/AMD/ATL: Match AMD CPUs only
  x86/amd_nb: Restrict the northbridge framework to AMD CPUs
  x86/amd_node: Restrict SMN setup to AMD CPUs
  x86/hygon: Add Family 0x18 SMN access

 MAINTAINERS                       |   7 +
 arch/x86/Kconfig                  |   4 +
 arch/x86/include/asm/hygon/node.h |  41 ++
 arch/x86/kernel/Makefile          |   1 +
 arch/x86/kernel/amd_nb.c          |   6 +-
 arch/x86/kernel/amd_node.c        |   6 +-
 arch/x86/kernel/hygon_node.c      | 882 ++++++++++++++++++++++++++++++
 drivers/edac/amd64_edac.c         |   4 -
 drivers/ras/amd/atl/core.c        |   9 +-
 9 files changed, 945 insertions(+), 15 deletions(-)
 create mode 100644 arch/x86/include/asm/hygon/node.h
 create mode 100644 arch/x86/kernel/hygon_node.c

base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.43.0

