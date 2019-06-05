Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A0EC28D18
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 16:30:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4EAFE206C3
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 16:30:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728702AbfFEQaW (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 12:30:22 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:25447 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFEQaW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 12:30:22 -0400
X-Greylist: delayed 756 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Jun 2019 12:30:21 EDT
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id x55GHZ4r019362
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Jun 2019 10:17:35 -0600 (CST)
Received: from SED.RFC1918.192.168.sedsystems.ca (eng1n65.eng.sedsystems.ca [172.21.1.65])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id x55GHOOf057650
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 5 Jun 2019 10:17:27 -0600
From:   Robert Hancock <hancock@sedsystems.ca>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Robert Hancock <hancock@sedsystems.ca>
Subject: [PATCH 3/3] hwmon: (pmbus) add support for Infineon IRPS5401
Date:   Wed,  5 Jun 2019 10:17:14 -0600
Message-Id: <1559751434-19879-4-git-send-email-hancock@sedsystems.ca>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
References: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add detection support for the Infineon IRPS5401 PMIC. This chip has 5
pages corresponding to 4 switching outputs and one linear (LDO) output.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 drivers/hwmon/pmbus/pmbus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 970322f..158d61e 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -191,6 +191,10 @@ static int pmbus_probe(struct i2c_client *client,
 	return pmbus_do_probe(client, id, info);
 }
 
+static const struct pmbus_device_info pmbus_info_five = {
+	.pages = 5,
+	.flags = 0
+};
 static const struct pmbus_device_info pmbus_info_one = {
 	.pages = 1,
 	.flags = 0
@@ -214,6 +218,7 @@ static int pmbus_probe(struct i2c_client *client,
 	{"dps460", (kernel_ulong_t)&pmbus_info_one_skip},
 	{"dps650ab", (kernel_ulong_t)&pmbus_info_one_skip},
 	{"dps800", (kernel_ulong_t)&pmbus_info_one_skip},
+	{"irps5401", (kernel_ulong_t)&pmbus_info_five},
 	{"mdt040", (kernel_ulong_t)&pmbus_info_one},
 	{"ncp4200", (kernel_ulong_t)&pmbus_info_one},
 	{"ncp4208", (kernel_ulong_t)&pmbus_info_one},
-- 
1.8.3.1

