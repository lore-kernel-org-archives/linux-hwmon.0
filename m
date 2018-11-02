Return-Path: <Brian.Woods@amd.com>
Return-path: <Brian.Woods@amd.com>
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
	"x86@kernel.org" <x86@kernel.org>, Clemens Ladisch <clemens@ladisch.de>, Jean
 Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Bjorn
 Helgaas <bhelgaas@google.com>, "Woods, Brian" <Brian.Woods@amd.com>, Pu Wen
	<puwen@hygon.cn>, Jia Zhang <qianyue.zj@alibaba-inc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: [PATCH 2/4] x86/amd_nb: add support for newer PCI topologies
Date: Fri, 2 Nov 2018 18:11:07 +0000
Message-ID: <20181102181055.130531-3-brian.woods@amd.com>
References: <20181102181055.130531-1-brian.woods@amd.com>
In-Reply-To: <20181102181055.130531-1-brian.woods@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>

Add support for new processors which have multiple PCI root complexes
per data fabric/SMN interface.  The interfaces per root complex are
redundant and should be skipped.  This makes sure the DF/SMN interfaces
get accessed via the correct root complex.

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
 arch/x86/kernel/amd_nb.c | 41 +++++++++++++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 19d489ee2b1e..c0bf26aeb7c3 100644
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
@@ -226,26 +229,52 @@ int amd_cache_northbridges(void)
=20
 	misc =3D NULL;
 	while ((misc =3D next_northbridge(misc, misc_ids)) !=3D NULL)
-		i++;
+		misc_count++;
=20
-	if (!i)
+	root =3D NULL;
+	while ((root =3D next_northbridge(root, root_ids)) !=3D NULL)
+		root_count++;
+
+	if (!misc_count)
 		return -ENODEV;
=20
-	nb =3D kcalloc(i, sizeof(struct amd_northbridge), GFP_KERNEL);
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
+		 * If there are more root devices than data fabric/SMN,
+		 * interfaces, then the root devices per DF/SMN
+		 * interface are redundant and N-1 should be skipped so
+		 * they aren't mapped incorrectly.
+		 */
+		for (j =3D 1; j < roots_per_misc; j++)
+			root =3D next_northbridge(root, root_ids);
 	}
=20
 	if (amd_gart_present())
--=20
2.11.0
