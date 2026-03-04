Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED10353EE0
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Mar 2026 22:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.227.64.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772662482; cv=none; b=OV6ynJ9aY3N7IyA8mCvE4PVSXgSk/12pn46VrykjLrkVgcPBiIIu3mUBk20d6PjdsEvcAjGrlVaizPOKsKRuolZ03RjND0m//pWa0CWga/ZdmU+eDRML/MbKi3GmwTgU9vWDS3LabG2s7G4LojI1O+Ik4m6hB8OrYJWjRFDH8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772662482; c=relaxed/simple;
	bh=ofjl1eiEcZ6MdyXGqmbXrSpQ8/WqfrMl+K8mplTjxpI=;
	h=Date:Message-ID:In-Reply-To:References:Subject:MIME-Version:
	 Content-Type:From:To:Cc; b=Y/RSY5xEIK7SsYkbZ1XIIxS9logrFCShNBU9LdUN2WwusvaTlgPK2J570MxrMYrgsY9WXXBEEitfMekqvhhaVz7e8ySx30tUBrn0ixhOq6swtMfnwVgBrdLsY19Z/y0YjRKsGUTKfmCjOUM5ljpju4Ata1/4+tfht4tvKocZyH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl; spf=pass smtp.mailfrom=rere.qmqm.pl; dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b=CEB+yARQ; arc=none smtp.client-ip=91.227.64.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rere.qmqm.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="CEB+yARQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1772661926; bh=ofjl1eiEcZ6MdyXGqmbXrSpQ8/WqfrMl+K8mplTjxpI=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:From;
	b=CEB+yARQHRQS72n4ch3UMflgQxe3NHM7gySmutjUS4665MdyuVemMXNkp9xM0UXw2
	 pukEyPjgQad40fDT76IvQwzXfFS2aSyKjexUJQG1hxgVsUn/L+nMhKdIOBv5eDSrLU
	 W7eg8nYm6LFfLTRoNH13+OcTlSo5mCcGHpHvaz/+1b9m7WU5aYBUmJhOlxQ4LMakKR
	 SN92nkjrbID2Gy1p89ahsa2t7jTPDxdfUgRopq7nSIcnYKjgOylB+rsZDTugYnXkbi
	 OXVPV5i7u1gRpiJMoXeLBqF7E4nPkc6R53zrsVtNcMysMNR/7jt529XR9S+4ze5QFO
	 p6cd9JxbyYYig==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with UTF8SMTPSA id 4fR6DQ2jjPzdF;
	Wed, 04 Mar 2026 23:05:26 +0100 (CET)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.4.3 at mail
Date: Wed, 04 Mar 2026 23:05:26 +0100
Message-ID: <f21e5af6bd12966cd1bacb820bfbcf473d001c51.1772661800.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
References: <c7a3a0b6c1658a8ce4cc5962de18c5b2cdbcdb8f.1772661800.git.mirq-linux@rere.qmqm.pl>
Subject: [PATCH 5/5] hwmon: gigabyte_waterforce: present FW version as
 major.minor
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
From:	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
To:	Aleksa Savic <savicaleksa83@gmail.com>
Cc:	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org

Show firmware version as major.minor to match how the firmware files for
Waterforce II are distributed.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/hwmon/gigabyte_waterforce.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/gigabyte_waterforce.c b/drivers/hwmon/gigabyte_waterforce.c
index 7f5c88f66e40..04dfe0f4a45f 100644
--- a/drivers/hwmon/gigabyte_waterforce.c
+++ b/drivers/hwmon/gigabyte_waterforce.c
@@ -33,8 +33,8 @@
 /* Control commands, inner offsets and lengths */
 static const u8 get_status_cmd[] = { REPORT_ID, CMD_STATUS };
 
-#define FIRMWARE_VER_START_OFFSET_1	2
-#define FIRMWARE_VER_START_OFFSET_2	3
+#define FIRMWARE_VER_MAJOR	0x02
+#define FIRMWARE_VER_MINOR	0x03
 static const u8 get_firmware_ver_cmd[] = { REPORT_ID, CMD_FIRMWARE_VERSION };
 
 /* Command lengths */
@@ -64,12 +64,12 @@ struct waterforce_data {
 	struct completion fw_version_processed;
 
 	/* Sensor data */
+	unsigned long updated;	/* jiffies */
 	s32 temp_input[1];
 	u16 speed_input[2];	/* Fan and pump speed in RPM */
 	u8 duty_input[2];	/* Fan and pump duty in 0-100% */
 
-	int firmware_version;
-	unsigned long updated;	/* jiffies */
+	u8 fw_ver_major, fw_ver_minor;
 
 	u8 buffer[MAX_REPORT_LENGTH];
 };
@@ -267,8 +267,8 @@ static int waterforce_raw_event(struct hid_device *hdev, struct hid_report *repo
 	switch (data[1]) {
 	case CMD_FIRMWARE_VERSION:
 		/* Received a firmware version report */
-		priv->firmware_version =
-		    data[FIRMWARE_VER_START_OFFSET_1] * 10 + data[FIRMWARE_VER_START_OFFSET_2];
+		priv->fw_ver_major = data[FIRMWARE_VER_MAJOR];
+		priv->fw_ver_minor = data[FIRMWARE_VER_MINOR];
 
 		if (!completion_done(&priv->fw_version_processed))
 			complete_all(&priv->fw_version_processed);
@@ -297,7 +297,8 @@ static int firmware_version_show(struct seq_file *seqf, void *unused)
 {
 	struct waterforce_data *priv = seqf->private;
 
-	seq_printf(seqf, "%u\n", priv->firmware_version);
+	if (priv->fw_ver_major || priv->fw_ver_minor)
+		seq_printf(seqf, "%hhu.%hhu\n", priv->fw_ver_major, priv->fw_ver_minor);
 
 	return 0;
 }
@@ -307,9 +308,6 @@ static void waterforce_debugfs_init(struct waterforce_data *priv)
 {
 	char name[64];
 
-	if (!priv->firmware_version)
-		return;	/* There's nothing to show in debugfs */
-
 	scnprintf(name, sizeof(name), "%s-%s", DRIVER_NAME, dev_name(&priv->hdev->dev));
 
 	priv->debugfs = debugfs_create_dir(name, NULL);
-- 
2.47.3

