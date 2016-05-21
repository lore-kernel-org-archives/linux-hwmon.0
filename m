Return-path: <andrea.gelmini@gmail.com>
Sender: Andrea Gelmini <andrea.gelmini@gmail.com>
From: Andrea Gelmini <andrea.gelmini@gelma.net>
To: andrea.gelmini@gelma.net
Cc: trivial@kernel.org,
	jdelvare@suse.com,
	linux@roeck-us.net,
	corbet@lwn.net,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 0041/1529] Fix typo
Date: Sat, 21 May 2016 13:41:07 +0200
Message-Id: <20160521114107.1029-1-andrea.gelmini@gelma.net>
List-ID: <linux-hwmon@vger.kernel.org>

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 Documentation/hwmon/max1668 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max1668 b/Documentation/hwmon/max1668
index 0616ed9..8f9d570 100644
--- a/Documentation/hwmon/max1668
+++ b/Documentation/hwmon/max1668
@@ -17,7 +17,7 @@ This driver implements support for the Maxim MAX1668, MAX1805 and MAX1989
 chips.
 
 The three devices are very similar, but the MAX1805 has a reduced feature
-set; only two remote temperature inputs vs the four avaible on the other
+set; only two remote temperature inputs vs the four available on the other
 two ICs.
 
 The driver is able to distinguish between the devices and creates sysfs
-- 
2.8.2.534.g1f66975
