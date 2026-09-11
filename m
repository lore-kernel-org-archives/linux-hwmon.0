Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101D4A6890;
	Fri, 11 Sep 2026 17:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147942; cv=none; b=Lsk8FStxS4X16LxEQBAVhE22aRuHODdu1cVudHLH/8BnICHzWt5EwIprmTZMkwiwcGY/iLsKejFAAhWp5Od18Ybbc8W9V3G33+BE4Bbo2AYMJ3gfEAHIEtWo8rDqqQReICloHbtm7eubImXQ7TJPx9f9T2ohPpYTVWuTvIZD/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147942; c=relaxed/simple;
	bh=nqZQ6HgpPGMLdbbHWgf8pHkk4HOYit/em4O+/WffXsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UxkUfTxUFC4OSPaMIlMLWJUu+SKzgkBaeFDI6IPN3Ski0s9KFBTqvYwCvrn6gVl8jFfOv6w26cZiIVHo/MRnoynVG4z6iiMWv8p9H8SZsSoCO19b/xpjlJc9/MygCMOwEbBwN4KEIHSpmKoEFi904s6m0nMIy+0fsnCf2abD4u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fSG0f5Vu; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fSG0f5Vu"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8AD501A01EF;
	Fri, 11 Sep 2026 17:32:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5F0F8601A3;
	Fri, 11 Sep 2026 17:32:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8193B11C7A23F;
	Fri, 11 Sep 2026 19:32:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789147928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WPF8nKOHQtZqFBh7PcvVMqe4vDwmoFnkGygQ4vj1l9I=;
	b=fSG0f5VuatTeNOrj0Dux7uZhcP29rHYV3iK6KkYXK0AL8FCKO8wSLbvfrxyzcZf5fqUGjH
	22n30OiB5HnndmTuFEe/5qGExDg1E74KIRpNHajor+aNn6l9ndAabgfpNIzp0yyG8Gce8n
	wQ/YogLGsNAJ2Lgm2gCq2w6fmtgSvM0l0pKWXHZtVzSjayhQSlpWPkrruKsl8EAnR170uB
	oUrNXSrttDDhmLQG0wR3VwxHv6tN8HWPMx+gt/6id/6awWDnYc0wEE6Dvb3Jen91ESzBej
	yzscGsStt3iRnXWMEDRnPPZx58Xx5TaK16Y+P0Hpaf3uLozFzjU64eC+4hXXgQ==
From: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>
Date: Fri, 11 Sep 2026 19:31:58 +0200
Subject: [PATCH v2 1/2] hwmon: (cgbc-hwmon): Fix current sensors ID lookup
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-1-0c6bf078d173@bootlin.com>
References: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
In-Reply-To: <20260911-cgbc-hwmon-fix-and-new-sensors-v2-0-0c6bf078d173@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: "Thomas Richard (congatec GmbH)" <thomas.richard@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Werner Gartner <Werner.Gartner@congatec.com>, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, stable@kernel.org
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

