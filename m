Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF990C28CC5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 19:49:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B19802083E
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 19:49:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfFETtg (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 15:49:36 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:41976 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbfFETtg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 15:49:36 -0400
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id x55JnFU1024076
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Jun 2019 13:49:15 -0600 (CST)
Received: from SED.RFC1918.192.168.sedsystems.ca (eng1n65.eng.sedsystems.ca [172.21.1.65])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id x55JnFuR000988
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 5 Jun 2019 13:49:15 -0600
From:   Robert Hancock <hancock@sedsystems.ca>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Robert Hancock <hancock@sedsystems.ca>
Subject: [PATCH v2 0/2] Add pmbus support for Infineon IRPS5401 (v2)
Date:   Wed,  5 Jun 2019 13:48:59 -0600
Message-Id: <1559764141-26105-1-git-send-email-hancock@sedsystems.ca>
X-Mailer: git-send-email 1.8.3.1
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch set adds support for the Infineon IRPS5401 PMIC to pmbus.
This chip has 5 outputs and includes separate VIN, IIN and PIN parameters
on multiple pages, which is something that the pmbus core did not
previously support properly.

Changes since v1:
-Changed to treat parameters as paged if they are on multiple pages, rather
than treating VIN, IIN and PIN as paged unconditionally
-Create separate driver for IRPS5401 to avoid potential impact on existing
devices from changing auto-probing

Robert Hancock (2):
  hwmon: (pmbus) Treat parameters as paged if on multiple pages
  hwmon: (pmbus) Add Infineon IRPS5401 driver

 drivers/hwmon/pmbus/Kconfig      |  9 ++++++
 drivers/hwmon/pmbus/Makefile     |  1 +
 drivers/hwmon/pmbus/irps5401.c   | 68 ++++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus_core.c | 33 ++++++++++++++++---
 4 files changed, 107 insertions(+), 4 deletions(-)
 create mode 100644 drivers/hwmon/pmbus/irps5401.c

-- 
1.8.3.1

