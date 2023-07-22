Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9DBC0015E
	for <linux-hwmon@archiver.kernel.org>; Sat, 22 Jul 2023 18:16:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjGVSQf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 22 Jul 2023 14:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjGVSQc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 22 Jul 2023 14:16:32 -0400
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 737A41BB
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Jul 2023 11:16:30 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1690049789; x=1690056989; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Subject: Cc: To: To:
 From: From: Sender: Sender; bh=KTX5c2W9IC0se4k6UfvNshruBo0qc1MufVYnBdWH05Q=;
 b=lLFzIWw0nQLkUKZwVRv0AakQgFi6o91BfdmdkSXozSt9zP6o0j8Sq6I+5CXzc/s5xIKkIllljSPtUcEy8YRoLl4dCQLSc7QXZpSuYoqMpbYZ00cR7ZuQH1a8sO13AGc/UkV4Wh0pOJg5EhGHNsfF0sMVgOdpHYvrxkW2e6VQwlfFwFwxQeQWlYcge1AuJdJINPbIJyGh961PSBhOqO60B5gbPqEkQdtzrgG9qMFckbRajN2HbiMNDMoFbp+QEIUYfHtwdSFF/VBGJBmWz3sBrsO3PhKw1PMWtN5/MSI/j+yGv9bSt1LeiNYuVu4Z6TWAD3RyduOxnP3hg2ynr8AgRw==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 34081948f2f3 with SMTP id
 64bc11259b55128dd86df009 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Jul 2023 17:25:57 GMT
Sender: james@equiv.tech
From:   James Seo <james@equiv.tech>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     James Seo <james@equiv.tech>, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: hp-wmi-sensors: Get WMI instance count from WMI driver core
Date:   Sat, 22 Jul 2023 10:25:13 -0700
Message-Id: <20230722172513.9324-2-james@equiv.tech>
In-Reply-To: <20230722172513.9324-1-james@equiv.tech>
References: <20230722172513.9324-1-james@equiv.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

2a2b13ae50cf ("platform/x86: wmi: Allow retrieving the number of WMI
object instances") means we no longer need to find this ourselves.

Signed-off-by: James Seo <james@equiv.tech>
---
 drivers/hwmon/hp-wmi-sensors.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index ebe2fb513480..3a99cc5f44b2 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -435,25 +435,11 @@ static union acpi_object *hp_wmi_get_wobj(const char *guid, u8 instance)
 /* hp_wmi_wobj_instance_count - find count of WMI object instances */
 static u8 hp_wmi_wobj_instance_count(const char *guid)
 {
-	u8 hi = HP_WMI_MAX_INSTANCES;
-	union acpi_object *wobj;
-	u8 lo = 0;
-	u8 mid;
-
-	while (lo < hi) {
-		mid = (lo + hi) / 2;
-
-		wobj = hp_wmi_get_wobj(guid, mid);
-		if (!wobj) {
-			hi = mid;
-			continue;
-		}
+	int count;
 
-		lo = mid + 1;
-		kfree(wobj);
-	}
+	count = wmi_instance_count(guid);
 
-	return lo;
+	return clamp(count, 0, (int)HP_WMI_MAX_INSTANCES);
 }
 
 static int check_wobj(const union acpi_object *wobj,
-- 
2.39.2

