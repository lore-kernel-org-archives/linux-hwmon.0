Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3226150987
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 17:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706637111; cv=none; b=Km2oJcQOqqXWUlo3aEXSzugl6d4nxPSUSYkqnriiHUan8VJ6Jkt3SUNXyvcJpPHtJuJFsm3ptGPn7lDyxCvhMq8pe7ywePfus7xj73i3AZMdHbZBHkQrqtZgv5vdjjck7ARqpA0c8cTAGDtEgEHwdeEEfuFYekaG/b3PtX66c2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706637111; c=relaxed/simple;
	bh=E9+T3tYBO9u11qhS/NZ3oeL/SZ6kNpAatlkb1dP5uHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aWkTTtHIb+CATLwUQCiIgMLGCD/NkHATncnCVRUQL4vBQYxhbOOA9EicXy7PZ5yxhAeCMwjOgq7yt+R4mjIqCDeTZu+wdIHj19x522hngrK6JkHEpjNcCb22IZUFVvfhzCi22/dqOoTw4npu65chlFwtR/xvNlXnr4uO38NsfnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=FXo8Lo5X; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="FXo8Lo5X"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-33ae6dfa923so1860766f8f.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 09:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1706637107; x=1707241907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bQgZSjsUgd4Ba/M69hqq/7iyLw1vdKJRuphfN6JZy2M=;
        b=FXo8Lo5XHFPArGH7XdNbSeG6m94wLBWkS0cMlR5Qxxztn55JwrKn8foaxG0mf1HD5E
         FAMepnGfq7DrAGl8SaVc17bMxfQzDHytrXRhivcTGYUoUMOOVGWQoH0EEhbxgq1/JFbf
         0IlH2aj9vQi05pPlE3tDxJrMxoKYYcSzGxk1jfsxyM/4SdpYARB11z2yNdlDlk0m81zJ
         hFs/aGgMpoMD2e/2LqV6vROuFutevastZJ/z7bTkbflwjDi1LAkiNrBwMTj4mrJPzMoV
         eJOeG4B3zebvl1DV2FGESTpdDmFtiapM1IclW/hPXQqqasdYXHf/gxsr6CbK+gJ1tSN4
         nHkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706637107; x=1707241907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQgZSjsUgd4Ba/M69hqq/7iyLw1vdKJRuphfN6JZy2M=;
        b=qglh955aautLe/QYlk6vDXynhLxsQ/5DdVSxkSDpozrzCg0/fOnU8XOgWliljMnNqY
         mcAWrybXLWjoL/Z21XSPZb8MT1YqYbBMY19mlEIAlHQnD/A85L0GCPMV/jfayNHZCNDE
         8sO/hXLetqS0iSSlEoU4iJ/epT5rwukJvctITWj6sdncBrct7i+9VUfNErn5fJ/dV/T6
         qwjwMm+Fg78sQkws+KLqrYl6gMcp/Xo8Be4KcOqESApuuHsu9hcNZufPfk+uwRscMQdL
         lWaObxkn8d9LS1EnUbIJhoGPLKfNUwfEI3oPII3ijqAtPDRQ2YligbhMCnBuRsnI5Edp
         agfg==
X-Gm-Message-State: AOJu0Yx0P6wGO8754S87bRT0sU8tdlNYAltIOxbKZkILRBBuBhNu88AG
	bCPIdAS2yUwiIrx4AmB6xCM5xpUwCnn9YTsX0aKaEY5gRA9TQWbrybVzVIbq/Yo=
X-Google-Smtp-Source: AGHT+IFuHR8CDZoEL30xGueEBAhVZSckp8Z0gsKYRln2n+Ntqii5asqhNsxc6awuK8cztV5qHQyEeA==
X-Received: by 2002:a5d:6548:0:b0:33a:ff6f:744e with SMTP id z8-20020a5d6548000000b0033aff6f744emr251359wrv.18.1706637106872;
        Tue, 30 Jan 2024 09:51:46 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXe027gc5jc7b7mo5fZ7+wqLld2L87UtaW+lp4OjMxnTSjXWMWLUAtL5y5akavrqFrHLMXNHo2RgESd5wfzS7pimRcRYX5ia3+MwlfQwvlAljqyOvWDWzqXMapHMGZO0pKYf4gqjixpovVSPvp2lyPgPMJEdDUBo6Rq/okJ9nMVh8LtR/pqTrpXvwlvnEWuHB5pijzHIjA1WFO2GsmD86QhikLuodMROUp0Y/4zKb3VP/33VF/PAz4R2A==
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id fm25-20020a05600c0c1900b0040e3bdff98asm17788748wmb.23.2024.01.30.09.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 09:51:46 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: mazziesaccount@gmail.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/mp2975) Fix IRQ masking
Date: Tue, 30 Jan 2024 23:21:39 +0530
Message-ID: <20240130175140.3834889-1-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

The MP2971/MP2973 use a custom 16bit register format for
SMBALERT_MASK which doesn't follow the PMBUS specification.

Map the PMBUS defined bits used by the common code onto the custom
format used by MPS and since the SMBALERT_MASK is currently never read
by common code only implement the mapping for write transactions.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
---
 drivers/hwmon/pmbus/mp2975.c | 57 ++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
index b9bb469e2d8f..788ec2c5a45f 100644
--- a/drivers/hwmon/pmbus/mp2975.c
+++ b/drivers/hwmon/pmbus/mp2975.c
@@ -377,6 +377,62 @@ static int mp2973_read_word_data(struct i2c_client *client, int page,
 	return ret;
 }
 
+static int mp2973_write_word_data(struct i2c_client *client, int page,
+				  int reg, u16 word)
+{
+	u8 target, mask;
+	int ret;
+
+	if (reg != PMBUS_SMBALERT_MASK)
+		return -ENODATA;
+
+	/*
+	 * Vendor-specific SMBALERT_MASK register with 16 maskable bits.
+	 */
+	ret = pmbus_read_word_data(client, 0, 0, PMBUS_SMBALERT_MASK);
+	if (ret < 0)
+		return ret;
+
+	target = word & 0xff;
+	mask = word >> 8;
+
+#define SWAP(cond, bit) (ret = (cond) ? (ret & ~BIT(bit)) : (ret | BIT(bit)))
+	switch (target) {
+	case PMBUS_STATUS_CML:
+		SWAP(mask & PB_CML_FAULT_INVALID_DATA, 8);
+		SWAP(mask & PB_CML_FAULT_INVALID_COMMAND,  9);
+		SWAP(mask & PB_CML_FAULT_OTHER_COMM, 5);
+		SWAP(mask & PB_CML_FAULT_PACKET_ERROR, 7);
+		break;
+	case PMBUS_STATUS_VOUT:
+		SWAP(mask & PB_VOLTAGE_UV_FAULT, 13);
+		SWAP(mask & PB_VOLTAGE_OV_FAULT, 14);
+		break;
+	case PMBUS_STATUS_IOUT:
+		SWAP(mask & PB_IOUT_OC_FAULT, 11);
+		SWAP(mask & PB_IOUT_OC_LV_FAULT, 10);
+		break;
+	case PMBUS_STATUS_TEMPERATURE:
+		SWAP(mask & PB_TEMP_OT_FAULT, 0);
+		break;
+	/*
+	 * Map remaining bits to MFR specific to let the PMBUS core mask
+	 * those bits by default.
+	 */
+	case PMBUS_STATUS_MFR_SPECIFIC:
+		SWAP(mask & BIT(1), 1);
+		SWAP(mask & BIT(3), 3);
+		SWAP(mask & BIT(4), 4);
+		SWAP(mask & BIT(6), 6);
+		break;
+	default:
+		return 0;
+	}
+#undef SWAP
+
+	return pmbus_write_word_data(client, 0, PMBUS_SMBALERT_MASK, ret);
+}
+
 static int mp2975_read_word_data(struct i2c_client *client, int page,
 				 int phase, int reg)
 {
@@ -891,6 +947,7 @@ static struct pmbus_driver_info mp2973_info = {
 		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POUT |
 		PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT,
 	.read_word_data = mp2973_read_word_data,
+	.write_word_data = mp2973_write_word_data,
 #if IS_ENABLED(CONFIG_SENSORS_MP2975_REGULATOR)
 	.num_regulators = 1,
 	.reg_desc = mp2975_reg_desc,

base-commit: 909d8d33f8b4664c9b6c7fd585114921af77fc2b
-- 
2.42.0

