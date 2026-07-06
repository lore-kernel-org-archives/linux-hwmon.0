Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001B384228
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363645; cv=none; b=U+7Sf9bdcL3BoW4d42Ydklzq0Q+pjuSCWgSrQSA6YtmuCv3LzZuwz2kDBgiPAFuj5Kv7AyWqZW49x8dVXi7Mduea0uLz9Ns+sLcROlezMtfoKwLZK2dgwznfJoylPWtKkvaJrLKmKxmj7GB0rQr4nBx3t9BswzzTFMNbfvLF10Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363645; c=relaxed/simple;
	bh=XuDp4kjrw2H2fUuAHg/ju4C6RQwwi7eFtM44uQ+mQv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rBQVQ46T4SWCqREfnpcTKADo4Mdltpuk05HKiIlTZ4IB0X7F5Qqhzh0PTWFwxDKtqJr6P8SHyj27t9xhN6YKZvXTl1/C/g5yJMhXqJM53biMF/DbtIe0QT6udQq51PIxAbPLGTQPnf+rAkDdmP4oPCjkyUhTEuh63CktLAXWTPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIyO2zBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmrBZyAt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIyO2zBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UmrBZyAt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBGe958645
	for <linux-hwmon@vger.kernel.org>; Mon, 6 Jul 2026 18:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ophF+H15iaR5xZlG1rhaTri3f/JAUP8K4yYfGyQM8lE=; b=iIyO2zBsGUILNrc8
	U+zsszSvlCo2x43np3cPiD29bktjqmzhwbaOcuZusb8KrqWo2bjvSotaVMYBtfoc
	bMynGcj3dh/AX0oVLkVt/fo08EKj66f80xrqqvghTBFsLAQv6jdQ9evCnxJ+tazz
	syrYTk6AnePC+gViZgVX30TH+T8cHCjs03yFyqbtFqBqvkTHfQU4M2Tgv8hnwTHE
	ptyjqkXQBtYQHLPcfLLujqARo8+bUoapr9OIF76vvAsrqcUQ+0/KFqNkrx7iPReC
	IAsRuPcP0JUkT2MPuIT9RhbN4TyFihIV2MizeruoRFrkk97PtrEhfDEdzHNEXC4c
	hpGyPw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9aw1p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 18:47:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55f0613cso266145985a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 11:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363635; x=1783968435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ophF+H15iaR5xZlG1rhaTri3f/JAUP8K4yYfGyQM8lE=;
        b=UmrBZyAtG+E8EF8tCYu5gHKhtyL/enipx7q3iGhkp9OSU8zL7tdxOwfA9cUzm2Bp2x
         v9KW/s9QtHSGMGFusvCbjGLtbg1qY6sfUhOW+YQvWDibVW6n54K+quRBhaTJDMwzb4vk
         alPnprIdRj/DjecZzy9MaLxgP9oPkh6WPQTUTz9ffCbPnIh2mdFk6BgyZGdR4PBwHNrE
         Vu1K7WHyeTWoHGkpjEoBU5h4fCoaCWrJqZ4jc/pjY2icU2U5OPC6KXqsjv3sNl/ytbVD
         1LCypyqBUwHSBl1MoDhFPCXmRWyoWVRuxiWFHOpkyDAklMcXRk500Gczr23enFufiyjd
         DVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363635; x=1783968435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ophF+H15iaR5xZlG1rhaTri3f/JAUP8K4yYfGyQM8lE=;
        b=S5TjvapS+yLsvgqs7AHmcvBzs4ab0OHZoVs397i6FCubA9Ov3CY/yzUMjtDU2jndfv
         mfVXmcOYr3moo7/Ngd06x1vR5PvngshrkXFhma8nr08nDKQjnSJp+wGNdaxZH6xCI+bo
         inYaveJ4GLLGQ8IjASkvxSFvJ3LDCkMEajI3A8Cz/Pk8W2DvvvWSNlBdcnG6egCJDDkF
         c+nULmlPEl2yVwnFHL03cAhbq0hN6WbyHvXIFOYhpJgypK9O++o1/fRP8VgJi/W51z9I
         6+EMUzCBwOoBbbLac+oY0oYGhn7U3pkjtjIUiCao/5GYqcgmOAdDTh86tUjpnuYHZVyv
         hfrw==
X-Forwarded-Encrypted: i=1; AHgh+Ro5yMNuQwo6zjmrD+7sGrUXSST5Bn23nDCE5he8rS7x5t8mJcOR8Qy8mQ4lKUDaGeTPyzaYFBTD0JVWhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKdiX558+fCW83YHwinOoDdPin31UrhTx3uAcAbmYPrX1MLRmD
	OwUHuVpwBjcTvVruc+5hsKpuQN28a0y0iztxSkG4RiKuFeFyXDa+rD03C5L3b4cdvy61ZUWlTNz
	UJvs6DqsqqHiHR1WbfWBvNL2sJWNLtSIT/agcaicYjIkhTxlYE5PdtrUuhjCZVm+iSQ==
X-Gm-Gg: AfdE7cmv82N65NOVWh9zNZxvhTsSpeb+OEdgm/Ku3+2PsEZ3D4IH8VXu4zRoyA2GMWq
	RgzVQJMC/TUWEuQ2xkt6UQ9rrKisUZP8aO3RiBfLe3wk0DoLFXjof2e3UAWN7GRpLywnSZDd/av
	5stet2hHO42KFA2V07sBgDSEDtMRf+DDErX8TNevaiWe7J3lfrdF2YghVqkKUhVJnFT12u+aNNb
	gPJxpvnpCzv+3zLz1+DxquSblFZudwEfTvvTvW6BammO9weAczEO+bCavOzcLBwxFbC2Osv3aIE
	rGPmTSYDYuGo1pWQwF4doYwe++MEz9w67/3XQ/59hrBBLaaDSrUDUuUSbK8DavyF2RSZsYkuvkh
	AThA+LBrlmFmFEzYWoNUVusuXXk15XbS4Lo4F1Y/hvWlNCg==
X-Received: by 2002:a05:620a:4710:b0:92e:7745:9a3a with SMTP id af79cd13be357-92ebb4c9064mr250099785a.18.1783363635372;
        Mon, 06 Jul 2026 11:47:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4710:b0:92e:7745:9a3a with SMTP id af79cd13be357-92ebb4c9064mr250094885a.18.1783363634763;
        Mon, 06 Jul 2026 11:47:14 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:13 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 2/3] platform: arm64: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Mon,  6 Jul 2026 20:46:47 +0200
Message-ID: <20260706184648.35613-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bxRUxTifksDj0Ht2RU2wHg34u_qbdV3f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfXxv3ZuaD3wafa
 uE0VFUEqTrDuQrsk2veEPWnvqOKEI+je6CkJ3fFEy7vcTfa/XZ0bFxkDrYyiqC9ab6f1RFmEEnV
 RPMqT02yoBKIe3ewZrzJaqwDi3znIWA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfXx0BvfJ+Eo6si
 iTMDqsLMB8bweW0nf5+aAZJ33QP3uHOtjTQqJoW6M97wYRLiIeWrWqnjZIdxsLRvAIJOo/p1zAq
 IKyaAEAE2qhW6Hiiz2HqbgPXT06Y/h99719WtUk6pCTdBpO+G/HXUQAsxIQIhRUmCq03Bj8aMBj
 CZcFszNxRxkip0/fLub6MqVrqwCP887ZqG+mFdEAlyKHT6qZZyqjarr1xZmvKGFgEYz5Hhq0SBL
 2C22OpJ9ss82ZHrAw6uhFTmQo9HoP0BaFdPPcoVv88f8X26Gu1sTMOGrwwVqH/cmfCLIMexGfmu
 /eo+u2T73sdRvI9YjTjPL1ziM3RjZ5dmH3E1Iq+mSwF+D5paqm3NVgDSiaA6IaMy2FIyL8aKr0L
 gs8PPVlflXyNxRxATngQJ4AxJgyWli/PQkS3mfhpcSZ+QopFpZf81ZD4wgLPl1DdVGtwI3RaKZF
 BYel9wsaa1HG3XQu61g==
X-Proofpoint-GUID: bxRUxTifksDj0Ht2RU2wHg34u_qbdV3f
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4bf834 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=9Fj74KSAFJAma6AI3IUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/Kconfig                |   1 +
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 131 ++++++++++++++++++
 2 files changed, 132 insertions(+)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 10f905d7d6bf..121043348740 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -75,6 +75,7 @@ config EC_LENOVO_THINKPAD_T14S
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on I2C
 	depends on INPUT
+	depends on HWMON
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..fc480f093238 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -11,6 +11,7 @@
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/hwmon.h>
 #include <linux/i2c.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -21,6 +22,7 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
+#include <linux/units.h>
 
 #define T14S_EC_CMD_ECRD	0x02
 #define T14S_EC_CMD_ECWR	0x03
@@ -67,6 +69,13 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+#define T14S_EC_SYS_THERM0 0x78 /* SoC (CPU+GPU)  */
+#define T14S_EC_SYS_THERM1 0x79 /* Keyboard       */
+#define T14S_EC_SYS_THERM2 0x7a /* Back cover     */
+#define T14S_EC_SYS_THERM3 0x7b /* Charger / PMIC */
+#define T14S_EC_SYS_THERM6 0x7c /* QTM West       */
+#define T14S_EC_SYS_THERM7 0x7d /* SSD            */
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -93,9 +102,19 @@ struct t14s_ec_led_classdev {
 	struct t14s_ec *ec;
 };
 
+struct t14s_ec_hwmon_sys_thermx {
+	const char *label;
+	int reg;
+};
+
+struct t14s_ec_hwmon {
+	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+};
+
 struct t14s_ec {
 	struct regmap *regmap;
 	struct device *dev;
+	struct t14s_ec_hwmon ec_hwmon;
 	struct t14s_ec_led_classdev led_pwr_btn;
 	struct t14s_ec_led_classdev led_chrg_orange;
 	struct t14s_ec_led_classdev led_chrg_white;
@@ -555,6 +574,114 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static umode_t t14s_ec_hwmon_is_visible(const void *drvdata,
+					enum hwmon_sensor_types type,
+					u32 attr, int channel)
+{
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input ||
+		    attr == hwmon_temp_label)
+			return 0444;
+		break;
+	default:
+		return 0;
+	}
+
+	return 0;
+}
+
+static int t14s_ec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				     u32 attr, int channel, const char **str)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_label) {
+			*str = ec->ec_hwmon.sys_thermx[channel].label;
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int t14s_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long *val)
+{
+	struct t14s_ec *ec = dev_get_drvdata(dev);
+	unsigned int value;
+	int ret;
+
+	switch (type) {
+	case hwmon_temp:
+		if (attr == hwmon_temp_input) {
+			ret = t14s_ec_read(ec, ec->ec_hwmon.sys_thermx[channel].reg, &value);
+			if (ret)
+				return ret;
+			*val = value * MILLIDEGREE_PER_DEGREE;
+
+			return 0;
+		}
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_ops t14s_ec_hwmon_ops = {
+	.is_visible = t14s_ec_hwmon_is_visible,
+	.read = t14s_ec_hwmon_read,
+	.read_string = t14s_ec_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info t14s_ec_chip_info = {
+	.ops = &t14s_ec_hwmon_ops,
+	.info = t14s_ec_hwmon_info,
+};
+
+static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
+{
+	struct device *dev;
+	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
+		{ .label = "soc",	.reg = T14S_EC_SYS_THERM0 },
+		{ .label = "keyboard",	.reg = T14S_EC_SYS_THERM1 },
+		{ .label = "base",	.reg = T14S_EC_SYS_THERM2 },
+		{ .label = "charging",	.reg = T14S_EC_SYS_THERM3 },
+		{ .label = "qtm",	.reg = T14S_EC_SYS_THERM6 },
+		{ .label = "ssd",	.reg = T14S_EC_SYS_THERM7 },
+	};
+
+	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
+						     ARRAY_SIZE(sys_thermx),
+						     sizeof(sys_thermx[0]), GFP_KERNEL);
+	if (!ec->ec_hwmon.sys_thermx)
+		return -ENOMEM;
+
+	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+						   &t14s_ec_chip_info, NULL);
+
+	return PTR_ERR_OR_ZERO(dev);
+}
+
 static int t14s_ec_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -590,6 +717,10 @@ static int t14s_ec_probe(struct i2c_client *client)
 	if (ret < 0)
 		return ret;
 
+	ret = t14s_ec_hwmon_probe(ec);
+	if (ret < 0)
+		return ret;
+
 	ret = devm_request_threaded_irq(dev, client->irq, NULL,
 					t14s_ec_irq_handler,
 					IRQF_ONESHOT, dev_name(dev), ec);
-- 
2.53.0

