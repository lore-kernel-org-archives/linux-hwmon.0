Return-Path: <natechancellor@gmail.com>
Return-path: <natechancellor@gmail.com>
From: Nathan Chancellor <natechancellor@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] hwmon: scmi: Remove redundant pointer check
Date: Sat, 15 Sep 2018 17:05:07 -0700
Message-Id: <20180916000506.28905-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

Clang warns when the address of a pointer is used in a boolean context
as it will always return true.

drivers/hwmon/scmi-hwmon.c:59:24: warning: address of array
'sensor->name' will always evaluate to 'true'
[-Wpointer-bool-conversion]
        if (sensor && sensor->name)
                   ~~ ~~~~~~~~^~~~
1 warning generated.

Remove the check as it isn't doing anything currently; if validation
of the contents of the data structure was intended by the original
author (since this line has been present from the first version of
this driver), it can be added in a follow-up patch.

Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/hwmon/scmi-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 91976b6ca300..2e005edee0c9 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -56,7 +56,7 @@ scmi_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	const struct scmi_sensors *scmi_sensors = drvdata;
 
 	sensor = *(scmi_sensors->info[type] + channel);
-	if (sensor && sensor->name)
+	if (sensor)
 		return S_IRUGO;
 
 	return 0;
-- 
2.19.0
