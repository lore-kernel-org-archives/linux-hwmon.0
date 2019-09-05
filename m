Return-Path: <SRS0=+A0F=XA=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E4CC3A5A9
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Sep 2019 02:01:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2465E20820
	for <linux-hwmon@archiver.kernel.org>; Thu,  5 Sep 2019 02:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730722AbfIECBK convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Sep 2019 22:01:10 -0400
Received: from sender4-op-o15.zoho.com ([136.143.188.15]:17525 "EHLO
        sender4-op-o15.zoho.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730717AbfIECBK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Sep 2019 22:01:10 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1567648811; cv=none; 
        d=zoho.com; s=zohoarc; 
        b=e8iZH9eXtnQOSHg4En+gO5XvbTn2CLYkJlqEbs5Tcv3/NIALkfEN9WUMUDCH7WSX3JbWErzv+nXDBLvrpNZeZ38/YguxcE+FJiufLXcUK1EiyRtezTlOKBx+nEcrb1KjbYSDfvyNEM3F5EnMSg+f8+YBYE8EzTyAYT7xbRuxndY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com; s=zohoarc; 
        t=1567648811; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To:ARC-Authentication-Results; 
        bh=d/lz5o3C3UNj/VPSmkPyjD1WhY07pCH9s+H45T544PI=; 
        b=jcg7FLs1i9qIy2pomhDszPA0tQnvqaAlK9Kl9e9lCA+/50R0cKk6/SG+oBa2kE0EyfKIC3xn0Mw1TRXzG/SdgW8sO9sP+vlWRJ4tyhEnCpNttA1I1rXmcnd+EX5Nj/cCJnTHzcRLJdT11QDDmAZxWZFfKsrxjZFztLfmfee+RB4=
ARC-Authentication-Results: i=1; mx.zoho.com;
        dkim=pass  header.i=dlrobertson.com;
        spf=pass  smtp.mailfrom=dan@dlrobertson.com;
        dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from nessie.verizon.net (pool-100-15-144-194.washdc.fios.verizon.net [100.15.144.194]) by mx.zohomail.com
        with SMTPS id 1567648810980129.82563685747516; Wed, 4 Sep 2019 19:00:10 -0700 (PDT)
From:   Dan Robertson <dan@dlrobertson.com>
To:     linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Robertson <dan@dlrobertson.com>
Message-ID: <20190905014554.21658-3-dan@dlrobertson.com>
Subject: [PATCH 2/2] hwmon: (shtc1) fix shtc1 and shtw1 id mask
Date:   Thu,  5 Sep 2019 01:45:54 +0000
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190905014554.21658-1-dan@dlrobertson.com>
References: <20190905010130.15019-2-dan@dlrobertson.com>
 <20190905014554.21658-1-dan@dlrobertson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Fix an error in the bitmaskfor the shtc1 and shtw1 bitmask used to
retrieve the chip ID from the ID register. See section 5.7 of the shtw1
or shtc1 datasheet for details.

Fixes: 1a539d372edd9832444e7a3daa710c444c014dc9 ("hwmon: add support for Sensirion SHTC1 sensor")
Signed-off-by: Dan Robertson <dan@dlrobertson.com>
---
 drivers/hwmon/shtc1.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/shtc1.c b/drivers/hwmon/shtc1.c
index 3e9a859a2b58..c628313a20d4 100644
--- a/drivers/hwmon/shtc1.c
+++ b/drivers/hwmon/shtc1.c
@@ -27,14 +27,14 @@ static const unsigned char shtc1_cmd_measure_nonblocking_lpm[] = { 0x60, 0x9c };
 static const unsigned char shtc1_cmd_read_id_reg[]             = { 0xef, 0xc8 };
 
 /* constants for reading the ID register
- * SHTC1: 0x0007 with mask 0x001f
- * SHTW1: 0x0007 with mask 0x001f
+ * SHTC1: 0x0007 with mask 0x003f
+ * SHTW1: 0x0007 with mask 0x003f
  * SHTC3: 0x0807 with mask 0x083f
  */
 #define SHTC3_ID      0x0807
 #define SHTC3_ID_MASK 0x083f
 #define SHTC1_ID      0x0007
-#define SHTC1_ID_MASK 0x001f
+#define SHTC1_ID_MASK 0x003f
 
 /* delays for non-blocking i2c commands, both in us */
 #define SHTC1_NONBLOCKING_WAIT_TIME_HPM  14400
-- 
2.23.0



