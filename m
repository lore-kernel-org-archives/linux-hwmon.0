Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699791F78E6
	for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 01:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785287959; cv=none; b=c6z6rEBmY/ZSfN4QnXjME38nV6Eu3dZ+lwx6wsD9EpMrurlXoVCkSH0CM89BxQqVjm4wWkCey8b6xdZ0pK5WnX9IyzrGX27IRB02KiVN0fMkgvKTPOgpov114TwP+n2yOkmL3aT9BffYFOMZRFAaP6s3m0R5gaNcWWk6Bursdo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785287959; c=relaxed/simple;
	bh=jzqgTIcU00G2kAMpQ8cPXfU304HMcknpkme4r5Rs8Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kiac3IWr0UEQv5CKuFgC8sk0eExOfk3fHZ4Il9/4PRbZZXkyVPJXKvFZilouK2DPytBEEuButzvYaYuU0V/fd+9qyRS6Bm2qkqRIvlonbID+N1FAaAySLLNSKnLVOVRK3STJO80YM0xt9J1ussK63WbxnAuX/D0vS93VQq23dLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtIy0/3m; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtIy0/3m"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso389927a91.3
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 18:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785287957; x=1785892757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VAEx+TR0G6a1W0o4D7B+oQY6ibYeTUL5BpXjxJ4B1oE=;
        b=YtIy0/3muQTCPWJA7nIL3SuzrVRWp3ZgsL7JtPucoSb0Mm+5DF0BD+Exbb35FGPYY8
         dRdhIITNWGQOgbQ44bSXKCfmKwyx78PAs7XMg0hm/7x5nKkEMzbHYTSzVIt8izie7VnQ
         jcJBI/DYkjtjbKzgBVI/iuysdrqdZIW0Xw2wEVbeq/sa8/0WBpimcelAfhfeaRX4Oc7k
         1V6vHjlNGhemSSpxqBOkVsETzDOxai6CV8kcp7DB10AeKgySX2qsNmqFVbVHcARui9Br
         ENiFseaXMPmJInz8pClrMjOhRvL/uLh4x+q0schwdhlPZ8OebHwSXFu/UtWP17BiJ/5r
         dehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785287957; x=1785892757;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VAEx+TR0G6a1W0o4D7B+oQY6ibYeTUL5BpXjxJ4B1oE=;
        b=pPM0kPqPwj0M3IseRPdCkYutlgg+IGuXnBGuY8VjFP5ujdiQt7krLbLMLY9h08PjIM
         YMKrz0uhLqxVwXEWMBCwAFzIeGDgOtiAr5/SDP3cR1F8AuTwzmH2nfrGsz44hjVPBxzY
         STlG6uZb+osgkM06Fmo3Fu4chpgzBIO/Z/KXECBuGJXlVNVdIYpd6yeB96SH9wUwixBI
         6+GR7ISbs++91kW0dLks6FQV6yFL9mHKIH3ao5VQQHiyDk8TS8htM6zInqBffk+jkfFx
         8XJBhvdr3fKm8p2ArgiVpOwXQtc4+7mAAMVmlYcw6WvaQhpA421UMDSXZLjzKjLpTfzQ
         omjQ==
X-Gm-Message-State: AOJu0Yy6bJmfSTxiQ2WBZyKHbOVH1UYoYBYG/NSLbR7eFVIWSRpjMzhl
	lxgNbUpeZ92PK9peI+Z9K76LR0XzOi3mSlR5Qteopk5T0bmbSZ87+M6lzl88WQ==
X-Gm-Gg: AR+sD13WUSajwE2r23DxwJ7pU3hBUP22nKAdFoQLorZOXFWkKYC3fYUqr8LNjB7ABEg
	Q7kdcCA+Vo7Kr3Qdexr9B9flkp6jEsuKk/NDcVGDIJELqNSrFR1R4yjtEfU9wlEqFgZNvZ5Sew1
	lRVA/WrnMA05gpgfUw0aCv6attwhRR1sIeq9AeF1u4HMhHoqBTvWqzThyhfX2FbGOW1naQ9Ms2D
	y0fFLVsX4FAW1bcFZgUhRUlMTMAsv2hgGrbaChyNenGsf+SKs75AuhyxL58epE5K4jDpO7oMINs
	26eN+kWdffUa3T1up5T4OKond3UmXOFuIaVpJb5ON1SMWiOQddrPGTXpflQUZ5J6B8sH13pRLTO
	svEOw4Ikexed7fKOKfmWzw4Swq9WX4PGe3tdWk+ndhd6d3HnF3sc4Wunk+9E6mtJhMhGhcN90Bf
	4oG8RQO7mVRcrld+ccsdZ7/PERW5RYmlZVhPAt1JEquLZDprYj9X1370LmINizW7oXOB4qv8vzS
	nU=
X-Received: by 2002:a17:90b:2b48:b0:38e:120d:df09 with SMTP id 98e67ed59e1d1-38f6a4e2861mr5121167a91.25.1785287956580;
        Tue, 28 Jul 2026 18:19:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f6412ba8csm1970294a91.7.2026.07.28.18.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:19:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH] hwmon: (pmbus) Let PMBus drivers report the supported PMBus revision
Date: Tue, 28 Jul 2026 18:19:14 -0700
Message-ID: <20260729011914.4018703-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some PMBus chips do not support the PMBUS_REVISION command. Knowing
the PMBUs revision supported by a chip is relevant for PMBUs core
functionality, so add support for letting chip drivers report the PMBUs
revision.

Use the new capability to report the PMBus revision supported by MAX20830.

While at it, add definitions for PMBUs revisons 1.3.1 and 1.4.

Cc: Nuno Sá <nuno.sa@analog.com>
Cc: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/pmbus/max20830.c   |  2 ++
 drivers/hwmon/pmbus/pmbus.h      | 20 +++++++++++++----
 drivers/hwmon/pmbus/pmbus_core.c | 38 ++++++++++++++++++++++----------
 3 files changed, 44 insertions(+), 16 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
index e3470118fd36..d43ee6438b26 100644
--- a/drivers/hwmon/pmbus/max20830.c
+++ b/drivers/hwmon/pmbus/max20830.c
@@ -23,6 +23,8 @@ static struct pmbus_driver_info max20830_info = {
 		PMBUS_HAVE_TEMP |
 		PMBUS_HAVE_STATUS_VOUT | PMBUS_HAVE_STATUS_IOUT |
 		PMBUS_HAVE_STATUS_INPUT | PMBUS_HAVE_STATUS_TEMP,
+	.have_pmbus_revision = true,
+	.pmbus_revision = PMBUS_REV_13,
 };
 
 static int max20830_probe(struct i2c_client *client)
diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
index 23e3eda58870..1af247de9075 100644
--- a/drivers/hwmon/pmbus/pmbus.h
+++ b/drivers/hwmon/pmbus/pmbus.h
@@ -420,10 +420,12 @@ enum pmbus_data_format { linear = 0, ieee754, direct, vid };
 enum vrm_version { vr11 = 0, vr12, vr13, imvp9, amd625mv, nvidia195mv };
 
 /* PMBus revision identifiers */
-#define PMBUS_REV_10 0x00	/* PMBus revision 1.0 */
-#define PMBUS_REV_11 0x11	/* PMBus revision 1.1 */
-#define PMBUS_REV_12 0x22	/* PMBus revision 1.2 */
-#define PMBUS_REV_13 0x33	/* PMBus revision 1.3 */
+#define PMBUS_REV_10	0x00	/* PMBus revision 1.0 */
+#define PMBUS_REV_11	0x11	/* PMBus revision 1.1 */
+#define PMBUS_REV_12	0x22	/* PMBus revision 1.2 */
+#define PMBUS_REV_13	0x33	/* PMBus revision 1.3 */
+#define PMBUS_REV_131	0x44	/* PMBus revision 1.3.1 */
+#define PMBUS_REV_14	0x55	/* PMBus revision 1.4 */
 
 /* Operation type flags for pmbus_update_ts */
 #define PMBUS_OP_WRITE		BIT(0)
@@ -488,6 +490,16 @@ struct pmbus_driver_info {
 	int access_delay;		/* in microseconds */
 	int write_delay;		/* in microseconds */
 	int page_change_delay;		/* in microseconds */
+
+	/*
+	 * Some chips do not support the PMBUS_REVISION command.
+	 * Drivers for such chips can report the supported PMBus revision here.
+	 *
+	 * Drivers must set have_pmbus_revision to true and provide the
+	 * supported PMBus version in pmbus_revision.
+	 */
+	bool have_pmbus_revision;	/* true if pmbus_revision is valid */
+	u8 pmbus_revision;		/* PMBus revision */
 };
 
 /* Regulator ops */
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 53501fa1a28e..3e13d09e2c1c 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -96,7 +96,8 @@ struct pmbus_data {
 
 	u32 flags;		/* from platform data */
 
-	u8 revision;	/* The PMBus revision the device is compliant with */
+	bool have_pmbus_revision;
+	u8 revision;		/* The PMBus revision the device is compliant with */
 
 	int exponent[PMBUS_PAGES];
 				/* linear mode: exponent for output voltages */
@@ -2847,9 +2848,16 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 	if (!(data->flags & PMBUS_NO_WRITE_PROTECT))
 		pmbus_init_wp(client, data);
 
-	ret = i2c_smbus_read_byte_data(client, PMBUS_REVISION);
-	if (ret >= 0)
-		data->revision = ret;
+	if (info->have_pmbus_revision) {
+		data->have_pmbus_revision = true;
+		data->revision = info->pmbus_revision;
+	} else {
+		ret = i2c_smbus_read_byte_data(client, PMBUS_REVISION);
+		if (ret >= 0) {
+			data->have_pmbus_revision = true;
+			data->revision = ret;
+		}
+	}
 
 	if (data->info->pages)
 		pmbus_clear_faults(client);
@@ -3537,6 +3545,17 @@ static int pmbus_debugfs_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_ops, pmbus_debugfs_get, NULL,
 			 "0x%02llx\n");
 
+static int pmbus_debugfs_get_revision(void *data, u64 *val)
+{
+	struct pmbus_data *pdata = data;
+
+	*val = pdata->revision;
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(pmbus_debugfs_revision_ops, pmbus_debugfs_get_revision, NULL,
+			 "0x%02llx\n");
+
 static int pmbus_debugfs_get_status(void *data, u64 *val)
 {
 	struct pmbus_debugfs_entry *entry = data;
@@ -3690,14 +3709,9 @@ static void pmbus_init_debugfs(struct i2c_client *client,
 				    &entries[idx++],
 				    &pmbus_debugfs_ops);
 	}
-	if (pmbus_check_byte_register(client, 0, PMBUS_REVISION)) {
-		entries[idx].client = client;
-		entries[idx].page = 0;
-		entries[idx].reg = PMBUS_REVISION;
-		debugfs_create_file("pmbus_revision", 0444, debugfs,
-				    &entries[idx++],
-				    &pmbus_debugfs_ops);
-	}
+	if (data->have_pmbus_revision)
+		debugfs_create_file("pmbus_revision", 0444, debugfs, data,
+				    &pmbus_debugfs_revision_ops);
 
 	for (i = 0; i < ARRAY_SIZE(pmbus_debugfs_block_data); i++) {
 		const struct pmbus_debugfs_data *d = &pmbus_debugfs_block_data[i];
-- 
2.45.2

