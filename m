Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HU+z765s"
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 13FF1F4;
	Tue, 21 Nov 2023 00:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4veKM
	2idkxDDgkcK+uihBiUql8CUiZEyW6WHc/2gF70=; b=HU+z765sz6BuAgsDLcSzC
	JomsSIuZiQpGRtj1+7fe7jhrF1Fdku+HzMY8jE75g32t6g3aH8O2q1f1pdTMwnem
	6yo4WEdW1UfXs2LfLISRpmd1+ueYGrKDepBFzZjrqZwxGFjzIFuWk+aF4obuQQFN
	6tEfOiPijs2/PFPHfizP/4=
Received: from localhost.localdomain (unknown [39.144.137.247])
	by zwqz-smtp-mta-g2-0 (Coremail) with SMTP id _____wAn9ctEZ1xlUJ6BDg--.31532S3;
	Tue, 21 Nov 2023 16:16:07 +0800 (CST)
From: Xing Tong Wu <xingtong_wu@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: xingtong.wu@siemens.com,
	tobias.schaffner@siemens.com,
	gerd.haeussler.ext@siemens.com
Subject: [PATCH v3 1/2] hwmon: (nct6775) Add support for 2 additional fan controls
Date: Tue, 21 Nov 2023 16:16:03 +0800
Message-Id: <20231121081604.2499-2-xingtong_wu@163.com>
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
X-CM-TRANSID:_____wAn9ctEZ1xlUJ6BDg--.31532S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW3ZFWfGr1UCFyrKFyUWrg_yoW8Wr1fpF
	ykX3ySy3Wrt3Waqry3Ga1rua13Cwn7G34Syw18CwsakFn5tayxXF43tryvyw1YvFWfJa42
	9FykZFWYq3WDGrUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzZXrUUUUU=
X-Originating-IP: [39.144.137.247]
X-CM-SenderInfo: p0lqw35rqjs4rx6rljoofrz/xtbBnAov0FghlftTwAAAst

From: Xing Tong Wu <xingtong.wu@siemens.com>

The nct6116 has 2 additional PWM pins compared to the nct6106.
Extend the nct6106 PWM arrays to support the nct6116.

Signed-off-by: Xing Tong Wu <xingtong.wu@siemens.com>
---
 drivers/hwmon/nct6775-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775-core.c b/drivers/hwmon/nct6775-core.c
index d928eb8ae5a3..88300fb99bb9 100644
--- a/drivers/hwmon/nct6775-core.c
+++ b/drivers/hwmon/nct6775-core.c
@@ -767,9 +767,9 @@ static const u16 NCT6106_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe4 };
 static const u16 NCT6106_REG_FAN_PULSES[] = { 0xf6, 0xf6, 0xf6 };
 static const u16 NCT6106_FAN_PULSE_SHIFT[] = { 0, 2, 4 };
 
-static const u8 NCT6106_REG_PWM_MODE[] = { 0xf3, 0xf3, 0xf3 };
-static const u8 NCT6106_PWM_MODE_MASK[] = { 0x01, 0x02, 0x04 };
-static const u16 NCT6106_REG_PWM_READ[] = { 0x4a, 0x4b, 0x4c };
+static const u8 NCT6106_REG_PWM_MODE[] = { 0xf3, 0xf3, 0xf3, 0, 0 };
+static const u8 NCT6106_PWM_MODE_MASK[] = { 0x01, 0x02, 0x04, 0, 0 };
+static const u16 NCT6106_REG_PWM_READ[] = { 0x4a, 0x4b, 0x4c, 0xd8, 0xd9 };
 static const u16 NCT6106_REG_FAN_MODE[] = { 0x113, 0x123, 0x133 };
 static const u16 NCT6106_REG_TEMP_SOURCE[] = {
 	0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5 };
@@ -3595,7 +3595,7 @@ int nct6775_probe(struct device *dev, struct nct6775_data *data,
 		break;
 	case nct6116:
 		data->in_num = 9;
-		data->pwm_num = 3;
+		data->pwm_num = 5;
 		data->auto_pwm_num = 4;
 		data->temp_fixed_num = 3;
 		data->num_temp_alarms = 3;
-- 
2.25.1

