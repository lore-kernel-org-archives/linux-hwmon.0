Received: from doubleyoutf.uk (doubleyoutf.uk [109.228.47.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696DE18BBBA
	for <linux-hwmon@vger.kernel.org>; Sat,  2 Nov 2024 18:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.228.47.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730571526; cv=none; b=Ncte6dSc29kspqIXKSE1UQkGv6SWjsRKiytuP+VI4YELf+rJWrbVkMqakQFg6xQKb0gAj+4l5Mo1FNYF30H2EU+7LYGqvSqekxHQjPQv76TRJ+FNmB2AKkN3iX2Hus0RbQLNyPU6nQVYGjWPZGxur6dd+vmW1sG1zY/9lTti9eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730571526; c=relaxed/simple;
	bh=rWX0zJSsvDtJXiEHmJwigVLfHQ6uoRDnGgKjlxewLgw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=dhr3dPWLVLeQijU6i9S+dm3aJoKr158kSfsILUk6xUu6W7rHn3Vhp4sUyMSfQIo/Y4X4KPUByKAELAN3PUvtoQsfaFXvdtQ9qjJFkB/fTwQXDCwETscUjuNxsKAj6vbPKI2imO1eXuUH7OhdJacJHZvdivMDlXq8z0hBMLOSXuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khalifa.ws; spf=pass smtp.mailfrom=khalifa.ws; dkim=pass (1024-bit key) header.d=khalifa.ws header.i=@khalifa.ws header.b=fdH8u9AT; arc=none smtp.client-ip=109.228.47.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khalifa.ws
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khalifa.ws
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khalifa.ws header.i=@khalifa.ws header.b="fdH8u9AT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=khalifa.ws;
	s=rsasel; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
	Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Y6ftJjxC3qIRNAGPyeOxTtMbLpkBAGR8BJme047aBYM=; b=fdH8u9ATVKWV9PErYQc/+6RCwJ
	IM+cp5iSznovJ0Vh/C/KBby6NPrJngMn+eI2Q0KrV38zJzFS4/hqjpmzYWF/YtIAsholTrjP+wikL
	hnoEfVU24OYmKEDSaRJx6NBoKljJujrTzfc9gygw9N1CVnGb164T6brOYbQag85ntNos=;
Received: from [2a00:23cc:d220:b33::b56] (helo=orangina.lan)
	by doubleyoutf.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ahmad@khalifa.ws>)
	id 1t7IDV-00Bo26-HG; Sat, 02 Nov 2024 17:47:17 +0000
From: Ahmad Khalifa <ahmad@khalifa.ws>
To: Guenter Roeck <linux@roeck-us.net>,
	linux-hwmon@vger.kernel.org
Cc: Ahmad Khalifa <ahmad@khalifa.ws>
Subject: [RFC PATCH] hwmon: Add trivial userspace-configured monitor
Date: Sat,  2 Nov 2024 17:46:39 +0000
Message-Id: <20241102174639.102724-1-ahmad@khalifa.ws>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a userspace-configured driver that can receive IOCTRL
commands to monitor devices over IO or ACPI access.

- registers a miscdevice at /dev/trim-control
- awaits attach/detach ioctrl commands with device details
- reads sensor values from: 1. IO select registers, 2. IO direct
  registers or 3. ACPI method calls (single arg)
- applies basic conversions: multiply, divide, dividend divisor

Useful when there is prior knowledge of the device or when
experimenting with newer devices using old device info.
Another use is for debugging other drivers when raw reg values
need to be compared with what the full driver prints out.

Drawbacks: Not aware of any device. It's readonly. Readonly does
not make it safe as it still writes for address select and bank
select. Needs an ioctrl and cannot be modloaded through config
or modalias

trimctrl.c (not part of the driver) has details on invocation and
sample invocations for it8868, gigabyte acpi and nct6799 devices.

To test it, if you know your device registers:
$ make
$ insmod trivialmon.ko
$ ./trimctrl --help

In a prior version, this was written with modparams for a single
device, which were easier to load, but it was single device.
Conversion to ioctrl inspired by loopdevice and similar drivers.

For the rfc, it's packaged as a standalone module and it has a lot
of pr_info() for debugging and there is no home for trimctrl.

Signed-off-by: Ahmad Khalifa <ahmad@khalifa.ws>
---
 Makefile     |  68 +++++
 trimctrl.c   | 523 +++++++++++++++++++++++++++++++
 trivialmon.c | 844 +++++++++++++++++++++++++++++++++++++++++++++++++++
 trivialmon.h |  78 +++++
 4 files changed, 1513 insertions(+)
 create mode 100644 Makefile
 create mode 100644 trimctrl.c
 create mode 100644 trivialmon.c
 create mode 100644 trivialmon.h

diff --git a/Makefile b/Makefile
new file mode 100644
index 0000000..954c794
--- /dev/null
+++ b/Makefile
@@ -0,0 +1,68 @@
+# Driver details
+DRIVER 		:= trivialmon
+MOD_SUBDIR 	:= misc
+
+ifndef TARGET
+TARGET 		:= $(shell uname -r)
+endif
+
+KERNEL_MODULES	:= /lib/modules/$(TARGET)
+KERNEL_BUILD	:= $(KERNEL_MODULES)/build
+SYSTEM_MAP	:= $(KERNEL_BUILD)/System.map
+MODDESTDIR	:= $(KERNEL_MODULES)/$(MOD_SUBDIR)
+
+ifneq (, $(shell grep "CONFIG_MODULE_SIG=y" $(KERNEL_BUILD)/.config))
+	MOD_SIGN := y
+	MOD_SIGN_HASH := $(shell grep "CONFIG_MODULE_SIG_HASH=" $(KERNEL_BUILD)/.config | sed 's/^[a-zA-Z_ =]*//g' | sed 's/" *//g')
+	MOD_SIGN_KEY := $(shell grep "CONFIG_MODULE_SIG_KEY=" $(KERNEL_BUILD)/.config | sed 's/^[a-zA-Z_ =]*//g' | sed 's/" *//g')
+	MOD_SIGN_X509 := $(KERNEL_BUILD)/certs/signing_key.x509
+endif
+
+obj-m	:= $(patsubst %,%.o,$(DRIVER))
+obj-ko	:= $(patsubst %,%.ko,$(DRIVER))
+
+
+all: modules trimctrl
+
+modules:
+	@$(MAKE) -C $(KERNEL_BUILD) M=$(CURDIR) $@
+
+trimctrl: trimctrl.o
+
+clean:
+	@$(MAKE) -C $(KERNEL_BUILD) M=$(CURDIR) $@
+	@rm -fv trimctrl
+
+install: info modules_install modules_sign modules_depmod
+
+modules_install:
+	@mkdir -pv $(MODDESTDIR)
+	@cp -v $(DRIVER).ko $(MODDESTDIR)/
+
+modules_sign:
+ifeq ($(MOD_SIGN), y)
+	@echo "Signing module" $(MODDESTDIR)/$(DRIVER).ko
+	@$(KERNEL_BUILD)/scripts/sign-file $(MOD_SIGN_HASH) $(MOD_SIGN_KEY) $(MOD_SIGN_X509) $(MODDESTDIR)/$(DRIVER).ko
+endif
+
+modules_depmod:
+	depmod -a -F $(SYSTEM_MAP) $(TARGET)
+
+modules_remove:
+	@rm -fv $(MODDESTDIR)/$(DRIVER).ko
+
+info:
+	@echo "Driver:" $(DRIVER)
+	@echo "Target:" $(TARGET)
+	@echo "Modules Dir:" $(KERNEL_MODULES)
+	@echo "Module Dest Dir:" $(MODDESTDIR)
+	@echo "Build Dir:  " $(KERNEL_BUILD)
+	@echo "             ("$(shell readlink -f $(KERNEL_BUILD) )")"
+	@echo "System Map: " $(SYSTEM_MAP)
+	@echo "             ("$(shell readlink -f $(SYSTEM_MAP) )")"
+	@echo "Module Sign:" $(MOD_SIGN)
+	@echo "Module Hash:" $(MOD_SIGN_HASH)
+	@echo "Module Key: " $(MOD_SIGN_KEY)
+	@echo "Module X509:" $(MOD_SIGN_X509)
+
+.PHONY: all install modules modules_install modules_sign clean
diff --git a/trimctrl.c b/trimctrl.c
new file mode 100644
index 0000000..32bcb8e
--- /dev/null
+++ b/trimctrl.c
@@ -0,0 +1,523 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Call Trivial Monitor ioctl attach/detach from args or sample devices
+ *
+ * $ ./trimctrl -h
+ *
+ * # first load the trivialmon module
+ * $ insmod trivialmon
+ *
+ * # Attach a sample device
+ * $ ./trimctrl -t1
+ *
+ * # Attach an ioselect device with a single sensor
+ * # device lives at io address 0xa45 and expect chip id 0x90 at register 0x58
+ * $ ./trimctrl -m 0x1 -b 0xa45 -c 0x90 -rc 0x58 -st t -sr 0x2b -sl "TCPU"
+ * $ sensors
+ *   trivialmon.1.auto-isa-0001
+ *   Adapter: ISA adapter
+ *   TCPU:         +30.0°C
+ *
+ * # Or the unsafe version which skips IO resource conflicts:
+ * $ ./trimctrl -m 0x1 -u -b 0xa45 -c 0x90 -rc 0x58 -st t -sr 0x2b -sl "TCPU"
+ *
+ * # Attach an ioselect device with several sensors and conversions
+ * $ ./trimctrl -m 0x1 -b 0xa45 -c 0x90 -rc 0x58 \
+ *     -st t -sr 0x2b -sl "TCPU" \
+ *     -st t -sr 0x29 -sl "TSYS" \
+ *     -st f -sr 0x0d -srh 0x18 -sl "FCPU" -scm 2 -scv 1350000 \
+ *     -st f -sr 0x0e -srh 0x19 -scm 2 -scv 1350000 \
+ *     -st i -sr 0x20 -sl "VCore" -scm 12 \
+ *     -st i -sr 0x21 -sl "3V" -scm 24
+ *
+ * # Attach the same device above through an ACPI device and methods
+ * $ ./trimctrl -m 0x3 -ah PNP0C14 -au GSADEV0 \
+ *     -st t -sam SIO0 -sa0 0 -sl TSYS \
+ *     -st t -sam SIO0 -sa0 2 -sl TCPU \
+ *     -st f -sam SIO4 -sa0 0 -sl "FCPU" -scm 2 -scv 1350000 \
+ *     -st f -sam SIO4 -sa0 2 -sl "FPCH" -scm 2 -scv 1350000
+ * $ sensors
+ *   trivialmon.2.auto-isa-0002
+ *   Adapter: ISA adapter
+ *   FCPU:        1398 RPM
+ *   FPCH:           0 RPM
+ *   TSYS:         +33.0°C
+ *   TCPU:         +30.0°C
+ *
+ */
+#include <errno.h>
+#include <error.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <stdlib.h>
+#include <sys/ioctl.h>
+
+#include "trivialmon.h"
+
+#define APP_VERSION "0.1"
+
+#define TRIM_DEV_PATH "/dev/"TRIM_CTRL_DEV_NAME
+
+struct trim_sensor it8868sens[] = {
+	{ .type = trim_type_temp, .label = "TSYS", .reg = 0x29, .conv_mult = 1000, },
+	{ .type = trim_type_temp, .label = "TCPU", .reg = 0x2b, },
+	{ .type = trim_type_temp, .label = "TPCH", .reg = 0x2e, },
+	{ .type = trim_type_fan, .label = "FCPU", .reg = 0x0d, .reg_hi = 0x18,
+		.conv_mult = 2, .conv_dvdnd = 1350000, },
+	{ .type = trim_type_fan, .reg = 0x0e, .reg_hi = 0x19, .conv_mult = 2,
+		.conv_dvdnd = 1350000, },
+	{ .type = trim_type_fan, .reg = 0x0f, .reg_hi = 0x1a, .conv_mult = 2,
+		.conv_dvdnd = 1350000, },
+	{ .type = trim_type_in, .label = "VCore", .reg = 0x20, .conv_mult = 12, },
+	{ .type = trim_type_in, .label = "3V", .reg = 0x21, .conv_mult = 12 * 2, },
+	{ .type = trim_type_in, .label = "12V", .reg = 0x22, .conv_mult = 12 * 6, },
+};
+
+struct trim_dev_args it8868dev = {
+	.method = method_ioselect,
+	.flags = 0,
+	.chip_id = 0x90,
+	.reg_chip_id = 0x58,
+	.base_addr = 0xa45,
+	.num_sensors = sizeof(it8868sens) / sizeof(struct trim_sensor),
+	.sensors = it8868sens,
+};
+
+struct trim_sensor gigabytesens[] = {
+	{ .type = trim_type_temp, .label = "TSYS", .acpi_method = "SIO0", .acpi_arg0 = 0, },
+	{ .type = trim_type_temp, .label = "TCPU", .acpi_method = "SIO0", .acpi_arg0 = 2, },
+	{ .type = trim_type_temp, .label = "TPCH", .acpi_method = "SIO0", .acpi_arg0 = 5, },
+	{ .type = trim_type_fan, .label = "FCPU", .acpi_method = "SIO4", .acpi_arg0 = 0,
+		.conv_mult = 2, .conv_dvdnd = 1350000, },
+	{ .type = trim_type_fan, .label = "FPCH", .acpi_method = "SIO4", .acpi_arg0 = 2,
+		.conv_mult = 2, .conv_dvdnd = 1350000, },
+};
+
+struct trim_dev_args gigabytedev = {
+	.method = method_acpi,
+	.flags = 0,
+	.acpi_hid = "PNP0C14",
+	.acpi_uid = "GSADEV0",
+	.num_sensors = sizeof(gigabytesens) / sizeof(struct trim_sensor),
+	.sensors = gigabytesens,
+};
+
+struct trim_sensor nct6799sens[] = {
+	{ .type = trim_type_temp, .label = "TSYS", .reg = 0x27, },
+	{ .type = trim_type_temp, .label = "TCPU", .reg = 0x150, },
+	{ .type = trim_type_fan, .label = "FCPU", .reg = 0x4c3, .reg_hi = 0x4c2, },
+	{ .type = trim_type_fan, .reg = 0x4c1, .reg_hi = 0x4c0, },
+	{ .type = trim_type_in, .label = "VCore", .reg = 0x480, .conv_mult = 8, /* 8mV steps */ },
+	{ .type = trim_type_in, .label = "3VCC", .reg = 0x483, .conv_mult = 16, /* 16mV steps */ },
+	{ .type = trim_type_in, .label = "VIN0 12V", .reg = 0x484, .conv_mult = 8, },
+};
+
+struct trim_dev_args nct6799dev = {
+	.method = method_ioselect,
+	.flags = 0,
+	.chip_id = 0xa3,
+	.reg_chip_id = 0x4f,
+	.base_addr = 0x295,
+	.reg_bank_sel = 0x4e,
+	.num_sensors = sizeof(nct6799sens) / sizeof(struct trim_sensor),
+	.sensors = nct6799sens,
+};
+
+struct trim_sensor nct6799rosens[] = {
+	{ .type = trim_type_temp, .label = "TSYS", .reg = 0xa10, },
+	{ .type = trim_type_temp, .label = "TCPU", .reg = 0xa11, },
+	{ .type = trim_type_temp, .reg = 0xa12, },
+	{ .type = trim_type_in, .label = "VCore", .reg = 0xa00, .conv_mult = 8, },
+	{ .type = trim_type_in, .label = "3VCC", .reg = 0xa03, .conv_mult = 16, },
+	{ .type = trim_type_in, .label = "VIN0 12V", .reg = 0xa01, .conv_mult = 8, },
+};
+
+struct trim_dev_args nct6799rodev = {
+	.method = method_iodirect,
+	.num_sensors = sizeof(nct6799rosens) / sizeof(struct trim_sensor),
+	.sensors = nct6799rosens,
+};
+
+void print_dev_args(struct trim_dev_args *devargs)
+{
+	printf("Device args:\n");
+	printf("  method: %i, flags: 0x%x\n", devargs->method, devargs->flags);
+
+	if (devargs->method == method_ioselect) {
+		printf("    base_addr: 0x%x, chip_id: 0x%x\n",
+		       devargs->base_addr, devargs->chip_id);
+		printf("    reg_chip_id: 0x%x, reg_bank_sel: 0x%x\n",
+		       devargs->reg_chip_id, devargs->reg_bank_sel);
+	}
+
+	if (devargs->method == method_acpi)
+		printf("    acpi_hid: '%s', acpi_uid: '%s'\n",
+		       devargs->acpi_hid, devargs->acpi_uid);
+
+	printf("  num sensors: %i\n", devargs->num_sensors);
+	for (int i = 0; i < devargs->num_sensors; i++) {
+		char st = '?';
+
+		if (devargs->sensors[i].type == trim_type_temp)
+			st = 't';
+		else if (devargs->sensors[i].type == trim_type_fan)
+			st = 'f';
+		else if (devargs->sensors[i].type == trim_type_in)
+			st = 'i';
+
+		if (strlen(devargs->sensors[i].label))
+			printf("  -- sensor type: '%c', label: '%s', ",
+				st, devargs->sensors[i].label);
+		else
+			printf("  -- sensor type: '%c', ", st);
+
+		if (devargs->method == method_acpi)
+			printf("acpi_method: %s, acpi_arg0: 0x%x\n",
+				devargs->sensors[i].acpi_method, devargs->sensors[i].acpi_arg0);
+		else
+			printf("reg: 0x%02x, reg_hi: 0x%02x\n",
+				devargs->sensors[i].reg, devargs->sensors[i].reg_hi);
+
+		/* try to print conversion nicely (DVDND / (R * MULT / DIV) */
+		if (devargs->sensors[i].conv_mult || devargs->sensors[i].conv_div ||
+			devargs->sensors[i].conv_dvdnd) {
+			printf("     Reading conversion: ");
+			if (devargs->sensors[i].conv_dvdnd)
+				printf("%i / ( R ", devargs->sensors[i].conv_dvdnd);
+			else
+				printf("R ");
+
+			if (devargs->sensors[i].conv_mult)
+				printf("* %i ", devargs->sensors[i].conv_mult);
+			if (devargs->sensors[i].conv_div)
+				printf("/ %i ", devargs->sensors[i].conv_div);
+
+			if (devargs->sensors[i].conv_dvdnd)
+				printf(")");
+			printf("\n");
+		}
+	}
+	printf("\n");
+}
+
+int call_list(void)
+{
+	int ret;
+	int fd = open(TRIM_DEV_PATH, O_RDWR);
+
+	if (fd < 0) {
+		error(1, errno, "Cannot open %s for read/write", TRIM_DEV_PATH);
+		return errno;
+	}
+
+	printf("List.\n");
+
+	ret = ioctl(fd, TRIM_IOCTL_LIST, NULL);
+	if (!ret) {
+		printf("> OK\n");
+	} else {
+		printf("> Err: %i - %s\n", errno, strerror(errno));
+		ret = errno;
+	}
+
+	return ret;
+}
+
+
+int call_attach(struct trim_dev_args *dev, const char *label)
+{
+	int ret;
+	int fd = open(TRIM_DEV_PATH, O_RDWR);
+
+	if (fd < 0) {
+		error(1, errno, "Cannot open %s for read/write", TRIM_DEV_PATH);
+		return errno;
+	}
+
+	printf("Attach %s (%s)\n", label, (dev->flags & TRIM_FLAG_UNSAFE_RUN) ? "unsafe" : "safe");
+	print_dev_args(dev);
+
+	ret = ioctl(fd, TRIM_IOCTL_ATTACH, dev);
+	if (!ret) {
+		printf("> OK. idnum: %i\n", dev->idnum);
+	} else {
+		printf("> Err: %i - %s\n", errno, strerror(errno));
+		ret = errno;
+	}
+
+	return ret;
+}
+
+int call_detach(int idnum)
+{
+	int ret;
+	int fd = open(TRIM_DEV_PATH, O_WRONLY);
+
+	if (fd < 0) {
+		error(1, errno, "Cannot open %s for write", TRIM_DEV_PATH);
+		return errno;
+	}
+
+	printf("Detaching device %i\n", idnum);
+
+	ret = ioctl(fd, TRIM_IOCTL_DETACH, idnum);
+	if (!ret) {
+		printf("> OK\n");
+	} else {
+		printf("> Err: %i - %s\n", errno, strerror(errno));
+		ret = errno;
+	}
+
+	return ret;
+}
+
+long arg_val_as_num(int argc, int *currarg, const char **argval)
+{
+	const char *val;
+	char *strend;
+	long retval;
+	int nextarg = (*currarg) + 1;
+
+	if (nextarg >= argc) {
+		printf("Missing argument value for: %s\n", argval[*currarg]);
+		exit(1);
+	}
+
+	val = argval[nextarg];
+	strend = (char *)val;
+	errno = 0;
+	retval = strtol(val, &strend, 0);
+	if (errno || val == strend) {
+		printf("Invalid argument number value for: %s\n", argval[*currarg]);
+		exit(1);
+	}
+	(*currarg)++;
+
+	return retval;
+}
+
+void arg_val_strncpy(char *dest, int len, int argc, int *currarg, const char **argval)
+{
+	int nextarg = (*currarg) + 1;
+
+	if (nextarg >= argc) {
+		printf("Missing argument value for: %s\n", argval[*currarg]);
+		exit(1);
+	}
+	if (strlen(argval[nextarg]) > len) {
+		printf("Invalid argument value for: %s\n", argval[*currarg]);
+		exit(1);
+	}
+	strncpy(dest, argval[nextarg], len);
+	(*currarg)++;
+}
+
+#define CHECK_SENS_ARG(sensor_index) do { if (sensor_index < 0) { \
+	printf("Missing sensor type first\n"); exit(1); } \
+	} while (0)
+
+#define CHECK_DEVMETH_ACPI(devargs, arg) do { if (devargs.method != method_acpi) { \
+	printf("Bad arg for method: %s\n", arg); exit(1); } \
+	} while (0)
+
+#define CHECK_DEVMETH_IO(devargs, arg) do { if (devargs.method == method_acpi) { \
+	printf("Bad arg for method: %s\n", arg); exit(1); } \
+	} while (0)
+
+int process_method_args(int argc, const char **argv)
+{
+	int i = 1, tmp, sensi = -1, maxsens;
+	const char *arg;
+	char sensortype[16];
+	struct trim_dev_args devargs;
+	struct trim_sensor devsensors[TRIM_MAX_CHANNELS * TRIM_MAX_CH_SENSORS];
+
+	memset(&devargs, 0, sizeof(devargs));
+	memset(devsensors, 0, sizeof(devsensors));
+	maxsens = sizeof(devsensors) / sizeof(struct trim_sensor);
+
+	while (i < argc) {
+		arg = argv[i];
+		if (!strcmp(arg, "-m")) {
+			tmp = arg_val_as_num(argc, &i, argv);
+			if (tmp < method_ioselect || tmp > method_acpi) {
+				printf("Bad method: %i\n", tmp);
+				exit(1);
+			}
+			devargs.method = tmp;
+		} else if (!strcmp(arg, "-u")) {
+			devargs.flags |= TRIM_FLAG_UNSAFE_RUN;
+		} else if (!strcmp(arg, "-b")) {
+			CHECK_DEVMETH_IO(devargs, arg);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devargs.base_addr = tmp;
+		} else if (!strcmp(arg, "-c")) {
+			CHECK_DEVMETH_IO(devargs, arg);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devargs.chip_id = tmp;
+		} else if (!strcmp(arg, "-rc")) {
+			CHECK_DEVMETH_IO(devargs, arg);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devargs.reg_chip_id = tmp;
+		} else if (!strcmp(arg, "-rs")) {
+			CHECK_DEVMETH_IO(devargs, arg);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devargs.reg_bank_sel = tmp;
+		} else if (!strcmp(arg, "-ah")) {
+			CHECK_DEVMETH_ACPI(devargs, arg);
+			arg_val_strncpy(devargs.acpi_hid, TRIM_MAX_ACPI_HID_LEN, argc, &i, argv);
+		} else if (!strcmp(arg, "-au")) {
+			CHECK_DEVMETH_ACPI(devargs, arg);
+			arg_val_strncpy(devargs.acpi_uid, TRIM_MAX_ACPI_UID_LEN, argc, &i, argv);
+		} else if (!strcmp(arg, "-st")) {
+			arg_val_strncpy(sensortype, sizeof(sensortype), argc, &i, argv);
+			sensi++;
+			if (sensi >= maxsens) {
+				printf("Too many sensors\n");
+				exit(1);
+			}
+			if (!strcmp(sensortype, "t")) {
+				devsensors[sensi].type = trim_type_temp;
+			} else if (!strcmp(sensortype, "f")) {
+				devsensors[sensi].type = trim_type_fan;
+			} else if (!strcmp(sensortype, "i")) {
+				devsensors[sensi].type = trim_type_in;
+			} else {
+				printf("Bad sensor type: %s\n", sensortype);
+				exit(1);
+			}
+		} else if (!strcmp(arg, "-sr")) {
+			CHECK_SENS_ARG(sensi);
+			CHECK_DEVMETH_IO(devargs, arg);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devsensors[sensi].reg = tmp;
+		} else if (!strcmp(arg, "-srh")) {
+			CHECK_SENS_ARG(sensi);
+			CHECK_DEVMETH_IO(devargs, arg);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devsensors[sensi].reg_hi = tmp;
+		} else if (!strcmp(arg, "-sam")) {
+			CHECK_SENS_ARG(sensi);
+			CHECK_DEVMETH_ACPI(devargs, arg);
+			arg_val_strncpy(devsensors[sensi].acpi_method, TRIM_MAX_ACPI_METH_LEN,
+					argc, &i, argv);
+		} else if (!strcmp(arg, "-sa0")) {
+			CHECK_SENS_ARG(sensi);
+			CHECK_DEVMETH_ACPI(devargs, arg);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devsensors[sensi].acpi_arg0 = tmp;
+		} else if (!strcmp(arg, "-scm")) {
+			CHECK_SENS_ARG(sensi);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devsensors[sensi].conv_mult = tmp;
+		} else if (!strcmp(arg, "-scd")) {
+			CHECK_SENS_ARG(sensi);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devsensors[sensi].conv_div = tmp;
+		} else if (!strcmp(arg, "-scv")) {
+			CHECK_SENS_ARG(sensi);
+			tmp = arg_val_as_num(argc, &i, argv);
+			devsensors[sensi].conv_dvdnd = tmp;
+		} else if (!strcmp(arg, "-sl")) {
+			CHECK_SENS_ARG(sensi);
+			arg_val_strncpy(devsensors[sensi].label, TRIM_MAX_LABEL_LEN,
+					argc, &i, argv);
+		} else {
+			printf("Invalid argument: %s\n\n", arg);
+			exit(1);
+		}
+		i++;
+	}
+
+	devargs.num_sensors = sensi - -1;
+	devargs.sensors = devsensors;
+
+	return call_attach(&devargs, "from args");
+}
+
+void print_usage(void)
+{
+	printf(__FILE_NAME__" version: "APP_VERSION"\n"
+"\n"
+"Usage: trimctrl <option>\n"
+"       trimctrl -m 1 [-u] -b <base_addr> -c <chip_id> -rc <reg_chip_id> \\\n"
+"                     -rs <reg_bank_sel> [-st <Y> sensor_options...]\n"
+"       trimctrl -m 2 [-u] [-st <Y> sensor_options...]\n"
+"       trimctrl -m 3 -ah <acpi_hid> -au <acpi_uid> [-st <Y> sensor_options...]\n"
+"\n"
+"Options:\n"
+"    -m <N>              Attach device with method 1: ioselect, 2: iodirect, 3: acpi\n"
+"    -d <N>              Detach device number N (printed by attach or listed in dmesg)\n"
+"    -u                  Set unsafe flag (ignores resource conflicts)\n"
+"    -l                  List device ids in dmesg output (debugging only)\n"
+"    -h, --help          Help message (this one)\n"
+"\n"
+"Sensor Info:\n"
+"    -st <t | f | i>     Sensor type [t]emp, [f]an or [i]n (must come before sensor options)\n"
+"\n"
+"  Options for io methods:\n"
+"    -sr <reg>           Sensor register address\n"
+"    -srh <reg>          Sensor register hi byte address\n"
+"  Options for ACPI method:\n"
+"    -sam <method>       Sensor ACPI method\n"
+"    -sa0 <arg0>         Sensor ACPI method arg0 value\n"
+"  For all methods:\n"
+"    -scm <mult>         Conversion: multiply raw value\n"
+"    -scd <div>          Conversion: divide raw value\n"
+"    -scv <dvd>          Conversion: dividend to divide by raw value\n"
+"    -sl <label>         Label for this sensor\n"
+"\n"
+"Sample devices:\n"
+"    -t1                 Attach IT8688 (safe - checks resource conflicts)\n"
+"    -t2                 Attach IT8688 (unsafe - ignores conflicts)\n"
+"    -t3                 Attach Gigabyte ACPI (safe)\n"
+"    -t4                 Attach nct6799 (safe)\n"
+"    -t5                 Attach nct6799 (unsafe)\n"
+"    -t6                 Attach nct6799ro (safe)\n"
+"\n");
+	exit(0);
+}
+
+int main(int argc, const char **argv)
+{
+	int ret = 0, idnum, arg1 = 1;
+	const char *arg;
+
+	if (argc < 2) {
+		printf("Invalid or missing argument\n");
+		exit(1);
+	}
+
+	arg = argv[1];
+	if (!strcmp(arg, "-h") || !strcmp(arg, "--help")) {
+		print_usage();
+	} else if (!strcmp(arg, "-l")) {
+		printf("Calling List\n");
+		ret = call_list();
+	} else if (!strcmp(arg, "-t1")) {
+		ret = call_attach(&it8868dev, "IT8688");
+	} else if (!strcmp(arg, "-t2")) {
+		it8868dev.flags |= TRIM_FLAG_UNSAFE_RUN;
+		ret = call_attach(&it8868dev, "IT8688");
+	} else if (!strcmp(arg, "-t3")) {
+		ret = call_attach(&gigabytedev, "Gigabyte");
+	} else if (!strcmp(arg, "-t4")) {
+		ret = call_attach(&nct6799dev, "nct6799");
+	} else if (!strcmp(arg, "-t5")) {
+		nct6799dev.flags |= TRIM_FLAG_UNSAFE_RUN;
+		ret = call_attach(&nct6799dev, "nct6799");
+	} else if (!strcmp(arg, "-t6")) {
+		ret = call_attach(&nct6799rodev, "nct6799ro");
+	} else if (!strcmp(arg, "-d") && argc == 3) {
+		idnum = arg_val_as_num(argc, &arg1, argv);
+		ret = call_detach(idnum);
+	} else if (!strcmp(arg, "-m")) {
+		ret = process_method_args(argc, argv);
+	} else {
+		printf("Invalid argument: %s\n\n", arg);
+		exit(1);
+	}
+
+	return ret;
+}
diff --git a/trivialmon.c b/trivialmon.c
new file mode 100644
index 0000000..11e5829
--- /dev/null
+++ b/trivialmon.c
@@ -0,0 +1,844 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * trivialmon - Trivial Hardware Monitor Driver (Trim)
+ *
+ * Userspace-configured monitor controlled through IOCTL
+ *
+ * DISCLAIMER: Don't run this with other hwmon modules for the same device.
+ * You could easily FRY your motherboard! You could also easily FRY YOUR CPU!
+ *
+ * There are 3 methods to read a monitor device:
+ * 1. Select IO registers (optionally banked)
+ *    Pass base_addr, chip_id, and reg_chip_id params along with a list of sensors
+ *    - base_addr is assumed as ADDR-DATA pair
+ *    - chip_id is a value to be checked in reg_chip_id as trivial check that
+ *      it's the right chip. does not have to be chip id
+ *    - reg_bank_sel optional if it's a banked chip, then
+ *      register addresses are u16 with 2 bytes as (bank << 8) | (reg)
+ *      otherwise, single byte register address
+ *    - sensors have a reg (and reg_hi for 16bit values) address
+ *
+ * 2. Direct access to IO registers
+ *    Pass a list of sensors. Ports are read directly, no select
+ *    - sensors have a reg (and reg_hi for 16bit values) address
+ *
+ * 3. ACPI methods
+ *    Pass acpi_hid/acpi_uid for a single device, then a list of sensors with
+ *    an ACPI method and arg0 int
+ *    - TODO: Currently only: 'arg0' as int, does not deal with 2nd/3rd args.
+ *      (int varg) as in Gigabyte
+ *      (0, int varg) used anywhere?
+ *      (0, str varg, int varg) as in Asus ACPI
+ *
+ * For all methods, you can pass label and conv_* params for each sensor
+ *
+ * Driver devices:
+ * > struct trim_control
+ *   - mdev - character device for /dev/trim-control
+ *   - pdev - parent platform_device for all attached devices
+ *     > For each attached device
+ *       - pdev - chip specific platform device. Parent is trim_control->pdev
+ *       - hwdev - hwmon device has trim_data pointer as drvdata
+ *       - struct trim_data - holds config and sensors. held/freed by pdev
+ *
+ */
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/io.h>
+#include <linux/minmax.h>
+#include <linux/miscdevice.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+
+#include "trivialmon.h"
+
+#define DRIVER_NAME		"trivialmon"
+#define DRIVER_VERSION		"0.1"
+#define DRIVER_DESCRIPTION	"Trivial Hardware Monitor Driver"
+
+static struct platform_driver trim_driver = {
+	.driver = {
+		.name	= DRIVER_NAME,
+	},
+};
+
+struct trim_control {
+	struct miscdevice mdev;
+	struct platform_device *pdev;
+};
+
+struct trim_data {
+	struct trim_dev_args config;
+
+	struct trim_sensor *sensors_temp[TRIM_MAX_CH_SENSORS];
+	struct trim_sensor *sensors_fan[TRIM_MAX_CH_SENSORS];
+	struct trim_sensor *sensors_in[TRIM_MAX_CH_SENSORS];
+
+	int ntemp;
+	int nfan;
+	int nin;
+
+/* TODO: maybe this driver should just depend on ACPI? no ioports without ACPI
+ * Also compile test without ACPI
+ */
+#if IS_ENABLED(CONFIG_ACPI)
+	struct acpi_device *acpi_dev;
+#endif
+	struct resource res;
+	struct mutex lock;
+};
+
+static int trim_read_io_reg(u16 base_addr, u16 bank_sel, u16 reg, u16 reg_hi, u16 flags,
+				   long *val)
+{
+	int tmp;
+	u8 bank;
+
+	bank = (u8)((reg & 0xFF00) >> 8);
+	if (bank_sel) {
+		outb_p(bank_sel, base_addr);
+		outb_p(bank, base_addr + 1);
+	}
+	outb_p(reg & 0xFF, base_addr);
+	tmp = inb_p(base_addr + 1);
+
+	if ((flags & TRIM_FLAG_SENS_REG_16BIT) && reg_hi) {
+		bank = (u8)((reg_hi & 0xFF00) >> 8);
+		if (bank_sel) {
+			outb_p(bank_sel, base_addr);
+			outb_p(bank, base_addr + 1);
+		}
+		outb_p(reg_hi & 0xFF, base_addr);
+		tmp = (inb_p(base_addr + 1) << 8) | (tmp & 0xFF);
+	}
+
+	*val = tmp;
+	return 0;
+}
+
+static int trim_read_io_addr(u16 reg, u16 reg_hi, u16 flags, long *val)
+{
+	int tmp = inb_p(reg);
+
+	if ((flags & TRIM_FLAG_SENS_REG_16BIT) && reg_hi)
+		tmp = (inb_p(reg_hi) << 8) | (tmp & 0xFF);
+
+	*val = tmp;
+	return 0;
+}
+
+
+static int trim_read_acpi(struct acpi_device *adev, struct trim_sensor *sensor, long *val)
+{
+#if IS_ENABLED(CONFIG_ACPI)
+	unsigned long long tmp;
+	union acpi_object params[1];
+	struct acpi_object_list input;
+	acpi_status status;
+	acpi_handle handle;
+	acpi_string method = sensor->acpi_method;
+
+	handle = acpi_device_handle(adev);
+	params[0].type = ACPI_TYPE_INTEGER;
+	params[0].integer.value = sensor->acpi_arg0;
+	input.count = 1;
+	input.pointer = params;
+
+	status = acpi_evaluate_integer(handle, method, &input, &tmp);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	*val = (int)tmp;
+	return 0;
+#else
+	return -EOPNOTSUPP;
+#endif
+}
+
+static int trim_read_sensor(struct trim_data *tdata, struct trim_sensor *sensor, long *val)
+{
+	int ret;
+	long tmp;
+
+	switch (tdata->config.method) {
+	case method_ioselect:
+		ret = trim_read_io_reg(tdata->config.base_addr, tdata->config.reg_bank_sel,
+						sensor->reg, sensor->reg_hi, sensor->flags, &tmp);
+		break;
+	case method_iodirect:
+		ret = trim_read_io_addr(sensor->reg, sensor->reg_hi, sensor->flags, &tmp);
+		break;
+	case method_acpi:
+		ret = trim_read_acpi(tdata->acpi_dev, sensor, &tmp);
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (ret) {
+		pr_err_once("%s: bad read: %i\n", __func__, ret);
+		return ret;
+	}
+
+	if (tmp == 0x0 || tmp == 0xFF || tmp == 0xFFFF) {
+		*val = 0;
+		return 0;
+	}
+
+	/* apply conversions */
+	if (sensor->conv_mult > 0)
+		tmp = tmp * sensor->conv_mult;
+
+	if (sensor->conv_div > 1 && tmp > 0)
+		tmp = DIV_ROUND_CLOSEST(tmp, sensor->conv_div);
+
+	if (sensor->conv_dvdnd > 1 && tmp > 0)
+		tmp = DIV_ROUND_CLOSEST(sensor->conv_dvdnd, tmp);
+
+	*val = tmp;
+	return 0;
+}
+
+static umode_t trim_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
+				     u32 attr, int channel)
+{
+	/* all attributes are readonly if we registered them */
+	return 0444;
+}
+
+static int trim_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	int ret;
+	struct trim_data *tdata = dev_get_drvdata(dev);
+	struct trim_sensor *sensor;
+
+	switch (type) {
+	case hwmon_temp:
+		sensor = tdata->sensors_temp[channel];
+		break;
+	case hwmon_fan:
+		sensor = tdata->sensors_fan[channel];
+		break;
+	case hwmon_in:
+		sensor = tdata->sensors_in[channel];
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	mutex_lock(&tdata->lock);
+	ret = trim_read_sensor(tdata, sensor, val);
+	mutex_unlock(&tdata->lock);
+
+	return ret;
+}
+
+static int trim_hwmon_read_label(struct device *dev, enum hwmon_sensor_types type,
+				 u32 attr, int channel, const char **str)
+{
+	struct trim_data *tdata = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		*str = tdata->sensors_temp[channel]->label;
+		break;
+	case hwmon_fan:
+		*str = tdata->sensors_fan[channel]->label;
+		break;
+	case hwmon_in:
+		*str = tdata->sensors_in[channel]->label;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+	return 0;
+}
+
+static const struct hwmon_ops trim_hwmon_ops = {
+	.read		= trim_hwmon_read,
+	.read_string	= trim_hwmon_read_label,
+	.is_visible	= trim_hwmon_is_visible,
+};
+
+static struct device *trim_hwmon_register_device(struct device *dev, struct trim_data *tdata)
+{
+	int i, nptr = 0;
+	struct hwmon_chip_info hwmon_chip_info;
+	struct hwmon_channel_info hwmon_channel_info[TRIM_MAX_CHANNELS + 1];
+	struct hwmon_channel_info *hwmon_channel_ptr[TRIM_MAX_CHANNELS + 1];
+	u32 hwmon_config[TRIM_MAX_CHANNELS][TRIM_MAX_CH_SENSORS + 1];
+
+	memset(hwmon_channel_ptr, 0, sizeof(hwmon_channel_ptr));
+	memset(&hwmon_config, 0, sizeof(hwmon_config));
+
+	if (tdata->ntemp) {
+		pr_info("-- setting temp channel info with %i sensors\n", tdata->ntemp);
+		for (i = 0; i < tdata->ntemp; i++) {
+			hwmon_config[trim_type_temp][i] = HWMON_T_INPUT |
+				TRIM_WITH_LABEL(tdata->sensors_temp[i]->flags, HWMON_T_LABEL);
+		}
+		hwmon_channel_info[trim_type_temp].config = hwmon_config[trim_type_temp];
+		hwmon_channel_info[trim_type_temp].type = hwmon_temp;
+		hwmon_channel_ptr[nptr++] = &hwmon_channel_info[trim_type_temp];
+	}
+
+	if (tdata->nfan) {
+		pr_info("-- setting fan channel info with %i sensors\n", tdata->nfan);
+		for (i = 0; i < tdata->nfan; i++) {
+			hwmon_config[trim_type_fan][i] = HWMON_F_INPUT |
+				TRIM_WITH_LABEL(tdata->sensors_fan[i]->flags, HWMON_F_LABEL);
+		}
+		hwmon_channel_info[trim_type_fan].config = hwmon_config[trim_type_fan];
+		hwmon_channel_info[trim_type_fan].type = hwmon_fan;
+		hwmon_channel_ptr[nptr++] = &hwmon_channel_info[trim_type_fan];
+	}
+
+	if (tdata->nin) {
+		pr_info("-- setting in channel info with %i sensors\n", tdata->nin);
+		for (i = 0; i < tdata->nin; i++) {
+			hwmon_config[trim_type_in][i] = HWMON_I_INPUT |
+				TRIM_WITH_LABEL(tdata->sensors_in[i]->flags, HWMON_I_LABEL);
+		}
+		hwmon_channel_info[trim_type_in].config = hwmon_config[trim_type_in];
+		hwmon_channel_info[trim_type_in].type = hwmon_in;
+		hwmon_channel_ptr[nptr++] = &hwmon_channel_info[trim_type_in];
+	}
+
+	hwmon_chip_info.ops = &trim_hwmon_ops;
+	hwmon_chip_info.info = (const struct hwmon_channel_info * const *)hwmon_channel_ptr;
+
+	return devm_hwmon_device_register_with_info(dev, dev_name(dev), tdata,
+						     &hwmon_chip_info, NULL);
+}
+
+static bool trim_check_reg_valid(u16 reg, u16 reg_bank_sel, enum trim_method method)
+{
+	if (!reg || reg == 0xFFFF)
+		return false;
+	if (method == method_ioselect && (!reg_bank_sel && reg > 0xFF))
+		return false;
+	if (method == method_iodirect && (reg < TRIM_MIN_IO_ADDRESS || reg > TRIM_MAX_IO_ADDRESS))
+		return false;
+
+	return true;
+}
+
+static bool trim_check_string_valid(char *str, int max)
+{
+	int len = strnlen(str, max);
+
+	if (len > 0 && len < max)
+		return true;
+
+	return false;
+}
+
+#if IS_ENABLED(CONFIG_ACPI)
+static int trim_find_acpi_dev(struct device *dev, void *data)
+{
+	struct acpi_device *adev = to_acpi_device(dev);
+	struct trim_data *tdata = (struct trim_data *)data;
+	const char *uid = acpi_device_uid(adev);
+	const char *hid = acpi_device_hid(adev);
+
+	if (uid && !strcmp(uid, tdata->config.acpi_uid) &&
+			hid && !strcmp(hid, tdata->config.acpi_hid)) {
+		tdata->acpi_dev = adev;
+		return -EEXIST;
+	}
+	return 0;
+
+}
+#endif
+
+/* TODO:
+ * fop_ioctl() allocates args->sensors, then always frees it.
+ * data_init() always copies one-by-one, even flags.
+ * this is cleaner as sensors comes from userspace, but it's tedious.
+ */
+static int trim_device_data_init(struct trim_data *tdata, struct trim_dev_args *args)
+{
+	int i, addrstart = 0xFFFF, addrend = 0;
+	long tmp;
+	struct trim_sensor *argsensor, *tsensor;
+	acpi_handle ahandle;
+
+	tdata->config.method = args->method;
+	tdata->config.flags = args->flags;
+	switch (tdata->config.method) {
+	case method_ioselect:
+		if (args->base_addr < TRIM_MIN_IO_ADDRESS ||
+			args->base_addr > TRIM_MAX_IO_ADDRESS) {
+			pr_err("invalid parameters: base_addr is outside of trivial range\n");
+			return -EINVAL;
+		}
+		if (!args->chip_id || !args->reg_chip_id) {
+			pr_err("invalid parameters: chip_id is required and its register\n");
+			return -EINVAL;
+		}
+		tdata->config.base_addr = args->base_addr;
+		tdata->config.chip_id = args->chip_id;
+		tdata->config.reg_chip_id = args->reg_chip_id;
+		tdata->config.reg_chip_id_hi = args->reg_chip_id_hi;
+		tdata->config.reg_bank_sel = args->reg_bank_sel;
+		addrstart = tdata->config.base_addr;
+		addrend = tdata->config.base_addr + 1;
+		break;
+	case method_iodirect:
+		/* nothing to check outside the sensor regs */
+		break;
+	case method_acpi:
+#if IS_ENABLED(CONFIG_ACPI)
+		if (!trim_check_string_valid(args->acpi_hid, TRIM_MAX_ACPI_HID_LEN)) {
+			pr_err("invalid parameters: acpi hid missing or too long\n");
+			return -EINVAL;
+		}
+		strscpy(tdata->config.acpi_hid, args->acpi_hid, TRIM_MAX_ACPI_HID_LEN);
+
+		if (!trim_check_string_valid(args->acpi_uid, TRIM_MAX_ACPI_UID_LEN)) {
+			pr_err("invalid parameters: acpi uid missing or too long\n");
+			return -EINVAL;
+		}
+		strscpy(tdata->config.acpi_uid, args->acpi_uid, TRIM_MAX_ACPI_UID_LEN);
+
+		/* find the acpi device */
+		pr_info("%s: looking for acpi device: %s/%s\n",
+			__func__, tdata->config.acpi_hid, tdata->config.acpi_uid);
+		acpi_bus_for_each_dev(trim_find_acpi_dev, tdata);
+		if (!tdata->acpi_dev) {
+			pr_err("invalid parameters: no matching acpi dev\n");
+			return -ENODEV;
+		}
+		ahandle = acpi_device_handle(tdata->acpi_dev);
+		if (!ahandle) {
+			pr_err("invalid parameters: no handle to acpi dev\n");
+			return -ENODEV;
+		}
+		break;
+#else
+		return -EOPNOTSUPP;
+#endif
+	default:
+		pr_err("invalid parameters: unknown method\n");
+		return -EINVAL;
+	}
+	pr_info("%s: tdata method %i\n", __func__, tdata->config.method);
+
+
+	/* check all sensors first, then assign to tdata */
+	tdata->config.num_sensors = args->num_sensors;
+	tdata->config.sensors = kcalloc(tdata->config.num_sensors, sizeof(struct trim_sensor),
+					GFP_KERNEL);
+
+	for (i = 0; i < args->num_sensors; i++) {
+		argsensor = &args->sensors[i];
+		tsensor = &tdata->config.sensors[i];
+
+		if (argsensor->type >= trim_type_length) {
+			pr_err("invalid parameters: bad sensor (%i) type\n", i);
+			return -EINVAL;
+		}
+		tsensor->type = argsensor->type;
+		tsensor->conv_mult = argsensor->conv_mult;
+		tsensor->conv_dvdnd = argsensor->conv_dvdnd;
+		tsensor->conv_div = argsensor->conv_div;
+
+		if (trim_check_string_valid(argsensor->label, TRIM_MAX_LABEL_LEN))
+			tsensor->flags |= TRIM_FLAG_SENS_HAS_LABEL;
+		strscpy(tsensor->label, argsensor->label, TRIM_MAX_LABEL_LEN);
+
+		switch (tdata->config.method) {
+		case method_ioselect:
+		case method_iodirect:
+			if (!trim_check_reg_valid(argsensor->reg, args->reg_bank_sel,
+				tdata->config.method)) {
+				pr_err("invalid parameters: bad sensor (%i) register\n", i);
+				return -EINVAL;
+			}
+			tsensor->reg = argsensor->reg;
+
+			if (trim_check_reg_valid(argsensor->reg_hi, args->reg_bank_sel,
+				tdata->config.method)) {
+				tsensor->reg_hi = argsensor->reg_hi;
+				tsensor->flags |= TRIM_FLAG_SENS_REG_16BIT;
+			}
+
+			if (tdata->config.method == method_iodirect) {
+				/* track start/end for RES_IO */
+				addrstart = min(addrstart, tsensor->reg);
+				addrend = max(addrend, tsensor->reg);
+				if ((tsensor->flags & TRIM_FLAG_SENS_REG_16BIT)) {
+					addrstart = min(addrstart, tsensor->reg_hi);
+					addrend = max(addrend, tsensor->reg_hi);
+				}
+				/* it's not really base_addr, but useful for printing/listing */
+				tdata->config.base_addr = addrstart;
+
+			}
+			break;
+		case method_acpi:
+			if (!trim_check_string_valid(argsensor->acpi_method,
+				TRIM_MAX_ACPI_METH_LEN)) {
+				pr_err("invalid parameters: sensor (%i) label too long\n", i);
+				return -EINVAL;
+			}
+#if IS_ENABLED(CONFIG_ACPI)
+			if (!acpi_has_method(ahandle, argsensor->acpi_method)) {
+				pr_err("invalid parameters: sensor (%i) bad method\n", i);
+				return -EINVAL;
+			}
+#endif
+			strscpy(tsensor->acpi_method, argsensor->acpi_method,
+				TRIM_MAX_ACPI_METH_LEN);
+			tsensor->acpi_arg0 = argsensor->acpi_arg0;
+			break;
+		}
+
+		switch (argsensor->type) {
+		case trim_type_temp:
+			if (tdata->ntemp >= TRIM_MAX_CH_SENSORS) {
+				pr_err("invalid parameters: sensor (%i) too many temps\n", i);
+				return -EINVAL;
+			}
+			/* celsius to millicelsius by default */
+			if (tsensor->conv_mult == 0)
+				tsensor->conv_mult = 1000;
+			tdata->sensors_temp[tdata->ntemp++] = tsensor;
+			break;
+		case trim_type_fan:
+			if (tdata->nfan >= TRIM_MAX_CH_SENSORS) {
+				pr_err("invalid parameters: sensor (%i) too many fans\n", i);
+				return -EINVAL;
+			}
+			tdata->sensors_fan[tdata->nfan++] = tsensor;
+			break;
+		case trim_type_in:
+			if (tdata->nin >= TRIM_MAX_CH_SENSORS) {
+				pr_err("invalid parameters: sensor (%i) too many ins\n", i);
+				return -EINVAL;
+			}
+			tdata->sensors_in[tdata->nin++] = tsensor;
+			break;
+		default:
+			break;
+		}
+	}
+
+
+	if (tdata->config.method == method_ioselect || tdata->config.method == method_iodirect) {
+		tdata->res = DEFINE_RES_IO_NAMED(addrstart, addrend - addrstart + 1, DRIVER_NAME);
+		pr_info("resource region: %llx - %llx\n", tdata->res.start, tdata->res.end);
+
+#if IS_ENABLED(CONFIG_ACPI)
+		/* TODO: test without acpi_enforce_resources=lax */
+		if (acpi_check_resource_conflict(&tdata->res)) {
+			if (tdata->config.flags & TRIM_FLAG_UNSAFE_RUN)
+				pr_notice("ACPI conflict will be ignored with unsafe flag\n");
+			else
+				return -EBUSY;
+		}
+#endif
+	}
+
+	/* confirm chip_id - but should this be reading at this stage? */
+	if (tdata->config.method == method_ioselect) {
+		if (trim_read_io_reg(tdata->config.base_addr, tdata->config.reg_bank_sel,
+			tdata->config.reg_chip_id, tdata->config.reg_chip_id_hi, 0, &tmp)) {
+			pr_err("invalid parameters: chip_id could not be read\n");
+			return -EINVAL;
+		}
+		if (tmp != tdata->config.chip_id) {
+			pr_err("invalid parameters: chip_id 0x%x does not match 0x%lx\n",
+			       tdata->config.chip_id, tmp);
+			return -ENXIO;
+		}
+		pr_info("device: chip_id 0x%x confirmed\n", tdata->config.chip_id);
+	}
+
+	pr_info("copied %i sensors as temp: %i, fan: %i, in: %i\n",
+		tdata->config.num_sensors, tdata->ntemp, tdata->nfan, tdata->nin);
+
+	mutex_init(&tdata->lock);
+
+	pr_info("%s: done, all good\n", __func__);
+	return 0;
+}
+
+static void trim_device_data_release(struct device *dev, void *res)
+{
+	struct trim_data *tdata = *(struct trim_data **)res;
+
+	pr_info("%s: freeing sensor data\n", __func__);
+	kfree(tdata->config.sensors);
+	kfree(tdata);
+}
+
+
+static int trim_device_register(struct trim_control *tc, struct trim_dev_args *args)
+{
+	int err;
+	struct trim_data *tdata, **devres;
+	struct platform_device *pdev;
+	struct device *hwdev;
+
+	pr_info("%s: init with flags: 0x%x\n", __func__, args->flags);
+
+	tdata = kzalloc(sizeof(struct trim_data), GFP_KERNEL);
+	if (!tdata)
+		return -ENOMEM;
+
+	devres = devres_alloc(trim_device_data_release, sizeof(*devres), GFP_KERNEL);
+	if (!devres) {
+		kfree(tdata);
+		return -ENOMEM;
+	}
+	*devres = tdata;
+
+	err = trim_device_data_init(tdata, args);
+	if (err)
+		goto errout;
+
+	/* TODO: set pdev.id from res.start? Shows decimal and more difficult for detach(id) */
+	/* TODO: maybe add a name for the device from trim_dev_args? */
+	pdev = platform_device_register_resndata(&tc->pdev->dev, DRIVER_NAME, PLATFORM_DEVID_AUTO,
+						 NULL, 0, NULL, 0);
+	if (IS_ERR(pdev)) {
+		pr_err("platform device registration error\n");
+		err = PTR_ERR_OR_ZERO(pdev);
+		goto errout;
+	}
+	pr_info("device: registered platform device: %i\n", pdev->id);
+	devres_add(&pdev->dev, devres);
+
+	if (tdata->config.method == method_ioselect || tdata->config.method == method_iodirect) {
+		if (!devm_request_region(&pdev->dev, tdata->res.start,
+			(tdata->res.end - tdata->res.start + 1), DRIVER_NAME)) {
+			if (tdata->config.flags & TRIM_FLAG_UNSAFE_RUN) {
+				pr_notice("device: IO region (0x%x-0x%x) conflict will be ignored\n",
+					  (int)tdata->res.start, (int)tdata->res.end);
+			} else {
+				pr_err("device: failed to request region 0x%x-0x%x\n",
+				       (int)tdata->res.start, (int)tdata->res.end);
+				err = -EBUSY;
+				goto errplt;
+			}
+		}
+
+		err = platform_device_add_resources(pdev, &tdata->res, 1);
+		if (err) {
+			pr_err("device: failed to add IO resources: %d\n", err);
+			goto errplt;
+		}
+	}
+
+	hwdev = trim_hwmon_register_device(&pdev->dev, tdata);
+	if (IS_ERR(hwdev)) {
+		err = PTR_ERR_OR_ZERO(hwdev);
+		pr_err("hwmon registration failed: %i\n", err);
+		goto errplt;
+	}
+	pr_info("device: registered hwmon device\n");
+
+	args->idnum = pdev->id;
+
+	return 0;
+
+errplt:
+	pr_info("device: error, unregistering platform device\n");
+	platform_device_unregister(pdev);
+	return err;
+errout:
+	pr_info("device: error, freeing devres\n");
+	devres_free(devres);
+	return err;
+}
+
+static int trim_device_unregister(struct device *tdev, void *data)
+{
+	struct platform_device *pdev = to_platform_device(tdev);
+
+	pr_info("device: unregistering device 0x%x\n", pdev->id);
+	platform_device_unregister(pdev);
+	return 0;
+}
+
+static int trim_device_print(struct device *dev, void *data)
+{
+	struct trim_data *tdata, **devres;
+	struct platform_device *pdev = to_platform_device(dev);
+
+	devres = devres_find(dev, trim_device_data_release, NULL, NULL);
+
+	if (!devres || !*devres) {
+		pr_err("%s: no devres for device %i\n", __func__, pdev->id);
+		return -ENODATA;
+	}
+
+	tdata = *devres;
+	switch (tdata->config.method) {
+	case method_ioselect:
+		pr_info("-- device id: %i, ioselect @ 0x%x\n", pdev->id, tdata->config.base_addr);
+		break;
+	case method_iodirect:
+		pr_info("-- device id: %i, iodirect @ 0x%x\n", pdev->id, tdata->config.base_addr);
+		break;
+	case method_acpi:
+		pr_info("-- device id: %i, acpi dev @ %s/%s\n",
+			pdev->id, tdata->config.acpi_hid, tdata->config.acpi_uid);
+		break;
+	}
+
+	return 0;
+}
+
+static int trim_device_match_by_id(struct device *dev, void *id)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+
+	if (pdev->id == (unsigned long)id)
+		return 1;
+
+	return 0;
+}
+
+static struct device *trim_device_find_by_id(struct trim_control *tc, int id)
+{
+	struct device *tdev = device_find_child(&tc->pdev->dev, (void *)(unsigned long)id,
+						trim_device_match_by_id);
+
+	if (tdev)
+		put_device(tdev);
+
+	return tdev;
+}
+
+static long trim_ctrl_fop_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
+{
+	int ret;
+	struct trim_dev_args args;
+	struct device *tdev;
+	struct trim_control *tc = container_of(file->private_data, struct trim_control, mdev);
+
+	switch (cmd) {
+	case TRIM_IOCTL_LIST:
+		pr_info("%s: List ioctl\n", __func__);
+		device_for_each_child(&tc->pdev->dev, NULL, trim_device_print);
+		break;
+	case TRIM_IOCTL_ATTACH:
+		pr_info("%s: Attach ioctl\n", __func__);
+		if (copy_from_user(&args, (void __user *)arg, sizeof(struct trim_dev_args)))
+			return -EFAULT;
+		if (args.num_sensors < 1 ||
+			args.num_sensors > (TRIM_MAX_CH_SENSORS * TRIM_MAX_CHANNELS)) {
+			pr_err("-- too many sensors\n");
+			return -EFAULT;
+		}
+		args.sensors = memdup_array_user(args.sensors, args.num_sensors,
+						 sizeof(struct trim_sensor));
+		if (IS_ERR(args.sensors))
+			return PTR_ERR(args.sensors);
+
+		ret = trim_device_register(tc, &args);
+		kfree(args.sensors);
+		if (ret)
+			return ret;
+
+		/* send the platform device's id back to userspace for detach calls */
+		if (copy_to_user(&((struct trim_dev_args __user *)arg)->idnum, &args.idnum,
+				 sizeof(int)))
+			return -EFAULT;
+		break;
+	case TRIM_IOCTL_DETACH:
+		pr_info("%s: Detach ioctl for %i\n", __func__, (int)arg);
+		tdev = trim_device_find_by_id(tc, (int)arg);
+		if (!tdev) {
+			pr_err("-- device not found\n");
+			return -ENODEV;
+		}
+		trim_device_unregister(tdev, NULL);
+		break;
+	default:
+		pr_err("%s: bad IOCTL\n", __func__);
+		return -ENOTTY;
+	}
+	return 0;
+}
+
+static const struct file_operations trim_ctrl_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= trim_ctrl_fop_ioctl,
+};
+
+struct trim_control trim_ctrl = {
+	.mdev = {
+		.minor = MISC_DYNAMIC_MINOR,
+		.name = TRIM_CTRL_DEV_NAME,
+		.fops = &trim_ctrl_fops,
+	},
+};
+
+static __init int trim_init(void)
+{
+	int err = 0;
+
+	pr_info("module init\n");
+
+	err = misc_register(&trim_ctrl.mdev);
+	if (err < 0)
+		return err;
+	pr_info("registered misc device\n");
+
+	err = platform_driver_register(&trim_driver);
+	if (err) {
+		pr_err("driver registration failed (%x)\n", err);
+		goto errout;
+	}
+
+	trim_ctrl.pdev = platform_device_register_simple(DRIVER_NAME, PLATFORM_DEVID_NONE, NULL, 0);
+	err = PTR_ERR_OR_ZERO(trim_ctrl.pdev);
+	if (err) {
+		pr_err("platform device registration failed\n");
+		goto errpdrv;
+	}
+
+	pr_info("registered platform device\n");
+
+	pr_info("-- IOCTRL Attach: 0x%lx\n", TRIM_IOCTL_ATTACH);
+	pr_info("-- IOCTRL Detach: 0x%lx\n", TRIM_IOCTL_DETACH);
+	pr_info("-- IOCTRL List:   0x%08x\n", TRIM_IOCTL_LIST);
+
+	return 0;
+
+errpdrv:
+	platform_driver_unregister(&trim_driver);
+errout:
+	misc_deregister(&trim_ctrl.mdev);
+	return err;
+}
+
+static __exit void trim_exit(void)
+{
+	pr_info("driver exit started\n");
+	/* TODO: confirm that child devices need to be explicitly unregistered
+	 * and it's not just a case of holding a reference by mistake
+	 */
+	device_for_each_child(&trim_ctrl.pdev->dev, NULL, trim_device_unregister);
+	platform_device_unregister(trim_ctrl.pdev);
+	platform_driver_unregister(&trim_driver);
+	misc_deregister(&trim_ctrl.mdev);
+	pr_info("driver exit done!\n");
+}
+
+module_init(trim_init);
+module_exit(trim_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ahmad Khalifa");
+MODULE_DESCRIPTION(DRIVER_DESCRIPTION);
+MODULE_VERSION(DRIVER_VERSION);
diff --git a/trivialmon.h b/trivialmon.h
new file mode 100644
index 0000000..246cee9
--- /dev/null
+++ b/trivialmon.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _TRIVIALMON_H_
+#define _TRIVIALMON_H_
+
+#define TRIM_CTRL_DEV_NAME	"trim-control"
+
+#define TRIM_IOCTL_ATTACH	_IOWR('t', 0x10, struct trim_dev_args)
+#define TRIM_IOCTL_DETACH	_IOW('t', 0x20, int)
+/* _LIST mostly for debugging. Maybe show method in sysfs and remove this? */
+#define TRIM_IOCTL_LIST		_IO('t', 0x30)
+
+/* trivial checks to avoid access to sio ports 0x2e/0x4e or extending the range too far */
+#define TRIM_MIN_IO_ADDRESS	0x100
+#define TRIM_MAX_IO_ADDRESS	0x1FFF
+
+#define TRIM_MAX_CHANNELS	3		/* temp/fan/in only */
+#define TRIM_MAX_CH_SENSORS	3		/* 3 sensors per channel only, playing it safe */
+
+#define TRIM_MAX_LABEL_LEN	16
+#define TRIM_MAX_ACPI_HID_LEN	9
+#define TRIM_MAX_ACPI_UID_LEN	24
+#define TRIM_MAX_ACPI_METH_LEN	5		/* Method Name limited to 4 */
+
+#define TRIM_FLAG_SENS_REG_16BIT	0x1
+#define TRIM_FLAG_SENS_HAS_LABEL	0x2
+
+#define TRIM_FLAG_UNSAFE_RUN		0x80
+
+#define TRIM_WITH_LABEL(flags, label_flag) ((flags & TRIM_FLAG_SENS_HAS_LABEL) ? label_flag : 0)
+
+enum trim_method {
+	method_ioselect = 1,
+	method_iodirect,
+	method_acpi,
+};
+
+enum trim_sensor_type {
+	trim_type_temp = 0,
+	trim_type_fan,
+	trim_type_in,
+	trim_type_length,
+};
+
+struct trim_sensor {
+	enum trim_sensor_type type;
+	char label[TRIM_MAX_LABEL_LEN];
+	unsigned short flags;
+
+	int conv_mult;
+	int conv_div;
+	int conv_dvdnd;
+
+	unsigned short reg;
+	unsigned short reg_hi;
+
+	int acpi_arg0;
+	char acpi_method[TRIM_MAX_ACPI_METH_LEN];
+};
+
+struct trim_dev_args {
+	enum trim_method method;
+	unsigned short flags;
+
+	unsigned short chip_id;
+	unsigned short base_addr;		/* actual address, e.g 0xa45 when 0xa40 */
+	unsigned short reg_chip_id;		/* not exactly chip id, but any "id" */
+	unsigned short reg_chip_id_hi;
+	unsigned short reg_bank_sel;
+
+	char acpi_hid[TRIM_MAX_ACPI_HID_LEN];	/* spec says int or 7-8 string? */
+	char acpi_uid[TRIM_MAX_ACPI_UID_LEN];
+
+	int num_sensors;
+	struct trim_sensor *sensors;
+	int idnum;
+};
+
+#endif /* _TRIVIALMON_H_ */
-- 
2.39.2

