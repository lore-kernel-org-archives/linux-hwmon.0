Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="kzXMORIJ"
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.216])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 02F6C19F;
	Wed, 15 Nov 2023 18:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=cHgkt
	6wFw4yulka3yAnNtGtv/ycgWvgfCPluWVrqKrA=; b=kzXMORIJgWIWLtVcRBc6+
	CHeJZmWclLrJHzUWHTD+48VXG07e45AXH1BXU+NO/pGWL7xLsEDaknuskHNX+f/W
	KOgLW4dXiv7qJfKdb+CRmIIygvCNbOEOhVNFbHJzS9ZrAIwaxMUXUIHczM5GU0Me
	CJcOEsJLJOxemzngAD7zUc=
Received: from localhost.localdomain (unknown [39.144.137.125])
	by zwqz-smtp-mta-g4-4 (Coremail) with SMTP id _____wD3H2U+fVVl5bnXDA--.19779S4;
	Thu, 16 Nov 2023 10:24:09 +0800 (CST)
From: Xing Tong Wu <xingtong_wu@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: xingtong.wu@siemens.com,
	tobias.schaffner@siemens.com,
	gerd.haeussler.ext@siemens.com
Subject: [PATCH 2/3] hwmon: (nct6775) Fix logic error for PWM enable
Date: Thu, 16 Nov 2023 10:23:29 +0800
Message-Id: <20231116022330.2696-3-xingtong_wu@163.com>
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
X-CM-TRANSID:_____wD3H2U+fVVl5bnXDA--.19779S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wry8Kr4xXw17trWfGF4Uurg_yoWkKFX_Ww
	4rGrZ7Zw1Y9r13CF4jgF4rtFW2ka1UWr17Jw1xKa98J347AFn5Cr1kXrZxZrnru3yDZF93
	Xa1DAr4Iy342vjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUeo7K5UUUUU==
X-Originating-IP: [39.144.137.125]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/1tbiTA4q0GI0cSnRZAAAsD

From: Xing Tong Wu <xingtong.wu@siemens.com>

The determination of the "pwm_enable" should be based solely on the mode,
regardless of the pwm value.
According to the specification, the default values for pwm and pwm_enable
are 255 and 0 respectively. However, there is a bug in the code where the
fan control is actually enabled, but the file "pwm_enable" incorrectly
displays "off", indicating that fan control is disabled. This contradiction
needs to be addressed and resolved.
Solution: Update the logic so that "pwm_enable" is determined by mode + 1,
remove the "off" value for "pwm_enable" since it is not specified in the
documentation.

Signed-off-by: Xing Tong Wu <xingtong.wu@siemens.com>
---
 drivers/hwmon/nct6775-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index 2111f0cd9787..575db6cb96e9 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -900,8 +900,6 @@ static const u16 NCT6116_REG_TSI_TEMP[] = { 0x59, 0x5b };
 
 static enum pwm_enable reg_to_pwm_enable(int pwm, int mode)
 {
-	if (mode == 0 && pwm == 255)
-		return off;
 	return mode + 1;
 }
 
-- 
2.25.1

