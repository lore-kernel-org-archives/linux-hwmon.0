Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E69C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Sep 2021 14:38:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 376AC61250
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Sep 2021 14:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbhIOOkH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Sep 2021 10:40:07 -0400
Received: from tartarus.angband.pl ([51.83.246.204]:52044 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233771AbhIOOkH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Sep 2021 10:40:07 -0400
Received: from 89-73-149-240.dynamic.chello.pl ([89.73.149.240] helo=barad-dur.angband.pl)
        by tartarus.angband.pl with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <kilobyte@angband.pl>)
        id 1mQW3F-00Ck3l-Bt; Wed, 15 Sep 2021 16:38:32 +0200
Received: from [2a02:a31c:8245:f980::4] (helo=valinor.angband.pl)
        by barad-dur.angband.pl with esmtp (Exim 4.94.2)
        (envelope-from <kilobyte@angband.pl>)
        id 1mQW34-0003oc-Ga; Wed, 15 Sep 2021 16:38:06 +0200
Received: from kilobyte by valinor.angband.pl with local (Exim 4.95-RC2)
        (envelope-from <kilobyte@valinor.angband.pl>)
        id 1mQW33-000BJ6-VE;
        Wed, 15 Sep 2021 16:38:05 +0200
From:   Adam Borowski <kilobyte@angband.pl>
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc:     Adam Borowski <kilobyte@angband.pl>
Date:   Wed, 15 Sep 2021 16:38:01 +0200
Message-Id: <20210915143801.43419-1-kilobyte@angband.pl>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <7a259cc4-69a8-fc0c-e256-5d82b6f1bb35@roeck-us.net>
References: <7a259cc4-69a8-fc0c-e256-5d82b6f1bb35@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 89.73.149.240
X-SA-Exim-Mail-From: kilobyte@angband.pl
Subject: [PATCH v2] hwmon: (dell-smm) Don't build the proc interface if there's no /proc
X-SA-Exim-Version: 4.2.1 (built Sat, 13 Feb 2021 17:57:42 +0000)
X-SA-Exim-Scanned: Yes (on tartarus.angband.pl)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
Guenter wrote:
> > -#if IS_ENABLED(CONFIG_I8K)
> > +#if IS_ENABLED(CONFIG_I8K) && IS_ENABLED(CONFIG_PROCFS)

> This should be expressed as Kconfig dependency: I8K should depend on PROCFS.
> Otherwise the configuration flag is misleading.

Right, I did not notice I8K does nothing otherwise.

 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 4e001bbbb425..a7365695ff72 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1253,6 +1253,7 @@ config I8K
 	tristate "Dell i8k legacy laptop support"
 	select HWMON
 	select SENSORS_DELL_SMM
+	depends on PROC_FS
 	help
 	  This option enables legacy /proc/i8k userspace interface in hwmon
 	  dell-smm-hwmon driver. Character file /proc/i8k reports bios version,
-- 
2.33.0

