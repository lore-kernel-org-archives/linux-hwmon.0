Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F87C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 19 Jan 2022 09:55:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352945AbiASJzC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 19 Jan 2022 04:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352824AbiASJyi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 19 Jan 2022 04:54:38 -0500
Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [IPv6:2001:67c:2050:1::465:111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AECC061574;
        Wed, 19 Jan 2022 01:54:38 -0800 (PST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:105:465:1:1:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4Jf1Fm3Lv0z9sjM;
        Wed, 19 Jan 2022 10:54:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1642586074;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eVaFMeMetbF2chCKkaAP7mGT+Mpn+9qurXFgcY31yEw=;
        b=Wn2z4t0Bynb27/W1kT3sX4oE6Xuve9dyq25J2jYcpbaobAaPsJYsOs1QX5ghn8Gus+GXzo
        X7MmyL6gQXZ8aruFTklwe8GDoUDpG2FVe2ma0qYDHFGgq3iYgUDdToJ9sXw/uR43jyhxFM
        K1yqXcL8xl9JsvHRMZ7PJS6bAr5XWWuygN3y2HuKqWECAip83UD8i21GkuEl5DC5sE7gYm
        lzotMBG6AMzA9f72o/XotVuoYpxIzVJmE9Kup52EN2wytfQn7xXlOsgX8RncAvInUJz8l3
        SOV720WChEjDgP0Boyoq40PFua2EJTlvskQg4Ic9plVHJNU1QyKlB7EtMhCe3Q==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     linux-hwmon@vger.kernel.org
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 1/4] hwmon: (max6639) Update Datasheet URL
Date:   Wed, 19 Jan 2022 10:53:52 +0100
Message-Id: <76025f40d2684dc0d3ec02c8899b726b07a0e7da.1642585539.git.sylv@sylv.io>
In-Reply-To: <cover.1642585539.git.sylv@sylv.io>
References: <cover.1642585539.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The old Datasheet does not exist anymore.

Signed-off-by: Marcello Sylvester Bauer <sylv@sylv.io>
---
 Documentation/hwmon/max6639.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max6639.rst b/Documentation/hwmon/max6639.rst
index 3da54225f83c..c85d285a3489 100644
--- a/Documentation/hwmon/max6639.rst
+++ b/Documentation/hwmon/max6639.rst
@@ -9,7 +9,7 @@ Supported chips:
 
     Addresses scanned: I2C 0x2c, 0x2e, 0x2f
 
-    Datasheet: http://pdfserv.maxim-ic.com/en/ds/MAX6639.pdf
+    Datasheet: https://datasheets.maximintegrated.com/en/ds/MAX6639-MAX6639F.pdf
 
 Authors:
     - He Changqing <hechangqing@semptian.com>
-- 
2.33.1

