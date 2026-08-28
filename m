Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE761DD525;
	Fri, 28 Aug 2026 06:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787898003; cv=none; b=KD5K4ytH4AX7KX0ex+6J1bjGR2QLQ3iwhOUAJMBn/GgHbb9T1SHgVpPGcZeG+7hSKZmXhwH0/Ql2CYjfZg7dAFkJ42oJJLZx2myl71G8D5mRTIzcsJIzsKRrvU5X9dFMeCtb/NNrR9CiGhYH962T4ArmiPOMJoXj7DZ3VCiVsLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787898003; c=relaxed/simple;
	bh=U57/6HxdLKbO73Zgh0fPUForuH9k2X5IT2+0bwdt9Vw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pFlTyacs0PcAo7CZSTfoXTjlNH/za/c8bkT3CVet7J50K4Fq3mkjmIqXIbLloANPdeurDG2vxa0owkBLGl9laV9Y6KeaMyh63y5blAIkWiJIL2Q0QnQ3EpBi6RFeyPBBntXCyijvDVkrDsd4xoKSwC3Jsxvxz8WLrkiHC8/fSjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 7b81dc42a2a811f19a56ed5b684f684d-20260828
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:20eac171-d0f7-4460-a2e8-b1b0b40bf22e,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:7db8b62,CLOUDID:dfbfa6586f803bbc87e82d7a94c1e2a9,BulkI
	D:nil,BulkQuantity:0,SF:102|850|865|898|915,TC:nil,Content:0|15|50,EDM:-3,
	IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 7b81dc42a2a811f19a56ed5b684f684d-20260828
X-User: lilinmao@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lilinmao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 757687888; Fri, 28 Aug 2026 14:19:53 +0800
From: Linmao Li <lilinmao@kylinos.cn>
To: Marius Zachmann <mail@mariuszachmann.de>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linmao Li <lilinmao@kylinos.cn>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] hwmon: (corsair-cpro) Remove debugfs entries when probe fails
Date: Fri, 28 Aug 2026 14:19:49 +0800
Message-Id: <20260828061949.3151191-1-lilinmao@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccp_debugfs_init() registers debugfs files whose private data is the devm
allocated ccp.  If hwmon_device_register_with_info() fails right after it,
ccp_probe() returns without removing them: the HID core then frees ccp,
and ccp_remove() is not called for a failed probe, so the files stay
behind.  Reading one of them dereferences the freed pointer.

Remove the debugfs entries on that error path.  debugfs_remove_recursive()
waits for readers already inside the show callbacks, so ccp is no longer
reachable through debugfs by the time probe returns.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hwmon/20260708031612.BD7E61F000E9@smtp.kernel.org/
Fixes: 5997eb60f896 ("hwmon: (corsair-cpro) Add firmware and bootloader information")
Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
---
 drivers/hwmon/corsair-cpro.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/corsair-cpro.c b/drivers/hwmon/corsair-cpro.c
index 8354a002f4c5..30fe5d8e724c 100644
--- a/drivers/hwmon/corsair-cpro.c
+++ b/drivers/hwmon/corsair-cpro.c
@@ -638,11 +638,13 @@ static int ccp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 							 ccp, &ccp_chip_info, NULL);
 	if (IS_ERR(ccp->hwmon_dev)) {
 		ret = PTR_ERR(ccp->hwmon_dev);
-		goto out_hw_close;
+		goto out_debugfs_remove;
 	}
 
 	return 0;
 
+out_debugfs_remove:
+	debugfs_remove_recursive(ccp->debugfs);
 out_hw_close:
 	hid_hw_close(hdev);
 	hid_device_io_stop(hdev);

base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
-- 
2.25.1

