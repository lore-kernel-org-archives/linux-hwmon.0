Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FEE3B4EBB
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 22:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908264; cv=none; b=ASJRN/xqwoObMeGTcHmPDGHptWEuPK/0bSwcWTu9HKfSG06EnbwpFdITY5hwvCNKCdRXMd6BAMOI+BiGQ5PRGAxDkmrqd6n7ecvJy0kSKJ1muDsbuazTkV/G6cK1BnjxailVFeOk6NE1SXJBbYQm6151FgiUvRNo8au2cENm6mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908264; c=relaxed/simple;
	bh=Vi3BmT7ZDkiqyokg+wo6JFBFy7A29xrg2kuZJqXCm60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NtxDI6y/nr+KUhGJYNGT8yP1VBCkpaY4wapp6lyy5ca5G4LsNTR4BANarzfm8Vt+5Ttl4oTQHlccvglJIlHy5CB/r8tPTdAChY/tFl4djCWO2LujSZNcXI87+Amixwl89VEYgcmmaS1NXkP7wvJhAkRgEXVmpx4q8l/S+Z6xK/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NovJKql0; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NovJKql0"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-39266382df6so4249666a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 15:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788908262; x=1789513062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfnOswr7eo1XQosDaF0vBD6HXJXxp8BEfMaGl2218a4=;
        b=NovJKql00yphvqYTYk+iBhd0giPXHuSlsfwsN0tLS1X0BbjQ95nIlOwU9ABoTfCxia
         Ml+BjY8y6jrRbF53fHP0ST7jkXc7mWgVCWAwbZe/VQymBEsq0MeHQWOQAhrhhRG8UtTO
         c1pdLvJEW3MgaNK5U4sxYf8QQt8RgcB5dcddD1D7/OOIHFBTZrdVk35M0v9uOfWaBR7z
         mTfuH9dgwsolA3w1rfiVJm5gzinUTrc7gjaBQc+2NXNJ/H7rmFXPUbc3acVWaH3UtyAJ
         WO1NywkZQYMzOKolNnA5/+Oc+LhiTsJjDPwwHqfWYGEpr+vmY0PQF5zuW7SZdve7o9+K
         ELLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788908262; x=1789513062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfnOswr7eo1XQosDaF0vBD6HXJXxp8BEfMaGl2218a4=;
        b=iWgHcOKQrYGL/jq4EqKtceb/kgnMJPjcTlEtifyIe9jH0fuBjiUGQSTlsOio+b+V24
         DmksLrjqynt5V5SHtGjTpM88lDhZ4jVS0j5g3ifOlP6dd7g1iP0eIbnVCO2k/61LXduT
         bAWL3CSJUl+jK2APcI4Ged4h1fdoq4jySn0J0J6zrYoTWOW6PT8zpXtIS/nHpxNdRhMW
         5wnH2fmf5OkDdbh4X74bSZS0NK1CaxLEzQNDakkVpRIkUXMNqcMTMHUPdRxhFkAH/c/g
         HSAUHzUKTKCZQ327mj3sZrl8Z3JKLbJe4k43n+XQ4VqU3ULYZi6HRg3wFfiC18+ZOniR
         qRVA==
X-Forwarded-Encrypted: i=1; AKwUvBwZDOIr6Fbr9EfboLxu52ZkA8MItbQvCXDK/yGvuY9K1bYbEi4y7kdqws4ny47jsF9nzC8eTcJ+NLqriQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kXIIdodMGQ7orULTXYwNTEDLZXm4hd67mCjt3a+7VHJDepAuIs
	LLSeGIOG7QuFBrmiKQNHs9S5qS3zq2aaFMoK9IQN9LLVGLYE5egCyqxh
X-Gm-Gg: AYBFou2Xe453GXL6uxMoUaXp0wEGEtReBujvDnTQJojRdInH5zVCClI9wHFC+h8yEyN
	grcExHjwP16LO2kIkOKTdggX/8eprEDgd+UdLYg0tsMgc03FOkqvWpaUj3CLFusbEdbokghon2w
	TJvb/i+JQD8kMjY8jblBaxCmBiMA70vy0ZcKZL2B8rw3Qy/yLByD5v7xvEy5wHRLUd2Oyx9AEZ9
	jdd4y9szncdXQPP3XrxymP1H8PtMsDacDMLdAtNEOuV6sPGmhXvx6zPe54y0vIMKiWgR7nA/u0n
	pLOLYnqVW1HhGn/hWFblMBKBEsI4O481tjuo8nLfmwHSmjgRiclA00JvQ65FXzDLAvGcmNtAiYW
	jjkPLgZU343R/QWXsi7hqtPEm9kc5E3/LuQ/U4VoeKLdxlyJksmDmvecrab6LBSTjDiXcGKXmBW
	OZ8kH9zNbM7oDQjWR05gk79/b1ZG3ru3Avhh6a3rib1df76recRrqHHtH8Ck8Cd+5bXYw=
X-Received: by 2002:a17:90b:2b8c:b0:398:9be6:f995 with SMTP id 98e67ed59e1d1-39b262aaf48mr51243967a91.20.1788908261877;
        Tue, 08 Sep 2026 15:57:41 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:91c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm35210942c88.13.2026.09.08.15.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 15:57:41 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	mohsin.bashr@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v3 1/6] eth: fbnic: move sensor read logic out of fbnic_mac
Date: Tue,  8 Sep 2026 15:57:32 -0700
Message-ID: <20260908225737.3034403-2-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908225737.3034403-1-limzhineng2@gmail.com>
References: <20260908225737.3034403-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sensor read lived behind the fbnic_mac get_sensor op, but it is only
ever used by the hwmon subsystem. Move the read into fbnic_hwmon.c and
call it directly there, closer to where it is used, and drop the
now-unused get_sensor op from struct fbnic_mac. No functional change.

Signed-off-by: Zinc Lim <limzhineng2@gmail.com>
---
 drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c | 56 ++++++++++++++++++-
 drivers/net/ethernet/meta/fbnic/fbnic_mac.c   | 55 ------------------
 drivers/net/ethernet/meta/fbnic/fbnic_mac.h   |  2 -
 3 files changed, 54 insertions(+), 59 deletions(-)

diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
index def8598aceec..6c8c66ab86c1 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_hwmon.c
@@ -28,15 +28,67 @@ static umode_t fbnic_hwmon_is_visible(const void *drvdata,
 	return 0;
 }
 
+static int fbnic_hwmon_sensor_read(struct fbnic_dev *fbd, int id, long *val)
+{
+	struct fbnic_fw_completion *fw_cmpl;
+	int err = 0;
+	s32 *sensor;
+
+	fw_cmpl = fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
+	if (!fw_cmpl)
+		return -ENOMEM;
+
+	switch (id) {
+	case FBNIC_SENSOR_TEMP:
+		sensor = &fw_cmpl->u.tsene.millidegrees;
+		break;
+	case FBNIC_SENSOR_VOLTAGE:
+		sensor = &fw_cmpl->u.tsene.millivolts;
+		break;
+	default:
+		err = -EINVAL;
+		goto exit_free;
+	}
+
+	err = fbnic_fw_xmit_tsene_read_msg(fbd, fw_cmpl);
+	if (err) {
+		dev_err(fbd->dev,
+			"Failed to transmit TSENE read msg, err %d\n",
+			err);
+		goto exit_free;
+	}
+
+	if (!wait_for_completion_timeout(&fw_cmpl->done, 10 * HZ)) {
+		dev_err(fbd->dev, "Timed out waiting for TSENE read\n");
+		err = -ETIMEDOUT;
+		goto exit_cleanup;
+	}
+
+	/* Handle error returned by firmware */
+	if (fw_cmpl->result) {
+		err = fw_cmpl->result;
+		dev_err(fbd->dev, "%s: Firmware returned error %d\n",
+			__func__, err);
+		goto exit_cleanup;
+	}
+
+	*val = *sensor;
+exit_cleanup:
+	fbnic_mbx_clear_cmpl(fbd, fw_cmpl);
+exit_free:
+	fbnic_fw_put_cmpl(fw_cmpl);
+
+	return err;
+}
+
 static int fbnic_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
 			    u32 attr, int channel, long *val)
 {
 	struct fbnic_dev *fbd = dev_get_drvdata(dev);
-	const struct fbnic_mac *mac = fbd->mac;
 	int id;
 
 	id = fbnic_hwmon_sensor_id(type);
-	return id < 0 ? id : mac->get_sensor(fbd, id, val);
+	return id < 0 ? id : fbnic_hwmon_sensor_read(fbd, id, val);
 }
 
 static const struct hwmon_ops fbnic_hwmon_ops = {
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
index 53b7a938b4c2..fba2e2efaeb8 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
@@ -899,60 +899,6 @@ fbnic_mac_get_rmon_stats(struct fbnic_dev *fbd, bool reset,
 			    TMI_STAT_TX_PACKET_9217_MAX_BYTES);
 }
 
-static int fbnic_mac_get_sensor_asic(struct fbnic_dev *fbd, int id,
-				     long *val)
-{
-	struct fbnic_fw_completion *fw_cmpl;
-	int err = 0;
-	s32 *sensor;
-
-	fw_cmpl = fbnic_fw_alloc_cmpl(FBNIC_TLV_MSG_ID_TSENE_READ_RESP);
-	if (!fw_cmpl)
-		return -ENOMEM;
-
-	switch (id) {
-	case FBNIC_SENSOR_TEMP:
-		sensor = &fw_cmpl->u.tsene.millidegrees;
-		break;
-	case FBNIC_SENSOR_VOLTAGE:
-		sensor = &fw_cmpl->u.tsene.millivolts;
-		break;
-	default:
-		err = -EINVAL;
-		goto exit_free;
-	}
-
-	err = fbnic_fw_xmit_tsene_read_msg(fbd, fw_cmpl);
-	if (err) {
-		dev_err(fbd->dev,
-			"Failed to transmit TSENE read msg, err %d\n",
-			err);
-		goto exit_free;
-	}
-
-	if (!wait_for_completion_timeout(&fw_cmpl->done, 10 * HZ)) {
-		dev_err(fbd->dev, "Timed out waiting for TSENE read\n");
-		err = -ETIMEDOUT;
-		goto exit_cleanup;
-	}
-
-	/* Handle error returned by firmware */
-	if (fw_cmpl->result) {
-		err = fw_cmpl->result;
-		dev_err(fbd->dev, "%s: Firmware returned error %d\n",
-			__func__, err);
-		goto exit_cleanup;
-	}
-
-	*val = *sensor;
-exit_cleanup:
-	fbnic_mbx_clear_cmpl(fbd, fw_cmpl);
-exit_free:
-	fbnic_fw_put_cmpl(fw_cmpl);
-
-	return err;
-}
-
 static const struct fbnic_mac fbnic_mac_asic = {
 	.init_regs = fbnic_mac_init_regs,
 	.get_link = fbnic_mac_get_link,
@@ -966,7 +912,6 @@ static const struct fbnic_mac fbnic_mac_asic = {
 	.get_rmon_stats = fbnic_mac_get_rmon_stats,
 	.link_down = fbnic_mac_link_down_asic,
 	.link_up = fbnic_mac_link_up_asic,
-	.get_sensor = fbnic_mac_get_sensor_asic,
 };
 
 /**
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.h b/drivers/net/ethernet/meta/fbnic/fbnic_mac.h
index 10f30e0e8f69..bde2daa65645 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.h
@@ -137,8 +137,6 @@ struct fbnic_mac {
 
 	void (*link_down)(struct fbnic_dev *fbd);
 	void (*link_up)(struct fbnic_dev *fbd, bool tx_pause, bool rx_pause);
-
-	int (*get_sensor)(struct fbnic_dev *fbd, int id, long *val);
 };
 
 int fbnic_mac_init(struct fbnic_dev *fbd);
-- 
2.53.0-Meta

