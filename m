Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB78C433ED
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Apr 2021 15:33:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80A9C611AE
	for <linux-hwmon@archiver.kernel.org>; Fri, 23 Apr 2021 15:33:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242867AbhDWPeZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 23 Apr 2021 11:34:25 -0400
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:44799 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbhDWPeY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Apr 2021 11:34:24 -0400
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 820C324663C0
        for <linux-hwmon@vger.kernel.org>; Fri, 23 Apr 2021 17:33:44 +0200 (CEST)
Received: from s630.loopia.se (unknown [172.22.191.5])
        by s807.loopia.se (Postfix) with ESMTP id 71F5C2E3A4ED;
        Fri, 23 Apr 2021 17:33:44 +0200 (CEST)
Received: from s476.loopia.se (unknown [172.22.191.6])
        by s630.loopia.se (Postfix) with ESMTP id 5CE1813B942E;
        Fri, 23 Apr 2021 17:33:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s645.loopia.se ([172.22.191.5])
        by s476.loopia.se (s476.loopia.se [172.22.190.16]) (amavisd-new, port 10024)
        with LMTP id ChAuIG7mRKrG; Fri, 23 Apr 2021 17:33:43 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 155.4.131.157
Received: from localhost.localdomain (h-155-4-131-157.NA.cust.bahnhof.se [155.4.131.157])
        (Authenticated sender: carl@hgsystem.se)
        by s645.loopia.se (Postfix) with ESMTPSA id 57CB5157A045;
        Fri, 23 Apr 2021 17:33:43 +0200 (CEST)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH 0/2] hwmon: (pmbus/zl6100) Add support for ZLS1003, ZLS4009 and ZL8802
Date:   Fri, 23 Apr 2021 17:33:27 +0200
Message-Id: <20210423153329.33457-1-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for Renesas ZL8802 Dual Channel/Dual Phase PMBus DC/DC
Digital Controller as well as support for the Renesas custom controller
chips ZLS1003 and ZLS4009 to the zl6100 pmbus driver.

The ZL8802 support was tested using a Flex BMR469 converter module,
the ZLS1003 with a Flex BMR466 and the ZLS4009 with a Flex BMR465.

The documentation is updated with new sysfs attribute descriptions and
broken links to technical specifications has been fixed. Also the Renesas
company name was added and Ericsson changed to Flex to reflect new
ownership relations.

Erik Rosen (2):
  Add support for ZLS1003, ZLS4009 and ZL8802
  Update documentation for zl6100 driver

 Documentation/hwmon/zl6100.rst | 132 ++++++++++++++++++++++-----------
 drivers/hwmon/pmbus/zl6100.c   |  94 +++++++++++++++++++----
 2 files changed, 169 insertions(+), 57 deletions(-)


base-commit: 1e28eed17697bcf343c6743f0028cc3b5dd88bf0
-- 
2.20.1

