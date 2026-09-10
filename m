Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AD348F03C;
	Thu, 10 Sep 2026 13:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047533; cv=none; b=bzCYlykab7JMiRVKP1HwyyVS5l9HQzVHrMoQfpEsvziZvWzEXXB+ThhY3aL8T+eX4qoYzy6wX2nh2m340+6fJY8wAgKvAKMceFs1iZhmuncIH1NqwotOfn0w2PgrjaV+s6BrmrswTFq2EEXe8nVYIWGRYJoPejYowZ/nH+e17QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047533; c=relaxed/simple;
	bh=nqZQ6HgpPGMLdbbHWgf8pHkk4HOYit/em4O+/WffXsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mQm+lx6fi3QO8sRWynNOaEhlZfkLhvy6yzsWZyDa3ceIGN1ExqXpjcUQOAAHDOOobTZmV47AggEKgR4BYdNTcM/MRhWWkHZOgnVmZjscoWfcLN/jn5/0HL4u6PzTMpV589Fl2C9DV/s3ODTVVWhW+GzNsUXj3L4DECtuPOBx71E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aRyOONBC; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aRyOONBC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 557EFC653E5;
	Thu, 10 Sep 2026 13:29:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F35CE5FA2F;
	Thu, 10 Sep 2026 13:28:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7FB4511C78654;
	Thu, 10 Sep 2026 15:28:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789046919; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WPF8nKOHQtZqFBh7PcvVMqe4vDwmoFnkGygQ4vj1l9I=;
	b=aRyOONBCHs1ydfPvu+XjN8wTW5/Zrd988hT7ovKrnfvpImnstvdqrToJy8K7wyLNiENoui
	Kcr097gp+AO3Lee2IjimL+dEuNwlEawDON9lhZsnXi48Uf73QaidbRyriqFs5Glmr2lLOl
	Mk3hHH/bPlYUlLf/vB5lnwbijIUu8vnkaJMcSq7SPb6lMnmTzDZH7kdQSLF7g+vm8hOIuA
	n56ZwrYwvl63WddtSOx/HYifM98k07WMgga8XmFbJMN7J9TtycDtJAW6bEiL5lJasLU1xy
	34eAqa20o3NAtmcsF7B9EFN1Q2/6xLff0hKD3nH7exG8Qh6J3B0cu+AsxFzBaQ==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Thu, 10 Sep 2026 15:28:21 +0200
Subject: [PATCH 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-1-ef13ae2fa147@bootlin.com>
References: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
In-Reply-To: <20260910-cgbc-hwmon-fix-and-new-sensors-v1-0-ef13ae2fa147@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 stable@kernel.org
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

Current sensors on the Congatec Board Controller don't use consecutive IDs,
unlike other sensor types (voltage, temperature, fan). The driver assumed
consecutive IDs and performed a simple lookup, which caused an unknown
sensor warning. Define current sensor IDs explicitly.

Changes the warning on conga-SA7 (type and channel are correct now).
Before:
  Board Controller returned an unknown sensor (type=2, channel=17), ignore it
After:
  Board Controller returned an unknown sensor (bc_type=1, bc_id=11), ignore it

Cc: stable@kernel.org
Fixes: 08ebc9def79f ("hwmon: Add Congatec Board Controller monitoring driver")
Signed-off-by: Thomas Richard (congatec GmbH) <thomas.richard@bootlin.com>
---
 drivers/hwmon/cgbc-hwmon.c | 93 +++++++++++++++++++++++++++-------------------
 1 file changed, 54 insertions(+), 39 deletions(-)

diff --git a/drivers/hwmon/cgbc-hwmon.c b/drivers/hwmon/cgbc-hwmon.c
index 3aff4e092132..2effa0b56286 100644
--- a/drivers/hwmon/cgbc-hwmon.c
+++ b/drivers/hwmon/cgbc-hwmon.c
@@ -52,31 +52,36 @@ static const char * const cgbc_hwmon_labels_temp[] = {
 	"BOTTOMDIM Temperature",
 };
 
+static const char * const cgbc_hwmon_labels_in[] = {
+	"CPU Voltage",
+	"DC Runtime Voltage",
+	"DC Standby Voltage",
+	"CMOS Battery Voltage",
+	"Battery Voltage",
+	"AC Voltage",
+	"Other Voltage",
+	"5V Voltage",
+	"5V Standby Voltage",
+	"3V3 Voltage",
+	"3V3 Standby Voltage",
+	"VCore A Voltage",
+	"VCore B Voltage",
+	"12V Voltage",
+};
+
+/*
+ * Current sensors are a bit special, they don't have consecutive IDs like
+ * other types of sensors. So they need to be defined explicitly.
+ */
 static const struct {
-	enum hwmon_sensor_types type;
 	const char *label;
-} cgbc_hwmon_labels_in[] = {
-	{ hwmon_in, "CPU Voltage" },
-	{ hwmon_in, "DC Runtime Voltage" },
-	{ hwmon_in, "DC Standby Voltage" },
-	{ hwmon_in, "CMOS Battery Voltage" },
-	{ hwmon_in, "Battery Voltage" },
-	{ hwmon_in, "AC Voltage" },
-	{ hwmon_in, "Other Voltage" },
-	{ hwmon_in, "5V Voltage" },
-	{ hwmon_in, "5V Standby Voltage" },
-	{ hwmon_in, "3V3 Voltage" },
-	{ hwmon_in, "3V3 Standby Voltage" },
-	{ hwmon_in, "VCore A Voltage" },
-	{ hwmon_in, "VCore B Voltage" },
-	{ hwmon_in, "12V Voltage" },
-	{ hwmon_curr, "DC Current" },
-	{ hwmon_curr, "5V Current" },
-	{ hwmon_curr, "12V Current" },
+	int id;
+} cgbc_hwmon_labels_curr[] = {
+	{ "DC Current", 0x12 },
+	{ "5V Current", 0x18 },
+	{ "12V Current", 0x1E },
 };
 
-#define CGBC_HWMON_NB_IN_SENSORS	14
-
 static const char * const cgbc_hwmon_labels_fan[] = {
 	"CPU Fan",
 	"Box Fan",
@@ -114,7 +119,8 @@ static int cgbc_hwmon_probe_sensors(struct device *dev, struct cgbc_hwmon_data *
 
 	for (i = 0; i < nb_sensors; i++) {
 		enum cgbc_sensor_types type;
-		unsigned int channel;
+		unsigned int channel, id;
+		int j;
 
 		/*
 		 * No need to request data for the first sensor.
@@ -128,32 +134,49 @@ static int cgbc_hwmon_probe_sensors(struct device *dev, struct cgbc_hwmon_data *
 		}
 
 		type = FIELD_GET(CGBC_HWMON_TYPE_MASK, data[1]);
-		channel = FIELD_GET(CGBC_HWMON_ID_MASK, data[1]) - 1;
+		id = FIELD_GET(CGBC_HWMON_ID_MASK, data[1]);
+		channel = id - 1;
 
 		if (type == CGBC_HWMON_TYPE_TEMP && channel < ARRAY_SIZE(cgbc_hwmon_labels_temp)) {
 			sensor->type = hwmon_temp;
 			sensor->label = cgbc_hwmon_labels_temp[channel];
-		} else if (type == CGBC_HWMON_TYPE_IN &&
-			   channel < ARRAY_SIZE(cgbc_hwmon_labels_in)) {
+		} else if (type == CGBC_HWMON_TYPE_IN) {
 			/*
 			 * The Board Controller doesn't differentiate current and voltage sensors.
-			 * Get the sensor type from cgbc_hwmon_labels_in[channel].type instead.
+			 * First check if it is a current sensor.
 			 */
-			sensor->type = cgbc_hwmon_labels_in[channel].type;
-			sensor->label = cgbc_hwmon_labels_in[channel].label;
+			for (j = 0; j < ARRAY_SIZE(cgbc_hwmon_labels_curr); j++) {
+				if (id == cgbc_hwmon_labels_curr[j].id) {
+					sensor->type = hwmon_curr;
+					sensor->label = cgbc_hwmon_labels_curr[j].label;
+					channel = j;
+				}
+			}
+
+			/* If it's not a current sensor, it may be a voltage sensor. */
+			if (!sensor->label && channel < ARRAY_SIZE(cgbc_hwmon_labels_in)) {
+				sensor->type = hwmon_in;
+				sensor->label = cgbc_hwmon_labels_in[channel];
+			}
 		} else if (type == CGBC_HWMON_TYPE_FAN &&
 			   channel < ARRAY_SIZE(cgbc_hwmon_labels_fan)) {
 			sensor->type = hwmon_fan;
 			sensor->label = cgbc_hwmon_labels_fan[channel];
-		} else {
-			dev_warn(dev, "Board Controller returned an unknown sensor (type=%d, channel=%d), ignore it",
-				 type, channel);
+		}
+
+		if (!sensor->label) {
+			dev_warn(dev, "Board Controller returned an unknown sensor (bc_type=%d, bc_id=%d), ignore it",
+				 type, id);
 			continue;
 		}
 
 		sensor->active = FIELD_GET(CGBC_HWMON_ACTIVE_BIT, data[1]);
 		sensor->channel = channel;
 		sensor->index = i;
+
+		dev_dbg(dev, "Found sensor: bc_type=%d, bc_id=%d, hwmon_type=%d, hwmon_channel=%d, hwmon_label='%s', active=%d\n",
+			type, id, sensor->type, sensor->channel, sensor->label, sensor->active);
+
 		sensor++;
 		hwmon->nb_sensors++;
 	}
@@ -167,14 +190,6 @@ static struct cgbc_hwmon_sensor *cgbc_hwmon_find_sensor(struct cgbc_hwmon_data *
 	struct cgbc_hwmon_sensor *sensor = NULL;
 	int i;
 
-	/*
-	 * The Board Controller doesn't differentiate current and voltage sensors.
-	 * The channel value (from the Board Controller point of view) shall be computed for current
-	 * sensors.
-	 */
-	if (type == hwmon_curr)
-		channel += CGBC_HWMON_NB_IN_SENSORS;
-
 	for (i = 0; i < hwmon->nb_sensors; i++) {
 		if (hwmon->sensors[i].type == type && hwmon->sensors[i].channel == channel) {
 			sensor = &hwmon->sensors[i];

-- 
2.53.0

