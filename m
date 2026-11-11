Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385737;
	b=G57A6nrM+WPuU+R1ak+mPwT5DBFzh+rd33cESmHedw2FZcf/Mm+5tro5lfuEFG2hevrO
	 KUT14ZsCsWN1+w7yacUByy6s5PNJWF7GkxXnf8GS5z+kKquU3L+n7c3RUnS0mSUhhPb/8
	 vTMPA8kiTvmWZWcUiXZkCNWfmwr6ik1J8djZZ/D2r1mZgd4J9rURzSbFJLFtJ78xLMS9R
	 EYyb9wBuWKkfStBfmiLoCuPvl1qkuiCMkXfUDiDXyc36RO+ZRijC3tEcNFyjzJNN0cQQw
	 50PmRcHRDG2MXmKZS66VZC/BJsVlhrthGvlsa+ArNr5VmYVmfsHQTJyqp8nx9hr6jxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k38d6anjSDhUfif+YA8JiZnUO/fighramhUwYa6uFhs=;
	b=m+tFKM4NnZDDj6kVg90B7QpiBc5VucuXT0AsG0+EgsY0vovXqm+ZM8d2fmZkHvvkGhzU
	 5RIKkH/5OpN7yxYYE70ew3HNw7/R7Y2CnAuASBdbF1mr9j3gICkZY1cI+2b3izAHZLG1J
	 7okKtqJ0+o4yoJZpX2Hdmi53s4KhG6vHgJk26fvqnw4JRwgW9IoswjINTRGY1JEGZTSUt
	 x1nMpqKR5kG6172laGh07RZZ3yPsmQuXdG8E5nTid2w9cZ+ovMgSEdRoqXpFwewpV9QG1
	 UNb8bNnEvRSHwqBbbpkfo52ssQhV3s4fRKKg6vi3i5o9IP6RDKyGBUoXsi1k0Uxx1WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jY5GeuBO;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D5460A3812
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84D5460A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jY5GeuBO
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d473cfff6so405849266b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 00:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385735; x=1794990535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k38d6anjSDhUfif+YA8JiZnUO/fighramhUwYa6uFhs=;
        b=jY5GeuBOl8bHMfi0r7mnCkCG3Aso/9E7hAETup2M9paBvEolf2g1FrN8/p8zb/oLUf
         Y71B5ThijYLK3uQuRWoAYNj3Itm0hmXDgMw9cgj2PZVJ8Bl7eyzPV5VnCbmdCyYCQsKL
         GHAyvHijf7wtoGCrYQU3rB63hpYoN8K0Lbr/ozpjQSG1VmHYO/INdm/Dy8kmba9dwCbH
         6ixusH/YZ9Q7aXmL5oI2EylKHtYm3MilEJThsvm03P0rhSIdaum6IaNhQjPLAo3ZC4zD
         oGI1qqb0CXulyB/WcIEbG9OGRryB46/03V3H+ScVE23v1mAmYe2ajBXDz5eW2YTd9TcN
         s3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385735; x=1794990535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k38d6anjSDhUfif+YA8JiZnUO/fighramhUwYa6uFhs=;
        b=Fbrc8Im0vFbnO79iWtMDl0m7P+AGn+LhDRRqzNaQoJm0dQSlpUkYL1kouxqK/Du14y
         j178FkQv8tYJWDfcZ/g67PdOsYMNGheDv1+V1rgrfqiO6u7SCwXiUquTcp6T3+d+OFEN
         se/HRAcuT9N3GWA2kgT9IsubebE/9ZgRugRnyHQQc4BJ82mqM7lkvhbbD+AvJane4nM3
         2xw4soEZYABqFBvsOIdK95SmsC47x1aLH4ZF/YslHVmYRoxAMD3D/E6R8vMFpnS5fnm2
         4eXPNflsW37JTBU9vXZuBTP0GDRgoj9B5OIB+/jYvEithrtsCZR1F+g3/CHpwocwcS2n
         nwnA==
X-Gm-Message-State: APuU4Z/g71dE3vPBTgx9Mfb2ZITFdwSDLZtnU0s4IBl4L0FTVS5L9S4g
	os1X8DqY+EP79fxzalwJtfnbvw+9StZYs2JJ76FD1t6v7dA59A1NA8Nh
X-Gm-Gg: AYBFou2l4pwtsRj54Lo3LQ919kZaasUDjHHcDBdJNhS5aH9TXhWOCL1/+Oo3fb8sIid
	XKygCrK0+vwJWzbr4Ghh4P2g31kAieVeWKSK3YoHG3hr+ZSRcjOUJyo7Ytg7WyjFnV2dTnLUOKW
	GibTU8OEp74U1iM+jwuEnFnY+bQRrzlx+xoPQEIboKSZVgj3dUEJ8y33Y6x1D/v0IJpHaOlCmPB
	xn6gw2IFbInHYAgmI3Kr3YRZBQ2b75mu+vLGDMzdFLV+ASq2/5xRbdv2UzSM0UWl9r1w8TKRJvs
	k3t1u5Bb3maqB07qX3dJJ23fy1BJH1XreEkBwQ/Ge+o17QlWCvaEdLwtKUq6ER/RMO7LLKeDP40
	IGJzsQ6fcsAYHzsYK9CGWEv/YvYU9roUmn4OpBoHgc//S6/N0LcENOsRhXfVxtEXcT5ZapoK++r
	6XuMKzt8gMphJQuCMD/bGfi3m9SY/rumGq1T8AkDS936YCtyvzd5HZhy/6SL2nriD/h1rJFXWU7
	f09ke0mPpz4QUFLfVkoOqnY/BYx4qMPa5uJVfwBdi4hH5HjdpmcgqWAkwL6SyPkdIs56MbpT4bC
	LxUDvADqL3Z7/Tp77rH0zodzzPgZ8y6nqwRavPN9x+2vjBTeiCw4xlNtD62/ZOWHNQ4Tn1znmL4
	bWuuLm9IoeXOgqDQ1tNlxQvCPBvtjfzpuKG2DeNFymD/BhY/C0MKkXgs1BttwwzVuyunWBkn+Q7
	W8a6g3igWoGoFQ5Na6fk9OLPBKQewQJSs8A+70qW3JTsdp
X-Received: by 2002:a17:907:1c98:b0:c41:b94c:4539 with SMTP id a640c23a62f3a-c506698cf92mr109978466b.6.1794385734830;
        Wed, 11 Nov 2026 00:28:54 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:53 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 6/7] hwmon: (nct6683) Name the fan headers of the ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:37 +0100
Message-ID: <20261111082838.1418051-7-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With fan control available, users need to know which pwm channel drives
which header. The driver has no fan labels.

Add a fanN_label attribute, visible on boards with a name table, and name
the channels of the ASRock B850 Steel Legend WiFi after the headers
printed on the board: CPU_FAN1, CPU_FAN2, AIO_PUMP and CHA_FAN1 to
CHA_FAN3. The order was inferred from the readings and the BIOS defaults.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst |  3 ++-
 drivers/hwmon/nct6683.c         | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index a9c53d6eab9c..c8b8ade3b95b 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -62,7 +62,8 @@ customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
 by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
 
 On the ASRock B850 Steel Legend WiFi the temperature and voltage inputs
-are named after the H/W Monitor page of the BIOS setup.
+are named after the H/W Monitor page of the BIOS setup, and fanN_label
+names the fan header each channel is wired to.
 
 pwmN_enable selects the fan control mode:
 
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 4fcd0c74af44..dcad72d1ef97 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -354,6 +354,15 @@ static const struct nct6683_mon_desc asrock_b850sl_mon_desc[] = {
 	{ }
 };
 
+/*
+ * Fan headers as printed on the board, see the ASRock B850 Steel Legend WiFi
+ * User Manual, section 1.3 "Motherboard Layout", page 7, and section 2.12
+ * "Onboard Headers and Connectors", pages 44 to 46.
+ */
+static const char * const asrock_b850sl_fan_label[] = {
+	"CPU_FAN1", "CPU_FAN2", "AIO_PUMP", "CHA_FAN1", "CHA_FAN2", "CHA_FAN3",
+};
+
 /* ------------------------------------------------------- */
 
 struct nct6683_data {
@@ -375,6 +384,8 @@ struct nct6683_data {
 
 	/* Board specific sensor names, NULL if none */
 	const struct nct6683_mon_desc *mon_desc;
+	const char * const *fan_label;
+	int num_fan_label;
 
 	struct mutex update_lock;	/* used to protect sensor updates */
 	bool valid;			/* true if following fields are valid */
@@ -822,17 +833,30 @@ show_fan_pulses(struct device *dev, struct device_attribute *attr, char *buf)
 		       ((data->fanin_cfg[sattr->index] >> 5) & 0x03) + 1);
 }
 
+static ssize_t
+show_fan_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", data->fan_label[sattr->index]);
+}
+
 static umode_t nct6683_fan_is_visible(struct kobject *kobj,
 				      struct attribute *attr, int index)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nct6683_data *data = dev_get_drvdata(dev);
-	int fan = index / 3;	/* fan index */
-	int nr = index % 3;	/* attribute index */
+	int fan = index / 4;	/* fan index */
+	int nr = index % 4;	/* attribute index */
 
 	if (!(data->have_fan & (1 << fan)))
 		return 0;
 
+	/* Fan names are only known for some boards */
+	if (nr == 3 && fan >= data->num_fan_label)
+		return 0;
+
 	/*
 	 * Intel may have minimum fan speed limits,
 	 * but register location and encoding are unknown.
@@ -846,6 +870,7 @@ static umode_t nct6683_fan_is_visible(struct kobject *kobj,
 SENSOR_TEMPLATE(fan_input, "fan%d_input", S_IRUGO, show_fan, NULL, 0);
 SENSOR_TEMPLATE(fan_pulses, "fan%d_pulses", S_IRUGO, show_fan_pulses, NULL, 0);
 SENSOR_TEMPLATE(fan_min, "fan%d_min", S_IRUGO, show_fan_min, NULL, 0);
+SENSOR_TEMPLATE(fan_label, "fan%d_label", 0444, show_fan_label, NULL, 0);
 
 /*
  * nct6683_fan_is_visible uses the index into the following array
@@ -856,6 +881,7 @@ static struct sensor_device_template *nct6683_attributes_fan_template[] = {
 	&sensor_dev_template_fan_input,
 	&sensor_dev_template_fan_pulses,
 	&sensor_dev_template_fan_min,
+	&sensor_dev_template_fan_label,
 	NULL
 };
 
@@ -1722,6 +1748,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK8:
 		data->mon_desc = asrock_b850sl_mon_desc;
+		data->fan_label = asrock_b850sl_fan_label;
+		data->num_fan_label = ARRAY_SIZE(asrock_b850sl_fan_label);
 		break;
 	default:
 		if (!force)
-- 
2.53.0

