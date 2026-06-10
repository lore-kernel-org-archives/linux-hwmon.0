Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E268B30595C;
	Wed, 10 Jun 2026 01:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781056168; cv=none; b=raRGsbKX1LhbVmZgAxSOgqjEFi1hJcEYJNH8mayUS/o05wI/N/sGLSqdCnNpHr6H9cOorxJyYar0Rbi2j6AdkVikaej+n0fu6qcLhvjBXGSjOUK3Z264M9eCRL7puVlXqSMEZcSZCvt/vSofR7qjU4qmqYHEUpIOMp71tvqd1Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781056168; c=relaxed/simple;
	bh=TiUW8Q3P3HLa5IGcMKFIsYgEPn8dE+G4TgtQ2vzs834=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h3M/PqaSXWw7wGIXfCq9IayauKpU/JmclUQvC3d7QZvaGk5unsKZjWEQ0dTLBOt0pOclP3+xTGZUlxJKxYkV06ZkqQde26dhfRaYePAt+MGnNOaIyP6WKyrcstQoW8zQChRcSYd/+jcUF78ERIsNA5RlgbMvVYepYtW+PehK52o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 973d16b8646e11f1aa26b74ffac11d73-20260610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:fb541baa-a0ad-4837-8393-0c214662956a,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:0f514b73f9609692674e2cb27f5d519f,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|865|898,TC:nil,Content:0|15|50,E
	DM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:
	0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 973d16b8646e11f1aa26b74ffac11d73-20260610
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1088125046; Wed, 10 Jun 2026 09:49:17 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: cryolitia@uniontech.com,
	Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH v4 0/4] some cleanup and fix in gpd-fan
Date: Wed, 10 Jun 2026 09:49:08 +0800
Message-Id: <cover.1781055639.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

changes in v4:
1. Add a missing sob in  
hwmon: (gpd-fan): drop global driver data and use per-device
    allocation

changes in v3:
1.All patches add v3 version tags

changes in v2:
1.Add a new patch for fix race condition between device removal and sysfs
access.
2.Platform_create_bundle pass a driver_data pointer 
3.gpd_init_ec needed before hwmon registration as a separate patch

Pei Xiao (4):
  hwmon: (gpd-fan): drop global driver data and use per-device
    allocation
  hwmon: (gpd-fan): Initialize EC before registering hwmon device
  hwmon: (gpd-fan): upgrade log level from warn to err for platform
    device creation failure
  hwmon: (gpd-fan): fix race condition between device removal and sysfs
    access

 drivers/hwmon/gpd-fan.c | 226 ++++++++++++++++++++++------------------
 1 file changed, 125 insertions(+), 101 deletions(-)

-- 
2.25.1

