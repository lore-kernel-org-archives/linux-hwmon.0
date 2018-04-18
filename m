Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f194.google.com ([74.125.82.194]:40914 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751830AbeDRPNz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Apr 2018 11:13:55 -0400
Received: by mail-ot0-f194.google.com with SMTP id h8-v6so2303435otj.7
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Apr 2018 08:13:55 -0700 (PDT)
From: minyard@acm.org
To: "Darrick J . Wong" <darrick.wong@oracle.com>
Cc: openipmi-developer@lists.sourceforge.net,
        linux-hwmon@vger.kernel.org, Corey Minyard <cminyard@mvista.com>
Subject: [PATCH] hwmon:ibm: Change ipmi_user_t to struct ipmi_user *
Date: Wed, 18 Apr 2018 10:13:50 -0500
Message-Id: <1524064430-22093-1-git-send-email-minyard@acm.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Corey Minyard <cminyard@mvista.com>

Signed-off-by: Corey Minyard <cminyard@mvista.com>
Cc: Darrick J. Wong <darrick.wong@oracle.com>
---
 drivers/hwmon/ibmaem.c | 2 +-
 drivers/hwmon/ibmpex.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

I'm getting rid of this annoying coding style violation, if you
could get this in, that would be great.

diff --git a/drivers/hwmon/ibmaem.c b/drivers/hwmon/ibmaem.c
index 1f64378..9e92673 100644
--- a/drivers/hwmon/ibmaem.c
+++ b/drivers/hwmon/ibmaem.c
@@ -101,7 +101,7 @@ static struct platform_driver aem_driver = {
 struct aem_ipmi_data {
 	struct completion	read_complete;
 	struct ipmi_addr	address;
-	ipmi_user_t		user;
+	struct ipmi_user	*user;
 	int			interface;
 
 	struct kernel_ipmi_msg	tx_message;
diff --git a/drivers/hwmon/ibmpex.c b/drivers/hwmon/ibmpex.c
index 21b9c72..4f7b12b 100644
--- a/drivers/hwmon/ibmpex.c
+++ b/drivers/hwmon/ibmpex.c
@@ -84,7 +84,7 @@ struct ibmpex_bmc_data {
 
 	struct ipmi_addr	address;
 	struct completion	read_complete;
-	ipmi_user_t		user;
+	struct ipmi_user	*user;
 	int			interface;
 
 	struct kernel_ipmi_msg	tx_message;
-- 
2.7.4

