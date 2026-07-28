Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D3F3314DE;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785254560; cv=none; b=XCjoayp09Bg2Daq6x9GFG4xychRUb8nrc2Ai1pkvCodQlDx4hAiYJjosGF+473xlw3g2bF9d9+4QkT78HkKanls61EGTplu+lUm2mQ/VRjFpdJdMcGsUipIVVWh/4FDPk9mFtNtNkz7lmg4VVQbifdE86rcHhJ7FS1HGH6atg+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785254560; c=relaxed/simple;
	bh=raRKgqD7Z8P41pVdBuPvuXQ3F0/oGEYUZF+9nK+i8f8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UGqfWq5nPn6mGkSL8dMdJiWTYZtPGhn/d/tn82CO+dyRlJn6l9UO3uSIUu/OJLQoVIdrBTwPX2feq//KhC9HZEiENx3Y++rYiTnA5YQ49dhq7qe5CJJk8ItF9FqbeCL0luQiUZPkh+MKr0MB21DnA93xWWYIp9xStFz53jSHnCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dF/3FkKU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dF/3FkKU"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E10EC2BD00;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785254560;
	bh=raRKgqD7Z8P41pVdBuPvuXQ3F0/oGEYUZF+9nK+i8f8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dF/3FkKUCJyRCnPTMk/qgCeNPlPqDdXEDngG/7pmKSwKyHqXqyPqmljh8wR2JNqu7
	 XGny/NM4RwJGdOH4PrNZQNQIvbOeO86XXIqfwMBcR/gqmW3cmC7Qq3k61CIAUDpLl9
	 /9Taeh/39RoDQwOOmnIbcdflFgmbeHzhk1pWGFTiyhsoOnDgT5jCZmjoe7qJbAMS5k
	 aOVVd0xRQF9J3hGLxGkN5bIcQWCAlDsjmQtdAxeDk6ZRniBcJNqL3gzIc4Yyi7aEmK
	 hNN8Rd+nZDRp8Xcb5Y1iIIujGVCg9xi4n4+vJdvmSyWKP7mvzv3i49DX49giPx/ttB
	 Vn4B7f7t8IQpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C733C54F55;
	Tue, 28 Jul 2026 16:02:40 +0000 (UTC)
From: =?utf-8?q?Nuno_S=C3=A1_via_B4_Relay?= <devnull+nuno.sa.analog.com@kernel.org>
Date: Tue, 28 Jul 2026 17:03:50 +0100
Subject: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
In-Reply-To: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
To: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, 
 Alan Tull <atull@opensource.altera.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785254629; l=2984;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=MpoqGzL/f8xXIX/4rv/9LHforDgeFadYOUlsVFzvy08=;
 b=CoNE+nExAud6IUgiFgWP5usMfZRc9+WxlzckO/g26elMTrj7nQL5FZQsoWaD8txnnxMHQpNLJ
 nPjumM52J6ICFKBtHdcMtbaCey4M9rGtL7Z+22KWb38SR62hh/2Ig7f
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-Endpoint-Received: by B4 Relay for nuno.sa@analog.com/20231116 with
 auth_id=100
X-Original-From: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Reply-To: nuno.sa@analog.com

From: Nuno Sá <nuno.sa@analog.com>

This is in preparation for adding support to a device which needs to
use it's own read_block implementation.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/pmbus/pmbus.h      |  3 +++
 drivers/hwmon/pmbus/pmbus_core.c | 24 ++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 3d5586c67f84..d697939ec892 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -459,6 +459,9 @@ struct pmbus_driver_info {
 	int (*read_byte_data)(struct i2c_client *client, int page, int reg);
 	int (*read_word_data)(struct i2c_client *client, int page, int phase,
 			      int reg);
+	/* size of data_buf is I2C_SMBUS_BLOCK_MAX + 2 */
+	int (*read_block_data)(struct i2c_client *client, int page, u8 reg,
+			       char *data_buf);
 	int (*write_byte_data)(struct i2c_client *client, int page, int reg,
 			      u8 byte);
 	int (*write_word_data)(struct i2c_client *client, int page, int reg,
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 7b58f7198574..ff4572c473b7 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -533,6 +533,26 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 	return rv;
 }
 
+/*
+ * _pmbus_read_block_data() is similar to pmbus_read_block_data(), but checks if
+ * a device specific mapping function exists and calls it if necessary.
+ */
+static int _pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
+				  char *data_buf)
+{
+	struct pmbus_data *data = i2c_get_clientdata(client);
+	const struct pmbus_driver_info *info = data->info;
+	int status;
+
+	if (info->read_block_data) {
+		status = info->read_block_data(client, page, reg, data_buf);
+		if (status != -ENODATA)
+			return status;
+	}
+
+	return pmbus_read_block_data(client, page, reg, data_buf);
+}
+
 static struct pmbus_sensor *pmbus_find_sensor(struct pmbus_data *data, int page,
 					      int reg)
 {
@@ -678,7 +698,7 @@ static bool __maybe_unused pmbus_check_block_register(struct i2c_client *client,
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	char data_buf[I2C_SMBUS_BLOCK_MAX + 2];
 
-	rv = pmbus_read_block_data(client, page, reg, data_buf);
+	rv = _pmbus_read_block_data(client, page, reg, data_buf);
 	if (rv >= 0 && !(data->flags & PMBUS_SKIP_STATUS_CHECK))
 		rv = pmbus_check_status_cml(client);
 	if (rv < 0 && (data->flags & PMBUS_READ_STATUS_AFTER_FAILED_CHECK))
@@ -3564,7 +3584,7 @@ static ssize_t pmbus_debugfs_block_read(struct file *file, char __user *buf,
 	char data[I2C_SMBUS_BLOCK_MAX + 2] = { 0 };
 
 	scoped_guard(pmbus_lock, client) {
-		rc = pmbus_read_block_data(client, entry->page, entry->reg, data);
+		rc = _pmbus_read_block_data(client, entry->page, entry->reg, data);
 		if (rc < 0)
 			return rc;
 	}

-- 
2.55.0


