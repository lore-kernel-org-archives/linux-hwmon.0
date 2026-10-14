Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C674A7CA5
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 22:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016553; cv=none; b=CuE/boi5MQcx2Lo28VLEbP/Vi8aI2TylPslpMIebplMwg7PvPTLBqCU+KehO5YXcKA9SFuJSmo5Rp2uMrxfZXE1D7DaxVtSPdBkZUmXLbagKMgjwwpxJ/4so3avLF2Oxq3Vc7qKqmJxFr0FXD2vo2Y0xYkm0iCnWXOOl+jA4eoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016553; c=relaxed/simple;
	bh=YFWq/IvCJbQstHX7Ft2w/D3TTysjlDhgep/4kllNw0U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZZ9tRprNooFxRJLFfemFmcJP/NkZ5VgcVcDq/IhmDaSFxj1tdW/jENj7Tg1f/FOtWhUYYispgfk8sFujQLqv0j9S8awehRuLDH3S7UqenCMSPBVrJFbIFLk+dyId+TK55EAj25gAu/01y+x3BupKFjTWsUHX6B+HusrIKuRPa+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJKxP6FI; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJKxP6FI"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-141395927feso8950496c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 15:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792016551; x=1792621351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJcssE+Ust9/2+nrgLqVuTl5Th0jv3D9ktZ8Z2ELH5c=;
        b=MJKxP6FI606+RMW7an8hm/JiIhPnXGOtW74e2LUA6uUb5XKr3OQSb5BeQvb+gwbnUw
         so3bCPSCAyG+vjbWyrRFLBNHX0lnWWx1tcU2JW/5qkwItlRZDX4FO5GKBf/CLtsPLPHp
         UYno2mxchn+tlYWr4hI8RXNW9C6QRG06rElvVSfmsSknyLXugo2ecJU1/3Lz70ZODiPc
         Jvri/KrHBGP3FSzm3lmrJ0Ks2fLPO8pq3XOWaAkcV0XpF7kY6Zt+bTFfqIDUABVNRI1w
         aOuwd0IOk9GIR/S9Oz6NWyei6GxzJxIiP9ZG1Bi8Ht9pwMEqfU9Liv6zUrapMvGC7sab
         lPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016551; x=1792621351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJcssE+Ust9/2+nrgLqVuTl5Th0jv3D9ktZ8Z2ELH5c=;
        b=VbkjxYFU6AWcjkgNNCZrkyCdLy3El0QRH9hVrBTCnn265sMTPxoYjpEcMdw5UdT+Tt
         9zIBXTudgQoDOYaQx6dt0DTsEVxCjmjujGLsIpbpo+bB8nwseAm+7W5f5as5/luine7T
         Qk7M5ktlJ0DN1sMUcJedMMBaSLiXgOy1uO8zIgeAjgvBI7OspFBLFP4SiLWEayy/19QZ
         WMcNC1livc8ypUEZ8ecF6pHINK9BoSlDqXewlngCy+V7qmzLwHQZfz9jE7EFqW7TCI/u
         L17RtdOO16puWXgr55kTEJz79xc8iPJrS8dqXWYfwfEWDyentaxFuvlGv6deyKlFYEaP
         QYEw==
X-Forwarded-Encrypted: i=1; AKwUvByYbuFKJPxEPxSB1MykNAN3JteBCii8msL0PLvNabp+BXtMkvj99f4dJmVK4R2lxYAgO5dRt4pnlyH1xQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKkt4rfJibOtREogGuV8im7PloW8pBtf+KniB0FC+nZ0w6CVUqr
	3PS9Y6vgt/RC/h/wRMfKHt+VvIKyubGiNsh4NuQt5LcucUyJWVKOHSUv
X-Gm-Gg: AYBFou3IuNkGdiB/AxkPjD9PdEfOOkiCiecfZf2Xr+1ml0EGouDtYL0utfuFpeoGqxf
	9qyp+K/x/8acNy+fjY8tFEDClLJCbv7HZ8TYuwflcZa4dMFcQpozI+rUb4Gvut5a3hlIDUvK0Nm
	FRRNBxnzeyoHD5rNICeNaOY/I1Yq5jWHGo2o3+OJdRvLYwDJvRxc10+XjdMwzfHZC8wDL5MT4K/
	hZVjw1C6dm+JkNSylyoUI1wPaXUcwpNgmFPn256lUCkMGPqI4ATAaZ36/SJlhqYsCAxv0Hie9uh
	ZuDREhqbrX3HIyfvjXlfeQCzLZd2YkuRAVKgaUbci1r6v/LtCA+yOH5ctv/Gl0F8mrFzOYPYYBp
	8CqzYyqBpW+L3aaQfcbwIYwzQg0zsccuHrAVj4o24g7AoVo7j5MkVdCw+u6I1IvmVRFlPRHRIPJ
	UCL3Wwug0zCM+Nr2UDk8jNWv6JhQkBipSmdM3sWixxOJzLO+eSy1q09DP8YqONzcxag6xPutQF1
	lJXBqWBocYmmOse
X-Received: by 2002:a05:701b:454b:20b0:144:f096:4dda with SMTP id a92af1059eb24-16a6203de6dmr22350239c88.43.1792016550880;
        Wed, 14 Oct 2026 15:22:30 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::5:7561])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a567aef5sm49030839c88.19.2026.10.14.15.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 15:22:30 -0700 (PDT)
From: Zinc Lim <limzhineng2@gmail.com>
To: alexanderduyck@fb.com,
	kuba@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	linux@roeck-us.net,
	horms@kernel.org,
	hmohsin@meta.com,
	mike.marciniszyn@gmail.com
Cc: kernel-team@meta.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	zinclim@meta.com,
	limzhineng2@gmail.com
Subject: [PATCH net-next v4 1/6] eth: fbnic: move sensor read logic out of fbnic_mac
Date: Wed, 14 Oct 2026 15:22:19 -0700
Message-ID: <20261014222225.2803660-2-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261014222225.2803660-1-limzhineng2@gmail.com>
References: <20261014222225.2803660-1-limzhineng2@gmail.com>
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
index 16271c717a5a..3e1256ffd141 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
@@ -892,60 +892,6 @@ fbnic_mac_get_rmon_stats(struct fbnic_dev *fbd, bool reset,
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
@@ -959,7 +905,6 @@ static const struct fbnic_mac fbnic_mac_asic = {
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

