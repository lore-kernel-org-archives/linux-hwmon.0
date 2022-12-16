Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C933C54E76
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Dec 2022 16:39:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbiLPQjP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Dec 2022 11:39:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231630AbiLPQif (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Dec 2022 11:38:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 305782DAB9
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Dec 2022 08:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671208671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=iYWX1JVBYSUKLXVYpGQr+eXLajFPQi0WiXT4Nb6R2Yo=;
        b=WtQXesfmWvejS4fdTRKzgSThuT8T5JnGPdx12IrJCJ4V4Kv/jclTQnsxtLNeelm6BaBIGY
        qf+D21btTHhPIq3nRXb/t7kXoigd/5gt6WP64sQVN6ZU8symk8iyQHpJjgOv356QXlq+5g
        CPnn7B3ffW5LLE2QEP0DM0o20Yu/rEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-CI_Xdn4APQSUGfk2Kx0WoQ-1; Fri, 16 Dec 2022 11:37:48 -0500
X-MC-Unique: CI_Xdn4APQSUGfk2Kx0WoQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71487857F82;
        Fri, 16 Dec 2022 16:37:47 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-3.gru2.redhat.com [10.97.112.3])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 45A451401C34;
        Fri, 16 Dec 2022 16:37:47 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
        id 66F9B40416677; Fri, 16 Dec 2022 11:07:01 -0300 (-03)
Date:   Fri, 16 Dec 2022 11:07:01 -0300
From:   Marcelo Tosatti <mtosatti@redhat.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Fenghua Yu <fenghua.yu@intel.com>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH v2] hwmon: coretemp: avoid RDMSR interruptions to isolated
 CPUs
Message-ID: <Y5x7hXGGLkcmejKq@tpad>
References: <Y5sWMEG0xCl9bgEi@tpad>
 <68f76ac7-5edd-d437-8bef-e233f2876660@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68f76ac7-5edd-d437-8bef-e233f2876660@roeck-us.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


The coretemp driver uses rdmsr_on_cpu calls to read
MSR_IA32_PACKAGE_THERM_STATUS/MSR_IA32_THERM_STATUS registers,
which contain information about current core temperature.

For certain low latency applications, the RDMSR interruption exceeds
the applications requirements.

So disallow reading of crit_alarm and temp files via /sys, returning 
-EINVAL, in case CPU isolation is enabled.

Temperature information from the housekeeping cores should be
sufficient to infer die temperature.

Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

---
v2: improve changelog to mention that an error is returned,
    and sysfs file is not disabled (Guenter Roeck)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 9bee4d33fbdf..30a35f4130d5 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -27,6 +27,7 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/cpu_device_id.h>
+#include <linux/sched/isolation.h>
 
 #define DRVNAME	"coretemp"
 
@@ -121,6 +122,10 @@ static ssize_t show_crit_alarm(struct device *dev,
 	struct platform_data *pdata = dev_get_drvdata(dev);
 	struct temp_data *tdata = pdata->core_data[attr->index];
 
+
+	if (!housekeeping_cpu(tdata->cpu, HK_TYPE_MISC))
+		return -EINVAL;
+
 	mutex_lock(&tdata->update_lock);
 	rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
 	mutex_unlock(&tdata->update_lock);
@@ -158,6 +163,8 @@ static ssize_t show_temp(struct device *dev,
 
 	/* Check whether the time interval has elapsed */
 	if (!tdata->valid || time_after(jiffies, tdata->last_updated + HZ)) {
+		if (!housekeeping_cpu(tdata->cpu, HK_TYPE_MISC))
+			return -EINVAL;
 		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
 		/*
 		 * Ignore the valid bit. In all observed cases the register




