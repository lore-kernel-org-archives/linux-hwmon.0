Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB57BC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 16 Dec 2022 20:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231950AbiLPU0t (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 16 Dec 2022 15:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231959AbiLPU0r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Dec 2022 15:26:47 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267EC264B5
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Dec 2022 12:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671222358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kO1kFNElmiazijaeVmClgAjGGa3reOuDHRabVz/YO1k=;
        b=THwjS2vsxgJM/jSlaOyi/oxN368f5XCb0H0Ip1a8JbWSB4MV036I7esXHfFUbA46Tn2FNm
        OLhtvVXjclWuNGbOY4MP5XtHdBuWo7XAaQ8RM7TTYNqoFEeMBwl4VttikcknPJLbrkyVBi
        2vVNQoXziWrvwTi6qMJv4ieEFYfyNTc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-WLYL5WUlM4OrgTcuyZvtoA-1; Fri, 16 Dec 2022 15:25:56 -0500
X-MC-Unique: WLYL5WUlM4OrgTcuyZvtoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8B5C3815D38;
        Fri, 16 Dec 2022 20:25:55 +0000 (UTC)
Received: from tpad.localdomain (ovpn-112-2.gru2.redhat.com [10.97.112.2])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D27E40C6EC4;
        Fri, 16 Dec 2022 20:25:55 +0000 (UTC)
Received: by tpad.localdomain (Postfix, from userid 1000)
        id A290F403B5B80; Fri, 16 Dec 2022 17:24:08 -0300 (-03)
Date:   Fri, 16 Dec 2022 17:24:08 -0300
From:   Marcelo Tosatti <mtosatti@redhat.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Fenghua Yu <fenghua.yu@intel.com>, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Frederic Weisbecker <frederic@kernel.org>
Subject: [PATCH v3] hwmon: coretemp: avoid RDMSR interruptions to isolated
 CPUs
Message-ID: <Y5zT6B1mY9/pnwJV@tpad>
References: <Y5sWMEG0xCl9bgEi@tpad>
 <68f76ac7-5edd-d437-8bef-e233f2876660@roeck-us.net>
 <Y5x7hXGGLkcmejKq@tpad>
 <34dc4244-4e62-0b73-b6f9-430e4ee1a1e6@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <34dc4244-4e62-0b73-b6f9-430e4ee1a1e6@roeck-us.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


The coretemp driver uses rdmsr_on_cpu calls to read
MSR_IA32_PACKAGE_THERM_STATUS/MSR_IA32_THERM_STATUS registers,
which contain information about current core temperature.

For certain low latency applications, the RDMSR interruption exceeds
the applications requirements.

So do not create core files in sysfs, for CPUs which have
isolation and nohz_full enabled.

Temperature information from the housekeeping cores should be
sufficient to infer die temperature.

Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>

---
v3: do not create sysfs files for isolated CPUs (Guenter Roeck)
v2: improve changelog to mention that an error is returned,
     and sysfs file is not disabled (Guenter Roeck)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 9bee4d33fbdf..619dfde7a712 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -27,6 +27,7 @@
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/cpu_device_id.h>
+#include <linux/sched/isolation.h>
 
 #define DRVNAME	"coretemp"
 
@@ -458,6 +459,9 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
 	u32 eax, edx;
 	int err, index, attr_no;
 
+	if (!housekeeping_cpu(cpu, HK_TYPE_MISC))
+		return 0;
+
 	/*
 	 * Find attr number for sysfs:
 	 * We map the attr number to core id of the CPU

