Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="UjQpQ+yd"
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 72DA7E3;
	Tue, 21 Nov 2023 00:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ivtSy
	t16d/q/4hJmFH8wkKbGBmxit30g3vcK59BKTWo=; b=UjQpQ+ydwcmU2U/RDwMLt
	OgkISEd+zpBzgIM0inBdR910o5ZFYz+h0r8WNohLxD4CdjxSAy9l7iRTtDtyBXMT
	t7bDq+/fuDyuvAUM5k8Et9AlsNFzl2Pzs/kjjkwJcw3/mUbkufCWCeSmuIvqRMRL
	5RcdYClFNeqyemhdZVFKYM=
Received: from localhost.localdomain (unknown [39.144.137.247])
	by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wAn9ctEZ1xlUJ6BDg--.31532S4;
	Tue, 21 Nov 2023 16:16:08 +0800 (CST)
From: Xing Tong Wu <xingtong_wu@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: xingtong.wu@siemens.com,
	tobias.schaffner@siemens.com,
	gerd.haeussler.ext@siemens.com
Subject: [PATCH v3 2/2] hwmon: (nct6775) Fix fan speed set failure in automatic mode
Date: Tue, 21 Nov 2023 16:16:04 +0800
Message-Id: <20231121081604.2499-3-xingtong_wu@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121081604.2499-1-xingtong_wu@163.com>
References: <20231121081604.2499-1-xingtong_wu@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAn9ctEZ1xlUJ6BDg--.31532S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWDWr4UXw45ZrykWrWfZrb_yoWfKFb_Ww
	4F93s7urs8tF1Sk34DuF9Yya4UtFW5WF4xXFnFg3sxJFyjvwn8ZFyvqr9Fqw12kFW29FyD
	Gw47WrWF934UCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeFApUUUUUU==
X-Originating-IP: [39.144.137.247]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/xtbBnAov0FghlftTwAABss

From: Xing Tong Wu <xingtong.wu@siemens.com>

Setting the fan speed is only valid in manual mode; it is not possible
to set the fan's speed in automatic mode.
Return error when attempting to set the fan speed in automatic mode.

Signed-off-by: Xing Tong Wu <xingtong.wu@siemens.com>
---
 drivers/hwmon/nct6775-core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 88300fb99bb9..83f1da5acd22 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -2553,6 +2553,13 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
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

