Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660022;
	b=nQ18hZRUu8cSLhSAsDx/qvBz3iGQBMZQpVGn/RQNQQgyhjiY2ilKfmw4djgF5i9RWvlb
	 r6hqPPOFEC9hX4IdxJaYpm3/gYx+MzUvqiac4qf4TQHkzJ5NmyQtRXarjClqS5QxM7quF
	 lPoXy6wmwaoIo8nGl/kDbydO8VEQSyc1Wd34mIhdoTSbQnxc9vTTiiPLXkPEVBc7VviWA
	 veqOnsq7px5CLUyYrcdQwD8maclqMbHEfugK0UPRg9FTfM1OqXjqtNkWLBC0R0/GvIeeK
	 4ir/mb1s0CV3GjE0DkGIvJm1xkQYg7CK081M4J+b2ExiX0go1S6i+Y+2mDsaa+s6Bog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660022;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=9WSIZ1i6D/xChd70Tq4rUgqDfVz8RfApPrFoT/PUwNg=;
	b=4zI68EgDbK52a6Ekk0UhghG0G3a4nrNJAH6lpfC2hQutwi2bdBFNyJ8QKozWUFkRQq+p
	 0xHqsFbBY0B50/KgQQmGRqx6iFd0ExdExKdZX345rQywiAHPrQuaPhAIfo0C4+1UIPa+M
	 RVR8ltQKI/7GqU1sKx7iVXw6dIuUeDHQ7ve4CZZCaU10pAma2CDVejd2mG6Chga4nXEcg
	 dOFViDTF299bvb0PjVCUWhPK3xX/CY9xKu6H3pWpeLLy+fPawlM72kdxRpDox9JayUazL
	 iBHrvIsOSDZoe8HPo5kDJzpKdBq7jmhF9jxQBjR2K61G9OnSA66IZGqSMIMrp5Jp/rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FDGwsbGY;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AD3606A329
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31AD3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=FDGwsbGY
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id O0RqxhJE9c3XsO0uMxXllV; Mon, 02 Nov 2026 22:53:42 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uLxbRmRe0duO0uLxzQdF; Mon, 02 Nov 2026 22:53:41 +0000
X-Authority-Analysis: v=2.4 cv=KINaDEFo c=1 sm=1 tr=0 ts=6ae91476
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=VVlED5B4AAAA:8
 a=UB0ngD_nfeiCGpkOjqkA:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=9WSIZ1i6D/xChd70Tq4rUgqDfVz8RfApPrFoT/PUwNg=; b=FDGwsbGYCI5J
	0gzCdWDDG8RE46B+wmVllQg4WUQeaEDI51QVN6gTPeZizKx+bb/oaV3WdAtB77yPm5TtFseW/On/8
	eD0w3wbW/JNSQutligLF5a4TgKO3MYH5c6JgjhCbinVjWtUkxUAGm/pgybNfK7Rwk8/YGfzXk0LNw
	t5PSb+b+oJZzf1gULeF1aCxQmY5lC8tjgECSa7sOr6NddSuYgReA8M+GxVVSPOc+tiZtMNML0iACs
	Mf8toXsjQg82L9Aay4y+JVV5Azkxv9nyBWhVMY8ZE/VgOlakIY5lo0rsylBn18K32IzgPP5pThXec
	grvZq+6HbYDM7w+JzyZmpA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:33176 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0uL-00000003kUn-1MeF;
	Tue, 03 Nov 2026 04:23:41 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 021/102] hwmon: (atxp1) Use 64-bit jiffies and record update timestamp
Date: Mon,  2 Nov 2026 14:51:14 -0800
Message-ID: <20261102225235.334487-22-linux@roeck-us.net>
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
X-Exim-ID: 1xO0uL-00000003kUn-1MeF
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:33176
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 54
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfP2h0Zdq4RRAqtocOPsw/qlWVvhK+4xGIKZ/QJXelV+mu/DDTwCEPQ69kYp6W1nh17o8g1rFIREA1X+BG/XwuimHMFtR3IPoZ7AAj82ChkjuQNqlpILG
 UCJ+ol6T+oWNInvtHf4zFPUaCju/XJigDnne/T4sI74NWXrrPWMO5/jJpCsHvO8YFJv1i5Fz1N4esfWh7esJM2zZRa+g+25PhUiDA7GLUdryf7jDEmwzhIEz

atxp1_update_device() compares jiffies against data->last_updated + HZ
using 32-bit time_after(), which wraps on 32-bit architectures if the
device is not polled for more than ~24.8 days (at HZ=1000). In addition,
data->last_updated was never updated when reading registers from the
chip, rendering the 1-second cache expiration check ineffective once
jiffies moved past HZ.

Convert last_updated to u64, update it with get_jiffies_64() when the
register cache is refreshed, and use time_after64() for the comparison.

Fixes: 9cb7d18433ea ("[PATCH] I2C: add new atxp1 driver")
Fixes: 0cacdf298211 ("[PATCH] I2C: use time_after in 3 chip drivers")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/atxp1.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/atxp1.c b/drivers/hwmon/atxp1.c
index f5de4894f0a2..8559c301e1d1 100644
--- a/drivers/hwmon/atxp1.c
+++ b/drivers/hwmon/atxp1.c
@@ -37,7 +37,7 @@ MODULE_AUTHOR("Sebastian Witt <se.witt@gmx.net>");
 struct atxp1_data {
 	struct i2c_client *client;
 	struct mutex update_lock;
-	unsigned long last_updated;
+	u64 last_updated;
 	bool valid;
 	struct {
 		u8 vid;		/* VID output register */
@@ -55,7 +55,8 @@ static struct atxp1_data *atxp1_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ) ||
+	    !data->valid) {
 
 		/* Update local register data */
 		data->reg.vid = i2c_smbus_read_byte_data(client, ATXP1_VID);
@@ -64,6 +65,7 @@ static struct atxp1_data *atxp1_update_device(struct device *dev)
 		data->reg.gpio1 = i2c_smbus_read_byte_data(client, ATXP1_GPIO1);
 		data->reg.gpio2 = i2c_smbus_read_byte_data(client, ATXP1_GPIO2);
 
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

