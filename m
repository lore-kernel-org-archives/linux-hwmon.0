Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501A2429014
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 09:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787303991; cv=none; b=lePD1XJFbCB7op7SApRwxw7jtexuQD9vIOYf1g+yaowsvkhbCZNCnemaPQHoaZ4TohykquMqhILVi5sJCjg3qLv7GGnvDg0Cst5IBaJ1JktLM9x0LwV5SHRArkupZzCxfFzIrbyFjT4MNGD5u+IgZMNOiG2xzlF0sacyjRiwEzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787303991; c=relaxed/simple;
	bh=G/ZgrRWzaMfJE/ZIBZ/3JR7E2wBCujSE8gIQdvcFa98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ldzatqZZ/9piscOiBbqoUf0sVrLi1x+dwRs4D4kJY+cYI0hG0iYcNVpVGOFJB7HqMWl1UaYBLcTmBTLuxhB3MzDfg9kEpfHDQeX36OwVsOVUi7Sq1W6deoQeyCGRNvh5BHKV4qQHhqsand5rnfJalwzwNSWSKTv86c34w4syui4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b=bjbGkq54; arc=none smtp.client-ip=185.136.64.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alessandro.zini@siemens.com header.b="bjbGkq54"
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 202608210919358ea7dd176b000207ea
        for <linux-hwmon@vger.kernel.org>;
        Fri, 21 Aug 2026 11:19:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alessandro.zini@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=KTcHGzrqBpn9wM6QDuJ440qBt5kqvP8kTR8wiOFYPa8=;
 b=bjbGkq54mGzO6hoOmzHCF6au6F3X2nG1ccMNyNdsJ4r2PfJGa037TCpbKqaww1p5BnMl62
 VKVBwhGSj5n+lNIuUdWvGleXLmh/dEl9qRKCXt5+dCEuoGXniX8zmrVF8Q5Du+GXtSCNmUDD
 hgc1cFXi1y6JSUlnppeBD7upQl4q1axPn5yLeFtUV9fRj1L9yTHwisEaivJ+OlVHUGNmqM8a
 +WL1a9cs4clQr8qS7oQNjQDVWjdCGkLDvIfTTTWAOX+kpNm4+JV37Z9mH4JrXk5qSW0kgQHe
 lNO8ECY4sbQcaMMC9P2y1Mhv2EbwsJRJCtAbMukPYBpltpHYdT81N+RQ==;
From: Alessandro Zini <alessandro.zini@siemens.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alessandro Zini <alessandro.zini@siemens.com>
Subject: [PATCH v2 2/2] hwmon: (sht4x): Add support for Sensirion STS4x temperature sensors
Date: Fri, 21 Aug 2026 11:19:24 +0200
Message-ID: <20260821091924.18975-3-alessandro.zini@siemens.com>
In-Reply-To: <20260821091924.18975-1-alessandro.zini@siemens.com>
References: <20260821091924.18975-1-alessandro.zini@siemens.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1327013:519-21489:flowmailer

The Sensirion STS4x series is the temperature-only variant of the
SHT4x family. It shares the same I2C command set, conversion formulas,
CRC checksum, and timing with the SHT4x, but only returns temperature
data (3 bytes: 2 data bytes + 1 CRC byte).

Add support for the STS4x series by dynamically adjusting the read
response length, suppressing humidity channel attributes when probed
as STS4x, and omitting heater sysfs attributes.

Link: https://sensirion.com/resource/datasheet/sts4x
Signed-off-by: Alessandro Zini <alessandro.zini@siemens.com>
---
Changes in v2:
- Unconditionally initialize data->heating_complete in probe to avoid
  an msleep delay on boot with INITIAL_JIFFIES.
- Bypass heater delay checks in sht4x_read_values() when chip is sts4x.

 Documentation/hwmon/sht4x.rst | 17 ++++++++--
 drivers/hwmon/sht4x.c         | 62 +++++++++++++++++++++++++----------
 2 files changed, 59 insertions(+), 20 deletions(-)

diff --git a/Documentation/hwmon/sht4x.rst b/Documentation/hwmon/sht4x.rst
index ba094ad0e2816..b9564632a1be2 100644
--- a/Documentation/hwmon/sht4x.rst
+++ b/Documentation/hwmon/sht4x.rst
@@ -15,6 +15,16 @@ Supported Chips:
 
       English: https://www.sensirion.com/fileadmin/user_upload/customers/sensirion/Dokumente/2_Humidity_Sensors/Datasheets/Sensirion_Humidity_Sensors_SHT4x_Datasheet.pdf
 
+  * Sensirion STS4X
+
+    Prefix: 'sts4x'
+
+    Addresses scanned: None
+
+    Datasheet:
+
+      English: https://sensirion.com/resource/datasheet/sts4x
+
 Author: Navin Sankar Velliangiri <navin@linumiz.com>
 
 
@@ -22,9 +32,10 @@ Description
 -----------
 
 This driver implements support for the Sensirion SHT4x chip, a humidity
-and temperature sensor. Temperature is measured in degree celsius, relative
-humidity is expressed as a percentage. In sysfs interface, all values are
-scaled by 1000, i.e. the value for 31.5 degrees celsius is 31500.
+and temperature sensor, and the Sensirion STS4x chip, a temperature sensor.
+Temperature is measured in degree celsius, relative humidity is expressed as a
+percentage (on SHT4x only). In sysfs interface, all values are scaled by 1000,
+i.e. the value for 31.5 degrees celsius is 31500.
 
 Usage Notes
 -----------
diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 9cace0e8acdab..daca24cfbcd52 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -43,6 +43,7 @@
 #define SHT4X_CRC8_LEN		1
 #define SHT4X_WORD_LEN		2
 #define SHT4X_RESPONSE_LENGTH	6
+#define STS4X_RESPONSE_LENGTH	3
 #define SHT4X_CRC8_POLYNOMIAL	0x31
 #define SHT4X_CRC8_INIT		0xff
 #define SHT4X_MIN_TEMPERATURE	-45000
@@ -52,9 +53,15 @@
 
 DECLARE_CRC8_TABLE(sht4x_crc8_table);
 
+enum sht4x_chips {
+	sht4x,
+	sts4x,
+};
+
 /**
  * struct sht4x_data - All the data required to operate an SHT4X chip
  * @client: the i2c client associated with the SHT4X
+ * @chip_id: the chip type (sht4x or sts4x)
  * @heating_complete: the time that the last heating finished
  * @data_pending: true if and only if there are measurements to retrieve after heating
  * @heater_power: the power at which the heater will be started
@@ -67,6 +74,7 @@ DECLARE_CRC8_TABLE(sht4x_crc8_table);
  */
 struct sht4x_data {
 	struct i2c_client	*client;
+	enum sht4x_chips	chip_id;
 	unsigned long		heating_complete;	/* in jiffies */
 	bool			data_pending;
 	u32			heater_power;	/* in milli-watts */
@@ -92,11 +100,15 @@ static int sht4x_read_values(struct sht4x_data *data)
 	u8 crc;
 	u8 cmd[SHT4X_CMD_LEN] = {SHT4X_CMD_MEASURE_HPM};
 	u8 raw_data[SHT4X_RESPONSE_LENGTH];
+	size_t response_length = data->chip_id == sts4x ?
+				 STS4X_RESPONSE_LENGTH : SHT4X_RESPONSE_LENGTH;
 	unsigned long curr_jiffies;
 
-	curr_jiffies = jiffies;
-	if (time_before(curr_jiffies, data->heating_complete))
-		msleep(jiffies_to_msecs(data->heating_complete - curr_jiffies));
+	if (data->chip_id != sts4x) {
+		curr_jiffies = jiffies;
+		if (time_before(curr_jiffies, data->heating_complete))
+			msleep(jiffies_to_msecs(data->heating_complete - curr_jiffies));
+	}
 
 	if (data->data_pending &&
 	    time_before(jiffies, data->heating_complete + data->update_interval)) {
@@ -115,15 +127,14 @@ static int sht4x_read_values(struct sht4x_data *data)
 		usleep_range(SHT4X_MEAS_DELAY_HPM, SHT4X_MEAS_DELAY_HPM + SHT4X_DELAY_EXTRA);
 	}
 
-	ret = i2c_master_recv(client, raw_data, SHT4X_RESPONSE_LENGTH);
-	if (ret != SHT4X_RESPONSE_LENGTH) {
+	ret = i2c_master_recv(client, raw_data, response_length);
+	if (ret != response_length) {
 		if (ret >= 0)
 			ret = -ENODATA;
 		return ret;
 	}
 
 	t_ticks = raw_data[0] << 8 | raw_data[1];
-	rh_ticks = raw_data[3] << 8 | raw_data[4];
 
 	crc = crc8(sht4x_crc8_table, &raw_data[0], SHT4X_WORD_LEN, CRC8_INIT_VALUE);
 	if (crc != raw_data[2]) {
@@ -131,14 +142,19 @@ static int sht4x_read_values(struct sht4x_data *data)
 		return -EIO;
 	}
 
-	crc = crc8(sht4x_crc8_table, &raw_data[3], SHT4X_WORD_LEN, CRC8_INIT_VALUE);
-	if (crc != raw_data[5]) {
-		dev_err(&client->dev, "data integrity check failed\n");
-		return -EIO;
+	data->temperature = ((21875 * (int32_t)t_ticks) >> 13) - 45000;
+
+	if (data->chip_id != sts4x) {
+		rh_ticks = raw_data[3] << 8 | raw_data[4];
+		crc = crc8(sht4x_crc8_table, &raw_data[3], SHT4X_WORD_LEN, CRC8_INIT_VALUE);
+		if (crc != raw_data[5]) {
+			dev_err(&client->dev, "data integrity check failed\n");
+			return -EIO;
+		}
+
+		data->humidity = ((15625 * (int32_t)rh_ticks) >> 13) - 6000;
 	}
 
-	data->temperature = ((21875 * (int32_t)t_ticks) >> 13) - 45000;
-	data->humidity = ((15625 * (int32_t)rh_ticks) >> 13) - 6000;
 	data->last_updated = jiffies;
 	data->valid = true;
 	return 0;
@@ -190,9 +206,14 @@ static umode_t sht4x_hwmon_visible(const void *data,
 				   enum hwmon_sensor_types type,
 				   u32 attr, int channel)
 {
+	const struct sht4x_data *chip_data = data;
+
 	switch (type) {
 	case hwmon_temp:
+		return 0444;
 	case hwmon_humidity:
+		if (chip_data->chip_id == sts4x)
+			return 0;
 		return 0444;
 	case hwmon_chip:
 		return 0644;
@@ -382,6 +403,7 @@ static const struct hwmon_chip_info sht4x_chip_info = {
 
 static int sht4x_probe(struct i2c_client *client)
 {
+	const struct attribute_group **groups = NULL;
 	struct device *device = &client->dev;
 	struct device *hwmon_dev;
 	struct sht4x_data *data;
@@ -400,11 +422,15 @@ static int sht4x_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	data->chip_id = (uintptr_t)i2c_get_match_data(client);
 	data->update_interval = SHT4X_MIN_POLL_INTERVAL;
 	data->client = client;
-	data->heater_power = 200;
-	data->heater_time = 1000;
 	data->heating_complete = jiffies;
+	if (data->chip_id != sts4x) {
+		data->heater_power = 200;
+		data->heater_time = 1000;
+		groups = sht4x_groups;
+	}
 
 	crc8_populate_msb(sht4x_crc8_table, SHT4X_CRC8_POLYNOMIAL);
 
@@ -418,19 +444,21 @@ static int sht4x_probe(struct i2c_client *client)
 							 client->name,
 							 data,
 							 &sht4x_chip_info,
-							 sht4x_groups);
+							 groups);
 
 	return PTR_ERR_OR_ZERO(hwmon_dev);
 }
 
 static const struct i2c_device_id sht4x_id[] = {
-	{ .name = "sht4x" },
+	{ .name = "sht4x", .driver_data = sht4x },
+	{ .name = "sts4x", .driver_data = sts4x },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sht4x_id);
 
 static const struct of_device_id sht4x_of_match[] = {
-	{ .compatible = "sensirion,sht4x" },
+	{ .compatible = "sensirion,sht4x", .data = (void *)sht4x },
+	{ .compatible = "sensirion,sts40", .data = (void *)sts4x },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sht4x_of_match);
-- 
2.55.0

