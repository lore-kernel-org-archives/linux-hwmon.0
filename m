Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from faui40.informatik.uni-erlangen.de ([131.188.34.40]:37385 "EHLO
        faui40.informatik.uni-erlangen.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S935680AbeFMPVD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Jun 2018 11:21:03 -0400
From: Jakob Albert <jakob.j.albert@fau.de>
To: devel@linuxdriverproject.org
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lorenz Kaestle <lorenz.kaestle@fau.de>,
        linux-kernel@i4.cs.fau.de, Jakob Albert <jakob.j.albert@fau.de>
Subject: [PATCH v2 1/3] hwmon: (nct7904) Fix SPACING errors
Date: Wed, 13 Jun 2018 17:13:23 +0200
Message-Id: <1528902805-21474-2-git-send-email-jakob.j.albert@fau.de>
In-Reply-To: <1528902805-21474-1-git-send-email-jakob.j.albert@fau.de>
References: <1528902805-21474-1-git-send-email-jakob.j.albert@fau.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Fix SPACING errors reported by checkpatch.pl

Signed-off-by: Lorenz Kaestle <lorenz.kaestle@fau.de>
Signed-off-by: Jakob Albert <jakob.j.albert@fau.de>
---
v1->v2:	Changed patch subject and description

 drivers/hwmon/nct7904.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/nct7904.c b/drivers/hwmon/nct7904.c
index 95a68ab..7de2421 100644
--- a/drivers/hwmon/nct7904.c
+++ b/drivers/hwmon/nct7904.c
@@ -159,7 +159,7 @@ static int nct7904_read_fan(struct device *dev, u32 attr, int channel,
 	unsigned int cnt, rpm;
 	int ret;
 
-	switch(attr) {
+	switch (attr) {
 	case hwmon_fan_input:
 		ret = nct7904_read_reg16(data, BANK_0,
 					 FANIN1_HV_REG + channel * 2);
@@ -200,7 +200,7 @@ static int nct7904_read_in(struct device *dev, u32 attr, int channel,
 
 	index = nct7904_chan_to_index[channel];
 
-	switch(attr) {
+	switch (attr) {
 	case hwmon_in_input:
 		ret = nct7904_read_reg16(data, BANK_0,
 					 VSEN1_HV_REG + index * 2);
@@ -236,7 +236,7 @@ static int nct7904_read_temp(struct device *dev, u32 attr, int channel,
 	struct nct7904_data *data = dev_get_drvdata(dev);
 	int ret, temp;
 
-	switch(attr) {
+	switch (attr) {
 	case hwmon_temp_input:
 		if (channel == 0)
 			ret = nct7904_read_reg16(data, BANK_0, LTD_HV_REG);
@@ -276,7 +276,7 @@ static int nct7904_read_pwm(struct device *dev, u32 attr, int channel,
 	struct nct7904_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	switch(attr) {
+	switch (attr) {
 	case hwmon_pwm_input:
 		ret = nct7904_read_reg(data, BANK_3, FANCTL1_OUT_REG + channel);
 		if (ret < 0)
@@ -301,7 +301,7 @@ static int nct7904_write_pwm(struct device *dev, u32 attr, int channel,
 	struct nct7904_data *data = dev_get_drvdata(dev);
 	int ret;
 
-	switch(attr) {
+	switch (attr) {
 	case hwmon_pwm_input:
 		if (val < 0 || val > 255)
 			return -EINVAL;
@@ -322,7 +322,7 @@ static int nct7904_write_pwm(struct device *dev, u32 attr, int channel,
 
 static umode_t nct7904_pwm_is_visible(const void *_data, u32 attr, int channel)
 {
-	switch(attr) {
+	switch (attr) {
 	case hwmon_pwm_input:
 	case hwmon_pwm_enable:
 		return S_IRUGO | S_IWUSR;
-- 
2.7.4

