Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:26112 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754361AbdECTdn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 3 May 2017 15:33:43 -0400
Date: Wed, 3 May 2017 22:31:40 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Guenter Roeck <linux@roeck-us.net>,
        Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus) Add missing break statements
Message-ID: <20170503193140.zbxcdgda7k3rnr2m@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Static checkers complain about these missing break statements.

Fixes: 6eaaea144dc5 ("hwmon: (pmbus) Add client driver for IR35221")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index cc7b3b542531..00e4a1e264e2 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -129,6 +129,7 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
 	case PMBUS_IIN_OC_WARN_LIMIT:
 		ret = pmbus_read_word_data(client, page, reg);
 		ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
+		break;
 	case PMBUS_READ_VIN:
 		ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
 		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
@@ -222,6 +223,7 @@ static int ir35221_write_word_data(struct i2c_client *client, int page, int reg,
 	case PMBUS_IIN_OC_WARN_LIMIT:
 		val = ir35221_scale_result(word, 1, PSC_CURRENT_IN);
 		ret = pmbus_write_word_data(client, page, reg, val);
+		break;
 	default:
 		ret = -ENODATA;
 		break;
