Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE268270EC1
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831215; cv=none; b=Iw1a7ntfgwLI1ZvG+ooto/yd8Ax/yB2LYx7w6Jhhpq6sn1p29AM6d2u/6Oc0qF9mtzdCGV1aR/YPSpcIxGbKMOb/rWHeeUdxj2KLcPvdmNwVbUWxFOXE41FoOW2JxF4Ux8DCH1UJwqaM/Uqp+lHCtY7GZ8+MKkdR28iUGAHUK9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831215; c=relaxed/simple;
	bh=NAFP7AGI0HJJDLXIlHQALnKegJJVET1BmZIEvZTydms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=trGxul1qQ2C+zkoEg60jH6Z+xyqffWY+iTT1S/qYA2nRi4MOD9EdL1muFtUTeaLIVhm9fzWa+u2GAakjfTwp90Gcn7Seej44djsX5lV4K9ltYTuRULd5812nZj3GhP4++utWtlXipgRJABkRxOHqP4chEgU8qPBTUgHltsbu19Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AUjjhW19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5XMOr6s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AUjjhW19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5XMOr6s"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDJSF2214573
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=32HxaGZspUT
	u+gW/bqwHtYByAfD8chZ+Bj6aGgUI85o=; b=AUjjhW19bZghgO4GnBES1GVqT3l
	voMANGu3RlNZlu4TQsD3R7KgKYQ0rAQH6cZWs+CpFtBgeUf/j3QApxm9+ow1m7BZ
	AWPwBhkcSxhNSqRBz4pBQnW/pOfEDlqM/PalIML98773F8+k3aEN7H76m5Ggac1Z
	FteVLXtj1lke2YVB4tt51OrUcFnFFwQmNf+UqBvOCtKuzlPIfkEg+ZX5iQtqaoQn
	IQ8dQm2QppW+CsUJ6TnE+28yYY6yhgWSGTAmYSLPl0CGmJY1zdf9QERfobVtLH4z
	XexXcnsfmW7OJH19oa98YD5VdorD+Nhfwi60Lmya3AhD9+S5XIFIvQoHXrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5txtt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 14:53:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6ed4fe99so39277085a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 07:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831209; x=1783436009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32HxaGZspUTu+gW/bqwHtYByAfD8chZ+Bj6aGgUI85o=;
        b=I5XMOr6saB9Wc8EVzK4IBuPl/vQ0c5IXe6xd4bzNuw1vrKy56O/qHgvt64HCysXB6w
         mt+Un92vwJygOnWP0Nbl7DGFKGn4DuFqWRZNPXD09MBbrmqU96NGHbZ/J3f63p2SKuFC
         EvUFKKHuhsl+HrRBblxdgOZj0xpBuhjecpqLPqsIBX1Q2O6LQwRMgVhpm2NF1Fhg10x5
         grIBTTCvUCRl2YPkGcBq00KDuMJFTyELsmlb04+d2b3ATGfzOgFT1zfwbmp5ZDwwDGlf
         GoYgUJzsDwqL/L2DEnooYHCV3qWSD9TYv5n5HEKbhtXxnBDdoeS79APcUNYTB5QTxmPe
         Yqug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831209; x=1783436009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=32HxaGZspUTu+gW/bqwHtYByAfD8chZ+Bj6aGgUI85o=;
        b=rZBQDJc7Ff/RTiIf3cshu/RFkiK0K/fjPgJiFoBalhZACAwCeAp/DrHZOZ/4d8MWcH
         +C3UHbP31wRmaTLYIMMqrEs0l4e60svvwWUsUrXphdl/1MX/z1LRVIL2lmtKXYVprKRL
         FVHba1boATtEhjAn5bWRelqXubqaD6uwvkUX/bQsDYkEKto9WEwBFO1tli5rletStFVl
         YI9L3I7GNOoDFd7+B1XQx3/Fd+DO5hdB6FxpbdSdJrYrDZVq5vEjzj3VCeSaUronrk69
         HS1cawFfz/8L07l9Uu+45fWaCymaARok2e1aKTt7SbZ0MbUQ6vh7ieLFpsFmsDjxi90n
         GLFw==
X-Forwarded-Encrypted: i=1; AFNElJ+uaIzHY4tz1wtZLgEVlwKGp0uV6cTLo9j0zMdek9bd4hZl22fa6pZEVq8SkrZwqCV0qTAx0lxY3/7Www==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLBj1qsvkdh4pFsK+XQMgn8dRlkP2saVVjQOwjNewr40zq8aO4
	n6iTbJhf2PELMOrlCDrkkv7rw3CsBeK00Fse0lq+ESrAEoSFIoWnLzHhb6uFv4o/iVHqcUNTFtM
	h4AG3XHYTFVBrs0lTn4gGxGSSciAVwMb5D+cF/AHNjyOOKOP3eIoPnp4TrTmcjQ9+pQ==
X-Gm-Gg: AfdE7ckzBZOlz8KZZa5oBspPalr5gWuSz3EnlWl0Okm59lPNYkxatuCSxjp/0KNFY9V
	QaCQ27czIpMRajLl/IlnE7vld7Z3cTUhmQmYqTZdig3Qj5+2w1cpZQN/05S1OHUoAxtQ0MR/jQj
	juthAJE2j/iyZz+dxyfXjxPUGmKiGL+tZ6EbaKqbuXr57HundVp0n9PsqIscMirjHWNhYeUvRgM
	1fRL3+PjKoMbC704rhZt1vYNo545qSzC3tbym/kOzlmtd/jCTuih+rOFXMa3dq2O0uX3BQR/6at
	i+Wl2LvnjqGaWUgCk4uEq/fgPhooUfiSseBMmJ4FdCE+Pa61sV51NmctKYtHaL7+jCY0IxQltVP
	n9ujJASxpvRZ4dUwX1CJTBJrk1yRLSIFnaL6SVCNNCTSuHw==
X-Received: by 2002:a05:620a:2a05:b0:92b:6805:91b9 with SMTP id af79cd13be357-92e6d8c33bcmr163009285a.65.1782831208822;
        Tue, 30 Jun 2026 07:53:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2a05:b0:92b:6805:91b9 with SMTP id af79cd13be357-92e6d8c33bcmr163003085a.65.1782831208124;
        Tue, 30 Jun 2026 07:53:28 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:26 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] platform: arm64:: lenovo-thinkpad-t14s-ec: Add hwmon support for temperatures
Date: Tue, 30 Jun 2026 16:53:05 +0200
Message-ID: <20260630145307.10745-2-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a43d869 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=dabdHXUdFSiLoprLzZ8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: S6kdITZ1THSbEJA408AMnwPCemJ_Lcaz
X-Proofpoint-ORIG-GUID: S6kdITZ1THSbEJA408AMnwPCemJ_Lcaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfXwd1JwIM08eux
 qvAQ9AyHePa3ovc/XirCeDdQAYqZu4fyBmgPErBzRqDCijXCdQRql7d1A+9IhonV1NdBPg/jdWU
 FdPooZs/Y4x7YIACSedu3s0s2Mym+SFGbSB8LDg+Obv+avBH+XzdFUSChTJH3afpbWCWu332CEP
 7aPzRDZWNwVjctoe3lmnn6d/a6QHoz3imLhvg2a/6O47MKCuXgoEZs351eMGZFRVy6DJBTQ2gmk
 7WNYgwtC7aMTblLO4rZwT7qBVWkXWtYsk5r2phbNDtJb3GiqIepTcR0GJSauckxZCmaDclyPkCl
 JWmG1h0wgxhUQlhc/G/C/CXCg2EuUY7D+vV4J3BBFiZXh5YRgLtYM/AWsQR14oVxrCryWpgzx7P
 st7VQa8fHfYoLaBqeFkLBnsa1SPFgEdun5UHaUFJZO23wu9syb5i8s0cOeUH/8f0j3nB2ttMYwN
 1era3AhxqBs3jJMou0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX1BXQe9JPkG4D
 /aVFNnYOXUBHg6em5A2knCFmDLrl1SNAewls9sNX/DtE7HjrEer1t8B7MpwTJ9cN1R1QdTslUeq
 /BtWCv6IrrQ39LjF+FbZKQbgmqmEKoA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140

Expose the Lenovo ThinkPad T14s EC environmental sensors through
the hwmon subsystem.

The driver now registers a hwmon device providing access to six EC
temperature sensors corresponding to the SoC, keyboard area, base
cover, PMIC/charging circuitry, QTM module and SSD. Sensor labels
are exported to allow user space to identify each measurement.

This allows standard monitoring tools such as lm-sensors to report
platform temperatures.

Signed-off-by: Daniel Lezcano daniel.lezcano@oss.qualcomm.com
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 5590302a5694..35a6f8b0cb6b 100644
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
@@ -67,6 +68,13 @@
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
 
@@ -93,9 +101,19 @@ struct t14s_ec_led_classdev {
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
@@ -555,6 +573,112 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
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
+			*val = value * 1000;
+
+			return 0;
+		}
+		break;
+	default:
+		break;
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
@@ -590,6 +714,10 @@ static int t14s_ec_probe(struct i2c_client *client)
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

