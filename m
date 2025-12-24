Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C931326937
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 11:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574435; cv=none; b=Www63GBgOuAeZpiSTZkou8ojbcxH6kc0eajBmY/gizDaGBhrIn/5yqT/OV2cZIO2nrOxttZGW4RxCC2fDz43taJO6WnKx5uPevUxRnU/ZBxK3ChjHlK6JJmR/FVMUyNB5vhD+cZ8JuAxxgUu/EduOarEP/A6qoei7D6jjQW1uQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574435; c=relaxed/simple;
	bh=fNDCERfSkCVq1ezLUHTLALQpC5JvMjO67ihImLeZZWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9DBOtxNan4WjbXsE49UEc5BQnM6avZaWyHUVU9Lx4su24LnmxoPhaOsmstcc6mNxWHDBm5F/rUNQIRWYzLyg4VKmtH+xb1vYqLhA0TAO1PU72E6ImeyXl++N4wm5PGFfv34ND0RTQZotUfsmtSsejg69EIZXlM+5rtTtvkk9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2iK+1fn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMAwIEUm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2iK+1fn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMAwIEUm"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO9RsJW1530450
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 11:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qBvYSA5P3rw
	xzsEhUxWUOHnTCOisOK4Ajf6RH22j8ho=; b=U2iK+1fn69TdSApm5TwsPgZqSC/
	duBFx83thF8PIsU3sJsPn37gQUKXa/hS/h+ICqouj3mfsMqmLp6BGiVg8wLF/DN2
	sGP0lONVB35Md/e1YHfyydoufLKBkRWQr92oIc1KRffS3BrDyJDz+nfs6XoEN081
	n+2BwXcYZYPYQShMAmUwLUyJ4ZZWQQx2so8Le1Y/qQKcHfBomnZYvHv0547QpgtO
	CxdJ5I76U7/4IWjW+bMHcD7tMY6AkG9XTsrcL6CqayMZg6DoXIL7f83cQqHhxuyA
	x6cuph7W9fRs5no6UeYxPAbO+UKcURG8h6NugNkWobGDj59v1UDRFgtvK+A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8fu0nc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 11:07:13 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee0488e746so125801521cf.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Dec 2025 03:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766574432; x=1767179232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBvYSA5P3rwxzsEhUxWUOHnTCOisOK4Ajf6RH22j8ho=;
        b=ZMAwIEUm8a2UujOSke7AJKrJSHGokSybbe4BBObZVkd1HDZabxtzGhsfTdU5c0vTN5
         braxlNhIf3qMvuMrI8FamNXkc0N9a+c+XDVHMHiZ795qqgHxwC+lYod2n239e4Yed+XO
         j/tq/p5MxrU4BHJx7oEU1ge5HuWEPsKGMeeLw5tdg6hocxhXAsd5OxLGdFGTKlSvtv/a
         RerMQxKxP+A9ROLHDFOojhEZaWh2T3wlrgvwHk7GQ/VdKh/Z3V0pfBsAhOMSHXXqXPon
         lvzvVUcW/064Pffjp/B1fflAzAeGz+zsH9/d/Dfb0jt9vyri5HoMZdpyuBrbfJgv3vOl
         bK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766574432; x=1767179232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qBvYSA5P3rwxzsEhUxWUOHnTCOisOK4Ajf6RH22j8ho=;
        b=plcCvikecSF6UKbr1tCgXJZMA3TggFROVxTjUME7omn6N1w8fNVlLezgqGr0y8+C7T
         C/Od0hMfiKVLpJ0M1NEuqYlSZj5bkN4RsISktURJ+VkWpvkbQs7vB+joZ8V1Sp798BdF
         I11INcqpaX8kqRBRfLw4LMmQvWeucPtcfIA46dH9Ypitt3bbnk0d8TxUYb1CPHKqQsYt
         tRFkh+/YSSrjiJZsMmxzEjqfr5bli070Nif/qmcghGYYXgSSZaK4CmA5j6y/JfJecqDP
         4YbR3oaibCacSwUDQyZEl+ark954+65tNgoUMZvmOcBPSLe/pPxG8R4DeMZpKjShE6yW
         Gbhw==
X-Forwarded-Encrypted: i=1; AJvYcCUlYxuKtYdf8R//N/7mYMkqz+3cpHYYLepemzC8gIGMVtmqRC7FyZkrH7KYMKZ7uUO3MsU2D5OVuuhbLw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxphpmSJuaCkO+kTKK9RrZZfk6ySPQH0FGX10c1ijciuJdteNwh
	Ts418/yRf0WmfQeM/O3CprgnMN8kvVqDloQ21hTHxJZyu1FDRqjy2tIXlLBgppNEjPfa5ppkfSt
	4ZpIOzDgAF/3blrg4UXJHMlDwL6CwE99DE/1uOCnQHObpKNZYSh4PWCRZZlRN9Yl1yQkliaLmmQ
	==
X-Gm-Gg: AY/fxX6aRBS3aQhUWfr78xSB1DREc7tyOrh9ud1GGLuXp1oKlAsF8vaEdyg7Z2fxfkp
	bYht8JhfAYMvhtylAohAgg0kzVZ0RNmgvGS5Zhk2W5kkK7mwNQO+vVdjiSHUI8XvPj68dLuz/RK
	FI4fto9g5Q0j1GIEZLeX7Z5ccUM7ata0TC5+Tv+Ba+cUO1276EZjaIXFrUIVEcqpPefCUmddH3h
	yuZoh4d3ZJUUiPs2FH4MjFAdOjvOi5/B+K6C77ZI0LJoFogy2ITxHhSA1NYNxX+CZ2R7p62VoeX
	lSatiDZqz482WpGTPHpU6m+bhghBSsLz3lmjGzgxtZY1KiOy7TItvNUwcQin+cbm+SOFzBPa4uA
	R8Nj/QEKtQNIqt2OS+WfeTkMjAVAMEkZKKOGODWQrdb/NIWIXcVGdwPbVWqQyVQQv5E1f1w==
X-Received: by 2002:ac8:5d4a:0:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4f35f473c35mr339144061cf.36.1766574432224;
        Wed, 24 Dec 2025 03:07:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdMxqX7wgwWyBlSWdlEfP4qKqkB7Ymwk0/VeJKBOk1yEH1om8HNALYFND0UQAPc24UszhEMg==
X-Received: by 2002:ac8:5d4a:0:b0:4e8:916f:9716 with SMTP id d75a77b69052e-4f35f473c35mr339143581cf.36.1766574431696;
        Wed, 24 Dec 2025 03:07:11 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9159a6ebsm16320374a12.27.2025.12.24.03.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:07:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Ban Feng <kcfeng0@nuvoton.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] hwmon: (nct7363) Simplify with scoped for each OF child loop
Date: Wed, 24 Dec 2025 12:07:05 +0100
Message-ID: <20251224110702.61746-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251224110702.61746-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224110702.61746-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=fNDCERfSkCVq1ezLUHTLALQpC5JvMjO67ihImLeZZWc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS8lYP3xrpgCELj0flwzcweuNDkpepuVvbbUlR
 Y332QM3PDaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvJWAAKCRDBN2bmhouD
 1xyxD/4rLARKTujf6JlqZ849GIFgPfhWzPHQ/X5UarVyTWyQN3LVokCwObwheBWajEkEwdTrZwz
 W/9cG4lmS1MLBZ+MaOhj2n3qxiLA2U9vbVS1TMUJrW2EkCSufofGLGd4f6WEiTmaNrE3PB3h4hc
 5FkZ/g6eHiDgPJ8L/IhPzVTpogofAnDI4CosiLSoPqJLtgez5o1ujVF51i2DKSnUOi3lSPKfdtI
 bTax2SMCPr1NWS8rw50NYgupo5/eODft8MtdKL2FeJd6wrSLhrsSl3vFVXkyVz8sMpmWqFf9Nxc
 nxOv2jEgW93LTFd3elNpFNqMHAaxUS43uH80OpNruKz5bWH2p7Ne+ROsBrdcA8hiznVE94pSdGg
 pDrZTsZ9gkqUMwJFurPHAKfJExKV5+i7xBtUNkGOUyrvWOXirsIcgJLFka8uSXyVDlhif3F85hd
 NzOl7RdfhRMlfvqkUoTIALu/2xrZjVuXC5pmYvSNw15qR1Qtj7BlZdg6csC8ppQ9DQlj/kdpZ/J
 6ZXgjg2fjk2a/uTo05tMyKPCEf0g+7/ARym0MPWhInzDHVnxBl5JKwVpXafrgnUVTvxVT7F4lt2
 bcKUqM7yD88byiPqF+bhrPtNyzuDPWVH5Sqg5+gtuSE+BC93+IdeHr866l4YC8z9mDJDWEUIiPj Wa52TKMeD9e8wcQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yVOiYQ4xinmqfsGIhw8M8oSfOT7rG4uZ
X-Proofpoint-ORIG-GUID: yVOiYQ4xinmqfsGIhw8M8oSfOT7rG4uZ
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bc961 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bt-T0Iod3x2bBQi8rVMA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5NiBTYWx0ZWRfXwQH7RE8MxXHJ
 C5rz6wNuKtWZbGMGa86KdzLx7AwYcqDz+7xEDlKq4urX4lvT7d1yk+a0NuiLU2OVi/zvKDJou7X
 zTKCXfm99VhDT7OT26kmDxOr++roEBITUDC8Xw3Hk7uSOCmq14yOd7VZwN1kKkwlt9QwNZPqw+e
 yGdEFurSSFJNWPbPH+aaxLsyng2ivJhFLy80ES3q9alDoHUgdbsu8VgI6f/CH8LUv8gsfem26a4
 emeLfbI5+YZOc8RtMqthFiOkcCg72xiM1VwE5LFDQOr+RL52crYfKaHblOcz4A4JY+p/kSSIm+K
 1nYKt4dYHIRTdC+xLNJz8bzNWYbT+snKFShvBrSpe2yNi/zLv0mgLKB+UiNFPPUVoiF1HwEFbje
 /ALRk7nbY2+/0CRhwbrosvUKLqge8P/A6/H8iOJQs9KRgr65sQHYgUE/5Z1HRV+GWaccbM+h9sO
 6Pkw20ZJoV/gEDN1Faw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240096

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/hwmon/nct7363.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
index 71cef794835d..4946d59ff807 100644
--- a/drivers/hwmon/nct7363.c
+++ b/drivers/hwmon/nct7363.c
@@ -396,7 +396,6 @@ static const struct regmap_config nct7363_regmap_config = {
 static int nct7363_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct device_node *child;
 	struct nct7363_data *data;
 	struct device *hwmon_dev;
 	int ret;
@@ -409,12 +408,10 @@ static int nct7363_probe(struct i2c_client *client)
 	if (IS_ERR(data->regmap))
 		return PTR_ERR(data->regmap);
 
-	for_each_child_of_node(dev->of_node, child) {
+	for_each_child_of_node_scoped(dev->of_node, child) {
 		ret = nct7363_present_pwm_fanin(dev, child, data);
-		if (ret) {
-			of_node_put(child);
+		if (ret)
 			return ret;
-		}
 	}
 
 	/* Initialize the chip */
-- 
2.51.0

