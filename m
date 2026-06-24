Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D17E3E5A2D
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335332; cv=none; b=n8CzQzHOCm/+4br4G/6Ju6YJiJv/DHogQt1Fgxrq2bheEXQUyBILq7kIuez5SAZ6yc0DEG+1mcD/gVU2BP/WVLaXi8w/I834gpQnhBEAR0B8D84RTtGv4N32SrNj+PBEGyftCUWhGxh2o+218uwo2MwdWQvPGeCFU1m5ASlGjYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335332; c=relaxed/simple;
	bh=KubqS9d0YGkacDuDdgigJavlflu99724o5AA5cuLn4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N520nKBuEUpkIA5Zwvh5wg8AvzbyJl9cLC7MrZSvqtsMbp05XTZAGYvUouxTkXMSZcZd3kxltBLYl4ci1oVX8D4B3v9tDWrB8I5rFpynobO0PsKLUXn61LwWi5xKzyeM3Fe1LGCyQAknScUW5brZXHRglZOADajTOcfTikxrua0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UR7rsXj2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=isUcarZP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UR7rsXj2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="isUcarZP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJixcr2395237
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 21:08:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lXty0c8dvBU
	OMaVjegXOvn9okysmin+BPLP3AA3xoXg=; b=UR7rsXj2+H705/dAX4KecZIPdgd
	Nt3Xr8JRjg8RmxDc0l3pMaCPV/mdMGjAOF0+W/+RpzUGRmdSuafCec8JGH1hvYyU
	6eyvondGiqNmOpT+X9EuPlwtWXgZZL9+jKy+R1MW6SoTeooqBdM8h1p6WWtr+zSM
	+Jnw/GXLTLsHLE8abckErPD0sHwNUbWygaBS1rOO50xG9jO/atn84BiQIxTpu3c4
	BLwt3fUuGMEvJR3MqIHrIF9CZBYeAOBleC1OvP2JoRBiRHZHcNV9ZdTEZwhjWnyR
	7KMzZyH607pDKiPpDjd1I/IjT08LXv6Lrxn+0DO1D8JBgPWBzmCi8YuGZ4g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f06r34285-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 21:08:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-920aa2e130eso237654585a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335327; x=1782940127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXty0c8dvBUOMaVjegXOvn9okysmin+BPLP3AA3xoXg=;
        b=isUcarZP9gN7zFWeGzfQQI0qfGKsX9X1HzjmSjZ5mjtZtGvdT65WmmcMmZN/wyD/5T
         M3EvPWFJcj694HKVIRjjP3nBtP9G+ay60AhI8sQqd+GIUphaFpzNFKZQZ+fNcXLOOXoX
         d8lyj5otw0IDFKrDiOX8+lB1dkjcJGewABCohnSJefzrjnOY0WnA8az+FZDNJ38d5J2z
         rBwiFs+m8QQdjiqBm0AH6mEAJfYjeOrgWoOFLnJkfqxAp6rWGa8GU69XNV1twQneukr2
         HzAEVsOtT5BpqEaU7E7vfHKyidvRqkrvLj2ckK+KsWeEzM6CHYjHMWZkbibW8z+3ih8O
         GgUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335327; x=1782940127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXty0c8dvBUOMaVjegXOvn9okysmin+BPLP3AA3xoXg=;
        b=rdYjvoLh4Fsx7c1gAQIIZ9INbkD6BzMGxXdd4/GIrdELaAEgK60xpt+oNhozAsy+/Q
         TF0PfAPrgTEIy/SZB08mVGvR3FCwrZDx4H8EAIS0k/Z07ZmFJ1I0o/7BKkMnExoF4cg/
         pIqYKdlxD2CdS+O8J+qkHfaTj9eInME3SJs9R6HyG50XPcMMVwexxR52qoCGvYxz3AqE
         dk3gkqrQDvfwXfJJTTXFGmfA3o8Ug0hlIwBUdzXW0U5xHgYIdcWjtLFrKxaSVSMxovQL
         452vKVF0M9bI2UfijyFp8Yf7D0SnVTzEJq2XMTmnlyg+C3XAht+wQpkUUHp15DUaGLV7
         YVaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/GlKs0a7OkKdAN87MBMf5JnEWykVJpSJ15TQl0BI5WRoZV3Y7j4Fwi77G5VpVZQtJOYNrVNS/vlPMDiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXB1Ojsjk+pVthODVyKiyCnm2DrVV7lp4bfbbILOt4IUIcvpJY
	Iv4A+eTnPy5JH8DQdRQEexBNcZeRRynd9PJ/m71jSAAOai6F62ILzV6EAfqPktEtC6TsWQLenlK
	Iv+SKDwtFtbXQK4TdxGV/NmektN7Wb/he13Ce+wb5Unx7CLmvOc1ZEqec6KjbCV7ccg==
X-Gm-Gg: AfdE7clu3wI80TUrVdkFyZo9wjuuxFKLBLDpiQSaiDcuO5hAgIGiGRraiaPENL47Wqa
	W8Ds2rVXo3JrD+pSFWAzqQvb/d+YdWCl4SbpwfQSCXSxo2Wq959EQ0TI9IEtXYoiHw3AQVqzTSn
	jshCh0X03UtRUxJgWQfTs7EtSuQ0VyD4RzMw/y9hfVadKu5ylFDaoAKKb3f9fci6RYk7+FcFXzs
	GuFkfn9KCWP7tf7JSIviStvBOs0YW1h3jrYhcYnPmH0alTzlQsRdaaUn4UxT/OgYQ8imp9QKcbc
	zaj4p2D/sVbZYX3wOvmzexeJb2uah8/91CIIctNdeLwcVg9fHVnJkdyRfXnbKHiI1k6rg9nD7Ie
	zhbN2CDNelGQF7cKddD6J5NncePBwk5hcErZhVw5iTexirw==
X-Received: by 2002:a05:620a:40c2:b0:912:8fd0:4a5d with SMTP id af79cd13be357-9277f1f4f11mr823243085a.55.1782335327083;
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:912:8fd0:4a5d with SMTP id af79cd13be357-9277f1f4f11mr823235585a.55.1782335326522;
        Wed, 24 Jun 2026 14:08:46 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:45 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 2/3] platform: arm64: thinkpad-t14s-ec: Wire EC thermal events to hwmon
Date: Wed, 24 Jun 2026 23:08:24 +0200
Message-ID: <20260624210825.264454-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX22IvZy9WTmje
 gzGvDISbsSx98O3WzUzvc3rpZK3EpsUbK8GuaWnsVapLDQ+aFQSyfSUCI4HTE9EERwCBr4w4tp6
 zPig0nVMmaZmIxVJ1aA3tYUvNDg1N9OTIgP0IsV3+DBvJwfnoRKkZ9vlFBpPuEObHdW81Wqa6dm
 yYQtQ1m7JjVSva8so1m5ebBnfYC2z6jVmHLk5K5IPNmTfkOScP4nLWQc+5PDEFoJvMC8IrVoYBj
 c4Vn686ox6HCGdlPAmsigpDhUuwur90MF3dbA5SgaXd+AbYe0NFxaDnsU4kAHWvzceaQwTeQksV
 BfiEZHXMjC+jnvKSKoxiH6rb7SDZbOhCZrD52yPVm9FUQMihONBZlzgN1Tkh4nEurhYp0cjd/af
 Z6OD9dnEyDvBIhelCNzyFxbumHNbmGGl/3MiDAnXpgGzd5A2L5C4ZVspxV1Bq660Z45Hjz/Go46
 WJ+6iB5uds7ALC5nEow==
X-Proofpoint-ORIG-GUID: eumP3Xlcza9MhfqIRIVjyKZ6JbekOnkc
X-Authority-Analysis: v=2.4 cv=ZM7nX37b c=1 sm=1 tr=0 ts=6a3c4760 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=ImW1d6Yn9UAQwwTZzW4A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: eumP3Xlcza9MhfqIRIVjyKZ6JbekOnkc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX69IQjP78+fWF
 NsNWZ3VT6+ZQUWRxvERgWyGae2RNAFjYj/xBFbJ8GW+ldXBRrVXIDprDA7J8iK7o7VGUU8YP29r
 pETPJVceKKHSqMn+f2R0Jtut648AFxE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240177

The EC generates thermal zone status change notifications for a subset
of the exposed temperature sensors. Wire these EC events to the hwmon
notification framework so userspace can be informed when a thermal alarm
state changes.

Associate each hwmon temperature channel with its corresponding EC
thermal event and emit hwmon_temp_alarm notifications through
hwmon_notify_event() when the EC reports a thermal zone status change.

Also register thermal zones in the hwmon chip capabilities and keep a
reference to the hwmon device to allow event propagation from the IRQ
handler.

This allows userspace monitoring tools to receive thermal alarm
updates without polling the sensors and gives the opportuniy to the
kernel to cool them down.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 66 ++++++++++++++-----
 1 file changed, 51 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 142464623f0e..276bb51da33a 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -107,10 +107,13 @@ struct t14s_ec_led_classdev {
 struct t14s_ec_hwmon_sys_thermx {
 	const char *label;
 	int reg;
+	u8 event;
 };
 
 struct t14s_ec_hwmon {
+	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx *sys_thermx;
+	size_t num_sys_thermx;
 };
 
 struct t14s_ec {
@@ -493,6 +496,20 @@ static int t14s_input_probe(struct t14s_ec *ec)
 	return input_register_device(ec->inputdev);
 }
 
+static void t14s_ec_hwmon_notify_event(struct t14s_ec *ec, u8 event)
+{
+	for (int i = 0; i < ec->ec_hwmon.num_sys_thermx; i++) {
+		if (ec->ec_hwmon.sys_thermx[i].event != event)
+			continue;
+
+		hwmon_notify_event(ec->ec_hwmon.dev, hwmon_temp,
+				   hwmon_temp_alarm, i);
+
+		dev_dbg(ec->dev, "Thermal Zone (%s) Status Change Event\n",
+			ec->ec_hwmon.sys_thermx[i].label);
+	}
+}
+
 static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 {
 	struct t14s_ec *ec = data;
@@ -542,13 +559,9 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 		dev_dbg(ec->dev, "LID closed\n");
 		break;
 	case T14S_EC_EVT_THERMAL_TZ40:
-		dev_dbg(ec->dev, "Thermal Zone 40 Status Change Event (CPU/GPU)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ42:
-		dev_dbg(ec->dev, "Thermal Zone 42 Status Change Event (Battery)\n");
-		break;
 	case T14S_EC_EVT_THERMAL_TZ39:
-		dev_dbg(ec->dev, "Thermal Zone 39 Status Change Event (CPU/GPU)\n");
+		t14s_ec_hwmon_notify_event(ec, val);
 		break;
 	case T14S_EC_EVT_KEY_FN_G:
 		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
@@ -658,6 +671,7 @@ static const struct hwmon_ops t14s_ec_hwmon_ops = {
 };
 
 static const struct hwmon_channel_info *t14s_ec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
 	HWMON_CHANNEL_INFO(temp,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
 			   HWMON_T_INPUT | HWMON_T_LABEL,
@@ -676,14 +690,34 @@ static const struct hwmon_chip_info t14s_ec_chip_info = {
 
 static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 {
-	struct device *dev;
 	struct t14s_ec_hwmon_sys_thermx sys_thermx[] = {
-		{ T14S_EC_SYS_THERM0, "soc" },
-		{ T14S_EC_SYS_THERM1, "keyboard" },
-		{ T14S_EC_SYS_THERM2, "base" },
-		{ T14S_EC_SYS_THERM3, "pmbm" },
-		{ T14S_EC_SYS_THERM6, "qtm" },
-		{ T14S_EC_SYS_THERM7, "ssd" },
+		{
+			.label = "soc",
+			.reg = T14S_EC_SYS_THERM0,
+			.event = T14S_EC_EVT_THERMAL_TZ39
+		},
+		{
+			.label = "keyboard",
+			.reg = T14S_EC_SYS_THERM1,
+			.event = T14S_EC_EVT_THERMAL_TZ40
+		},
+		{
+			.label = "base",
+			.reg = T14S_EC_SYS_THERM2,
+		},
+		{
+			.label = "pmbm",
+			.reg = T14S_EC_SYS_THERM3,
+			.event = T14S_EC_EVT_THERMAL_TZ42
+		},
+		{
+			.label = "qtm",
+			.reg = T14S_EC_SYS_THERM6
+		},
+		{
+			.label = "ssd",
+			.reg = T14S_EC_SYS_THERM7
+		},
 	};
 
 	ec->ec_hwmon.sys_thermx = devm_kmemdup_array(ec->dev, sys_thermx,
@@ -692,10 +726,12 @@ static int t14s_ec_hwmon_probe(struct t14s_ec *ec)
 	if (!ec->ec_hwmon.sys_thermx)
 		return -ENOMEM;
 
-	dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
-						   &t14s_ec_chip_info, NULL);
+	ec->ec_hwmon.num_sys_thermx = ARRAY_SIZE(sys_thermx);
+
+	ec->ec_hwmon.dev = devm_hwmon_device_register_with_info(ec->dev, "t14s_ec", ec,
+								&t14s_ec_chip_info, NULL);
 
-	return PTR_ERR_OR_ZERO(dev);
+	return PTR_ERR_OR_ZERO(ec->ec_hwmon.dev);
 }
 
 static int t14s_ec_probe(struct i2c_client *client)
-- 
2.53.0

