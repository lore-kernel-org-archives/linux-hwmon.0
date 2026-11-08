Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794096098;
	b=uQ68gqWJMCX48p8AvknbvxrwgajNU6X2htysnqiCDlnGz2LtAOIHM/ZE9Hz9/NvaoEqF
	 AbEzjssr7+81Ux/TMWWRvHlwGr1pZVVbSkJPJLRzmQtLWuuiR6acb7HdyUp/cevHsdGmQ
	 WkYkf7vP8Yo7IGhzKxtLHTKFd9qUJf0sX5/ILJsVXcnEw6BkJw6YDsnz7IsL7SZdJvCFQ
	 /2IHFYkgCRVCY5+UCgOg08O/+hAIoShjfVJTQckCMRzA92JMcsHqokQS8Q/3vf26Cty94
	 qvSGCVUT7dEu3GDYLEpWM4SnuaIgJxXSuu2EIkCPJ0WspnbeVTWKh380jNwg/bJfptQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096098;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=E+rNTovObuxsXOatoBBGvObzRmO0b6Gn5ReQ8KO//24=;
	b=jMpdsbKoxXBJaq7nGID1GnI0sU7LMAJesubMBisNPxEXsKgyGqlpKk4EwaiDdknpdzO7
	 eZH89Lu+TKK8I7Sp//ZnjGnguhLnjF6X9ztcYTJXF6TQ6gSNsm8x6Qg3bJhfwv1LtPirS
	 OEe/9WOwT1r3fzdO43aJg3I0Xvp6pmfkSkgqJ2476zH7Ue5IKJWp/jl6SWWe+c+5CgbmT
	 6hj8y7nRwYMiQej9dr6vTyQ63Wnimwsb5CMAx2VwrHnYB2I6bNoEwU7anKcaNQaC1mUS6
	 N01RxEYrmisGmJUQnfW0BZqb8cnUz9D7nfKuqezhTEnoB/I1gKPJHqKWJKqNwc/7hwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4pvDs48G;
	arc=none smtp.remote-ip=35.89.44.37
Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED46606A32E
	for <linux-hwmon@vger.kernel.org>; Sun,  8 Nov 2026 00:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED46606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4pvDs48G
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id PpOExmWrNVK9UPqLpxhzSl; Sun, 08 Nov 2026 00:01:37 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id PqLoxxd3MlaNKPqLpx2sLV; Sun, 08 Nov 2026 00:01:37 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6aefbbe1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=_jlGtV7tAAAA:8 a=Ot6sBdcoJR7jPCglKegA:9
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=E+rNTovObuxsXOatoBBGvObzRmO0b6Gn5ReQ8KO//24=; b=4pvDs48GaTBq
	U4MRohwhS4FIqGfcOquR8wlxD/E1x8qP+wQx0JCRaQGlI/oh7giXLh8mpmOBqMUZWZFsA+opVQ2fq
	v/xxYSEvuXfQZK6n7UX/kHkFDO/C5u6Yn+G01ECY4nPAQEGvYxq4hq2hLMzkw3AcR7dgzpsXO0B2C
	38iDLV5Lh6fo+pq1f+KshGpJqbag0qR7y/p/hCv5WSp+707XSTxWtUckHpaKjKUlR500lbYx380Ge
	1oYHFTJdA3ZIOBia8ZJpk3aRXEGNLWVbj05LZOND7+/Dy3sypCpSLZa+2gDb7OCgiQqZIbMGsetcR
	yPQAmKIpJyJ8xRgwmiooGA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:34100 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xPqLo-00000004E3F-2Srf;
	Sun, 08 Nov 2026 05:31:36 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Tomasz Bojanowski <tomasz@bojanowski.me>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 4/4] hwmon: (msi_mystic_light) Add support for additional boards
Date: Sat,  7 Nov 2026 16:01:31 -0800
Message-ID: <20261108000131.1249664-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261108000131.1249664-1-linux@roeck-us.net>
References: <20261108000131.1249664-1-linux@roeck-us.net>
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
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xPqLo-00000004E3F-2Srf
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:34100
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfB7dh2ihehGx4sQvZaH+VD9EKvXlnHy+znSjsXScLketNW20h9J0NCKP6pl4FzRZl5194d7Pk7/Xi0knneWX7uVoVfunPda6WZ8A9d0+ECUF2D1Y4MKo
 GEY0ouuRc7RELlFFhQJlVZImjJsBmEVRVRUS83HVjBYHhZ7rGf7MEGNQxENIjHb+Wa2GA0Dh4feUiTY8+HcrFh21TI78H2Ze3xRFD2IJawisBEx/sSvN+XLZ

Add voltage monitoring support for three MSI 500- and 600-series
motherboards using USB vendor ID 0x1462:

  - MAG B550M MORTAR MAX WIFI (MS-7C94, USB ID 1462:7c94):
    CPU VDDP, PROM Core
  - MAG B650 TOMAHAWK WIFI (MS-7D75, USB ID 1462:7d75):
    CPU 1P8, CHIP Core, VDD MISC
  - MAG B650M MORTAR WIFI (MS-7D76, USB ID 1462:7d76):
    CPU 1P8, CHIP Core, VDD MISC

Unlike the 800-series MS-7E61 controller, which returns sensor data
synchronously via HID_REQ_GET_REPORT on feature report 0xf0, the
controllers on these boards require sending a 64-byte output report
(report ID 0xfa, command 0xa0, page 0x01 0xfc) via
hid_hw_output_report(), after which the controller reports the sensor
readings asynchronously via an interrupt IN transfer handled by the HID
raw_event callback.

Implement msi_ml_read_report_7c94() and msi_ml_raw_event() synchronized
with a completion and spinlock:
  - Initialize the completion in the completed state in msi_ml_probe()
    so unsolicited raw events are ignored when no read is in progress.
  - Call hid_device_io_start() in msi_ml_probe() before the initial
    sensor check so raw events are delivered during probe, and stop I/O
    on the probe error path.
  - Reinitialize the completion before sending the output report, parse
    the voltage channels in msi_ml_raw_event() when a matching response
    arrives while a request is pending, and wait up to 500 ms for
    completion.

Update Documentation/hwmon/msi_mystic_light.rst with the new USB IDs,
communication protocol description, and per-board channel tables.

Cc: Tomasz Bojanowski <tomasz@bojanowski.me>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 Documentation/hwmon/msi_mystic_light.rst |  59 +++++++++--
 drivers/hwmon/msi_mystic_light.c         | 125 +++++++++++++++++++++++
 2 files changed, 178 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/msi_mystic_light.rst b/Documentation/hwmon/msi_mystic_light.rst
index f5847a6b96cc..2b16d811681b 100644
--- a/Documentation/hwmon/msi_mystic_light.rst
+++ b/Documentation/hwmon/msi_mystic_light.rst
@@ -5,6 +5,15 @@ Kernel driver msi_mystic_light
 
 Supported devices:
 
+* MSI Mystic Light USB controller (USB ID 1462:7c94) on MSI
+  MAG B550M MORTAR MAX WIFI (MS-7C94)
+
+* MSI Mystic Light USB controller (USB ID 1462:7d75) on MSI
+  MAG B650 TOMAHAWK WIFI (MS-7D75)
+
+* MSI Mystic Light USB controller (USB ID 1462:7d76) on MSI
+  MAG B650M MORTAR WIFI (MS-7D76)
+
 * MSI Mystic Light USB controller (USB ID 0db0:0076) on these MSI
   800-series motherboards:
 
@@ -15,7 +24,7 @@ Author: Tomasz Bojanowski <tomasz@bojanowski.me>
 Description
 -----------
 
-On MSI 800-series motherboards the RGB LED headers ("Mystic Light") are
+On various MSI series motherboards the RGB LED headers ("Mystic Light") are
 driven by a microcontroller attached over USB. The controller also measures
 a few voltage rails that are not monitored by the Super I/O chip (see
 nct6683). This driver reports these voltages.
@@ -31,11 +40,17 @@ the report cannot be read or does not have the expected format, the driver
 does not bind to the device. Only the rails that return a reading are
 exposed.
 
-The driver never writes to the controller. The only request it sends is
-a read of HID feature report 0xf0. While the driver is bound, the device
-is kept open, so its interrupt endpoint is polled as it is with the
-vendor software. The hidraw interface remains available, so user space
-tools that control the LEDs keep working.
+On 500- and 600-series motherboards, the driver requests sensor data with
+an output report. Sensor data is subsequently reported by the controller
+with a raw event.
+
+On 800-series motherboards, the driver never writes to the controller.
+The only request it sends is a read of HID feature report 0xf0.
+
+While the driver is bound, the device is kept open, so its interrupt endpoint
+is polled as it is with the vendor software. The hidraw interface remains
+available, so user space tools that control the LEDs keep working.
+
 
 Usage Notes
 -----------
@@ -52,6 +67,38 @@ in[0-2]_input   Voltage in millivolts
 in[0-2]_label   Rail name
 =============== =========================================================
 
+MSI MAG B550M MORTAR MAX WIFI (MS-7C94)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+======= ========= ========================================
+Channel Label     Typical value
+======= ========= ========================================
+in0     CPU VDDP  varies (may be 0 on systems with no APU)
+in1     PROM Core 1.04 V
+======= ========= ========================================
+
+MSI MAG B650 TOMAHAWK WIFI (MS-7D75)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+======= ========= ==========================
+Channel Label     Typical value
+======= ========= ==========================
+in0     CPU 1P8   1.80 V
+in1     CHIP Core 1.04 V
+in2     VDD MISC  1.10 V
+======= ========= ==========================
+
+MSI MAG B650M MORTAR WIFI (MS-7D76)
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+======= ========= ==========================
+Channel Label     Typical value
+======= ========= ==========================
+in0     CPU 1P8   1.80 V
+in1     CHIP Core 1.04 V
+in2     VDD MISC  1.10 V
+======= ========= ==========================
+
 MSI MAG B850M MORTAR WIFI (MS-7E61)
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
diff --git a/drivers/hwmon/msi_mystic_light.c b/drivers/hwmon/msi_mystic_light.c
index 098b4ecd0596..630ce349dab3 100644
--- a/drivers/hwmon/msi_mystic_light.c
+++ b/drivers/hwmon/msi_mystic_light.c
@@ -18,6 +18,7 @@
 
 #include <linux/bits.h>
 #include <linux/build_bug.h>
+#include <linux/completion.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/hid.h>
@@ -25,12 +26,18 @@
 #include <linux/jiffies.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/unaligned.h>
 
 #define USB_VENDOR_ID_MSI_MB		0x0db0
 #define USB_PRODUCT_ID_MYSTIC_LIGHT	0x0076
 
+#define USB_VENDOR_ID_MSI_MB_500	0x1462
+#define USB_PRODUCT_ID_MYSTIC_LIGHT_7C94 0x7c94
+#define USB_PRODUCT_ID_MYSTIC_LIGHT_7D75 0x7d75
+#define USB_PRODUCT_ID_MYSTIC_LIGHT_7D76 0x7d76
+
 #define MSI_ML_SENSOR_REPORT_ID		0xf0
 #define MSI_ML_SENSOR_REPORT_SIZE	64
 
@@ -48,6 +55,9 @@ struct msi_ml_data {
 	struct hid_device *hdev;
 	struct device *hwmon_dev;
 	const struct msi_ml_board *board;
+	struct completion done;
+	/* For reinitializing the completion below */
+	spinlock_t report_lock;
 	u8 *buf;			/* report buffer, must be DMA safe */
 	u16 in[MSI_ML_MAX_IN];		/* mV */
 	unsigned int in_mask;		/* rails with a reading in probe */
@@ -62,12 +72,67 @@ struct msi_ml_board {
 	int (*read_report)(struct msi_ml_data *priv);
 };
 
+static int msi_ml_raw_event(struct hid_device *hdev, struct hid_report *report, u8 *data, int size)
+{
+	struct msi_ml_data *priv = hid_get_drvdata(hdev);
+	const struct msi_ml_board *board = priv->board;
+	unsigned long flags;
+	int i;
+
+	if (size != MSI_ML_SENSOR_REPORT_SIZE ||
+	    data[0] != 0xfa || data[1] != MSI_ML_SENSOR_CMD ||
+	    data[2] != 0x01 || data[MSI_ML_SENSOR_PAGE_OFFSET] != MSI_ML_SENSOR_PAGE_HI ||
+	    data[MSI_ML_SENSOR_PAGE_OFFSET + 1] != MSI_ML_SENSOR_PAGE_LO)
+		return 0;
+
+	/* only read data when requested */
+	spin_lock_irqsave(&priv->report_lock, flags);
+	if (!completion_done(&priv->done)) {
+		for (i = 0; i < board->num_in; i++)
+			priv->in[i] = get_unaligned_le16(data + board->in_offset[i]);
+		complete_all(&priv->done);
+	}
+	spin_unlock_irqrestore(&priv->report_lock, flags);
+
+	return 0;
+}
+
 /*
  * Read the sensor report. Called from probe before the hwmon device is
  * registered, and afterwards only from the hwmon read callback, which the
  * hwmon core serializes. No additional locking is needed for the buffer
  * and the cached values.
  */
+
+static int msi_ml_read_report_7c94(struct msi_ml_data *priv)
+{
+	struct hid_device *hdev = priv->hdev;
+	u8 *buf = priv->buf;
+	int ret;
+
+	memset(buf, 0, MSI_ML_SENSOR_REPORT_SIZE);
+	buf[0] = 0xfa;
+	buf[1] = MSI_ML_SENSOR_CMD;
+	buf[MSI_ML_SENSOR_PAGE_OFFSET] = MSI_ML_SENSOR_PAGE_HI;
+	buf[MSI_ML_SENSOR_PAGE_OFFSET + 1] = MSI_ML_SENSOR_PAGE_LO;
+
+	spin_lock_irq(&priv->report_lock);
+	reinit_completion(&priv->done);
+	spin_unlock_irq(&priv->report_lock);
+
+	ret = hid_hw_output_report(hdev, buf, MSI_ML_SENSOR_REPORT_SIZE);
+	if (ret < 0)
+		return ret;
+
+	ret = wait_for_completion_timeout(&priv->done, msecs_to_jiffies(500));
+	if (!ret)
+		return -ETIMEDOUT;
+
+	priv->updated = get_jiffies_64();
+
+	return 0;
+}
+
 static int msi_ml_read_report_7e61(struct msi_ml_data *priv)
 {
 	const struct msi_ml_board *board = priv->board;
@@ -207,6 +272,18 @@ static int msi_ml_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	if (ret)
 		goto fail_stop;
 
+	spin_lock_init(&priv->report_lock);
+	init_completion(&priv->done);
+
+	/*
+	 * Start completion in the completed state so msi_ml_raw_event()
+	 * only sees !completion_done() while the read function is awaiting
+	 * a response.
+	 */
+	complete_all(&priv->done);
+
+	hid_device_io_start(hdev);
+
 	/* Check that the sensor report works, and which rails have a reading */
 	ret = msi_ml_read_report(priv);
 	if (ret) {
@@ -240,6 +317,7 @@ static int msi_ml_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 fail_close:
 	hid_hw_close(hdev);
+	hid_device_io_stop(hdev);
 fail_stop:
 	hid_hw_stop(hdev);
 	return ret;
@@ -274,6 +352,28 @@ static const struct msi_ml_board msi_ml_7e61 = {
 	.read_report = msi_ml_read_report_7e61,
 };
 
+static const char *const msi_ml_7c94_in_label[] = {
+	"CPU VDDP", "PROM Core",
+};
+
+static const u8 msi_ml_7c94_in_offset[] = { 11, 13 };
+
+static const struct msi_ml_board msi_ml_7c94 = {
+	.num_in = ARRAY_SIZE(msi_ml_7c94_in_label),
+	.in_label = msi_ml_7c94_in_label,
+	.in_offset = msi_ml_7c94_in_offset,
+	.read_report = msi_ml_read_report_7c94,
+};
+
+static const u8 msi_ml_7d75_in_offset[] = { 13, 15, 11 };
+
+static const struct msi_ml_board msi_ml_7d75 = {
+	.num_in = ARRAY_SIZE(msi_ml_7e61_in_label),
+	.in_label = msi_ml_7e61_in_label,
+	.in_offset = msi_ml_7d75_in_offset,
+	.read_report = msi_ml_read_report_7c94,
+};
+
 static const struct dmi_system_id msi_ml_dmi_table[] __initconst = {
 	{
 		.matches = {
@@ -282,11 +382,35 @@ static const struct dmi_system_id msi_ml_dmi_table[] __initconst = {
 		},
 		.driver_data = (void *)&msi_ml_7e61,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International"),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-7C94"),
+		},
+		.driver_data = (void *)&msi_ml_7c94,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International"),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-7D75"),
+		},
+		.driver_data = (void *)&msi_ml_7d75,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star International"),
+			DMI_MATCH(DMI_BOARD_NAME, "MS-7D76"),
+		},
+		.driver_data = (void *)&msi_ml_7d75,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(dmi, msi_ml_dmi_table);
 
 static const struct hid_device_id msi_ml_table[] = {
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI_MB_500, USB_PRODUCT_ID_MYSTIC_LIGHT_7C94) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI_MB_500, USB_PRODUCT_ID_MYSTIC_LIGHT_7D75) },
+	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI_MB_500, USB_PRODUCT_ID_MYSTIC_LIGHT_7D76) },
 	{ HID_USB_DEVICE(USB_VENDOR_ID_MSI_MB, USB_PRODUCT_ID_MYSTIC_LIGHT) },
 	{ }
 };
@@ -296,6 +420,7 @@ static struct hid_driver msi_ml_driver = {
 	.id_table = msi_ml_table,
 	.probe = msi_ml_probe,
 	.remove = msi_ml_remove,
+	.raw_event = msi_ml_raw_event,
 };
 
 static int __init msi_ml_init(void)
-- 
2.45.2

