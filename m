Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD29CC61DD8
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Nov 2020 02:16:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60DE320B80
	for <linux-hwmon@archiver.kernel.org>; Sat, 14 Nov 2020 02:16:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="Hp7NfLlQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbgKNCQF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Nov 2020 21:16:05 -0500
Received: from gproxy10-pub.mail.unifiedlayer.com ([69.89.20.226]:44386 "EHLO
        gproxy10-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726081AbgKNCQE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Nov 2020 21:16:04 -0500
X-Greylist: delayed 1487 seconds by postgrey-1.27 at vger.kernel.org; Fri, 13 Nov 2020 21:16:04 EST
Received: from cmgw14.unifiedlayer.com (unknown [10.9.0.14])
        by gproxy10.mail.unifiedlayer.com (Postfix) with ESMTP id 76F97140510
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2020 18:51:13 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id dkiekUc5YwNNldkifkjFn3; Fri, 13 Nov 2020 18:51:13 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=bbZFrtHB c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=VwQbUJbxAAAA:8
 a=wBqY6jgYEW0BGQsa698A:9 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=Message-Id:Date:Subject:Cc:To:From:Sender:
        Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ZgDKlMPjpd9wyV6iWCzRhHgPc4WOdicWTvdhxomrLcs=; b=Hp7NfLlQ4aBt807E1OVJTriJrn
        pkqtvAwvauw8VOg7x9L3FLPPMTOBlhbOUjE1H+ng/8t5Ujez/ABwvvMpWI3EECz7sTB6LGvSpQnRX
        95qVWt9naySUC3UIKztu4olOJdFwsCfqNVjdF0ayQqUYD7sLnRA8K+CfIJI36lpymPMkPUTydrgB1
        8/+ZuOLN3DMODuNy6iwI631ysRDrjWOHYU5+YzZiFAhuD2t/YUiUpKEbGb9IJPU5WA91tjyvaQNs6
        B4Gxisk/IbgP19H0SVbV4aKp3StTMyKV5ZtYGlnTNSUp53iK+kbRu1o3pN3U0WYpHLvan9xQ3hYW8
        TebVuquQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55376 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kdkie-0032Zd-GW; Sat, 14 Nov 2020 01:51:12 +0000
From:   Guenter Roeck <linux@roeck-us.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] hwmon fixes for v5.10-rc4
Date:   Fri, 13 Nov 2020 17:51:11 -0800
Message-Id: <20201114015111.55792-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kdkie-0032Zd-GW
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:55376
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Linus,

Please pull hwmon fixes for Linux v5.10-rc4 from signed tag:

    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.10-rc4

Thanks,
Guenter
------

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v5.10-rc4

for you to fetch changes up to 60268b0e8258fdea9a3c9f4b51e161c123571db3:

  hwmon: (amd_energy) modify the visibility of the counters (2020-11-13 06:46:20 -0800)

----------------------------------------------------------------
hwmon fixes for v5.10-rc4

Fix potential bufer overflow in pmbus/max20730 driver
Fix locking issue in pmbus core
Fix regression causing timeouts in applesmc driver
Fix RPM calculation in pwm-fan driver
Restrict counter visibility in amd_energy driver

----------------------------------------------------------------
Brad Campbell (1):
      hwmon: (applesmc) Re-work SMC comms

Dan Carpenter (1):
      hwmon: (pmbus/max20730) use scnprintf() instead of snprintf()

Naveen Krishna Chatradhi (1):
      hwmon: (amd_energy) modify the visibility of the counters

Paul Barker (1):
      hwmon: (pwm-fan) Fix RPM calculation

Robert Hancock (1):
      hwmon: (pmbus) Add mutex locking for sysfs reads

 drivers/hwmon/amd_energy.c       |   2 +-
 drivers/hwmon/applesmc.c         | 130 ++++++++++++++++++++++++---------------
 drivers/hwmon/pmbus/max20730.c   |  26 ++++----
 drivers/hwmon/pmbus/pmbus_core.c |  13 +++-
 drivers/hwmon/pwm-fan.c          |  16 ++---
 5 files changed, 115 insertions(+), 72 deletions(-)
