Return-Path: <SRS0=+A0F=XA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5396FC3A5A9
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Sep 2019 02:00:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 241AA2168B
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Sep 2019 02:00:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730396AbfIECAX convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Sep 2019 22:00:23 -0400
Received: from sender4-op-o15.zoho.com ([136.143.188.15]:17509 "EHLO
        sender4-op-o15.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730219AbfIECAX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Sep 2019 22:00:23 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1567648803; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=A/GxpIgVTOl6KPm4ipZLmUx5qFYsJ2/eDI5iVB5fCrX1hQD7PTCQumqQ7GnIABrhC0yzBOU04Z7IUU4K3evzofl18aezSpp20nK3lAHtoeiqEMmmup1mWXYgXwkDUF4ZPCbGPt8gblPnR1QhmSwElmtFvXtOPRfcPDTl/Fa+yho=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1567648803; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=4fAwIVFbUQXZ6YI4e/ekmUMxhsU+WnHB7VHv6j9N9xc=; 
        b=e6voev2vfP9CaA9GEj3PQDSZ7+cPqDNHFlETJtGnGjj5UG4VKuXMUts3QbGMjADOXlJL3/XHI5+BBwm2qiIFj9HCRdw63RsUxrj979bj4r4n0mSCnwcGPM6qeNewn90nJh+uqFjrgb6h2abGIbOvz66fGVVf1OnrNgqIbxROzAw=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=dlrobertson.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from nessie.verizon.net (pool-100-15-144-194.washdc.fios.verizon.net [100.15.144.194]) by mx.zohomail.com
        with SMTPS id 1567648799993964.7861149542706; Wed, 4 Sep 2019 18:59:59 -0700 (PDT)
From:   Dan Robertson <dan@dlrobertson.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Robertson <dan@dlrobertson.com>
Message-ID: <20190905014554.21658-1-dan@dlrobertson.com>
Subject: [PATCH 0/2] hwmon: (shtc1) add support for the SHTC3 sensor
Date:   Thu,  5 Sep 2019 01:45:52 +0000
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190905010130.15019-2-dan@dlrobertson.com>
References: <20190905010130.15019-2-dan@dlrobertson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Sorry for the noise. I submitted the wrong patchset :/

 1) Adds support for SHTC3
 2) Fixes an error in the bitmask used to get the product code from the
    ID register. See section 5.7 of the SHTC1 or SHTW1 datasheet for
    details.

Dan Robertson (2):
  hwmon: (shtc1) add support for the SHTC3 sensor
  hwmon: (shtc1) fix shtc1 and shtw1 id mask

 Documentation/hwmon/shtc1.rst | 19 ++++++++----
 drivers/hwmon/Kconfig         |  4 +--
 drivers/hwmon/shtc1.c         | 56 ++++++++++++++++++++++++++---------
 3 files changed, 58 insertions(+), 21 deletions(-)

-- 
2.23.0



