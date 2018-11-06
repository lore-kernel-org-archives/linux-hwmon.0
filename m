Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr710077.outbound.protection.outlook.com ([40.107.71.77]:4676
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726463AbeKGFf1 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Nov 2018 00:35:27 -0500
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "Woods, Brian" <Brian.Woods@amd.com>, Pu Wen <puwen@hygon.cn>,
        Jia Zhang <qianyue.zj@alibaba-inc.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: [PATCH v2 3/4] x86/amd_nb: add PCI device IDs for F17h M30h
Date: Tue, 6 Nov 2018 20:08:18 +0000
Message-ID: <20181106200754.60722-4-brian.woods@amd.com>
References: <20181106200754.60722-1-brian.woods@amd.com>
In-Reply-To: <20181106200754.60722-1-brian.woods@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add the PCI device IDs for family 17h model 30h, since they are needed
for accessing various registers via the data fabric/SMN interface.

Signed-off-by: Brian Woods <brian.woods@amd.com>
---
 arch/x86/kernel/amd_nb.c | 6 ++++++
 include/linux/pci_ids.h  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index cc34266e3c62..cc51275c8759 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -16,8 +16,10 @@
=20
 #define PCI_DEVICE_ID_AMD_17H_ROOT	0x1450
 #define PCI_DEVICE_ID_AMD_17H_M10H_ROOT	0x15d0
+#define PCI_DEVICE_ID_AMD_17H_M30H_ROOT	0x1480
 #define PCI_DEVICE_ID_AMD_17H_DF_F4	0x1464
 #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F4 0x15ec
+#define PCI_DEVICE_ID_AMD_17H_M30H_DF_F4 0x1494
=20
 /* Protect the PCI config register pairs used for SMN and DF indirect acce=
ss. */
 static DEFINE_MUTEX(smn_mutex);
@@ -27,9 +29,11 @@ static u32 *flush_words;
 static const struct pci_device_id amd_root_ids[] =3D {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_ROOT) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_ROOT) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_ROOT) },
 	{}
 };
=20
+
 #define PCI_DEVICE_ID_AMD_CNB17H_F4     0x1704
=20
 const struct pci_device_id amd_nb_misc_ids[] =3D {
@@ -43,6 +47,7 @@ const struct pci_device_id amd_nb_misc_ids[] =3D {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F3) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F3) },
 	{}
 };
@@ -56,6 +61,7 @@ static const struct pci_device_id amd_nb_link_ids[] =3D {
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_16H_M30H_NB_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M10H_DF_F4) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_17H_M30H_DF_F4) },
 	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_CNB17H_F4) },
 	{}
 };
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 78d5cd29778a..349276fbd269 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -547,6 +547,7 @@
 #define PCI_DEVICE_ID_AMD_16H_M30H_NB_F4 0x1584
 #define PCI_DEVICE_ID_AMD_17H_DF_F3	0x1463
 #define PCI_DEVICE_ID_AMD_17H_M10H_DF_F3 0x15eb
+#define PCI_DEVICE_ID_AMD_17H_M30H_DF_F3 0x1493
 #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
 #define PCI_DEVICE_ID_AMD_LANCE		0x2000
 #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
--=20
2.11.0
