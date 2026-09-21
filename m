Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0108441D100;
	Mon, 21 Sep 2026 21:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025200; cv=none; b=MDDycKiiux2aZswRZsOMDDshZJZyTxcZ7Cqi+R/RY/G3CHj9ModblkCYk2JgeZH0DgNNWnsH0SVCrkHK+uqE1v+dSgt8rM0q71z/Ty5n+KQNQTyCf3dHpVa8zkGJM+7fQUU6bgojckwUmnhT16TpSokd7Je8W+LJCTaOOpLjCpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025200; c=relaxed/simple;
	bh=vuxF0tT/4H/YrgJAF9NXDN2bm0i+QS0Nr4RNaPKvF6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ia2DCvs/yiCNvQaEgeJ88LbNbWlrzKIaw4v7HYvGI3wV3iS80cj3Ho1YusQ+zR+/NZmkofakYhSesVcKPnVh94OUI22LejqMphRmJRzZ2cX/8w5EU/8+iv2juliuIp7kV5m3eKM5JmPaMrQ1NjpUbaZQXmzRuJaUnHZP6HmmD74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me; spf=pass smtp.mailfrom=bojanowski.me; dkim=pass (2048-bit key) header.d=bojanowski.me header.i=@bojanowski.me header.b=x4O8Gvt0; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bojanowski.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bojanowski.me header.i=@bojanowski.me header.b="x4O8Gvt0"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hpbYR5WcdzMlK6;
	Mon, 21 Sep 2026 23:13:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bojanowski.me;
	s=MBO0001; t=1790025195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a45yGg271L92VcG3Hi31wCGLy3re1FRWuPnSJk8yCtA=;
	b=x4O8Gvt0thau175s0vOQZcqAqpk+3EJxEgK09+aWVNp64wbkFP1w8hg0H3DbUk+fykXKFW
	DizMNyZoyVO7Dr28VQ+KMNhFGHY9kvXu3TLElpN+jCumtRWCb2DNTXpIbRTm9QiBO5u4rg
	1pK3jr1UiG0pbGqOuoZKkrFc0u+LZ+FEwCvlrbRomiMewJI9QzXM78WkRyUpxBaTlPLocP
	zJwEK+pDYXczQnzR55GT5oQTDtk8VuS9aluliK9y9TQzstR9+YmI811Kqcm1yQ1Pc2Zk2s
	VmiHuNuqqcfmKKdanKdiKwQbi2Yts3GArR51H82ScJ887ZTwrpSo1pug4+YrpA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of tomasz@bojanowski.me designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=tomasz@bojanowski.me
From: Tomasz Bojanowski <tomasz@bojanowski.me>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nct6683) Add MSI B850M to list of tested boards
Date: Mon, 21 Sep 2026 23:13:04 +0200
Message-ID: <20260921211304.74729-1-tomasz@bojanowski.me>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4hpbYR5WcdzMlK6

Tested on MSI MAG B850M MORTAR WIFI with NCT6687D EC firmware version
0.0 build 03/10/25. The driver loads without force=1 and reports
voltages, fan speeds and temperatures.

Signed-off-by: Tomasz Bojanowski <tomasz@bojanowski.me>
---
 Documentation/hwmon/nct6683.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 45eec9dd3..1af148b92 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -69,4 +69,5 @@ ASRock Z590 Taichi		NCT6686D EC firmware version 1.0 build 01/25/21
 MSI B550			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI X670-P			NCT6687D EC firmware version 0.0 build 09/27/22
 MSI X870E			NCT6687D EC firmware version 0.0 build 11/13/24
+MSI B850M			NCT6687D EC firmware version 0.0 build 03/10/25
 ===============================	===============================================
-- 
2.55.0

