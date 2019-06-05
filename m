Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01098C28CC6
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 16:30:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CFE11206C3
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 16:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbfFEQaW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 12:30:22 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:25447 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFEQaW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 12:30:22 -0400
X-Greylist: delayed 756 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Jun 2019 12:30:21 EDT
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id x55GHQSb002324
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Jun 2019 10:17:26 -0600 (CST)
Received: from SED.RFC1918.192.168.sedsystems.ca (eng1n65.eng.sedsystems.ca [172.21.1.65])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id x55GHOOd057650
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 5 Jun 2019 10:17:26 -0600
From:   Robert Hancock <hancock@sedsystems.ca>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Robert Hancock <hancock@sedsystems.ca>
Subject: [PATCH 1/3] hwmon: (pmbus) Add paged support for VIN, IIN, PIN parameters
Date:   Wed,  5 Jun 2019 10:17:12 -0600
Message-Id: <1559751434-19879-2-git-send-email-hancock@sedsystems.ca>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
References: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Previously the VIN, IIN and PIN parameters were marked as non-paged,
however on the IRPS5401 these parameters are present on multiple pages.
Add the paged flag for these parameters so they can be detected properly
on such chips.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 drivers/hwmon/pmbus/pmbus_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index ef7ee90..6e3aaf1 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1395,6 +1395,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.reg = PMBUS_READ_VIN,
 		.class = PSC_VOLTAGE_IN,
 		.label = "vin",
+		.paged = true,
 		.func = PMBUS_HAVE_VIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
@@ -1499,6 +1500,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.reg = PMBUS_READ_IIN,
 		.class = PSC_CURRENT_IN,
 		.label = "iin",
+		.paged = true,
 		.func = PMBUS_HAVE_IIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
@@ -1584,6 +1586,7 @@ static int pmbus_add_sensor_attrs(struct i2c_client *client,
 		.reg = PMBUS_READ_PIN,
 		.class = PSC_POWER,
 		.label = "pin",
+		.paged = true,
 		.func = PMBUS_HAVE_PIN,
 		.sfunc = PMBUS_HAVE_STATUS_INPUT,
 		.sbase = PB_STATUS_INPUT_BASE,
-- 
1.8.3.1

