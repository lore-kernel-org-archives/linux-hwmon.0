Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0830BC2D0A3
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 09:57:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D36D22227
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Nov 2020 09:57:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bdUZdwS1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbgKLJ5d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Nov 2020 04:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726671AbgKLJ5X (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Nov 2020 04:57:23 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC2BC0613D1
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 01:57:22 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id o15so5321229wru.6
        for <linux-hwmon@vger.kernel.org>; Thu, 12 Nov 2020 01:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iYp4liH6QtuFMXY8fnKB9zBXABbAMYcv+7gF3AlAZms=;
        b=bdUZdwS1oHyphT4MiY5fuJuSHleFsAMvbaM8db1XRxOT716qg1IRdUoVmUzFlpT+nG
         9gCJlWNx2qumzMjuLRaz6pMapA8jN5KX/onENKyLqd8fmWQVqlLv37M7yNBMdHrkRG8m
         Ce5OzzdiOlLVY5UjDV4pXwSRUItbhrlVDg2LMZJkR3fMJMD8oE5J2qgMS78nCx1CGaSu
         QH/hVQwngfaP/pn80wu7WMQGUpJEHXNzTqFbiT4wzU+ewGsAccit57KiJOKZopKSq/eF
         f1X0STlN0+kct9AkS2v16Wwuo7yx6CR8xbmba8GcKm/9xfrIrx5jEKCM+6P7rSDFqHZO
         l/sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iYp4liH6QtuFMXY8fnKB9zBXABbAMYcv+7gF3AlAZms=;
        b=E9tF5uXps+P3QDxmL7e4vIsxt25NgJpMBIGSYLAj6A0qnKihlJ7PtZGr3caQlblcGo
         /8+/NTswZj8bEMIf8FqaXglyhhCGfJZ6O1+Je54XzG40RghktKoj5PJVQN7pExA1lvA9
         wXC9+Vioc+Vrps31EOpb4YaxdRZX6KGGjnlsL874mgaWvAjSSkNk5Fg2+dFY39EsMu0D
         6lPOddkfaEvJZi6HxUzR6v79egi8gbgM9ER8D5KxigH0erOHfksrubN4J80M1t4+Riqp
         VeKL319ez0HKcaJfQgNfOHZhUew/BIZYGSxR8LPvMkyHUq0eHI7yUwffpBU4tDoxIo5c
         RMEA==
X-Gm-Message-State: AOAM530RGXs7KP/ZZLj5rK5PLIBxblrvj1dCxhVdWmzQFTiAuTtrcf/U
        5KpZPZBey7F6tKx4UxsZdN5TUw==
X-Google-Smtp-Source: ABdhPJxKfGioiUbjQWMEIpOjWDSlwsWsdf+ZB/gdqtMiJ065DaMLD1p6GwzO8zDSAzKlSqTxRNVq+Q==
X-Received: by 2002:a5d:488b:: with SMTP id g11mr20538303wrq.210.1605175041676;
        Thu, 12 Nov 2020 01:57:21 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n15sm6138792wrq.48.2020.11.12.01.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 01:57:20 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Neelesh Gupta <neelegup@linux.vnet.ibm.com>,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] hwmon: ibmpowernv: Silence strncpy() warning
Date:   Thu, 12 Nov 2020 09:57:15 +0000
Message-Id: <20201112095715.1993117-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112095715.1993117-1-lee.jones@linaro.org>
References: <20201112095715.1993117-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 from drivers/hwmon/ibmpowernv.c:11:
 In function ‘strncpy’,
 inlined from ‘get_sensor_index_attr’ at drivers/hwmon/ibmpowernv.c:243:2,
 inlined from ‘create_device_attrs’ at drivers/hwmon/ibmpowernv.c:280:8:
 include/linux/string.h:297:30: warning: ‘__builtin_strncpy’ specified bound 32 equals destination size [-Wstringop-truncation]
 297 | #define __underlying_strncpy __builtin_strncpy
 | ^
 include/linux/string.h:307:9: note: in expansion of macro ‘__underlying_strncpy’
 307 | return __underlying_strncpy(p, q, size);
 | ^~~~~~~~~~~~~~~~~~~~

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Neelesh Gupta <neelegup@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/hwmon/ibmpowernv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index a750647e66a47..8e3724728cce0 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -240,7 +240,7 @@ static int get_sensor_index_attr(const char *name, u32 *index, char *attr)
 	if (err)
 		return err;
 
-	strncpy(attr, dash_pos + 1, MAX_ATTR_LEN);
+	strscpy(attr, dash_pos + 1, MAX_ATTR_LEN);
 
 	return 0;
 }
-- 
2.25.1

