Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664501;
	b=MsWn57TaqyWYZ5GZJdwE4zvSqQgw5nEVwf1xduf4vkZltpa72W9IZscSoVRMrctjGqRg
	 Xj+9VXMwdMiezpPrvXrcE0z3kcpl9RO5wYWC1lUQ8b/sp3yu6cLie96v4+/CyrFrDkvEJ
	 0HdFl6536SLxauKNOAiQO3epmtkWPuHpMLLLB5FNVZcHiOWyrnVv1VY8TC3fl08c3e85i
	 aJJDFNLw8l9hkCLfEggwwp8c6XYWV2AHlUnf/OJcvubDw8pZe2fXmHJ2r57kHNwi2sj8M
	 8rOeSU7cldho1aGTrF+ULNfyAcoU/4FOlw7UGA+ZBAEUp2ic8llxG5nOF1wOnfP+3mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664501;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=77NhbPUXlK/U8Ybuvv1Yc+MccQfyQrF5VXqzlI0qsWA=;
	b=tYGZlsYFDZ1nTJ4IBaSel2cswSKIgS3Fh9Tvdg32vYSB0kyIzqfQmhpgVBu6Oy7sbaQj
	 zQHPchRusxBfwp+tafID7AUyHieX2ADcOKX5x0fz5wdx9miSPCburtm3n9tJoCkNJUxtm
	 2HlLGXVs5aepK5kVWNf5J/QUYQvoR2QUwZHMWb7UsJ6genZy0Jnfc1kIUPziZXGOZM8hy
	 H65+c5pwSwLNCyQaXx0yEMYVYSVY9p/3DptklTNbvftPyUHkRL4GF7JzVcN3aV4TnwhKd
	 6VdVtnzCvmzt13TWGuChPGXV1cDV4JP8yaaLRSv41w7UHOTNFQVjX9UiybTjo4VU09Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b="bK/yFYpf";
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1924C606A327
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 00:08:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1924C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=bK/yFYpf
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id O04SxOi6ev0ndO24axBqSl; Tue, 03 Nov 2026 00:08:21 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O24axb3tZbxHHO24axlyL7; Tue, 03 Nov 2026 00:08:20 +0000
X-Authority-Analysis: v=2.4 cv=QK5oRhLL c=1 sm=1 tr=0 ts=6ae925f4
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=edvktuduleVQ9f6P3rIA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=77NhbPUXlK/U8Ybuvv1Yc+MccQfyQrF5VXqzlI0qsWA=; b=bK/yFYpfXNZO
	YurKzlrlbK7zizVumrEh4vO+EDguWOPu3E47CVDp1narinkOnknacxqTO3kkoUh5yis6p1HqCN7Yn
	zPFgNHMoSLVpWVbBarX4aP9dm2h14qOjC9EG9lml2pY01M8MbJxnePMnte8bICyeMwIp6O1mugycm
	o4jbLRLnJCHpqfVHgCVAntil797xm9c2TYDeVzAUMqC7V3aBJR9mD/gNRU8dDqFKsJelG8SsZCmpY
	83T5c17n77YpntubX/yCiviOtcYnR8S5BKgSkCk3TBeAYljvfIUNt/8c6Tn0yQ1Qzbh1FLruVefzo
	aGnoaXEm/PpTQyjteNop7w==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:53962 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0w8-00000003lfw-2lw5;
	Tue, 03 Nov 2026 04:25:32 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 063/102] hwmon: (nct6683) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:56 -0800
Message-ID: <20261102225235.334487-64-linux@roeck-us.net>
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
X-Exim-ID: 1xO0w8-00000003lfw-2lw5
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:53962
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 0
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJJR/MopCUWocNKuWrwqn2rjKaLNdOjqmlA27/iZ49Vw8htTuls7e4Efj2eOC6oPbk2ECaXnTc/idXFoIkbsG/PvspGF/71y1eztsTDS+/r/VUQG7Pxq
 +gK+QKM29ZtAiGv4f7xgW4RPhHHG1JvdMhncL3Vf9Drn5Wy4QtQC3jFY2Xr95/g8u8NEAWUshAbDbl2Nr1vEAVCZgpyfJZ/8Lkymvm1ZfV/KUEXEg2t4gGv6

nct6683 uses 32-bit jiffies and time_after() to determine when cached
register values should be refreshed. On 32-bit architectures, if the
sensor is not polled for about 24.8 days at HZ=1000, time_after() wraps
around and cached values stop updating.

Switch last_updated to u64 and use get_jiffies_64() with time_after64()
to avoid wrap-around issues on 32-bit systems.

Fixes: 41082d66bfd6 ("hwmon: Driver for NCT6683D")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/nct6683.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 2d4117c2415c..d0ae3daaf049 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -338,7 +338,7 @@ struct nct6683_data {
 
 	struct mutex update_lock;	/* used to protect sensor updates */
 	bool valid;			/* true if following fields are valid */
-	unsigned long last_updated;	/* In jiffies */
+	u64 last_updated;		/* In jiffies */
 
 	/* Voltage attribute values */
 	u8 in[3][NCT6683_NUM_REG_MON];	/* [0]=in, [1]=in_max, [2]=in_min */
@@ -630,7 +630,8 @@ static struct nct6683_data *nct6683_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 		/* Measured voltages and limits */
 		for (i = 0; i < data->in_num; i++) {
 			for (j = 0; j < 3; j++) {
@@ -670,7 +671,7 @@ static struct nct6683_data *nct6683_update_device(struct device *dev)
 
 		nct6683_update_pwm(dev);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

