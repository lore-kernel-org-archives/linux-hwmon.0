Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E1320297C
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Mar 2026 00:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773017188; cv=none; b=nMHrBSTUbkVH7M1q6QMiZdGU50q+AWpjKZXSoIkgo4gf2mzNYTQE0rVKuRUZYYE1rXV5xENgDOv6IFYM3zZ03MsrM53ON7OBS81puabyBjIpi17eYUcr2dKqPxZNGSkfgs0S7j/I17/crEj/TYAXiA6slLuWLA/h4iIqdaZSJbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773017188; c=relaxed/simple;
	bh=tHoeMFRi6s6I6LRKk8F/SrOG3eKQxuLtAy2rH6tfvWs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DdYlON5b6Cu9Rc6loPaxylDG45R9sEkh8UqMvtpmZdToedYW5I0oFnnfsA6xqE88MRWqcgsEJLmBla9oYzX9in41E4fWzs6QZDK2k6f+xhcVP3oLw5QvKfRXGFa9g79K2Z1K7S3OIwLI0Nm8kER//34865BMEWuzAAfqzbASW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RA0lnivn; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RA0lnivn"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba895adfeaso9286001eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Mar 2026 17:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773017185; x=1773621985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxW4Is3pvycjCruApvPYUDJnnf0G3HJdKTnyBvELzWs=;
        b=RA0lnivnhQYoOfESDHVp9EogGPXieqJ5+UYXY0DUuVZmZwV8MMihWaEL08yU3xrKjM
         u7vScGllQHHsrr03MGXHXA9dJoXhZSDSLABUaLmRrwnKJxAeOlMG2Kk6iUhX38bjaPgU
         3zg/LbLF9wJnPGO7TUpEXhG7vXjLmcQKN4XCjQKmuwxHhzbLGsCeyohdqiaAa6GcmlMW
         jcI47pZyLWYUyNUsS+noA1lVLL6T9+kEBwXqmxrBT/4XvFSHAw58XQBjy2miV+CNQI6i
         cmcz6LdN8iJLtnuo11qH8a6dofH9CvCYg+ICExjq0QSF57zw5orFEwdTZbm/CtF3jznu
         nypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773017185; x=1773621985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cxW4Is3pvycjCruApvPYUDJnnf0G3HJdKTnyBvELzWs=;
        b=c19Q/aQVNKnOHmLsYfPmunZDC8eHb0wGUIYyUaMSMVF9LZWL3ft2U6E2dqqBqcnA0z
         1HpJ3l/MQKSv6MITmIzFF97LW4qpnOgv/jbqIXTPUuGmO4Nlgg3EsXatsvCn+hqoCb0m
         cboiRByw1zKTQkhEeYKxwosOVueBdvLqxoEEyFKkBngk8pzjkIdZTu+b5vrE0azKI2cl
         3VhHQtT/3gyFuIaKKJzGe8mwkQ+V2AFEDkKVSAvXjTMvKUfn3jgsRPPEPKnf+sHxVd2y
         hiC/02cUXjyJFMtm5STa8w0zSEdVx2XCQY/7okV9TmncvlUTfqtjuNKC36JFo5IOUBIR
         3ENw==
X-Forwarded-Encrypted: i=1; AJvYcCWxNySz550fvaqHb5YHnuRtMBdfAsiOuY6Y6eUDjiMbsv4DM3x/ynMCHrvM/5H21m6JM5GTbvi72LxHEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS5DO5DP+AAYsDecf+qzyVGGV8I40RjRpT4/vh8vmS1tMcpcUK
	YBN5xI6KwfBdyyWS0Nu6dM+DPz8yeF2QvYw6hAR3xQAwU6eFAfBAd9p0
X-Gm-Gg: ATEYQzzCx4qb6BjCKadB0zZkCbAotOJtLiajU6IPMZhfkkDa4plRsAABgcVlixOh5Dm
	YLcgLxMEoxRzwYHYIZONYhhYflGUlQ0k5IYUsBwU6O7JOu6gNhcMBravIstER2ievhwq5Ry+gof
	EDPH+ccZx8Z8Hqk0eHkDa06dX4liq17IOztE7J9kf9yXPwX1ScmXH5ZLT6gsr3uMo9XJNRO69f/
	9bog39fc4qVP8Js9S7mbtwrA0HDk+vM4f9+dr6vMKOk6Olhahc/WN0Y7NgB2KZszmrtICqD6GC2
	z+24A04hP8RJBSUOkO6C5zCb6c95tUx0BrX1zfZyKRKCHZ+T6/uj7hIHfpLswRKbni858+ZLsrR
	AW8J8MxwBWb6JURbpFrK5PWqfnqe5Tf1zoXWUUbbs5o8Q1FOh5ZfwaMd4Xxyinbz8CLrylu3hj+
	ANR1ln9TVKuDYzngYGnatnaq6rqEEcnodRAKD2i2JxoMnmfLD6zQCdxh+P+hUk6jVbLJEwiCjKD
	fRk92c=
X-Received: by 2002:a05:7300:cd90:b0:2be:2b16:b99f with SMTP id 5a478bee46e88-2be4de928fcmr3334893eec.13.1773017184928;
        Sun, 08 Mar 2026 17:46:24 -0700 (PDT)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f948631sm7240105eec.19.2026.03.08.17.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:46:24 -0700 (PDT)
From: Sanman Pradhan <sanman.p211993@gmail.com>
To: Sanman Pradhan <sanman.p211993@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Sanman Pradhan <psanman@juniper.net>,
	linux-hwmon <linux-hwmon@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 1/2] hwmon: (pmbus) export pmbus_wait and pmbus_update_ts
Date: Sun,  8 Mar 2026 17:45:07 -0700
Message-Id: <20260309004508.78609-2-sanman.p211993@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309004508.78609-1-sanman.p211993@gmail.com>
References: <20260309004508.78609-1-sanman.p211993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanman Pradhan <psanman@juniper.net>

Some PMBus devices require strict inter-transaction delays to avoid
NACKs or communication faults. The PMBus core manages this automatically
for standard PMBus accesses via pmbus_wait() and pmbus_update_ts().

However, when a device driver performs raw I2C/SMBus transfers (e.g.,
for long reads or custom commands) that bypass the PMBus core, the core's
timing state machine is unaware of the transaction. This can cause the
next core-mediated PMBus access to violate the device's required delay.

Export pmbus_wait() and pmbus_update_ts() to the PMBUS namespace so
device-specific drivers can explicitly synchronize their raw transfers
with the core's delay management.

Additionally, move the PMBUS_OP_WRITE and PMBUS_OP_PAGE_CHANGE bitmasks
into the drivers/hwmon/pmbus/pmbus.h header so callers can accurately
report the nature of their raw transactions.

Signed-off-by: Sanman Pradhan <psanman@juniper.net>
---
 drivers/hwmon/pmbus/pmbus.h      |  9 +++++++++
 drivers/hwmon/pmbus/pmbus_core.c | 13 ++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index d2e9bfb5320f..afd58128b37e 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -424,6 +424,13 @@ enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv };
 #define PMBUS_REV_12 0x22	/* PMBus revision 1.2 */
 #define PMBUS_REV_13 0x33	/* PMBus revision 1.3 */
 
+/*
+ * The type of operation used for picking the delay between
+ * successive pmbus operations.
+ */
+#define PMBUS_OP_WRITE		BIT(0)
+#define PMBUS_OP_PAGE_CHANGE	BIT(1)
+
 struct pmbus_driver_info {
 	int pages;		/* Total number of pages */
 	u8 phases[PMBUS_PAGES];	/* Number of phases per page */
@@ -555,6 +562,8 @@ int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
 void pmbus_clear_faults(struct i2c_client *client);
 bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
 bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
+void pmbus_wait(struct i2c_client *client);
+void pmbus_update_ts(struct i2c_client *client, int op);
 int pmbus_do_probe(struct i2c_client *client, struct pmbus_driver_info *info);
 const struct pmbus_driver_info *pmbus_get_driver_info(struct i2c_client
 						      *client);
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index be6d05def115..4864a30988bf 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -32,13 +32,6 @@
 #define PMBUS_ATTR_ALLOC_SIZE	32
 #define PMBUS_NAME_SIZE		24
 
-/*
- * The type of operation used for picking the delay between
- * successive pmbus operations.
- */
-#define PMBUS_OP_WRITE		BIT(0)
-#define PMBUS_OP_PAGE_CHANGE	BIT(1)
-
 static int wp = -1;
 module_param(wp, int, 0444);
 
@@ -173,7 +166,7 @@ void pmbus_set_update(struct i2c_client *client, u8 reg, bool update)
 EXPORT_SYMBOL_NS_GPL(pmbus_set_update, "PMBUS");
 
 /* Some chips need a delay between accesses. */
-static void pmbus_wait(struct i2c_client *client)
+void pmbus_wait(struct i2c_client *client)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	s64 delay = ktime_us_delta(data->next_access_backoff, ktime_get());
@@ -181,9 +174,10 @@ static void pmbus_wait(struct i2c_client *client)
 	if (delay > 0)
 		fsleep(delay);
 }
+EXPORT_SYMBOL_NS_GPL(pmbus_wait, "PMBUS");
 
 /* Sets the last operation timestamp for pmbus_wait */
-static void pmbus_update_ts(struct i2c_client *client, int op)
+void pmbus_update_ts(struct i2c_client *client, int op)
 {
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	const struct pmbus_driver_info *info = data->info;
@@ -197,6 +191,7 @@ static void pmbus_update_ts(struct i2c_client *client, int op)
 	if (delay > 0)
 		data->next_access_backoff = ktime_add_us(ktime_get(), delay);
 }
+EXPORT_SYMBOL_NS_GPL(pmbus_update_ts, "PMBUS");
 
 int pmbus_set_page(struct i2c_client *client, int page, int phase)
 {
-- 
2.34.1

