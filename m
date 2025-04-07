Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D788D224254
	for <linux-hwmon@vger.kernel.org>; Mon,  7 Apr 2025 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744056614; cv=none; b=D0hVY62LlRr4wgoFmJGDmPJ7Ywbs657m8tV2LkW7aFbjsbwhNU7k5Qrjxn8KNydeJkO6YrpB8c5sc8idPZrOeUbX/OxVTQ/MN4VXz318ic4KpvvL+RdCHAq6AeKoxALWLbJJxR2YQpsmiOzaNWBT6AUNCYMs0mlBgcCddnQvDSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744056614; c=relaxed/simple;
	bh=7RoIT9/RUIJd/OqbMR50Adl4B420MNsQ/i2IPCgIdKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hg5WXELu/yXSIHHY06iz4ZbMlwA8Am5kqpPkYHAmO/AvN5r0vdNC0tcREKzMPB1+FfMGCoiDhVXrFbLrK1XcmLstjNUmCi8KaFID42KVeRvPJaP6fJwoXoFgOzj9nWyGeZEUnFzam6y9T3b8c9GM60UQuki+cnjcGJuKThVW9Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com; spf=none smtp.mailfrom=wkennington.com; dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b=xseyQlep; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wkennington.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=wkennington.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wkennington-com.20230601.gappssmtp.com header.i=@wkennington-com.20230601.gappssmtp.com header.b="xseyQlep"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2260c91576aso39915775ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Apr 2025 13:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wkennington-com.20230601.gappssmtp.com; s=20230601; t=1744056611; x=1744661411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SKorvTDcHHWmcS+AjT7qKhMDewJLu0PWpIswTAFjbRo=;
        b=xseyQlepmsqtgwYCOGLB+yS8EQSTm2mrtGl3mvNapVVxMQy1ZsTKURZICYfWZkmGQN
         gHRU39FkwcyUUUcDfFLZGn2hL1QjyPoDXdj4ZU98UZboRXgqu2D4cwUZnQgvWP5hDude
         NnFVt1+QXpubsYc+jiDlKtBFRwrw0ix15Ol19e2Zm8DZPO3JEQwuwViBYVJnjfjyw6fX
         loIXvabfaHK/WjmXRwkUdDxL1JJHTZwVLb5PvBYlgq4RTF6Gl22ceEyGdnb1gitFqZQN
         Ivij96PKOxVG5OjaVLSnb/NJVaur5AareQVZLa2adbLCZlK1XByYCf8HGIZ9N6F1y3uW
         nG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744056611; x=1744661411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SKorvTDcHHWmcS+AjT7qKhMDewJLu0PWpIswTAFjbRo=;
        b=JHFM196Y2EmY1IWWueVAJGOM1Xa0G5t8TMOyWNg0DRK9Mq+bBIFGjGobWTN6aM+CW8
         Ksf+ZJycYucyB5In2wfqkB4QRf+rQz+Cjcgij+dtuzGlWNvUg2szBNzebZRBFEYJFg0E
         gQ2ezVayrvRoPXhMQY/8ZlEXtVlrUeBSdjrSidwV2gBkB/pvv/mMBg3exzjc9i4UcVfJ
         LJYUBZIXAsPCSHnAaYoBVWgN3F6h294WB8hIlZe74S196ESQgND2CVaQMicLxJAiBz0e
         ZpYhrBEB/F0BPdp6ikpZXDY5LKxfhB7mljtf9IrqDNFCKiHgCQWjpHEBFVVdv5/YDwso
         FfvA==
X-Gm-Message-State: AOJu0YylU1BnIIfKamXShvn0vacX6OCwGQQPFjzNSHN3W0j6grben4i1
	ZUtOlSoPamyXZIQN091EjERjtFg9fkCoHsnxRQAfMQNcY2OL3gODfmDm98owBzk=
X-Gm-Gg: ASbGncuB6JVN4huAZb/UawHX2Z45wRQgaoJoscv1wRTB2KXj2JwErn6K6YfiuDXtmVn
	ttC54jHc3xRRYDqP80RqETKvIC0jdv2eYMYi9I1JKTDfxwMbBseK5r2aQtYxVArFNKPzZwgP5mc
	v9zNT/hrio49dokXaki15YgQZfCiIXPohMNTTVu4hX19mVLvV1mPD8jNyt1BTUQkzuNIzWmTVAU
	TXFzvW+2oIGSYZUkI5iImQ/1BJoFKf2ZAjZtCta9XDcpoE44UMjL9VW7vFFsGOw1w3R6NiCSv8V
	zETQ2XFyMM5D9Bh5o9Ma209gaJhmQC+VLStjRSY9jokCuoub3CmpWRgznm/Lv23owTcGlJgT3xw
	rQ21FHYjZqp2LeEvziKcMwazBrGk23zcm
X-Google-Smtp-Source: AGHT+IHvXiMbLnANd8/D78KF/tGgUo37pGC3kDLDkaZfEw+83S+ZticgxpE0lAOSgNyNxaubDQZWOw==
X-Received: by 2002:a17:902:ecc4:b0:224:1eab:97b2 with SMTP id d9443c01a7336-22a8a2da123mr210601995ad.53.1744056611011;
        Mon, 07 Apr 2025 13:10:11 -0700 (PDT)
Received: from wak-linux.svl.corp.google.com ([2a00:79e0:2e5b:9:b25a:2d1b:1734:78be])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e0b4sm86087865ad.154.2025.04.07.13.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 13:10:10 -0700 (PDT)
From: "William A. Kennington III" <william@wkennington.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"William A. Kennington III" <william@wkennington.com>
Subject: [PATCH v5] hwmon: (pmbus): Introduce page_change_delay
Date: Mon,  7 Apr 2025 13:10:02 -0700
Message-ID: <20250407201002.1198092-1-william@wkennington.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
In-Reply-To: <20250404193103.4174977-1-william@wkennington.com>
References: <20250404193103.4174977-1-william@wkennington.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We have some buggy pmbus devices that require a delay after performing a
page change operation before trying to issue more commands to the
device.

This allows for a configurable delay after page changes, but not
affecting other read or write operations.

This makes a slight behavioral tweak to the existing delay logic, where
it considers the longest of delays between operations, instead of always
chosing the write delay over the access delay.

Signed-off-by: William A. Kennington III <william@wkennington.com>
---
V1 -> V2: Simplify how the backoff time is stored and computed
V2 -> V3: Use the BIT macro
V3 -> V4: Move defines up
	  Move op combos outside update call
	  Remove unused PMBUS_OP_READ
V4 -> V5: Rebase onto 6.15-rc1

 drivers/hwmon/pmbus/pmbus.h      |  1 +
 drivers/hwmon/pmbus/pmbus_core.c | 69 ++++++++++++++++----------------
 2 files changed, 36 insertions(+), 34 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index ddb19c9726d6..742dafc44390 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -482,6 +482,7 @@ struct pmbus_driver_info {
 	 */
 	int access_delay;		/* in microseconds */
 	int write_delay;		/* in microseconds */
+	int page_change_delay;		/* in microseconds */
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index cfeba2e4c5c3..be6d05def115 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -32,6 +32,13 @@
 #define PMBUS_ATTR_ALLOC_SIZE	32
 #define PMBUS_NAME_SIZE		24
 
+/*
+ * The type of operation used for picking the delay between
+ * successive pmbus operations.
+ */
+#define PMBUS_OP_WRITE		BIT(0)
+#define PMBUS_OP_PAGE_CHANGE	BIT(1)
+
 static int wp = -1;
 module_param(wp, int, 0444);
 
@@ -113,8 +120,8 @@ struct pmbus_data {
 
 	int vout_low[PMBUS_PAGES];	/* voltage low margin */
 	int vout_high[PMBUS_PAGES];	/* voltage high margin */
-	ktime_t write_time;		/* Last SMBUS write timestamp */
-	ktime_t access_time;		/* Last SMBUS access timestamp */
+
+	ktime_t next_access_backoff;	/* Wait until at least this time */
 };
 
 struct pmbus_debugfs_entry {
@@ -169,32 +176,26 @@ EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
 static void pmbus_wait(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	const struct pmbus_driver_info *info = data->info;
-	s64 delta;
+	s64 delay = ktime_us_delta(data->next_access_backoff, ktime_get());
 
-	if (info->access_delay) {
-		delta = ktime_us_delta(ktime_get(), data->access_time);
-
-		if (delta < info->access_delay)
-			fsleep(info->access_delay - delta);
-	} else if (info->write_delay) {
-		delta = ktime_us_delta(ktime_get(), data->write_time);
-
-		if (delta < info->write_delay)
-			fsleep(info->write_delay - delta);
-	}
+	if (delay > 0)
+		fsleep(delay);
 }
 
-/* Sets the last accessed timestamp for pmbus_wait */
-static void pmbus_update_ts(struct i2c_client *client, bool write_op)
+/* Sets the last operation timestamp for pmbus_wait */
+static void pmbus_update_ts(struct i2c_client *client, int op)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	const struct pmbus_driver_info *info = data->info;
+	int delay = info->access_delay;
+
+	if (op & PMBUS_OP_WRITE)
+		delay = max(delay, info->write_delay);
+	if (op & PMBUS_OP_PAGE_CHANGE)
+		delay = max(delay, info->page_change_delay);
 
-	if (info->access_delay)
-		data->access_time = ktime_get();
-	else if (info->write_delay && write_op)
-		data->write_time = ktime_get();
+	if (delay > 0)
+		data->next_access_backoff = ktime_add_us(ktime_get(), delay);
 }
 
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
@@ -209,13 +210,13 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 	    data->info->pages > 1 && page != data->currpage) {
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_WRITE | PMBUS_OP_PAGE_CHANGE);
 		if (rv < 0)
 			return rv;
 
 		pmbus_wait(client);
 		rv = i2c_smbus_read_byte_data(client, PMBUS_PAGE);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, 0);
 		if (rv < 0)
 			return rv;
 
@@ -229,7 +230,7 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		pmbus_wait(client);
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
 					       phase);
-		pmbus_update_ts(client, true);
+		pmbus_update_ts(client, PMBUS_OP_WRITE);
 		if (rv)
 			return rv;
 	}
@@ -249,7 +250,7 @@ int pmbus_write_byte(struct i2c_client *client, int page, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte(client, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -284,7 +285,7 @@ int pmbus_write_word_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_word_data(client, reg, word);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -405,7 +406,7 @@ int pmbus_read_word_data(struct i2c_client *client, int page, int phase, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_word_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	return rv;
 }
@@ -468,7 +469,7 @@ int pmbus_read_byte_data(struct i2c_client *client, int page, u8 reg)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_byte_data(client, reg);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	return rv;
 }
@@ -484,7 +485,7 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg, u8 value)
 
 	pmbus_wait(client);
 	rv = i2c_smbus_write_byte_data(client, reg, value);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	return rv;
 }
@@ -520,7 +521,7 @@ static int pmbus_read_block_data(struct i2c_client *client, int page, u8 reg,
 
 	pmbus_wait(client);
 	rv = i2c_smbus_read_block_data(client, reg, data_buf);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	return rv;
 }
@@ -2524,7 +2525,7 @@ static int pmbus_read_coefficients(struct i2c_client *client,
 	rv = i2c_smbus_xfer(client->adapter, client->addr, client->flags,
 			    I2C_SMBUS_WRITE, PMBUS_COEFFICIENTS,
 			    I2C_SMBUS_BLOCK_PROC_CALL, &data);
-	pmbus_update_ts(client, true);
+	pmbus_update_ts(client, PMBUS_OP_WRITE);
 
 	if (rv < 0)
 		return rv;
@@ -2728,7 +2729,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (!(data->flags & PMBUS_NO_CAPABILITY)) {
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_CAPABILITY);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, 0);
 
 		if (ret >= 0 && (ret & PB_CAPABILITY_ERROR_CHECK)) {
 			if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_PEC))
@@ -2744,13 +2745,13 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	data->read_status = pmbus_read_status_word;
 	pmbus_wait(client);
 	ret = i2c_smbus_read_word_data(client, PMBUS_STATUS_WORD);
-	pmbus_update_ts(client, false);
+	pmbus_update_ts(client, 0);
 
 	if (ret < 0 || ret == 0xffff) {
 		data->read_status = pmbus_read_status_byte;
 		pmbus_wait(client);
 		ret = i2c_smbus_read_byte_data(client, PMBUS_STATUS_BYTE);
-		pmbus_update_ts(client, false);
+		pmbus_update_ts(client, 0);
 
 		if (ret < 0 || ret == 0xff) {
 			dev_err(dev, "PMBus status register not found\n");
-- 
2.49.0.504.g3bcea36a83-goog

