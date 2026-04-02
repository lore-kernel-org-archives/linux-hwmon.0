Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663B63AC0DC;
	Thu,  2 Apr 2026 08:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775117696; cv=none; b=Bnmt1f5ye32O+r2FazSxYc2WE31MkBmRdtVeYJ3rv2BIJTS1Y+sUa860JGoHQu0EgfMQyAC4Ii86JYdx/9XLFkn/FByLoBuJ/HHyjv+VotdCcGHQAWLiAwM5au6Pse9Dg2pPmKeBSyCiPG/HXuElrfondf6UiN3Iv1bSmR4aaBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775117696; c=relaxed/simple;
	bh=RcMOdqYu5TvuQZDnLP8+QyQF88MjCyHjX3Rp7X4TnG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Ki2xWQQHdvN9Adh4L6J7TFAyMqDgP0h52JJ0xoGoGAf0iNCfJe3fXWcOUwSP7BenC8oJgH4mTCnDEq6mzWXRxFrYW9IZcqkDd9GPNVw9T4oKUQC5lnMG0zbE9hQnCjF/swUwE2jxayxIWTMqRqTAIdJCf1dHY2rJlEyOzanOny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=X4J6STUU; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="X4J6STUU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id; bh=Db6F/i2fxqIf0br
	PXZ5J4Mm3zRMaUQ9mbqJ+YfLoT7Y=; b=X4J6STUUQB1iFC+CVj2FdCTKo9j8J+r
	dg7Q/laHs/oPsyNyzdsC+tOSTW5pD48swlN0119QTKvUQ30dKrot+AW2qifzBpAl
	5IMYI3JstoRxPBP/Bxya7IC2lOvKyy+aUL+QPUN0sRHIDLMXHNClP/ZscCtHmJba
	gwe9S4pc8k44=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCX5UBEJc5pC9uuUw--.170S8;
	Thu, 02 Apr 2026 16:14:09 +0800 (CST)
From: Wenliang Yan <wenliang202407@163.com>
To: linux@roeck-us.net,
	Jean Delvare <jdelvare@suse.com>
Cc: Wenliang Yan <wenliang202407@163.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/8] hwmon: (ina3221) Modify the 'ina3221_read_value' function
Date: Thu,  2 Apr 2026 04:13:48 -0400
Message-Id: <20260402081350.65559-7-wenliang202407@163.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260402081350.65559-1-wenliang202407@163.com>
References: <20260402081350.65559-1-wenliang202407@163.com>
X-CM-TRANSID:QCgvCgCX5UBEJc5pC9uuUw--.170S8
X-Coremail-Antispam: 1Uf129KBjvJXoWxCF4rJw1UXrW8Jr1ruw1rZwb_yoW5ury7pa
	4fCF1Fyr17tr1IqwsakFn5GFyrAryxW34jqrnFg3yxZa1UJ3W0gw1ktw4Fvr4rC3Z8ZF1k
	X3srWw48u3ZrJFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUWRR_UUUUU=
X-CM-SenderInfo: xzhqzxhdqjjiisuqlqqrwthudrp/xtbC5xJrP2nOJVK53QAA3V
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

SQ52210 adds power, current, and limit registers. The ina3221_read_value
function has been refactored to adapt to the new register data reading
format.

Signed-off-by: Wenliang Yan <wenliang202407@163.com>
---
 drivers/hwmon/ina3221.c | 67 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
index a39f5f2c486b..06e42512a235 100644
--- a/drivers/hwmon/ina3221.c
+++ b/drivers/hwmon/ina3221.c
@@ -66,6 +66,14 @@
 #define INA3221_MASK_ENABLE_SCC_MASK	GENMASK(14, 12)
 
 #define SQ52210_ALERT_CONFIG_MASK	GENMASK(15, 4)
+#define SQ52210_MASK_ALERT_CHANNEL1 (BIT(15) | BIT(12) | BIT(9) | BIT(6))
+#define SQ52210_MASK_ALERT_CHANNEL2 (BIT(14) | BIT(11) | BIT(8) | BIT(5))
+#define SQ52210_MASK_ALERT_CHANNEL3 (BIT(13) | BIT(10) | BIT(7) | BIT(4))
+
+#define SQ52210_ALERT_ALL_SUL_MASK	(BIT(15) | BIT(14) | BIT(13))
+#define SQ52210_ALERT_ALL_BOL_MASK	(BIT(12) | BIT(11) | BIT(10))
+#define SQ52210_ALERT_ALL_BUL_MASK	(BIT(9) | BIT(8) | BIT(7))
+#define SQ52210_ALERT_ALL_POL_MASK	(BIT(6) | BIT(5) | BIT(4))
 
 #define INA3221_CONFIG_DEFAULT		0x7127
 #define INA3221_RSHUNT_DEFAULT		10000
@@ -108,6 +116,13 @@ enum ina3221_channels {
 	INA3221_NUM_CHANNELS
 };
 
+enum sq52210_alert_types {
+	SQ52210_ALERT_SUL,
+	SQ52210_ALERT_BOL,
+	SQ52210_ALERT_BUL,
+	SQ52210_ALERT_POL
+};
+
 /**
  * struct ina3221_input - channel input source specific information
  * @label: label of channel input source
@@ -284,13 +299,59 @@ static int ina3221_read_value(struct ina3221_data *ina, unsigned int reg,
 
 	/*
 	 * Shunt Voltage Sum register has 14-bit value with 1-bit shift
+	 * Current registers have 15-bit value
+	 * Power registers have 16-bit value
+	 * ALERT_LIMIT registers have 16-bit value with 3-bit shift
 	 * Other Shunt Voltage registers have 12 bits with 3-bit shift
 	 */
-	if (reg == INA3221_SHUNT_SUM || reg == INA3221_CRIT_SUM)
+	switch (reg) {
+	case INA3221_SHUNT_SUM:
+	case INA3221_CRIT_SUM:
 		*val = sign_extend32(regval >> 1, 14);
-	else
+		break;
+	case SQ52210_CURRENT1:
+	case SQ52210_CURRENT2:
+	case SQ52210_CURRENT3:
+		*val = sign_extend32(regval, 15);
+		break;
+	case SQ52210_POWER1:
+	case SQ52210_POWER2:
+	case SQ52210_POWER3:
+		*val = regval;
+		break;
+	case INA3221_BUS1:
+	case INA3221_BUS2:
+	case INA3221_BUS3:
+	case INA3221_SHUNT1:
+	case INA3221_SHUNT2:
+	case INA3221_SHUNT3:
+	case INA3221_WARN1:
+	case INA3221_WARN2:
+	case INA3221_WARN3:
+	case INA3221_CRIT1:
+	case INA3221_CRIT2:
+	case INA3221_CRIT3:
 		*val = sign_extend32(regval >> 3, 12);
-
+		break;
+	case SQ52210_ALERT_LIMIT1:
+	case SQ52210_ALERT_LIMIT2:
+	case SQ52210_ALERT_LIMIT3:
+		/*
+		 * This register is a 16-bit register with the lower 3 bits fixed at 0.
+		 * When used to store bus and shunt alert values, shifting is required.
+		 * However, for POL (Power Over Limit), it functions as a 16-bit unsigned
+		 * register where the lower 3 bits being fixed at 0 will result in some
+		 * loss of precision.
+		 */
+		if (ina->alert_type_select & SQ52210_ALERT_ALL_POL_MASK)
+			*val = regval;
+		else
+			*val = sign_extend32(regval >> 3, 12);
+		break;
+	default:
+		*val = 0;
+		return -EOPNOTSUPP;
+	}
 	return 0;
 }
 
-- 
2.17.1

