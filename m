Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr710077.outbound.protection.outlook.com ([40.107.71.77]:4676
        "EHLO NAM05-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727268AbeKGFf0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 7 Nov 2018 00:35:26 -0500
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
Subject: [PATCH v2 2/4] x86/amd_nb: add support for newer PCI topologies
Date: Tue, 6 Nov 2018 20:08:16 +0000
Message-ID: <20181106200754.60722-3-brian.woods@amd.com>
References: <20181106200754.60722-1-brian.woods@amd.com>
In-Reply-To: <20181106200754.60722-1-brian.woods@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Add support for new processors which have multiple PCI root complexes
per data fabric/system management network interface.  If there are (N)
multiple PCI roots per DF/SMN interface, then the PCI roots are
redundant (as far as SMN/DF access goes).  For each DF/SMN interface:
map to the first available PCI root and skip the next N-1 PCI roots so
the following DF/SMN interface get mapped to a correct PCI root.

Ex:
DF/SMN 0 -> 60
	    40
	    20
	    00
DF/SMN 1 -> e0
	    c0
	    a0
	    80

Signed-off-by: Brian Woods <brian.woods@amd.com>
---
 arch/x86/kernel/amd_nb.c | 44 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 19d489ee2b1e..cc34266e3c62 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -213,7 +213,10 @@ int amd_cache_northbridges(void)
 	const struct pci_device_id *root_ids =3D amd_root_ids;
 	struct pci_dev *root, *misc, *link;
 	struct amd_northbridge *nb;
-	u16 i =3D 0;
+	u16 roots_per_misc =3D 0;
+	u16 misc_count =3D 0;
+	u16 root_count =3D 0;
+	u16 i, j;
=20
 	if (amd_northbridges.num)
 		return 0;
@@ -226,26 +229,55 @@ int amd_cache_northbridges(void)
=20
 	misc =3D NULL;
 	while ((misc =3D next_northbridge(misc, misc_ids)) !=3D NULL)
-		i++;
+		misc_count++;
=20
-	if (!i)
+	if (!misc_count)
 		return -ENODEV;
=20
-	nb =3D kcalloc(i, sizeof(struct amd_northbridge), GFP_KERNEL);
+	root =3D NULL;
+	while ((root =3D next_northbridge(root, root_ids)) !=3D NULL)
+		root_count++;
+
+	if (root_count) {
+		roots_per_misc =3D root_count / misc_count;
+
+		/*
+		 * There should be _exactly_ N roots for each DF/SMN
+		 * interface.
+		 */
+		if (!roots_per_misc || (root_count % roots_per_misc)) {
+			pr_info("Unsupported AMD DF/PCI configuration found\n");
+			return -ENODEV;
+		}
+	}
+
+	nb =3D kcalloc(misc_count, sizeof(struct amd_northbridge), GFP_KERNEL);
 	if (!nb)
 		return -ENOMEM;
=20
 	amd_northbridges.nb =3D nb;
-	amd_northbridges.num =3D i;
+	amd_northbridges.num =3D misc_count;
=20
 	link =3D misc =3D root =3D NULL;
-	for (i =3D 0; i !=3D amd_northbridges.num; i++) {
+	for (i =3D 0; i < amd_northbridges.num; i++) {
 		node_to_amd_nb(i)->root =3D root =3D
 			next_northbridge(root, root_ids);
 		node_to_amd_nb(i)->misc =3D misc =3D
 			next_northbridge(misc, misc_ids);
 		node_to_amd_nb(i)->link =3D link =3D
 			next_northbridge(link, link_ids);
+
+		/*
+		 * If there are more PCI root devices than data fabric/
+		 * system management network interfaces, then the (N)
+		 * PCI roots per DF/SMN interface are functionally the
+		 * same (for DF/SMN access) and N-1 are redundant.  N-1
+		 * PCI roots should be skipped per DF/SMN interface so
+		 * the following DF/SMN interfaces get mapped to
+		 * correct PCI roots.
+		 */
+		for (j =3D 1; j < roots_per_misc; j++)
+			root =3D next_northbridge(root, root_ids);
 	}
=20
 	if (amd_gart_present())
--=20
2.11.0
