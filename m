Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660036;
	b=fzGQqNYFXgYzaEoP0QeRYL4kM65UdoliVsSN68fJ3AjxjCxA9FSU6zsBmF24aB3e6GLk
	 SbKEjrRVkNgOn2Oa8+MIwbJRyVK/nsCgpPODQ4tUFpHVn9reTi+jfX41VphNvN8ncZ3xv
	 nN99epz3gXQ0rYaNiBJ0aLOBeYoRuPhCZEdVjxTzAPC0DrnmrE+kZXKgw5gA4cdjXLIQZ
	 U8sZPdQv2ZW6rW8TShnJCa1VTb2xOU9WD8X0FwyPo3MWJKRD9W+aXQ2XrDsCPXjelBJn0
	 QnA4+C17KB8wVJnPU2couElAQLoap4MTzDMgZcozI1vO2S4m5voDSFxdrKmbOIX6y0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660036;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=UWJ1X63gMhea8wzFBHrblB6NDC5YNhkTe5+KqUBEcC4=;
	b=GbVM04AsKIyB4LMflK9bK6RPmaJx/Eu7I6Spl8pWBdcoDeUMdnIqfHibr6RD0dA4f2MC
	 uhnrLbhOcZfF11MmLjBjQIRrzjzvXPq2oa9BclPyzPGasLk9qq3LS2h52KVCerWSf3wRK
	 uh1PAJM/q9SoLDvSADtmk7fU7JCt/mS94LclTPW6pRuhEGHLJFgnghAY3o9+JlZZFEGSj
	 /noSsj9JcKp9/zLM4TLByA6b1/LAoLEQgoLtjC9vCd0PWaxUWW+w+fZ9GC8ECu9x55UrA
	 m0TlnNAeo8+WZ6EDe5APY2thBBAC/QASkJ6SgzyCj98yBsSUTxYtnrynaphf9BM+nFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ckabxNNk;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD4E606A324
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 22:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAD4E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ckabxNNk
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id NwKCxNsbov0ndO0uZxBS2Z; Mon, 02 Nov 2026 22:53:55 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id O0uYxtAI1NSXiO0uYxBmPx; Mon, 02 Nov 2026 22:53:55 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae91483
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=A5s3B-U6AAAA:8 a=_jlGtV7tAAAA:8
 a=bSDqB9oQiHrMpEKN2fEA:9 a=CynZFG9aVJpx8NKJlbCV:22 a=nlm17XC03S6CtCLSeiRr:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=UWJ1X63gMhea8wzFBHrblB6NDC5YNhkTe5+KqUBEcC4=; b=ckabxNNkmOd7
	Pqv9ndBxbwccY8A11gXfNM+bX4glw+reWpP2uHc9BtoZUkyuA0lFbvtZIjh0GehMI+vW2KeUpZrr6
	ajZgt5C8FhJYmNaq3fQUomFOT4DV0HvA89/HzgtuBhfbtTDWRQntWIPKCMTsnkmvfRmNuKjRp6zeq
	3LTWFdLP4KFldx7ANvZbn2Z4mpcGYeNQgJg1Y4m8OoDxJCeS4E3X3Ml231AxrL+WwmXrBzo3TNPCR
	k8aRKczcoskipNGXxje8xYZ2aeIyiHQXhx5pDo2eRHvxpIdQaiHXLjwtlO3IlSbxf6IGTHfQ0tGax
	x4K8I2q56BhqBRseprdQWA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:42692 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xO0uY-00000003kjj-1lUd;
	Tue, 03 Nov 2026 04:23:54 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Steve Glendinning <steve.glendinning@shawell.net>
Subject: [PATCH 025/102] hwmon: (emc2103) Use 64-bit jiffies for update timestamp
Date: Mon,  2 Nov 2026 14:51:18 -0800
Message-ID: <20261102225235.334487-26-linux@roeck-us.net>
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
X-Exim-ID: 1xO0uY-00000003kjj-1lUd
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:42692
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 60
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfFW1VJ/b4l3e9vfUF7A9u52TZfdz6kje8pOAS0QosAEaDtNzxBZbyiFmZ2Pba75Dn32/Ok4ct+Pgs8mf/ngP/YOfj1j7ScefaZeTPL5PxNc5ZgHfm/Kc
 Dc53FwKmuevOX4AlJXUcSGOsxz0gpGg2ki+B91Q67DxJbAj/9lGJP9efVITQeC2lXWOZbhSobsdyVmGqouvnKhh+WnwXwroBV3xa0ZjNicZ0CrIbh/cmNZU9

On 32-bit architectures, jiffies and time_after() use 32-bit values and
wrap after ~24.8 days at HZ=1000. If the sensor is not polled for longer
than half the wrap period, time_after() can return false and prevent
cached sensor values from updating.

Convert last_updated to u64 and use get_jiffies_64() and time_after64()
to avoid wraparound issues on 32-bit systems.

Fixes: 9df7305b5a86 ("hwmon: Add driver for SMSC EMC2103 temperature monitor and fan controller")
Cc: Steve Glendinning <steve.glendinning@shawell.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/emc2103.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
index 4adc23ffaf72..47e12897f56f 100644
--- a/drivers/hwmon/emc2103.c
+++ b/drivers/hwmon/emc2103.c
@@ -59,7 +59,7 @@ struct emc2103_data {
 	bool			valid;		/* registers are valid */
 	bool			fan_rpm_control;
 	int			temp_count;	/* num of temp sensors */
-	unsigned long		last_updated;	/* in jiffies */
+	u64			last_updated;	/* in jiffies */
 	struct temperature	temp[4];	/* internal + 3 external */
 	s8			temp_min[4];	/* no fractional part */
 	s8			temp_max[4];    /* no fractional part */
@@ -139,7 +139,7 @@ static struct emc2103_data *emc2103_update_device(struct device *dev)
 
 	mutex_lock(&data->update_lock);
 
-	if (time_after(jiffies, data->last_updated + HZ + HZ / 2)
+	if (time_after64(get_jiffies_64(), data->last_updated + HZ + HZ / 2)
 	    || !data->valid) {
 		int i;
 
@@ -162,7 +162,7 @@ static struct emc2103_data *emc2103_update_device(struct device *dev)
 			REG_FAN_TARGET_HI, REG_FAN_TARGET_LO);
 		read_fan_config_from_i2c(client);
 
-		data->last_updated = jiffies;
+		data->last_updated = get_jiffies_64();
 		data->valid = true;
 	}
 
-- 
2.45.2

