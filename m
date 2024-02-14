Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0A43157
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921233; cv=none; b=nR8pGrj1McqMHHRxhbzhL42uGATAWumtr1lUCYPRmrwteXajNpvyFX7cRmmijBI9dTnB5Z1WC/n3WSnqyDUXbWTefkSaXjHjwO7Mmq2YfDJFFHVr84uzMCtt0wdCmzqzb1rMVRW0bJegYl/Js5+0WBmASVBJHwCHspSXPYN+hk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921233; c=relaxed/simple;
	bh=4MGkiItuCrCFaWwUsfLb7PKO5WkBMn5qZT3/u9YXAmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gdiBfT8C2lP15Oleb+8KH7ZrU/V0MwKoymW0AVXZ+7mqf1kEb/FP7PMoKWS6kkmhNuuOESK711lbErZnYlGzazQZ72otFFOGCs5WUstuZa0b7bAQYaufVLV1J3y/yezCBQGG/ygsi9uCBIfsHdhEz5j4zTmGVecl0wExPcN04fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=VLhaYtjG; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="VLhaYtjG"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EEUPhk029704;
	Wed, 14 Feb 2024 09:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=DKIM; bh=TEAHqUKLc3sXhaN83b6H8qJ7AiJPisH0ctOFGihlILs=; b=
	VLhaYtjGoY920WH1gCMPs3qD407en76WZN1olh71fhoRG2kj0V8Mj0UNU1GcqM4p
	YqlSmZtKkCSfZLZunAuTcWXxPx606q6lgGslIuPXut+oT2tTASXt0WqM4lNq162/
	kskckbvv5bl7wpMZlfKtJWEyZug9Kt43yKTqiQIb2UpOk/TnR11qY1QF8NULLJTP
	NsMJ88zH7jk2ON5kLJ1AEEvd7OLSAc9mkBhdkw242urWhpBYcNHBkMx++Y6xU+Ik
	amz0HfqKP6xSc/akLlqy1VGdx9+vOsar9Ejv4zGO3PQ3TnpWyeBRx9WGPtCWOMw6
	QudO4BiiLmuJtGX8MQ6BUw==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3w8ybcg0fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 09:33:38 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 41EEXb0r022801
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Feb 2024 09:33:37 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 14 Feb
 2024 09:33:36 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 14 Feb 2024 09:33:36 -0500
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41EEXStF008866;
	Wed, 14 Feb 2024 09:33:34 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Wed, 14 Feb 2024 15:36:44 +0100
Subject: [PATCH 2/3] hwmon: (axi-fan-control) Make use of sysfs_emit()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240214-axi-fan-control-no-of-v1-2-43ca656fe2e3@analog.com>
References: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
In-Reply-To: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
To: <linux-hwmon@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707921408; l=757;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=4MGkiItuCrCFaWwUsfLb7PKO5WkBMn5qZT3/u9YXAmk=;
 b=VNp33KHCKjhXm4ZqdEiFkctm0vadCz3qKlbdKXZ4BJlo1VrjwKkT2AZl9kam6dtxJUKL/MefT
 sauHQBQ4FHKCiBsmyhB3HU+I9gs8e7z7ApsxlqMy5AOWWiiouww9pny
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: xTswFxGE3BjwcXgyYrNu2Fc4ADjznsgy
X-Proofpoint-ORIG-GUID: xTswFxGE3BjwcXgyYrNu2Fc4ADjznsgy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_07,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=623 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140111

Use sysfs_emit() instead of directly call sprintf().

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 drivers/hwmon/axi-fan-control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index 8dfe3b6c5a17..efd42a4f5951 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -84,7 +84,7 @@ static ssize_t axi_fan_control_show(struct device *dev, struct device_attribute
 
 	temp = DIV_ROUND_CLOSEST_ULL(temp * 509314ULL, 65535) - 280230;
 
-	return sprintf(buf, "%u\n", temp);
+	return sysfs_emit(buf, "%u\n", temp);
 }
 
 static ssize_t axi_fan_control_store(struct device *dev, struct device_attribute *da,

-- 
2.43.0

