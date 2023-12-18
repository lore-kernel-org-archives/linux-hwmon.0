Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3BD495DE;
	Mon, 18 Dec 2023 16:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BIDLdRE028673;
	Mon, 18 Dec 2023 11:27:01 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 3v2pw7gu8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Dec 2023 11:27:00 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 3BIGQx4c043888
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Dec 2023 11:26:59 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Dec 2023 11:26:58 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.14; Mon, 18 Dec 2023 11:26:58 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 18 Dec 2023 11:26:58 -0500
Received: from [127.0.0.1] ([10.44.3.56])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 3BIGQiuX024955;
	Mon, 18 Dec 2023 11:26:55 -0500
From: Nuno Sa <nuno.sa@analog.com>
Date: Mon, 18 Dec 2023 17:29:43 +0100
Subject: [PATCH v4 2/3] hwmon: add fault attribute for voltage channels
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20231218-b4-ltc4282-support-v4-2-4fc51f7d04f0@analog.com>
References: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
In-Reply-To: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
        "Rob
 Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702916989; l=2053;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=r1o0pDMD6C9kApbT6XPyA7QM8Q2x8NXC4A0uxJhogfY=;
 b=Jsd2GE/7nN1EWkMdtFQoD3V0LW3LybRYybsAcnBY73snIKZp5gGgVmbhkyWIEts5NtKMJgKzJ
 ueetgRB2bJ4BEvLySgT58R53iBXGYZZyvWKR8UrqjOfe72l4RUtIzIz
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: aLN8waTAYJsOlsUOW5PDLb8Amsem67UI
X-Proofpoint-ORIG-GUID: aLN8waTAYJsOlsUOW5PDLb8Amsem67UI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-02_01,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=880 malwarescore=0
 spamscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312180121

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
index 8cd6a6b33593..67038479b0d1 100644
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

