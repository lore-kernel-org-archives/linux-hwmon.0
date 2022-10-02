Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 487E2C433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  2 Oct 2022 17:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiJBRp7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 2 Oct 2022 13:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229864AbiJBRp6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Oct 2022 13:45:58 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC210357DE
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Oct 2022 10:45:57 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 3E484240027
        for <linux-hwmon@vger.kernel.org>; Sun,  2 Oct 2022 19:45:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1664732756; bh=rs5BvjYOnRGkN21oKEOgi0EGpHfW/vb2zIpq+/tU4Wo=;
        h=Date:From:To:Cc:Subject:From;
        b=MkalJgJGHZA2gl1YIdfWZ1xQZjcmxVlzYHLwbM8F8oIPnB89KcdG7KOxw+x1BDoud
         EDOwu8dy7Q2w7XWh3lf2rM5pGRxXfHDZ+dzmTIGL+Brfa86hr3gZArP724Bvak/i5o
         +l5kHkqOybXPWlnze0K5SG1jRrR4JqoNLDlWo37z7Q73KMV9NLZFjYdMm44ImeTtUE
         j50/I76sYX3pUl2pgqCI07QEEGhI4dLLKTIShmW8EZXWgAUJWSU5Io0eS6h/ILJzVW
         2FNnr7qXJ7DyXG6J3DFYX4mNt4kAD2rZCXC/3kxcDnMD6/osvDDyZzlUrk4RUoW7WV
         15LOAINqLehow==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4MgWbQ6CSbz6tnp;
        Sun,  2 Oct 2022 19:45:54 +0200 (CEST)
Date:   Sun,  2 Oct 2022 17:45:53 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: corsair-psu: add USB id of new revision of the
 HX1000i psu
Message-ID: <YznOUQ7Pijedu0NW@monster.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Also updates the documentation accordingly.

Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
---
 Documentation/hwmon/corsair-psu.rst | 2 +-
 drivers/hwmon/corsair-psu.c         | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
index c3a76305c587..3c1b164eb3c0 100644
--- a/Documentation/hwmon/corsair-psu.rst
+++ b/Documentation/hwmon/corsair-psu.rst
@@ -15,7 +15,7 @@ Supported devices:
 
   Corsair HX850i
 
-  Corsair HX1000i
+  Corsair HX1000i (revision 1 and 2)
 
   Corsair HX1200i
 
diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index c99e4c6afc2d..345d883ab044 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -813,13 +813,14 @@ static const struct hid_device_id corsairpsu_idtable[] = {
 	{ HID_USB_DEVICE(0x1b1c, 0x1c04) }, /* Corsair HX650i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c05) }, /* Corsair HX750i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c06) }, /* Corsair HX850i */
-	{ HID_USB_DEVICE(0x1b1c, 0x1c07) }, /* Corsair HX1000i */
+	{ HID_USB_DEVICE(0x1b1c, 0x1c07) }, /* Corsair HX1000i revision 1 */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c08) }, /* Corsair HX1200i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c09) }, /* Corsair RM550i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0a) }, /* Corsair RM650i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0b) }, /* Corsair RM750i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0c) }, /* Corsair RM850i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0d) }, /* Corsair RM1000i */
+	{ HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsaur HX1000i revision 2 */
 	{ },
 };
 MODULE_DEVICE_TABLE(hid, corsairpsu_idtable);
-- 
2.37.3

