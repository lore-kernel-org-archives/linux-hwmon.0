Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LYczdvfh"
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id EDC391BFC;
	Wed, 15 Nov 2023 18:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=S3N+U
	nTP8NAOW5Vw5F6SLjig+wZLk03Ej/o8rB18V/A=; b=LYczdvfh/HrdJWsUUPgi/
	FcdQ/VKr6Vd9UcLGnCFuTmCQfcr9nJV4RHMV7hqaICCvNrrKUBNP8/XvKSLLK1jA
	5Gy1FDlsgY8IxHVffbhGWMV0ltJJIjNCYPXnKG6VZQ9ND1tzq9kWN5l8pHVzZEvX
	VF1DoCeQlfXDtMOf/MHC4M=
Received: from localhost.localdomain (unknown [39.144.137.125])
	by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wD3H2U+fVVl5bnXDA--.19779S5;
	Thu, 16 Nov 2023 10:24:13 +0800 (CST)
From: Xing Tong Wu <xingtong_wu@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: xingtong.wu@siemens.com,
	tobias.schaffner@siemens.com,
	gerd.haeussler.ext@siemens.com
Subject: [PATCH 3/3] hwmon: (nct6775) Fix fan speed set failure in automatic mode
Date: Thu, 16 Nov 2023 10:23:30 +0800
Message-Id: <20231116022330.2696-4-xingtong_wu@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116022330.2696-1-xingtong_wu@163.com>
References: <20231116022330.2696-1-xingtong_wu@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3H2U+fVVl5bnXDA--.19779S5
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWDWr4UWryUtFy5Ar4UXFb_yoWDZrb_uw
	4F939rAwnYqF43Aa4DCFWSqFyUtF48WF48XFn2ga98ta4UZw1DXF1kXryaqw12vrWIvFyD
	Xw4UWrWI9ry7CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUet8nUUUUUU==
X-Originating-IP: [39.144.137.125]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/xtbBnBMq0FghlXwhQwAAsH

From: Xing Tong Wu <xingtong.wu@siemens.com>

Setting the fan speed is only valid in manual mode; it is not possible
to set the fan's speed in automatic mode.
Return error and show error message when attempting to set the fan
speed in automatic mode.

Signed-off-by: Xing Tong Wu <xingtong.wu@siemens.com>
---
 drivers/hwmon/nct6775-core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 575db6cb96e9..3fb9896c61ce 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -2551,6 +2551,14 @@ store_pwm(struct device *dev, struct device_attribute *attr, const char *buf,
 	int err;
 	u16 reg;
 
+	if (index == 0 && data->pwm_enable[nr] != manual) {
+		dev_err(dev,
+			"The pwm%d doesn't support manual fan speed control in automatic mode.\n",
+			nr + 1);
+		dev_err(dev, "Please set pwm%d_enable to manual mode.\n", nr + 1);
+		return -EOPNOTSUPP;
+	}
+
 	err = kstrtoul(buf, 10, &val);
 	if (err < 0)
 		return err;
-- 
2.25.1

