Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:64697 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752935AbdD0Jal (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Apr 2017 05:30:41 -0400
Subject: [PATCH 2/4] hwmon-nct6683: Adjust five checks for null pointers
From: SF Markus Elfring <elfring@users.sourceforge.net>
To: linux-hwmon@vger.kernel.org,
        =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
Message-ID: <339214ae-9c04-9e8c-e97e-368aa83a17b5@users.sourceforge.net>
Date: Thu, 27 Apr 2017 11:29:49 +0200
MIME-Version: 1.0
In-Reply-To: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 27 Apr 2017 10:22:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hwmon/nct6683.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index dd14a98cc6dd..4deb46ce8834 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -423,16 +423,16 @@ nct6683_create_attr_group(struct device *dev,
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
@@ -440,7 +440,7 @@ nct6683_create_attr_group(struct device *dev,
 
 	for (i = 0; i < repeat; i++) {
 		t = tg->templates;
-		for (j = 0; *t != NULL; j++) {
+		for (j = 0; *t; j++) {
 			snprintf(su->name, sizeof(su->name),
 				 (*t)->dev_attr.attr.name, tg->base + i);
 			if ((*t)->s2) {
@@ -1179,7 +1179,7 @@ static void nct6683_setup_sensors(struct nct6683_data *data)
 		if (reg >= NUM_MON_LABELS)
 			continue;
 		/* Skip if disabled or reserved */
-		if (nct6683_mon_label[reg] == NULL)
+		if (!nct6683_mon_label[reg])
 			continue;
 		if (reg < MON_VOLTAGE_START) {
 			data->temp_index[data->temp_num] = i;
-- 
2.12.2

