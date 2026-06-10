Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1183AF641
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080344; cv=none; b=UBJCjKtdf6D8xOsAvxr7OIfr0MSjG/TH+Ss4KxF4U1BhuJPB4KN5TDrDb38qN5ryja7ztynAHYKSVX6bySBEqLML6V6LWDL4+L7WHBH/jvrO0DYVOfoqaDeHYAn0fwBGMOPXeRNfhYfMtUTPGC1xf0OHjGjrCqWvv+3ea4ZLpWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080344; c=relaxed/simple;
	bh=YBxDxpnUN0g1cyHe3+apDyMUfCheZu4o+Z6kfRRqcBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uoy7+beGjCoXWk8UCg9uUPg49yieNTIiRacplrdU97X6xyO3W5BekuTwBS6MUOH6tssGlbwpoU8c1VB7/ilg5M1sTs/5AWp6+hJPtJ4gEBNeyqww2aovCpqOkYI+QuqYQhOAilOX85bjtiFDvGyw+XVVmTJvv1wOMvh/UcBaDiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLs94N5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0hGMiqQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLs94N5X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0hGMiqQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7ic7r867718
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/yPWsrppuRTjv7KKH5PGwEYFWvJR5egD5gH9LtEMeY=; b=BLs94N5XMv/G+8L3
	X4nxNyk+lqKA6+DJ6oHvhpE/Y31jDGshbwY63J1uW0dDCsBvRfGzgsxIMA1ufled
	AMNUynN4SMtQM8YhqUuDpoGQudtp6fslebkY8VxE75AkVGLhwLtMjTiTVhbv31xD
	b7DTZjO5Ce4y6lFSNma2cci3Rd78ovfiR1BHWXxwMnjF0VBI5oD6p+PoCYdTubtH
	rEOT60+gB/J1hCUUTLgWH20QAk9mIKqfCzus3V9ccnhlApqoCLV45T5gwM2WqaR3
	Zf0PZdp8fiD86/AW87gviPH0dkRaSE3mziTh6RnQycAiWhfDPXJQsO4r8CAYw8Fc
	bnzUPw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd8ws2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:32:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-517dadd84f8so9588301cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781080341; x=1781685141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/yPWsrppuRTjv7KKH5PGwEYFWvJR5egD5gH9LtEMeY=;
        b=B0hGMiqQfZpVWkSlv+iVdTIoS+sgisybbdb/DWBnyHKaXemoLcG1y16+LaG0rwoy5e
         TFktxxfAzmdlyNqErLxBuf9ovvosRLBcs8i83fYyr46QwdWYP5Co+m5zK9IUyEZNC8UW
         3MXdqSDNd+2ZihUWHABVBLEvJ/IaF1zDpVyKOl+g2hFKAMZrGj6be1/mkIvgy9DbpGxl
         KiEMI6KMGwFjhRTGCN6VdpU5l8bKolSYomeBOr5chZRrUdebUf2bZICMvBPcrg8ZxLVg
         qbQniylrEUZLhgkFtTQJULIjUU/RW4f/++POdDtzd8j6F6NqwLxLhySlBcMSUupbVl+5
         6fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080341; x=1781685141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c/yPWsrppuRTjv7KKH5PGwEYFWvJR5egD5gH9LtEMeY=;
        b=kb8QBIzM2mp8DrKpWRy8/MdJ4j6CJiItbGGo7roKIizfoDKGQO3bGgJvPXHpJQ7OW6
         7SRUZLWuweo9XXw1K0Xv9r1bOWKz7+w7iizHDwMTay+d+IGWCfX1Fb71E2mmRpUxfge4
         88KV0+wT8pGWgU1K8T0cPFNLLZhyOhWX4M+LHlKDimbB+lP+7I/ZnsE8pRBsOchXX3Iz
         tX5dRDh/9n/adGz38TwHZl6cD1c3x3/3VoYYiIP5szapVmlI8pLotnRhE23E/Khor+iw
         o1hb6RICXuYOlS442jnHUZJmgYvpd/AKUGXfDGaIK5b/fJnu3tjZQz+Ncyjg/ym/hPek
         K0+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9L2RPVKp7L+zSKDn4VeMOdsZcLweaBEjUIGfdWpnC4gB7V2VXUza5kmQkzt+rBvZJ29W7fKN4yl/C/mA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu+1ejvwauxvIb/yLGrFcYRVnz9bUXIvPSCEbacQmAP/uhHDVQ
	BeTxtHVFzNTVCt+vTZWEeg8Gr6ir8Pc3aMABMF7d1Z4iuTXbwSw12cSAnW/22T4XNG/xBvst7MS
	P4w7+BQ7HhLfq40eO6Qpift+FM7m1VgJohD2XAJdmBghhhjXYn2hoszfEC4mTgK2epA==
X-Gm-Gg: Acq92OEf3Yrz9j7nYQejSOB1ZQpAo3eCgUlO0eT78EH6kGx6cmofBCNhSTt0UZGTQpr
	p8Z+3EAeMmpknIDU0i/lGp83QUEOGN8hWGYMylxOzcyJ785ZE9DFLdJs6Dg9g8a/PF7C9790lyp
	sis1gpLHl9c2gCL/t+wbEtlxt3ESTdeogepz/cOdcSRp8WMAhn4fzrF9XHZF2JpmnOF1lW4lb4i
	CGRR7k5xZpUNmw22gWFrI9S0BBxh73ck2kGEIIT0YvMrzGQYUCxbWqljhdrlnQI7DdSzcMd5haQ
	u6GBtM6vh7RpkSMq0CzfV+XesmiIdMZ4VQ4ZjqedB6+ygR877IjZB6+C0OrC1Djqr2HpHp3u/Uh
	UD9hhG7OMC119xLfjqHwc31NBi0C0Uhx3VYydcJLkkhnFujyV9MMYWMuMnUojmg7XUwGZ75TVpG
	YINy+kSBbz6GE3mns2PU2cNRNZuFw1NGwAFYQXtb6y6wLv4qzanSUcEXd1PhjgOS5qTyk+kqHso
	8bwOVIbKesv
X-Received: by 2002:a05:622a:1e8b:b0:517:6c6f:8ee6 with SMTP id d75a77b69052e-517ca517512mr93433001cf.6.1781080341108;
        Wed, 10 Jun 2026 01:32:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1e8b:b0:517:6c6f:8ee6 with SMTP id d75a77b69052e-517ca517512mr93432831cf.6.1781080340709;
        Wed, 10 Jun 2026 01:32:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:cc96:22ae:323b:9eff])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6585154dsm9516218a12.15.2026.06.10.01.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:32:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:32:14 +0200
Subject: [PATCH 2/3] hwmon: ina2xx: support ina232
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-monza-ina232-v1-2-925b0d12771b@oss.qualcomm.com>
References: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
In-Reply-To: <20260610-monza-ina232-v1-0-925b0d12771b@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Martino Facchin <m.facchin@arduino.cc>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a292115 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=4d72ej-57Oz9oLBfKlAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 3ss0MGDnmP9J7fZtbYF6SjahIt5JOsH2
X-Proofpoint-ORIG-GUID: 3ss0MGDnmP9J7fZtbYF6SjahIt5JOsH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3OCBTYWx0ZWRfXw6qnrW44Kh2F
 Jsy++8j1dUZTgfcqbz1cyzGzMiDU7t9X6JYxhryEGBr6bFy2bailo6Sh/MLeuNSMaFslEcZffGP
 bpMpDhycnzJ8hmWXQxcLR8sqQvysiJYZm2Sc9k0AoEpdeQzof0okfv+CPzT+dhahfYJ639TtfqN
 Px1ICR81+tvlEImGgA1HiJEbiSihqtQ3ZVPMJ1pL4KkcyS2OSvyK3D5POIzqb2j+gcHRoa13AaM
 jSZ/mz4Lrynd2/ZpZ8TMZ7QfefV3NJXFp5XlV5IKzP5TWiXMUmuCuVi/OSAPQ0uOOQXMhk63329
 G2rAFLGkNga7rZQPt7EpMP8AlFmj+Cu4ahWyehY2RlfA2DxTCAdv6MHw7PYi3ho1iSfzK7EchGg
 LJ5pt3ZL+lrKGml7iZwq0q20LoJTqDAVdW+TA+h0tCTpZt9RpCYwBsmNKGUKaXNq1oLVqjZYZ92
 OJjZ9yqMPlLwWrqlm2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100078

From: Martino Facchin <m.facchin@arduino.cc>

The INA232 is a current/power monitor. It shares the same register
layout as the INA2xx and uses the INA226 default configuration, but
differs in its electrical characteristics:

Signed-off-by: Martino Facchin <m.facchin@arduino.cc>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/hwmon/ina2xx.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
index 613ffb622b7c42b8b6090d3b4ec7b2fa412e24a4..122e7aa4fdfffb5bac3d15ff0496fa862147f443 100644
--- a/drivers/hwmon/ina2xx.c
+++ b/drivers/hwmon/ina2xx.c
@@ -122,6 +122,7 @@ static const struct regmap_config ina2xx_regmap_config = {
 enum ina2xx_ids {
 	ina219,
 	ina226,
+	ina232,
 	ina234,
 	ina260,
 	sy24655
@@ -196,6 +197,17 @@ static const struct ina2xx_config ina2xx_config[] = {
 		.current_shift = 4,
 		.has_update_interval = true,
 	},
+	[ina232] = {
+		.config_default = INA226_CONFIG_DEFAULT,
+		.calibration_value = 2048,
+		.shunt_div = 400,
+		.bus_voltage_shift = 0,
+		.bus_voltage_lsb = 1600,
+		.power_lsb_factor = 32,
+		.has_alerts = true,
+		.has_ishunt = false,
+		.has_power_average = false,
+	},
 	[ina260] = {
 		.config_default = INA260_CONFIG_DEFAULT,
 		.shunt_div = 400,
@@ -1005,6 +1017,7 @@ static const struct i2c_device_id ina2xx_id[] = {
 	{ "ina226", ina226 },
 	{ "ina230", ina226 },
 	{ "ina231", ina226 },
+	{ "ina232", ina232 },
 	{ "ina234", ina234 },
 	{ "ina260", ina260 },
 	{ "sy24655", sy24655 },
@@ -1037,6 +1050,10 @@ static const struct of_device_id __maybe_unused ina2xx_of_match[] = {
 		.compatible = "ti,ina231",
 		.data = (void *)ina226
 	},
+	{
+		.compatible = "ti,ina232",
+		.data = (void *)ina232
+	},
 	{
 		.compatible = "ti,ina234",
 		.data = (void *)ina234

-- 
2.34.1

