Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011038.outbound.protection.outlook.com [52.101.57.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0AC481ABC;
	Fri, 15 May 2026 13:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778852765; cv=fail; b=UHWzFe+E+Sio4fp+UURtDG0sxm/Qe4WZR54Ye9J0KyuDtK5c5RXguG1zOXm3Wz+ERAd2GN6rmTGietTphZkTQrJ0cSTvkr+SYH9DZTOCiOqVZsezv2zfI2h+5L8BdMl/w9Lozign4pLHFji3NSvMvQhy8qq+2hMzLCIUKjoZ4Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778852765; c=relaxed/simple;
	bh=H5GG2gQ3bYfhkbTWNp3zY8DP76cKEth7SG2R9CBncGU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lbxHRjoZUMYExn4YtQ+b++zN6LZC2P+JAB2L93dbR/DqhonejepMLwV4EN5R0R4HAKGp2Bd9bLZOdWBPVSnophaKWdUsc5xh8D3d1qOWyCVJx4Baxiyx3FjiusDEbQkccacJ7b/7Ludg9crVjniR5E5fojnLJebif26PJmh7f4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=T6gRAvhR; arc=fail smtp.client-ip=52.101.57.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="T6gRAvhR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEAnqFEQuw/tdaKKhIn5WevfXU1RKYwqDhyRZorqfs1QINa5GKDsoM8wSRY98W6HzJrf/jm55uJWq3BP8vPKH8Lwc2ovOy6dlHOlnCK/fUD9G9fAom1PT6MQisC+wTtDD2qu/dLQuTLKhyxZDqpDKJlH9xxeM/KjPEdUPUsVSIAdzoNuuYVuzMpq3OMUNKwS6Qn5RQ61GQhqqOSZztVUEEWHiG4DZxhLsxxTLQkv9ENJQGz56O7aszOEnwhYbykn22TV1RvvKD5t4BD08BrAS0BYoUZVfw3wHoCBv64INkoY/9YzYPnQNUs3yWFe2Tst0HdmpULTZCZ8FM10PvhEtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81adDRHg1D76MPKLsbmiva0+jlSo2C0PW6c2l7Hchmc=;
 b=KhrXsTRVowdJazOwTQoRmxWZNxFJpW3Zf2xm2T8U/H2XOrsEoaQEehLSRHJJWLoe4mjqS9ZHJSv0yzaW8GYwkYG48KMr6/AI7aoN2tBhohjdhrdxKF7rYZgrw+78KCmFdyGiU1KSd8SWlzXh0ekbBUgXhB4r8qNR4RSTZbm9yuwuLDxtZ0A2j1llMSXZFs0yFQ1lOV4DBX7EA/6d3Raln/LpMyVCI5ExjMYDDvY3aq5sv5XZHd0eTeg2oYxHNLHzMwwmueswJ3IPJ7kA2jBIY/6/Rt1BVecmAxfK7uZX/sCtCkhFDGZYr4Jal9WcF9bb3I/XFO1JGqaE59XF4NVN+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81adDRHg1D76MPKLsbmiva0+jlSo2C0PW6c2l7Hchmc=;
 b=T6gRAvhR8pz6YInEsgJHuxocpJ+7DD8QGlbaVA8dYUZw5Fq8qYiV0P+Au+wZmMcsUUJTinaSlydAyG00hLPWtCOCHpjMLSa3HRPppTLwl64HsIpaBAAI1mcbKeoJ8UXZb+GjHNPN46ejVlEXwWlWnpR4I+9wRgTZ13S/sjYxMyg=
Received: from MN2PR03CA0027.namprd03.prod.outlook.com (2603:10b6:208:23a::32)
 by SJ1PR12MB6170.namprd12.prod.outlook.com (2603:10b6:a03:45b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 13:45:58 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::83) by MN2PR03CA0027.outlook.office365.com
 (2603:10b6:208:23a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.14 via Frontend Transport; Fri,
 15 May 2026 13:45:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:45:58 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 15 May
 2026 08:45:52 -0500
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <linux@roeck-us.net>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <akshay.gupta@amd.com>,
	<naveenkrishna.chatradhi@amd.com>, <Prathima.Lk@amd.com>,
	<Anand.Umarji@amd.com>, <Kevin.Tung@quantatw.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v2 6/6] docs: misc: amd-sbi: Document SBTSI userspace interface
Date: Fri, 15 May 2026 19:15:06 +0530
Message-ID: <20260515134506.397649-7-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260515134506.397649-1-Akshay.Gupta@amd.com>
References: <20260515134506.397649-1-Akshay.Gupta@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|SJ1PR12MB6170:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab2c4a5-9507-4cc8-9111-08deb2884b56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|13003099007|3023799003|11063799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	n55IQCH1x0poAcuU0ocHhAdh6/E72IQj3kPKlOVGLp6AbcajXSxZnXY1wPM53aXRXUMTkzipdsSqtrkc0lj4cHtaiQMel8+e+erlEf+sviPTu9yXOL9Zf60eAqb/ZIl5Vfbh3vt8CxEzSmHJrft/RPKjJCquO7qBD2GwYhHpNueGpXVuHu8IHq4ckqlBzsiecgNd5irNnonr0o70PVYClgAiRy08ry5tC1podnKiqGLvNF9zGN88zU7mhFI1SQcKnZsGTwTFgOq8geGmCBkOLbZ7OJt83JLMn/hViqUOz/32zU8+3YjxHHQ2MiAWDXaOVuZ5c9a7uz+FUCqyn0vmn1MSnBWmNH9DFBaoZoTfNDea8Eu8PU7fziklTBAZcmCrZp1irvit4QmyB+i/gtVjXtVENfAFU0eCSBTrrlf5KeBUYYVFmhyJoeFyt6aLtcmQBIcLSAt+c3fMekerZKnH1ZbgjIA2qR0Bp5/kr6iQ9HlfaM4qXPo2I7Ti7nqSIkt2+vmYLH4mNrWICi1wKdYN4VqKqld61nLfdZdigyRd9tJBxdQwK2aw5bCwxrMXDhVi6fBsRHMh7X9E7Zg4StbKavnqL/VXQ+REPV+53T31j8LdVLbZB6/9gYA30Ksp2ALcbJdb+XxAK0UCWU/yPyIgGFCUIhGEcvhnURInPlayG56CZKpzW0Z/1Bg8ElhzvkSC3Tedi1Jigq6qBWJ0CY7qZBLIdjAiKke5JrXj7V4PxPY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(3023799003)(11063799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qt8aqMrHEFndeRrES1/9hgaRUp01mFkcBsxbTr6oWbrARBwEaj+W/e29PFhr5AzFHwEE06cwGOMAiV61TUjVQNkvtY+YHgAV+Mu7qn6JZrZQmeITnObMho9e2uULa0GnaJdXcLHw60v8bCvdkO++EPkSnLN0ljqwdqWU8/f+OLmdN0jXl/9b1toa41NxP9WAHuU/5za1xtaVWnET3SOw6Us6RkTQsB6eTKCQquU+zEp3ZRV8kvojECagVx4TMVOuUN9lHHQx48nrd9KFisB/ZVEpGqnbIg1cjguNsboKZVrkoR5AjqdtYLBXKz1SGgQ/rET1CCdtiqqThJqrfIkYpc0ZxRywJWxZFLhUxKpgD7Qlj4A7eqhn1R02a37rVZJdmAX5FAAz8XVZ6JgFDEAYGyggGwZA5yWT6fwm+ShNZ4eLfvZu0T2826GiMfRI3AYk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:45:58.2022
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab2c4a5-9507-4cc8-9111-08deb2884b56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6170

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
Changes since v1:
- Elaborate the document

 Documentation/misc-devices/amd-sbi.rst | 64 ++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/Documentation/misc-devices/amd-sbi.rst b/Documentation/misc-devices/amd-sbi.rst
index f91ddadefe48..6a6344439ef5 100644
--- a/Documentation/misc-devices/amd-sbi.rst
+++ b/Documentation/misc-devices/amd-sbi.rst
@@ -48,6 +48,56 @@ Access restrictions:
  * APML Mailbox messages and Register xfer access are read-write,
  * CPUID and MCA_MSR access is read-only.
 
+SBTSI device
+============
+
+sbtsi driver under the drivers/misc/amd-sbi creates miscdevice
+/dev/sbtsi-* to let user space programs run APML TSI register xfer
+commands.
+
+The driver supports both I2C and I3C transports for SB-TSI targets.
+The transport is selected by the bus where the device is enumerated.
+
+.. code-block:: bash
+
+   $ ls -al /dev/sbtsi-4c
+   crw-------    1 root     root       10, 116 Apr  2 05:22 /dev/sbtsi-4c
+
+
+Access restrictions:
+ * Only root user is allowed to open the file.
+ * APML TSI Register xfer access is read-write.
+
+SBTSI hwmon interface
+=====================
+
+The sbtsi_temp auxiliary driver binds to the auxiliary device published
+by the core sbtsi driver on the auxiliary bus. The auxiliary device is
+named amd-sbtsi.temp-sensor.<addr> where <addr> is the device's dynamic
+address.
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
+  # e.g. amd-sbtsi.temp-sensor.X
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
 
@@ -63,6 +113,9 @@ Driver IOCTLs
 .. c:macro:: SBRMI_IOCTL_REG_XFER_CMD
 .. kernel-doc:: include/uapi/misc/amd-apml.h
    :doc: SBRMI_IOCTL_REG_XFER_CMD
+.. c:macro:: SBTSI_IOCTL_REG_XFER_CMD
+.. kernel-doc:: include/uapi/misc/amd-apml.h
+   :doc: SBTSI_IOCTL_REG_XFER_CMD
 
 User-space usage
 ================
@@ -85,6 +138,16 @@ Next thing, open the device file, as follows::
     exit(1);
   }
 
+To open SB-TSI device::
+
+  int file;
+
+  file = open("/dev/sbtsi-*", O_RDWR);
+  if (file < 0) {
+    /* ERROR HANDLING */
+    exit(1);
+  }
+
 The following IOCTLs are defined:
 
 ``#define SB_BASE_IOCTL_NR      	0xF9``
@@ -92,6 +155,7 @@ The following IOCTLs are defined:
 ``#define SBRMI_IOCTL_CPUID_CMD		_IOWR(SB_BASE_IOCTL_NR, 1, struct apml_cpuid_msg)``
 ``#define SBRMI_IOCTL_MCAMSR_CMD	_IOWR(SB_BASE_IOCTL_NR, 2, struct apml_mcamsr_msg)``
 ``#define SBRMI_IOCTL_REG_XFER_CMD	_IOWR(SB_BASE_IOCTL_NR, 3, struct apml_reg_xfer_msg)``
+``#define SBTSI_IOCTL_REG_XFER_CMD      _IOWR(SB_BASE_IOCTL_NR, 4, struct apml_tsi_xfer_msg)``
 
 
 User space C-APIs are made available by esmi_oob_library, hosted at
-- 
2.34.1

