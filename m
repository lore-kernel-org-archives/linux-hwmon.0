Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385735;
	b=YzQT2OtMiaualbifL/2xX7saRDqXvTOY0nXkwiSY1dux9JflXDDwhcVlAGbjVF6+Bw3O
	 8rAKEn8bV8LRIqSIpAEfaDVqn6wGDEvzjeOmSImDLy/tlMN+gA6twINRadrj1DCeKeT20
	 /wQNZ0+rvS6OxmZExJ+UYDNEtzdK59bIiBuRbqvr3x2SX44ca0Yfo4NIiOTFXaqmsmHqZ
	 7WraJ2TGwKDdsWVV5iXoAYMpgcoanBD6D00Ns3sWetCPIK3qyckBxns7EgKozzUsD0Xg2
	 iHM+Io4kms8TcL+j4/afImJtsTI/pUOVfkXSl2iPyHPhNiKnk0dtMJGQxoo5RAqX3ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0zjrMDCsix0aAiNQniM/4VRbTdAtzW65xW7ZbvxaTg8=;
	b=TGyljKf3iLqz7Z76lgOzJKUcXlYUbtW8YkIkGc4vnt9EXbGvfbCVuwfLL0oQnwgmlD9z
	 BqwOC2iCboTp21K5per+dt1tGtwvkx8u3fhI/aQWhAfeyP4BugDDi94V/6PRYkRO0r4dL
	 daXQH2xVrP/Uc0L8e6uqNuwEp+7HBcjqiofWCQzm/qSfAWotJXGH8K6RsPQ+vaPp29IKp
	 tvkNk11pHt2Kc77hwNnWuswS47zF4l3m8OCNv4acE9zIMgobSyEP1MSt5yx4ye2fg4Hpc
	 bR+fPfcv/gkjyoYgY2ccv+UynvbIUQY8OM7+lZcf2QTl9Sz2zACQeaeYkHW1pdnynxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xeGNfyct;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A484C60A263F
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A484C60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xeGNfyct
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d58c50743so249938066b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385733; x=1794990533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zjrMDCsix0aAiNQniM/4VRbTdAtzW65xW7ZbvxaTg8=;
        b=xeGNfyct31giWRhpo1R+c0HZGs1yv5fNLVyO9k9SJyvzG133EG4ucYimYEE+V2SNpM
         y0R5+s2/1z1EPACkR1ElDYSyAAnvsF9Vy2bfRfPEJ/EfSQXI6aUaff9LKcrflFThuv2d
         tbLDttM4qMW6oH3ZsOjpEgVs3+B58YXQ0ASNFHSZ3JgCnMLRw0kOx8gGzDW8KLopXmpo
         5O35i03L6bnHlZftJWilAjDvXlq0RRYiVwaeWo1Jo2pCqYf0N1jOpyxlhRAXAXCH+yid
         B6Rh5Z7zxy1DUgiAwUAmn18Dg4Xg+45rvoYgWAs80Uc2f+SQ0wPfZf9nWGB6nKZjE5U/
         wEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385733; x=1794990533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zjrMDCsix0aAiNQniM/4VRbTdAtzW65xW7ZbvxaTg8=;
        b=bRMyF2JWOCIsjwItmYeC2Wh2MPEnAcRDzBpNBGf7wi2OcfpCCUDJbu4xRzaK0LltXE
         Z2tOkaiQt8ZnjqJhd9HCl5RX3zYo1/eXyKvySpO+ontl8xp1vaG24HFKDqeabSFCvxqt
         /VWsuU1u7F3U6nHtUM/oKCn6f1tFQOgAz8IdxXoJlHrZ9fbevohlDpPpL/fQ3p7A1dHY
         +B4suTLCQW0bWenFeE27K7ipqeqG6OOSQTF4K4gp435E8E5taPStZ7rHPHXuLf3yiQFD
         b9DxuWfs/pPxBdft8hpnL6iI1vFxrX+AlWBbE0ETcp8G4V3k0zHrRAtfvLQrIqE5l36K
         GbXQ==
X-Gm-Message-State: APuU4Z+P2e5D7f8YmTWgjAy8BB9GTEjoLlwY3MOWmF8IBbBRJsLzFmPv
	N9Di1q3Wx2cW/S1Xgc5IpeOfPiOqW78XP28G8T3ZIVU+vefgjUZYcJeq
X-Gm-Gg: AYBFou0ur9pNPsGuNTwim/dHa+OY9xvBS/XQWoPm4GKalswt7wBbpGik9zbjDCos4zu
	a0NfeGCxRpaLZUlUYRQAn+kZxnD7NEEP0KlLAntWHvXgYTZOR3b6fv2tmAO3v4Xns3mAwsnyg+l
	7WIZuDYcBES2s8Y+cFYOvkU5PYvMFTLODnbdPT2lYHLQ2MFQR9pb3fgX+IJTqqeWscud0FwlYVB
	h9s+JyzxiIrVGGv5z+vKlgHWXAuU3A59IMfIisw2JDP7dzKxl2nGk+sNunFDTEpUGzMNhRpQ/o5
	ZkLRRRj+SE04F+PUE43/huuGgptA9eKmDjKZLE35qlsv6uXjjp/sjU/YLXlXUkzk64Z3+3EH1VA
	HOAvDT1iwdGQ4gRb4B4sDOJqIHViKkOHDyhci+GhlzoBbfQHlt/CAcoS6HaGIF8Ietkwzda1YDR
	pck28PF8Nw9quaFoasQ6Gk2y0Lpz8lu0iYEJ4qSdygf25N9DiETB0mOQAZnzi3WYFwt+E489N1/
	pjvfrH7/5ZO9xkrSBlYG30s0a5jEmPJXA29WfEcLwVnymYxBBQfdRO6Q4n9biKSd6Qv0JuYV9pB
	QD0Cl/ZGvDB8q7uEdzqt/l4pw99/YC7sFtuNybV+htlDwy965RdXnopL0bhTwcvQapWY/YUZKxH
	uRWY29qhSUH8FWR6ABywdZlDvElVXVoPW1Ta9grtTHh6cfC5fZgoyhNKjVPcmdD8etq33aEa/BI
	4PZbTN1YJrfk2hg5hD6p1Sx5y/1rzlZXcQUzfTeVZ6dwr47g==
X-Received: by 2002:a17:907:7b8b:b0:c49:df71:14f5 with SMTP id a640c23a62f3a-c5066c8368dmr126416666b.31.1794385732947;
        Wed, 11 Nov 2026 00:28:52 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:52 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 5/7] hwmon: (nct6683) Name the sensors of the ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:36 +0100
Message-ID: <20261111082838.1418051-6-jdahlin@gmail.com>
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

The inputs are labeled after the monitoring source of the EC, such as
"Thermistor 14" or "VIN5", which says nothing about what they measure.
The UEFI setup of this board names them on its H/W Monitor page.

Add a per-board table of sensor names keyed on the monitoring source and
fill it in for the ASRock B850 Steel Legend WiFi. Sources without an
entry keep their generic name.

The CPU temperature matches k10temp and the voltages match their nominal
values. Which thermistor is the M/B one was inferred from the readings.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst |  3 ++
 drivers/hwmon/nct6683.c         | 53 +++++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 8e5cd1d7dcd2..a9c53d6eab9c 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -61,6 +61,9 @@ It is also supported on the ASRock B850 Steel Legend WiFi (NCT6686D,
 customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
 by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
 
+On the ASRock B850 Steel Legend WiFi the temperature and voltage inputs
+are named after the H/W Monitor page of the BIOS setup.
+
 pwmN_enable selects the fan control mode:
 
   * 1: manual mode, the duty cycle is set with pwmN
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index f656b84ee8ac..4fcd0c74af44 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -328,6 +328,32 @@ static const char *const nct6683_mon_label[] = {
 #define NUM_MON_LABELS		ARRAY_SIZE(nct6683_mon_label)
 #define MON_VOLTAGE_START	0x60
 
+/* Board specific names for the monitoring sources */
+struct nct6683_mon_desc {
+	u8 src;			/* index into nct6683_mon_label */
+	const char *label;
+};
+
+/*
+ * ASRock B850 Steel Legend WiFi, named after the "H/W Monitor" page of the
+ * UEFI setup (BIOS 4.10). T_SENSOR1 is the thermistor cable header, see the
+ * ASRock B850 Steel Legend WiFi User Manual, section 2.12 "Onboard Headers
+ * and Connectors", page 49.
+ */
+static const struct nct6683_mon_desc asrock_b850sl_mon_desc[] = {
+	{ 0x08, "M/B" },		/* Thermistor 14 */
+	{ 0x0a, "T_SENSOR1" },		/* Thermistor 16 */
+	{ 0x46, "CPU" },		/* AMD TSI Addr 98h */
+	{ 0x60, "+3.3V" },		/* VCC */
+	{ 0x66, "CPU Vcore" },		/* VIN0 */
+	{ 0x69, "+5V" },		/* VIN3 */
+	{ 0x6b, "VDDCR_SOC" },		/* VIN5 */
+	{ 0x6c, "VDD_MISC" },		/* VIN6 */
+	{ 0x6d, "DRAM" },		/* VIN7 */
+	{ 0x76, "+12V" },		/* VIN16 */
+	{ }
+};
+
 /* ------------------------------------------------------- */
 
 struct nct6683_data {
@@ -347,6 +373,9 @@ struct nct6683_data {
 	u8 in_index[NCT6683_NUM_REG_MON];
 	u8 in_src[NCT6683_NUM_REG_MON];
 
+	/* Board specific sensor names, NULL if none */
+	const struct nct6683_mon_desc *mon_desc;
+
 	struct mutex update_lock;	/* used to protect sensor updates */
 	bool valid;			/* true if following fields are valid */
 	u64 last_updated;		/* In jiffies */
@@ -524,6 +553,25 @@ static inline long in_from_reg(u8 reg)
 	return reg * 16;
 }
 
+static const struct nct6683_mon_desc *
+nct6683_find_mon_desc(struct nct6683_data *data, u8 src)
+{
+	const struct nct6683_mon_desc *desc;
+
+	for (desc = data->mon_desc; desc && desc->label; desc++)
+		if (desc->src == src)
+			return desc;
+
+	return NULL;
+}
+
+static const char *nct6683_mon_name(struct nct6683_data *data, u8 src)
+{
+	const struct nct6683_mon_desc *desc = nct6683_find_mon_desc(data, src);
+
+	return desc ? desc->label : nct6683_mon_label[src];
+}
+
 static u16 nct6683_read(struct nct6683_data *data, u16 reg)
 {
 	int res;
@@ -694,7 +742,7 @@ show_in_label(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6683_data *data = nct6683_update_device(dev);
 	int nr = sattr->index;
 
-	return sprintf(buf, "%s\n", nct6683_mon_label[data->in_src[nr]]);
+	return sprintf(buf, "%s\n", nct6683_mon_name(data, data->in_src[nr]));
 }
 
 static ssize_t
@@ -824,7 +872,7 @@ show_temp_label(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6683_data *data = nct6683_update_device(dev);
 	int nr = sattr->index;
 
-	return sprintf(buf, "%s\n", nct6683_mon_label[data->temp_src[nr]]);
+	return sprintf(buf, "%s\n", nct6683_mon_name(data, data->temp_src[nr]));
 }
 
 static ssize_t
@@ -1673,6 +1721,7 @@ static int nct6683_probe(struct platform_device *pdev)
 	case NCT6683_CUSTOMER_ID_ASROCK7:
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK8:
+		data->mon_desc = asrock_b850sl_mon_desc;
 		break;
 	default:
 		if (!force)
-- 
2.53.0

