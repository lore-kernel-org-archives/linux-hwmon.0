Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9D736F8EE
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 21:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211363; cv=none; b=lxCFn+9J1bZmAzjevZgP54fIWOdiuFZSy7x4o2bNnbLm5+BoMvZkykZI3Q70Ia5GeCBHWyOci28Rez8b0ECWqXNnnk9pSnSAT7WZghios47PXjWQDUyYS9RXySXm4xIb6PKsqSNuD1szURamqpE2JDoTAKBoQZOvxRNJEjnBh/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211363; c=relaxed/simple;
	bh=Vi3BmT7ZDkiqyokg+wo6JFBFy7A29xrg2kuZJqXCm60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BKChO//t2Vgbb0sAD57+9MEp8MdGNvEgyBBcR9bersY78WT2PTG7u0kq77cQwZMPzAzkSP2KmOrWirz1lEASSCe+FulfKDAyBmg61OIGuxwlIJRynZq8Ot/8tRSLI3VjN3CQXMbXXRQW71VrhIC28kdQBosOEWU6127bASaL+1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cg0VjcUA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg0VjcUA"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84830c774a0so187102b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 14:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788211361; x=1788816161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfnOswr7eo1XQosDaF0vBD6HXJXxp8BEfMaGl2218a4=;
        b=cg0VjcUA3pLPu9JrlwsAekoYNmHvnS0VVpBiV1/xrFmBYrEcnPOHo03hjd5HelaJ0S
         o9FZJo3zHuyFJXGLfOXLgpmA5mSV7ShPfsuCkrXX4lRkUoMTlBGxw1z/bPlBcRW7Oyao
         HhG8hN/6G8FI0vfjq2cdykgX/lxyLR+fELXxiztq6breemxMQRZ60Qk0WKLcjhZQle4Q
         nsW/XgmVuDXdLgFhG3tOEp6vkEC8+ig5sWCd0xSw3r2y6ZrZ2Bw60rv/rFKZhx2QEFzB
         N25fRIYj6gNYEOs4S1gEpb7yf2tnZydx0Zr73z3SRKKjz0nicu4DmJhCGC/6Cr6mPGnV
         +oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211361; x=1788816161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sfnOswr7eo1XQosDaF0vBD6HXJXxp8BEfMaGl2218a4=;
        b=kkLHsN8WLMg5tSVbLdRrRIk25tfp5fKiL2pU5biIoNQWNUfNgocjDc+WQ706KOxI1g
         M/TdjLzx3JDJff4yGx7ykzt3UJ8sBaP8UT/hhOqII6nNotVEiEqs3sx6eEvA/MYEQeGB
         dJmENMKGIbvvEDgsuJiDsyAUhuAwIGmEBfL3tvi/hO0ex+4v+J2a+qy9kP36BR5b1aDZ
         AFTGtHTzrwnO9itcWGZVf2dS6llMTnauvD9N4E68t5MO15AUoaCNbLrV4BoIFEa4Kc94
         KaCISVFC7Pe7XaJmJ81ieS9ANOnAOpJiZQWBTv6UdMj3/+ZDmZTevLOex+osldjb2Ifc
         MnPQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/vQE+p+Pe+ARUw+9dyrlCni8EU6pVp2x3MgrDSH0OKUWPZbnGewoqB1r7pTRJqiZ767oJiA/4f3aH6w==@vger.kernel.org
X-Gm-Message-State: AFuF++n5Ks0PvzgrvBVh7L27FjincFYE79xeJEQhhKIRAupHPVUKyEru
	oGgCs63baC9zhfplXaoVvGvRp6LBykV7ynjXSf+SU/5RQNlz49hMzJqk
X-Gm-Gg: AR+sD13rGhKN8Tm0yjmcKH/akAnNEoMtYnK7iP3EwEp+qbVktUGLOQEygQlqcWo7s9s
	UUuMimbh8ox4iGqQ9wIrEPN6Cq1aDqKhBSHugkxjRY1SIQqfd9zuE0HKtDdxnFj0UPM8iGZ1kJ9
	3a+NEfLo1AXMkDhOxJ4lxrtr8I+35dTNFQ4fkc5hl3SLUTsaZWYABlMm2M1yk2QF0Fx7wa/ZG21
	NJnnfkBDDLaMAvP3G2laPqKyDMYg8+0fiTLUe1UZaUn2dFT88KsoEPqBrgQnzHiovX/W8HiTLTV
	aVV48JJr2XU/Rntfp9EiKHZKAkUE6nuDVYnUB+sdPh6COOwFlRsuUNgs5n9jwAUC8mIeVTcF7Ae
	0uvu+JgbA+6uc210j4h+3jDfALJfRxqfYHVJQKOYfsh1yBDx1wEV7pigF6ZsbkFWOFBxjOibT4s
	Ys4cw/rK92RhnCoToyVa0tYBsloVxQ5cZ3X7SIpx77SBnJjZrRUebHNvDIaydikCE0qJqvilCh2
	k2eIQ==
X-Received: by 2002:a05:6a21:8901:b0:3d3:adbf:777c with SMTP id adf61e73a8af0-3d3adbf8147mr26713171637.24.1788211361126;
        Mon, 31 Aug 2026 14:22:41 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::6:bac7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e2a95sm31080594eec.23.2026.08.31.14.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:22:40 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/6] eth: fbnic: move sensor read logic out of fbnic_mac
Date: Mon, 31 Aug 2026 14:22:29 -0700
Message-ID: <20260831212234.1212971-2-limzhineng2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831212234.1212971-1-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
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

