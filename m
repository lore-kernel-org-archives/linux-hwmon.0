Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D7AC433FE
	for <linux-hwmon@archiver.kernel.org>; Mon,  3 Oct 2022 09:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbiJCJJP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 3 Oct 2022 05:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231358AbiJCJIg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 3 Oct 2022 05:08:36 -0400
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C354EA1B2
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 02:05:30 -0700 (PDT)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 5581D24003A
        for <linux-hwmon@vger.kernel.org>; Mon,  3 Oct 2022 11:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1664787929; bh=s/lz8yEhIi8Y66NtoBViO8U2tbhENPAY1jvLybbwX6U=;
        h=Date:From:To:Cc:Subject:From;
        b=ISr+K5235OYD1w4UpFB8Q/eGw7YlnNBLwXxGMZ14FVCdx1jg8AiisCptBlNUmpo7l
         n8Jp5l+1sjl+ZeffxGupoDUnCzc46lDSp/l00DOvGV7q7veDLE7/9eAqmt3mkMPYeF
         XNIyF2H0uSjXluhH6HLnZqyUF8hL5QnGGcQnhAbiOQglDnUEnggC7ei3if5ncStrQA
         5JnE7SRYxYaApSFwcgzq84fx1QiLzWH1MRLqDu+N1GCkGXKqgxALrkFTRqYR9wQM54
         yIabL6HKMbwCg6PPVWM2XaeyPaIlAfEI7FdpLBFSd88Ag16EWLd0lojiTPGT0/mC0q
         Lxe4R2laa9ijA==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4Mgw0S4dQSz9rxP;
        Mon,  3 Oct 2022 11:05:28 +0200 (CEST)
Date:   Mon,  3 Oct 2022 09:05:27 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     linux-kernel@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: corsair-psu: fix typo in USB id description
Message-ID: <Yzql13NOvQLlrye1@monster.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fixes: 0cf46a653bda ("hwmon: (corsair-psu) add USB id of new revision of the HX1000i psu")
Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
---
 drivers/hwmon/corsair-psu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 345d883ab044..c1c27e475f6d 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -820,7 +820,7 @@ static const struct hid_device_id corsairpsu_idtable[] = {
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0b) }, /* Corsair RM750i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0c) }, /* Corsair RM850i */
 	{ HID_USB_DEVICE(0x1b1c, 0x1c0d) }, /* Corsair RM1000i */
-	{ HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsaur HX1000i revision 2 */
+	{ HID_USB_DEVICE(0x1b1c, 0x1c1e) }, /* Corsair HX1000i revision 2 */
 	{ },
 };
 MODULE_DEVICE_TABLE(hid, corsairpsu_idtable);
-- 
2.37.3

