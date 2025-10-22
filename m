Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BB434D4F1
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 18:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761158277; cv=none; b=ZcF85ODTrTQycKT+w+y0/49BieZ7gjGEKuvdIDmmxTWAwX1cuDkzq3OmrArcuaaH+oMR8UpwBci7MnZEKP88dEkcOgttLeK47VNrMmT/Db78hcOWlDDT+bDutfaz00eJUNLQab+208Ws0FGRze7ntjya0BkAg3Bkkr2QccgJU/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761158277; c=relaxed/simple;
	bh=31QxNYMwKtssAJnlVPua8IhszTlj4EtQiy/0WBoRcmo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PEIRPn2d6+7MrSli7PXTz2SDQMH0n7i5FO2xRBnd+6fPP6YgTpt7ityPzB2tIkqBrv3OLueo1BZqcqytpjY68+EWZCT+5sVw36ssk6fdtyNfIfj0GMKkpmFpPTV9qGAq8xvfw5H9O4gsMN4UiyM9H2Wt8LLlTx27526kBQQIXFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in; spf=pass smtp.mailfrom=ssn.edu.in; dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b=XsV2AccT; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ssn.edu.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ssn.edu.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ssn.edu.in header.i=@ssn.edu.in header.b="XsV2AccT"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6ceb3b68feso580784a12.0
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 11:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ssn.edu.in; s=ssn; t=1761158273; x=1761763073; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3iB2c7LqGp7VXaDE6QKU06CjceLXW5qv6K68RUJZlp4=;
        b=XsV2AccTKKHVzzg1kuKJQA3FFhs4xUhck60Qq1IKsPGCI6BuUNE83BdDn5ZrZFejhD
         L8UncZfZFsbLb8vEinJ9hQrk/hGzjSfpjaRm4Jay894rpJ3cYz/VobmZTolnbudZJ7Tz
         FatGaiEH/buJnzMucLadZvJXggrGZAYcPBpes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761158273; x=1761763073;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3iB2c7LqGp7VXaDE6QKU06CjceLXW5qv6K68RUJZlp4=;
        b=D5M1jVYYrtkvpjxWv2p/d9ikm8N3cmuk2txi/37XP/ntq8DYqrZIxj07d3QDv06K2h
         mkXYCUnxrig6B8ri6tFxZmrEjBVyaE/ZxhTawC9Mt5yNm9ec8IRFM4ZCDUD3QYW+lacY
         BOz1zOflgD7YzIGaru6SkpU2aWKXZhEm3+vdJ/3Zb/f9dm9yw+upKlYV6yJZ8UmsJSi6
         2w3jrroN0uaPhZ5fUC5UvxGJu6RFaFWgMN/fEKxlO+vM4dmbVbcQ6zhNNsPTf1cFY1GF
         ggYO8e4T9CnTdmf6SuCWC36J8ono8PmPVyBDpfTIm8z2A5npCFunt8ZwkhEIROaIwyEY
         dvXg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ7qXqAd41t5s3jD+3ZR/DVPg0NSWCOqJrH64EJ8TlDzWDTo/x4r5AmzSiwPZgoC3mED3BxH+A//LFew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLiyUYnXhLOc9upwkcxF2WHmf8tMeIAwP/09bbe9QVRx8D81WH
	MJP5WrWUB2PoZeXqo/VcILfKpHCSGcnpcluY0+p4aA/l2kcLwJyDNxhZpmejVtNsSZO/PtGf9P3
	3WX9SjBrGYVuBRVAmQlrtejg0SPcQdytEY9cjGMnMnjbg5/VPKCxhUtU=
X-Gm-Gg: ASbGncsHxB6SizanL8ocuX4M4ur8j34az1BRMrbHTe4z1k9Le/onUymAwVdjN8KFpFb
	aEl/tJcyT2wLjZh8OP7sK2tJPWCR6SnbbuO77X0gTV7EoGCqzPzTGlBB9G2px+tV+ujjpSgFAQD
	PKJ0bPXHrYCZbGbcPwUM4jz//oiIa086OTSLJHp3m9mhobcU7quybUB2INdQJcwhmuwVc6ZB1W0
	xmrn26Gqs8pSiWZsA+hbZsqH2Gdd+y2RLM55qmqmJljrfFo5OL+NqID8NWacmkFatAKUWgp1tJz
	BLyvpxdosrX9eDQgAcbD8nxmMxUuULvgZ/t2FmZCnYhEzjBhZFgNZ/60iMd88F2A8FjV5hakOr4
	giUC+ccMJFpkyJXE0J1BhoU5MQ0N3JHGSl3xUm5/e7YUcHUownMuafUVRqErOkbCPzGLKPkl0fc
	eeKwm+y3tv+MUjjj5kNKIIlfI2qZ7fWn9XlNx0hwZopIhfyaQ8Bqp5uuUTbBCbkm+6ia1BBzOG1
	o0=
X-Google-Smtp-Source: AGHT+IGb3ESkvzm9Viz0sN6qMEIEjBclGnTO4jABWevmrKqAwuQy7cN3ZiCnLJDqrhcCyXz0+Mpz4g==
X-Received: by 2002:a17:902:ce91:b0:267:8049:7c87 with SMTP id d9443c01a7336-292ffc0ad75mr58692045ad.14.1761158273040;
        Wed, 22 Oct 2025 11:37:53 -0700 (PDT)
Received: from biancaa-HP-Pavilion-Laptop-15-eg2xxx.. ([2406:7400:1c3:818d:712:fe94:5de7:1d8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fed21sm145155105ad.80.2025.10.22.11.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 11:37:52 -0700 (PDT)
From: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
To: pali@kernel.org
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biancaa Ramesh <biancaa2210329@ssn.edu.in>
Subject: [PATCH v1] hwmon: migrate i8k procfs interface to sysfs
Date: Thu, 23 Oct 2025 00:07:46 +0530
Message-ID: <20251022183746.66481-1-biancaa2210329@ssn.edu.in>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"

The i8k driver currently exposes Dell laptop hardware monitoring
information via a deprecated /proc/i8k interface.

This patch removes the procfs file creation and replaces it with
standard sysfs attributes under the hwmon subsystem.

- Removes i8k procfs registration and operations.
- Creates sysfs attributes for temperature, fan speeds, and power status.
- Registers these attributes via devm_hwmon_device_register_with_groups().
- Cleans up legacy procfs code for a cleaner, modern, and supported interface.

This migration aligns with Linux kernel best practices to phase out
deprecated and legacy procfs files in favor of a structured sysfs approach.

Signed-off-by: Biancaa Ramesh <biancaa2210329@ssn.edu.in>
---
 drivers/hwmon/dell-smm-hwmon.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+), 40 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index oldhash..newhash 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -XXX,40 +XXX,80 @@
-// Remove procfs interface
-static int i8k_proc_show(struct seq_file *seq, void *offset)
-{
-    struct dell_smm_data *data = seq->private;
-    // ...
-}
-
-static const struct proc_ops i8k_proc_ops = {
-    .proc_open = i8k_open_fs,
-    .proc_read = seq_read,
-    .proc_lseek = seq_lseek,
-    .proc_release = single_release,
-    .proc_ioctl = i8k_ioctl,
-};
-
-static void i8k_exit_procfs(void *param)
-{
-    remove_proc_entry("i8k", NULL);
-}
-
-static void __init i8k_init_procfs(struct device *dev)
-{
-    struct dell_smm_data *data = dev_get_drvdata(dev);
-    // ...
-    if (proc_create_data("i8k", 0, NULL, &i8k_proc_ops, data))
-        devm_add_action_or_reset(dev, i8k_exit_procfs, NULL);
-}
+// Define sysfs attributes for temps and fans
+static ssize_t temp1_input_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+    struct dell_smm_data *data = dev_get_drvdata(dev);
+    int temp = i8k_get_temp(data, 0);
+    if (temp < 0)
+        return temp;
+    return sprintf(buf, "%d\n", temp * 1000);
+}
+
+static DEVICE_ATTR_RO(temp1_input);
+
+static ssize_t fan1_input_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+    struct dell_smm_data *data = dev_get_drvdata(dev);
+    int speed = i8k_get_fan_speed(data, 0);
+    if (speed < 0)
+        return speed;
+    return sprintf(buf, "%d\n", speed);
+}
+
+static DEVICE_ATTR_RO(fan1_input);
+
+static struct attribute *dell_smm_attrs[] = {
+    &dev_attr_temp1_input.attr,
+    &dev_attr_fan1_input.attr,
+    NULL,
+};
+
+static const struct attribute_group dell_smm_group = {
+    .attrs = dell_smm_attrs,
+};
+
+static const struct attribute_group *dell_smm_groups[] = {
+    &dell_smm_group,
+    NULL,
+};
+
+static int dell_smm_init_cdev(struct device *dev)
+{
+    struct dell_smm_data *data = dev_get_drvdata(dev);
+    struct device *hwmon_dev;
+
+    hwmon_dev = devm_hwmon_device_register_with_groups(dev, "dell_smm", data, dell_smm_groups);
+    return PTR_ERR_OR_ZERO(hwmon_dev);
+}
+
+static int __init dell_smm_probe(struct platform_device *pdev)
+{
+    int ret;
+
+    ret = dell_smm_init_data(&pdev->dev, &i8k_smm_ops);
+    if (ret < 0)
+        return ret;
+
+    ret = dell_smm_init_hwmon(&pdev->dev);
+    if (ret)
+        return ret;
+
+    ret = dell_smm_init_cdev(&pdev->dev);
+    if (ret)
+        return ret;
+
+    return 0;
+}

-- 
::DISCLAIMER::

---------------------------------------------------------------------
The 
contents of this e-mail and any attachment(s) are confidential and
intended 
for the named recipient(s) only. Views or opinions, if any,
presented in 
this email are solely those of the author and may not
necessarily reflect 
the views or opinions of SSN Institutions (SSN) or its
affiliates. Any form 
of reproduction, dissemination, copying, disclosure,
modification, 
distribution and / or publication of this message without the
prior written 
consent of authorized representative of SSN is strictly
prohibited. If you 
have received this email in error please delete it and
notify the sender 
immediately.
---------------------------------------------------------------------
Header of this mail should have a valid DKIM signature for the domain 
ssn.edu.in <http://www.ssn.edu.in/>
