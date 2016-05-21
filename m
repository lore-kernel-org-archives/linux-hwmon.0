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
Subject: [PATCH 0040/1529] Fix typo
Date: Sat, 21 May 2016 13:41:00 +0200
Message-Id: <20160521114100.980-1-andrea.gelmini@gelma.net>
List-ID: <linux-hwmon@vger.kernel.org>

Signed-off-by: Andrea Gelmini <andrea.gelmini@gelma.net>
---
 Documentation/hwmon/abituguru | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/abituguru b/Documentation/hwmon/abituguru
index f1d4fe4..44013d2 100644
--- a/Documentation/hwmon/abituguru
+++ b/Documentation/hwmon/abituguru
@@ -24,7 +24,7 @@ Supported chips:
 				 AW9D-MAX) (2)
 	1) For revisions 2 and 3 uGuru's the driver can autodetect the
 	   sensortype (Volt or Temp) for bank1 sensors, for revision 1 uGuru's
-	   this doesnot always work. For these uGuru's the autodection can
+	   this does not always work. For these uGuru's the autodetection can
 	   be overridden with the bank1_types module param. For all 3 known
 	   revison 1 motherboards the correct use of this param is:
 	   bank1_types=1,1,0,0,0,0,0,2,0,0,0,0,2,0,0,1
-- 
2.8.2.534.g1f66975
