Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:3902 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S965318AbcLVM07 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 07:26:59 -0500
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 31/66] hwmon: (mcp3021) use permission-specific DEVICE_ATTR variants
Date: Thu, 22 Dec 2016 13:05:00 +0100
Message-Id: <1482408335-3435-32-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch for the RO case, in the case where the show function
already has the expected name, is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@ro@
declarer name DEVICE_ATTR;
identifier x,x_show;
@@

DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);

@script:ocaml@
x << ro.x;
x_show << ro.x_show;
@@

if not (x^"_show" = x_show) then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RO;
identifier ro.x,ro.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/hwmon/mcp3021.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
index 1929734..de886f8 100644
--- a/drivers/hwmon/mcp3021.c
+++ b/drivers/hwmon/mcp3021.c
@@ -86,8 +86,8 @@ static inline u16 volts_from_reg(struct mcp3021_data *data, u16 val)
 	return DIV_ROUND_CLOSEST(data->vdd * val, 1 << data->output_res);
 }
 
-static ssize_t show_in_input(struct device *dev, struct device_attribute *attr,
-		char *buf)
+static ssize_t in0_input_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
 {
 	struct i2c_client *client = to_i2c_client(dev);
 	struct mcp3021_data *data = i2c_get_clientdata(client);
@@ -102,7 +102,7 @@ static ssize_t show_in_input(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", in_input);
 }
 
-static DEVICE_ATTR(in0_input, 0444, show_in_input, NULL);
+static DEVICE_ATTR_RO(in0_input);
 
 static int mcp3021_probe(struct i2c_client *client,
 				const struct i2c_device_id *id)

