Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFFB4078C7
	for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788023165; cv=none; b=lIDklgIq7LU4vyyyKSq7KqGx1B3lANWr6ck5EXVXE1E+0dxyUsBL/aPN9OGtdqBZoCP8nU4Tug4h5X/wZTc0X24Os+dW5WiDTrAtkUx+rMxhSLW0A/p/GrGPg8E6ItQHfZxDswdYIGstjCXpwoj6s7vqoPsuJ1DeIrOZftF2Idk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788023165; c=relaxed/simple;
	bh=+T3SUvIdlpcApYIWZh4RPOenYo/eds0ZgRRRsx4ineI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlxKRALUoGwXBPSLRxFDj7eXIDtYx0GFQ7ooWOfgab00V5Uof7m4axyr+c3m5QwSS/CI54AjeITUhz7VKj+J0uo0Wg/6njx9t2o1A+yrZmldGZ4faDrSVLL0E0n7Uh23eXwarQ3vp5h6OTdkklvKEPkWaDf7AUmV6WWcYwjCadM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLoKVRQT; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLoKVRQT"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c255c58156bso332191566b.3
        for <linux-hwmon@vger.kernel.org>; Sat, 29 Aug 2026 10:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788023157; x=1788627957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTn/4/0+Yqcb2yJiGCQLjeFpCyIkZvplKqCgdVt4fEY=;
        b=kLoKVRQTD77672gi+Q+eyzycfVY4HI3jl/phORUTdJLDEFhhScIWyIXPqfSM43BHFn
         oHEhfJ7bBvtSBWpeBMy8kR703FVjwLc3h8td9fYT8rJYZUoo7uM07Wy/2BPVPpAXGHd6
         wRLGZy5uYHDLoa5PzhuY6bvZBFdugCeiWNYHR23+5iTu1tLaBjb97KUXAzauewLBJKE0
         R3dGzrt9y6QlBcUxRHmK8l14tJ1bdYtfK6ieOKH7mDuJN0rV7SptPVdMcWeDu1WtP1ag
         /NwLV3rND/2OIGGjX43r8TKj84abW/No2l1w0uzUSQm9olGV5/hO+LbleO8BD/Hw+gJG
         D7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788023157; x=1788627957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTn/4/0+Yqcb2yJiGCQLjeFpCyIkZvplKqCgdVt4fEY=;
        b=pyv2Q9nMnkFH1UVJ1vyJod5Fs9QSxQuR/yBd3SJ17WSodVKeeDU7NXKMQlVxADxsbI
         uZIGFPMAMhQIEYt54yiF1okw/T5Sw/XL8OFBCESr/MEc+fuSgowvfzUPGBVj9RTgKmtC
         nYTKcssPV0Hb75W9ih/MyFy6G37ScFBLZQmG7jgQVfM8pPVHOg1Z03UVXjKct7QPQ+HH
         0dDV0C24dZL5kahwjHhpnRaoHRPNV5eDu+3ee9Q6ORLzD5uuO/qPYMlhTU99VrET4BeF
         KjnyvWO7uYfwVcUjoS7oNAyMI41DilZInvvuqwWBfIv8V5xPMu3yDTKD8waE+7MyX+YT
         GIWw==
X-Gm-Message-State: AFuF++l6w39QF+e8093DacUA03x/JSYlrsyD/qzT0n0/NIKVCVh+u37t
	uomm8Ih8pHXekndgBUROsfMoeDdIlb+2VZvj2lT4Oohs9rq2fRazqg42
X-Gm-Gg: AR+sD134mkuY3Au+zcx79D13g49o51/NU0Ib5Q6+DYNZrrZxvfpbuCj5X/4HQ55S4B4
	pHVl7evSq9O1iTlmOIPLhbcVu1/aIAxNxc1lyz2nTZecBxuqXayvz9Bojpq03cn7cn4deovu697
	dxJO892k6HovyqAJdIm9y1LCd5+E3eTYchNYst1kMSEMfCcS79JZ2mgcBmJ2uMOa7uVcAXWLcxj
	hEUfwLjcMLnCSN0aOymi5ru5F2lW7TSZlft2lfKNXGgxiMIdffBOCUUZbWFsgUu53iYvTRiRdxt
	c6pTwqdU0VF6B4y7y9wyhzm6phmcH9MmKMK7If0de0KQTsPNS0NZpxjeqrrl9NLRZFyOLos+Bct
	oAPujTFXR1R5cBO7PMdmKOU7ku5jnwRXAv3bippqSWluJEPmOJwoXaCeGaMKSyhtIC5d+AzASFg
	UUckD22eQM6jdh2ScHbF5cptjdvCTgzv869Ak2ucRJgrkQ/u+HzohCmHGBn/lvmT2S/0RfvCF6M
	1EfwFZVPMKgZa4Ngs2tAlkLLQ==
X-Received: by 2002:a17:907:6d25:b0:c20:2d38:e518 with SMTP id a640c23a62f3a-c2556c61d72mr1008446466b.2.1788023157326;
        Sat, 29 Aug 2026 10:05:57 -0700 (PDT)
Received: from localhost ([2603:5004:20a0:100c:4701:1ac4:1c21:4a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee288afsm213294766b.23.2026.08.29.10.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 10:05:55 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: Jean Delvare <jdelvare@suse.de>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Benoit Masson <yahoo@perenite.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Tollet <jerome.tollet@gmail.com>
Subject: [PATCH v5 3/4] hwmon: it87: expose additional temperature limits
Date: Sat, 29 Aug 2026 19:05:44 +0200
Message-ID: <20260829170545.33401-4-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829170545.33401-1-jerome.tollet@gmail.com>
References: <20260829170545.33401-1-jerome.tollet@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "benoit.masson" <yahoo@perenite.com>

Expose extra temp min/max/offset/type/alarm attributes when a chip
reports more than three temperature resources.

Signed-off-by: benoit.masson <yahoo@perenite.com>
Signed-off-by: Jerome Tollet <jerome.tollet@gmail.com>
---
 drivers/hwmon/it87.c | 58 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e077adbb3..e44ec65c7 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -1349,8 +1349,26 @@ static SENSOR_DEVICE_ATTR_2(temp3_max, S_IRUGO | S_IWUSR, show_temp, set_temp,
 static SENSOR_DEVICE_ATTR_2(temp3_offset, S_IRUGO | S_IWUSR, show_temp,
 			    set_temp, 2, 3);
 static SENSOR_DEVICE_ATTR_2(temp4_input, S_IRUGO, show_temp, NULL, 3, 0);
+static SENSOR_DEVICE_ATTR_2(temp4_min, 0644, show_temp, set_temp,
+			    3, 1);
+static SENSOR_DEVICE_ATTR_2(temp4_max, 0644, show_temp, set_temp,
+			    3, 2);
+static SENSOR_DEVICE_ATTR_2(temp4_offset, 0644, show_temp,
+			    set_temp, 3, 3);
 static SENSOR_DEVICE_ATTR_2(temp5_input, S_IRUGO, show_temp, NULL, 4, 0);
+static SENSOR_DEVICE_ATTR_2(temp5_min, 0644, show_temp, set_temp,
+			    4, 1);
+static SENSOR_DEVICE_ATTR_2(temp5_max, 0644, show_temp, set_temp,
+			    4, 2);
+static SENSOR_DEVICE_ATTR_2(temp5_offset, 0644, show_temp,
+			    set_temp, 4, 3);
 static SENSOR_DEVICE_ATTR_2(temp6_input, S_IRUGO, show_temp, NULL, 5, 0);
+static SENSOR_DEVICE_ATTR_2(temp6_min, 0644, show_temp, set_temp,
+			    5, 1);
+static SENSOR_DEVICE_ATTR_2(temp6_max, 0644, show_temp, set_temp,
+			    5, 2);
+static SENSOR_DEVICE_ATTR_2(temp6_offset, 0644, show_temp,
+			    set_temp, 5, 3);
 
 static int get_temp_type(struct it87_data *data, int index)
 {
@@ -1476,6 +1494,12 @@ static SENSOR_DEVICE_ATTR(temp2_type, S_IRUGO | S_IWUSR, show_temp_type,
 			  set_temp_type, 1);
 static SENSOR_DEVICE_ATTR(temp3_type, S_IRUGO | S_IWUSR, show_temp_type,
 			  set_temp_type, 2);
+static SENSOR_DEVICE_ATTR(temp4_type, 0644, show_temp_type,
+			  set_temp_type, 3);
+static SENSOR_DEVICE_ATTR(temp5_type, 0644, show_temp_type,
+			  set_temp_type, 4);
+static SENSOR_DEVICE_ATTR(temp6_type, 0644, show_temp_type,
+			  set_temp_type, 5);
 
 /* 6 Fans */
 
@@ -2308,6 +2332,9 @@ static SENSOR_DEVICE_ATTR(fan6_alarm, S_IRUGO, show_alarm, NULL, 7);
 static SENSOR_DEVICE_ATTR(temp1_alarm, S_IRUGO, show_alarm, NULL, 16);
 static SENSOR_DEVICE_ATTR(temp2_alarm, S_IRUGO, show_alarm, NULL, 17);
 static SENSOR_DEVICE_ATTR(temp3_alarm, S_IRUGO, show_alarm, NULL, 18);
+static SENSOR_DEVICE_ATTR(temp4_alarm, 0444, show_alarm, NULL, 19);
+static SENSOR_DEVICE_ATTR(temp5_alarm, 0444, show_alarm, NULL, 20);
+static SENSOR_DEVICE_ATTR(temp6_alarm, 0444, show_alarm, NULL, 21);
 static SENSOR_DEVICE_ATTR(intrusion0_alarm, S_IRUGO | S_IWUSR,
 			  show_alarm, clear_intrusion, 4);
 
@@ -2368,6 +2395,9 @@ static SENSOR_DEVICE_ATTR(temp1_beep, S_IRUGO | S_IWUSR,
 			  show_beep, set_beep, 2);
 static SENSOR_DEVICE_ATTR(temp2_beep, S_IRUGO, show_beep, NULL, 2);
 static SENSOR_DEVICE_ATTR(temp3_beep, S_IRUGO, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp4_beep, 0444, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp5_beep, 0444, show_beep, NULL, 2);
+static SENSOR_DEVICE_ATTR(temp6_beep, 0444, show_beep, NULL, 2);
 
 static ssize_t vrm_show(struct device *dev, struct device_attribute *attr,
 			char *buf)
@@ -2530,14 +2560,12 @@ static umode_t it87_temp_is_visible(struct kobject *kobj,
 	int i = index / 7;	/* temperature index */
 	int a = index % 7;	/* attribute index */
 
-	if (index >= 21) {
-		i = index - 21 + 3;
-		a = 0;
-	}
-
 	if (!(data->has_temp & BIT(i)))
 		return 0;
 
+	if (a && i >= data->num_temp_limit)
+		return 0;
+
 	if (a == 3) {
 		if (get_temp_type(data, i) == 0)
 			return 0;
@@ -2579,8 +2607,28 @@ static struct attribute *it87_attributes_temp[] = {
 	&sensor_dev_attr_temp3_beep.dev_attr.attr,
 
 	&sensor_dev_attr_temp4_input.dev_attr.attr,	/* 21 */
+	&sensor_dev_attr_temp4_max.dev_attr.attr,
+	&sensor_dev_attr_temp4_min.dev_attr.attr,
+	&sensor_dev_attr_temp4_type.dev_attr.attr,
+	&sensor_dev_attr_temp4_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp4_offset.dev_attr.attr,
+	&sensor_dev_attr_temp4_beep.dev_attr.attr,
+
 	&sensor_dev_attr_temp5_input.dev_attr.attr,
+	&sensor_dev_attr_temp5_max.dev_attr.attr,
+	&sensor_dev_attr_temp5_min.dev_attr.attr,
+	&sensor_dev_attr_temp5_type.dev_attr.attr,
+	&sensor_dev_attr_temp5_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp5_offset.dev_attr.attr,
+	&sensor_dev_attr_temp5_beep.dev_attr.attr,
+
 	&sensor_dev_attr_temp6_input.dev_attr.attr,
+	&sensor_dev_attr_temp6_max.dev_attr.attr,
+	&sensor_dev_attr_temp6_min.dev_attr.attr,
+	&sensor_dev_attr_temp6_type.dev_attr.attr,
+	&sensor_dev_attr_temp6_alarm.dev_attr.attr,
+	&sensor_dev_attr_temp6_offset.dev_attr.attr,
+	&sensor_dev_attr_temp6_beep.dev_attr.attr,
 	NULL
 };
 
-- 
2.55.0

