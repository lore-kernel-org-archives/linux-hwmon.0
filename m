Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A53C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 07:19:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8562E611C1
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Sep 2021 07:19:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbhIJHUj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Sep 2021 03:20:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbhIJHUi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Sep 2021 03:20:38 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59FA2C061574
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Sep 2021 00:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=LUHvEwSBiZGxcM0whgDeNPPx/loeqEcvU9SZQnomS2E=; b=zZ/S3VSwSTG6MeM247yyF+KZYf
        p4jmRoaGGoIhdZoP38v/9QYY7Le4oXEV06Z8+g2wb8tvu+8oeEaGR0ltT3fGO5EMQ7u1SomGSD0ji
        7lIGhZV+RXYGCKRi5n3VO8rhQtmlD2oFRLABaV3a649sUDjISuvhs3XA4Bs+XrR0l7e24abEaHBPI
        czTpiHfo+gRhu1vTcCHuolmv0h1Lb5FVBzXI8D0EGiIcGT/TXmZwlodo031s/smaDInndGC3Ay+A/
        zKV4hNkJNwGXtf3cin2Zk5e2hjwxgRbcCXrQNyLTHkXWyf4358zV3mWwxF7siLikZnnZEF9gdJZN8
        kzNQfPhA==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mOaol-00C5Vv-Ub; Fri, 10 Sep 2021 07:19:24 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
        Armin Wolf <W_Armin@gmx.de>
Subject: [PATCH] hwmon: dell-smm-hwmon: fix unused variable error
Date:   Fri, 10 Sep 2021 00:19:21 -0700
Message-Id: <20210910071921.16777-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

When CONFIG_PROC_FS is not set, there is a build warning (turned
into an error):

../drivers/hwmon/dell-smm-hwmon.c: In function 'i8k_init_procfs':
../drivers/hwmon/dell-smm-hwmon.c:624:24: error: unused variable 'data' [-Werror=unused-variable]
  struct dell_smm_data *data = dev_get_drvdata(dev);

Fix this by making I8K depend on PROC_FS and HWMON (instead of
selecting HWMON -- we prefer and try hard not to select entire
subsystems).

Build tested in all possible combinations of SENSORS_DELL_SMM,
I8K, and PROC_FS.

Fixes: 039ae58503f3 ("hwmon: Allow to compile dell-smm-hwmon driver without /proc/i8k")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Pali Rohár <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: x86@kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>
---
 arch/x86/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20210910.orig/arch/x86/Kconfig
+++ linux-next-20210910/arch/x86/Kconfig
@@ -1255,7 +1255,8 @@ config TOSHIBA
 
 config I8K
 	tristate "Dell i8k legacy laptop support"
-	select HWMON
+	depends on HWMON
+	depends on PROC_FS
 	select SENSORS_DELL_SMM
 	help
 	  This option enables legacy /proc/i8k userspace interface in hwmon
