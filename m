Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587F8BE5
	for <linux-hwmon@vger.kernel.org>; Sat, 23 Dec 2023 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hCdVVVuj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703317085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jS5DA0VfCS3rrQPUCKDuaUeTWEviODCJRunMUgigK8Y=;
	b=hCdVVVujye2MHR75v93W+zCaY0xk5GbIjkpf8KOwKT/ZQsqew06v5AAB7DLxw7zpHZ4WDf
	pLImxf6qedUbp/zp5P9fvIUK312z53M30dBkE/dUqx87FjQIubanU12Kje7qfzO94rGtSk
	CUjMDhY76cDnmo5oxcR5U+hOtNtPEyU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-vSLkINrfNi67vnrFMgVQ7g-1; Sat, 23 Dec 2023 02:38:03 -0500
X-MC-Unique: vSLkINrfNi67vnrFMgVQ7g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3705380BEC1;
	Sat, 23 Dec 2023 07:38:03 +0000 (UTC)
Received: from ovpn-240-2.nrt.redhat.com (unknown [10.64.240.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E23C4C15A0C;
	Sat, 23 Dec 2023 07:38:01 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: pali@kernel.org
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	snishika@redhat.com
Subject: [PATCH] hwmon: (dell-smm) Also add Dell Precision 7540 to fan control whitelist
Date: Sat, 23 Dec 2023 16:36:58 +0900
Message-Id: <20231223073658.354773-1-snishika@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

This patch, in addition to 95d88d054ad9 that added Dell Precision 7510 to fan
control whitelist, also adds Precision 7540 to the whitelist, which allows manual
PWM control on Dell Precision 7540. It has been confirmed that the same SMM
commands work to enable/disable manual PWM control on Dell Precision 7540.
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 44aaf9b9191d..f946257f72c6 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1330,6 +1330,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
 	},
+        {
+                .ident = "Dell Precision 7540",
+                .matches = {
+                        DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+                        DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Precision 7540"),
+                },
+                .driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
+        },
 	{
 		.ident = "Dell XPS 13 7390",
 		.matches = {
-- 
2.42.0

