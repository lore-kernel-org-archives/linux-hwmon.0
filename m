Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727E3EDAD9
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 21:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841226; cv=none; b=HQ8CYbabEhk8Zvw1Duh8LCLx/vbOkOB9xRmqfnJN5bWUfbiVXFo34mcI8rN3334gMKnWSKxFNvGrD2XoQt2lL/Rx/iv5bwcCx46/kdTpy4MXXNjMs38fHnBPQiScZs3eR+RdR/Le7VmCXuH/rATMeXcfFm7zh4YP2ZpdhPsY6QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841226; c=relaxed/simple;
	bh=BVOaMM1wQ0JLBp7Q7JDWuAoLOhwzhut/4ZqRlz7XTs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J3WRIRlPuDi2Y7pDUl08PaKSi5xSBlCSiVnI3rYNV3NAyjSqoxJX84WSTMh8suMOXOf20IXn6XxH2eXim4y4mij707wHrvHHO40jxJc78pvcvB/pbrjz7mlC0QzD7IvsdIQXyfbzli9D5GHW3CN1D9gvfjmLOZYN7RBV8WIOF6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UhV1TCOz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhV1TCOz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cace91f112so13770225ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 14:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784841220; x=1785446020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnAfL6bShJ02BETZQiK5PYC/AGzRq/Lc46EJ++kfmkI=;
        b=UhV1TCOzarkX07OqvU8hNSInCJc/sZ3NOHjy3h/sNsEh6dbg5cV8t1Im/KVCMNqnWe
         +3328faagAgyLpgjhkvKHKvkXxXxznWX0PzaN6p6EpMmQ0vCuQVDdQKDTl57aQouG4BM
         XpLvqBFlHp5QnT3wRj0pWi1+F1xoOJg9+Flujb4y/8RAV6u8kyS3VgkohGR2i1IQ6Mya
         oQGbukzjJsyrt/5jn0o7ShqOeV0TiI6iZUluC7zVeCuC3A6EF4Y8d9xceWLeoHKfXdnE
         +EwOfYh9wbOV315qlaIKKsP9M3sYjXR/tC1WEeLSQbImi4IQhyj0f54sQAlPG6KCjT1k
         ineQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784841220; x=1785446020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnAfL6bShJ02BETZQiK5PYC/AGzRq/Lc46EJ++kfmkI=;
        b=aI2KMngHJ/klf8PjI43Cbl4yAsS6Ts+tY4QJwg4A4yj4VJVx3qaaCUs1lrp4u3gJdR
         h4OQrzBRlLP7aThaRdWUuCS5Ufau5Sbrr/GiFDlFX5URES54hb3WxiNxSgHvf2M+WsId
         OvqDzpa5OShTfy2IOmrlh9hLv75ct1H7dcAsCAsDvt/TzQys7SpD5WM3x7w8iIoYPoVD
         h0jwD5cALbA0lPPjD/oWAYnPpbhEew+p3Zqhii38BPTFMo04rGXXSfUlUB16jpimr2H2
         NEOT/t5AW9mz3Ohc+6H4Fu3dJ/If3JrOFezQ+bJlUY4a7ZOcJD05Zds/SDSyWm7EJNis
         V/nw==
X-Gm-Message-State: AOJu0YzDFBzlFxBmgtN2yhMTlEZzx0CUjWniBLyZ60Gy9YYbEBOmsrj6
	/aFFPDcJwaAJNzxjDAqLc9GwyPDp+wJBaB1wdipvWg2reGlFz7QBGjyTNgU8Bg==
X-Gm-Gg: AR+sD12Ps9vl9Ada350lNy8ROP6LV2z2b85GCbuDPhBBJA1n+laBouJi1X9h7YQUFMB
	wFVD07CUqFHoY8lLGJ78OMkqmjco4M/phrWgfFKYxWW6g8moDJH5V5ZnY9ETUAE/B2Om8UuNrux
	7fpH87PSyf3OYB2caKc47NtLYKjDgUQnWzBMtc4BzWHLjqDtQF2pPaK1AayNL9lyPEGO0vCmuGb
	mm3wUoJ7n+0db614EI2AEox/sXD15vvGLOXmcZLCLDwashalXnjQfehV6xt1cIYzj1mJM2WJ0BV
	V1YS0L3BOVrndd0uB8Rfw0G0Z6hVWWNg3lQYYcuRfI72MRnBxE1KPDiNm3z8TUleeeYZTU5RvH9
	s5tKz4KiViWyTkhlJWVXMOOq4GLb4v9Rv+jTJOM2C/F791Vm9Xr2QTACMydq5DPewn1mQ78lysJ
	dvXPvENYBfGc6dHaeVIfM2ujgC3w==
X-Received: by 2002:a17:903:46c6:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2cfa6a51b56mr54899875ad.2.1784841219620;
        Thu, 23 Jul 2026 14:13:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1ca3efsm28133554eec.30.2026.07.23.14.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:13:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Vincent Jardin <vjardin@free.fr>
Subject: [RFT PATCH] hwmon: (pmbus) Fix type confusion in notification logic
Date: Thu, 23 Jul 2026 14:13:36 -0700
Message-ID: <20260723211336.3046042-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sashiko reports:

At the start of the loop in pmbus_notify(), the code unconditionally casts
every attribute to a struct sensor_device_attribute:

drivers/hwmon/pmbus/pmbus_core.c:pmbus_notify() {
    for (i = 0; i < data->num_attributes; i++) {
        struct device_attribute *da = to_dev_attr(data->group.attrs[i]);
        struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
        int index = attr->index;
...
}

However, data->group.attrs can contain other types like struct
pmbus_samples_reg or struct pmbus_sensor, which only embed a base
struct device_attribute.

If da is a struct pmbus_samples_reg, dev_attr is the last member. Casting
it to struct sensor_device_attribute and reading the index field appears
to access memory past the end of the allocation, which might trigger a
slab-out-of-bounds read.

Additionally, if da is a struct pmbus_sensor, casting it causes the index
field to overlap with the page, phase, and reg fields. Could this produce
a garbage mask on little-endian systems that spuriously matches the target
reg, page, and flags during an alert?

Fix the problem by using struct sensor_device_attr in struct pmbus_sensor
and struct pmbus_label. Since those attributes never trigger a
notification, set the value of attr->index to -1 for them. Use this value
to distinguish from boolean attributes which _can_ trigger a notification
and use the index field to encode mask, page, and register values.

Fixes: f469bde9afd1 ("hwmon: (pmbus/core) Notify hwmon events")
Cc: Vincent Jardin <vjardin@free.fr>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
RFT: Build-tested only

 drivers/hwmon/pmbus/pmbus_core.c | 61 +++++++++++++++++++-------------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 0081f16c3a95..42703968f157 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -45,7 +45,7 @@ module_param(wp, int, 0444);
 struct pmbus_sensor {
 	struct pmbus_sensor *next;
 	char name[PMBUS_NAME_SIZE];	/* sysfs sensor name */
-	struct device_attribute attribute;
+	struct sensor_device_attribute attribute;
 	u8 page;		/* page number */
 	u8 phase;		/* phase number, 0xff for all phases */
 	u16 reg;		/* register */
@@ -68,7 +68,7 @@ struct pmbus_boolean {
 
 struct pmbus_label {
 	char name[PMBUS_NAME_SIZE];	/* sysfs label name */
-	struct device_attribute attribute;
+	struct sensor_device_attribute attribute;
 	char label[PMBUS_NAME_SIZE];	/* label */
 };
 #define to_pmbus_label(_attr) \
@@ -1241,7 +1241,8 @@ static ssize_t pmbus_show_sensor(struct device *dev,
 				 struct device_attribute *devattr, char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pmbus_sensor *sensor = to_pmbus_sensor(attr);
 	struct pmbus_data *data = i2c_get_clientdata(client);
 	s64 val;
 
@@ -1261,7 +1262,8 @@ static ssize_t pmbus_set_sensor(struct device *dev,
 {
 	struct i2c_client *client = to_i2c_client(dev->parent);
 	struct pmbus_data *data = i2c_get_clientdata(client);
-	struct pmbus_sensor *sensor = to_pmbus_sensor(devattr);
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pmbus_sensor *sensor = to_pmbus_sensor(attr);
 	s64 val;
 	int ret;
 	u16 regval;
@@ -1283,7 +1285,8 @@ static ssize_t pmbus_set_sensor(struct device *dev,
 static ssize_t pmbus_show_label(struct device *dev,
 				struct device_attribute *da, char *buf)
 {
-	struct pmbus_label *label = to_pmbus_label(da);
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
+	struct pmbus_label *label = to_pmbus_label(attr);
 
 	return sysfs_emit(buf, "%s\n", label->label);
 }
@@ -1436,8 +1439,8 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 					     bool update, bool readonly,
 					     bool writeonly, bool convert)
 {
+	struct sensor_device_attribute *a;
 	struct pmbus_sensor *sensor;
-	struct device_attribute *a;
 
 	sensor = devm_kzalloc(data->dev, sizeof(*sensor), GFP_KERNEL);
 	if (!sensor)
@@ -1461,12 +1464,11 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
 	sensor->update = update;
 	sensor->convert = convert;
 	sensor->data = -ENODATA;
-	pmbus_dev_attr_init(a, sensor->name,
-			    readonly ? 0444 : 0644,
-			    writeonly ? pmbus_show_zero : pmbus_show_sensor,
-			    pmbus_set_sensor);
+	pmbus_attr_init(a, sensor->name, readonly ? 0444 : 0644,
+			writeonly ? pmbus_show_zero : pmbus_show_sensor,
+			pmbus_set_sensor, -1);
 
-	if (pmbus_add_attribute(data, &a->attr))
+	if (pmbus_add_attribute(data, &a->dev_attr.attr))
 		return NULL;
 
 	sensor->next = data->sensors;
@@ -1483,8 +1485,8 @@ static int pmbus_add_label(struct pmbus_data *data,
 			   const char *name, int seq,
 			   const char *lstring, int index, int phase)
 {
+	struct sensor_device_attribute *a;
 	struct pmbus_label *label;
-	struct device_attribute *a;
 
 	label = devm_kzalloc(data->dev, sizeof(*label), GFP_KERNEL);
 	if (!label)
@@ -1508,8 +1510,8 @@ static int pmbus_add_label(struct pmbus_data *data,
 				 lstring, index, phase);
 	}
 
-	pmbus_dev_attr_init(a, label->name, 0444, pmbus_show_label, NULL);
-	return pmbus_add_attribute(data, &a->attr);
+	pmbus_attr_init(a, label->name, 0444, pmbus_show_label, NULL, -1);
+	return pmbus_add_attribute(data, &a->dev_attr.attr);
 }
 
 /*
@@ -2397,7 +2399,7 @@ struct pmbus_samples_attr {
 struct pmbus_samples_reg {
 	int page;
 	struct pmbus_samples_attr *attr;
-	struct device_attribute dev_attr;
+	struct sensor_device_attribute attribute;
 };
 
 static struct pmbus_samples_attr pmbus_samples_registers[] = {
@@ -2419,14 +2421,15 @@ static struct pmbus_samples_attr pmbus_samples_registers[] = {
 	}
 };
 
-#define to_samples_reg(x) container_of(x, struct pmbus_samples_reg, dev_attr)
+#define to_samples_reg(x) container_of(x, struct pmbus_samples_reg, attribute)
 
 static ssize_t pmbus_show_samples(struct device *dev,
 				  struct device_attribute *devattr, char *buf)
 {
 	int val;
 	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pmbus_samples_reg *reg = to_samples_reg(attr);
 
 	scoped_guard(pmbus_lock, client) {
 		val = _pmbus_read_word_data(client, reg->page, 0xff, reg->attr->reg);
@@ -2444,7 +2447,8 @@ static ssize_t pmbus_set_samples(struct device *dev,
 	int ret;
 	long val;
 	struct i2c_client *client = to_i2c_client(dev->parent);
-	struct pmbus_samples_reg *reg = to_samples_reg(devattr);
+	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
+	struct pmbus_samples_reg *reg = to_samples_reg(attr);
 
 	if (kstrtol(buf, 0, &val) < 0)
 		return -EINVAL;
@@ -2459,6 +2463,7 @@ static ssize_t pmbus_set_samples(struct device *dev,
 static int pmbus_add_samples_attr(struct pmbus_data *data, int page,
 				  struct pmbus_samples_attr *attr)
 {
+	struct sensor_device_attribute *a;
 	struct pmbus_samples_reg *reg;
 
 	reg = devm_kzalloc(data->dev, sizeof(*reg), GFP_KERNEL);
@@ -2468,10 +2473,12 @@ static int pmbus_add_samples_attr(struct pmbus_data *data, int page,
 	reg->attr = attr;
 	reg->page = page;
 
-	pmbus_dev_attr_init(&reg->dev_attr, attr->name, 0644,
-			    pmbus_show_samples, pmbus_set_samples);
+	a = &reg->attribute;
 
-	return pmbus_add_attribute(data, &reg->dev_attr.attr);
+	pmbus_attr_init(a, attr->name, 0644,
+			pmbus_show_samples, pmbus_set_samples, -1);
+
+	return pmbus_add_attribute(data, &a->dev_attr.attr);
 }
 
 static int pmbus_add_samples_attributes(struct i2c_client *client,
@@ -2979,9 +2986,15 @@ static void pmbus_notify(struct pmbus_data *data, int page, int reg, int flags)
 		struct device_attribute *da = to_dev_attr(data->group.attrs[i]);
 		struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
 		int index = attr->index;
-		u16 smask = pb_index_to_mask(index);
-		u8 spage = pb_index_to_page(index);
-		u16 sreg = pb_index_to_reg(index);
+		u16 smask, sreg;
+		u8 spage;
+
+		if (index == -1)
+			continue;
+
+		smask = pb_index_to_mask(index);
+		spage = pb_index_to_page(index);
+		sreg = pb_index_to_reg(index);
 
 		if (reg == sreg && page == spage && (smask & flags)) {
 			dev_dbg(data->dev, "sysfs notify: %s", da->attr.name);
-- 
2.45.2

