Return-path: <jdelvare@suse.de>
Date: Mon, 29 Aug 2016 13:33:29 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-hwmon@vger.kernel.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Guenter Roeck
 <linux@roeck-us.net>
Subject: [PATCH 2/2] hwmon: (it87) Drop useless comments
Message-ID: <20160829133329.5c66af98@endymion>
In-Reply-To: <20160829131823.776dd67b@endymion>
References: <20160829131823.776dd67b@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Remove the index comments at the end of it87_attributes_in. They
serve no purpose (as there is no reference to them in
it87_in_is_visible) and some of them were obviously wrong.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/it87.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-4.7.orig/drivers/hwmon/it87.c	2016-08-29 12:04:52.926911625 +0200
+++ linux-4.7/drivers/hwmon/it87.c	2016-08-29 13:11:57.311949805 +0200
@@ -2011,10 +2011,10 @@ static struct attribute *it87_attributes
 	&sensor_dev_attr_in7_beep.dev_attr.attr,	/* 39 */
 
 	&sensor_dev_attr_in8_input.dev_attr.attr,	/* 40 */
-	&sensor_dev_attr_in9_input.dev_attr.attr,	/* 41 */
-	&sensor_dev_attr_in10_input.dev_attr.attr,	/* 41 */
-	&sensor_dev_attr_in11_input.dev_attr.attr,	/* 41 */
-	&sensor_dev_attr_in12_input.dev_attr.attr,	/* 41 */
+	&sensor_dev_attr_in9_input.dev_attr.attr,
+	&sensor_dev_attr_in10_input.dev_attr.attr,
+	&sensor_dev_attr_in11_input.dev_attr.attr,
+	&sensor_dev_attr_in12_input.dev_attr.attr,
 	NULL
 };
 

-- 
Jean Delvare
SUSE L3 Support
