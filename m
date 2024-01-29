Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3717F15530D;
	Mon, 29 Jan 2024 16:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706544649; cv=none; b=ljfTPiVQ7aSJAu7Hf7EGys35Gj4yKb2ICfFzhpkOf1y+j7jatJlo78QkOKp1xPIJGvx9Y4eXzDhy1yaObu7mSSz+aZupeuHE7HtIH4fV2kaBzbTW0ujyczahjc5PfB+oLyQEy48sRGlU8fYa0GBFos57LH8EsuEH3g0xxVakw94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706544649; c=relaxed/simple;
	bh=vckhRPLJJM0tNXrbqmJzi1p99ZajtNgYRc+fPqwntBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dfdpG5WeN0sC+wXh5ijD2F/1RPOA8Uk6ciQzv1rcGePQpLBWzQ2E5oCwyCfAxxusYvkDmWA/WA/3YGd5zmdWhHsmbu6V7QSoZNgbg4IORT89s4tiQz9X/xs3vGX5/UtMsYsRvYR3QPkZq/usvDeykPDGBOF71ed1bjxKIE4i9UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=0woOtI9s; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="0woOtI9s"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40TElASv021589;
	Mon, 29 Jan 2024 11:10:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=DKIM; bh=kvs/3zXdAPhhupzTWRDA8ugvZsyqqHO6hDv1cm+Mvxo=; b=
	0woOtI9sRCBWbKE8fSCCtuYCv4X7QxCw3HxBI6zc6BlsyXJ3JRLElkxoKpw3166E
	F1KFkj4EB2YLz5CjAasEy+VcJn68ZV2LRfRvMLAXZ0B92E+Th+qbk4nP9f43xT2x
	6K2VcTFxr6g3M4kTT+LQTl6c0dDb37wL6ssvwCdK8oPGkI9gEY7mABd/SvUY3iRz
	CBb1AqBAx5szsua6HPIlX27++pqMsBTKaErLOjLPlqvpmI/csVuwNrSG02h8Kgt1
	z8u4UPV24f8wMEJRM/NI+RA3CAb9JWL5QKMhNzz/Rpgx8lNmGxW8yVm2nWsMWNO4
	0ohBWymgG9HuCkSX43lScA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3vxe398af9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 11:10:26 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 40TGAOqK050402
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jan 2024 11:10:24 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 29 Jan
 2024 11:10:23 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 29 Jan 2024 11:10:23 -0500
Received: from [127.0.0.1] ([10.44.3.54])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 40TGA9Ch002356;
	Mon, 29 Jan 2024 11:10:20 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 29 Jan 2024 17:13:24 +0100
Subject: [PATCH RESEND v4 2/3] hwmon: add fault attribute for voltage
 channels
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240129-b4-ltc4282-support-v4-2-fe75798164cc@analog.com>
References: <20240129-b4-ltc4282-support-v4-0-fe75798164cc@analog.com>
In-Reply-To: <20240129-b4-ltc4282-support-v4-0-fe75798164cc@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        Rob
 Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706544807; l=2053;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=vckhRPLJJM0tNXrbqmJzi1p99ZajtNgYRc+fPqwntBA=;
 b=7EHjxCXXU/Vq89UgVEUQ+qEGs1O8ARpXZdHvX9U/b8kD7wroW5+xWvq8aYfQOogS7ohZeHcCy
 dgRIf6ds7yzADvdiHP4+c15izq0oCg2CnLTRT5i6AQzyArv9Omh6HKq
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: EBHz8ouWneUXGHRFYx8IUh97gOj0G2as
X-Proofpoint-ORIG-GUID: EBHz8ouWneUXGHRFYx8IUh97gOj0G2as
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_10,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxlogscore=852 priorityscore=1501 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401290118

Sometimes a voltage channel might have an hard failure (eg: a shorted
MOSFET). Hence, add a fault attribute to report such failures.

Signed-off-by: Nuno Sa <nuno.sa@analog.com>
---
 Documentation/ABI/testing/sysfs-class-hwmon | 9 +++++++++
 drivers/hwmon/hwmon.c                       | 1 +
 include/linux/hwmon.h                       | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-hwmon b/Documentation/ABI/testing/sysfs-class-hwmon
index 3dac923c9b0e..6c4e68ad4a83 100644
--- a/Documentation/ABI/testing/sysfs-class-hwmon
+++ b/Documentation/ABI/testing/sysfs-class-hwmon
@@ -149,6 +149,15 @@ Description:
 
 		RW
 
+What:		/sys/class/hwmon/hwmonX/inY_fault
+Description:
+		Reports a voltage hard failure (eg: shorted component)
+
+		- 1: Failed
+		- 0: Ok
+
+		RO
+
 What:		/sys/class/hwmon/hwmonX/cpuY_vid
 Description:
 		CPU core reference voltage.
diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index c7dd3f5b2bd5..18705049ad61 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -510,6 +510,7 @@ static const char * const hwmon_in_attr_templates[] = {
 	[hwmon_in_rated_min] = "in%d_rated_min",
 	[hwmon_in_rated_max] = "in%d_rated_max",
 	[hwmon_in_beep] = "in%d_beep",
+	[hwmon_in_fault] = "in%d_fault",
 };
 
 static const char * const hwmon_curr_attr_templates[] = {
diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index c2c0da18dfa3..c7885fdce88f 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -141,6 +141,7 @@ enum hwmon_in_attributes {
 	hwmon_in_rated_min,
 	hwmon_in_rated_max,
 	hwmon_in_beep,
+	hwmon_in_fault,
 };
 
 #define HWMON_I_ENABLE		BIT(hwmon_in_enable)
@@ -162,6 +163,7 @@ enum hwmon_in_attributes {
 #define HWMON_I_RATED_MIN	BIT(hwmon_in_rated_min)
 #define HWMON_I_RATED_MAX	BIT(hwmon_in_rated_max)
 #define HWMON_I_BEEP		BIT(hwmon_in_beep)
+#define HWMON_I_FAULT		BIT(hwmon_in_fault)
 
 enum hwmon_curr_attributes {
 	hwmon_curr_enable,

-- 
2.43.0

