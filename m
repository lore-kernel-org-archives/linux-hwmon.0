Return-Path: <SRS0=vn3F=73=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E29C433E0
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Jun 2020 03:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4042B207CD
	for <linux-hwmon@archiver.kernel.org>; Sun, 14 Jun 2020 03:38:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="ct5nHHcd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgFNDiG (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 13 Jun 2020 23:38:06 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:45536 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726672AbgFNDiG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Jun 2020 23:38:06 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49l0Xs3Yh4z9vJs7
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Jun 2020 03:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6zqhLICQir2X for <linux-hwmon@vger.kernel.org>;
        Sat, 13 Jun 2020 22:38:05 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49l0Xs1t8bz9vJrG
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Jun 2020 22:38:05 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49l0Xs1t8bz9vJrG
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49l0Xs1t8bz9vJrG
Received: by mail-io1-f72.google.com with SMTP id v14so8999675iob.11
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Jun 2020 20:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=91lGP7Wm5pq1CQ7Bg1oytLRkqvicw3GL0Dm9LTiHqDc=;
        b=ct5nHHcdYMCKCiWoBbUARbNzAur3vf0CYMr+Rvpk0MrDZYxJXqT1Owpf18E0yET9Gl
         zkiV7FxQUV0AP1NEvResL1EywEJvMnUnfkx7f6EvX3i4d4D7VdDmtL+7N1eHH1AntDJ2
         taWgC94IiGcHWkydgK4S+S1gNzCV6oUWz80INIJnPil4cYWu3E4m8ae4w+Ky1B/o03v9
         2dSoMjp11+Qx6JpbSG1fDyhgxwoG9D+FIeI7XCNqMUeEQi2MuPqn2+psmrZRxxHtGa7T
         LPF6jzXGQpAiFl5/HS1DJOiNX/szqIeIOwuZeGsbMc/5xico7D21HEjY45325Okz7gk2
         MhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=91lGP7Wm5pq1CQ7Bg1oytLRkqvicw3GL0Dm9LTiHqDc=;
        b=QASz3pwV3ObQRbnbhDjH6hPC5ZZDrjzdOWEuz7jLk84GTNsQmZ+l2bqNXnfspYnSPh
         V/sdS0YQSa1+X/Mt1eH//JzUGNYMEr/wIJdONHk2G/mgYhqDK9mgmalBzn21sgft4SZA
         9jyzUK2MrWuARBth6n4LBZ6R5gRBlXXpWMkGw45yWYcXBFLqUBxj261X/O5R4DBwwVcT
         djPyC+2SoXB6Srb1gR2ODRR3I72kaK5V/FzBALTZV+USR2G0T62Wc2/kVRISI4K9VEka
         2CHHOtgXmTL5BQYovxl6poiOc6DwpiCypucsVE4ABOpX+FGqgpIwJ8rzxQjt74zxmW3K
         Vvqw==
X-Gm-Message-State: AOAM532ZsKSlsDcoGPQtAV3wmBjvRUzYcsj4CeJaF2OQ+GrPqJxhHgfC
        ZQbPOsZfdJOXMr9ZY06ER1jC3QR4LTYLCt5JEaHJ/o0ApH4zejnUzIwZXYsZ7oHTjxw+yci7C3q
        IRmOj7TvE/AHenv9zxkQX7JrkG6M=
X-Received: by 2002:a92:a1d1:: with SMTP id b78mr20450143ill.164.1592105884955;
        Sat, 13 Jun 2020 20:38:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJww1eonvnaCOekQgzTdb6G1q1H6ZKGwXudCnj0NSw0ZRX67Te36TMNJFGt9HxX/OEiMvYqCZg==
X-Received: by 2002:a92:a1d1:: with SMTP id b78mr20450136ill.164.1592105884813;
        Sat, 13 Jun 2020 20:38:04 -0700 (PDT)
Received: from syssec1.cs.umn.edu ([2607:ea00:101:3c74:49fa:9c47:e40b:9c40])
        by smtp.gmail.com with ESMTPSA id k185sm5862775ilk.16.2020.06.13.20.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 20:38:04 -0700 (PDT)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, wu000273@umn.edu, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (ina3221) Fix reference count leak in ina3221_write_enable
Date:   Sat, 13 Jun 2020 22:38:03 -0500
Message-Id: <20200614033803.129922-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

ina3221_write_enable() calls pm_runtime_get_sync() that increments
the reference counter. In case of failure, decrement the reference
count and return the error.

Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 drivers/hwmon/ina3221.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index f335d0cb0c77..9a3b46160de1 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -492,6 +492,7 @@ static int ina3221_write_enable(struct device *dev, int channel, bool enable)
 		ret = pm_runtime_get_sync(ina->pm_dev);
 		if (ret < 0) {
 			dev_err(dev, "Failed to get PM runtime\n");
+			pm_runtime_put_sync(ina->pm_dev);
 			return ret;
 		}
 	}
-- 
2.25.1

