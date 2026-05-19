Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CF83A1CF3;
	Tue, 19 May 2026 06:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779173559; cv=none; b=BmBEY+7PCStylGH0VEfq0+Qp5GEblYIDkFqgtmqa9lwTpKrCWxP0py43FRWkG4Lzo0Fr54DIJ3nKsTEpUhPDWlqEjdmoPpebmoR4TwGTweFW0Lve0kh9YSJs70aZFb2UWg4RKs81eIQoZqrUlLM1G6MFtdzYx/wooog4wulMQWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779173559; c=relaxed/simple;
	bh=PdQjRuyTcIw5ZZZJExkkeHuFKGvjUWBPh4xDf5x1X7Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HuODA/h0KRktEPxYD0f4YPW7lplSECeZ0KL/xU+KdMuREMK8xQHv3tNBrwzhvbdPgCEQQ08DbJTXlj8F7GqRaK0BKCwiN2HTRIL4ZEELBT2RthiSCQKFhhzYm4QUTqdIQs6ol6eMWAxvPI2ZjzrxKw7AFMtGpTV69ztnwLDeG2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 4ca3b72c534f11f1aa26b74ffac11d73-20260519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:f129f6c0-26c4-48cc-8c91-1c13fde9e0bb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:-20,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:a258afc3b2c4b812d535e325676b8d95,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:1,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4ca3b72c534f11f1aa26b74ffac11d73-20260519
X-User: jindongyang@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jindongyang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1562369693; Tue, 19 May 2026 14:52:27 +0800
From: Dongyang Jin <jindongyang@kylinos.cn>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dongyang Jin <jindongyang@kylinos.cn>
Subject: [PATCH] hwmon: (coretemp) Replace sprintf() with sysfs_emit() for sysfs show functions
Date: Tue, 19 May 2026 14:52:20 +0800
Message-Id: <20260519065220.2348524-1-jindongyang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace sprintf() with sysfs_emit() in sysfs show functions.  sysfs_emit()
is preferred for formatting sysfs output because it provides safer bounds
checking.  No functional changes.

Signed-off-by: Dongyang Jin <jindongyang@kylinos.cn>
---
 drivers/hwmon/coretemp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 02b4e46d965b..074e46624701 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -346,9 +346,9 @@ static ssize_t show_label(struct device *dev,
 	struct temp_data *tdata = container_of(devattr, struct temp_data, sd_attrs[ATTR_LABEL]);
 
 	if (is_pkg_temp_data(tdata))
-		return sprintf(buf, "Package id %u\n", pdata->pkg_id);
+		return sysfs_emit(buf, "Package id %u\n", pdata->pkg_id);
 
-	return sprintf(buf, "Core %u\n", tdata->cpu_core_id);
+	return sysfs_emit(buf, "Core %u\n", tdata->cpu_core_id);
 }
 
 static ssize_t show_crit_alarm(struct device *dev,
@@ -362,7 +362,7 @@ static ssize_t show_crit_alarm(struct device *dev,
 	rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
 	mutex_unlock(&tdata->update_lock);
 
-	return sprintf(buf, "%d\n", (eax >> 5) & 1);
+	return sysfs_emit(buf, "%d\n", (eax >> 5) & 1);
 }
 
 static ssize_t show_tjmax(struct device *dev,
@@ -375,7 +375,7 @@ static ssize_t show_tjmax(struct device *dev,
 	tjmax = get_tjmax(tdata, dev);
 	mutex_unlock(&tdata->update_lock);
 
-	return sprintf(buf, "%d\n", tjmax);
+	return sysfs_emit(buf, "%d\n", tjmax);
 }
 
 static ssize_t show_ttarget(struct device *dev,
@@ -390,7 +390,7 @@ static ssize_t show_ttarget(struct device *dev,
 
 	if (ttarget < 0)
 		return ttarget;
-	return sprintf(buf, "%d\n", ttarget);
+	return sysfs_emit(buf, "%d\n", ttarget);
 }
 
 static ssize_t show_temp(struct device *dev,
@@ -417,7 +417,7 @@ static ssize_t show_temp(struct device *dev,
 	}
 
 	mutex_unlock(&tdata->update_lock);
-	return sprintf(buf, "%d\n", tdata->temp);
+	return sysfs_emit(buf, "%d\n", tdata->temp);
 }
 
 static int create_core_attrs(struct temp_data *tdata, struct device *dev)
-- 
2.25.1

