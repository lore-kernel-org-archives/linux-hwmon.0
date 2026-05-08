Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6693F7863
	for <linux-hwmon@vger.kernel.org>; Fri,  8 May 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778251184; cv=none; b=Bgh4lBnGox7LrxXvsd5aPGfTKzM5+B/ilaeNda58ASA/HfvI5DOyJnfOImSPN7dQYBzcov3XVmow5S68knpu5jIfkaT0fkQu0eE66RG2JbG2LlsYLDSOfK/EkvzSSCZeS0wvB954xOHs2DDc99MasFdxQzyeA4hjIRD17MmH77A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778251184; c=relaxed/simple;
	bh=31W/5XKpkAMY1zC1qNeJsdkWRstLcS7xST8lQtSJUbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=himjlY9SfNJ+zTYbFhvVTUZorPl51ucDaATd8m2X/UnVwJ1PrE5B5SswPR5JRFX6mJz3xiw3t1+1YJXnz35OKBctyLVXahFAV3YT6QuMIZOms5YMpEK4nzt/u9kEAyga/I8tWzI63CjVbKYrofIZbv5j6c3H/8AjELFTn0ABDtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3eJNuHR; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3eJNuHR"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82748257f5fso2009536b3a.1
        for <linux-hwmon@vger.kernel.org>; Fri, 08 May 2026 07:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778251181; x=1778855981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BukObmuQhhla3rszXKyimKykJhX+xj56H9yvwH31YK0=;
        b=P3eJNuHRCjtQk4xasygMIm7/qwdVEuNyAQ0Ii2X/0IN2jhfRACAAv66cnIuyAcaJjb
         0M4PO72udD/jPVk9sNQEJhON+ninBvWVcxDZVZYxymn14Jumik4Rxn0OPmXwRdMoagLu
         HLmNa3aA0ffkKLfHcxfZ7TvpDfO5RTs3nWrksmt+AAxzJp/baaNfJRRHrrTNgKVaH8Ip
         JwdXkbYn32kmAXtmpvbrOAivw/hRi4n5den4XWk6Oa+/MeXLNSA+Rq9amH7JbyRVVO3N
         2HxHkj/fVhS3Qh/zi8srnZdweW6Mg6iiCIPorK7kmTZrI9Fkaq32MPnqe36/Ow2ZDc+m
         n+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778251181; x=1778855981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BukObmuQhhla3rszXKyimKykJhX+xj56H9yvwH31YK0=;
        b=k99Lv5V8Z6J0syUVJug3ITy9PB0w4ybEB4YxWg/fR5AKLCqbuiGSkq1xX3CBze3N3r
         AF5HC9LHSvAFYBrUqyuuQhpFtvtLz61Fi/QlRn9Rdmtn76/bZNmgccnjvaDeasKUciEX
         s684U+8CF5KxX8avWkd2Uejc9bNXOTEg7AG0mmnQs0GWli+qlxEeX5sPD45yZ4euLV7F
         Ts4DrCTcIefyWW7/0LTmt5XmSh84TOzZwZXY4U0pdEOLrVddaAJ/fvXVIDwPbQJcGy1o
         yqdu+FNJA70xRWCnpGhf5zmPpFUpI/bVhTy94CJX5h5/BwEv+S82ydoyulb5CLdeT6S5
         MNaA==
X-Forwarded-Encrypted: i=1; AFNElJ8pWTk/grXl7K5WI8UX2ZPWUpiF0WYZcqf5SOY+qWkAxHhZCe1XiTe8j/tiviVARTW2VhelabiLu/5a5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxXWYgXqcKuII2WZnlCVGUvzBnN8VWwsgF6eq8RP2MnaOzZwsb
	GtWzWqm4vffMM3oV+CHFfHKDA58+sWaZEF/owWUW5ga26vApfc/zrDBM
X-Gm-Gg: AeBDiesFZG2hKPb3GwcSoM+8ImpTkW7EO+jqW5NddvGLiZBbFZBsjpGKWa7FiJf7sT0
	RMJyBI653+QvBNgZ15BjJu/DBhpsZu3nZxLOgVYVwzkJwyUMDRycmvmkPVebHyyVsZ1dZj9DhDw
	dpaK5F4fYXaK5fLPjlo6ly1r1447mVjgq/WmL/9n9naV3i7OqtH7tcK5P8xXvKouK1xDLOOc40k
	XRwUx2cNZ3XE/r5CVYOHPpdDPsVrwpp/NSVRsozeA8T5cfA5DDVF9aWqhBK8k2zal46R5jATql0
	BsVsbxLsqKovQgd72ZvmuBsoZRexVEAvxsjO1NK0jUr1iNTlgk4j40tIF3mFww44YSinDCqymhi
	82xBPSoLaScUjuP80kzNqEwa832/bxvc64X7mXvh2GGLEkefbYZwI6YDTcc8/eVa08otuD12uOD
	4s2iNNEiX6mfwHdQisyu++7//tTk6oNw==
X-Received: by 2002:a05:6a00:398f:b0:82f:2985:2094 with SMTP id d2e1a72fcca58-83bb8986717mr6204550b3a.30.1778251180759;
        Fri, 08 May 2026 07:39:40 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm12395499b3a.38.2026.05.08.07.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 07:39:40 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	linux-usb@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [PATCH v4 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Date: Fri,  8 May 2026 23:39:09 +0900
Message-ID: <20260508143910.14673-2-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508143910.14673-1-hurryman2212@gmail.com>
References: <20260508143910.14673-1-hurryman2212@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

AMD Promontory 21 (PROM21) xHCI controllers use generic xHCI
operation, but the PCI function also exposes optional
controller-specific sensor functionality. Add a small PROM21 PCI glue
driver for AMD 1022:43fd controllers.

The driver delegates USB host operation to the common xhci-pci core and
creates a "hwmon" auxiliary device for optional child drivers. Failure
to create the auxiliary device is logged but does not fail the xHCI
probe, since the auxiliary device is only needed for sensor support.

Keep the PROM21 PCI glue built-in only when enabled because it owns the
PCI binding for PROM21 xHCI controllers and must be available whenever
the common built-in xhci-pci driver hands those controllers off. This
avoids an early boot case where generic xhci-pci rejects a PROM21
controller but a modular xhci-pci-prom21 driver is not available in the
initramfs, leaving USB devices behind that controller unavailable.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 drivers/usb/host/Kconfig           |  18 +++++
 drivers/usb/host/Makefile          |   1 +
 drivers/usb/host/xhci-pci-prom21.c | 111 +++++++++++++++++++++++++++++
 drivers/usb/host/xhci-pci.c        |  11 +++
 4 files changed, 141 insertions(+)
 create mode 100644 drivers/usb/host/xhci-pci-prom21.c

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 0a277a07cf70..74eedef1440d 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -42,6 +42,24 @@ config USB_XHCI_PCI
 	depends on USB_PCI
 	default y
 
+config USB_XHCI_PCI_PROM21
+	bool "AMD Promontory 21 xHCI PCI support"
+	depends on USB_XHCI_PCI=y
+	select AUXILIARY_BUS
+	help
+	  Say 'Y' to enable support for the AMD Promontory 21 xHCI PCI
+	  controller with optional sensor support. This driver does not add
+	  PROM21-specific USB or xHCI operation. It binds PROM21 xHCI PCI
+	  functions, delegates USB host operation to the common xHCI PCI core,
+	  and creates auxiliary devices for optional sensor drivers.
+
+	  This driver is built-in only because it owns the PCI binding for
+	  PROM21 xHCI controllers when enabled and must be available whenever
+	  the common xHCI PCI driver is available. The optional sensor driver
+	  can still be built as a module.
+
+	  If unsure, say 'N'.
+
 config USB_XHCI_PCI_RENESAS
 	tristate "Support for additional Renesas xHCI controller with firmware"
 	depends on USB_XHCI_PCI
diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
index a07e7ba9cd53..174580c1281a 100644
--- a/drivers/usb/host/Makefile
+++ b/drivers/usb/host/Makefile
@@ -71,6 +71,7 @@ obj-$(CONFIG_USB_UHCI_HCD)	+= uhci-hcd.o
 obj-$(CONFIG_USB_FHCI_HCD)	+= fhci.o
 obj-$(CONFIG_USB_XHCI_HCD)	+= xhci-hcd.o
 obj-$(CONFIG_USB_XHCI_PCI)	+= xhci-pci.o
+obj-$(CONFIG_USB_XHCI_PCI_PROM21)	+= xhci-pci-prom21.o
 obj-$(CONFIG_USB_XHCI_PCI_RENESAS)	+= xhci-pci-renesas.o
 obj-$(CONFIG_USB_XHCI_PLATFORM) += xhci-plat-hcd.o
 obj-$(CONFIG_USB_XHCI_HISTB)	+= xhci-histb.o
diff --git a/drivers/usb/host/xhci-pci-prom21.c b/drivers/usb/host/xhci-pci-prom21.c
new file mode 100644
index 000000000000..7354a898732e
--- /dev/null
+++ b/drivers/usb/host/xhci-pci-prom21.c
@@ -0,0 +1,111 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Promontory 21 xHCI host controller PCI Bus Glue.
+ *
+ * This does not add any PROM21-specific USB or xHCI operation. It exists only
+ * to publish an auxiliary device for integrated temperature sensor support.
+ *
+ * Copyright (C) 2026 Jihong Min <hurryman2212@gmail.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device/devres.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/slab.h>
+#include <linux/usb.h>
+#include <linux/usb/hcd.h>
+
+#include "xhci-pci.h"
+
+struct prom21_xhci_auxdev {
+	struct auxiliary_device *auxdev;
+};
+
+static void prom21_xhci_auxdev_release(struct device *dev, void *res)
+{
+	struct prom21_xhci_auxdev *prom21_auxdev = res;
+
+	auxiliary_device_destroy(prom21_auxdev->auxdev);
+}
+
+static int prom21_xhci_create_auxdev(struct pci_dev *pdev)
+{
+	struct prom21_xhci_auxdev *prom21_auxdev;
+
+	prom21_auxdev = devres_alloc(prom21_xhci_auxdev_release,
+				     sizeof(*prom21_auxdev), GFP_KERNEL);
+	if (!prom21_auxdev)
+		return -ENOMEM;
+
+	prom21_auxdev->auxdev =
+		auxiliary_device_create(&pdev->dev, KBUILD_MODNAME, "hwmon",
+					NULL, (pci_domain_nr(pdev->bus) << 16) |
+						      pci_dev_id(pdev));
+	if (!prom21_auxdev->auxdev) {
+		devres_free(prom21_auxdev);
+		return -ENOMEM;
+	}
+
+	devres_add(&pdev->dev, prom21_auxdev);
+	return 0;
+}
+
+static void prom21_xhci_destroy_auxdev(struct pci_dev *pdev)
+{
+	devres_release(&pdev->dev, prom21_xhci_auxdev_release, NULL, NULL);
+}
+
+static int prom21_xhci_probe(struct pci_dev *dev,
+			     const struct pci_device_id *id)
+{
+	int retval;
+
+	retval = xhci_pci_common_probe(dev, id);
+	if (retval)
+		return retval;
+
+	retval = prom21_xhci_create_auxdev(dev);
+	if (retval) {
+		/*
+		 * The auxiliary device only provides optional temperature sensor
+		 * support. Keep the xHCI controller usable if it fails.
+		 */
+		dev_err(&dev->dev,
+			"failed to create PROM21 hwmon auxiliary device: %d\n",
+			retval);
+	}
+
+	return 0;
+}
+
+static void prom21_xhci_remove(struct pci_dev *dev)
+{
+	prom21_xhci_destroy_auxdev(dev);
+	xhci_pci_remove(dev);
+}
+
+static const struct pci_device_id pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, 0x43fd) }, /* PROM21 xHCI */
+	{ /* end: all zeroes */ }
+};
+MODULE_DEVICE_TABLE(pci, pci_ids);
+
+static struct pci_driver prom21_xhci_driver = {
+	.name = "xhci-pci-prom21",
+	.id_table = pci_ids,
+
+	.probe = prom21_xhci_probe,
+	.remove = prom21_xhci_remove,
+
+	.shutdown = usb_hcd_pci_shutdown,
+	.driver = {
+		.pm = pm_ptr(&usb_hcd_pci_pm_ops),
+	},
+};
+module_pci_driver(prom21_xhci_driver);
+
+MODULE_DESCRIPTION("AMD Promontory 21 xHCI PCI Host Controller Driver");
+MODULE_IMPORT_NS("xhci");
+MODULE_LICENSE("GPL");
diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index 585b2f3117b0..5db427ad0422 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -84,6 +84,7 @@
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_3			0x43ba
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_2			0x43bb
 #define PCI_DEVICE_ID_AMD_PROMONTORYA_1			0x43bc
+#define PCI_DEVICE_ID_AMD_PROM21_XHCI			0x43fd
 
 #define PCI_DEVICE_ID_ATI_NAVI10_7316_XHCI		0x7316
 
@@ -696,12 +697,22 @@ static const struct pci_device_id pci_ids_renesas[] = {
 	{ /* end: all zeroes */ }
 };
 
+/* handled by xhci-pci-prom21 if enabled */
+static const struct pci_device_id pci_ids_prom21[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_PROM21_XHCI) },
+	{ /* end: all zeroes */ }
+};
+
 static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 {
 	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_RENESAS) &&
 			pci_match_id(pci_ids_renesas, dev))
 		return -ENODEV;
 
+	if (IS_ENABLED(CONFIG_USB_XHCI_PCI_PROM21) &&
+	    pci_match_id(pci_ids_prom21, dev))
+		return -ENODEV;
+
 	return xhci_pci_common_probe(dev, id);
 }
 
-- 
2.53.0

