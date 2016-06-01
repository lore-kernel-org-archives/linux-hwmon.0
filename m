Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:39547 "EHLO mail.skyhub.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751718AbcFAKEl (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 1 Jun 2016 06:04:41 -0400
From: Borislav Petkov <bp@alien8.de>
To: X86 ML <x86@kernel.org>
Cc: linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Rui Huang <ray.huang@amd.com>,
	Sherry Hurwitz <sherry.hurwitz@amd.com>
Subject: [PATCH] x86/cpu/AMD: Extend X86_FEATURE_TOPOEXT workaround to newer models
Date: Wed,  1 Jun 2016 12:04:28 +0200
Message-Id: <1464775468-23355-1-git-send-email-bp@alien8.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

We need to reenable the topology extensions CPUID leafs on newer models
too, if BIOS has disabled them, as we rely on them to get proper compute
unit topology.

Make the printk a once thing, while at it.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: Rui Huang <ray.huang@amd.com>
Cc: Sherry Hurwitz <sherry.hurwitz@amd.com>
---
 arch/x86/kernel/cpu/amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
index c343a54bed39..f5c69d8974e1 100644
--- a/arch/x86/kernel/cpu/amd.c
+++ b/arch/x86/kernel/cpu/amd.c
@@ -674,14 +674,14 @@ static void init_amd_bd(struct cpuinfo_x86 *c)
 	u64 value;
 
 	/* re-enable TopologyExtensions if switched off by BIOS */
-	if ((c->x86_model >= 0x10) && (c->x86_model <= 0x1f) &&
+	if ((c->x86_model >= 0x10) && (c->x86_model <= 0x6f) &&
 	    !cpu_has(c, X86_FEATURE_TOPOEXT)) {
 
 		if (msr_set_bit(0xc0011005, 54) > 0) {
 			rdmsrl(0xc0011005, value);
 			if (value & BIT_64(54)) {
 				set_cpu_cap(c, X86_FEATURE_TOPOEXT);
-				pr_info(FW_INFO "CPU: Re-enabling disabled Topology Extensions Support.\n");
+				pr_info_once(FW_INFO "CPU: Re-enabling disabled Topology Extensions Support.\n");
 			}
 		}
 	}
-- 
2.7.3

