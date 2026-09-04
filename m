Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA5E3A6412
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 02:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488499; cv=none; b=KVulshvE+0ge6UJilB2tcJ5KMg4tip5wySQtdptVo/1wUiOWPCKfcuFT4LIj8vNKFVhKXZZjMY/PbzAkGjVzbZzhPdLhyx4kzIdhW1HQmMSTmjf4UlVJ8YY2UoV+CCcyGBooQdRbmrRTRV6pV4WZKexaDdO7QeHPUShyeBLVNQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488499; c=relaxed/simple;
	bh=h54IVhOz972r9SlibD/NmMun8S4bH+/JzcBwGAYcQwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMt1OVhV2pzkpQdaIscmnsuGoTZbSSvE4/Oc2gOET0NkVTkq54FV21qY3V/0WqE2/CHAmaIcpBjaCaTi3OPuW5faT0jkNY6/gUnsmfpEfItsV1wrJnoBkSUZun5l9OgiNKbhHjAmJLDx84e3PZ2yCG/VBwMydoEhqDftSf6KutM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=K8LtjMrI; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="K8LtjMrI"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cd8e45460so7956816d6.1
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Sep 2026 19:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1788488497; x=1789093297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6XzdnjPULcLNPcEZR2pYapYG2gyMXOX+lXNgNvow9k=;
        b=K8LtjMrIujjE8BqrAJs2WwTlx0To3F0BAoEt3yzqQtbVvaKZ/hydpdpzyyXt+6v7xv
         0bE2tH3+Uvx7pbUYyRkos82q80bdy0Y6CePI+w09AXbSgacN3TzkBMnV6Q1oLce9jmAk
         ODEuofXDLmtE5TxD1LLqBJ8YqYOrmfX0t7hQC0c7I8mXuZrqxf/5oOk16FJqH5Ty+Rm6
         48nSPdNUvPxCeZgo7tOy1OxQIpL88PTRJlSKC6dM79MHw2WhaD9huuj6pvofNJ4NEG1R
         sfhVdbi9kv2yuCFxv4+0/ZRREPS7RxgoTkb6OsUOTX0Vb2eaNa08HNBqUB/ccc0hNyEb
         ZnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488497; x=1789093297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6XzdnjPULcLNPcEZR2pYapYG2gyMXOX+lXNgNvow9k=;
        b=aPEQUs1LnnKSAL/JbeAX4OLx5vKnU9tJvC/49PX/U0nabJ2CiZj3+e04gubrKcvl8L
         kbmORYmKKXIghOrxryBPUoe0qFqhRgqITr1IBCGhxxNZXiefsRG8QTLD2Y1nlgyqBb6E
         W3nNBuvyl1oJvbTPAe8QUa4uFI9aORA1KF2lTWPGjmbt2ymraPb2S2VOZAYWaGt1FHQZ
         yKQDJuCgI/jwQFLY56GsxMkjPPTdKF7WaI5KX95ccw9xAxBBO6jcHY7RUYJqx0gczgTK
         sjzKGsHyvKumAF0p7QuYPgSxaAb+FycXSAMG/vdrd4j6zGuhWEJBXaBUTLRGCIWy8ic3
         pF2w==
X-Forwarded-Encrypted: i=1; AKwUvBygMMLqbLN7Thrzc9FDBnXb1UbfcnpDxhe63CHA6LpQpGRZI1oE4SZoNIA7PM2GPA2h5P4lxkZlPMwQRg==@vger.kernel.org
X-Gm-Message-State: AFuF++n07j5kxKZpSltB11zQmOZc2PIN4lu0kt97tm3HijgAbvajS6RJ
	HqRbY7w6k35af2H7i8gyKfhGcheY1Itzj5pf1cV68XEFGUfqYCV1aR0p8uUUWOqPN8c=
X-Gm-Gg: AYBFou1OIwIBvpdFssaUgoy92sv0/Ph4UlWRupqDNmKMF4iQrk+uk4fJ2MPS4Jtvg13
	HQP1G3YWVT/QGEGVkLzsOCq7Y1zV7tUD6fvk9hIgFEWulT/k8lBeGFr+xaDeybM6AIVnOYKrHZL
	8svzCBKhwBuME/wOFqToZ4TRoelNfiZ3bKBK10J8meNrAbsX49ZVyWC0hYAio824rNj0jRUurMU
	wk/4c1yXWmh+vDSU5TO7vvZGxL3ksAhTWBo+K1FKZKTx6yPi3P2GjwFi0f8g+9GHTFTm7wPl5dQ
	tlyPSuYsS7TMqQAI+yfyAiERH5uWxDNQGC85FB2I7Yy0wnYoqS7fZla2WTmHVTqJunsnI3v5KcM
	zpe0Myz6tWsF+8X5bo0W8MtvcucSeuLJKa8IZAy3XhjM9ObSTsPPZTVO4036Fon1JFepL051Dds
	3QUb/zWUmGdkwWsLQ01fCwCM8arp+wyIT3juGrX4Mahas0ki9Fhr2huf2wB4dARBTcwBm68cPec
	YeBa8cYriiEIFChoeHxb/0oCVOSoUFUTw==
X-Received: by 2002:a05:6214:8083:b0:90c:e10b:d9cb with SMTP id 6a1803df08f44-9103ef766a8mr46629006d6.6.1788488497259;
        Thu, 03 Sep 2026 19:21:37 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040595f81sm9508846d6.2.2026.09.03.19.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:21:36 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (asus_rog_ryujin) Validate HID report lengths
Date: Thu,  3 Sep 2026 22:21:28 -0400
Message-ID: <20260904022129.97896-2-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904022129.97896-1-renari@arimil.com>
References: <20260904022129.97896-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rog_ryujin_raw_event() parses response headers and payload fields without
first checking that they are present in the received report. A short report
can therefore make the driver consume uninitialized bytes from the HID
transport buffer and expose them as sensor values through sysfs.

Validate the response header and the fields used by each response type
before parsing them.

Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hwmon/20260812104617.858D01F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 702edb831394..f4d99c510369 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -422,10 +422,15 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 {
 	struct rog_ryujin_data *priv = hid_get_drvdata(hdev);
 
-	if (data[0] != RYUJIN_CMD_PREFIX)
+	if (size < 2 || data[0] != RYUJIN_CMD_PREFIX)
 		return 0;
 
 	if (data[1] == RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
+		if (size <= priv->info->temp_offset + 1 ||
+		    size <= priv->info->pump_speed_offset + 1 ||
+		    size <= priv->info->fan_speed_offset + 1)
+			return 0;
+
 		/* Received coolant temp and speeds of pump and internal fan */
 		priv->temp_input[0] = data[priv->info->temp_offset] * 1000 +
 			data[priv->info->temp_offset + 1] * 100;
@@ -437,6 +442,9 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 		if (!completion_done(&priv->cooler_status_received))
 			complete_all(&priv->cooler_status_received);
 	} else if (data[1] == RYUJIN_GET_CONTROLLER_SPEED_CMD_RESPONSE) {
+		if (size <= RYUJIN_CONTROLLER_SPEED_3 + 1)
+			return 0;
+
 		/* Received speeds of four fans attached to the controller */
 		priv->speed_input[2] = get_unaligned_le16(data + RYUJIN_CONTROLLER_SPEED_1);
 		priv->speed_input[3] = get_unaligned_le16(data + RYUJIN_CONTROLLER_SPEED_2);
@@ -446,6 +454,9 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 		if (!completion_done(&priv->controller_status_received))
 			complete_all(&priv->controller_status_received);
 	} else if (data[1] == RYUJIN_GET_COOLER_DUTY_CMD_RESPONSE) {
+		if (size <= RYUJIN_INTERNAL_FAN_DUTY)
+			return 0;
+
 		/* Received report for pump and internal fan duties (in %) */
 		if (data[RYUJIN_PUMP_DUTY] == 0 && data[RYUJIN_INTERNAL_FAN_DUTY] == 0) {
 			/*
@@ -472,6 +483,9 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 		if (!completion_done(&priv->cooler_duty_received))
 			complete_all(&priv->cooler_duty_received);
 	} else if (data[1] == RYUJIN_GET_CONTROLLER_DUTY_CMD_RESPONSE) {
+		if (size <= RYUJIN_CONTROLLER_DUTY)
+			return 0;
+
 		/* Received report for controller duty for fans (in PWM) */
 		if (data[RYUJIN_CONTROLLER_DUTY] == 0) {
 			/*
-- 
2.55.0

