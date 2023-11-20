Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="exk3C/Uh"
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5BC6AED;
	Mon, 20 Nov 2023 00:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hgq9Z
	CjqvMpwCSb1biw4ArBkdPTWEHtoxNKDFAzpN0k=; b=exk3C/Uhfftv5amfG00sR
	AY3Vc7WhJv1YhR6kpFwPbhJ2I8uF5NgpDHqjcw/3MxJpAVK79Z3Zu3F9fgA+6jB+
	vgDqDhOopCLYV7XwlKzOYOCJK/y8DK457xb/rOeKVby8av0dup0LsaZ16oHBqO1S
	HDDQGVhCG/Ef5sJS5uaduc=
Received: from localhost.localdomain (unknown [39.144.137.207])
	by zwqz-smtp-mta-g3-2 (Coremail) with SMTP id _____wDH52myFVtlTcE1Dg--.30221S4;
	Mon, 20 Nov 2023 16:15:50 +0800 (CST)
From: Xing Tong Wu <xingtong_wu@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: xingtong.wu@siemens.com,
	tobias.schaffner@siemens.com,
	gerd.haeussler.ext@siemens.com
Subject: [PATCH v2 2/2] hwmon: (nct6775) Fix fan speed set failure in automatic mode
Date: Mon, 20 Nov 2023 16:15:42 +0800
Message-Id: <20231120081542.3174-3-xingtong_wu@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120081542.3174-1-xingtong_wu@163.com>
References: <20231120081542.3174-1-xingtong_wu@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDH52myFVtlTcE1Dg--.30221S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWDWr4UXw45ZrykWrWfZrb_yoWfKFb_Ww
	4F93s7urs8tF1ak34q9FyFyFy5tFW5WFWxXFnFg3s8Ja4jvw1DAFyvqr9Fqw17CFW29FyD
	Wa17WrW0934UCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeo7K5UUUUU==
X-Originating-IP: [39.144.137.207]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/1tbiEBwu0F8YMmhU7wAAsU

From: Xing Tong Wu <xingtong.wu@siemens.com>

Setting the fan speed is only valid in manual mode; it is not possible
to set the fan's speed in automatic mode.
Return error when attempting to set the fan speed in automatic mode.

Signed-off-by: Xing Tong Wu <xingtong.wu@siemens.com>
---
 drivers/hwmon/nct6775-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index c24b2c312911..38c2e5b7cfe9 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -2556,6 +2556,13 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 	int err;
 	u16 reg;
 
+	/*
+	 * The fan control mode should be set to manual if the user wants to adjust
+	 * the fan speed. Otherwise, it will fail to set.
+	 */
+	if (index == 0 && data->pwm_enable[nr] > manual)
+		return -EBUSY;
+
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
 		return err;
-- 
2.25.1

