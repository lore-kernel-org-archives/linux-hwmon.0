Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.152.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565927;
	b=epVBmVgaA8CQIr7rYYaLIcrRmY6Ldu6Rtmp+RnjCd12uAuFFKsOP8ZR+wb/+HHCF9n3N
	 v2nmnNi0ndBcdcd7lVn6wikZcAn6kODokE7gGXVnlNpPBX6Y+flraK6E8eh3JBOr9aUie
	 i8V8fN+Y+ULlC9f14Nl+7+g2GVc2K0yH1yV+B/2ZInMKPMb+jildG2ycg7I5YwNyeWFuc
	 yakpT/whQw5f19hBWrms90Zv4qAW1a7Ea/vJMFdsGx0iuYvSSGnoM0UKIK9L07t03Ds7s
	 YtAU9YTaoArXP1CfOspbwI8MFiIlIWNX+J/7EA9a3MaUMrckSX15BPhVZpK6tyilgJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t9Slgipl6LOarf27IarKdPHfnOpf32bbwzgZDLSYh+U=;
	b=wni32eB4coGOKmFb9JrAIOyJfx4WrCRBxagZwa42RwPxjJnnFtqAGbQ2n9rnBNVXUTjM
	 a6Z4sWdXGvZUbSahZFqBp+F9c5j05xXgfLDLnkHlg+5iT3ET1xlkuBpsWG1wZQo8eeKEy
	 uza8WgEPy1oVeU//7ADmHp00NZLz0d9J0qPWjiOlsPHpir4duWDT61vQGNzZWbF+wAHTS
	 kzJsymT04EgTrQ6HGxaYua5RNqG9BeGmPJE5AL4UMAjHPpqmqZC6c/8FZSXHQhgsvgm5W
	 VusBXDYiefUiUZJGS9GuSx+qsG0WKqm0Bjry7JBiXSRMWBTZEt7bgySOGtjD95DOQTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=AAfoLGvf;
	arc=none smtp.remote-ip=148.163.152.46
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28F0606A321
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 10:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B28F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=AAfoLGvf
Received: from pps.filterd (m0355091.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8X5dw498652;
	Fri, 13 Nov 2026 10:31:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=DKIM202306; bh=t9Slgipl6L
	Oarf27IarKdPHfnOpf32bbwzgZDLSYh+U=; b=AAfoLGvfkwbe1q5p18EN12ysE4
	qNJQYuG7echAvfUyhFPI2p7ziP2o7NpYfG2MikNVguF6bE87uDvpEDDy4iCYM4o4
	sYTmz61C7E5wxf7BsrD1EC19hlqe7wMPtS5dKQCauq4feVGyCK/ou3hXYrRBYDRU
	RF+Y0pcgC2mrteLBEP3OWonTbFbWzxMmLqLNQDsff8ULq66Mp7AzPd7Xs/q8V6M4
	fBoO9NFTRgq6Pa3HoLNeqD0pdwYh7jxozKfohxnLhOSU8OQj5eERSFqsKFUSWeDh
	BPFJCZPGak4F5uvxLzelAOJvS9HmMd+RX7Y5mtycM/E70TIRQVGSKZSoWUtA==
Received: from hkglppfpool2.lenovo.com ([103.30.235.219])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4hvqp9mxq9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:31:53 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool2.lenovo.com (Postfix) with ESMTPS id 4jQtc06MNXz232jjH;
	Fri, 13 Nov 2026 10:22:23 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4jQtgs2mk4z18W8nZ;
	Fri, 13 Nov 2026 10:25:45 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, jdelvare@suse.com, lijq9@lenovo.com
Subject: [PATCH v2 1/1] hwmon: Add driver for the NCT6801D EC sensor window
Date: Fri, 13 Nov 2026 18:25:44 +0800
Message-ID: <20261113102544.893158-2-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113102544.893158-1-lijq9@lenovo.com>
References: <20261113102544.893158-1-lijq9@lenovo.com>
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
X-Authority-Analysis: v=2.4 cv=LdqpeTfi c=1 sm=1 tr=0 ts=6af6e719 cx=c_pps
 a=Z3w50ro9cqVPZ6U0/1IFzw==:117 a=Z3w50ro9cqVPZ6U0/1IFzw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=faLMhqsB0ZTpFNi-tw5Q:22 a=8k6WQxmsAAAA:8 a=l9XVmoBwjxxRjY9P4WwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX8b0TnzayVGfz
 AUpOM85sC/aa5rJkb5LnG+8lkAaF9OUJpFoJaaO5mg/2y6M4/8Y7l1YFvaFdZSOTAN31Rrj2qE3
 5N7iVgGofTwjwXjK9PMCwFGgTW8y8V447qLwzKds7IgQcmnM2av0puCNTmo3ozhfQOh6SSQzhxW
 Ly9dGoOZwpp5nP8TqUw/tH4NbkOBBbe21Sob7913/GNpTCZKiq1T8ElP9K5djyIeHZ36O1+OkEO
 xxxOnSM0KAa290/J7Ju7yb3CAp+HPg52CpiYx6WUfcRaGUNXEeMLXOIfKHpiYNBuATZvYqS7i29
 XRr/p/cgvhLywaohcSEYlXvtxAxegkDyBbPgrvv2p3iJG4dS3F/gwvFtIFnB9eaJMKv43q48YTW
 KdfH79zN71DM6hdIhrFiYY39Kz92qSXryrqG3leS8xEM7QvYnZTfpBlPI/CGl5MDMPHv037r4u6
 oavYzSexkQvoXK/4zFg==
X-Proofpoint-ORIG-GUID: B1WSTkFY4z3VKW1R2AfNZ1BV0XIvRkab
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX6axwd8uoaHiN
 U7gwiK4SGNdzwILg1JRsryO3/3u84rxIugjy5RbQxJNDOtnpf+Sb8SF7f+yodPA8B+1JOPpuSEh
 hPV2nt0nWdKWhcrqcL+NXXEnWhwCh6c=
X-Proofpoint-GUID: B1WSTkFY4z3VKW1R2AfNZ1BV0XIvRkab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

The Nuvoton NCT6801D embedded controller does not expose a hardware
monitor logical device in its Super-I/O configuration space: LDN 0Bh is
the ATXPGD/BEEP/DDR4 block, so the eSIO-style register window that
nct6683 relies on does not exist on this part.

Fan and temperature values are instead published by the EC firmware in
one of the shared-memory windows of the SHM logical device (LDN 0Fh),
which the platform firmware maps as

	OperationRegion (SHWM, SystemMemory, <base>, 0xFF)

The window base is not hardcoded: it is read back from the SHAW1..SHAW5
configuration registers (indices F7h-F4h, FBh-F8h, E3h-E0h, E7h-E4h and
EBh-E8h of LDN 0Fh), as documented in the Datasheet. Several windows are
normally enabled, so each candidate is checked for plausible sensor data
before it is accepted.

The layout inside the window is defined by the platform firmware rather
than by the controller: the Datasheet specifies the window mechanism but
no fan or temperature register block inside it. The offsets used here are
the ones the Lenovo P3 TWR firmware generates, so the layout is selected
by DMI rather than by the controller ID:

  0x24/0x26/0x28  TD0..TD2 thermal diodes
  0x30            CPU temperature
  0x32            PCH temperature
  0x50            10 fan tachometers, 2 bytes each, big endian RPM

The window is read directly. The DSDT also defines WQD1..WQD5, which read
the same offsets under the MWMI mutex, but they are gated by FAAS bit 3
in the WMIM region. FAAS is written by the BIOS and currently clear. The
driver reads it at probe time and refuses to bind if ACPI has the
interface enabled, so the two access paths do not run concurrently while
the flag stays clear.

Verified on a Lenovo P3 TWR: the driver locates the window (0xfe500200)
without any module parameter. Under full load the CPU fan goes from 808
to 2920 RPM and the CPU temperature from 32 to 100 C. At the same moment
ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C, x86_pkg_temp 100.00 C and
coretemp 101.0 C, i.e. four independent sources agree within 1 C.
Readings return to idle values when the load is removed.

Signed-off-by: Jiqi Li <lijq9@lenovo.com>
---
 drivers/hwmon/Kconfig              |  18 +
 drivers/hwmon/Makefile             |   1 +
 drivers/hwmon/lenovo-shm-sensors.c | 547 +++++++++++++++++++++++++++++
 3 files changed, 566 insertions(+)
 create mode 100644 drivers/hwmon/lenovo-shm-sensors.c

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 18c682e1a475..cebac07f67d0 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -1056,6 +1056,24 @@ config SENSORS_LENOVO_EC
           This driver can also be built as a module. If so, the module
           will be called lenovo_ec_sensors.
 
+config SENSORS_LENOVO_SHM
+	tristate "Sensor reader for Lenovo EC sensor windows"
+	depends on ACPI
+	depends on DMI
+	depends on HAS_IOPORT
+	depends on !PPC
+	help
+	  If you say yes here you get support for fan and temperature
+	  sensors that Lenovo system firmware publishes in an EC
+	  shared-memory window. The driver only reads the window that the
+	  firmware has set up.
+
+	  A machine whose firmware lays the window out differently reports
+	  no sensors rather than wrong readings.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called lenovo-shm-sensors.
+
 config SENSORS_LINEAGE
 	tristate "Lineage Compact Power Line Power Entry Module"
 	depends on I2C
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index d4c345ed7261..acd80c95b952 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -122,6 +122,7 @@ obj-$(CONFIG_SENSORS_KFAN)	+= kfan.o
 obj-$(CONFIG_SENSORS_LAN966X)	+= lan966x-hwmon.o
 obj-$(CONFIG_SENSORS_LATTEPANDA_SIGMA_EC) += lattepanda-sigma-ec.o
 obj-$(CONFIG_SENSORS_LENOVO_EC)	+= lenovo-ec-sensors.o
+obj-$(CONFIG_SENSORS_LENOVO_SHM)	+= lenovo-shm-sensors.o
 obj-$(CONFIG_SENSORS_LINEAGE)	+= lineage-pem.o
 obj-$(CONFIG_SENSORS_LOCHNAGAR)	+= lochnagar-hwmon.o
 obj-$(CONFIG_SENSORS_LM63)	+= lm63.o
diff --git a/drivers/hwmon/lenovo-shm-sensors.c b/drivers/hwmon/lenovo-shm-sensors.c
new file mode 100644
index 000000000000..0aaf27eade57
--- /dev/null
+++ b/drivers/hwmon/lenovo-shm-sensors.c
@@ -0,0 +1,547 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * lenovo-shm-sensors - hwmon driver for Lenovo EC sensor windows
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
+ * therefore lay the same window out differently, so a layout is tied to a
+ * system identified by DMI and never selected by the controller ID. A
+ * window whose contents do not match the selected layout is rejected
+ * instead of being exposed as a sensor device.
+ *
+ * Fan readings are big endian, in RPM. Temperature readings use the first
+ * byte of each pair and are in degrees Celsius.
+ */
+
+#include <linux/acpi.h>
+#include <linux/dmi.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+#define DRVNAME			"lenovo_shm_sensors"
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
+ * 0x50 + 2 * LENOVO_SHM_MAX_FANS = 0x64.
+ */
+#define SHM_SIZE		0x100
+#define LENOVO_SHM_MAX_FANS		10
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
+static const u8 lenovo_shm_shaw_reg[] = { 0xf4, 0xf8, 0xe0, 0xe4, 0xe8 };
+
+/*
+ * Controller identification. The device variant is encoded in the lower
+ * nibble of the Super-I/O ID, so the full 16-bit value is compared rather
+ * than the SIO_ID_MASK-masked value nct6683 uses: masking would clear the
+ * very bits that identify the part.
+ */
+struct lenovo_shm_chip {
+	const char *name;
+	u16 sid;
+};
+
+static const struct lenovo_shm_chip lenovo_shm_chips[] = {
+	{ "NCT6801D", 0x0113 },
+};
+
+struct lenovo_shm_temp_ch {
+	u8 reg;
+	const char *label;
+};
+
+/* Window layout of one machine family */
+struct lenovo_shm_layout {
+	const struct lenovo_shm_temp_ch *temps;
+	unsigned int ntemps;
+	u8 fan_reg;
+	unsigned int nfans;
+	const char *const *fan_labels;	/* optional, may be NULL */
+};
+
+#define LENOVO_SHM_TEMP_CH(r, l)	{ .reg = (r), .label = (l) }
+
+/*
+ * Layout used by the Lenovo P3 TWR G2, taken from the SHWM field
+ * definition in that platform's DSDT. This is the only layout known to be
+ * correct today; a machine whose firmware lays the window out differently
+ * fails the plausibility check below and gets no sensor device, so
+ * readings are never taken from the wrong offsets.
+ */
+static const struct lenovo_shm_temp_ch lenovo_shm_temps_p3twr[] = {
+	LENOVO_SHM_TEMP_CH(0x24, "Ambient"),	/* TD0 */
+	LENOVO_SHM_TEMP_CH(0x26, "VCC_IA VR"),	/* TD1 */
+	LENOVO_SHM_TEMP_CH(0x28, "Diode 2"),	/* TD2 */
+	LENOVO_SHM_TEMP_CH(0x30, "CPU"),		/* CPT */
+	LENOVO_SHM_TEMP_CH(0x32, "PCH"),		/* PHT */
+};
+
+static const char *const lenovo_shm_fans_p3twr[LENOVO_SHM_MAX_FANS] = {
+	[0] = "Front",
+	[4] = "Side",
+	[5] = "CPU",
+	[6] = "Rear",
+};
+
+enum lenovo_shm_system {
+	LENOVO_SHM_P3TWR,
+};
+
+static const struct lenovo_shm_layout lenovo_shm_layout_p3twr = {
+	.temps = lenovo_shm_temps_p3twr,
+	.ntemps = ARRAY_SIZE(lenovo_shm_temps_p3twr),
+	.fan_reg = 0x50,
+	.nfans = LENOVO_SHM_MAX_FANS,
+	.fan_labels = lenovo_shm_fans_p3twr,
+};
+
+static const struct lenovo_shm_layout * const lenovo_shm_layouts[] = {
+	[LENOVO_SHM_P3TWR] = &lenovo_shm_layout_p3twr,
+};
+
+/*
+ * The window layout comes from the platform firmware, so the system has
+ * to be identified before the offsets can be trusted.
+ */
+static const struct dmi_system_id lenovo_shm_dmi_table[] = {
+	{
+		.ident = "LENOVO_P3TWR",
+		.driver_data = (void *)(long)LENOVO_SHM_P3TWR,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_BOARD_NAME, "106F"),
+		},
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(dmi, lenovo_shm_dmi_table);
+
+struct lenovo_shm_data {
+	void __iomem *regs;
+	const struct lenovo_shm_layout *layout;
+};
+
+/* ------------------------------------------------------------------ */
+/* Super-I/O access                                                    */
+
+static int lenovo_shm_sio_enter(int port)
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
+static void lenovo_shm_sio_exit(int port)
+{
+	outb(0xaa, port);
+	release_region(port, 2);
+}
+
+static u8 lenovo_shm_sio_inb(int port, u8 reg)
+{
+	outb(reg, port);
+	return inb(port + 1);
+}
+
+static void lenovo_shm_sio_select(int port, u8 ld)
+{
+	outb(SIO_REG_LDSEL, port);
+	outb(ld, port + 1);
+}
+
+static u32 lenovo_shm_read_shaw(int port, u8 reg)
+{
+	return lenovo_shm_sio_inb(port, reg) |
+	       (lenovo_shm_sio_inb(port, reg + 1) << 8) |
+	       (lenovo_shm_sio_inb(port, reg + 2) << 16) |
+	       ((u32)lenovo_shm_sio_inb(port, reg + 3) << 24);
+}
+
+static const struct lenovo_shm_chip *lenovo_shm_identify(int port)
+{
+	u16 sid;
+	int i;
+
+	sid = (lenovo_shm_sio_inb(port, SIO_REG_DEVID) << 8) |
+	      lenovo_shm_sio_inb(port, SIO_REG_DEVID + 1);
+
+	for (i = 0; i < ARRAY_SIZE(lenovo_shm_chips); i++) {
+		if (lenovo_shm_chips[i].sid == sid)
+			return &lenovo_shm_chips[i];
+	}
+
+	return NULL;
+}
+
+/* ------------------------------------------------------------------ */
+/* Sensor window discovery                                             */
+
+static bool lenovo_shm_window_valid(struct lenovo_shm_data *data)
+{
+	const struct lenovo_shm_layout *l = data->layout;
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
+static phys_addr_t lenovo_shm_find_window(const struct lenovo_shm_layout *layout,
+					  const struct lenovo_shm_chip **chip)
+{
+	static const int ports[] = { SIO_PORT_2E, SIO_PORT_4E };
+	struct lenovo_shm_data probe = { .layout = layout };
+	u32 bases[ARRAY_SIZE(lenovo_shm_shaw_reg)];
+	phys_addr_t found = 0;
+	int p, i, n;
+
+	for (p = 0; p < ARRAY_SIZE(ports) && !found; p++) {
+		const struct lenovo_shm_chip *c;
+		int port = ports[p];
+
+		if (lenovo_shm_sio_enter(port))
+			continue;
+
+		/*
+		 * The chip ID is only used for the log message. DMI has
+		 * already selected the layout and the window content check
+		 * below is what guards against a wrong mapping, so an
+		 * unexpected ID is not a reason to give up here.
+		 */
+		c = lenovo_shm_identify(port);
+
+		lenovo_shm_sio_select(port, SIO_LD_SHM);
+		n = 0;
+		for (i = 0; i < ARRAY_SIZE(lenovo_shm_shaw_reg); i++) {
+			u32 base = lenovo_shm_read_shaw(port, lenovo_shm_shaw_reg[i]);
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
+		lenovo_shm_sio_exit(port);
+
+		/* Validate outside the configuration-region lock. */
+		for (i = 0; i < n && !found; i++) {
+			/*
+			 * Claim the window only for the content check and drop
+			 * it again right after; probe takes a devm-managed claim
+			 * for the lifetime of the device.
+			 */
+			if (!request_mem_region(bases[i], SHM_SIZE, DRVNAME))
+				continue;
+			probe.regs = ioremap(bases[i], SHM_SIZE);
+			if (probe.regs && lenovo_shm_window_valid(&probe)) {
+				found = bases[i];
+				*chip = c;
+			}
+			if (probe.regs)
+				iounmap(probe.regs);
+			release_mem_region(bases[i], SHM_SIZE);
+		}
+	}
+
+	return found;
+}
+
+/* ------------------------------------------------------------------ */
+/* hwmon interface                                                     */
+
+static int lenovo_shm_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct lenovo_shm_data *data = dev_get_drvdata(dev);
+	const struct lenovo_shm_layout *l = data->layout;
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
+static int lenovo_shm_read_string(struct device *dev, enum hwmon_sensor_types type,
+				  u32 attr, int channel, const char **str)
+{
+	struct lenovo_shm_data *data = dev_get_drvdata(dev);
+	const struct lenovo_shm_layout *l = data->layout;
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
+static umode_t lenovo_shm_is_visible(const void *drvdata,
+				     enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	const struct lenovo_shm_data *data = drvdata;
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
+static const struct hwmon_channel_info * const lenovo_shm_info[] = {
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
+static const struct hwmon_ops lenovo_shm_ops = {
+	.is_visible = lenovo_shm_is_visible,
+	.read = lenovo_shm_read,
+	.read_string = lenovo_shm_read_string,
+};
+
+static const struct hwmon_chip_info lenovo_shm_chip_info = {
+	.ops = &lenovo_shm_ops,
+	.info = lenovo_shm_info,
+};
+
+/* ------------------------------------------------------------------ */
+/* Platform glue                                                       */
+
+static int lenovo_shm_probe(struct platform_device *pdev)
+{
+	const struct dmi_system_id *dmi_id;
+	const struct lenovo_shm_layout *layout;
+	const struct lenovo_shm_chip *chip = NULL;
+	struct device *dev = &pdev->dev;
+	struct lenovo_shm_data *data;
+	struct device *hwmon;
+	phys_addr_t base;
+	unsigned long long faas;
+	acpi_status status;
+
+	dmi_id = dmi_first_match(lenovo_shm_dmi_table);
+	if (!dmi_id)
+		return -ENODEV;
+
+	layout = lenovo_shm_layouts[(long)dmi_id->driver_data];
+	if (!layout)
+		return -ENODEV;
+
+	/*
+	 * The DSDT defines WMI1.WQD1..WQD5, which read this window under
+	 * the MWMI mutex. They are gated by FAAS bit 3, which the BIOS
+	 * controls. If that bit is set ACPI is reading the same bytes, so
+	 * stay out; if the flag cannot be read at all, do not assume it is
+	 * safe either.
+	 */
+	faas = 0;
+	status = acpi_evaluate_integer(NULL, "\\WMI1.FAAS", NULL, &faas);
+	if (ACPI_FAILURE(status) || (faas & BIT(3))) {
+		dev_dbg(dev, "ACPI owns the EC sensor interface (FAAS %s%#llx)\n",
+			ACPI_FAILURE(status) ? "unreadable " : "", faas);
+		return -EBUSY;
+	}
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->layout = layout;
+
+	base = lenovo_shm_find_window(layout, &chip);
+	if (!base) {
+		dev_dbg(dev, "no supported EC sensor window found\n");
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
+	if (!lenovo_shm_window_valid(data)) {
+		dev_dbg(dev, "rejecting implausible window at %pa\n", &base);
+		return -ENODEV;
+	}
+
+	dev_info(dev, "%s EC sensor window at %pa\n",
+		 chip ? chip->name : "Nuvoton", &base);
+	platform_set_drvdata(pdev, data);
+
+	hwmon = devm_hwmon_device_register_with_info(dev, DRVNAME, data,
+						     &lenovo_shm_chip_info, NULL);
+	return PTR_ERR_OR_ZERO(hwmon);
+}
+
+static struct platform_driver lenovo_shm_driver = {
+	.driver = {
+		.name = DRVNAME,
+	},
+	.probe = lenovo_shm_probe,
+};
+
+static struct platform_device *lenovo_shm_pdev;
+
+static int __init lenovo_shm_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&lenovo_shm_driver);
+	if (ret)
+		return ret;
+
+	lenovo_shm_pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
+	if (IS_ERR(lenovo_shm_pdev)) {
+		ret = PTR_ERR(lenovo_shm_pdev);
+		platform_driver_unregister(&lenovo_shm_driver);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void __exit lenovo_shm_exit(void)
+{
+	platform_device_unregister(lenovo_shm_pdev);
+	platform_driver_unregister(&lenovo_shm_driver);
+}
+
+module_init(lenovo_shm_init);
+module_exit(lenovo_shm_exit);
+
+MODULE_AUTHOR("Jiqi Li <lijq9@lenovo.com>");
+MODULE_DESCRIPTION("Lenovo EC shared-memory sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

