Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4700B20F96D
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jan 2025 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649994; cv=none; b=uysnhk1/8VDLqX04fh/Lec2q4oqe5buyoZPCmvBAFdI5soU+M4JkiQa3z121vJLvdsjpEUqmGiwhhK6zn7Pg/SmtVzDlT1IbIOISsIgTnVICN2Aij2JHRPGRZ7AKOhRTkJfhmHz0DFYWdrf3fhIJp989CW5nkpujIOg7GkoKV/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649994; c=relaxed/simple;
	bh=N6JZu/f6I10fMnUYbONTa/6fhjajLNZcPxPu2MZ7Je0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NnBeMwdhoKDvwBdgZNgnlHiho950oL+T/7lU8BNPbSpzcfMJVzIksdNV6ADzXa8eh2lRVzFUGeZa2kEt3UuUru8L2zq+twnX/+m/ph9rHZ8rIG64g7inbGz5PN5jvc8/kCrv38bQhuKD3tiAf3rYbXlHYLa2U7NoPRkUS7CrHmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=aNBnBh+6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="aNBnBh+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=UU8u+/VmmHwaZ6
	E1jBPs4IiksBFViyrooRjhiIz0dbE=; b=aNBnBh+6lk4C8QdEJOwgE7n8MyvgVI
	hjUUqpWE7hFnv19OptLGLCiCWPd5w6C0543yqn6DNL2joJQFqqZ/yurgEE7iN261
	B2dpQy5m6QDWR1s10Qj1p1cvOVHR1alBoa8nzJWKHIEZDLEQvEFDzYciP6Jm2+U+
	Gy8pNshn7W4e3Oj8rwJtr8oVux3uKogAo7L714LNelrMJNViODEhlfNrgbXW5B41
	R+MbHmBdocwRsuv1xDe+PC3Kr17/j7n9H2HbC/IyR9SHKtjQ8g/bAQnglGSYn/Q5
	BYW5tHW2Wh328o7wUp/Avn10b7+BVZzoo3CvJwqRr0Q1BPzkdKyI8U2Q==
Received: (qmail 3331754 invoked from network); 23 Jan 2025 17:33:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Jan 2025 17:33:08 +0100
X-UD-Smtp-Session: l3s3148p1@LGNNKmIsQqMujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH RFC] hwmon: (pmbus/core) use the new i2c_client debugfs dir
Date: Thu, 23 Jan 2025 17:33:04 +0100
Message-Id: <20250123163304.46034-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now manages a debugfs dir per i2c_client. PMBus has its own
debugfs hierarchy. Link the two, so a user will be pointed to the pmbus
domain from the i2c domain.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

@Guenter: I don't have any PMBus device here. Would you be interested to
test this patch? It build tests fine at least.

 drivers/hwmon/pmbus/pmbus_core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 787683e83db6..510b88aed326 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -3517,6 +3517,7 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	int i, idx = 0;
 	char name[PMBUS_NAME_SIZE];
 	struct pmbus_debugfs_entry *entries;
+	const char *symlink, *hwmon_name = dev_name(data->hwmon_dev);
 
 	if (!pmbus_debugfs_dir)
 		return -ENODEV;
@@ -3525,13 +3526,19 @@ static int pmbus_init_debugfs(struct i2c_client *client,
 	 * Create the debugfs directory for this device. Use the hwmon device
 	 * name to avoid conflicts (hwmon numbers are globally unique).
 	 */
-	data->debugfs = debugfs_create_dir(dev_name(data->hwmon_dev),
-					   pmbus_debugfs_dir);
+	data->debugfs = debugfs_create_dir(hwmon_name, pmbus_debugfs_dir);
 	if (IS_ERR_OR_NULL(data->debugfs)) {
 		data->debugfs = NULL;
 		return -ENODEV;
 	}
 
+	/* The default i2c_client debugfs dir should link to where the data is */
+	symlink = kasprintf(GFP_KERNEL, "../../pmbus/%s", hwmon_name);
+	if (!symlink)
+		return -ENOMEM;
+	debugfs_create_symlink(hwmon_name, client->debugfs, symlink);
+	kfree(symlink);
+
 	/*
 	 * Allocate the max possible entries we need.
 	 * 7 entries device-specific
-- 
2.39.2

