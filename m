Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8368926E6FB
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192539; cv=none; b=GuiiYM//2aEFI58yzmm4ODkX4P8bKbCkXqqZnt7oS5PPyydskVIeMPcnpIdia2eSaW7pA3YOeAn2KXzGe/me46a3sz8jj0JIsGEol0dr+ypGxv+Wbpzwjh1IWIUzN9DaZFAVqm9pHXgpd17DpJNqREZn263Hqq8rqgUJ1SUmDZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192539; c=relaxed/simple;
	bh=vKtkU7K3RqQCKIfjSH/DNJHpr6zN6ZGQr3Ky4UrXBdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWfXQ6PfJqC825dE5mAQYY4cbykSdolJ9nBjwCnrm5nN0YQ0eyOTQ2NSOhUXZyxKfe4uvHygNvrZ2n3OpJrKLJlY7MYwD1rtnqE1w/WR+nKe6hQAG69/3Ki2EhOff37t/ChDUWWMDoBxfjwHfK2s2wIiwe+AUE80NpU6c+3lgzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRgL6++q; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRgL6++q"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-823081bb15fso1316699b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Jan 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192536; x=1769797336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7PAn6tvHTwmV1TdQFHJFHPiY8QmPdWd/ER1+pyJrOM=;
        b=FRgL6++qa09KXXcxBLTTqE6V/ZVmsZe3IUjrEO9BrwE/i/bsKc8Yhzrm2n8C9C639G
         Oi+a/0RLHzlIeE2/1MgkGrfn6WgPDBLlTW/mP0cvsz1OJPhp/aTRhYFxPUz0mvaK3U3h
         NBGZ/NTJ361FK5Li73zRzWxAkdgnhAGqd3ek1vfuApXXZ9sGMcO3bEQ1yFmX/gDHGUID
         utdVIJjxoO3jg4tZipw3+Q1HvH03EJ2cPcZTo9pviGyyM1PBWEv3FKCBWg2hJuFIrD18
         UiX2y51T7AwnzMaUDxKyvp+K7FhCK6sHgR7iGRzAvbDezA4v285S3zhxmxap2CYP9Bnp
         arJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192536; x=1769797336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7PAn6tvHTwmV1TdQFHJFHPiY8QmPdWd/ER1+pyJrOM=;
        b=A2FnhqAjX3ERWEcC/LVOluuu1Mi2yMPqnyWqVxCoc3OHs61AH8P6rb9LlSllToU4W2
         6BEb5hAd/cX8RJaewKfSx6jpfIW/6zfquzrPRlamUDANtaCbsw5CqS9pWS+Jvl6sPLGe
         7xz1jFhjG6x7qdwEoJP0rxXDSHy9aNGg+fAbcqI18JZFiMx3FKSABXYQqa4IJf8Ln+1Z
         uxPgtRDUg2sQMukkqsSBphgqhTgquT3+3FHduA/tJN07q4GGny7D5HW0BjW1QXeM4cam
         BGG1/kp8xjPbBA53scAmm4CotaNhJhO30yHsvrpkse2h7RmrfgfyiSpqk31W8E3Hx8Oi
         qQTA==
X-Gm-Message-State: AOJu0Yx5Ndn/7bRWg3CPSV6C8LnMypQVdnoDw6Us21R10Fr7xMP/1+C5
	QwQ0EcVRdxMxkbgn1sXgTshhyoG8BTXQf4popbGpk08Gwgw1KghfX/cniwImg9jr
X-Gm-Gg: AZuq6aIvEgOHpLyXf4cyZY52AUX091kjjvvFg0iCaCgw2aArv4kgBzDJNbIR/ahzR1u
	4a6U0209eVHo9q8kT/dLQdzzdbCttYb/N4eBCRHbxHPsvf3791QdI1eB3LOXoj6oCdpMLP7Jq67
	7u0DZwC19FYNWWvHskQDsX+3TlZ/hJ7oKfmr7/Jv0MpVQp2VRazktLKOq1LrT9FVZwmMCxgnsjW
	WH2j9bIprzuG6BwwbSAbqBeAk0qBwxcOGW8VRx3ipvLbhOnJ/ruXUzV7n36T7/GbfQzAQgj7L8o
	vx5tsPSvsRqhlDJINPnliJ03ctDbJT3FYiPuT3aWun0igQ4ksLMsxFnSLE+tEOUiJH9Lo1GtQL4
	EayhRhN0zdRF6bn9gLtzmQOTv8k5NvOA0hsVf/tToNWEmwAfD6fx3eXo8/Bg4BYXNjo7jpL9nWs
	OcbBERkN7q+DPurUsgwak0RLrz
X-Received: by 2002:a05:6a00:2b88:b0:823:1094:2458 with SMTP id d2e1a72fcca58-82317ad74ecmr2979756b3a.0.1769192536111;
        Fri, 23 Jan 2026 10:22:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318771569sm2817157b3a.63.2026.01.23.10.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:22:15 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	lihuisong <lihuisong@huawei.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH RFT 1/5] hwmon: Handle attribute visibility evaluation in device core
Date: Fri, 23 Jan 2026 10:22:04 -0800
Message-ID: <20260123182208.2229670-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260123182208.2229670-1-linux@roeck-us.net>
References: <20260123182208.2229670-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In preparation for supporting sysfs attribute updates, move
attribute visibility evaluation into device core.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/hwmon.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 0b4bdcd33c7b..9e9ad42b6d7d 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -523,10 +523,12 @@ static struct attribute *hwmon_genattr(const void *drvdata,
 	const char *name;
 	bool is_string = is_string_attr(type, attr);
 
+	/*
+	 * Basic mode sanity check. This is less than perfect since
+	 * attribute visibility and with it the mode can change during
+	 * runtime, but it is the best we can do.
+	 */
 	mode = hwmon_is_visible(ops, drvdata, type, attr, index);
-	if (!mode)
-		return ERR_PTR(-ENOENT);
-
 	if ((mode & 0444) && ((is_string && !ops->read_string) ||
 				 (!is_string && !ops->read)))
 		return ERR_PTR(-EINVAL);
@@ -557,7 +559,7 @@ static struct attribute *hwmon_genattr(const void *drvdata,
 	a = &dattr->attr;
 	sysfs_attr_init(a);
 	a->name = name;
-	a->mode = mode;
+	a->mode = ops->write ? 0644 : 0444;	/* updated when attributes are generated */
 
 	return a;
 }
@@ -896,6 +898,17 @@ __hwmon_create_attrs(const void *drvdata, const struct hwmon_chip_info *chip)
 	return attrs;
 }
 
+static umode_t hwmon_kobj_is_visible(struct kobject *kobj, struct attribute *attr, int n)
+{
+	struct device_attribute *dattr = to_dev_attr(attr);
+	struct hwmon_device_attribute *hattr = to_hwmon_attr(dattr);
+	struct device *dev = kobj_to_dev(kobj);
+	void *drvdata = dev_get_drvdata(dev);
+
+	return hwmon_is_visible(hattr->ops, drvdata, hattr->type, hattr->attr,
+				hattr->index);
+}
+
 static struct device *
 __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 			const struct hwmon_chip_info *chip,
@@ -946,6 +959,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
 		}
 
 		hwdev->group.attrs = attrs;
+		hwdev->group.is_visible = hwmon_kobj_is_visible;
 		ngroups = 0;
 		hwdev->groups[ngroups++] = &hwdev->group;
 
-- 
2.45.2

