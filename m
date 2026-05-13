Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205E92E11A6
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 13:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679150; cv=none; b=oGIf6YvAadiFbCPrKcF2uVtak+oInmhO5+6tBBv4qxai6h8jCbI1HbvlO8yJokrTxeTfQjid0bG2IwfeHqDTlIVGQRpvyZnh7QYBtdd/+Ll+/tw0QppPF+fyoOtxD/t0jZmSO+Wd18MFjHScYiRmp2tWie0y+jb94ic6qOrXnRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679150; c=relaxed/simple;
	bh=NXorX92yHQ5zo3++4WCWch8ji7TTThSLko44OAaV2fM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAqwOO6GZ2nUpxkDRxK40Hw7PsavpR7NfQBRSOzDw19c1oRCFxhi0ldE2eEhMo517rJivehYLPUfm37Y1AepZOACzm0v/SK0u/5zhvnG7qarqRZiAEapNEXSvQEwHQfw5w+c5WDRGXV1IwD3Rwu0qi+cUqAVsG2ltGDr1nh6bJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=M2WSsu+g; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="M2WSsu+g"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id C9B75240028
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 15:32:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1778679139; bh=RXIeif85BWe0YLX6yZ5TQEOc5dfCF/ZdiOdkb6wxE2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=M2WSsu+giymrM3NrIJyJvc5yeivDixoslKhXYEPVUAWvQVUEnyepr98cggcdLpxWH
	 N2ImPs3mZy5Z1IL/XEqVeuq5FPe95Ru0jNNvXsOrXTGbmKpUjqPWu9P9c3OPudN2u6
	 dDF7HyP+J/h1ujBWxO8lubRfqsjJd5P4NVcBS9p+uYFuSYtyC08piZzyuKWpee5PHf
	 7klhkAMwFWOK/zvpTqRlwhGVhStlNmlh7TZk8ySAdGJWMQdhf1qqSa2iookRRJ/Ait
	 QTZ96iIIBhqaHyG3hTFGnRYYhCyjCBJj+FR6t4CmrTk9s921+4Mt4INc+ExouBsCEf
	 Agk7c9hdB9uKg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gFvX30mM1z6txT;
	Wed, 13 May 2026 15:32:18 +0200 (CEST)
Date: Wed, 13 May 2026 13:32:19 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: corsair-psu: fix and readd locking of command buffer
Message-ID: <agR9YW7hGTJ_l7ms@monster.localdomain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix removed locking mechanism. The locking mechanism does protect
chained commands (set rail + get value), which are two separate calls
to the low level access function. The hwmon (temps for example) and
debugfs (uptimes for example) subsystem can trigger that chain of
commands in parallel. The serialization in the hw monioring core alone
is not enough.

Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
---
 drivers/hwmon/corsair-psu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 76f3e1da68d0..6db899b37ede 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -12,6 +12,7 @@
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -122,6 +123,7 @@ struct corsairpsu_data {
 	struct device *hwmon_dev;
 	struct dentry *debugfs;
 	struct completion wait_completion;
+	struct mutex lock; /* serializes chained commands and parallel debugfs/hwmon access */
 	u8 *cmd_buffer;
 	char vendor[REPLY_SIZE];
 	char product[REPLY_SIZE];
@@ -194,12 +196,14 @@ static int corsairpsu_init(struct corsairpsu_data *priv)
 	/*
 	 * PSU_CMD_INIT uses swapped length/command and expects 2 parameter bytes, this command
 	 * actually generates a reply, but we don't need it
+	 * only runs during probe/resume and does not switch rails, no locking required
 	 */
 	return corsairpsu_usb_cmd(priv, PSU_CMD_INIT, 3, 0, NULL);
 }
 
 static int corsairpsu_fwinfo(struct corsairpsu_data *priv)
 {
+	/* only runs in probe and does not switch rails, no locking required */
 	int ret;
 
 	ret = corsairpsu_usb_cmd(priv, 3, PSU_CMD_VEND_STR, 0, priv->vendor);
@@ -217,6 +221,7 @@ static int corsairpsu_request(struct corsairpsu_data *priv, u8 cmd, u8 rail, voi
 {
 	int ret;
 
+	mutex_lock(&priv->lock);
 	switch (cmd) {
 	case PSU_CMD_RAIL_VOLTS_HCRIT:
 	case PSU_CMD_RAIL_VOLTS_LCRIT:
@@ -226,13 +231,17 @@ static int corsairpsu_request(struct corsairpsu_data *priv, u8 cmd, u8 rail, voi
 	case PSU_CMD_RAIL_WATTS:
 		ret = corsairpsu_usb_cmd(priv, 2, PSU_CMD_SELECT_RAIL, rail, NULL);
 		if (ret < 0)
-			return ret;
+			goto cmd_fail;
 		break;
 	default:
 		break;
 	}
 
-	return corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
+	ret = corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
+
+cmd_fail:
+	mutex_unlock(&priv->lock);
+	return ret;
 }
 
 static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8 rail, long *val)
@@ -789,6 +798,7 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
 
 	priv->hdev = hdev;
 	hid_set_drvdata(hdev, priv);
+	mutex_init(&priv->lock);
 	init_completion(&priv->wait_completion);
 
 	hid_device_io_start(hdev);
-- 
2.54.0

