Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92615330333
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706206; cv=none; b=iZC3nUWrfAer95gIEAKb4IEQfLFTVSg8B18Spn0XjG7ueJnSNi8h/m/Q0bMqa9vtrxKJygRwA1YA+ttZhZ3iRDjcTLjDzSEbNWPeqjdwIetfewu70S2ZEDE6I2O95OrkwK1HH7ShTGmEJBo5UlzdNQXv2dlFS/Fk+nzxlcfJ80o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706206; c=relaxed/simple;
	bh=9N7+zDfg0FkvjeBLbSZKdkjP2wy5MU/cnQnaHgXTgOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFK4S3C9Yks9FMaKqCHHqmGkRPee/FAMm603ui76lSjfBo3p6O9jXYLDqK5Q1RBfWnEBwG+uFK2HLxPYSBh0+OsR/8iUPEhGCKB1fXlyX/OI7wgQzYzWflbum6pCg+82BRCTpnJxKqve5UjEoOFkkqZ8qST55JXFf9sFESg6cDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c38hA71T; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c38hA71T"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso1866243b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706204; x=1761311004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHpNGp64ovUGaZPiNYgopKO8dLooCh8viOcs63subok=;
        b=c38hA71T/tZl6kZ3FayXbn2tf/8MYY+yhDM4uYzHULuZVVm1bDiRYMSEz0tGjSekhg
         8S9NqAb80zC+/LdmYT5Y6kpi91FlqjZ+MF/GFnU5peMyKta/R+ncPAwjfjeoADMxS8o8
         rMpURPqlVpdohrrqZEQ8uYMbxDM592+QZzyT0/mSBa7hH+3LTh+sUPc185/tD8ov/NMt
         O6GSOUMHemIT/eqgmnVbzMiomg0FNL7JBq/Hg6Yh32pS28mh4G1c9MX7Kjg4scsXrW1G
         QCgOgn4EkPm3+OacECThIvGHkTdmeZXsK4Ic4GGAs2NBqkPDlpN+8BFGWEu1jZloNvcf
         SsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706204; x=1761311004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YHpNGp64ovUGaZPiNYgopKO8dLooCh8viOcs63subok=;
        b=IT5rt8+YuwIN6fvrafT87HBRWOw0OIPVqAsgGmMuWzBlhGpa+UNSJxI9kcDjsd6Roo
         Ke5KN1mAWooOgBkvL+zo4kKEl5f/HnbxgXxq/mzbGFeojDpANExnYh3l9rjezavNDQ7G
         q6Ft/5uyRDYQ/yBjbd+L25cXjZtTa2gujBABHM1CzyQ894yUm1xsnoQx+FevcZ4hI8Qa
         Kv7eMad/5ECOwK+ciHVi58w2CPpNLD4pbC/vWiz33UXBsqpeUQ5+1+G20Gjj+89prBbz
         2PaKf3EPso2JYNtYUjpzX3XtkzlvEjSzc0CxdTmk4/bzFsx9++Z0MEeV7C4BIjtiIu74
         gqFA==
X-Gm-Message-State: AOJu0YxTDQxkHa0QLmO60wu84f+kyw88Qfp1xfWOmiOmvhUlmVHljSS1
	0Z2EYq8gRK+xqTAfM/gRLi476WEUN20TdP9xwGCDkM7YKeBw/CiWScIz4Y+9wg==
X-Gm-Gg: ASbGnctn5ybgdxFJxekje2jRk24KWSyZyk17QjBRuHe/gTMRL51Lc+sS4Uce4RsJN4o
	W0mzKosxRTFXCK0WlmUsUdf6puLK2NVGIWIawTRXp/98GOPHg9nKfQ0dGX3q+a8OYxwRV+aEM1Q
	8CetSv73QtOJKAIaeu0GNTTH7sdiZXOlHa+02cFQt9GKB90ka8qJj6vkUI/ud4zJcJSvfpdn2CH
	23SwW2t16gDAd9hqf94/DIOuC31scfn6BsfLAF9I8g2PUEW+yiFG4VPc4yfWZ/tWXhgaPKe9Dv+
	JUxvn80Vuy5P7GoWPVMCcveoPzDXAjUH0KN9oBXuNuNYDKVqx5BelP8JH6jx+0jZDBrV8gUT1V6
	Ss56aza/3SRHaiPw9loDvPDeJC08KmeP3X0rLqnqr3xbSDqW9G3F5fpt0OY+pwai9J1JJULipNB
	vxqHU1UvJP45sLF9BDB+33M1c=
X-Google-Smtp-Source: AGHT+IGbPEKVImvUwTtopae53CCi+VrUJIcKQayVJEk6B0ccPAl5NFF2NIwYcNd2JhK13t4BPE6QWA==
X-Received: by 2002:a05:6a00:99f:b0:77f:23dd:1e20 with SMTP id d2e1a72fcca58-7a220ad3073mr4606861b3a.24.1760706203447;
        Fri, 17 Oct 2025 06:03:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-79cf0a052b8sm17350702b3a.67.2025.10.17.06.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 28/29] hwmon: (corsair-psu) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:20 -0700
Message-ID: <20251017130221.1823453-29-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251017130221.1823453-1-linux@roeck-us.net>
References: <20251017130221.1823453-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attribute access is now serialized in the hardware monitoring core,
so locking in the driver code is no longer necessary. Drop it.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/corsair-psu.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 6b5c8f200780..dddbd2463f8d 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -9,11 +9,9 @@
 #include <linux/errno.h>
 #include <linux/hid.h>
 #include <linux/hwmon.h>
-#include <linux/hwmon-sysfs.h>
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/mutex.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
@@ -124,7 +122,6 @@ struct corsairpsu_data {
 	struct device *hwmon_dev;
 	struct dentry *debugfs;
 	struct completion wait_completion;
-	struct mutex lock; /* for locking access to cmd_buffer */
 	u8 *cmd_buffer;
 	char vendor[REPLY_SIZE];
 	char product[REPLY_SIZE];
@@ -220,7 +217,6 @@ static int corsairpsu_request(struct corsairpsu_data *priv, u8 cmd, u8 rail, voi
 {
 	int ret;
 
-	mutex_lock(&priv->lock);
 	switch (cmd) {
 	case PSU_CMD_RAIL_VOLTS_HCRIT:
 	case PSU_CMD_RAIL_VOLTS_LCRIT:
@@ -230,17 +226,13 @@ static int corsairpsu_request(struct corsairpsu_data *priv, u8 cmd, u8 rail, voi
 	case PSU_CMD_RAIL_WATTS:
 		ret = corsairpsu_usb_cmd(priv, 2, PSU_CMD_SELECT_RAIL, rail, NULL);
 		if (ret < 0)
-			goto cmd_fail;
+			return ret;
 		break;
 	default:
 		break;
 	}
 
-	ret = corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
-
-cmd_fail:
-	mutex_unlock(&priv->lock);
-	return ret;
+	return corsairpsu_usb_cmd(priv, 3, cmd, 0, data);
 }
 
 static int corsairpsu_get_value(struct corsairpsu_data *priv, u8 cmd, u8 rail, long *val)
@@ -797,7 +789,6 @@ static int corsairpsu_probe(struct hid_device *hdev, const struct hid_device_id
 
 	priv->hdev = hdev;
 	hid_set_drvdata(hdev, priv);
-	mutex_init(&priv->lock);
 	init_completion(&priv->wait_completion);
 
 	hid_device_io_start(hdev);
-- 
2.45.2

