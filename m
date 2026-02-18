Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD3827FB05;
	Wed, 18 Feb 2026 17:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771434183; cv=none; b=WocMuF632LNkqw2An8RzaGtaxvKFEs2SHClQcHqA0Mg/2iNviY9LvRav7rEDpzudLm8TYautpS1bxGwvX4szdnNDClU8cI0wZdUDzY3gFqYvRNYTMiA2wSBGYG5vnxCzMDVeGBgKiSDHhT3eWOHLfRYca+LsGuB1WXCAjD4flzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771434183; c=relaxed/simple;
	bh=7ixHhnajxdOxxx0q+7kFRn5X1IlfFCdzlkbTV3qPsjw=;
	h=Subject:To:Cc:From:Date:Message-Id; b=GxZkrY1Dzhu/pIl7Nn9PUMxjQvTJ52o9AgJ7BLGJfS9HcwvlvQlQLf/7ffkXEo65lnGnDdRpB9b2Ohp+rLyIJ0cMSiPxLzBoURaoWWHlIiocB9Yhq01OmyLwWQ1qvXAi0KVtRsXRW42H1Lm5IB9rwEuokO3Yd2JPPl4Zezi0vFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kEFtVtsq; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kEFtVtsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771434182; x=1802970182;
  h=subject:to:cc:from:date:message-id;
  bh=7ixHhnajxdOxxx0q+7kFRn5X1IlfFCdzlkbTV3qPsjw=;
  b=kEFtVtsqLzdtiB1NZhjpGqz0kKq8cusoWs8Dzwt7SCGfe9E24QZw5UGG
   D8gnRgREfowZB53knlP5V3DVCmYq1Z/aUweUkA9eKklr8U6VuPr+z4m/F
   2JghzhlehW9wA6/gwJTXFkeIesDxVVZplehN9CyEHrH8VITK4lCevqRW1
   8Cif+V2opKZACjTqZEGC5I80uoYogmDBkn6bDIYVxP4hEFM/oGJnGYHb7
   PEFhHVshakpNZ7bI5wt7x6fZDEgM5W5WCy058CKYWo/63uWnyxBWh/jzT
   cq7eX2Ez3uvKs/iyM6S5mN2wuA64EtjM+QsTMl1W80e3MroNhT1SFg7+d
   A==;
X-CSE-ConnectionGUID: XI9KtXj3RLO32aCg/0l6uA==
X-CSE-MsgGUID: h6Tz8iVPTKWwqBi4/mDIoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72558282"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="72558282"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 09:03:02 -0800
X-CSE-ConnectionGUID: 6ypO7inyQ2C4tSxaeYKC0A==
X-CSE-MsgGUID: L1Sk8jOXQHCJ4tzEimzrsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="219252877"
Received: from davehans-spike.ostc.intel.com (HELO localhost.localdomain) ([10.165.164.11])
  by orviesa005.jf.intel.com with ESMTP; 18 Feb 2026 09:03:02 -0800
Subject: [PATCH] peci: Remove dependency on x86 CPU variables
To: linux-kernel@vger.kernel.org
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Guenter Roeck <linux@roeck-us.net>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Iwona Winiarska <iwona.winiarska@intel.com>, linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org, Thomas Gleixner <tglx@kernel.org>, Tony Luck <tony.luck@intel.com>, x86@kernel.org
From: Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 18 Feb 2026 09:03:01 -0800
Message-Id: <20260218170301.D814B556@davehans-spike.ostc.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>


From: Dave Hansen <dave.hansen@linux.intel.com>

tl;dr: The non-x86 PECI driver #includes an arch/x86 header.  This is
ostensibly to avoid duplicating CPU model number constants, but the
result is complexity and duplicated *code* which is a far worse fate
than duplicated constants.

Remove the PECI dependency on arch/x86 by adding a list of supported
"target" CPU models in the driver.

This is only compile tested.

Long version:

== Background ==

The "PECI" driver runs on non-x86 hardware inside an x86 system.  It
talks to the x86 CPU. The PECI hardware has different features based on
platform generations and uses the CPU model to control feature
detections.

Basically, instead of a PCI or USB device ID that a USB or PCI driver
would use, the PECI driver uses the CPU model (and family).

The arch/x86 code unsurprisingly has a list of CPU model numbers and the
PECI code currently reuses that list. But the arch/x86 list is
maintained in the "Display" format which is different than the binary
format that CPUID (and PECI hardware) uses.

== Problem ==

The end result is that the PECI code #includes the arch/x86 constants
header and then duplicates some code that transforms the CPUID to the
"Display" format. This is fragile because it's easy for us x86 folks to
break the PECI driver when assuming that arch/x86 is x86-only.

== Solution ==

Remove the arch/x86 dependency. Instead of duplicating the
CPUID=>Display functionality, just duplicate the constants.

Also rename the formerly "x86_vfm" variables. They are not in the VFM
format any longer. They are purely device IDs.  Name them appropriately.

The result is a net code removal. The only downside is that the PECI
folks need to add a #define whenever there is a new CPU model. But, they
need to go add new CPU model to the driver explicitly *anyway*.

== Notes ==

One little wrinkle in this is that the CPU identifier that comes back
from the PECI hardware contains the CPU stepping just like
CPUID.01H:EAX. But the stepping is ignored by the PECI driver.

So, the PECI_INTEL_* identifiers are just defined with the stepping
shifted off the beginning. They could have been defined with a 0 there
and then have the stepping masked somewhere.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: openbmc@lists.ozlabs.org
Cc: Tony Luck <tony.luck@intel.com>
Cc: x86@kernel.org
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
---

 b/drivers/hwmon/peci/cputemp.c |   10 ++++-----
 b/drivers/peci/core.c          |    4 +--
 b/drivers/peci/cpu.c           |   16 +++++++--------
 b/drivers/peci/device.c        |   40 ++++++++++++---------------------------
 b/drivers/peci/internal.h      |    4 +--
 b/include/linux/peci-cpu.h     |   42 ++++++++++++++++-------------------------
 b/include/linux/peci.h         |    2 -
 7 files changed, 48 insertions(+), 70 deletions(-)

diff -puN drivers/peci/device.c~peci-sanity drivers/peci/device.c
--- a/drivers/peci/device.c~peci-sanity	2026-02-18 08:19:42.368396631 -0800
+++ b/drivers/peci/device.c	2026-02-18 08:55:48.107887339 -0800
@@ -57,39 +57,25 @@ static int peci_get_cpu_id(struct peci_d
 	if (ret)
 		goto out_req_free;
 
+	/*
+	 * The id that comes back from the hardware is in the raw
+	 * format of x86 CPUID.01H:EAX leaf and includes the CPU
+	 * Model, Family and Stepping.
+	 */
 	*cpu_id = peci_request_data_readl(req);
+
+	/*
+	 * Remove the stepping (CPUID.01H:EAX[3:0]) to match the
+	 * PECI_INTEL_* identifiers:
+	 */
+	*cpu_id >>= 4;
+
 out_req_free:
 	peci_request_free(req);
 
 	return ret;
 }
 
-static unsigned int peci_x86_cpu_family(unsigned int sig)
-{
-	unsigned int x86;
-
-	x86 = (sig >> 8) & 0xf;
-
-	if (x86 == 0xf)
-		x86 += (sig >> 20) & 0xff;
-
-	return x86;
-}
-
-static unsigned int peci_x86_cpu_model(unsigned int sig)
-{
-	unsigned int fam, model;
-
-	fam = peci_x86_cpu_family(sig);
-
-	model = (sig >> 4) & 0xf;
-
-	if (fam >= 0x6)
-		model += ((sig >> 16) & 0xf) << 4;
-
-	return model;
-}
-
 static int peci_device_info_init(struct peci_device *device)
 {
 	u8 revision;
@@ -100,7 +86,7 @@ static int peci_device_info_init(struct
 	if (ret)
 		return ret;
 
-	device->info.x86_vfm = IFM(peci_x86_cpu_family(cpu_id), peci_x86_cpu_model(cpu_id));
+	device->info.device_id = cpu_id;
 
 	ret = peci_get_revision(device, &revision);
 	if (ret)
diff -puN drivers/peci/internal.h~peci-sanity drivers/peci/internal.h
--- a/drivers/peci/internal.h~peci-sanity	2026-02-18 08:19:42.370396706 -0800
+++ b/drivers/peci/internal.h	2026-02-18 08:19:42.388397383 -0800
@@ -66,11 +66,11 @@ struct peci_request *peci_xfer_ep_mmio64
 /**
  * struct peci_device_id - PECI device data to match
  * @data: pointer to driver private data specific to device
- * @x86_vfm: device vendor-family-model
+ * @device_id: device identifier, includes CPU vendor-family-model
  */
 struct peci_device_id {
 	const void *data;
-	u32 x86_vfm;
+	u32 device_id;
 };
 
 extern const struct device_type peci_device_type;
diff -puN include/linux/peci.h~peci-sanity include/linux/peci.h
--- a/include/linux/peci.h~peci-sanity	2026-02-18 08:19:42.371396743 -0800
+++ b/include/linux/peci.h	2026-02-18 08:19:42.388397383 -0800
@@ -72,7 +72,7 @@ static inline struct peci_controller *to
 struct peci_device {
 	struct device dev;
 	struct {
-		u32 x86_vfm;
+		u32 device_id;
 		u8 peci_revision;
 		u8 socket_id;
 	} info;
diff -puN drivers/hwmon/peci/cputemp.c~peci-sanity drivers/hwmon/peci/cputemp.c
--- a/drivers/hwmon/peci/cputemp.c~peci-sanity	2026-02-18 08:19:42.373396819 -0800
+++ b/drivers/hwmon/peci/cputemp.c	2026-02-18 08:19:42.388397383 -0800
@@ -340,11 +340,11 @@ static int init_core_mask(struct peci_cp
 	int ret;
 
 	/* Get the RESOLVED_CORES register value */
-	switch (peci_dev->info.x86_vfm) {
-	case INTEL_ICELAKE_X:
-	case INTEL_ICELAKE_D:
-	case INTEL_SAPPHIRERAPIDS_X:
-	case INTEL_EMERALDRAPIDS_X:
+	switch (peci_dev->info.device_id) {
+	case PECI_INTEL_ICELAKE_X:
+	case PECI_INTEL_ICELAKE_D:
+	case PECI_INTEL_SAPPHIRERAPIDS_X:
+	case PECI_INTEL_EMERALDRAPIDS_X:
 		ret = peci_ep_pci_local_read(peci_dev, 0, reg->bus, reg->dev,
 					     reg->func, reg->offset + 4, &data);
 		if (ret)
diff -puN drivers/peci/core.c~peci-sanity drivers/peci/core.c
--- a/drivers/peci/core.c~peci-sanity	2026-02-18 08:19:42.375396894 -0800
+++ b/drivers/peci/core.c	2026-02-18 08:19:42.388397383 -0800
@@ -163,8 +163,8 @@ EXPORT_SYMBOL_NS_GPL(devm_peci_controlle
 static const struct peci_device_id *
 peci_bus_match_device_id(const struct peci_device_id *id, struct peci_device *device)
 {
-	while (id->x86_vfm != 0) {
-		if (id->x86_vfm == device->info.x86_vfm)
+	while (id->device_id != 0) {
+		if (id->device_id == device->info.device_id)
 			return id;
 		id++;
 	}
diff -puN include/linux/peci-cpu.h~peci-sanity include/linux/peci-cpu.h
--- a/include/linux/peci-cpu.h~peci-sanity	2026-02-18 08:19:42.376396932 -0800
+++ b/include/linux/peci-cpu.h	2026-02-18 08:19:42.388397383 -0800
@@ -6,31 +6,23 @@
 
 #include <linux/types.h>
 
-/* Copied from x86 <asm/processor.h> */
-#define X86_VENDOR_INTEL       0
-
-/* Copied from x86 <asm/cpu_device_id.h> */
-#define VFM_MODEL_BIT	0
-#define VFM_FAMILY_BIT	8
-#define VFM_VENDOR_BIT	16
-#define VFM_RSVD_BIT	24
-
-#define	VFM_MODEL_MASK	GENMASK(VFM_FAMILY_BIT - 1, VFM_MODEL_BIT)
-#define	VFM_FAMILY_MASK	GENMASK(VFM_VENDOR_BIT - 1, VFM_FAMILY_BIT)
-#define	VFM_VENDOR_MASK	GENMASK(VFM_RSVD_BIT - 1, VFM_VENDOR_BIT)
-
-#define VFM_MODEL(vfm)	(((vfm) & VFM_MODEL_MASK) >> VFM_MODEL_BIT)
-#define VFM_FAMILY(vfm)	(((vfm) & VFM_FAMILY_MASK) >> VFM_FAMILY_BIT)
-#define VFM_VENDOR(vfm)	(((vfm) & VFM_VENDOR_MASK) >> VFM_VENDOR_BIT)
-
-#define	VFM_MAKE(_vendor, _family, _model) (	\
-	((_model) << VFM_MODEL_BIT) |		\
-	((_family) << VFM_FAMILY_BIT) |		\
-	((_vendor) << VFM_VENDOR_BIT)		\
-)
-/* End of copied code */
-
-#include "../../arch/x86/include/asm/intel-family.h"
+/*
+ * These are in the format of and match the values of the x86
+ * CPUID.01H:EAX[19:4]. They encode the model and family of
+ * the CPU with which the driver is interfacing.
+ *
+ * All driver functionality is common across all CPU steppings
+ * of a given model, so the lower 4 stepping bits are excluded
+ * from these IDs.
+ */
+#define PECI_INTEL_HASWELL_X		0x306C
+#define PECI_INTEL_BROADWELL_X		0x406F
+#define PECI_INTEL_BROADWELL_D		0x5066
+#define PECI_INTEL_SKYLAKE_X		0x5065
+#define PECI_INTEL_ICELAKE_X		0x606A
+#define PECI_INTEL_ICELAKE_D		0x606C
+#define PECI_INTEL_SAPPHIRERAPIDS_X	0x806F
+#define PECI_INTEL_EMERALDRAPIDS_X	0xC06F
 
 #define PECI_PCS_PKG_ID			0  /* Package Identifier Read */
 #define  PECI_PKG_ID_CPU_ID		0x0000  /* CPUID Info */
diff -puN drivers/peci/cpu.c~peci-sanity drivers/peci/cpu.c
--- a/drivers/peci/cpu.c~peci-sanity	2026-02-18 08:19:42.380397082 -0800
+++ b/drivers/peci/cpu.c	2026-02-18 08:19:42.389397421 -0800
@@ -294,35 +294,35 @@ peci_cpu_probe(struct peci_device *devic
 
 static const struct peci_device_id peci_cpu_device_ids[] = {
 	{ /* Haswell Xeon */
-		.x86_vfm = INTEL_HASWELL_X,
+		.device_id = PECI_INTEL_HASWELL_X,
 		.data	= "hsx",
 	},
 	{ /* Broadwell Xeon */
-		.x86_vfm = INTEL_BROADWELL_X,
+		.device_id = PECI_INTEL_BROADWELL_X,
 		.data	= "bdx",
 	},
 	{ /* Broadwell Xeon D */
-		.x86_vfm = INTEL_BROADWELL_D,
+		.device_id = PECI_INTEL_BROADWELL_D,
 		.data	= "bdxd",
 	},
 	{ /* Skylake Xeon */
-		.x86_vfm = INTEL_SKYLAKE_X,
+		.device_id = PECI_INTEL_SKYLAKE_X,
 		.data	= "skx",
 	},
 	{ /* Icelake Xeon */
-		.x86_vfm = INTEL_ICELAKE_X,
+		.device_id = PECI_INTEL_ICELAKE_X,
 		.data	= "icx",
 	},
 	{ /* Icelake Xeon D */
-		.x86_vfm = INTEL_ICELAKE_D,
+		.device_id = PECI_INTEL_ICELAKE_D,
 		.data	= "icxd",
 	},
 	{ /* Sapphire Rapids Xeon */
-		.x86_vfm = INTEL_SAPPHIRERAPIDS_X,
+		.device_id = PECI_INTEL_SAPPHIRERAPIDS_X,
 		.data	= "spr",
 	},
 	{ /* Emerald Rapids Xeon */
-		.x86_vfm  = INTEL_EMERALDRAPIDS_X,
+		.device_id  = PECI_INTEL_EMERALDRAPIDS_X,
 		.data  = "emr",
 	},
 	{ }
_
