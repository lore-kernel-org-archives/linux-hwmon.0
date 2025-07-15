Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EDF1F7586
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Jul 2025 01:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752542447; cv=none; b=Q/ZhGoHgNeUPtyops1zudkxLel2JTLpZQ9IK2tQDjs75MAZidd8mlFwi8y2YEE9eqc7qnuFl5eBNpjPzhMh43qdETCrDW2XwBnaQ6UEKtp0hJfMnyU0Wcw9xO/c5eTLHWBjxhdwnYLO1Ijta48bsaJTM810jOhLNUmd7yZMHXFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752542447; c=relaxed/simple;
	bh=aIZbLBsah3Yw0NJEHGudXnDSIeXYLls3JcTgUq6xWPw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ozQQEsWNjQidDPyE+6AwyopDR2AB28vFGQ0hJpMLy7vxEiFKnrasj56NsKWO0yj9xcB1dY4IiGeZjW8Jfderq7mWUBLVsDY5Hw+uqDy+E9F0scO3w2g24fOJcUKKGfz2PUZuXIB3zXmjj/KoOqUo+viHoVaktOOR5fRJhWuKDRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QpLuphKK; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QpLuphKK"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752542443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xFYh68TfjA4tujo44GWGu2WxKiJwS1euTrgYfJD1Erg=;
	b=QpLuphKKTLaefpPKmKKtu3LFfoRSjtPkQwaTT+Y4lQZ1Afi/K2oyigstmCt1UFq+umF8Ls
	gy/RyXVQQrDVtKkjwM1NED7QUYcztxTvz7Y1pQpTB00VoVe8mwsMouGNSq06vqmU1ZnH7F
	L65SrUR5qzQx3JznxUAolDay1VXxiqg=
From: Sean Anderson <sean.anderson@linux.dev>
To: Jonathan Cameron <jic23@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-iio@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 6/7] hwmon: iio: Add min/max support
Date: Mon, 14 Jul 2025 21:20:22 -0400
Message-Id: <20250715012023.2050178-7-sean.anderson@linux.dev>
In-Reply-To: <20250715012023.2050178-1-sean.anderson@linux.dev>
References: <20250715012023.2050178-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add support for minimum/maximum attributes. Like the _input attribute,
we just need to call into the IIO API.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/hwmon/iio_hwmon.c | 94 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/iio_hwmon.c b/drivers/hwmon/iio_hwmon.c
index 7dc156d2aea4..3db4d4b30022 100644
--- a/drivers/hwmon/iio_hwmon.c
+++ b/drivers/hwmon/iio_hwmon.c
@@ -95,6 +95,54 @@ static ssize_t iio_hwmon_read_val(struct device *dev,
 	return sprintf(buf, "%d\n", result);
 }
 
+static ssize_t iio_hwmon_read_event(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct iio_hwmon_state *state = dev_get_drvdata(dev);
+	struct iio_channel *chan = &state->channels[sattr->index];
+	int ret, result, scale;
+
+	scale = iio_hwmon_scale(chan);
+	if (scale < 0)
+		return scale;
+
+	ret = iio_read_event_processed_scale(chan, IIO_EV_TYPE_THRESH,
+					     sattr->nr, IIO_EV_INFO_VALUE,
+					     &result, scale);
+	if (ret < 0)
+		return ret;
+
+	return sprintf(buf, "%d\n", result);
+}
+
+static ssize_t iio_hwmon_write_event(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
+	struct iio_hwmon_state *state = dev_get_drvdata(dev);
+	struct iio_channel *chan = &state->channels[sattr->index];
+	int ret, scale, val;
+
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return ret;
+
+	scale = iio_hwmon_scale(chan);
+	if (scale < 0)
+		return scale;
+
+	ret = iio_write_event_processed_scale(chan, IIO_EV_TYPE_THRESH,
+					      sattr->nr, IIO_EV_INFO_VALUE,
+					      val, scale);
+	if (ret < 0)
+		return ret;
+
+	return count;
+}
+
 static int add_device_attr(struct device *dev, struct iio_hwmon_state *st,
 			   ssize_t (*show)(struct device *dev,
 					   struct device_attribute *attr,
@@ -123,6 +171,40 @@ static int add_device_attr(struct device *dev, struct iio_hwmon_state *st,
 	return 0;
 }
 
+static int add_event_attr(struct device *dev, struct iio_hwmon_state *st,
+			  int i, enum iio_event_direction dir,
+			  const char *fmt, ...)
+{
+	struct sensor_device_attribute_2 *a;
+	umode_t mode;
+	va_list ap;
+
+	mode = iio_event_mode(&st->channels[i], IIO_EV_TYPE_THRESH, dir,
+			      IIO_EV_INFO_VALUE);
+	if (!mode)
+		return 0;
+
+	a = devm_kzalloc(dev, sizeof(*a), GFP_KERNEL);
+	if (!a)
+		return -ENOMEM;
+
+	sysfs_attr_init(&a->dev_attr.attr);
+	va_start(ap, fmt);
+	a->dev_attr.attr.name = devm_kvasprintf(dev, GFP_KERNEL, fmt, ap);
+	va_end(ap);
+	if (!a->dev_attr.attr.name)
+		return -ENOMEM;
+
+	a->dev_attr.show = iio_hwmon_read_event;
+	a->dev_attr.store = iio_hwmon_write_event;
+	a->dev_attr.attr.mode = mode;
+	a->index = i;
+	a->nr = dir;
+
+	st->attrs[st->num_attrs++] = &a->dev_attr.attr;
+	return 0;
+}
+
 static int iio_hwmon_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -156,7 +238,7 @@ static int iio_hwmon_probe(struct platform_device *pdev)
 		st->num_channels++;
 
 	st->attrs = devm_kcalloc(dev,
-				 2 * st->num_channels + 1, sizeof(*st->attrs),
+				 4 * st->num_channels + 1, sizeof(*st->attrs),
 				 GFP_KERNEL);
 	if (st->attrs == NULL)
 		return -ENOMEM;
@@ -206,6 +288,16 @@ static int iio_hwmon_probe(struct platform_device *pdev)
 			if (ret)
 				return ret;
 		}
+
+		ret = add_event_attr(dev, st, i, IIO_EV_DIR_FALLING,
+				     "%s%d_min", prefix, n);
+		if (ret)
+			return ret;
+
+		ret = add_event_attr(dev, st, i, IIO_EV_DIR_RISING,
+				     "%s%d_max", prefix, n);
+		if (ret)
+			return ret;
 	}
 
 	devm_free_pages(dev, (unsigned long)buf);
-- 
2.35.1.1320.gc452695387.dirty

