Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC5333033A
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 13:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760706204; cv=none; b=ueBijbSBlHLUxvwQoZgztmXsELOJZy0C0F3PU9pHgmoiThjW3zjlZUbNNtSG0qqWbE42UymGviqWa7VTet8iiMBwKSrTaZ/30mrRPRW6ehxBR202zsg1bOYE8oh16/pVm29cIAh0+vByPlhNTqEvPojKkJ2iZm7RTrEoLuZMZ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760706204; c=relaxed/simple;
	bh=8m8UMVFuazYG//cZot9k+kpHhMPuvJJ1EXSUuEV6cvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d8OA0qXkHmZZOuUvBnDWmBZm5TFWLSEmw7DQ33cG5g8kFMKzkMURukv4RulzO0MbV3fhMxsLshy+L63nvLcgwls/rqAgCxnhIbtVfGFcbZ0tmOdFJQOyacNfhaM9ELmFCNOAzgCv3iZOsJZbVahr9fqk4VzuPlnHCvNEtramKr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQAmQ2y+; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQAmQ2y+"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so1929598a91.1
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760706201; x=1761311001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNS1IuwFsY2IsLZQaI8FiBDP7pXFq4wXZOvMLDg5BsA=;
        b=bQAmQ2y+FOZj63iQ5W2D4rAQEQH+KYjl19U3HbQVw6CD78P2AsCGFqdG3EP2jioNF8
         ZWA2GjL6UHD/FLA+eMhVFUSFFNqIci4gHlyyewsM4G/PzuMRG02rAtwZKn4+BYCRUE/R
         xNFn5ffgoL7Z0s4ZL27Ipe0yH6IaEUo6nWwvu2MEf5g6MWFYkHvK6d8zfEhAQckbMoaH
         OEAagGa8h2CAvujnjHtojY9E3gvcJjVw+Akxmvyt4DfXRZaQ2OUnkeHaYg9Zcu4yB5Ps
         3gKiLlCLr10TN1GxAQcFolA5VUEX7Qe+UZM6T5tVny5RiPFG3PpybLqZUqLRCgiwkX2w
         mL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760706201; x=1761311001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fNS1IuwFsY2IsLZQaI8FiBDP7pXFq4wXZOvMLDg5BsA=;
        b=WjRNPWvg5fzfmRgBMs6zMUDI8c7HEsFcLCpbQDu/l/eUCiUQ9W89FISuPlGhMyUrlB
         V8oLkH37Hk1KdtiiNEpi173hgIZsy20InRJoBELivCASer4zpFI3AkkWpvdUUoyODX4M
         lvDGfUoBqzSoUUDQVDK9PoR+jhOGYjAIYfRvKs8xgZrqFKCKtg7eHpXxsAvDbHmQJdxJ
         K+EV7aYmJjBssTVSmVARnTK6kWPOJ9BUCgYIdtxTdxPPKa4OgAZp0ixhzT9fwSE8Wz54
         AaJZY3CHUVMip89pHfUoSF7uc63psIc+uuAFfMDKFnIoUpOUm7xkJUgDvKiWz+RhbjBo
         Rr8Q==
X-Gm-Message-State: AOJu0YylxG3PmCntw1obkdyY4E+u+Hkh16a48vPPXEfAWnjiBOQQK5Sj
	Hn6DHYqoKcEHprD2jJheLbD+UDZYf6fMGxSVJYdV977qe2dNtuF+4B2p9Zh4Ww==
X-Gm-Gg: ASbGncscD9Du58jwkhbxiLBy50Xi1ip4eesV5ehQZiwbquiz6O4lsJj0Elpy5nOuHJR
	e1EU47n9zxqFnuUzhaGXLR93H5dJatWv5EAWSJBdFHQ7dqMSJDmVzl6ydD6m7wiLuNoh3k30PcG
	6xfiezflfylvnPhNjsM9akYZFVinx7hvVkBaQf/w3ZfAzEAAWTo/tCIdCj9+sYn9O8jPMJ1ineT
	BTySQAAbTnaWLoCcgqvE+KRcRyAY4ku6DCqmpN2gnVxfqyaP92ZSzkZUgIRABNFnLYgwnfoxEjO
	8wZnACCJOSV62z6lNbGVTwJ9AYKOKMkgsrsB05Qfx8BpjpubA+aAek8AvN/ITt0OJjuj4VAEZ4d
	Z2SyWiINvfHGZY1fdBA70936MbrefCTYQFWPxTuT+GwUayVeBw4OAgQG005esZoXnOix0ynkFZG
	2+x1nveHKzJt2z
X-Google-Smtp-Source: AGHT+IFyN+bvf7vgAsuvmVUADhIy10I4ZKAfKQ58Yg65gdT+G2JTS3J1n3+R4F//syiocJq38Iek8g==
X-Received: by 2002:a17:90b:51c4:b0:32e:5cba:ae11 with SMTP id 98e67ed59e1d1-33bcf8f9babmr4079126a91.28.1760706200511;
        Fri, 17 Oct 2025 06:03:20 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bd7b3dad4sm2884515a91.16.2025.10.17.06.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 06:03:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 26/29] hwmon: (asus_rog_ryujin) Rely on subsystem locking
Date: Fri, 17 Oct 2025 06:02:18 -0700
Message-ID: <20251017130221.1823453-27-linux@roeck-us.net>
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
 drivers/hwmon/asus_rog_ryujin.c | 48 +++++++--------------------------
 1 file changed, 9 insertions(+), 39 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index e5e93a20723c..10a1f5aca988 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -81,10 +81,6 @@ static const char *const rog_ryujin_speed_label[] = {
 struct rog_ryujin_data {
 	struct hid_device *hdev;
 	struct device *hwmon_dev;
-	/* For locking access to buffer */
-	struct mutex buffer_lock;
-	/* For queueing multiple readers */
-	struct mutex status_report_request_mutex;
 	/* For reinitializing the completions below */
 	spinlock_t status_report_request_lock;
 	struct completion cooler_status_received;
@@ -153,18 +149,10 @@ static umode_t rog_ryujin_is_visible(const void *data,
 /* Writes the command to the device with the rest of the report filled with zeroes */
 static int rog_ryujin_write_expanded(struct rog_ryujin_data *priv, const u8 *cmd, int cmd_length)
 {
-	int ret;
-
-	mutex_lock(&priv->buffer_lock);
-
 	memcpy_and_pad(priv->buffer, MAX_REPORT_LENGTH, cmd, cmd_length, 0x00);
-	ret = hid_hw_output_report(priv->hdev, priv->buffer, MAX_REPORT_LENGTH);
-
-	mutex_unlock(&priv->buffer_lock);
-	return ret;
+	return hid_hw_output_report(priv->hdev, priv->buffer, MAX_REPORT_LENGTH);
 }
 
-/* Assumes priv->status_report_request_mutex is locked */
 static int rog_ryujin_execute_cmd(struct rog_ryujin_data *priv, const u8 *cmd, int cmd_length,
 				  struct completion *status_completion)
 {
@@ -196,14 +184,11 @@ static int rog_ryujin_execute_cmd(struct rog_ryujin_data *priv, const u8 *cmd, i
 
 static int rog_ryujin_get_status(struct rog_ryujin_data *priv)
 {
-	int ret = mutex_lock_interruptible(&priv->status_report_request_mutex);
-
-	if (ret < 0)
-		return ret;
+	int ret;
 
 	if (!time_after(jiffies, priv->updated + msecs_to_jiffies(STATUS_VALIDITY))) {
 		/* Data is up to date */
-		goto unlock_and_return;
+		return 0;
 	}
 
 	/* Retrieve cooler status */
@@ -211,36 +196,30 @@ static int rog_ryujin_get_status(struct rog_ryujin_data *priv)
 	    rog_ryujin_execute_cmd(priv, get_cooler_status_cmd, GET_CMD_LENGTH,
 				   &priv->cooler_status_received);
 	if (ret < 0)
-		goto unlock_and_return;
+		return ret;
 
 	/* Retrieve controller status (speeds) */
 	ret =
 	    rog_ryujin_execute_cmd(priv, get_controller_speed_cmd, GET_CMD_LENGTH,
 				   &priv->controller_status_received);
 	if (ret < 0)
-		goto unlock_and_return;
+		return ret;
 
 	/* Retrieve cooler duty */
 	ret =
 	    rog_ryujin_execute_cmd(priv, get_cooler_duty_cmd, GET_CMD_LENGTH,
 				   &priv->cooler_duty_received);
 	if (ret < 0)
-		goto unlock_and_return;
+		return ret;
 
 	/* Retrieve controller duty */
 	ret =
 	    rog_ryujin_execute_cmd(priv, get_controller_duty_cmd, GET_CMD_LENGTH,
 				   &priv->controller_duty_received);
-	if (ret < 0)
-		goto unlock_and_return;
-
-	priv->updated = jiffies;
-
-unlock_and_return:
-	mutex_unlock(&priv->status_report_request_mutex);
 	if (ret < 0)
 		return ret;
 
+	priv->updated = jiffies;
 	return 0;
 }
 
@@ -303,14 +282,11 @@ static int rog_ryujin_write_fixed_duty(struct rog_ryujin_data *priv, int channel
 		 * Retrieve cooler duty since both pump and internal fan are set
 		 * together, then write back with one of them modified.
 		 */
-		ret = mutex_lock_interruptible(&priv->status_report_request_mutex);
-		if (ret < 0)
-			return ret;
 		ret =
 		    rog_ryujin_execute_cmd(priv, get_cooler_duty_cmd, GET_CMD_LENGTH,
 					   &priv->cooler_duty_received);
 		if (ret < 0)
-			goto unlock_and_return;
+			return ret;
 
 		memcpy(set_cmd, set_cooler_duty_cmd, SET_CMD_LENGTH);
 
@@ -329,11 +305,7 @@ static int rog_ryujin_write_fixed_duty(struct rog_ryujin_data *priv, int channel
 			set_cmd[RYUJIN_SET_COOLER_FAN_DUTY_OFFSET] = val;
 		}
 
-		ret = rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH, &priv->cooler_duty_set);
-unlock_and_return:
-		mutex_unlock(&priv->status_report_request_mutex);
-		if (ret < 0)
-			return ret;
+		return rog_ryujin_execute_cmd(priv, set_cmd, SET_CMD_LENGTH, &priv->cooler_duty_set);
 	} else {
 		/*
 		 * Controller fan duty (channel == 2). No need to retrieve current
@@ -538,8 +510,6 @@ static int rog_ryujin_probe(struct hid_device *hdev, const struct hid_device_id
 		goto fail_and_close;
 	}
 
-	mutex_init(&priv->status_report_request_mutex);
-	mutex_init(&priv->buffer_lock);
 	spin_lock_init(&priv->status_report_request_lock);
 	init_completion(&priv->cooler_status_received);
 	init_completion(&priv->controller_status_received);
-- 
2.45.2

