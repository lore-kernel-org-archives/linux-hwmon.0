Return-Path: <SRS0=9cdn=4D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DAADC7114D
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2C6392073A
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Feb 2020 12:26:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JiqYpnRG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgBOM0M (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Feb 2020 07:26:12 -0500
Received: from mail-pg1-f176.google.com ([209.85.215.176]:38630 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725937AbgBOM0L (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Feb 2020 07:26:11 -0500
Received: by mail-pg1-f176.google.com with SMTP id d6so6563277pgn.5
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Feb 2020 04:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yphG9a62T919RVoCRAlzDsuykTSypn95aVQX3ODwS7k=;
        b=JiqYpnRG5qDm79ztT94c3rAXyjGT82tqywQSDKB6ElA9OfqsHcTljvKEpmrI/GjafX
         z2wZmkwOcyDtnAoeyNf1uh3pRob+P7aubLEnb7rHbXcQxutUCMlw9NzYJCv69FvIuSSb
         JAGFHaoUod/NXRntrhkttNtqxq9nq+8Zpvj8fuZ5W4R6l/LVuC3By0bchR9IIEkvm0MW
         3L9vP3YG9PXFD5t5Ry0pYuXg0vLV80ByxdAdbjXTPx7JEJ4F35vW78/EMUYhWp3uiO8E
         9s0RnQg4H477+B5bUsKptl3W2Y4OSppDIlnHT/LFRebgCUnbsy43hJykzmVprsvki8VS
         +aJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=yphG9a62T919RVoCRAlzDsuykTSypn95aVQX3ODwS7k=;
        b=fmr/rCtRaNnAns99WzrGr4yZ26ildGk00R/PAas8afcLOiae9newTT3LbVuvg7K55W
         Njg02/EqCWLyT36blvTnYf7WahPSZYT4ev0Z6GXlFUgmbCpxRK5cdHCiy+RZVyGMqKAW
         uvQeRKUg4zgmgLG+yP9Z4wvFMHBsZVr+GVsXyc6/9j9TkCc45boOTw/mkGKmDwOQed4L
         aXdzl1ww68RVIsqN41DuRODC54TZYXb4FgUMUmm8avPDAVyk62kydxSWAS9ZJ6EsDATC
         CSo7vsb1stFioz4yhGzrFxauUwlgBoqSl9YkM6GdiCReUqqmRuTWXthy99l1nk97KKc9
         OXxw==
X-Gm-Message-State: APjAAAVZR6DZNmdlfdUxLnjhBBfv9d6j/exJfBpqeQQxoDXQgFjqvC3D
        1be4t8lrgU6khJZVgq2mnywc3rI8
X-Google-Smtp-Source: APXvYqxN8Sfur46jYEgB4/z7wF5Pcj1I8+WiE0mSZSxRf7HR7j7AxJtHkj3pzjL9dGCoeH+GUvOl+Q==
X-Received: by 2002:aa7:9218:: with SMTP id 24mr8000040pfo.145.1581769568007;
        Sat, 15 Feb 2020 04:26:08 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 4sm10722204pfn.90.2020.02.15.04.26.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 04:26:07 -0800 (PST)
From:   Guenter Roeck <linux@roeck-us.net>
To:     Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH 3/8] hwmon: (pmbus) Implement multi-phase support
Date:   Sat, 15 Feb 2020 04:25:57 -0800
Message-Id: <20200215122602.14245-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215122602.14245-1-linux@roeck-us.net>
References: <20200215122602.14245-1-linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Some PMBus chips support multiple phases, and report telemetry such
as input current, output current, or temperature for each phase.
Add support for such chips to the PMBus core.

Start with a maximum of 8 phases per page, and assume that supported
sensors per phase are similar for all pages. Only support per-phase
telemetry attributes, no limits or alarms.

As part of this patch, set the initial page variable to 0xff to ensure
that the page is updated when the first page command is issued. Also
only issue page commands if the chip supports more than one page.

Cc: Vadim Pasternak <vadimp@mellanox.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/pmbus.rst    |  8 ++-
 drivers/hwmon/pmbus/pmbus.h      |  6 ++-
 drivers/hwmon/pmbus/pmbus_core.c | 85 +++++++++++++++++++++++---------
 3 files changed, 74 insertions(+), 25 deletions(-)

diff --git a/Documentation/hwmon/pmbus.rst b/Documentation/hwmon/pmbus.rst
index f787984e88a9..2658ddee70eb 100644
--- a/Documentation/hwmon/pmbus.rst
+++ b/Documentation/hwmon/pmbus.rst
@@ -227,7 +227,9 @@ currX_lcrit_alarm	Output current critical low alarm.
 			From IOUT_UC_FAULT status.
 currX_crit_alarm	Current critical high alarm.
 			From IIN_OC_FAULT or IOUT_OC_FAULT status.
-currX_label		"iin" or "ioutY"
+currX_label		"iin", "iinY", "iinY.Z", "ioutY", or "ioutY.Z",
+			where Y reflects the page number and Z reflects the
+			phase.
 
 powerX_input		Measured power. From READ_PIN or READ_POUT register.
 powerX_cap		Output power cap. From POUT_MAX register.
@@ -239,7 +241,9 @@ powerX_alarm		Power high alarm.
 			From PIN_OP_WARNING or POUT_OP_WARNING status.
 powerX_crit_alarm	Output power critical high alarm.
 			From POUT_OP_FAULT status.
-powerX_label		"pin" or "poutY"
+powerX_label		"pin", "pinY", "pinY.Z", "poutY", or "poutY.Z",
+			where Y reflects the page number and Z reflects the
+			phase.
 
 tempX_input		Measured temperature.
 			From READ_TEMPERATURE_X register.
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 27c7ae0ffa6b..18e06fc6c53f 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -362,6 +362,7 @@ enum pmbus_sensor_classes {
 };
 
 #define PMBUS_PAGES	32	/* Per PMBus specification */
+#define PMBUS_PHASES	8	/* Maximum number of phases per page */
 
 /* Functionality bit mask */
 #define PMBUS_HAVE_VIN		BIT(0)
@@ -388,13 +389,15 @@ enum pmbus_sensor_classes {
 #define PMBUS_HAVE_PWM34	BIT(21)
 #define PMBUS_HAVE_SAMPLES	BIT(22)
 
-#define PMBUS_PAGE_VIRTUAL	BIT(31)
+#define PMBUS_PHASE_VIRTUAL	BIT(30)	/* Phases on this page are virtual */
+#define PMBUS_PAGE_VIRTUAL	BIT(31)	/* Page is virtual */
 
 enum pmbus_data_format { linear = 0, direct, vid };
 enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv };
 
 struct pmbus_driver_info {
 	int pages;		/* Total number of pages */
+	u8 phases[PMBUS_PAGES];	/* Number of phases per page */
 	enum pmbus_data_format format[PSC_NUM_CLASSES];
 	enum vrm_version vrm_version[PMBUS_PAGES]; /* vrm version per page */
 	/*
@@ -406,6 +409,7 @@ struct pmbus_driver_info {
 	int R[PSC_NUM_CLASSES];	/* exponent */
 
 	u32 func[PMBUS_PAGES];	/* Functionality, per page */
+	u32 pfunc[PMBUS_PHASES];/* Functionality, per phase */
 	/*
 	 * The following functions map manufacturing specific register values
 	 * to PMBus standard register values. Specify only if mapping is
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 9343ca7d4069..8d321bf7d15b 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -49,6 +49,7 @@ struct pmbus_sensor {
 	char name[PMBUS_NAME_SIZE];	/* sysfs sensor name */
 	struct device_attribute attribute;
 	u8 page;		/* page number */
+	u8 phase;		/* phase number, 0xff for all phases */
 	u16 reg;		/* register */
 	enum pmbus_sensor_classes class;	/* sensor class */
 	bool update;		/* runtime sensor update needed */
@@ -109,6 +110,7 @@ struct pmbus_data {
 	int (*read_status)(struct i2c_client *client, int page);
 
 	u8 currpage;
+	u8 currphase;	/* current phase, 0xff for all */
 };
 
 struct pmbus_debugfs_entry {
@@ -151,10 +153,11 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	int rv;
 
-	if (page < 0 || page == data->currpage)
+	if (page < 0)
 		return 0;
 
-	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL)) {
+	if (!(data->info->func[page] & PMBUS_PAGE_VIRTUAL) &&
+	    data->info->pages > 1 && page != data->currpage) {
 		rv = i2c_smbus_write_byte_data(client, PMBUS_PAGE, page);
 		if (rv < 0)
 			return rv;
@@ -166,9 +169,17 @@ int pmbus_set_page(struct i2c_client *client, int page, int phase)
 		if (rv != page)
 			return -EIO;
 	}
-
 	data->currpage = page;
 
+	if (data->info->phases[page] && data->currphase != phase &&
+	    !(data->info->func[page] & PMBUS_PHASE_VIRTUAL)) {
+		rv = i2c_smbus_write_byte_data(client, PMBUS_PHASE,
+					       phase);
+		if (rv)
+			return rv;
+	}
+	data->currphase = phase;
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pmbus_set_page);
@@ -602,7 +613,7 @@ static struct pmbus_data *pmbus_update_device(struct device *dev)
 				sensor->data
 				    = _pmbus_read_word_data(client,
 							    sensor->page,
-							    0xff,
+							    sensor->phase,
 							    sensor->reg);
 		}
 		pmbus_clear_faults(client);
@@ -1084,7 +1095,8 @@ static int pmbus_add_boolean(struct pmbus_data *data,
 
 static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 					     const char *name, const char *type,
-					     int seq, int page, int reg,
+					     int seq, int page, int phase,
+					     int reg,
 					     enum pmbus_sensor_classes class,
 					     bool update, bool readonly,
 					     bool convert)
@@ -1108,6 +1120,7 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 		readonly = true;
 
 	sensor->page = page;
+	sensor->phase = phase;
 	sensor->reg = reg;
 	sensor->class = class;
 	sensor->update = update;
@@ -1127,7 +1140,7 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 
 static int pmbus_add_label(struct pmbus_data *data,
 			   const char *name, int seq,
-			   const char *lstring, int index)
+			   const char *lstring, int index, int phase)
 {
 	struct pmbus_label *label;
 	struct device_attribute *a;
@@ -1139,11 +1152,21 @@ static int pmbus_add_label(struct pmbus_data *data,
 	a = &label->attribute;
 
 	snprintf(label->name, sizeof(label->name), "%s%d_label", name, seq);
-	if (!index)
-		strncpy(label->label, lstring, sizeof(label->label) - 1);
-	else
-		snprintf(label->label, sizeof(label->label), "%s%d", lstring,
-			 index);
+	if (!index) {
+		if (phase == 0xff)
+			strncpy(label->label, lstring,
+				sizeof(label->label) - 1);
+		else
+			snprintf(label->label, sizeof(label->label), "%s.%d",
+				 lstring, phase);
+	} else {
+		if (phase == 0xff)
+			snprintf(label->label, sizeof(label->label), "%s%d",
+				 lstring, index);
+		else
+			snprintf(label->label, sizeof(label->label), "%s%d.%d",
+				 lstring, index, phase);
+	}
 
 	pmbus_dev_attr_init(a, label->name, 0444, pmbus_show_label, NULL);
 	return pmbus_add_attribute(data, &a->attr);
@@ -1208,7 +1231,7 @@ static int pmbus_add_limit_attrs(struct i2c_client *client,
 	for (i = 0; i < nlimit; i++) {
 		if (pmbus_check_word_register(client, page, l->reg)) {
 			curr = pmbus_add_sensor(data, name, l->attr, index,
-						page, l->reg, attr->class,
+						page, 0xff, l->reg, attr->class,
 						attr->update || l->update,
 						false, true);
 			if (!curr)
@@ -1235,7 +1258,7 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 				      struct pmbus_data *data,
 				      const struct pmbus_driver_info *info,
 				      const char *name,
-				      int index, int page,
+				      int index, int page, int phase,
 				      const struct pmbus_sensor_attr *attr,
 				      bool paged)
 {
@@ -1245,15 +1268,16 @@ static int pmbus_add_sensor_attrs_one(struct i2c_client *client,
 
 	if (attr->label) {
 		ret = pmbus_add_label(data, name, index, attr->label,
-				      paged ? page + 1 : 0);
+				      paged ? page + 1 : 0, phase);
 		if (ret)
 			return ret;
 	}
-	base = pmbus_add_sensor(data, name, "input", index, page, attr->reg,
-				attr->class, true, true, true);
+	base = pmbus_add_sensor(data, name, "input", index, page, phase,
+				attr->reg, attr->class, true, true, true);
 	if (!base)
 		return -ENOMEM;
-	if (attr->sfunc) {
+	/* No limit and alarm attributes for phase specific sensors */
+	if (attr->sfunc && phase == 0xff) {
 		ret = pmbus_add_limit_attrs(client, data, info, name,
 					    index, page, base, attr);
 		if (ret < 0)
@@ -1323,10 +1347,25 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 				continue;
 			ret = pmbus_add_sensor_attrs_one(client, data, info,
 							 name, index, page,
-							 attrs, paged);
+							 0xff, attrs, paged);
 			if (ret)
 				return ret;
 			index++;
+			if (info->phases[page]) {
+				int phase;
+
+				for (phase = 0; phase < info->phases[page];
+				     phase++) {
+					if (!(info->pfunc[phase] & attrs->func))
+						continue;
+					ret = pmbus_add_sensor_attrs_one(client,
+						data, info, name, index, page,
+						phase, attrs, paged);
+					if (ret)
+						return ret;
+					index++;
+				}
+			}
 		}
 		attrs++;
 	}
@@ -1830,7 +1869,7 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 	struct pmbus_sensor *sensor;
 
 	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
-				  PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
+				  PMBUS_VIRT_FAN_TARGET_1 + id, 0xff, PSC_FAN,
 				  false, false, true);
 
 	if (!sensor)
@@ -1841,14 +1880,14 @@ static int pmbus_add_fan_ctrl(struct i2c_client *client,
 		return 0;
 
 	sensor = pmbus_add_sensor(data, "pwm", NULL, index, page,
-				  PMBUS_VIRT_PWM_1 + id, PSC_PWM,
+				  PMBUS_VIRT_PWM_1 + id, 0xff, PSC_PWM,
 				  false, false, true);
 
 	if (!sensor)
 		return -ENOMEM;
 
 	sensor = pmbus_add_sensor(data, "pwm", "enable", index, page,
-				  PMBUS_VIRT_PWM_ENABLE_1 + id, PSC_PWM,
+				  PMBUS_VIRT_PWM_ENABLE_1 + id, 0xff, PSC_PWM,
 				  true, false, false);
 
 	if (!sensor)
@@ -1890,7 +1929,7 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
 				continue;
 
 			if (pmbus_add_sensor(data, "fan", "input", index,
-					     page, pmbus_fan_registers[f],
+					     page, pmbus_fan_registers[f], 0xff,
 					     PSC_FAN, true, true, true) == NULL)
 				return -ENOMEM;
 
@@ -2490,6 +2529,8 @@ int pmbus_do_probe(struct i2c_client *client, const struct i2c_device_id *id,
 	if (pdata)
 		data->flags = pdata->flags;
 	data->info = info;
+	data->currpage = 0xff;
+	data->currphase = 0xfe;
 
 	ret = pmbus_init_common(client, data, info);
 	if (ret < 0)
-- 
2.17.1

