Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fPp9aPxW"
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 46AA5E8;
	Sun,  3 Dec 2023 01:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=WiReZGbdyXdM2Brh1y
	yxhHq+j+ZmAyhep9YRbr+YaAk=; b=fPp9aPxWZzgKmPZmx2gLz8ieKRnZ6MlGrg
	GLlW5YME/uqQXXkABbbXdLXOkHMfE+8ISbR7iPrvNVq0WZGlCAoRiQoAqzVjUtXT
	Twbw8hnHSRSQdTk8jChC/FTUzVEeUbH0uEwQAvx67BR8C/LLK5Eh3l2uYUg+Z6kW
	Z9jDT8fqw=
Received: from localhost.localdomain (unknown [39.144.190.5])
	by zwqz-smtp-mta-g1-4 (Coremail) with SMTP id _____wC3fxuLSWxlCBn1EQ--.215S2;
	Sun, 03 Dec 2023 17:25:31 +0800 (CST)
From: Haoran Liu <liuhaoran14@163.com>
To: jdelvare@suse.com
Cc: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoran Liu <liuhaoran14@163.com>
Subject: [PATCH] [hwmon] pcf8591: Add error handling for i2c_smbus_write_byte
Date: Sun,  3 Dec 2023 01:25:18 -0800
Message-Id: <20231203092518.38479-1-liuhaoran14@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:_____wC3fxuLSWxlCBn1EQ--.215S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF1DAr43Gw4UCF4fJw4kCrg_yoW8Ar43p3
	yDGws0kF1UJa17uan7tF48Wr13t3y8XrW7GrWDK3s5ZF45ZF92gFW8Ka4Fga4Uur93Z3W7
	Zw10qryY9F1UAFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zifgA3UUUUU=
X-CM-SenderInfo: xolxxtxrud0iqu6rljoofrz/1tbiZQc7gl8ZaX6O9QAAsx
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

This patch adds error handling to the out0_enable_store function in
drivers/hwmon/pcf8591.c for the i2c_smbus_write_byte call. This issue was
identified through static analysis, which indicated that the function
previously did not handle potential failures of i2c_smbus_write_byte.
The lack of error handling could lead to silent failures and unpredictable
behavior in the PCF8591 driver.

Although the error addressed by this patch may not occur in the current
environment, I still suggest implementing these error handling routines
if the function is not highly time-sensitive. As the environment evolves
or the code gets reused in different contexts, there's a possibility that
these errors might occur. In case you find this addition unnecessary, I
completely understand and respect your perspective. My intention was to
enhance the robustness of the code, but I acknowledge that practical
considerations and current functionality might not warrant this change
at this point.

Signed-off-by: Haoran Liu <liuhaoran14@163.com>
---
 drivers/hwmon/pcf8591.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pcf8591.c b/drivers/hwmon/pcf8591.c
index 66c76b28c9e0..2a12b024214c 100644
--- a/drivers/hwmon/pcf8591.c
+++ b/drivers/hwmon/pcf8591.c
@@ -147,8 +147,12 @@ static ssize_t out0_enable_store(struct device *dev,
 		data->control |= PCF8591_CONTROL_AOEF;
 	else
 		data->control &= ~PCF8591_CONTROL_AOEF;
-	i2c_smbus_write_byte(client, data->control);
+	err = i2c_smbus_write_byte(client, data->control);
 	mutex_unlock(&data->update_lock);
+
+	if (err)
+		return err;
+
 	return count;
 }
 
-- 
2.17.1

