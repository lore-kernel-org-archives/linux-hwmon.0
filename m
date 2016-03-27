Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from fallback6.mail.ru ([94.100.181.147]:33676 "EHLO
	fallback6.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752766AbcC0S2p (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 27 Mar 2016 14:28:45 -0400
Received: from smtp4.mail.ru (smtp4.mail.ru [94.100.179.57])
	by fallback6.mail.ru (mPOP.Fallback_MX) with ESMTP id 077112397754
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Mar 2016 21:13:47 +0300 (MSK)
Received: from dynamic-adsl-84-220-81-196.clienti.tiscali.it ([84.220.81.196]:57577 helo=enterprise)
	by smtp4.mail.ru with esmtpa (envelope-from <trek00@inbox.ru>)
	id 1akFC3-0005vK-U8
	for linux-hwmon@vger.kernel.org; Sun, 27 Mar 2016 21:13:44 +0300
Date: Sun, 27 Mar 2016 20:13:40 +0200
From: Trek <trek00@inbox.ru>
To: linux-hwmon@vger.kernel.org
Subject: fam15h_power on a4-4000?
Message-ID: <20160327201340.152ff142@enterprise>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MP_/oSI2Lcr7wkI7VHoVafy6peG"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

--MP_/oSI2Lcr7wkI7VHoVafy6peG
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

reading the specs, it seems to me that the a4-4000 processor (amd fam
15h model 13h) has the tdp running average feature, implemented in
the fam15h_power module:

  D18F5xE0, page 456, BKDG for AMD Family 15h Models 10h-1Fh Processors
  http://support.amd.com/TechDocs/42300_15h_Mod_10h-1Fh_BKDG.pdf

if this assumption is correct, the module fails to probe the device
only because the pci id to query is different, so the attached patch
should fix the detection

it is untested as i'm not familiar with the hardware and i really
appreciate some suggestion from an expert here

c-ya!
--MP_/oSI2Lcr7wkI7VHoVafy6peG
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=fam15h_power-10h.diff

diff -ur linux/drivers/hwmon/fam15h_power.c linux-fam15h_power-10h/drivers/hwmon/fam15h_power.c
--- linux/drivers/hwmon/fam15h_power.c	2016-03-27 19:54:32.176763010 +0200
+++ linux-fam15h_power-10h/drivers/hwmon/fam15h_power.c	2016-03-27 20:00:02.048765885 +0200
@@ -304,6 +304,7 @@
 
 static const struct pci_device_id fam15h_power_id_table[] = {
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_NB_F4) },
+	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M10H_NB_F4) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M30H_NB_F4) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M60H_NB_F4) },
 	{ PCI_VDEVICE(AMD, PCI_DEVICE_ID_AMD_15H_M70H_NB_F4) },
diff -ur linux/include/linux/pci_ids.h linux-fam15h_power-10h/include/linux/pci_ids.h
--- linux/include/linux/pci_ids.h	2016-03-27 19:55:45.768763651 +0200
+++ linux-fam15h_power-10h/include/linux/pci_ids.h	2016-03-27 20:00:22.724766065 +0200
@@ -521,6 +521,7 @@
 #define PCI_DEVICE_ID_AMD_11H_NB_MISC	0x1303
 #define PCI_DEVICE_ID_AMD_11H_NB_LINK	0x1304
 #define PCI_DEVICE_ID_AMD_15H_M10H_F3	0x1403
+#define PCI_DEVICE_ID_AMD_15H_M10H_NB_F4 0x1404
 #define PCI_DEVICE_ID_AMD_15H_M30H_NB_F3 0x141d
 #define PCI_DEVICE_ID_AMD_15H_M30H_NB_F4 0x141e
 #define PCI_DEVICE_ID_AMD_15H_M60H_NB_F3 0x1573

--MP_/oSI2Lcr7wkI7VHoVafy6peG--
