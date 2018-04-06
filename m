Return-Path: <sudeep.holla@arm.com>
Return-path: <sudeep.holla@arm.com>
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (scmi) handle absence of few types of sensors
Date: Fri,  6 Apr 2018 16:30:47 +0100
Message-Id: <1523028647-21849-1-git-send-email-sudeep.holla@arm.com>
List-ID: <linux-hwmon@vger.kernel.org>

Currently the loop checks for non-zero count of sensors for each type
of sensors which is completely wrong. It also results in aborting the
registration of sensors if one or more types of sensors are completely
not supported by the platform SCMI firmware.

This patch fixes the issue by continue to loop and skiping sensor types
that are not present.

Fixes: b23688aefb8b ("hwmon: add support for sensors exported via ARM SCMI")
Reported-by: Jim Quinlan <james.quinlan@broadcom.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/hwmon/scmi-hwmon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 363bf56eb0f2..91976b6ca300 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -170,7 +170,10 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 	scmi_chip_info.info = ptr_scmi_ci;
 	chip_info = &scmi_chip_info;
 
-	for (type = 0; type < hwmon_max && nr_count[type]; type++) {
+	for (type = 0; type < hwmon_max; type++) {
+		if (!nr_count[type])
+			continue;
+
 		scmi_hwmon_add_chan_info(scmi_hwmon_chan, dev, nr_count[type],
 					 type, hwmon_attributes[type]);
 		*ptr_scmi_ci++ = scmi_hwmon_chan++;
-- 
2.7.4
