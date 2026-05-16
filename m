Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF1381B0A
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 11:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778931788; cv=none; b=gcGnSTs2826IoO8xq6s5GIidGf7J9fZAyRctp58Vv5jQD+PQbyKgihN763kScRTVnZ3LQeQeUZUlmu3EVXen/vHJxnSrmAt0ysLY5Ql2i94/Ugujzb8wSWDXvk1pN6B0XSaT6ktvzjE3ex4Vup7MDEPbrc3LPV1FywdDrtIaOro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778931788; c=relaxed/simple;
	bh=9jWBSfBp/h7U+oUFnIJxGIferw1jvb7ywWogRjb/o4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNWJJxm8h8v3XkAxhAKyzh3KrpMZKnCuAeD5adOTgB5AqmMiEPX1/Bdpl/vIzRvu4dihRYVkRr6ubOyUwsXtt3hj/EETEr2I/z58ZFNc7oEWWlQQZ5m6UoPHRGBrBtwVleZwgtFBwmCnh897bzlNgZ+W6MkptbZwTuMjKYZpvHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9INxseh; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9INxseh"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so575260f8f.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 04:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778931785; x=1779536585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUW7YUhvmehntUxy/Vex81kO1TCE1eW63dKceFl28uM=;
        b=H9INxsehRrygGJIxSocR6zJvhs/idvkHtccW6/+qFR6CYlWsoXcw0aryRdonjBSF5S
         6Vn+i+lix8fQOiyJZfQMJMPIAStCMvR0Z699FhxOZ6103pOMNVw+cSjT6pgX8ozXCgDC
         B46roUbPg0s7/wjEn96ZrIidPzPE7ggZiBmHFGIEAP5Kssef4IPueP+PQLLmLVhYNaDz
         XATkGg2uBUe/Y03HdBQSqxvlaGa9SequJWYKo03RWP74KqNw2TFWT7N7Kg/ZDPVdumFr
         OsaY7erRC2wMMXXmZSLgIybuTCFpAKm4NPQScGpnKtDbfHRCobZVfIT0x2iuN0Mm9G7A
         u7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778931785; x=1779536585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QUW7YUhvmehntUxy/Vex81kO1TCE1eW63dKceFl28uM=;
        b=FXOQd2NHbKRwr2FJXQRMBMtbw+h6OHmwqrrqXXK5JuyPAdi2NNwqZLJej+ALaPA8uv
         N8RAK2DEb8399ke/nsoFcob5+aTxjeRHPfIsN78waGi6a2AVv9RFKgW2S2u8O5cD9b6Y
         VzuPWgnxUEQy0VYZgpUt6gW61G58RVzOgtEtQJ5k3WvLbsMNxoEAS54XgYeZ9jJfVfWC
         zwYCw0Xu79d0UISmt5Lta1/5qKM6T/tnZ0/KgwKMc6gKOOhGl0QU2EWmz+2GJwM5hSZd
         hSSbJdEad9oUrdH1Aieyf9DYRycraW/jiR7ReMOCejDCY8kOEQcTS+xMxswkCs6tS8FF
         KLtQ==
X-Gm-Message-State: AOJu0Yy5dNTuZNnxrvFtTCK5xkatevLOLXYlX7Httva577xkfIVwTJYx
	jVKEdyS+MBKW707B09zxh4p7LOEW/beI5cN47o/eSAen90Tj07A+te/MbXJnw39J
X-Gm-Gg: Acq92OGVdFUoHT5TGT0tlM8m1DVu93jaug7w4ffpM/S5cOqOC2+qGb6YBpeUXc9JhEM
	jUDIpz0UtgoiAyJp/2MKNqISNs7FwfNmvKcVwrbxdDn8CNlxYw16TLQ7qjVg/qEyG20O1gHmYNk
	Fvob0+x/b7DQ6ydeA8e4oCUa+eIFwAFtO9PB1y+QTzv61xQ7rUS2AjGwKmEnrqPsrCykNb3uV9F
	k0MrkkxcobfRf/Ju6VmSf83kf7AnKs7TUib4a4UzaDRKqC/opzgxbUewl/PGb79GBaXVYUwWsaI
	DUac9Z4QDG1QBNxsfgJq8gtbX7QAicdRkX34Dooyb3c9SHnx7L19FJdFjSyalcTbULws+avNnka
	yiDsi2zG8zRBuk/kdrAJkpyjwWOX+nigGAZ+ptGJghp4jbwJ/rZY05wolijeQdsqJwPo2frxq2+
	bODOLdFPei+0wvJ5z8noyxIShfQ5yUINTbZVh+eWQ1xbCfn1Qa3QdpoRYpcm67kf1ba3AZeQGPE
	mBwl3z0zhBLkQ==
X-Received: by 2002:a05:6000:2503:b0:43f:e43a:f4a6 with SMTP id ffacd0b85a97d-45e5c35e7bdmr10631647f8f.6.1778931785137;
        Sat, 16 May 2026 04:43:05 -0700 (PDT)
Received: from arch (mm-28-201-122-178.mgts.dynamic.pppoe.byfly.by. [178.122.201.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45e6a135f0csm3914941f8f.27.2026.05.16.04.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:43:04 -0700 (PDT)
From: bakshansky.lists@gmail.com
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	Roman Bakshansky <bakshansky.lists@gmail.com>
Subject: [PATCH 2/2] hwmon: (coretemp) fix coding style issues
Date: Sat, 16 May 2026 14:42:53 +0300
Message-ID: <20260516114253.5466-3-bakshansky.lists@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516114253.5466-1-bakshansky.lists@gmail.com>
References: <20260516114253.5466-1-bakshansky.lists@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Roman Bakshansky <bakshansky.lists@gmail.com>

Address several coding style warnings reported by checkpatch.pl:
- Replace <asm/processor.h> with <linux/processor.h>
- Add missing blank lines after declarations
- Combine split quoted strings
- Reorder __initconst placement

No functional change.

Signed-off-by: Roman Bakshansky <bakshansky.lists@gmail.com>
---
 drivers/hwmon/coretemp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index c722b1d8e480..a79c2d65a2be 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -25,7 +25,7 @@
 #include <linux/moduleparam.h>
 #include <linux/pci.h>
 #include <asm/msr.h>
-#include <asm/processor.h>
+#include <linux/processor.h>
 #include <asm/cpu_device_id.h>
 #include <linux/sched/isolation.h>
 
@@ -200,6 +200,7 @@ static int adjust_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
 
 	for (i = 0; i < ARRAY_SIZE(tjmax_model_table); i++) {
 		const struct tjmax_model *tm = &tjmax_model_table[i];
+
 		if (c->x86_vfm == tm->vfm &&
 		    (tm->stepping_mask == ANY ||
 		     tm->stepping_mask == c->x86_stepping))
@@ -222,8 +223,7 @@ static int adjust_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
 		err = rdmsr_safe_on_cpu(id, 0x17, &eax, &edx);
 		if (err) {
 			dev_warn(dev,
-				 "Unable to access MSR 0x17, assuming desktop"
-				 " CPU\n");
+				 "Unable to access MSR 0x17, assuming desktop CPU\n");
 			usemsr_ee = 0;
 		} else if (c->x86_vfm < INTEL_CORE2_PENRYN &&
 			   !(eax & 0x10000000)) {
@@ -257,8 +257,7 @@ static int adjust_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
 		err = rdmsr_safe_on_cpu(id, 0xee, &eax, &edx);
 		if (err) {
 			dev_warn(dev,
-				 "Unable to access MSR 0xEE, for Tjmax, left"
-				 " at default\n");
+				 "Unable to access MSR 0xEE, for Tjmax, left at default\n");
 		} else if (eax & 0x40000000) {
 			tjmax = tjmax_ee;
 		}
@@ -424,6 +423,7 @@ static ssize_t show_temp(struct device *dev,
 static int create_core_attrs(struct temp_data *tdata, struct device *dev)
 {
 	int i;
+
 	static ssize_t (*const rd_ptr[TOTAL_ATTRS]) (struct device *dev,
 			struct device_attribute *devattr, char *buf) = {
 			show_label, show_crit_alarm, show_temp, show_tjmax,
@@ -774,7 +774,7 @@ static int coretemp_cpu_offline(unsigned int cpu)
 	}
 	return 0;
 }
-static const struct x86_cpu_id __initconst coretemp_ids[] = {
+static const struct x86_cpu_id coretemp_ids[] __initconst = {
 	X86_MATCH_VENDOR_FEATURE(INTEL, X86_FEATURE_DTHERM, NULL),
 	{}
 };
-- 
2.53.0

