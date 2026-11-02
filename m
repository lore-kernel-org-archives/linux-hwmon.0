Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672864;
	b=yFJTeOXoVuWYKeVaFXwiOsE9SzI95qHAcTmr5AlZ4NpcYR6KdrUBPdXq4ZjT6YdW+XwU
	 7hgm3IZ8MWXzccBSo1dkQYuJla9ZBGQZwD9vR36uc/NuJY8o0xRQM50t/YhiFxnd3VLnP
	 j1QWjxzDvrmrKhMAUIpRRas0tIVMngn5WLs0+ZW9q7Y0GmNvkEeC34W25i5Qtpgu02bx3
	 oblEttiZc8HEBt0O7PVYZlLX6UbAl7mo+KYg5b4126kA765feCsI7twsnfhZg3PJYqZ6u
	 Vlfn/xHqJgUhrDuXtGIP9Jjo806401kccoTekSeuvQ+FB5VrpSATKOA6CLYJmHTFOKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672864;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=6U3bLMPGLy4TacpUKpD/dpo7KdOmZsg0ANp0Knp1rig=;
	b=LvyalwQEU9GchW12iIp0QIB2mkfPGkIwMD5mdqsx5OxeahJplHgFfJZX3lArB1rh2D/w
	 gqDZpbS724BH++vYJu/MZqn3vWhy/hbt/FZH9az5IyDCl/UjH2a6HD2058vPd9+4uDFAE
	 2EqWuMUQz9oo32VTw36NeXPVCTAi7W5M9Qkjz86KUoIiGZ2DIq1vKGVoE/wbV6t3+DAtF
	 g28uvPHBaRZQCHNy3/idOyABOn8gbGlRus0DBVLLGha+qTDiASU9Q3WTjmGeFkEPH7+1V
	 Fk62N5xNAyvOkm4yInqi7u43UbBAjzK5SEwk9yGTdPWR0ER4KphBn8KU3wjnGM0LWLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vzIjuKG+;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E77606A327
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 02:27:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E77606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=vzIjuKG+
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id O10WxOtOnv0ndO4FTxCT1A; Tue, 03 Nov 2026 02:27:43 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O4FSxowbsmTkmO4FSxnR7T; Tue, 03 Nov 2026 02:27:42 +0000
X-Authority-Analysis: v=2.4 cv=eKsTjGp1 c=1 sm=1 tr=0 ts=6ae9469e
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=edvktuduleVQ9f6P3rIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=6U3bLMPGLy4TacpUKpD/dpo7KdOmZsg0ANp0Knp1rig=; b=vzIjuKG+HxxJ
	BWBiY6F3FrtN1Kq+Sgrn33fjJf1WOIXIL5K5LXthH8IqmBFy00xNOnOAhe6VKh8FhkxS5iN16+/ea
	YwWOfUJCy/anFFdI1Zc5n1k5sF+YrhG+ACZ5Wb2LCIfUwNFArmKorjtHKDYVD4WNbrXKV0jdeYm5W
	PaLbrZ3ajC/9ie+qOxE2xV40YQYtC+krVblDXxk6jLz98pk27/0Ua8ifmJSBG7tSs+r6ptvvijW09
	Is2Ws2+x7MiJxC6CCYMEJFpvy4ArZoyhWjVBJVZMavhMdvCyizWJaM9rfX4+u9iiRB4PqWzutV9CU
	/VyvS0zS7l2Jpsk0CsA0OQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:38198 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0wa-00000003lxk-2Xrr;
	Tue, 03 Nov 2026 04:26:00 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 074/102] hwmon: (sch5636) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:52:07 -0800
Message-ID: <20261102225235.334487-75-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261102225235.334487-1-linux@roeck-us.net>
References: <20261102225235.334487-1-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xO0wa-00000003lxk-2Xrr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:38198
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOg8Ja4pCJt+MlOYgSo7g2Tpu96tYOqiNARs3j5CFTDsS8azzhX0+YkrYDUWp17B4PE60Uu1ivDG1Vccb9ft1SLoEzJqW5u53TqgO1QxiEqgCEUwdJVi
 fmRUk70gOqgeyjMA2bUuUv03xGwlerH5abajEbeFk+ag/t44PxzEu1xuGbbQWoNL+opz8/HqB+dJNB2+pH/nGTq4pCUfVYTvTbX550RkiZRchKJ2MGpRrEQ4

sch5636 uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 0772a6407939 ("hwmon: New driver sch5636")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/sch5636.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/sch5636.c b/drivers/hwmon/sch5636.c
index 8c9b6e24d09f..2aaca407be7b 100644
--- a/drivers/hwmon/sch5636.c
+++ b/drivers/hwmon/sch5636.c
@@ -57,7 +57,7 @@ struct sch5636_data {
 
 	struct mutex update_lock;
 	bool valid;			/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;		/* In jiffies */
 	u8 in[SCH5636_NO_INS];
 	u8 temp_val[SCH5636_NO_TEMPS];
 	u8 temp_ctrl[SCH5636_NO_TEMPS];
@@ -74,7 +74,8 @@ static struct sch5636_data *sch5636_update_device(struct device *dev)
 	mutex_lock(&data->update_lock);
 
 	/* Cache the values for 1 second */
-	if (data->valid && !time_after(jiffies, data->last_updated + HZ))
+	if (data->valid &&
+	    !time_after64(get_jiffies_64(), data->last_updated + HZ))
 		goto abort;
 
 	for (i = 0; i < SCH5636_NO_INS; i++) {
@@ -139,7 +140,7 @@ static struct sch5636_data *sch5636_update_device(struct device *dev)
 		}
 	}
 
-	data->last_updated = jiffies;
+	data->last_updated = get_jiffies_64();
 	data->valid = true;
 abort:
 	mutex_unlock(&data->update_lock);
-- 
2.45.2

