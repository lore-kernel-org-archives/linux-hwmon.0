Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E83233F5;
	Wed, 15 Oct 2025 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760529558; cv=none; b=tqGSr2b2GbdfyYsSHEdrhtCmq3RILpL3NG6AXeSwj3crT6tAPbOQZZt+XRubbVYoCpwiKWyayJHRXcaI5xBIiYNCjY/jrt8K02s2VcK+cq8f8T8h5plxPWxQewiweeZNa8+DTDL6gooCqy1k/0kbLb3lmQB+RsMotuIrYKePDlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760529558; c=relaxed/simple;
	bh=jwfNrWAyi8odPRlL5NxhzuJuihis6Wg9ADA+jJKb9zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ocP0X4yLJh+Wy68jS1mvRANMW13dfos4Gnnunl9fpTnbtkPy5kI7+fK4IzFAG3vZNo/R41+GybMTd6qZZBZ7NoW5bcDHHIH24kjMVRXQ+trMTIQ5QPHOInH6+J6v4n7zCxhXswrOYXODS4KypdQEmIi5oUk+TvzZwf7YPz7r8ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=rzOC4Dhr; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Vnx4eutG; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="rzOC4Dhr";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Vnx4eutG"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmqCG2jmGz9tgD;
	Wed, 15 Oct 2025 13:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760529018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TIFO4yfLHgq5ckjg2uDB2Daft94lZqpaYBGMWJ0nnlQ=;
	b=rzOC4DhrKJl8FPRu6EF8M+uSRwJYcWe8B9lcR648jbDpoShgWlkGpLceFB2yW3hJgi808e
	C57hpwm3XEP+Q0CzTk2GbLkJpokbLFOIP3eP58wtnjl5cctD+F/X3mogw5lbh/8xbAM1Zx
	KC3gYGo1v7P5QhgZk0Oe6xM7pkxBq4ArD1KiAK5m3P645liz+Ccqs9DeMX8NZD2obECPfr
	+CPW/vOyD23D7amouR0VnTyi/zQR6XMOBZgUYgV0/V0oqWuUY0nDdgeWQ92CHZMeSbdY2M
	18bSzHddz+HI9l3BPVsiHZOE6oW0U4SZn2Qes+GlaSwyy8qHG4ahcywlLrFxtg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760529016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TIFO4yfLHgq5ckjg2uDB2Daft94lZqpaYBGMWJ0nnlQ=;
	b=Vnx4eutGKI+nVuhkVOgTveMI/5X2TGggNzkMGnf/yTcO3kTedqJwZCTur2JgvseoimsTUj
	CuozjKNMDe4ZXlumC7XHFQ5NYYtsUjQylAkzpQSQHPuclwgBwHG9WncpQ0Ht7YEAAZyN7q
	gBpFD5koggaRN4jW9ZkBuVJuAKj5elyzw1FVuMoDSKQv+cbqSMBKYHpuQ0fu7JU/o0CIs3
	dsxipy6P8/UuNPspSe5UqbbbICcQOzXPfzfQpbz4CIByUSEsbHRz8X1vtARXOrhpPNjEtf
	sPUjLbhdfldsvaoPgX1aJq7BpgbmsXOhGWp3HfvJ6zxHbjnmyFGUQjUyhlqDQA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (scmi) Enable sensors to assure they can be read
Date: Wed, 15 Oct 2025 13:49:28 +0200
Message-ID: <20251015114953.148706-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qi87ebe64zs1csghmf895uygn83dqjin
X-MBO-RS-ID: a65e4f3a777492cff53

The SCMI specification states that SENSOR_CONFIG_SET is used to
enable/disable the sensors. The sensors can be disabled by default,
which is the case at least on NXP i.MX95. Explicitly trigger the
SENSOR_CONFIG_SET to enable the sensors, otherwise sensor read may
fail and won't return valid data.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/scmi-hwmon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 364199b332c0a..eec223d174c07 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -240,6 +240,8 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 	const struct hwmon_channel_info **ptr_scmi_ci;
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
+	u32 sensor_config = FIELD_PREP(SCMI_SENS_CFG_SENSOR_ENABLED_MASK,
+				       SCMI_SENS_CFG_SENSOR_ENABLE);
 
 	if (!handle)
 		return -ENODEV;
@@ -339,6 +341,13 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		if (!sensor)
 			continue;
 
+		ret = sensor_ops->config_set(ph, i, sensor_config);
+		if (ret) {
+			dev_err(dev, "Error enabling sensor %s. err=%d\n",
+				sensor->name, ret);
+			continue;
+		}
+
 		/*
 		 * Warn on any misconfiguration related to thermal zones but
 		 * bail out of probing only on memory errors.
-- 
2.51.0

