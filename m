Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 639EEC4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Feb 2022 12:41:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbiBNMld (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Feb 2022 07:41:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiBNMlc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Feb 2022 07:41:32 -0500
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [IPv6:2001:67c:2050::465:202])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3B341C9;
        Mon, 14 Feb 2022 04:41:22 -0800 (PST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:105:465:1:4:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4Jy3k83bjXz9sQR;
        Mon, 14 Feb 2022 13:41:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1644842478;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QlxYiSQLXtOgUJhWdCR53g7RwR21q6ocLhh0OLfCWng=;
        b=indUhyCVGN3Aj1m3rLW3oo6ZHul1YJYnVRC1ahcOYuMoA9kPgaHUqFxV+46igduhF9UKn1
        Bk/QSzYsf8aEzy/LnsNH90tHVfww2088LR9EFSjO0GWWj1rQB7KqVopBfhSmPo65qTk1BW
        49eDzgjKC/sIr8xJKbCAeJAWNj1m5yXH5Mih3kUEGxJMx9iI3yaiv1W4Ml7MQ2cJTEXaSh
        3APhY2FeSwAlvkP3NhPMFYGeilH78y1RTnBUEnoCHy/FpxlIlw0v3zHYXAeMkmcdysXlUN
        TPFYesUlE6HdyqScJh7vlNvqQInrnPhXdHiUR/ku0hCQbvR5Lb+YHIGJarAriQ==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: add Vicor Corporation
Date:   Mon, 14 Feb 2022 13:40:32 +0100
Message-Id: <d000eb43e403f1bd4a94141b94f68305b4965a33.1644834803.git.sylv@sylv.io>
In-Reply-To: <cover.1644834803.git.sylv@sylv.io>
References: <cover.1644834803.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add vendor prefix for Vicor Corporation.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 294093d45a23..047a83a089ce 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1298,6 +1298,8 @@ patternProperties:
     description: Vertexcom Technologies, Inc.
   "^via,.*":
     description: VIA Technologies, Inc.
+  "^vicor,.*":
+    description: Vicor Corporation
   "^videostrong,.*":
     description: Videostrong Technology Co., Ltd.
   "^virtio,.*":
-- 
2.34.1

