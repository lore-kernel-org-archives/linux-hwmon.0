Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.14]:62285 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754604AbdD0JcS (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Apr 2017 05:32:18 -0400
Subject: [PATCH 4/4] hwmon-nct6775: Adjust seven checks for null pointers
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-hwmon@vger.kernel.org,
        =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
Message-ID: <7bf13cb6-55f3-c7d3-4b42-befb4a4e7d07@users.sourceforge.net>
Date: Thu, 27 Apr 2017 11:31:21 +0200
MIME-Version: 1.0
In-Reply-To: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Apr 2017 10:55:24 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hwmon/nct6775.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index d552ab7901a7..fe8713fb548c 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -1070,16 +1070,16 @@ nct6775_create_attr_group(struct device *dev,
 		return ERR_PTR(-EINVAL);
 
 	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
-	if (group == NULL)
+	if (!group)
 		return ERR_PTR(-ENOMEM);
 
 	attrs = devm_kcalloc(dev, repeat * count + 1, sizeof(*attrs),
 			     GFP_KERNEL);
-	if (attrs == NULL)
+	if (!attrs)
 		return ERR_PTR(-ENOMEM);
 
 	su = devm_kcalloc(dev, repeat * count, sizeof(*su), GFP_KERNEL);
-	if (su == NULL)
+	if (!su)
 		return ERR_PTR(-ENOMEM);
 
 	group->attrs = attrs;
@@ -1087,7 +1087,7 @@ nct6775_create_attr_group(struct device *dev,
 
 	for (i = 0; i < repeat; i++) {
 		t = tg->templates;
-		while (*t != NULL) {
+		while (*t) {
 			snprintf(su->name, sizeof(su->name),
 				 (*t)->dev_attr.attr.name, tg->base + i);
 			if ((*t)->s2) {
@@ -3000,11 +3000,11 @@ static umode_t nct6775_pwm_is_visible(struct kobject *kobj,
 	if ((nr >= 14 && nr <= 18) || nr == 21)   /* weight */
 		if (!data->REG_WEIGHT_TEMP_SEL[pwm])
 			return 0;
-	if (nr == 19 && data->REG_PWM[3] == NULL) /* pwm_max */
+	if (nr == 19 && !data->REG_PWM[3]) /* pwm_max */
 		return 0;
-	if (nr == 20 && data->REG_PWM[4] == NULL) /* pwm_step */
+	if (nr == 20 && !data->REG_PWM[4]) /* pwm_step */
 		return 0;
-	if (nr == 21 && data->REG_PWM[6] == NULL) /* weight_duty_base */
+	if (nr == 21 && !data->REG_PWM[6]) /* weight_duty_base */
 		return 0;
 
 	if (nr >= 22 && nr <= 35) {		/* auto point */
-- 
2.12.2

