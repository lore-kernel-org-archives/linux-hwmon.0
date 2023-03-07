Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BEA0C6FA99
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Mar 2023 20:30:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbjCGUaa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Mar 2023 15:30:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbjCGUa2 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Mar 2023 15:30:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E53EA401C;
        Tue,  7 Mar 2023 12:30:28 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BB234B8117B;
        Tue,  7 Mar 2023 20:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F2FC433EF;
        Tue,  7 Mar 2023 20:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678221025;
        bh=OV9LjmA3247aRZRuDHnhf9KD4L9rzgVFBggTDMNVUaQ=;
        h=From:To:Cc:Subject:Date:From;
        b=np6JV4kcSv1ghArF/8lHNNh9xXPu/rvFX/AEmDiH5MQHkFQ4otaVtB9ISQ5ZWcPcp
         4XNQ+scpx/IwFA0FQc2Cc9JCnUsLtVmtlEGVUzfXHQWFO/isjt8z3VYLxhlkvV370Y
         bYHi42hOi6V0gIlJMpaAyuT3OjRWEA6nCWmDTA9IaOkpYOnYqQiw9Jc9EcBEH3Xzir
         8cC1IaXjY8aRZ1ZMTyX3r0uepR+2OpDnhK2GOPgabBCyyW2xGNp/G4kd9LLJ4S95m0
         GWj5ZhGc+zIfCQenYipaeQLHYcS5TobLQ6h/rYt06gXeh5aY+EsGJ7EtSANhUaPvmR
         T4zZwruQd+6hw==
From:   Bjorn Helgaas <helgaas@kernel.org>
To:     Jon Mason <jdmason@kudzu.us>
Cc:     Serge Semin <fancer.lancer@gmail.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Allen Hubbe <allenbh@gmail.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, ntb@lists.linux.dev,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] ntb: idt: drop redundant pci_enable_pcie_error_reporting()
Date:   Tue,  7 Mar 2023 14:30:21 -0600
Message-Id: <20230307203021.881866-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Bjorn Helgaas <bhelgaas@google.com>

pci_enable_pcie_error_reporting() enables the device to send ERR_*
Messages.  Since f26e58bf6f54 ("PCI/AER: Enable error reporting when AER is
native"), the PCI core does this for all devices during enumeration, so the
driver doesn't need to do it itself.

Remove the redundant pci_enable_pcie_error_reporting() call from the
driver.  Also remove the corresponding pci_disable_pcie_error_reporting()
from the driver .remove() path.

Note that this only controls ERR_* Messages from the device.  An ERR_*
Message may cause the Root Port to generate an interrupt, depending on the
AER Root Error Command register managed by the AER service driver.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/ntb/hw/idt/ntb_hw_idt.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
index 0ed6f809ff2e..7192ff59dd91 100644
--- a/drivers/ntb/hw/idt/ntb_hw_idt.c
+++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
@@ -2651,20 +2651,18 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
 	}
 
 	/*
-	 * Enable the device advanced error reporting. It's not critical to
+	 * The PCI core enables device error reporting. It's not critical to
 	 * have AER disabled in the kernel.
+	 *
+	 * Cleanup nonfatal error status before getting to init.
 	 */
-	ret = pci_enable_pcie_error_reporting(pdev);
-	if (ret != 0)
-		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
-	else /* Cleanup nonfatal error status before getting to init */
-		pci_aer_clear_nonfatal_status(pdev);
+	pci_aer_clear_nonfatal_status(pdev);
 
 	/* First enable the PCI device */
 	ret = pcim_enable_device(pdev);
 	if (ret != 0) {
 		dev_err(&pdev->dev, "Failed to enable PCIe device\n");
-		goto err_disable_aer;
+		return ret;
 	}
 
 	/*
@@ -2692,8 +2690,6 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
 
 err_clear_master:
 	pci_clear_master(pdev);
-err_disable_aer:
-	(void)pci_disable_pcie_error_reporting(pdev);
 
 	return ret;
 }
@@ -2714,9 +2710,6 @@ static void idt_deinit_pci(struct idt_ntb_dev *ndev)
 	/* Clear the bus master disabling the Request TLPs translation */
 	pci_clear_master(pdev);
 
-	/* Disable the AER capability */
-	(void)pci_disable_pcie_error_reporting(pdev);
-
 	dev_dbg(&pdev->dev, "NT-function PCIe interface cleared");
 }
 
-- 
2.25.1

