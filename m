Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D68AC4332F
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Dec 2022 12:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiLOMrO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Dec 2022 07:47:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229899AbiLOMqd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Dec 2022 07:46:33 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C51E932BA7
        for <linux-hwmon@vger.kernel.org>; Thu, 15 Dec 2022 04:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671108240;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=f/TLVNnRLwvO822nGsYI0P3m2dy78HMtEXDUfQIOSkg=;
        b=VDyYUsKQtte83sHD6b7e23rZvKnQFisM31NrXLMVdusp+O9tyk+MKT9QCz7t3G/97ZRdjy
        tVRi3fURXmP6rEtnaYCZS6Xbwoi42O1DSX++gu7ACdYTrboFDS8xO13XCWAikplo1Zl49L
        RgRz5SNZ/xmSWDy0A1lu5NVe0eWs+TQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-595-w-sJ6HzoN2OKJc2tTi5yEw-1; Thu, 15 Dec 2022 07:43:50 -0500
X-MC-Unique: w-sJ6HzoN2OKJc2tTi5yEw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7C373806072;
        Thu, 15 Dec 2022 12:43:49 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 79E51175AD;
        Thu, 15 Dec 2022 12:43:49 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
        id E42574041664A; Thu, 15 Dec 2022 09:42:24 -0300 (-03)
Date:   Thu, 15 Dec 2022 09:42:24 -0300
From:   Marcelo Tosatti <mtosatti@redhat.com>
To:     Fenghua Yu <fenghua.yu@intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH] hwmon: coretemp: avoid RDMSR interruptions to isolated CPUs
Message-ID: <Y5sWMEG0xCl9bgEi@tpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


The coretemp driver uses rdmsr_on_cpu calls to read
MSR_IA32_PACKAGE_THERM_STATUS/MSR_IA32_THERM_STATUS registers,
which contain information about current core temperature.

For certain low latency applications, the RDMSR interruption exceeds    
the applications requirements.

So disable reading of crit_alarm and temp files via /sys, in case
CPU isolation is enabled.

Temperature information from the housekeeping cores should be
sufficient to infer die temperature.

Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

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




