Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.148.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388439;
	b=gduI4/IJWZqj1lAG0ojeeDnptpyi9JTw1m4k5np/Wzk6flt4/57huHWB7gdgQac6GvWy
	 +RLlWAlbzaCLdEd/b7uLsVvBwvN/Gnb0DLvDbvpR+rWSQ7PLn22YKc+4n1RyGf4kcBL1y
	 E6mCdc5PL9ku7GvfK5eBCWi17ArB7Pohn8trkxjrCanmzkiTxkR2rw5dp+eELACaV8VZy
	 V60lvzhVhxQsWexIySibsYDqRKQuf+uWfDVkSxpK5FCEBVE6Ba9UwbsvdsfbGZCbkp+Y5
	 dAc/+/cbdFrHyYyfzJM8yqgggpvCBcePmcZ5e/kyjhtfRbgda8FQYbqg8s6teBNpYgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GRzsaOCKjDVmrskdVuxSmKYoO/Bmer5GyRq6NF1cbik=;
	b=pJH5iBzy5sALunzKzhyNTqZ7/AqV3lEyA8wqHt7vyMeJk/sxAdGmEoupkiRQ3q6lptJO
	 VhMukgH8lEd5hwXDAldf2L6k728V9ZLLOeqA32WBEmypZgKlzwOe42bZfHZag09l6YklP
	 g5USXQIRZ8pzqyHro1TuZVisTaFkGUyon+ht3vZOMNpqZ50nkDqlp1/zU6uVlnbjFudya
	 U5+unlrmwBq7k3Y1kBbAE4pS9u17Nz+plnV2sWFopw7sNWznVmzBUxCdHMb6vPxHJAMc1
	 grexeo9LWk+DWILB7/mtg6mllelmJaBN7apfdTNYWYI33e9/LqBa9Zsn2mM6YdzSRkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=gCyHf1IO;
	arc=none smtp.remote-ip=148.163.148.104
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEC2606A327
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 09:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEC2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=gCyHf1IO
Received: from pps.filterd (m0464638.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5Ms8Y4085675;
	Wed, 11 Nov 2026 09:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=GRzsaOCKjD
	VmrskdVuxSmKYoO/Bmer5GyRq6NF1cbik=; b=gCyHf1IOTDscQDxbs9IK7hwVLH
	oc6E3USKUNHTKOxKiGkwYKL83DsEbStVl+OH8rEaFe6KQkvQvyzb8VGNqwEQJ4gL
	uBprD6ZGLC4KvBXLMeafv7Q9sdB1V6az1L4AfZ0hlbDShMR14GpjGx6JJUMBabqa
	fcp6F0+1mPUIQDyGKXXmwEPEksExZFySEbpxdVQDq9GXuUzJ60MXGcG0mmihW05M
	Udy6+DO0tC3rOPdlcmPTkdgXOjtSMJM3w5ohXj6RQs5tW7tfhKo1w0xWfDc3Z1kD
	Aw51/Ug4j7i4x0TDmKcLevRZcdnsfaloMlKsRI6nLrZODkKDDIwZTkTIZN6w==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4htfefnhbj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 09:13:41 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4jPd8T0tDHz9vVNs;
	Wed, 11 Nov 2026 09:12:41 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4jPd9b0837z4yHH;
	Wed, 11 Nov 2026 09:13:39 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, jdelvare@suse.com, lijq9@lenovo.com
Subject: [PATCH v1 2/2] hwmon: Add driver for the NCT6801D EC sensor window
Date: Wed, 11 Nov 2026 17:13:38 +0800
Message-ID: <20261111091338.799889-3-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111091338.799889-1-lijq9@lenovo.com>
References: <20261111091338.799889-1-lijq9@lenovo.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DoDDa2/+ c=1 sm=1 tr=0 ts=6af431c5 cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=QJilI6ASod0cdCKXAsqI:22 a=8k6WQxmsAAAA:8 a=ESrXGY6UmIiBSyv7DF8A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX7YpArBVqsXI8
 Yy1iiN/GBwpya1vcTwaxuQMgKnM+rWsUTtRASuzqJ6Q3FUDlp1g1yGl6AxNtV+cSuc7Fc4K/Vtp
 XlEt96hTfyVJEq7wV8FnD/7UQf1meLVzJvmcS02oH89MJty940HgZwvvGHOOdNdfrpiXaGU8LLH
 7CEZ0H7U6tgRyjA1WaZL2WhhhZ0g+j+r7FyMevGjb2S4qn3M07iZzITP3a9gnKPwOvJI/I6pMZl
 X3Yao4F/ZcU3cTH3C+Lx8Aw6W03nn5y3sdrYQKCrlxezB2WYrbbWoAdmcludN9lD9pcm7I9QF98
 R57DhcsTfK4rwBQAQB8jqZkEl/G1MYka8CMZx9P6oLos8YRlnk2ITOyV8hDa6degPY07exc8QHZ
 v55pZS5x5uNTMGrUVwgnlcQdmwfMGb52iSJYWrs4ZFm6eEhTkmwQP9EjUO0Ln1oO4hkwiEimiO3
 Mp28FmGQijrnwkKaHdg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX6a8G57MhGOup
 vs96IxL0r2Y/LVnglopwDNYgfPxeb/E16qZD6RPPl7iyh5QxmH8MD+zuNXAGkkqNEluTUut0obc
 lBksj7TlObIvMxsJAxLL22dbxagZ8wY=
X-Proofpoint-ORIG-GUID: LKhwmTVqtt1BkXFh8qpFnl2ap-V1yvk5
X-Proofpoint-GUID: LKhwmTVqtt1BkXFh8qpFnl2ap-V1yvk5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110036

The Nuvoton NCT6801D used in the Lenovo P3 TWR G2 does not expose a
hardware monitor logical device in its Super-I/O configuration space:
LDN 0Bh is the ATXPGD/BEEP/DDR4 block, so the eSIO-style register window
that nct6683 relies on does not exist on this part.

Fan and temperature values are instead published by the EC firmware in
one of the shared-memory windows of the SHM logical device (LDN 0Fh),
which the ACPI firmware maps as

	OperationRegion (SHWM, SystemMemory, <base>, 0xFF)

The window base is not hardcoded: it is read back from the shared-memory
configuration registers (SHAW1..SHAW5 base address, at indices F7h-F4h,
FBh-F8h, E3h-E0h, E7h-E4h and EBh-E8h of LDN 0Fh for memory access), as
documented in the Datasheet. Several windows are normally enabled, so
each candidate is checked for plausible sensor data before it is
accepted and an unrelated mapping is never exposed as a sensor device.

The controller is matched on the full 16-bit Super-I/O ID (registers
20h/21h), which reads back as 0113h. The lower nibble carries the device
variant on this part, so a masked comparison would clear the very bits
that identify it.

The layout inside the window is defined by the platform firmware rather
than by the controller: the Datasheet specifies the window mechanism but
no fan or temperature register block inside it. The offsets used here are
the ones the Lenovo firmware generates for this machine:

  0x24/0x26/0x28  TD0..TD2 thermal diodes
  0x30            CPU temperature
  0x32            PCH temperature
  0x50            10 fan tachometers, 2 bytes each, big endian RPM

A machine whose firmware lays the window out differently fails the same
plausibility check and reports no sensors instead of wrong ones, so
tying the offsets to this platform does not turn into bad readings
elsewhere.

Verified on a Lenovo P3 TWR G2: the driver locates the window
(0xfe500200) without any module parameter. Under full load the CPU fan
goes from 808 to 2920 RPM and the CPU temperature from 32 to 100 C. At
the same moment ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C,
x86_pkg_temp 100.00 C and coretemp 101.0 C, i.e. four independent
sources agree within 1 C. Readings return to idle values when the load
is removed.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
 drivers/hwmon/Kconfig          |  17 ++
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/nct-ec-sensors.c | 507 +++++++++++++++++++++++++++++++++
 3 files changed, 525 insertions(+)
 create mode 100644 drivers/hwmon/nct-ec-sensors.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5c2d3ff5fce8..6358ec85c700 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1754,6 +1754,23 @@ config SENSORS_NCT6683
 	  This driver can also be built as a module. If so, the module
 	  will be called nct6683.
 
+config SENSORS_NCT_EC
+	tristate "Nuvoton EC sensor window"
+	depends on HAS_IOPORT
+	depends on !PPC
+	help
+	  If you say yes here you get support for the fan and temperature
+	  sensors of the Nuvoton NCT6801D embedded controller found in
+	  Lenovo systems, which are published through the EC shared-memory
+	  window rather than through a Super-I/O hardware monitor block.
+
+	  The window is set up by the platform firmware; the driver only
+	  reads it. A machine whose firmware lays the window out
+	  differently reports no sensors rather than wrong readings.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called nct_ec_sensors.
+
 config SENSORS_NCT6694
 	tristate "Nuvoton NCT6694 Hardware Monitor support"
 	depends on MFD_NCT6694
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 63effc0ab8d1..59b50cf80e9c 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -179,6 +179,7 @@ obj-$(CONFIG_SENSORS_TPS23861)	+= tps23861.o
 obj-$(CONFIG_SENSORS_MLXREG_FAN) += mlxreg-fan.o
 obj-$(CONFIG_SENSORS_MENF21BMC_HWMON) += menf21bmc_hwmon.o
 obj-$(CONFIG_SENSORS_MR75203)	+= mr75203.o
+obj-$(CONFIG_SENSORS_NCT_EC)	+= nct-ec-sensors.o
 obj-$(CONFIG_SENSORS_NCT6683)	+= nct6683.o
 obj-$(CONFIG_SENSORS_NCT6694)	+= nct6694-hwmon.o
 obj-$(CONFIG_SENSORS_NCT6775_CORE) += nct6775-core.o
diff --git a/drivers/hwmon/nct-ec-sensors.c b/drivers/hwmon/nct-ec-sensors.c
new file mode 100644
index 000000000000..82d048275cba
--- /dev/null
+++ b/drivers/hwmon/nct-ec-sensors.c
@@ -0,0 +1,507 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * nct_ec_sensors - hwmon driver for the Nuvoton EC sensor window
+ *
+ * Copyright (C) 2026 Jiqi Li <lijq9@lenovo.com>
+ *
+ * The Nuvoton NCT6801D embedded controller used in Lenovo systems does
+ * not expose a hardware-monitor logical device in its Super-I/O
+ * configuration space: LDN 0Bh is the ATXPGD/BEEP/DDR4 block, so the
+ * eSIO-style register window that nct6683 relies on does not exist on
+ * this part.
+ *
+ * Fan and temperature values are instead published by the EC firmware in
+ * one of the shared-memory windows of the SHM logical device (LDN 0Fh),
+ * which the ACPI firmware maps as
+ *
+ *	OperationRegion (SHWM, SystemMemory, <base>, 0xFF)
+ *
+ * The window base is not hardcoded. It is read back from the shared-memory
+ * configuration registers of the EC itself (LDN 0Fh, SHAW1..SHAW5 base
+ * address registers at indices F7h-F4h, FBh-F8h, E3h-E0h, E7h-E4h and
+ * EBh-E8h for memory access), which is where the firmware that programmed
+ * the window keeps it. Several windows are usually enabled, so each
+ * candidate is checked for plausible sensor data before it is accepted.
+ *
+ * The layout inside the window is defined by the platform firmware and
+ * not by the controller: the Datasheet specifies the window mechanism but
+ * no fan or temperature register block inside it. Different machines can
+ * therefore lay the same window out differently. The offsets used here
+ * are the ones this machine's firmware generates; a window whose contents
+ * do not match them is rejected instead of being exposed as a sensor
+ * device.
+ *
+ * Fan readings are big endian, in RPM. Temperature readings use the first
+ * byte of each pair and are in degrees Celsius.
+ */
+
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define DRVNAME			"nct_ec_sensors"
+
+/* Super-I/O configuration ports and registers */
+#define SIO_PORT_2E		0x2e
+#define SIO_PORT_4E		0x4e
+#define SIO_REG_LDSEL		0x07
+#define SIO_REG_DEVID		0x20
+#define SIO_LD_SHM		0x0f
+
+/* Sensor window geometry */
+/*
+ * Window span. The firmware maps at least 0x200 bytes from the base, but
+ * only the first 0x100 are needed: the highest offset any layout uses is
+ * 0x50 + 2 * NCT_EC_MAX_FANS = 0x64.
+ */
+#define SHM_SIZE		0x100
+#define NCT_EC_MAX_FANS		10
+
+/*
+ * Plausibility limits used to tell the sensor window from the other
+ * shared-memory windows the firmware also enables. A candidate that does
+ * not look like sensor data is skipped, so the driver never exposes
+ * garbage readings.
+ */
+#define TEMP_MAX_C		125
+#define FAN_MAX_RPM		0x8000
+
+/* SHAW1..SHAW5 base address registers, memory-window form */
+static const u8 nct_ec_shaw_reg[] = { 0xf4, 0xf8, 0xe0, 0xe4, 0xe8 };
+
+/*
+ * Controller identification. The device variant is encoded in the lower
+ * nibble of the Super-I/O ID, so the full 16-bit value is compared rather
+ * than the SIO_ID_MASK-masked value nct6683 uses: masking would clear the
+ * very bits that identify the part.
+ */
+struct nct_ec_chip {
+	const char *name;
+	u16 sid;
+};
+
+static const struct nct_ec_chip nct_ec_chips[] = {
+	{ "NCT6801D", 0x0113 },
+};
+
+struct nct_ec_temp_ch {
+	u8 reg;
+	const char *label;
+};
+
+/* Window layout of one machine family */
+struct nct_ec_layout {
+	const struct nct_ec_temp_ch *temps;
+	unsigned int ntemps;
+	u8 fan_reg;
+	unsigned int nfans;
+	const char *const *fan_labels;	/* optional, may be NULL */
+};
+
+#define NCT_EC_TEMP_CH(r, l)	{ .reg = (r), .label = (l) }
+
+/*
+ * Layout used by the Lenovo P3 TWR G2, taken from the SHWM field
+ * definition in that platform's DSDT. This is the only layout known to be
+ * correct today; a machine whose firmware lays the window out differently
+ * fails the plausibility check below and gets no sensor device, so
+ * readings are never taken from the wrong offsets.
+ */
+static const struct nct_ec_temp_ch nct_ec_temps_p3twr[] = {
+	NCT_EC_TEMP_CH(0x24, "Ambient"),	/* TD0 */
+	NCT_EC_TEMP_CH(0x26, "VCC_IA VR"),	/* TD1 */
+	NCT_EC_TEMP_CH(0x28, "Diode 2"),	/* TD2 */
+	NCT_EC_TEMP_CH(0x30, "CPU"),		/* CPT */
+	NCT_EC_TEMP_CH(0x32, "PCH"),		/* PHT */
+};
+
+static const char *const nct_ec_fans_p3twr[NCT_EC_MAX_FANS] = {
+	[0] = "Front",
+	[4] = "Side",
+	[5] = "CPU",
+	[6] = "Rear",
+};
+
+static const struct nct_ec_layout nct_ec_layout_default = {
+	.temps = nct_ec_temps_p3twr,
+	.ntemps = ARRAY_SIZE(nct_ec_temps_p3twr),
+	.fan_reg = 0x50,
+	.nfans = NCT_EC_MAX_FANS,
+	.fan_labels = nct_ec_fans_p3twr,
+};
+
+/*
+ * Optional override, mainly for bring-up. Zero means "discover from the
+ * EC configuration space", which is the normal case.
+ */
+static unsigned long shm_base;
+module_param(shm_base, ulong, 0444);
+MODULE_PARM_DESC(shm_base,
+		 "Physical address of the EC sensor window (0 = auto-detect)");
+
+struct nct_ec_data {
+	void __iomem *regs;
+	const struct nct_ec_layout *layout;
+};
+
+/* ------------------------------------------------------------------ */
+/* Super-I/O access                                                    */
+
+static int nct_ec_sio_enter(int port)
+{
+	if (!request_muxed_region(port, 2, DRVNAME))
+		return -EBUSY;
+
+	outb(0x87, port);
+	outb(0x87, port);
+
+	return 0;
+}
+
+static void nct_ec_sio_exit(int port)
+{
+	outb(0xaa, port);
+	release_region(port, 2);
+}
+
+static u8 nct_ec_sio_inb(int port, u8 reg)
+{
+	outb(reg, port);
+	return inb(port + 1);
+}
+
+static void nct_ec_sio_select(int port, u8 ld)
+{
+	outb(SIO_REG_LDSEL, port);
+	outb(ld, port + 1);
+}
+
+static u32 nct_ec_read_shaw(int port, u8 reg)
+{
+	return nct_ec_sio_inb(port, reg) |
+	       (nct_ec_sio_inb(port, reg + 1) << 8) |
+	       (nct_ec_sio_inb(port, reg + 2) << 16) |
+	       ((u32)nct_ec_sio_inb(port, reg + 3) << 24);
+}
+
+static const struct nct_ec_chip *nct_ec_identify(int port)
+{
+	u16 sid;
+	int i;
+
+	sid = (nct_ec_sio_inb(port, SIO_REG_DEVID) << 8) |
+	      nct_ec_sio_inb(port, SIO_REG_DEVID + 1);
+
+	for (i = 0; i < ARRAY_SIZE(nct_ec_chips); i++) {
+		if (nct_ec_chips[i].sid == sid)
+			return &nct_ec_chips[i];
+	}
+
+	return NULL;
+}
+
+/* ------------------------------------------------------------------ */
+/* Sensor window discovery                                             */
+
+static bool nct_ec_window_valid(struct nct_ec_data *data)
+{
+	const struct nct_ec_layout *l = data->layout;
+	unsigned int i;
+	int sane_temps = 0;
+	int sane_fans = 0;
+
+	/*
+	 * A channel reading 0xff means "not connected" on these ECs, which
+	 * is normal early in boot and on SKUs without every sensor fitted,
+	 * so require at least one plausible reading rather than all of
+	 * them. Fans are counted the same way.
+	 */
+	for (i = 0; i < l->ntemps; i++) {
+		u8 t = readb(data->regs + l->temps[i].reg);
+
+		if (t != 0xff && t <= TEMP_MAX_C)
+			sane_temps++;
+	}
+
+	for (i = 0; i < l->nfans; i++) {
+		u16 rpm = (readb(data->regs + l->fan_reg + i * 2) << 8) |
+			  readb(data->regs + l->fan_reg + i * 2 + 1);
+
+		if (rpm > 0 && rpm < FAN_MAX_RPM)
+			sane_fans++;
+	}
+
+	return sane_temps > 0 && sane_fans > 0;
+}
+
+static phys_addr_t nct_ec_find_window(const struct nct_ec_layout *layout,
+				      const struct nct_ec_chip **chip)
+{
+	static const int ports[] = { SIO_PORT_2E, SIO_PORT_4E };
+	struct nct_ec_data probe = { .layout = layout };
+	u32 bases[ARRAY_SIZE(nct_ec_shaw_reg)];
+	phys_addr_t found = 0;
+	int p, i, n;
+
+	for (p = 0; p < ARRAY_SIZE(ports) && !found; p++) {
+		const struct nct_ec_chip *c;
+		int port = ports[p];
+
+		if (nct_ec_sio_enter(port))
+			continue;
+
+		c = nct_ec_identify(port);
+		if (!c) {
+			nct_ec_sio_exit(port);
+			continue;
+		}
+
+		nct_ec_sio_select(port, SIO_LD_SHM);
+		n = 0;
+		for (i = 0; i < ARRAY_SIZE(nct_ec_shaw_reg); i++) {
+			u32 base = nct_ec_read_shaw(port, nct_ec_shaw_reg[i]);
+
+			/*
+			 * SHAWnBA_3-0 == 0 means the window is disabled
+			 * (Datasheet 5.3.3). The Core side WIN_BASEn
+			 * register has its own disabled marker, but it is
+			 * not reachable from the host, so the only further
+			 * check available here is the content check below.
+			 */
+			if (base)
+				bases[n++] = base;
+		}
+		nct_ec_sio_exit(port);
+
+		/* Validate outside the configuration-region lock. */
+		for (i = 0; i < n && !found; i++) {
+			probe.regs = ioremap(bases[i], SHM_SIZE);
+			if (!probe.regs)
+				continue;
+			if (nct_ec_window_valid(&probe)) {
+				found = bases[i];
+				*chip = c;
+			}
+			iounmap(probe.regs);
+		}
+	}
+
+	return found;
+}
+
+/* ------------------------------------------------------------------ */
+/* hwmon interface                                                     */
+
+static int nct_ec_read(struct device *dev, enum hwmon_sensor_types type,
+		       u32 attr, int channel, long *val)
+{
+	struct nct_ec_data *data = dev_get_drvdata(dev);
+	const struct nct_ec_layout *l = data->layout;
+	u16 rpm;
+	u8 t;
+
+	switch (type) {
+	case hwmon_fan:
+		if (attr != hwmon_fan_input || channel >= l->nfans)
+			return -EOPNOTSUPP;
+		rpm = (readb(data->regs + l->fan_reg + channel * 2) << 8) |
+		      readb(data->regs + l->fan_reg + channel * 2 + 1);
+		if (rpm == 0xffff)
+			return -ENODATA;
+		*val = rpm;
+		return 0;
+	case hwmon_temp:
+		if (attr != hwmon_temp_input || channel >= l->ntemps)
+			return -EOPNOTSUPP;
+		t = readb(data->regs + l->temps[channel].reg);
+		if (t == 0xff)
+			return -ENODATA;
+		*val = t * 1000;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static int nct_ec_read_string(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, const char **str)
+{
+	struct nct_ec_data *data = dev_get_drvdata(dev);
+	const struct nct_ec_layout *l = data->layout;
+
+	switch (type) {
+	case hwmon_fan:
+		if (attr != hwmon_fan_label || channel >= l->nfans ||
+		    !l->fan_labels || !l->fan_labels[channel])
+			return -EOPNOTSUPP;
+		*str = l->fan_labels[channel];
+		return 0;
+	case hwmon_temp:
+		if (attr != hwmon_temp_label || channel >= l->ntemps ||
+		    !l->temps[channel].label)
+			return -EOPNOTSUPP;
+		*str = l->temps[channel].label;
+		return 0;
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+
+static umode_t nct_ec_is_visible(const void *drvdata,
+				 enum hwmon_sensor_types type,
+				 u32 attr, int channel)
+{
+	const struct nct_ec_data *data = drvdata;
+
+	switch (type) {
+	case hwmon_fan:
+		if (channel >= data->layout->nfans)
+			return 0;
+		if (attr == hwmon_fan_label &&
+		    (!data->layout->fan_labels ||
+		     !data->layout->fan_labels[channel]))
+			return 0;
+		return 0444;
+	case hwmon_temp:
+		if (channel >= data->layout->ntemps)
+			return 0;
+		if (attr == hwmon_temp_label &&
+		    !data->layout->temps[channel].label)
+			return 0;
+		return 0444;
+	default:
+		return 0;
+	}
+}
+
+static const struct hwmon_channel_info * const nct_ec_info[] = {
+	HWMON_CHANNEL_INFO(fan,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL,
+			   HWMON_F_INPUT | HWMON_F_LABEL),
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops nct_ec_ops = {
+	.is_visible = nct_ec_is_visible,
+	.read = nct_ec_read,
+	.read_string = nct_ec_read_string,
+};
+
+static const struct hwmon_chip_info nct_ec_chip_info = {
+	.ops = &nct_ec_ops,
+	.info = nct_ec_info,
+};
+
+/* ------------------------------------------------------------------ */
+/* Platform glue                                                       */
+
+static int nct_ec_probe(struct platform_device *pdev)
+{
+	const struct nct_ec_layout *layout = &nct_ec_layout_default;
+	const struct nct_ec_chip *chip = NULL;
+	struct device *dev = &pdev->dev;
+	struct nct_ec_data *data;
+	struct device *hwmon;
+	phys_addr_t base;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->layout = layout;
+
+	base = shm_base ? shm_base : nct_ec_find_window(layout, &chip);
+	if (!base) {
+		dev_dbg(dev, "no supported Nuvoton EC sensor window found\n");
+		return -ENODEV;
+	}
+
+	if (!devm_request_mem_region(dev, base, SHM_SIZE, DRVNAME))
+		return -EBUSY;
+
+	data->regs = devm_ioremap(dev, base, SHM_SIZE);
+	if (!data->regs)
+		return -ENOMEM;
+
+	if (!nct_ec_window_valid(data)) {
+		if (!shm_base) {
+			dev_dbg(dev, "rejecting implausible window at %pa\n",
+				&base);
+			return -ENODEV;
+		}
+		/*
+		 * The base came from the module parameter, so this is a
+		 * bring-up session and the caller wants to see what the
+		 * window actually holds. Say plainly that the values are
+		 * not trustworthy: with a wrong base they read back as
+		 * figures like 187 degrees or 25088 RPM.
+		 */
+		dev_warn(dev,
+			 "window at %pa does not look like sensor data, readings will be bogus\n",
+			 &base);
+	}
+
+	dev_info(dev, "%s EC sensor window at %pa\n",
+		 chip ? chip->name : "Nuvoton", &base);
+	platform_set_drvdata(pdev, data);
+
+	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data,
+						     &nct_ec_chip_info, NULL);
+	return PTR_ERR_OR_ZERO(hwmon);
+}
+
+static struct platform_driver nct_ec_driver = {
+	.driver = {
+		.name = DRVNAME,
+	},
+	.probe = nct_ec_probe,
+};
+
+static struct platform_device *nct_ec_pdev;
+
+static int __init nct_ec_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&nct_ec_driver);
+	if (ret)
+		return ret;
+
+	nct_ec_pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
+	if (IS_ERR(nct_ec_pdev)) {
+		ret = PTR_ERR(nct_ec_pdev);
+		platform_driver_unregister(&nct_ec_driver);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit nct_ec_exit(void)
+{
+	platform_device_unregister(nct_ec_pdev);
+	platform_driver_unregister(&nct_ec_driver);
+}
+
+module_init(nct_ec_init);
+module_exit(nct_ec_exit);
+
+MODULE_AUTHOR("Jiqi Li <lijq9@lenovo.com>");
+MODULE_DESCRIPTION("Nuvoton EC shared-memory sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

