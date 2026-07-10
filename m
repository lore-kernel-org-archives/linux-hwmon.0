Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011038.outbound.protection.outlook.com [52.101.62.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894E1421EF4;
	Fri, 10 Jul 2026 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682266; cv=fail; b=ndUNLdwpzIwUeUCaPjbIrnntQuV1tt1I12sEqJQsR8KZklLkiA0G1YrgM/We1Qt42MlWe+iCrieyztdOtJ+nSZo0T3KZUsR6cO5PYUXrr2DNeqBPaRuUOmYV7ewRIMKpP2GVNKIO+v3fqgxHtjjGLNLks0su88NYu6i5etRj0EM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682266; c=relaxed/simple;
	bh=Q4AgKpxoJAjGKy6C+qoSB5/n+FTgPGwRB0pDE+7T/wU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jk74TrCRBYCMhMkvdZGNLKCVXu3niY63iCLSlCvAuYeb3mFfaZJnMvg2IsheqRAZQS9phwXLeW7kaNY2pTcZ60QjLBEwhtuuJEKEHXfuWVREWJa2SxmWfONcs/fLQYZbrF8mPVYESsBtCsPTCk/EU36Lq82bHPBYix+ZjyFrHf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lbypCajA; arc=fail smtp.client-ip=52.101.62.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lbypCajA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWPONNlsivisD9v4wKfy7rLlyo448s+IEI0FzAts4mkD6KYEWPCvGrbvJRwRxNwwp/65R6GaIbnzHZpr40xWCBzWggraJP8bMf0fPg7SFOypHqBBVL7BtnsQ3jc3AU3MVpA+cfPXPvePA67oTrJbO4vKGyQZZQ7F/xi/cJhCR3vg4WPu0W9KAm5J2Rd/CChXL4fzC/t5jhcgFx5iPHkCYI/YdENmO2+avn28DVSadD/kdptyr7mXWco/MWIxesRI6arldfMpzzCUQ1TYDdMrDgsAdxc9ofsaLW8oT1kUKKGG1q5FUHURFTJBptlz+Oe519ilmgtqaM0UrTsHDfcmcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMX5X/YOxPxd5ZYaqPpKKX0ECX+7xo0JwZ0M4H9mJII=;
 b=WcjDLwKA+HD2MJxZ08YWUMwkcd29CgHOYDq1As1HfwEGYTT9das5QYtAiBnzA9/Idq7k48JzrW4xGwpEbOw9sIZ7KNmbiK9118TOp/s5fl1KSlOhCRDwxU659umF5rQxjVAX6XLz8s5fZ2uSCbu/RMDtuZJ24kfUOtZFE9SJdpCLQp/uFXMT6XQF1e7+UudFPPX1Pl560Nc+ZY4RINHoWl/qpCW6xsdW7aN3WIOhm2/UbfVk931QB+K1j8eiVwfjAkYf4pufaBBA1UTyiYFzpXFsmXDBrj65wKyngAXBIkFXwQz6GVs+FDkssAtM1iOM0sMBDlqJ3YqGMJQhRKP9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMX5X/YOxPxd5ZYaqPpKKX0ECX+7xo0JwZ0M4H9mJII=;
 b=lbypCajAh4uDY7iow//y63w0B4qSdp8mLEgbnuEJO8/XqeD9qLe/JKXdd7Mwr+5Zj0Em2P4YXHaaN+iE0Uu41kd/sPL+IJJsKmBrH+hHYxU5juleuXM4TpOEzXur/+ZhY3olMCD4B6gfN0EkT+0ljiXWFfFNzDj2ypTybPHkDdU=
Received: from DS7PR03CA0321.namprd03.prod.outlook.com (2603:10b6:8:2b::6) by
 CYXPR12MB9277.namprd12.prod.outlook.com (2603:10b6:930:d8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.18; Fri, 10 Jul 2026 11:17:36 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:2b:cafe::15) by DS7PR03CA0321.outlook.office365.com
 (2603:10b6:8:2b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 11:17:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 11:17:35 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 06:17:32 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>,
	<NaveenKrishna.Chatradhi@amd.com>, <Anand.Umarji@amd.com>,
	<Akshay.Gupta@amd.com>, <Prathima.Lk@amd.com>
Subject: [PATCH v4 8/8] docs: misc: amd-sbi: Document SBTSI userspace interface
Date: Fri, 10 Jul 2026 16:46:42 +0530
Message-ID: <20260710111642.850022-9-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260710111642.850022-1-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|CYXPR12MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: b9876690-0ea7-4752-e942-08dede74d855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|36860700016|82310400026|1800799024|13003099007|6133799003|56012099006|11063799006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	uI4PP76H/w17N9k4UCtPGxAflBjTNOHhCVI0/zc4HRyFoXpS+dMksjiBPqEm9CxKDmLpyCYnowD2INcDFzAkcrTyDuPxRq8wMFbPgiFiHbK0XcOKUv/mR8gQwoHFvA7ae54hvPzUsWlR8iJEFuoM62Cs4H1hjZFWXKxDT7oZymNuCeT5VGl7cKhTw1kGq0udrI/x7N94gn0p7YeRsH8CtmNCnFYsLk9fYpRBkYjW5nuuonZdiq2Ol6bXafB1YUMjAr4uXjb+ixZuFybPkGWbgIALSQaOsoZeMb62wq1KpjMfXpAgDAXi+5qeKTsuyV98MKl9BatKZ8X5ho1yEXF97HRNLRrTkCUMGzvI3ShEzN3JxY3Y8wp9oLAFmnCjGx1k9OkikZw6s2H4gsE0EeQT6OQ3dvk2yXqwGJdptlr+P8jBS5EbepvkoN/ot0A5qvceC10g7EHIPxybrfjhMgdSFbYCq7Y4r71/vrq121/G5aq1DsQruB42JitjYmrDfiVzeHm9K2kMNrv9KTT5Isg8GeiPSLqpw6mpD4y86WONRvnAOGaNoPkavaXFeRbYiXypm4yx8BC+hIez9ap2wWkSuV2qOlGtz4qvo3ANaoGmNZy9IvnKf0+gFhli++238bJGb9nUt8wEexHkspyqCIQkxXfQWrRRORY9f8NnHEeroir/+4uEC9X4GXHpI/0e8HGLX465/KpFpmAa0wR3D1gJqA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(82310400026)(1800799024)(13003099007)(6133799003)(56012099006)(11063799006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zVPP8Y6LifQp7jHjhQ/9qjrxvNcz+VWDRw+JipSHgE9AMP/R/WbcjEt7haYrY99IEhDtpupa2EzyJb2/Df5egy7lzp9RVj5bp7+iz34QaQZ7Vhd8gww0zltNw39Glku4A2/4ouU1q0WqtLbLHYcGysroqlN52OOTuewugn/uoDFmIVUcOxQn67JXNj6Jt5tqYD1Dmfwj3zidXRWh/CC3hoWoIlt1NfKTUvxMhbj4tO/sXSggX8btQH0jXeK0nBpOznCUbLLzsIa3cpSlnst19xy8ssptt00HW1l8mVn6xwATMv467En6SFomR4ENuMklvawzOidhBpCDOnio3GQm3ettYX9YloVuP7kjwyV3wNbUP6/PPXVhShKdShgAvQxEsBay4okTnvkPXk2c4WmQ39IG5OZmv+KgDFwNY8Bz9txgQu8aCUnJZxG6VHI05S2h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 11:17:35.9480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9876690-0ea7-4752-e942-08dede74d855
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9277

From: Prathima <Prathima.Lk@amd.com>

- Document AMD sideband IOCTL description defined
  for SBTSI and its usage.
  User space C-APIs are made available by esmi_oob_library [1],
  which is provided by the E-SMS project [2].

  Link: https://github.com/amd/esmi_oob_library [1]
  Link: https://www.amd.com/en/developer/e-sms.html [2]

Include a user-space open example for /dev/sbtsi-* and list auxiliary
bus sysfs paths.

Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
Signed-off-by: Prathima <Prathima.Lk@amd.com>
---
Changes since v3:
- Address maintainer's comment by changing "xfer" to "transfer"
- Revise the document to clarify the client address for I2C and the assigned address for I3C

Changes since v2:
- Update misc node names info as per socket

Changes since v1:
- Elaborate the document
 Documentation/misc-devices/amd-sbi.rst | 74 ++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
index f91ddadefe48..648d743903b7 100644
--- a/Documentation/misc-devices/amd-sbi.rst
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -48,6 +48,66 @@ Access restrictions:
  * APML Mailbox messages and Register xfer access are read-write,
  * CPUID and MCA_MSR access is read-only.
 
+SBTSI device
+============
+
+sbtsi driver under the drivers/misc/amd-sbi creates miscdevice
+/dev/sbtsi-* to let user space programs run APML TSI register transfer
+commands.
+
+The driver supports both I2C and I3C transports for SB-TSI targets.
+The transport is selected by the bus where the device is enumerated.
+
+Misc device:
+ * In 1P socket 0: /dev/sbtsi-4c
+ * In 2P socket 0: /dev/sbtsi-4c, socket 1: /dev/sbtsi-48
+
+.. code-block:: bash
+
+   $ ls -al /dev/sbtsi-4c
+   crw-------    1 root     root       10, 116 Apr  2 05:22 /dev/sbtsi-4c
+
+
+Access restrictions:
+ * Only root user is allowed to open the file.
+ * APML TSI Register transfer access is read-write.
+
+SBTSI hwmon interface
+=====================
+
+The sbtsi_temp auxiliary driver binds to the auxiliary device published
+by the core sbtsi driver on the auxiliary bus. The auxiliary device is
+named amd-sbtsi.temp-sensor.<id>, where <id> is the device's transfer
+address: the client address for I2C, or the assigned-address for I3C.
+
+Note that the auxiliary bus formats <id> in decimal, whereas the
+/dev/sbtsi-* misc node formats its address in hex. The two therefore
+differ for the same device: an I2C/I3C sensor at address 0x4c appears as the
+misc node /dev/sbtsi-4c and the auxiliary device
+amd-sbtsi.temp-sensor.76.
+
+It registers a hwmon device, providing a standard Linux hwmon interface
+for reading CPU temperature and managing temperature limits.
+
+The hwmon device appears under ``/sys/class/hwmon/`` when both ``sbtsi.ko``
+and ``sbtsi_temp.ko`` are loaded.
+
+Verify auxiliary bus device::
+
+  ls /sys/bus/auxiliary/devices/
+  # e.g. amd-sbtsi.temp-sensor.76 for an I2C/I3C sensor at address 0x4c
+
+Example usage::
+
+  # Read current temperature
+  cat /sys/class/hwmon/hwmon<N>/temp1_input
+
+  # Set high temperature limit to 70 °C
+  echo 70000 > /sys/class/hwmon/hwmon<N>/temp1_max
+
+  # Verify
+  cat /sys/class/hwmon/hwmon<N>/temp1_max
+
 Driver IOCTLs
 =============
 
@@ -63,6 +123,9 @@ Driver IOCTLs
 .. c:macro:: SBRMI_IOCTL_REG_XFER_CMD
 .. kernel-doc:: include/uapi/misc/amd-apml.h
    :doc: SBRMI_IOCTL_REG_XFER_CMD
+.. c:macro:: SBTSI_IOCTL_REG_XFER_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBTSI_IOCTL_REG_XFER_CMD
 
 User-space usage
 ================
@@ -85,6 +148,16 @@ Next thing, open the device file, as follows::
     exit(1);
   }
 
+To open SB-TSI device::
+
+  int file;
+
+  file = open("/dev/sbtsi-4c", O_RDWR);
+  if (file < 0) {
+    /* ERROR HANDLING */
+    exit(1);
+  }
+
 The following IOCTLs are defined:
 
 ``#define SB_BASE_IOCTL_NR      	0xF9``
@@ -92,6 +165,7 @@ The following IOCTLs are defined:
 ``#define SBRMI_IOCTL_CPUID_CMD		_IOWR(SB_BASE_IOCTL_NR, 1, struct apml_cpuid_msg)``
 ``#define SBRMI_IOCTL_MCAMSR_CMD	_IOWR(SB_BASE_IOCTL_NR, 2, struct apml_mcamsr_msg)``
 ``#define SBRMI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 3, struct apml_reg_xfer_msg)``
+``#define SBTSI_IOCTL_REG_XFER_CMD      _IOWR(SB_BASE_IOCTL_NR, 4, struct apml_tsi_xfer_msg)``
 
 
 User space C-APIs are made available by esmi_oob_library, hosted at
-- 
2.34.1

