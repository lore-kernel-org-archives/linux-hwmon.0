Received: from e242-7.smtp-out.us-west-1.amazonses.com (e242-7.smtp-out.us-west-1.amazonses.com [23.251.242.7])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F472652AF;
	Wed, 18 Mar 2026 09:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.242.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827296; cv=none; b=daiJpcN0LxuReBtxJN9CuB8E7t9+e2qmx66pmF2pbsySXRAIYtmKkG4TBERB9n+YGRcZ/MIz49CSTFy7fxr6Obx5cgAxaesed3tKkLHm5zG5nPmgXtK9775YGyjZ+zHAEJ5PaWxEg5IDTawQKTenqhWTBEsmldYB5bJQkvGHBqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827296; c=relaxed/simple;
	bh=OD5Twj5lEW1sLP1cIRM7AZB6/DFR58A6+GYFn0xb5So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIFlIdAk6HvbSAyOOlKiBirKGaRLbp3DI4UpbADa71SbziXk1b45+TapwYRbipweW+EEN+UZssgnlJB9pdlr26LXqjYS0Hm8xjszme3HVVz8QOHTVrd2H/1OpcUOF77lPWTT+9dgnOFHGHH/0Rkw7zSpMD0b4CGq6rtFJ1Q1BEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=SI+t3ZjG; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=Kv/r/+wk; arc=none smtp.client-ip=23.251.242.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail-mps-ses.monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="SI+t3ZjG";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="Kv/r/+wk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rodjp4ft5fg4rp24cb2ntayvghblvgrq; d=monolithicpower.com;
	t=1773827288;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=OD5Twj5lEW1sLP1cIRM7AZB6/DFR58A6+GYFn0xb5So=;
	b=SI+t3ZjGxmULUudakf8BP6l6uUPExIk6qgUTE5P1uxes+ySksxQGMsiJuGvOdKFe
	jXgJdOy4LyiVOTXstUJ35rmvQ18Go5E1T3WiusRRyfQT220LtEDnvmeZrt8KJvN/O+6
	E0ppB9LfyqGsHryMcFH3MSTk6d2F6XIYe1PrU8NpX3dIo1FlFdvoMtJcBQtL0WtEPzz
	vS5dn3oOUkXwArEd0SepM6e4D49AY2wsLehavgBfNfMqZ/oHvtMl5h6/9yeJLm3woL9
	hhcfOXQ7u94bJUV2KcYLhOZj1RMaiaZFp2GMsbaBiMNE1nN+6jbHQ70Zbc4I2lM8Waj
	nwhRCqdiyQ==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=voqdhibj3ww47nmt5hkqcrgg7xiynmza; d=amazonses.com; t=1773827288;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
	bh=OD5Twj5lEW1sLP1cIRM7AZB6/DFR58A6+GYFn0xb5So=;
	b=Kv/r/+wkVtCsEzSOK4/+GSsDEi1A05v+0LUUeBGjOlmsZc3J8rq591k/Y53dgz4z
	E8rdZwc/QKKnol8tllCmv3lO5KOdEI/LgygI+bwJx4dBjcOA3bbHV5fRgz3St3M+FeL
	wYS/Xtp2spCcaj5L4STyCnGQNHrxFJ3J2+mHkGIU=
From: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
To: Yuxi.Wang@monolithicpower.com, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, paweldembicki@gmail.com, 
	carl.lee@amd.com, ythsu0511@gmail.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wyx137120466@gmail.com
Subject: [PATCH 2/2] hwmon: pmbus: mpq8785: add support for mpm3695-20 and mpm3690s-15
Date: Wed, 18 Mar 2026 09:48:08 +0000
Message-ID: <0111019d00586e60-e3a938c5-6b1d-47c8-9856-0fc717ece565-000000@us-west-1.amazonses.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <20260318094635.1873-1-Yuxi.Wang@monolithicpower.com>
References: <20260318094635.1873-1-Yuxi.Wang@monolithicpower.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: :1.us-west-1.CVpA5H5M7EMrIGr0u6+8nP6wkCH59pkYLxtNQh1UjuczBtN1WmV60RtUapmzBbQ7+P+SiHg5vbyEpY0uRvudPF12wRQI7xDHNKjWPMJN/yd9hVbV9UslJ09o7rVZZCRhPDXT8kPM9Nch5RQcZE90uz62B8giHS2hgInWMbQKX5A=:1.us-west-1.yP6/L6iaxFc47BvsTr22yvAX3nKjbzwVEN8jceuJEpw=:AmazonSES
X-SES-Outgoing: 2026.03.18-23.251.242.7

Add support for the MPS mpm3695-20 and mpm3690s-15.

Signed-off-by: Yuxi Wang <Yuxi.Wang@monolithicpower.com>
---
 drivers/hwmon/pmbus/mpq8785.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/mpq8785.c b/drivers/hwmon/pmbus/mpq8785.c
index 87bd039c77b9..03889a197c4f 100644
--- a/drivers/hwmon/pmbus/mpq8785.c
+++ b/drivers/hwmon/pmbus/mpq8785.c
@@ -12,13 +12,15 @@
 
 #define MPM82504_READ_TEMPERATURE_1_SIGN_POS	9
 
-enum chips { mpm3695, mpm3695_25, mpm82504, mpq8785 };
+enum chips { mpm3695, mpm3695_25, mpm82504, mpq8785, mpm3695_20, mpm3690s_15 };
 
 static u16 voltage_scale_loop_max_val[] = {
 	[mpm3695] = GENMASK(9, 0),
 	[mpm3695_25] = GENMASK(11, 0),
 	[mpm82504] = GENMASK(9, 0),
 	[mpq8785] = GENMASK(10, 0),
+	[mpm3695_20] = GENMASK(9, 0),
+	[mpm3690s_15] = GENMASK(9, 0),
 };
 
 static int mpq8785_identify(struct i2c_client *client,
@@ -114,6 +116,8 @@ static const struct i2c_device_id mpq8785_id[] = {
 	{ "mpm3695-25", mpm3695_25 },
 	{ "mpm82504", mpm82504 },
 	{ "mpq8785", mpq8785 },
+	{ "mpm3695-20", mpm3695_20 },
+	{ "mpm3690s-15", mpm3690s_15 },
 	{ },
 };
 MODULE_DEVICE_TABLE(i2c, mpq8785_id);
@@ -123,6 +127,8 @@ static const struct of_device_id __maybe_unused mpq8785_of_match[] = {
 	{ .compatible = "mps,mpm3695-25", .data = (void *)mpm3695_25 },
 	{ .compatible = "mps,mpm82504", .data = (void *)mpm82504 },
 	{ .compatible = "mps,mpq8785", .data = (void *)mpq8785 },
+	{ .compatible = "mps,mpm3695-20", .data = (void *)mpm3695_20 },
+	{ .compatible = "mps,mpm3690s-15", .data = (void *)mpm3690s_15 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mpq8785_of_match);
@@ -148,6 +154,8 @@ static int mpq8785_probe(struct i2c_client *client)
 	case mpm3695:
 	case mpm3695_25:
 	case mpm82504:
+	case mpm3695_20:
+	case mpm3690s_15:
 		info->format[PSC_VOLTAGE_OUT] = direct;
 		info->m[PSC_VOLTAGE_OUT] = 8;
 		info->b[PSC_VOLTAGE_OUT] = 0;
-- 
2.39.2

