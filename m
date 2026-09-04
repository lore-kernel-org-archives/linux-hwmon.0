Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDED3A8755
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 02:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488503; cv=none; b=oTWK4AGFhDBPLX3EwoC5986IT4cPs4fEq9MsoS0XwCElTcKYknFMzV5ezpvDc8cr9Lrgf/svWcHBadeBXfgEaM1w0ML1VhjEUk3mBZy8NqD2zAPNO8u9v/xcnjGaPgJFmZXlIC4cAEdKf2uAA9E6OGB+rggxeKTPuIpe9oBTJQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488503; c=relaxed/simple;
	bh=H1UNvTnuYG8Awa8ERxE1CNQ0nSBnUAs6dRe3SxhFr08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KiU312JZo2qjhci0v6HdNopNQ6L2+AOCaGqB3uJ+EndlwuTzwP0hJS/Cmx3//c9JSooq3Ajv1sMh0UnSjfzsWq2K+Vr8EvGtfg7fp2sPYWPqzAx1CE8d6IbQkKs2gso533PtIPbU/RKoZMCh3ypo4m4rQcUBRxrfiNz3LjVkoEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=IjCtZzQU; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="IjCtZzQU"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-90ccbed6edcso8331646d6.0
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Sep 2026 19:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1788488500; x=1789093300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SMoW1EQ+b/ZcFB/LLo+fHxnLlm0WSLZfhGJVT6/r1EM=;
        b=IjCtZzQUckAXauUC9v7Yv82diBzeuxDrczVQgcmcoLg14gK/PTBAxxmDquApMznNJM
         WByN4v4VuKOhkb7up1SobZrJmTClLMHitn+r0OTKU5bDw+UxIR/LGMLYhQWanbeeZUCs
         d1Vs2sH4fA8GsLHVmlLikRKGwhwEhZUsJCfJ1pK4IoPT2Nny7VJqZrrkfzJpupuJoMwX
         bCtDPEU9lxYRGQXuusj16kOaYKMTRf8XLtkEdimfrn6E5xU0TH54BYa4R3Qw2wVuYM60
         LGb7X/VYkVzpJd+8kxtLa4Vm6iCPwKW7Ql7fr3oVAsNl6gwdjAI7xHYPlQj3CM64rjhy
         evBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488500; x=1789093300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SMoW1EQ+b/ZcFB/LLo+fHxnLlm0WSLZfhGJVT6/r1EM=;
        b=hgLAhRsFxs0WqOrr8kUmOaOFJnPgwJMbn3jiN659/kC63chesoSSe/glTB7UZpdm8L
         U80yWsIQFDCFaobYv//u+51lb44e8YaQJ/0pjq4nqtoEG2TnYNbO5J9FGsB981ykVvZU
         KYXoecBFiWTooa4xqKfZtn/KmxC7et4nEPSRXT8XMj1pamBLSU76QTC/vHQknEV3GH4W
         K6UpR+0cEpJTe8U+V4SMCHy7DHuVGXkh8r6I41aOBo8jgVRnnqmftWsDBv0lm2+kZXvB
         Fw3WGqIQVjRQQbPCosWOB9Dc/O2P+Lo0zMzXHHYH9/lUqg902B/jJkop4MW4nSQSTRJW
         sSdw==
X-Forwarded-Encrypted: i=1; AKwUvBzGacPVyK46Y9+UeahcarxjSyddkjK9ig9k/MHKnaw5y/LmIJB8gwm1hrXWiitdCOkm4a7D1+oLPEiadA==@vger.kernel.org
X-Gm-Message-State: AFuF++nsbK3D92tXBhcYRi4egH9VKgdXvHRe4jbj9fH+e/h5wdFo47KX
	c1WiyQw4B6TlTiNtcx39BGH15zz5FmRRsvmTr3Qjs9UdlWpB1p58uX4sn88BugHSu/A=
X-Gm-Gg: AYBFou1uMHfiSf15vFPBeQkZOpw7UPg6U9EjpzpqRXZ6UzJfg9pR6dRxhrClgxuODt9
	iqcItNGrVRYUrfMjGSOUzqqZ5bcJzbpotWDki+Xg5uxFtKrQJQoDadvkaK52HN4l1eufNEB05pe
	y4wa7xySfmCOYl7u9A1DnU6Zbv0HlvpghMcy1EaA7Wge1vBMACpuCP/5J1fjWHZ5tUlevT2KhR0
	/ZtVsFe1bvHagK9VqnDmhhCLIdE+mELAy9GgkpwvWwuW7N+THWoENvhy3JzRYNXTE7SsGI28okI
	G3XXR/Tg1gNBSyAZLDSYueOwLtr4Y0yBG+Q+KSPtYdsAfcAEnIs1E0KpUaE6tZVa1rUpAMEbqSC
	m6oW6WFPSVtzO07bHPjZcUDcnPvnZkJPJ65iou1e5fZkanFwMDC7PRC0xRxLp2STRHDPtLL0wts
	7rRP6GMo4CgvDgHM8Ia3HTGH11i5ygajDP5oK2tRkOAU1bVofh23jSkjB+BEgdngFwbIRsVUB1y
	WzeiYdVyZTwl9zDHZ79B7EHMzKUBRp5ew==
X-Received: by 2002:a05:6214:da9:b0:910:3453:505e with SMTP id 6a1803df08f44-9103f06a58bmr43755686d6.32.1788488499889;
        Thu, 03 Sep 2026 19:21:39 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040595f81sm9508846d6.2.2026.09.03.19.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:21:39 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus_rog_ryujin) Synchronize HID command and report handling
Date: Thu,  3 Sep 2026 22:21:29 -0400
Message-ID: <20260904022129.97896-3-renari@arimil.com>
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

rog_ryujin_execute_cmd() holds status_report_request_lock while
reinitializing a completion, intending to exclude raw-event handling.
However, rog_ryujin_raw_event() does not acquire the lock when it updates
the completion. A response can therefore race with reinit_completion() and
be lost, leaving the command to time out.

Hold the lock while parsing reports and updating their completions. Use the
irqsave variants in both paths because raw-event handling may run in
interrupt context.

Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hwmon/20260812104617.858D01F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index f4d99c510369..e297557ca346 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -184,6 +184,7 @@ static int rog_ryujin_write_expanded(struct rog_ryujin_data *priv, const u8 *cmd
 static int rog_ryujin_execute_cmd(struct rog_ryujin_data *priv, const u8 *cmd, int cmd_length,
 				  struct completion *status_completion)
 {
+	unsigned long flags;
 	int ret;
 
 	/*
@@ -191,9 +192,9 @@ static int rog_ryujin_execute_cmd(struct rog_ryujin_data *priv, const u8 *cmd, i
 	 * completion. Reinit is done because hidraw could have triggered
 	 * the raw event parsing and marked the passed in completion as done.
 	 */
-	spin_lock_bh(&priv->status_report_request_lock);
+	spin_lock_irqsave(&priv->status_report_request_lock, flags);
 	reinit_completion(status_completion);
-	spin_unlock_bh(&priv->status_report_request_lock);
+	spin_unlock_irqrestore(&priv->status_report_request_lock, flags);
 
 	/* Send command for getting data */
 	ret = rog_ryujin_write_expanded(priv, cmd, cmd_length);
@@ -421,15 +422,18 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 				int size)
 {
 	struct rog_ryujin_data *priv = hid_get_drvdata(hdev);
+	unsigned long flags;
 
 	if (size < 2 || data[0] != RYUJIN_CMD_PREFIX)
 		return 0;
 
+	spin_lock_irqsave(&priv->status_report_request_lock, flags);
+
 	if (data[1] == RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
 		if (size <= priv->info->temp_offset + 1 ||
 		    size <= priv->info->pump_speed_offset + 1 ||
 		    size <= priv->info->fan_speed_offset + 1)
-			return 0;
+			goto unlock;
 
 		/* Received coolant temp and speeds of pump and internal fan */
 		priv->temp_input[0] = data[priv->info->temp_offset] * 1000 +
@@ -443,7 +447,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 			complete_all(&priv->cooler_status_received);
 	} else if (data[1] == RYUJIN_GET_CONTROLLER_SPEED_CMD_RESPONSE) {
 		if (size <= RYUJIN_CONTROLLER_SPEED_3 + 1)
-			return 0;
+			goto unlock;
 
 		/* Received speeds of four fans attached to the controller */
 		priv->speed_input[2] = get_unaligned_le16(data + RYUJIN_CONTROLLER_SPEED_1);
@@ -455,7 +459,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 			complete_all(&priv->controller_status_received);
 	} else if (data[1] == RYUJIN_GET_COOLER_DUTY_CMD_RESPONSE) {
 		if (size <= RYUJIN_INTERNAL_FAN_DUTY)
-			return 0;
+			goto unlock;
 
 		/* Received report for pump and internal fan duties (in %) */
 		if (data[RYUJIN_PUMP_DUTY] == 0 && data[RYUJIN_INTERNAL_FAN_DUTY] == 0) {
@@ -474,7 +478,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 				 * We're expecting a report, so parse it.
 				 */
 				goto read_cooler_duty;
-			return 0;
+			goto unlock;
 		}
 read_cooler_duty:
 		priv->duty_input[0] = rog_ryujin_percent_to_pwm(data[RYUJIN_PUMP_DUTY]);
@@ -484,7 +488,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 			complete_all(&priv->cooler_duty_received);
 	} else if (data[1] == RYUJIN_GET_CONTROLLER_DUTY_CMD_RESPONSE) {
 		if (size <= RYUJIN_CONTROLLER_DUTY)
-			return 0;
+			goto unlock;
 
 		/* Received report for controller duty for fans (in PWM) */
 		if (data[RYUJIN_CONTROLLER_DUTY] == 0) {
@@ -503,7 +507,7 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 				 * We're expecting a report, so parse it.
 				 */
 				goto read_controller_duty;
-			return 0;
+			goto unlock;
 		}
 read_controller_duty:
 		priv->duty_input[2] = data[RYUJIN_CONTROLLER_DUTY];
@@ -512,6 +516,8 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 			complete_all(&priv->controller_duty_received);
 	}
 
+unlock:
+	spin_unlock_irqrestore(&priv->status_report_request_lock, flags);
 	return 0;
 }
 
-- 
2.55.0

