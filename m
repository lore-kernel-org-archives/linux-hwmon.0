Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFE9C432BE
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jul 2021 23:21:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5337160F9C
	for <linux-hwmon@archiver.kernel.org>; Tue, 27 Jul 2021 23:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbhG0XVC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 27 Jul 2021 19:21:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233491AbhG0XVA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 27 Jul 2021 19:21:00 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283F8C061757;
        Tue, 27 Jul 2021 16:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=wwaPolakqIKnPjW23xWO20YYGgTPLKQW8ixrvIMU1rY=; b=uTu3XYOfpQqd3skYJ1LRAE9The
        SQvqj5hfuQGlSzdDwsxfji9NNXY2rCy3eOgyZMh72nC1DyaLnI3w0JLwrnjRKlbRJ1IxSm3NjWhuU
        WcF3JkwlSDfVSMt36MUDSjwV8gw3RZIuaYjsXIc+4HRYHe6Q9QLHr0ns2CgDDelqQtzdTXPZLm36O
        StolAHvY/WXJDpa9D68R0t6GdV694HZZ5lzlv5+cD5ExPFOMKMGB3VKcIhvHpPIG+3jCqTbm76U8I
        qK7NePuCOd4R4mDYDG54dG7C0Dkg3GvSLTmbY55EkJY8cnb77ZJxwp2uepfMGwdyGiEe44jLlC+pH
        cywlfHXQ==;
Received: from [2601:1c0:6280:3f0::aefb] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m8WNc-00Ge6m-Po; Tue, 27 Jul 2021 23:20:56 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Navin Sankar Velliangiri <navin@linumiz.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: sht4x: update Documentation for Malformed table
Date:   Tue, 27 Jul 2021 16:20:54 -0700
Message-Id: <20210727232054.7426-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Make top and bottom border lines match.

Documentation/hwmon/sht4x.rst:42: WARNING: Malformed table.
Text in column margin in table line 4.

Fixes: 505c2549373f ("hwmon: Add sht4x Temperature and Humidity Sensor Driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Navin Sankar Velliangiri <navin@linumiz.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
---
Applies to mainline.

 Documentation/hwmon/sht4x.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linext-20210727.orig/Documentation/hwmon/sht4x.rst
+++ linext-20210727/Documentation/hwmon/sht4x.rst
@@ -42,4 +42,4 @@ humidity1_input Measured humidity in %H
 update_interval The minimum interval for polling the sensor,
                 in milliseconds. Writable. Must be at least
                 2000.
-============== =============================================
+=============== ============================================
