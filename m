Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013017.outbound.protection.outlook.com [40.93.196.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEB82FD69A;
	Wed, 15 Jul 2026 06:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096930; cv=fail; b=gTQJ/vhtHb1h7auFWB2P81uqk+hxyuVOsSX+VO/edDUUTxGvbzGesNc12rn3IvLjnkqHvUDiFlf05F8jXPArmW7n59ibmjsLYNDQh3ETTcT9Lv/yeY20twK44Vzdf56+r852n/Tyi8vXZouYWFP1PKrWuHnh3ViAcPxeSARD2uY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096930; c=relaxed/simple;
	bh=lYYgknSonAxpVSlcWp3FD5+BG4QlPSBjNChZ/IeH7Q0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I5CqvQIKUQMFFY8DbEVbBdOOglbFGYT5R9Q+1qgcxq3+G9f5lNDzmAGwesmEaEZugsUw1vTaiNQHVAx1xm8o/pwzETSLmVJFCoND2K+9+Tdes9H/yuPpYauf2skD38DLa7idJ28jLlanOtwMef3889npQyZe9KcDjYW5tLv/5Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=afrJ0wNL; arc=fail smtp.client-ip=40.93.196.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="afrJ0wNL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w0GVlbdLqcAr3R3Y0OH8PdQGst4DLKK7+HoQZiZK3h7LmWZuPqcQogmOnF/vfV4zzKrEMbHzfmo8kWj18IR13PQiPRXo5/X2D3UjmpVqlxI4jnDSMZLynHhWzehBHUEntly4Oq4UwDwFXEd/fhcQhwmo706mh0HMQw1QlWJYC6ZniSKEoMtQS0zbfqKGqtylPjgFFrDQboCC0VAwwOagexF3Fl0r9L5g+3kZ6q4o3VAvG2vRktWwAM4gRZukn0dkNdsakPIPJ7Juo4JInVZJjNHNqS9H91Z0AVdYgTG6/q1LMRDVTp49hTkIBUUzA8cF94NF0khC1F+tANCatp13yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egUHE/zWQEm27atmaUeQH0v/XWRZI45wpnaQhhfT8cY=;
 b=fvJ/eibILvMY6pD7G3I1OSI6gO24mikdIAWKN1oeVnpjZNpsi+ro7qLZehfQCWAZ2peMgQLTmN12pbSrR6Xh57FXdgXdTJ1oMXCkrlvmdcfznzL4QW+lrSWsJ1KAr5WY8NfSKZzINiUb/pvKcPL2SxqjQisKhv8CBLyp9bvhhE5m4hGfhNS7EF3RwfUIvPyQJ6PRfIfZoyeWnjj00So2jKz28wCZ1/61t1gn+J2relCKbHE1GwNrZjVwo1JpzD8SICiVA8CvuU6djm8nKQX2z/YrG2fcEYdJ0OWuwltvvFJqcADQDxN/oGuwVwepL6E8FRFG9MqNFj5ubQJhIe7EWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egUHE/zWQEm27atmaUeQH0v/XWRZI45wpnaQhhfT8cY=;
 b=afrJ0wNLPyvExhyLPkiDuZSfvflo9cdJxrnXTD3jBImlfE6WTGIVR1H2lE2ds0gx54CFtKh2r8ZS0AEVWgM3tnA8sRdEsXe8BMRqJsxkQW634Fb3w1+8W2JQ78XgRI/QGA4b0uDKrx/CVgnh8M9hVEeO/1L4Af/zYiFdbw4pfPyIGE1bdGYbj5WzaeMLnMTmGucHjBcjgnpBK5ItlHC+LmHjy7G+XI+xT/g/BGcIYwqu9Xs1UXZP8wuuqQcwJ9BGLC02oGBAIonbze/w3VxZ/fN7KFQ9ztDas4mN1WueQ0nvexcXqJhd9MHqvq2zi3EazRMwd3Q3kXHG44PiWvJbzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from CO1PR03MB5937.namprd03.prod.outlook.com (2603:10b6:303:6e::18)
 by SA5PR03MB989111.namprd03.prod.outlook.com (2603:10b6:806:4d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 06:28:45 +0000
Received: from CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3]) by CO1PR03MB5937.namprd03.prod.outlook.com
 ([fe80::f970:684e:8c80:91c3%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 06:28:45 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 2/2] hwmon: add Altera SoC FPGA hardware monitoring driver
Date: Tue, 14 Jul 2026 23:28:02 -0700
Message-ID: <484efc0ef86ba378e903366a39e04e4e19531845.1784096224.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1784096224.git.tze.yee.ng@altera.com>
References: <cover.1784096224.git.tze.yee.ng@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::13) To CO1PR03MB5937.namprd03.prod.outlook.com
 (2603:10b6:303:6e::18)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR03MB5937:EE_|SA5PR03MB989111:EE_
X-MS-Office365-Filtering-Correlation-Id: 4818ffcc-8a6d-432b-5211-08dee23a5157
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|22082099003|18002099003|55112099003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	uBg5rdne5IuYr+Hfyx6zCxhWkhTRhVkbgfKya6u7L53Q/P5tPCu/dvLOhB55pYE6E6zNOVUXhRx0TqJbq3sRwHjsdwwuY0gvhYpavVjFmkcQAgqW80avWlHynQc3/+uDCUVmtMG+n2bw0IEXwtQYAG4GK0E84oZhoRkMTO310u5Nli/SWsMBfWWAcbzy9dOsptZAoy1iWpTnG1mSTy2dOMk4jE2uXKHWunCjK22/ibLmpA3XhJkcN3iFqPEkCsgvX/ty71FX6et3WnOi4GNDmVesixsCzSNR0UlCfV4f64W7YxYtclzUltWHotB2zxmCApx3iJkwy8KwdpwQKr0SLnZl+iMdiUZXgBMxZMtqBD3fDPmRDy/O8nVCcD+Y/Fq63J7Kk6SXPDDQtkoIRfbDnqH56S+oStB9SwDKRdkXVl91Wy0I/FGbbi5yirPBwfDTTrzcEavvqCJUgDqvLFYe7KFqxcdB6pX1sWyXzPJ45DaRdFOkofU0Ll9mUtOdCvIbSB7pB3FbN1RWJE0KWK4DY7bwA3C16LZjUSYkpXBjl7HEqs4nz/fUifRhS1PQw3GYctmwLD4n4QxI/hGZMFE+BABt7cn52vhpr65zfkESdsLHSEwpHy+YnQitCU26BRf12UoP9A1E2QtWxI/3hvRWkBJHFb3CMqEhQ+ByxuU1dew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR03MB5937.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(22082099003)(18002099003)(55112099003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+fGO8EtOnWao2+4w6zbq8/NFsSLJOhKPlfLH3bLw/aGR/RZpVknP7JVfHU8Q?=
 =?us-ascii?Q?ER6YrWNvoNc1ZQ9cgMUXw1r/6LMKW6TrSX5Fjcmi+sGzpZ5gOpuPl33FYDxI?=
 =?us-ascii?Q?D388Mtd2P0kHvxjyajxb/15tLCXdx1UQGw07Y3agj1q79d/MPJHGk+qlTIRs?=
 =?us-ascii?Q?lOdzV32IXEE63SYsbJmvZVDDLClxlGlZ4fvhxqNjHLeZEnYzE8MdwfqWnccR?=
 =?us-ascii?Q?f/FpmRswcWAUZ3JTUD2UPFf8HC32jteVzQ/kTahkmo9hGXDINRQ4Z0vQHUjw?=
 =?us-ascii?Q?0fOGtaeXfRLAMZNZolIDq5bIWh4l6qahP8XlUeyeNgUpvjMURuUDpbXCZH8q?=
 =?us-ascii?Q?c1P7mYbDAQLjtYOizrVNpFa8JT6gEEHGOuGRRbYswJ6obRKmBfnO9TbX5pID?=
 =?us-ascii?Q?IVrjldJLHgA5LrfihKuWJxfTD5yQ8T1wqOapCk9N5k91EvFUTaKJvf38vv1u?=
 =?us-ascii?Q?46hbf8+FfzdogkkrlPIq5Srhq/R5biq8Nc3b+D0iYJK9g1uClK2i8KKWM1S1?=
 =?us-ascii?Q?qFNJ85MpqoxQE3/BiCP1b8SyVXoji1TdNeooR57CoSbs+4MY5StSBfR+ue5T?=
 =?us-ascii?Q?R4IGRmglJ4Ja5uvAQEvbDbexXCv9UnnB2JGGnrzDJIfJiJIwSzukfjGQifzt?=
 =?us-ascii?Q?M4jUGT8ZVbOxx9OZy7/sHR6JEajQT/YcFHTpaYA5H6wTHLmgYGwwpWcx/TbM?=
 =?us-ascii?Q?9XjNVKgluPqlxSvcqX49D4KpcXZYbrlpO2SPLQNRw7ttXQzJ4uu0F0ZJwS5Q?=
 =?us-ascii?Q?r7xFZWbIU/+Q72rvwNm2wnlAplx2M3onmS4p2kl7pRw7LhqtLq8LNmjSH3qb?=
 =?us-ascii?Q?Ph6v45IswoU33AohDaV99DLFjD0hpnazvD7wMUxp0VhEndU3uQqWWoWedms7?=
 =?us-ascii?Q?98kk/oY5/7CIxf84tqtrgS5oMLGvRipv00h8pV8Qj5ad9HzVY4CZw+VFBpxv?=
 =?us-ascii?Q?aSZYjQNdeLIustrXSArE6Hem1nVlhGFrSdBglzak6PiVS08kd1ELSZZDGNe8?=
 =?us-ascii?Q?pJ8ZmEp28J2T/C8wnrV5DiI1+f/X4W2QoLnnZtBvZEQLdb1/be6poFaG450/?=
 =?us-ascii?Q?us1e3MfD/7BGNMs1zJFvH1RHIanwub3Is9YEJVMbQgSCtUjhDsw/gfLU/N0v?=
 =?us-ascii?Q?1rQz/HkHGSK6l5/D5G8novGC03xkOC4/VbkgxhvZ7sbMni9GjOeMGiXRsD6T?=
 =?us-ascii?Q?wIH+bH0Ir15DkQBf+qoFAGvKMa28M/4D+GsVe0akJg+OCTUVYL8HstZPqJUT?=
 =?us-ascii?Q?ZWnitKcnrTJJFbvntm8sufoT+WZ4iKRCM0w5ZVRqLn4Z33957vTUAV+1Zbw+?=
 =?us-ascii?Q?AanyfxF6jdXKpEtVbA0FvaWm77tsZPcrNdZIKJqdCLrxqXbsx+V5b0+0yP9T?=
 =?us-ascii?Q?YiBIn0DO7db1LXoW1H38zEqUMDYDYXbCEiKnkHKB1XE2R+2h3buG/wjBnWRg?=
 =?us-ascii?Q?4cUTD7xV22wJvaR+Haz/I+Jk9qFj8bRhmPKRy9xrOQEs+SfvFunug170RlvK?=
 =?us-ascii?Q?fAbrjEV/wv/GFHicVGf/H/nmO5C9NHWoAVsBwVvgd+Ll4Z6plnNGzlRpa0Qg?=
 =?us-ascii?Q?iohGBZRu/LrC5hzLKaiFQ495y8pXJgV7yMB/06HFaYt2vD6sQeM/1M0SGRI3?=
 =?us-ascii?Q?S/JiYr0EBSVFaJkKmJ48OyYLyr+SAwiElHhjCsZHwocWaMQU9YijNrZCvM84?=
 =?us-ascii?Q?5X1qDROwTRwAzQULIixL/wur81L5vGDHKZQrrSEUqpFwrQZJkma+aovE/Peg?=
 =?us-ascii?Q?g//NqLKjZg=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4818ffcc-8a6d-432b-5211-08dee23a5157
X-MS-Exchange-CrossTenant-AuthSource: CO1PR03MB5937.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 06:28:45.6981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKPw1PFki/0YEcfEyUu8Q1e8C9og+Ik6xzMe+YfOWCHXURE8Psien5sv/xTWK4oJhJ+/2vsHhL8Y3tP+nqDvTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989111

From: Tze Yee Ng <tze.yee.ng@altera.com>

Add a hardware monitor driver for Altera SoC FPGA devices using the
Stratix 10 service layer. Sensor channels are selected based on the
service layer compatible string.

Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
Signed-off-by: Tze Yee Ng <tze.yee.ng@altera.com>
---
Changes in v5:
- Poll async responses until HWMON_TIMEOUT (2 s) instead of a fixed
  3-iteration retry loop (~3 ms), fixing premature timeouts observed
  on silicon
- Add MODULE_ALIAS("platform:socfpga-hwmon")

Changes in v4:
- Register devm_add_action_or_reset() before
  devm_hwmon_device_register_with_info(); drop manual channel cleanup
  on hwmon registration failure
- Remove unreferenced async completion and pre-poll
  wait_for_completion_io_timeout(); poll directly after async_send()
  with the existing retry loop

Changes in v3:
- Fix 16-bit signed Q8.8 temperature conversion (cast through s16)
- Remove unused async callback; pass NULL to stratix10_svc_async_send()
- Keep wait_for_completion_io_timeout() before polling with comment
  explaining the service layer never invokes the callback but firmware
  needs time to complete the transaction (RSU pattern)
- Align async poll loop with RSU (retry on failure instead of aborting)
- Use wait_for_completion_timeout() for synchronous reads
- Handle -EINVAL and -EOPNOTSUPP when async client registration fails
- Defer SVC channel/async cleanup via devm_add_action_or_reset();
  drop .remove()

Changes in v2:
- Drop altr,stratix10-hwmon OF compatible and DT channel parsing
- Select channels from hardcoded tables using parent SVC compatible
  (intel,stratix10-svc or intel,agilex-svc)
- Rename driver from stratix10-hwmon to socfpga-hwmon
- Rename Kconfig symbol to CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON
- Add Agilex voltage and temperature channel tables
- Convert SDM Q8.8 degrees Celsius to hwmon millidegrees
- Convert SDM Q16 volts to hwmon millivolts
- Use socfpga_hwmon as hwmon sysfs device name
- Add last_err for synchronous SVC read error propagation
- Update Documentation/hwmon and MAINTAINERS accordingly
---
 Documentation/hwmon/index.rst         |   1 +
 Documentation/hwmon/socfpga-hwmon.rst |  34 ++
 MAINTAINERS                           |   8 +
 drivers/hwmon/Kconfig                 |  10 +
 drivers/hwmon/Makefile                |   1 +
 drivers/hwmon/socfpga-hwmon.c         | 579 ++++++++++++++++++++++++++
 6 files changed, 633 insertions(+)
 create mode 100644 Documentation/hwmon/socfpga-hwmon.rst
 create mode 100644 drivers/hwmon/socfpga-hwmon.c

diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index 29130df44d12..3299417a24b8 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -254,6 +254,7 @@ Hardware Monitoring Kernel Drivers
    sparx5-temp
    spd5118
    stpddc60
+   socfpga-hwmon
    surface_fan
    sy7636a-hwmon
    tc654
diff --git a/Documentation/hwmon/socfpga-hwmon.rst b/Documentation/hwmon/socfpga-hwmon.rst
new file mode 100644
index 000000000000..e5da42556a62
--- /dev/null
+++ b/Documentation/hwmon/socfpga-hwmon.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Kernel driver socfpga-hwmon
+=============================
+
+Supported chips:
+
+ * Altera Stratix 10 SoC FPGA
+ * Altera Agilex SoC FPGA
+
+Authors:
+      - Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+      - Tze Yee Ng <tze.yee.ng@altera.com>
+
+Description
+-----------
+
+This driver supports hardware monitoring for Altera SoC
+FPGA devices through the Secure Device Manager and Stratix 10 service layer.
+
+The following sensor types are supported:
+
+  * temperature
+  * voltage
+
+Usage Notes
+-----------
+
+The stratix10-svc driver registers a socfpga-hwmon platform device when
+hardware monitor support is enabled. Sensor channels are selected in the
+driver based on the service layer compatible string:
+
+  * intel,stratix10-svc
+  * intel,agilex-svc
diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..2b0ee6d5c6ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -965,6 +965,14 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-altera.c
 
+ALTERA SoC FPGA HWMON DRIVER
+M:	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+M:	Tze Yee Ng <tze.yee.ng@altera.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/socfpga-hwmon.rst
+F:	drivers/hwmon/socfpga-hwmon.c
+
 ALTERA TRIPLE SPEED ETHERNET DRIVER
 M:	Boon Khai Ng <boon.khai.ng@altera.com>
 L:	netdev@vger.kernel.org
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5c2d3ff5fce8..54ce630c7de6 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2157,6 +2157,16 @@ config SENSORS_SMSC47M192
 	  This driver can also be built as a module. If so, the module
 	  will be called smsc47m192.
 
+config SENSORS_ALTERA_SOCFPGA_HWMON
+	tristate "Altera SoC FPGA hardware monitoring features"
+	depends on INTEL_STRATIX10_SERVICE
+	help
+	  If you say yes here you get support for the temperature and
+	  voltage sensors of Altera SoC FPGA devices.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called socfpga-hwmon.
+
 config SENSORS_SMSC47B397
 	tristate "SMSC LPC47B397-NC"
 	depends on HAS_IOPORT
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 63effc0ab8d1..aeedee80e1f0 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -221,6 +221,7 @@ obj-$(CONFIG_SENSORS_SMPRO)	+= smpro-hwmon.o
 obj-$(CONFIG_SENSORS_SMSC47B397)+= smsc47b397.o
 obj-$(CONFIG_SENSORS_SMSC47M1)	+= smsc47m1.o
 obj-$(CONFIG_SENSORS_SMSC47M192)+= smsc47m192.o
+obj-$(CONFIG_SENSORS_ALTERA_SOCFPGA_HWMON)	+= socfpga-hwmon.o
 obj-$(CONFIG_SENSORS_SPARX5)	+= sparx5-temp.o
 obj-$(CONFIG_SENSORS_SPD5118)	+= spd5118.o
 obj-$(CONFIG_SENSORS_STTS751)	+= stts751.o
diff --git a/drivers/hwmon/socfpga-hwmon.c b/drivers/hwmon/socfpga-hwmon.c
new file mode 100644
index 000000000000..72418201b65d
--- /dev/null
+++ b/drivers/hwmon/socfpga-hwmon.c
@@ -0,0 +1,579 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Altera SoC FPGA hardware monitoring driver
+ *
+ * Copyright (c) 2026 Altera Corporation
+ *
+ * Authors:
+ *	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
+ *	Tze Yee Ng <tze.yee.ng@altera.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/firmware/intel/stratix10-svc-client.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/jiffies.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+
+#define HWMON_TIMEOUT			msecs_to_jiffies(SVC_HWMON_REQUEST_TIMEOUT_MS)
+#define HWMON_RETRY_SLEEP_MS		1U
+#define HWMON_ASYNC_MSG_RETRY		3U
+#define SOCFPGA_HWMON_MAXSENSORS	16
+#define SOCFPGA_HWMON_CHANNEL_MASK	GENMASK(15, 0)
+#define SOCFPGA_HWMON_PAGE_SHIFT	16
+#define SOCFPGA_HWMON_CHAN(page, channel) \
+	(((page) << SOCFPGA_HWMON_PAGE_SHIFT) | \
+	 ((channel) & SOCFPGA_HWMON_CHANNEL_MASK))
+#define SOCFPGA_HWMON_ATTR_VISIBLE	0444
+/* Temperature from SDM is signed Q8.8 degrees Celsius (8 fractional bits). */
+#define SOCFPGA_HWMON_TEMP_FRAC_BITS	8
+#define SOCFPGA_HWMON_TEMP_FRAC_DIV	BIT(SOCFPGA_HWMON_TEMP_FRAC_BITS)
+#define SOCFPGA_HWMON_TEMP_MDEG_SCALE	1000
+/* Voltage from SDM is unsigned Q16 volts (16 fractional bits). */
+#define SOCFPGA_HWMON_VOLT_FRAC_BITS	16
+#define SOCFPGA_HWMON_VOLT_FRAC_DIV	BIT(SOCFPGA_HWMON_VOLT_FRAC_BITS)
+#define SOCFPGA_HWMON_VOLT_MV_SCALE	1000
+
+#define ETEMP_INACTIVE			0x80000000U
+#define ETEMP_TOO_OLD			0x80000001U
+#define ETEMP_NOT_PRESENT		0x80000002U
+#define ETEMP_TIMEOUT			0x80000003U
+#define ETEMP_CORRUPT			0x80000004U
+#define ETEMP_BUSY			0x80000005U
+#define ETEMP_NOT_INITIALIZED		0x800000FFU
+
+struct socfpga_hwmon_channel {
+	u32 reg;
+	const char *label;
+};
+
+struct socfpga_hwmon_board_data {
+	const struct socfpga_hwmon_channel *temp;
+	unsigned int num_temp;
+	const struct socfpga_hwmon_channel *volt;
+	unsigned int num_volt;
+};
+
+struct socfpga_hwmon_priv {
+	struct stratix10_svc_chan *chan;
+	struct stratix10_svc_client client;
+	struct completion completion;
+	struct mutex lock;	/* protect SVC calls */
+	bool async;
+	int last_err;		/* sync-mode SVC result; 0 on success */
+	u32 temperature;
+	u32 voltage;
+	int temperature_channels;
+	int voltage_channels;
+	const char *temp_chan_names[SOCFPGA_HWMON_MAXSENSORS];
+	const char *volt_chan_names[SOCFPGA_HWMON_MAXSENSORS];
+	u32 temp_chan[SOCFPGA_HWMON_MAXSENSORS];
+	u32 volt_chan[SOCFPGA_HWMON_MAXSENSORS];
+};
+
+static umode_t socfpga_hwmon_is_visible(const void *dev,
+					enum hwmon_sensor_types type,
+					u32 attr, int chan)
+{
+	const struct socfpga_hwmon_priv *priv = dev;
+
+	switch (type) {
+	case hwmon_temp:
+		if (chan < priv->temperature_channels)
+			return SOCFPGA_HWMON_ATTR_VISIBLE;
+		return 0;
+	case hwmon_in:
+		if (chan < priv->voltage_channels)
+			return SOCFPGA_HWMON_ATTR_VISIBLE;
+		return 0;
+	default:
+		return 0;
+	}
+}
+
+static void socfpga_hwmon_readtemp_cb(struct stratix10_svc_client *client,
+				      struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_hwmon_priv *priv = client->priv;
+
+	priv->last_err = -EIO;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->last_err = 0;
+		priv->temperature = (u32)*(unsigned long *)data->kaddr1;
+	} else if (data->kaddr1) {
+		dev_err(client->dev, "%s failed with status 0x%x, value 0x%lx\n",
+			__func__, data->status,
+			*(unsigned long *)data->kaddr1);
+	} else {
+		dev_err(client->dev, "%s failed with status 0x%x\n",
+			__func__, data->status);
+	}
+
+	complete(&priv->completion);
+}
+
+static void socfpga_hwmon_readvolt_cb(struct stratix10_svc_client *client,
+				      struct stratix10_svc_cb_data *data)
+{
+	struct socfpga_hwmon_priv *priv = client->priv;
+
+	priv->last_err = -EIO;
+	if (data->status == BIT(SVC_STATUS_OK)) {
+		priv->last_err = 0;
+		priv->voltage = (u32)*(unsigned long *)data->kaddr1;
+	} else if (data->kaddr1) {
+		dev_err(client->dev, "%s failed with status 0x%x, value 0x%lx\n",
+			__func__, data->status,
+			*(unsigned long *)data->kaddr1);
+	} else {
+		dev_err(client->dev, "%s failed with status 0x%x\n",
+			__func__, data->status);
+	}
+
+	complete(&priv->completion);
+}
+
+static int socfpga_hwmon_parse_temp(long *val, u32 temperature)
+{
+	switch (temperature) {
+	case ETEMP_INACTIVE:
+	case ETEMP_NOT_PRESENT:
+	case ETEMP_CORRUPT:
+	case ETEMP_NOT_INITIALIZED:
+		return -EOPNOTSUPP;
+	case ETEMP_TIMEOUT:
+	case ETEMP_BUSY:
+	case ETEMP_TOO_OLD:
+		return -EAGAIN;
+	default:
+		/* SDM returns a 16-bit signed Q8.8 value in the low 16 bits. */
+		*val = (long)(s16)(temperature & SOCFPGA_HWMON_CHANNEL_MASK) *
+			SOCFPGA_HWMON_TEMP_MDEG_SCALE / SOCFPGA_HWMON_TEMP_FRAC_DIV;
+		return 0;
+	}
+}
+
+static int socfpga_hwmon_encode_temp_arg(u32 reg, u64 *arg)
+{
+	u32 page = (reg >> SOCFPGA_HWMON_PAGE_SHIFT) & SOCFPGA_HWMON_CHANNEL_MASK;
+	u32 channel = reg & SOCFPGA_HWMON_CHANNEL_MASK;
+
+	if (channel >= SOCFPGA_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	*arg = (1ULL << channel) | ((u64)page << SOCFPGA_HWMON_PAGE_SHIFT);
+	return 0;
+}
+
+static int socfpga_hwmon_encode_volt_arg(u32 reg, u64 *arg)
+{
+	u32 channel = reg & SOCFPGA_HWMON_CHANNEL_MASK;
+
+	if (channel >= SOCFPGA_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	*arg = 1ULL << channel;
+	return 0;
+}
+
+static int socfpga_hwmon_async_read(struct device *dev,
+				    enum hwmon_sensor_types type,
+				    struct stratix10_svc_client_msg *msg)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct stratix10_svc_cb_data data = {};
+	unsigned long deadline = jiffies + HWMON_TIMEOUT;
+	void *handle = NULL;
+	int status, index, ret;
+
+	for (index = 0; index < HWMON_ASYNC_MSG_RETRY; index++) {
+		status = stratix10_svc_async_send(priv->chan, msg, &handle,
+						  NULL, NULL);
+		if (status == 0)
+			break;
+		dev_warn(dev, "Failed to send async message: %d\n", status);
+		msleep(HWMON_RETRY_SLEEP_MS);
+	}
+
+	if (status && !handle) {
+		dev_err(dev, "Failed to send async message after %u retries: %d\n",
+			HWMON_ASYNC_MSG_RETRY, status);
+		return status;
+	}
+
+	ret = -ETIMEDOUT;
+	while (!time_after(jiffies, deadline)) {
+		status = stratix10_svc_async_poll(priv->chan, handle, &data);
+		if (status == -EAGAIN) {
+			dev_dbg(dev, "Async message is still in progress\n");
+		} else if (status < 0) {
+			dev_alert(dev, "Failed to poll async message: %d\n", status);
+			ret = -ETIMEDOUT;
+		} else if (status == 0) {
+			ret = 0;
+			break;
+		}
+		msleep(HWMON_RETRY_SLEEP_MS);
+	}
+
+	if (ret) {
+		dev_err(dev, "Failed to get async response\n");
+		goto done;
+	}
+
+	if (data.status) {
+		dev_err(dev, "%s returned 0x%x from SDM\n", __func__,
+			data.status);
+		ret = -EFAULT;
+		goto done;
+	}
+
+	if (type == hwmon_temp)
+		priv->temperature = (u32)*(unsigned long *)data.kaddr1;
+	else
+		priv->voltage = (u32)*(unsigned long *)data.kaddr1;
+
+	ret = 0;
+
+done:
+	stratix10_svc_async_done(priv->chan, handle);
+	return ret;
+}
+
+static int socfpga_hwmon_sync_read(struct device *dev,
+				   enum hwmon_sensor_types type,
+				   struct stratix10_svc_client_msg *msg)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	reinit_completion(&priv->completion);
+
+	if (type == hwmon_temp)
+		priv->client.receive_cb = socfpga_hwmon_readtemp_cb;
+	else
+		priv->client.receive_cb = socfpga_hwmon_readvolt_cb;
+
+	ret = stratix10_svc_send(priv->chan, msg);
+	if (ret < 0)
+		goto status_done;
+
+	ret = wait_for_completion_timeout(&priv->completion, HWMON_TIMEOUT);
+	if (!ret) {
+		dev_err(priv->client.dev, "timeout waiting for SMC call\n");
+		ret = -ETIMEDOUT;
+		goto status_done;
+	}
+
+	ret = priv->last_err;
+
+status_done:
+	stratix10_svc_done(priv->chan);
+	return ret;
+}
+
+static int socfpga_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int chan, long *val)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+	struct stratix10_svc_client_msg msg = {0};
+	int ret;
+
+	if (chan >= SOCFPGA_HWMON_MAXSENSORS)
+		return -EOPNOTSUPP;
+
+	switch (type) {
+	case hwmon_temp:
+		ret = socfpga_hwmon_encode_temp_arg(priv->temp_chan[chan],
+						    &msg.arg[0]);
+		if (ret)
+			return ret;
+		msg.command = COMMAND_HWMON_READTEMP;
+		break;
+	case hwmon_in:
+		ret = socfpga_hwmon_encode_volt_arg(priv->volt_chan[chan],
+						    &msg.arg[0]);
+		if (ret)
+			return ret;
+		msg.command = COMMAND_HWMON_READVOLT;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	guard(mutex)(&priv->lock);
+	if (priv->async)
+		ret = socfpga_hwmon_async_read(dev, type, &msg);
+	else
+		ret = socfpga_hwmon_sync_read(dev, type, &msg);
+	if (ret)
+		return ret;
+
+	if (type == hwmon_temp)
+		ret = socfpga_hwmon_parse_temp(val, priv->temperature);
+	else
+		/* SDM returns Q16 volts; convert to hwmon millivolts. */
+		*val = (long)priv->voltage * SOCFPGA_HWMON_VOLT_MV_SCALE /
+			SOCFPGA_HWMON_VOLT_FRAC_DIV;
+	return ret;
+}
+
+static int socfpga_hwmon_read_string(struct device *dev,
+				     enum hwmon_sensor_types type, u32 attr,
+				     int chan, const char **str)
+{
+	struct socfpga_hwmon_priv *priv = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_in:
+		*str = priv->volt_chan_names[chan];
+		return 0;
+	case hwmon_temp:
+		*str = priv->temp_chan_names[chan];
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static const struct hwmon_ops socfpga_hwmon_ops = {
+	.is_visible = socfpga_hwmon_is_visible,
+	.read = socfpga_hwmon_read,
+	.read_string = socfpga_hwmon_read_string,
+};
+
+static const struct hwmon_channel_info *socfpga_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct hwmon_chip_info socfpga_hwmon_chip_info = {
+	.ops = &socfpga_hwmon_ops,
+	.info = socfpga_hwmon_info,
+};
+
+static const struct socfpga_hwmon_channel s10_hwmon_volt_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 2), "0.8V VCC" },
+	{ SOCFPGA_HWMON_CHAN(0, 3), "1.8V VCCIO_SDM" },
+	{ SOCFPGA_HWMON_CHAN(0, 6), "0.9V VCCERAM" },
+};
+
+static const struct socfpga_hwmon_channel s10_hwmon_temp_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 0), "Main Die SDM" },
+};
+
+static const struct socfpga_hwmon_board_data s10_hwmon_board = {
+	.temp = s10_hwmon_temp_channels,
+	.num_temp = ARRAY_SIZE(s10_hwmon_temp_channels),
+	.volt = s10_hwmon_volt_channels,
+	.num_volt = ARRAY_SIZE(s10_hwmon_volt_channels),
+};
+
+static const struct socfpga_hwmon_channel agilex_hwmon_volt_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 2), "0.8V VCC" },
+	{ SOCFPGA_HWMON_CHAN(0, 3), "1.8V VCCIO_SDM" },
+	{ SOCFPGA_HWMON_CHAN(0, 4), "1.8V VCCPT" },
+	{ SOCFPGA_HWMON_CHAN(0, 5), "1.2V VCCCRCORE" },
+	{ SOCFPGA_HWMON_CHAN(0, 6), "0.9V VCCH" },
+	{ SOCFPGA_HWMON_CHAN(0, 7), "0.8V VCCL" },
+};
+
+static const struct socfpga_hwmon_channel agilex_hwmon_temp_channels[] = {
+	{ SOCFPGA_HWMON_CHAN(0, 0), "Main Die SDM" },
+	{ SOCFPGA_HWMON_CHAN(1, 0), "Main Die corner bottom left max" },
+	{ SOCFPGA_HWMON_CHAN(2, 0), "Main Die corner top left max" },
+	{ SOCFPGA_HWMON_CHAN(3, 0), "Main Die corner bottom right max" },
+	{ SOCFPGA_HWMON_CHAN(4, 0), "Main Die corner top right max" },
+};
+
+static const struct socfpga_hwmon_board_data agilex_hwmon_board = {
+	.temp = agilex_hwmon_temp_channels,
+	.num_temp = ARRAY_SIZE(agilex_hwmon_temp_channels),
+	.volt = agilex_hwmon_volt_channels,
+	.num_volt = ARRAY_SIZE(agilex_hwmon_volt_channels),
+};
+
+static const struct socfpga_hwmon_board_data *
+socfpga_hwmon_get_board(struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+
+	if (!np)
+		return NULL;
+
+	if (of_device_is_compatible(np, "intel,stratix10-svc"))
+		return &s10_hwmon_board;
+	if (of_device_is_compatible(np, "intel,agilex-svc"))
+		return &agilex_hwmon_board;
+
+	return NULL;
+}
+
+static int socfpga_hwmon_init_channels(struct device *dev,
+				       const struct socfpga_hwmon_board_data *board,
+				       struct socfpga_hwmon_priv *priv)
+{
+	unsigned int i;
+
+	if (board->num_temp > SOCFPGA_HWMON_MAXSENSORS ||
+	    board->num_volt > SOCFPGA_HWMON_MAXSENSORS)
+		return -EINVAL;
+
+	for (i = 0; i < board->num_temp; i++) {
+		priv->temp_chan_names[i] = board->temp[i].label;
+		priv->temp_chan[i] = board->temp[i].reg;
+	}
+	priv->temperature_channels = board->num_temp;
+
+	for (i = 0; i < board->num_volt; i++) {
+		priv->volt_chan_names[i] = board->volt[i].label;
+		priv->volt_chan[i] = board->volt[i].reg;
+	}
+	priv->voltage_channels = board->num_volt;
+
+	return 0;
+}
+
+static void socfpga_hwmon_release_svc(void *data)
+{
+	struct socfpga_hwmon_priv *priv = data;
+
+	if (priv->async)
+		stratix10_svc_remove_async_client(priv->chan);
+	stratix10_svc_free_channel(priv->chan);
+}
+
+static int socfpga_hwmon_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device *parent = dev->parent;
+	const struct socfpga_hwmon_board_data *board;
+	struct socfpga_hwmon_priv *priv;
+	struct device *hwmon_dev;
+	int ret;
+
+	if (!parent || !parent->of_node) {
+		dev_err(dev, "missing parent device node\n");
+		return -ENODEV;
+	}
+
+	board = socfpga_hwmon_get_board(parent);
+	if (!board) {
+		dev_err(dev, "unsupported service layer compatible\n");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client.dev = dev;
+	priv->client.priv = priv;
+	init_completion(&priv->completion);
+	mutex_init(&priv->lock);
+
+	ret = socfpga_hwmon_init_channels(dev, board, priv);
+	if (ret)
+		return ret;
+
+	priv->chan = stratix10_svc_request_channel_byname(&priv->client,
+							  SVC_CLIENT_HWMON);
+	if (IS_ERR(priv->chan)) {
+		ret = PTR_ERR(priv->chan);
+		if (ret == -EPROBE_DEFER)
+			dev_dbg(dev, "service channel %s not ready, deferring probe\n",
+				SVC_CLIENT_HWMON);
+		else
+			dev_err(dev, "couldn't get service channel %s: %d\n",
+				SVC_CLIENT_HWMON, ret);
+		return ret;
+	}
+
+	ret = stratix10_svc_add_async_client(priv->chan, false);
+	switch (ret) {
+	case 0:
+		priv->async = true;
+		break;
+	case -EINVAL:
+	case -EOPNOTSUPP:
+		/*
+		 * stratix10_svc_add_async_client() returns -EINVAL when the
+		 * async controller is not initialized; fall back to sync mode.
+		 */
+		dev_dbg(dev, "async operations not supported, using sync mode\n");
+		priv->async = false;
+		break;
+	default:
+		dev_err(dev, "failed to add async client: %d\n", ret);
+		stratix10_svc_free_channel(priv->chan);
+		return ret;
+	}
+
+	ret = devm_add_action_or_reset(dev, socfpga_hwmon_release_svc, priv);
+	if (ret)
+		return ret;
+
+	hwmon_dev = devm_hwmon_device_register_with_info(dev, "socfpga_hwmon",
+							 priv,
+							 &socfpga_hwmon_chip_info,
+							 NULL);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	platform_set_drvdata(pdev, priv);
+	return 0;
+}
+
+static struct platform_driver socfpga_hwmon_driver = {
+	.probe = socfpga_hwmon_probe,
+	.driver = {
+		.name = "socfpga-hwmon",
+	},
+};
+module_platform_driver(socfpga_hwmon_driver);
+
+MODULE_AUTHOR("Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>");
+MODULE_AUTHOR("Tze Yee Ng <tze.yee.ng@altera.com>");
+MODULE_DESCRIPTION("Altera SoC FPGA hardware monitoring driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:socfpga-hwmon");
-- 
2.43.7

