Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767EF353A8F
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Sep 2026 11:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788780580; cv=none; b=Y30ZudJJluUot4r+OMwb4WroJ9CLjzTBG4BTn5rOaokKaryqHdHqhb1hjS/npdE62/mgw4zb186u786TQNdkPfoIIxlNdadEn8yRTkD40ppAFbx3uGKnZ+xJRnAXOiTPd4CZXpx0fWTBiti/Q2MWsC/Q2H4s8Ucgadk6FdWLQmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788780580; c=relaxed/simple;
	bh=C4PRFDmqEh3TqO4dKw+79TM/CP+snLkGQ76xBLR9GIM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A2h+7ouvFfnfGg3ofc/szvG4CY42H0v2yNymROMR46w5f2WPHSoFqgWxrEK28sSajBMn9h8uoYZCM7zqbQBZAV9N6QA6bJAa/2T7lW4VP6/OUMOfYGhj72v3ZRmp+oe7ZucsOvaNVgIX/XvHaCBw5mqgb/B/woYBM0mdSxF2OZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dN4DQl3d; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dN4DQl3d"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4843e397f74so4338770f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Sep 2026 04:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780575; x=1789385375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHtfPvOSjpMfTPh/tjGP0O63UtTlZ2qK93oWuKlgXsc=;
        b=dN4DQl3dMQMseTOTxeXdBKYR+9EpEqbaJ8w1OIID4U4K6tgB1SpjTmnpRV89hCqWI4
         1Y1j7B9SFcf6LiRVh/wOaqRtOEql1P/rbPgVySjfiKkAe8NVShjO1rWBw1w4LPAwRMiN
         PFvUAw41B9X2fDN7o3x4icszuclX3mcG3rZW/usfMMaIXKBn3UlffUZLJDmy7glwbgks
         9XQepwZuGEHljeX1/AilO79Z3bS8Siut5XfpKAxCUoy39WbC6QYoq7CFYtbLBA4tbvuH
         AzxG08SoAaThG2hr25kHCfjWwm3jWAV21m5/aBOqKin+wvn9MhPabar8DeSwUixnGqOW
         yoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780575; x=1789385375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHtfPvOSjpMfTPh/tjGP0O63UtTlZ2qK93oWuKlgXsc=;
        b=e6gVhVPJJMbCns1DMhWGu0r5fU6ICmQ5U5B6zjx9hQQbYA3a/kBFnRGZHH6ijU8LpO
         UsZc4CCu8vfjCsPS6futGjmir5c0yowSBZcudsCcG2REgHvIKtxDEqQlwALC33t34c3t
         xbGuBgNfyiog1+F+XaZ0XAw/cPlrFjg95wWRNOcKK4vhiPlLOf4NUN2GIlHDtCJPBZ36
         RuZfHjmdXiJ0XwfMIu46GywRhMNIpqqSeVbL9CJRe370Bk0toQfT3cuY0lj/SyyoZz2B
         6x4yk1kpcI5mwxLlR2Enwys7LFhqlqJym64H8TAioXwsvpQzmxfH0dxujncdflzU/5F0
         +o4g==
X-Gm-Message-State: AFuF++kDJqPymczd06CJTlZPC2+Be6ilP74uK1/jQoVehYr2EHNCkM+B
	xqtHdI3RDaEKwTXQd11xMOc+2qG1AGMCkqDcuu/wsHxOnmPqHLuCwY0+tBxS5JubhwcVhg==
X-Gm-Gg: AYBFou2jvqPt9qNRLWmH+t/5KxKonjAFCjOCtflvBBs8NOF6bOBw78orZ6aP+4tDt2V
	5Bz61+hffSMsw+58gY11nU//dKqYXBFrhwN/eBZfE6spucDf+JG+TMmm9I4FGcLcknfg/zxdKO9
	st97NW9KgLLtqzGidJlbY4Zdq18oqUotQwmsL8Ywsbk78ru7Q0uF2L6nlbN21Ho1sdt7LYDPV4U
	on8m5zkzemYiifyJXc3OfVULYlD+8BNvn6IsfdSAe8p79zPq73bpd/XOoGljE3nORQJY0dP7ZGp
	lDgZ6zv2qN4fEyJyRKfnHfeB55KGEMfqnrJWXGw2P9X92Sd52LuceuLB9cqbZzBZk7ly8gOZbg0
	KDWAy9sUXTW4d2g6Gsjewfs3eNLpd5y/NPm7STfmGxcAbal7PbsftrURQbQPILeNtOPpxo9w7it
	1p1PG5AfPFWKk6ho/aa7Flmh13lf+nhGKcB6ac1k9YfOwL9S4x4ZuEjk7YDAnuF7/8ULNu3zvVr
	2poD70WRjHfYQqhRwZzfde4UGoq0/p4iPlzXJkqXxfuWB70
X-Received: by 2002:a05:6000:118d:b0:481:5a46:dbef with SMTP id ffacd0b85a97d-4857e4cf938mr24672504f8f.5.1788780574514;
        Mon, 07 Sep 2026 04:29:34 -0700 (PDT)
Received: from sergio-82n7.fritz.box (host27-7-217-213.cgnat.broadband.ehiweb.it. [213.217.7.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm28537422f8f.21.2026.09.07.04.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:29:33 -0700 (PDT)
From: Sergio Melas <sergiomelas@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergio Melas <sergiomelas@gmail.com>
Subject: [PATCH] hwmon: (yogafan) Add support for new Lenovo models
Date: Mon,  7 Sep 2026 13:29:29 +0200
Message-ID: <20260907112929.1531690-1-sergiomelas@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DMI quirk entries and map correct ACPI paths and configurations for
additional Lenovo laptop models: Yoga 14cACN 2021, IdeaPad 3 15ALC6 Ub
and Yoga 740-15IML, leveraging DMI product family matching.

Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
---
 drivers/hwmon/yogafan.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
index 413ddc721..aa3284560 100644
--- a/drivers/hwmon/yogafan.c
+++ b/drivers/hwmon/yogafan.c
@@ -53,6 +53,11 @@ struct yoga_fan_data {
 };
 
 /* Specific configurations mapped via DMI */
+static const struct yogafan_config yoga_740_15iml_cfg = {
+	.multiplier = 100,
+	.fan_count = 1,
+	.paths = { "\\_SB.PCI0.LPCB.EC0.FANS", NULL }
+};
 
 static const struct yogafan_config yoga_8bit_fans_cfg = {
 	.multiplier = 100,
@@ -200,6 +205,30 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
 };
 
 static const struct dmi_system_id yogafan_quirks[] = {
+	{
+		.ident = "Lenovo Yoga 740-15IML",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 740-15IML"),
+		},
+		.driver_data = (void *)&yoga_740_15iml_cfg,
+	},
+	{
+		.ident = "Lenovo IdeaPad 3 15ALC6 Ub",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "IdeaPad 3 15ALC6 Ub"),
+		},
+		.driver_data = (void *)&xiaoxin_8bit_dual_cfg,
+	},
+	{
+		.ident = "Yoga 14cACN 2021",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Yoga 14cACN 2021"),
+		},
+		.driver_data = (void *)&yoga_8bit_fans_cfg,
+	},
 	{
 		.ident = "Lenovo LOQ 15IAX9",
 		.matches = {
-- 
2.55.0

