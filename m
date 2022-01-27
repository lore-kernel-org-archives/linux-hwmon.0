Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6024C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 16:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238147AbiA0QRq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 11:17:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238263AbiA0QRo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 11:17:44 -0500
Received: from mout-y-209.mailbox.org (mout-y-209.mailbox.org [IPv6:2001:67c:2050:1::465:209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5666CC06173B;
        Thu, 27 Jan 2022 08:17:44 -0800 (PST)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:105:465:1:4:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-y-209.mailbox.org (Postfix) with ESMTPS id 4Jl5N653FVz9sS0;
        Thu, 27 Jan 2022 17:17:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1643300260;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=E5BL/WaisGFQOBCSiBa0uR1Z51LZ35nUt4xgeawRYiE=;
        b=iAOdOxFMrTDDiqG2559j7AWRZ70Dhd+bymQnLv3YgW/RcrZiK5poJ2Q4vn+xVXrvd7nz3/
        G1jRXExSoypg8yBmeYdybZE+sbTjvOv7ai7SA5GsLF86V452xG698blvpLSkbXGxE27VWI
        GiORja+A78MBqbLdScajbiUbn7MunjQRo4bmybX+wEjZH0imbiUlTSS8EpWTSy2zIgrOgm
        3J4Dd+YnIx86a/FTYpdslMjoOCp6mnEuLzFnwMj0yLujOIUaCcIKSxBSfgWWit2cVYnqvv
        Mzcsw55T6Pd6GtsWlKE/hv3lNeYodjTkvl+5hzbzuB63xMZIEO3JJ4i5435KIQ==
From:   Marcello Sylvester Bauer <sylv@sylv.io>
To:     linux-hwmon@vger.kernel.org
Cc:     Marcello Sylvester Bauer <sylv@sylv.io>,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v4 1/4] hwmon: (max6639) Update Datasheet URL
Date:   Thu, 27 Jan 2022 17:17:27 +0100
Message-Id: <76025f40d2684dc0d3ec02c8899b726b07a0e7da.1643299570.git.sylv@sylv.io>
In-Reply-To: <cover.1643299570.git.sylv@sylv.io>
References: <cover.1643299570.git.sylv@sylv.io>
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
2.34.1

