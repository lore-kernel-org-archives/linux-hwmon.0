Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F133F59C;
	Mon, 31 Aug 2026 01:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788140723; cv=none; b=R3PIE2uanYE6uZLP2Pq1uaRVRsC+iF/cZ/BJr3BTq5B4Z36D3lP7wwLLA44QiHocFsn9K8LwjsQnZ1DRGvnYImSU3oo8ymWx6ooIh3YyL2UZSsfMDNfitQw2bydYRQgMYWy/L4k6se5iftnhGDZ1bz1gcHOIbynQxTN/IU9jSlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788140723; c=relaxed/simple;
	bh=d9uVwdU4WDoUh0QvrSwru9NwXB50H4tN6N81chI1N0c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GpxtgVqBsLjFDFFGSdb5f/Z15vaLsZ5ZJEddrB28BtQWfovQEiTbE0vYbTYBFNKP7fRBrjksKeX9MW5t66EK3vMxzFGiXvx8A4z1a8tu3byTBA17cWWOu0fQLDOPKnOWYTaC7aW5T4fqhxdBaI99rV1F+9TEenkRjeAKEUwv7Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 9cbc69eaa4dd11f19a56ed5b684f684d-20260831
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:ea649328-ce7f-4b58-9b62-998cfbf65437,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:9eb7d2f049c285a0ee066a373d2dba82,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898|915,TC:nil,Content:0|15|50,EDM:-3,
	IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 9cbc69eaa4dd11f19a56ed5b684f684d-20260831
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1958100061; Mon, 31 Aug 2026 09:45:14 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Marius Zachmann <mail@mariuszachmann.de>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2] hwmon: (corsair-cpro) Create debugfs entries after hwmon registration
Date: Mon, 31 Aug 2026 09:45:09 +0800
Message-Id: <20260831014509.3352442-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccp_debugfs_init() registers debugfs files whose private data is the devm
allocated ccp.  It runs before hwmon_device_register_with_info(), so when
that registration fails, ccp_probe() returns with the files still in
place.  The HID core then frees ccp, and ccp_remove() is not called for a
failed probe, so nothing removes them later either.  Reading one of the
files dereferences the freed pointer.

Create the debugfs entries only after the hwmon device has been
registered, so no failing path can leave them behind.

The two version queries stay where they are.  They send USB commands
without holding ccp->mutex, which is only safe as long as nothing else
can call send_usb_cmd(); once the hwmon device is registered its
callbacks can do so concurrently.  Only the debugfs creation moves, and
it is told which queries succeeded.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@smtp.kernel.org/
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Fixes: 5997eb60f896 ("hwmon: (corsair-cpro) Add firmware and bootloader information")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---

Notes (v2changelog):
    v2: Create the debugfs entries after hwmon registration instead of
        removing them on the error path, as suggested by Guenter Roeck.  The
        version queries stay before the registration.
    Link: https://lore.kernel.org/linux-hwmon/20260828061949.3151191-1-lilinmao@kylinos.cn/

 drivers/hwmon/corsair-cpro.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index 8354a002f4c5..56de0fe0f544 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -566,21 +566,18 @@ static int bootloader_show(struct seq_file *seqf, void *unused)
 }
 DEFINE_SHOW_ATTRIBUTE(bootloader);
 
-static void ccp_debugfs_init(struct ccp_device *ccp)
+static void ccp_debugfs_init(struct ccp_device *ccp, bool fw_valid, bool bl_valid)
 {
 	char name[32];
-	int ret;
 
 	scnprintf(name, sizeof(name), "corsaircpro-%s", dev_name(&ccp->hdev->dev));
 	ccp->debugfs = debugfs_create_dir(name, NULL);
 
-	ret = get_fw_version(ccp);
-	if (!ret)
+	if (fw_valid)
 		debugfs_create_file("firmware_version", 0444,
 				    ccp->debugfs, ccp, &firmware_fops);
 
-	ret = get_bl_version(ccp);
-	if (!ret)
+	if (bl_valid)
 		debugfs_create_file("bootloader_version", 0444,
 				    ccp->debugfs, ccp, &bootloader_fops);
 }
@@ -588,6 +585,7 @@ static void ccp_debugfs_init(struct ccp_device *ccp)
 static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct ccp_device *ccp;
+	bool fw_valid, bl_valid;
 	int ret;
 
 	ccp = devm_kzalloc(&hdev->dev, sizeof(*ccp), GFP_KERNEL);
@@ -632,7 +630,13 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		goto out_hw_close;
 
-	ccp_debugfs_init(ccp);
+	/*
+	 * Query the versions before registering the hwmon device: they send
+	 * USB commands without holding ccp->mutex, which is only safe while
+	 * nothing else can call send_usb_cmd().
+	 */
+	fw_valid = !get_fw_version(ccp);
+	bl_valid = !get_bl_version(ccp);
 
 	ccp->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "corsaircpro",
 							 ccp, &ccp_chip_info, NULL);
@@ -641,6 +645,8 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto out_hw_close;
 	}
 
+	ccp_debugfs_init(ccp, fw_valid, bl_valid);
+
 	return 0;
 
 out_hw_close:

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.25.1

