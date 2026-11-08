Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794096097;
	b=zCr2M/zwat0TGJWhjoPHyJg+akXiQSJGyeb4L5y0Hkzy0+VOeqqv+YRJgQbebt/ZXOtE
	 tYrYhz7OBDxQJaMF8YutkgC1JciHEjEAMn+Gr78q9TqRwGOBzaY37CmKa4fCPZnr6oLDV
	 tKghp0yibMHdejaqAfc/9Owo9PUF9hX2S/ZaJeU+sGyhcrMgcaFRe+2YPsOx6hBfZiKfP
	 afASXdD92B0tEndOlVdQdvYlOnyqi9Ixpzr8gTf934ElD3ir2rQY+SZ3xVdv2BfsrjiI6
	 SM2xpssNb+CxDLeE8HfzHkRQ0ttZEqlywBtpsbxOURgg6vwftholPy5+h8575Y1OVEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096097;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=WhLOUe2muAW9NZVYSYp7BcV1IbTn1k6/5rOI+02tULI=;
	b=wLfFPgLCOLAOKToPJkzq2rP8ghKNYvQuadQLgU0+1mvR3pF7G01NaW0zzV2hPB+Mkbro
	 Lbjgsl0dqxpbRSHDS3NwxxiIcelTggxRN5T9xgQzdVnmPvba/J/06jSAz5OCeS1/t6GQf
	 Xnjy/TrmTupRV4+jsez2U4yQ38zQCdkjWo6gJ2j2y6v7gzjdIw2+1Ftp3lCieerQtN0Eb
	 TCx0qMTgTu36h3HFXYx9ZbYWKYxGkQrJR7mRzU/iQ0e+pi1r2CEbc0iWdXdAezkPZ8Bfv
	 mjT0jK8rtN/XbH0j1QQ0PwIc4Iz3Mb2iITkzZnb0vitelOkQbbp9GOP4rVb16g/LWKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=noeq81Ec;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8B9606A326
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 00:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8B9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=noeq81Ec
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id PNuzxeguBRiNxPqLoxAPxA; Sun, 08 Nov 2026 00:01:36 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PqLnx7gJxGh2BPqLnx39iL; Sun, 08 Nov 2026 00:01:35 +0000
X-Authority-Analysis: v=2.4 cv=Aszu3P9P c=1 sm=1 tr=0 ts=6aefbbdf
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=6phSsQ8wN3HDoariCigA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=WhLOUe2muAW9NZVYSYp7BcV1IbTn1k6/5rOI+02tULI=; b=noeq81EcXK7n
	UsVRnls5FfdeWlea42kBl1A4kwQAql5yqaG25v+4pLyXt9SISzX5ndog5RSO9DJV2uNBO6fRQWTPp
	Ssso/PZppdF3xwnvQijZC0tlVpRuNPc/WB0wPnQUIBNwaavuXYE5sfkn+BEc4OTlS/RSa9PErGDkY
	NmjibTFaUZiHF6ZzgJC/Mz0JhwrJij8jgvabpG4fESE6SRbN45Px1omvZksCCDsgIEqgz5sSr5HPF
	K4CmV9UcBsiYSPUog8FtqeASHRmzvnVa2AiKJan4ZChnePs5PR+XSH938bl8JB8UuHJah9J0yjv+8
	kNmd/vb/2JilArXxWOL8KQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34080 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPqLn-00000004E1G-0g8k;
	Sun, 08 Nov 2026 05:31:35 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Tomasz Bojanowski <tomasz@bojanowski.me>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/4] hwmon: (msi_mystic_light) Stop calling hid_hw_power()
Date: Sat,  7 Nov 2026 16:01:29 -0800
Message-ID: <20261108000131.1249664-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261108000131.1249664-1-linux@roeck-us.net>
References: <20261108000131.1249664-1-linux@roeck-us.net>
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
X-Exim-ID: 1xPqLn-00000004E1G-0g8k
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34080
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfLFprl+zawUFvfESOnTcAOvkXna2ESkk34GTJ0jDoaeOGP8aLxNZGnhBy9V4UZpsoo/AT3jxiTazGH31sGAbGfMM1PEGhr/MzWGYlD4byRje4VAbN9Dt
 xSyEgt4FmphmYJ+HWepeZLnU8FXtRBAanqGzghkA1xJPOY+XHC+Mfebf6Qri/+68kxW3yZPrtStVChavGTSDt6n9CEYgDWzgxZ9z5xzX0Dejakffk0t8bS22

msi_ml_read_report() currently wraps hid_hw_raw_request() with
hid_hw_power(..., PM_HINT_FULLON) and hid_hw_power(..., PM_HINT_NORMAL)
to prevent USB autosuspend during the feature report transfer.

However, msi_ml_probe() already calls hid_hw_open() and keeps the HID
device open for the entire lifetime of the driver binding so its
interrupt IN endpoint remains actively polled. Because the device is
kept open and remote wakeup is not enabled on this controller, USB
autosuspend is already inhibited while the driver is bound. Consistent
with other hwmon HID drivers, explicit per-request hid_hw_power() calls
are unnecessary.

Drop the redundant hid_hw_power() calls to simplify the report read
path.

Cc: Tomasz Bojanowski <tomasz@bojanowski.me>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/msi_mystic_light.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/hwmon/msi_mystic_light.c b/drivers/hwmon/msi_mystic_light.c
index a008999e7c06..4b4e07f15aa8 100644
--- a/drivers/hwmon/msi_mystic_light.c
+++ b/drivers/hwmon/msi_mystic_light.c
@@ -76,17 +76,9 @@ static int msi_ml_read_report(struct msi_ml_data *priv)
 	memset(buf, 0, MSI_ML_SENSOR_REPORT_SIZE);
 	buf[0] = MSI_ML_SENSOR_REPORT_ID;
 
-	/* Make sure the device is not autosuspended during the request */
-	ret = hid_hw_power(priv->hdev, PM_HINT_FULLON);
-	if (ret < 0)
-		return ret;
-
 	ret = hid_hw_raw_request(priv->hdev, MSI_ML_SENSOR_REPORT_ID, buf,
 				 MSI_ML_SENSOR_REPORT_SIZE, HID_FEATURE_REPORT,
 				 HID_REQ_GET_REPORT);
-
-	hid_hw_power(priv->hdev, PM_HINT_NORMAL);
-
 	if (ret < 0)
 		return ret;
 	if (ret != MSI_ML_SENSOR_REPORT_SIZE)
-- 
2.45.2

