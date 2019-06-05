Return-Path: <SRS0=Rv8n=UE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C49EC28CC5
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 16:30:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 709E7206C3
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jun 2019 16:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728708AbfFEQaX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jun 2019 12:30:23 -0400
Received: from sed198n136.SEDSystems.ca ([198.169.180.136]:25447 "EHLO
        sed198n136.sedsystems.ca" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfFEQaX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 Jun 2019 12:30:23 -0400
X-Greylist: delayed 756 seconds by postgrey-1.27 at vger.kernel.org; Wed, 05 Jun 2019 12:30:21 EDT
Received: from barney.sedsystems.ca (barney [198.169.180.121])
        by sed198n136.sedsystems.ca  with ESMTP id x55GHRvG024679
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 5 Jun 2019 10:17:27 -0600 (CST)
Received: from SED.RFC1918.192.168.sedsystems.ca (eng1n65.eng.sedsystems.ca [172.21.1.65])
        by barney.sedsystems.ca (8.14.7/8.14.4) with ESMTP id x55GHOOe057650
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 5 Jun 2019 10:17:26 -0600
From:   Robert Hancock <hancock@sedsystems.ca>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com,
        Robert Hancock <hancock@sedsystems.ca>
Subject: [PATCH 2/3] hwmon: (pmbus) Add paged VIN, IIN, PIN, temp detection support
Date:   Wed,  5 Jun 2019 10:17:13 -0600
Message-Id: <1559751434-19879-3-git-send-email-hancock@sedsystems.ca>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
References: <1559751434-19879-1-git-send-email-hancock@sedsystems.ca>
X-Scanned-By: MIMEDefang 2.64 on 198.169.180.136
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for detecting multi-paged VIN, IIN, PIN and temperature
parameters to the generic detection code in pmbus_find_sensor_groups.
Paged VIN, IIN and PIN parameters were just added to the pmbus core,
and temperature parameters could already be paged but were not
auto-detected as such.

Signed-off-by: Robert Hancock <hancock@sedsystems.ca>
---
 drivers/hwmon/pmbus/pmbus.c | 46 ++++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index c0bc43d..970322f 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -29,17 +29,8 @@ static void pmbus_find_sensor_groups(struct i2c_client *client,
 	int page;
 
 	/* Sensors detected on page 0 only */
-	if (pmbus_check_word_register(client, 0, PMBUS_READ_VIN))
-		info->func[0] |= PMBUS_HAVE_VIN;
 	if (pmbus_check_word_register(client, 0, PMBUS_READ_VCAP))
 		info->func[0] |= PMBUS_HAVE_VCAP;
-	if (pmbus_check_word_register(client, 0, PMBUS_READ_IIN))
-		info->func[0] |= PMBUS_HAVE_IIN;
-	if (pmbus_check_word_register(client, 0, PMBUS_READ_PIN))
-		info->func[0] |= PMBUS_HAVE_PIN;
-	if (info->func[0]
-	    && pmbus_check_byte_register(client, 0, PMBUS_STATUS_INPUT))
-		info->func[0] |= PMBUS_HAVE_STATUS_INPUT;
 	if (pmbus_check_byte_register(client, 0, PMBUS_FAN_CONFIG_12) &&
 	    pmbus_check_word_register(client, 0, PMBUS_READ_FAN_SPEED_1)) {
 		info->func[0] |= PMBUS_HAVE_FAN12;
@@ -52,20 +43,19 @@ static void pmbus_find_sensor_groups(struct i2c_client *client,
 		if (pmbus_check_byte_register(client, 0, PMBUS_STATUS_FAN_34))
 			info->func[0] |= PMBUS_HAVE_STATUS_FAN34;
 	}
-	if (pmbus_check_word_register(client, 0, PMBUS_READ_TEMPERATURE_1))
-		info->func[0] |= PMBUS_HAVE_TEMP;
-	if (pmbus_check_word_register(client, 0, PMBUS_READ_TEMPERATURE_2))
-		info->func[0] |= PMBUS_HAVE_TEMP2;
-	if (pmbus_check_word_register(client, 0, PMBUS_READ_TEMPERATURE_3))
-		info->func[0] |= PMBUS_HAVE_TEMP3;
-	if (info->func[0] & (PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
-			     | PMBUS_HAVE_TEMP3)
-	    && pmbus_check_byte_register(client, 0,
-					 PMBUS_STATUS_TEMPERATURE))
-			info->func[0] |= PMBUS_HAVE_STATUS_TEMP;
 
 	/* Sensors detected on all pages */
 	for (page = 0; page < info->pages; page++) {
+		if (pmbus_check_word_register(client, page, PMBUS_READ_VIN))
+			info->func[page] |= PMBUS_HAVE_VIN;
+		if (pmbus_check_word_register(client, page, PMBUS_READ_IIN))
+			info->func[page] |= PMBUS_HAVE_IIN;
+		if (pmbus_check_word_register(client, page, PMBUS_READ_PIN))
+			info->func[page] |= PMBUS_HAVE_PIN;
+		if (info->func[page] & (PMBUS_HAVE_VIN | PMBUS_HAVE_IIN
+				      | PMBUS_HAVE_PIN) &&
+		    pmbus_check_byte_register(client, page, PMBUS_STATUS_INPUT))
+			info->func[page] |= PMBUS_HAVE_STATUS_INPUT;
 		if (pmbus_check_word_register(client, page, PMBUS_READ_VOUT)) {
 			info->func[page] |= PMBUS_HAVE_VOUT;
 			if (pmbus_check_byte_register(client, page,
@@ -74,12 +64,26 @@ static void pmbus_find_sensor_groups(struct i2c_client *client,
 		}
 		if (pmbus_check_word_register(client, page, PMBUS_READ_IOUT)) {
 			info->func[page] |= PMBUS_HAVE_IOUT;
-			if (pmbus_check_byte_register(client, 0,
+			if (pmbus_check_byte_register(client, page,
 						      PMBUS_STATUS_IOUT))
 				info->func[page] |= PMBUS_HAVE_STATUS_IOUT;
 		}
 		if (pmbus_check_word_register(client, page, PMBUS_READ_POUT))
 			info->func[page] |= PMBUS_HAVE_POUT;
+		if (pmbus_check_word_register(client, page,
+					      PMBUS_READ_TEMPERATURE_1))
+			info->func[page] |= PMBUS_HAVE_TEMP;
+		if (pmbus_check_word_register(client, page,
+					      PMBUS_READ_TEMPERATURE_2))
+			info->func[page] |= PMBUS_HAVE_TEMP2;
+		if (pmbus_check_word_register(client, page,
+					      PMBUS_READ_TEMPERATURE_3))
+			info->func[page] |= PMBUS_HAVE_TEMP3;
+		if (info->func[page] & (PMBUS_HAVE_TEMP | PMBUS_HAVE_TEMP2
+				     | PMBUS_HAVE_TEMP3) &&
+		    pmbus_check_byte_register(client, page,
+					      PMBUS_STATUS_TEMPERATURE))
+			info->func[page] |= PMBUS_HAVE_STATUS_TEMP;
 	}
 }
 
-- 
1.8.3.1

