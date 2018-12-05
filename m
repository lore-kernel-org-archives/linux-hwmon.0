Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729995AbeLEJzd (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 5 Dec 2018 04:55:33 -0500
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Huacai Chen <chenhc@lemote.com>, Yao Wang <wangyao@lemote.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Sasha Levin <sashal@kernel.org>, linux-hwmon@vger.kernel.org
Subject: [PATCH AUTOSEL 3.18 05/26] hwmon: (w83795) temp4_type has writable permission
Date: Wed,  5 Dec 2018 04:54:09 -0500
Message-Id: <20181205095430.8019-5-sashal@kernel.org>
In-Reply-To: <20181205095430.8019-1-sashal@kernel.org>
References: <20181205095430.8019-1-sashal@kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: Huacai Chen <chenhc@lemote.com>

[ Upstream commit 09aaf6813cfca4c18034fda7a43e68763f34abb1 ]

Both datasheet and comments of store_temp_mode() tell us that temp1~4_type
is writable, so fix it.

Signed-off-by: Yao Wang <wangyao@lemote.com>
Signed-off-by: Huacai Chen <chenhc@lemote.com>
Fixes: 39deb6993e7c (" hwmon: (w83795) Simplify temperature sensor type handling")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/hwmon/w83795.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83795.c b/drivers/hwmon/w83795.c
index 21894131190f..9b838fff7e4d 100644
--- a/drivers/hwmon/w83795.c
+++ b/drivers/hwmon/w83795.c
@@ -1693,7 +1693,7 @@ store_sf_setup(struct device *dev, struct device_attribute *attr,
  * somewhere else in the code
  */
 #define SENSOR_ATTR_TEMP(index) {					\
-	SENSOR_ATTR_2(temp##index##_type, S_IRUGO | (index < 4 ? S_IWUSR : 0), \
+	SENSOR_ATTR_2(temp##index##_type, S_IRUGO | (index < 5 ? S_IWUSR : 0), \
 		show_temp_mode, store_temp_mode, NOT_USED, index - 1),	\
 	SENSOR_ATTR_2(temp##index##_input, S_IRUGO, show_temp,		\
 		NULL, TEMP_READ, index - 1),				\
-- 
2.17.1
