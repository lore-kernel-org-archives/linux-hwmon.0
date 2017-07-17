Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36767 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751366AbdGQQZX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2017 12:25:23 -0400
From: Arvind Yadav <arvind.yadav.cs@gmail.com>
To: jdelvare@suse.com, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: i5k_amb: constify pci_device_id.
Date: Mon, 17 Jul 2017 21:55:10 +0530
Message-Id: <f6ecfc5c18a47e7b16d58ab55c562b0414595a8c.1500308632.git.arvind.yadav.cs@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

pci_device_id are not supposed to change at runtime. All functions
working with pci_device_id provided by <linux/pci.h> work with
const pci_device_id. So mark the non-const structs as const.

File size before:
   text	   data	    bss	    dec	    hex	filename
   3562	    320	      8	   3890	    f32	drivers/hwmon/i5k_amb.o

File size After adding 'const':
   text	   data	    bss	    dec	    hex	filename
   3658	    224	      8	   3890	    f32	drivers/hwmon/i5k_amb.o

Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
---
 drivers/hwmon/i5k_amb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
index a5a9f45..9397d2f 100644
--- a/drivers/hwmon/i5k_amb.c
+++ b/drivers/hwmon/i5k_amb.c
@@ -495,7 +495,7 @@ static struct {
 };
 
 #ifdef MODULE
-static struct pci_device_id i5k_amb_ids[] = {
+static const struct pci_device_id i5k_amb_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_5000_ERR) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_5400_ERR) },
 	{ 0, }
-- 
2.7.4

