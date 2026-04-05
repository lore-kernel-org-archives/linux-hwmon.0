Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5101D798E;
	Sun,  5 Apr 2026 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775378437; cv=none; b=YIvUHpryyLvXFk+hsz4ANmdfCimUcR67B6BrCCvxW38KOa6fWOgvt437fqhWSR21OtaHa1YAucUM0Re36+VjQi0RbMaMvACVqUmbJdem8Ffl/3ZfOy6G8FDPbzlDbiY5wsiOb/l4STiBodQUKsiZ4Q9Us3Dg7XTYmDfPWapTswo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775378437; c=relaxed/simple;
	bh=abnGoYT4AjXq7czChA7IqaYysxusAYpXp6p3q5ZqE5A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l1LU9tTA+J2A2mBPEn3AtaFeRBXQBS6YhdsZKSfA7ouY4s84AK+3XplstctXKXqcd40g/3B3LCzKbuKKa9hm87DfYsKDUjDeIZbG33L+RqsZGcgZ1dcMpOYoUfCuuQZ+uYki191Py6CX0CjPajZuf4ap4kcJdFhXl2QRW/yjeYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 15509b2e30cb11f1aa26b74ffac11d73-20260405
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:87b483bb-bab6-40b9-b95f-58cb45181631,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:9d5e493e508edb9da9833d82b4cfaad6,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 15509b2e30cb11f1aa26b74ffac11d73-20260405
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1337628977; Sun, 05 Apr 2026 16:40:21 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: cryolitia@uniontech.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH 0/3] cleanups in hwmon gpd-fan
Date: Sun,  5 Apr 2026 16:40:15 +0800
Message-Id: <cover.1775378028.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi Maintainer,

Some cleanups in gpd-fan driver.
But I have no machine to test this patches, only have compile test.
Please have a look and test those! 

Thanks!

Pei Xiao (3):
  hwmon: (gpd-fan): remove global variable gpd_driver_priv
  hwmon: (gpd-fan): upgrade log level from warn to err for platform
    device creation failure
  hwmon: (gpd-fan): rename enum constants to uppercase as per kernel
    coding style

 drivers/hwmon/gpd-fan.c | 273 +++++++++++++++++++++-------------------
 1 file changed, 147 insertions(+), 126 deletions(-)

-- 
2.25.1

