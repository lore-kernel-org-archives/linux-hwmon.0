Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D4356762
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 14:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707921233; cv=none; b=DRJ099FMqf1kpWgDdbzVtTTJfLH6WTfwO/zHA2G9q++pizxYh+13Rg3/XkeMuOb7p/iSmI2gjl5kO/udMyZICVi5RU1EL5juyn1WcZqCRkjyowFXlqL59C5no+H8TT3+Nd4XxULqujJ4DLoaj1FrsZx8D32zJhdHVUxnESVkVSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707921233; c=relaxed/simple;
	bh=3rXjCGG2OIoNDP5SLrhqd0goTJWS8NK11vHCUp/q7bw=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=l4vKop9d4yQ4hIgmYCbEgH1ywyU3mIN7WPJrPVfngbNG6ySJnCRv9d+mV13MsWu1zZMg9keSl8YcNU/Ks8SbV7zZnc2qOV/gcQwDHS8ge8GVK6JeQZtBQNIubhTaOxKYxjhp0Rj1NgLYf96Of4i7ILaNE9ivNFn7yAwTW7EGx4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=tai9kdKh; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="tai9kdKh"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EEUPSX029702;
	Wed, 14 Feb 2024 09:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=DKIM; bh=eKYomhAVajYHLuJ1YU2
	EAYqV8LT/QBxiZCM+todR4Js=; b=tai9kdKh0ftLniIWBlvqaFj3TCLNOkfiqw9
	+S5bEF1xoJRKpt0/rthVz/J74PgEgbQzA9TGuR9uWuqV8Y2kAqP3y5GI18ugGEn3
	vmvGgg8gMOQhpTTkS/2z4QUQblljE3eFgqt1Ceheg4EYZYhydh3PiOHO5BI9KXbj
	SNgPKAyHTF6+0cdezwLOmK6Z2+dzxFl4OEyq+S2wKSQeMRN9/wNXAYev0Ocaviuu
	nQz0qZY1SrZ0h2HqIH9x3wvaMw1Hqx23Cl/Mvx+n1MwZSHqSPpDSIimg+2aQgXRY
	xQXujSKZ05iLolFH8DXYZpC3eW3/YtWmgkWH0WscG61579ZOCzA==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3w8ybcg0fv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 09:33:39 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 41EEXcjo018589
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Feb 2024 09:33:38 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 14 Feb
 2024 09:33:37 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 14 Feb 2024 09:33:37 -0500
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 41EEXStD008866;
	Wed, 14 Feb 2024 09:33:30 -0500
From: Nuno Sa <nuno.sa@analog.com>
Subject: [PATCH 0/3] hwmon: (axi-fan-control) Small improvements
Date: Wed, 14 Feb 2024 15:36:42 +0100
Message-ID: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPrPzGUC/x3MQQqEMAxA0atI1hOwtSp4FZlF0UQDkkg7DELx7
 haXb/F/gUxJKMPUFEj0lyymFe7TwLJH3QhlrQbf+tB6FzBeghwVF9NfsgPV0BhH6gYO/eqIA9T
 2TMRyvd/5e98PaiLX2mcAAAA=
To: <linux-hwmon@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1707921408; l=579;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=3rXjCGG2OIoNDP5SLrhqd0goTJWS8NK11vHCUp/q7bw=;
 b=y6RpXorbzzWs24yvIG6gM93XY0ElAWKvuE823McjlC81zlJQf19WZdaBNrjLBDBzukGc0Gaw+
 i/jYz8q2D/3DE1Rb+Zy6ftYj3rWaK95/OP+Vbpsf4aOLYqiEwo84Wqr
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: j7Ego1NL1tRxewqT9di3BLePHAB0RNVI
X-Proofpoint-ORIG-GUID: j7Ego1NL1tRxewqT9di3BLePHAB0RNVI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_07,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxlogscore=380 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140111

This series is doing some minor improvements in the driver with no
functional changes intended.

---
Nuno Sa (3):
      hwmon: (axi-fan-control) Use device firmware agnostic API
      hwmon: (axi-fan-control) Make use of sysfs_emit()
      hwmon: (axi-fan-control) Make use of dev_err_probe()

 drivers/hwmon/axi-fan-control.c | 75 ++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 39 deletions(-)
---
base-commit: 1c365b5017d017260161de296bf0b35fb1f0dbb9
change-id: 20240214-axi-fan-control-no-of-7e36f45d1ef4
--

Thanks!
- Nuno Sá

