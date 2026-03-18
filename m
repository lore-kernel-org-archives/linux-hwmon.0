Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4473EDABB
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860830; cv=none; b=acYOT7AQy2nch6SLbXPiZ+zt1ohNBvdxSl/CgtAzAHOglXfcERQ1RgNB2Wr3Y29np/5HS03nota3+PBxdOqv46oTSdd+pCKetgUEQ5NcdgQR+a21s6wWY/Ke61LAxMHtuz+EhcsEq/2Rf6jV4Q/Om4sV2tvaMv+0uDlGBd62gQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860830; c=relaxed/simple;
	bh=Ix0E+ghAlT/s3O64UalU9fFWFzeOgY7nHsaKESKcTQo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CTdxET/krnWUYbIPJIpy6MaSAr9nicyT2lrO8qqSs4CG3tTuh1OdnveK8TNcHALeHQAcj3AaWxBlVPg6xGoVAYkNgL9zoFRT7qzd/IdvEdXYD+H+/pI7fGlLIITp7r6Pfi+zcJbbS3m0RECxPEBp0Wr5EYEoeNRGtWvd5FVXkMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CiGicv54; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CiGicv54"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0c955a481so700076eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Mar 2026 12:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860828; x=1774465628; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfIYfJNP2o1iQz4OXKfFq4L/Db/4rDBcPTYZVS8ZPFk=;
        b=CiGicv54BtArkUGnV20SURZNYLU2mhAGrj0A0RDnRXuvYImTsUL4GikCkHbHZac7IS
         hmTniEIYaQsTlCFr+lE8dfXytzM/LmTlmdravbmLoHIHZFfkfnMjbaJdKnN/DNU8wxVH
         ZuyKHVz20FMQoCyz0SPm8zYSCQslsnsVf3k77QQ67+AQFsXijXXNekAJgRCnSzeMqvSu
         rru/E2ApRED3Ni1latDwIdY7cnh8DX39wQO8jfsfcjNykGXJskRPTOTaYIRh+Z29gd36
         8dzqSim3CnREaJfcgMHHQMqxEY2fv97kvGghDAYnSN0Fz5u+aU+zGqKR7zfmKB2gNXL1
         lzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860828; x=1774465628;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OfIYfJNP2o1iQz4OXKfFq4L/Db/4rDBcPTYZVS8ZPFk=;
        b=dD/93CUHZyETpjUaWVmW2DzirOOlz6EIrzKJduOM8eC6fZlVuZmGOpuMxbgtSmvn5o
         T0WFTmgOFbh2XkX9QQN/2xUFNJjl1teN1cfkv3dzloCQV1MIJVpOS3WHqkNp1NUBn8zx
         pLTQBeep072Fr0XmxdhOhD5KGZvgNGR1hjj4uJR5hJXKhSKkKZziDftpRB7hyQl0RA8O
         +759BydykKJ25a04iTAy8gumqBmjharbcvvqXt37bsRMDHQi0YDNNK+o9VG/gSS/HXbq
         dMmQ8at1+NnXtDsvK9oEqVkiJ4XEBuu0GeZKMqRgno2YoCWnGZQiIa2YFNX4swlJmpeK
         FFhQ==
X-Gm-Message-State: AOJu0Yy7qBRInQtp57X1H3tjqvZgelccHqUcdWipPKvf3eWXGIDOt/22
	aqnhyTPgoNPKlus6MWy+vgGzAWN3VlVM/TRKDqybGnuexdTtKFQyVXvi
X-Gm-Gg: ATEYQzzOeaFVNJ4gwSidapE3NbYCPyby3WCwYSIIC4Lnm4pV6Ooa+UvkZypkHr6E5V3
	AxR71aqH6f+I4ARbfCOQ3E8lwzJWhrgzLLft4yQz+S66a6Nbwa0R/QzsJwFASNaI7ZX5S4AyxYd
	tBqweCyYDrz1GNX5z6V5iT/rtot3fMi7cA78A71fRcssWLqX6aKpJh4TTuV+3i5oBKlN9nlPsjE
	eiCTcHkEucwNWTy6LNJ0fZ0TMmzDAEiKvDm7JJylJARTCqORhmZj6JhKsPfexGmPo5HyZeF1g2Q
	n3GfhGhsLZUeRvzmueajWdRiR975DUQqkeIcs04Gk5hLapNVGMDPKI6EI9vo/Jq/6O+Zs7xWhPI
	bYeFYLm3TgH8o1Hywq05AXZUl/ruoZKwm7BslDMQWBr/8fY/lcP3ouiyWSTtF64w5t2MdVBRA/M
	ecqB4imLFfe6u1i3MZPosF3AbCsishirUhXwrlva5GqO753ZNnC34+blqvgXDP7FFjPItsWA+i
X-Received: by 2002:a05:7300:8ca2:b0:2c0:c482:7db with SMTP id 5a478bee46e88-2c0e502b25bmr2461837eec.10.1773860828137;
        Wed, 18 Mar 2026 12:07:08 -0700 (PDT)
Received: from localhost.localdomain (c-67-164-93-214.hsd1.ca.comcast.net. [67.164.93.214])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e5582dd5sm4894424eec.15.2026.03.18.12.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 12:07:07 -0700 (PDT)
From: Sanman Pradhan <sanman.p211993@gmail.com>
X-Google-Original-From: Sanman Pradhan <psanman@juniper.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sanman Pradhan <psanman@juniper.net>
Subject: [PATCH v3 1/2] hwmon: (pmbus) export pmbus_wait and pmbus_update_ts
Date: Wed, 18 Mar 2026 12:06:42 -0700
Message-Id: <20260318190643.54372-2-psanman@juniper.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260318190643.54372-1-psanman@juniper.net>
References: <20260318190643.54372-1-psanman@juniper.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
v3:
- No changes to this patch in this version.

v2:
- New patch in the series.
- Export pmbus_wait() and pmbus_update_ts() to the PMBUS namespace.
- Relocate PMBUS_OP_* bitmasks to the subsystem header.
---
 drivers/hwmon/pmbus/pmbus.h      |  9 +++++++++
 drivers/hwmon/pmbus/pmbus_core.c | 13 ++++---------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 3ddcb742d289..56620ed4ac9c 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -424,6 +424,13 @@ enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv, nvidia195mv };
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
index 4d7634ee6148..b150c2ee670a 100644
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

