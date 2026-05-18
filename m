Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1D8383C80
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779129688; cv=none; b=fYDrspHlSKaulCNdfX2zDyyuKXPc/45mssQdQMI/TykSR21DML8E1NuZ16Tzsnvwn0yl3h1fYcv2+4iDZ97BaXpbYRAp3wWobge2qylqRZmF8eTIHlgYl0H2GVk/KqBytRoq2JKRc6FTqTEXQAldG13HuHsbRJqcfdHmc7gntY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779129688; c=relaxed/simple;
	bh=hG2us0VjneKIFIJFxN4jeg/lE8bpmENA8nnholiUizA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kM2fHgCRO7AvBkxpGggkEsZkCQ4n8zbvmRFPs+PZoltWWfWulztEAEIGG2woWirwaiAUXyMNJHY6/zC6PUFEegAZW7B/LtQFJgYbLOVE85tvcJZFqE3SBZf2ZU/PPAUgFaIplzhgZaUgIJz0Gsfo1kqLOI3+4e3x7fH17dkz4eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsmhoVVr; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsmhoVVr"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45ae6a0e523so1353812f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 11:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779129685; x=1779734485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZg22ZhGJMaOt5Df+ZHhboxIbuSeyw23ZlwI4pfXN4c=;
        b=KsmhoVVrwFZFNrByqfvXxwHhZZsaNZY24mGKxr3m/FXFtUk2WOS5sGVbqnLGiikG9F
         fzvSpC1PPfep9NvTgmx2a0WfM7fkE9fjVWn3/cgGdoDUSPbz9NkceQPeLo44TAtj5qai
         huLA+gqIqNkrU0kE4Jv9Ux93BRO0vz+ey2o9MZ2EWT6HjFNtGFKKEJTor+tVfIsdpqx8
         Q3nHdB2Pg/9FBFNTa+zlOtDNMNM17qsWAq5u7yKQSndH6nxiPlQCN2asKwGMkVWQ5kS+
         mi0giJBPqr3mJLRv6/rRB18MQ/khB4zCMP3j/WssuQph2Zw9OiwhpGeKEEgd2qjZ91Kg
         k0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779129685; x=1779734485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LZg22ZhGJMaOt5Df+ZHhboxIbuSeyw23ZlwI4pfXN4c=;
        b=XTsxP+vAC2C148qgSkY3CF7P8HErKAsXi5gg9BCM9LJ3sKDDAQ0Vbtk/bE0G6ySnyw
         9USnBim0N/XFsK/eScCBpbX8Kk8po15mQKNZzc8Z7Y0w+IhGdN/ApH7O76YwEpvEsZFZ
         SYOljZVtuy+oSkBd2PMguM2gbRUzdE6h1dvmim7W4m32YbR+vF07u1C7Rasu3McUIywM
         8/sdD8lDWRNUUoOEcBoSXJqUVlu80sHMCavYn63XOleHkGQFtT1nckJQJ89ZP/3c8a8H
         q7mK7g1+4Sy1CrmPdoFPonnst3T+r5dcjQ2lZlhE0qXkC7/BYgfGqPB6PaFh5ERO/t3G
         QqHw==
X-Forwarded-Encrypted: i=1; AFNElJ+c7b02bB66D67Kaeh72gQxoNcAExzOR0DX46Y6A6xqwn/avzD00IMo+0zM4YaGPLC/4yjUuNIL0rASgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHumn+TItXvZlYv5+xFA+zS8hv1qrPtYvV3srz7v38iMHoKFqi
	Fwiv+yLyUj5jqnw5P1mMCoGxt2XMnPJ6hD2jPO6tCG69IoErl/tJomwf
X-Gm-Gg: Acq92OEFAEJpg7sgs1kp1PiolofhX22YLhW2r0p2iXHewIFwMfABptxW76zZcNKEy0D
	r2iyl0z1E8jvMMp1J/qCfMOlTj6HCl3/fSLDAUv1LJLh4xWC9ee/Mqxgte6Bmc5An48qxFb5dp5
	upTWRLEIcnVwbaVSPqF5mVWzXzWl2XhWs/ZGv5dlhVoL96r3BCqMqVTQ3g+sIfWzcUmFX7xe0s2
	vvd8qUb/kz2d0mL4Hz74uOa5q96FpO1EiDnQRYik1arPbU+Nd6YWMd4Uge1gP+Yz6AE5KFiIS0+
	hrSO0FcMWuCgU6A/gdj1bIpW2uXmI8Z45CTHJq+JORux0MXsZ/3OcO4uC2/9c7qhN+DTuDo99u6
	4xIhzpsqhBlr131EWxlVcIz2ZQj7/wRDqhRjIIfu7Po8hgI9UMCy2MMU0sbvrjVL9PDFXylygqZ
	xyaBvASjI=
X-Received: by 2002:a05:6000:2c10:b0:44a:525b:2851 with SMTP id ffacd0b85a97d-45e5c367149mr25942038f8f.10.1779129684842;
        Mon, 18 May 2026 11:41:24 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e768c4fsm39305594f8f.8.2026.05.18.11.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:41:24 -0700 (PDT)
From: Louis Sautier <sautier.louis@gmail.com>
To: Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Guenter Roeck <linux@roeck-us.net>,
	MPT-FusionLinux.pdl@broadcom.com,
	linux-scsi@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] scsi: mpt3sas: add hwmon support
Date: Mon, 18 May 2026 20:41:09 +0200
Message-ID: <20260518184109.770185-3-sautier.louis@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518184109.770185-1-sautier.louis@gmail.com>
References: <20260518184109.770185-1-sautier.louis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Expose the IOC and board temperature sensors of LSI / Broadcom SAS
HBAs through hwmon. Readings come from MPI IO Unit Page 7 via the
accessor added in the preceding patch.

The same fields are exposed by Broadcom's userspace tooling
through the /dev/mpt[23]ctl ioctl path (typically root-only):
IOCTemperature and BoardTemperature in lsiutil; ROC and Controller
in storcli. With this driver, sensors(1) shows them unprivileged:

  $ sensors mpt3sas-pci-0200
  mpt3sas-pci-0200
  Adapter: PCI adapter
  IOC:          +42.0°C

Each channel is gated independently by its *TemperatureUnits field
through is_visible(); cards that populate only one sensor expose
only one input file, and cards that populate neither do not register
an hwmon device.

Built into mpt3sas.ko under a new CONFIG_SCSI_MPT3SAS_HWMON Kconfig
option.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Louis Sautier <sautier.louis@gmail.com>
---
 drivers/scsi/mpt3sas/Kconfig         |   9 ++
 drivers/scsi/mpt3sas/Makefile        |   2 +
 drivers/scsi/mpt3sas/mpt3sas_base.h  |  17 +++
 drivers/scsi/mpt3sas/mpt3sas_hwmon.c | 200 +++++++++++++++++++++++++++
 drivers/scsi/mpt3sas/mpt3sas_scsih.c |   6 +
 5 files changed, 234 insertions(+)
 create mode 100644 drivers/scsi/mpt3sas/mpt3sas_hwmon.c

diff --git a/drivers/scsi/mpt3sas/Kconfig b/drivers/scsi/mpt3sas/Kconfig
index c299f7e078fb..638acd2c6623 100644
--- a/drivers/scsi/mpt3sas/Kconfig
+++ b/drivers/scsi/mpt3sas/Kconfig
@@ -73,6 +73,15 @@ config SCSI_MPT3SAS_MAX_SGE
 	can be 256. However, it may decreased down to 16.  Decreasing this
 	parameter will reduce memory requirements on a per controller instance.
 
+config SCSI_MPT3SAS_HWMON
+	bool "LSI MPT Fusion SAS hwmon support"
+	depends on SCSI_MPT3SAS && HWMON
+	depends on !(SCSI_MPT3SAS=y && HWMON=m)
+	help
+	Say Y here to expose the IOC and board temperature sensors of
+	LSI / Broadcom SAS HBAs (such as the 9300, 9400, and 9500 series)
+	through hwmon. See Documentation/hwmon/mpt3sas.rst for details.
+
 config SCSI_MPT2SAS
 	tristate "Legacy MPT2SAS config option"
 	default n
diff --git a/drivers/scsi/mpt3sas/Makefile b/drivers/scsi/mpt3sas/Makefile
index e76d994dbed3..9a2f3ce4158a 100644
--- a/drivers/scsi/mpt3sas/Makefile
+++ b/drivers/scsi/mpt3sas/Makefile
@@ -9,3 +9,5 @@ mpt3sas-y +=  mpt3sas_base.o     \
 		mpt3sas_trigger_diag.o \
 		mpt3sas_warpdrive.o \
 		mpt3sas_debugfs.o \
+
+mpt3sas-$(CONFIG_SCSI_MPT3SAS_HWMON) += mpt3sas_hwmon.o
diff --git a/drivers/scsi/mpt3sas/mpt3sas_base.h b/drivers/scsi/mpt3sas/mpt3sas_base.h
index c655742d0dde..63252f30343b 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_base.h
+++ b/drivers/scsi/mpt3sas/mpt3sas_base.h
@@ -1629,6 +1629,7 @@ struct MPT3SAS_ADAPTER {
 	u8		is_aero_ioc;
 	struct dentry	*debugfs_root;
 	struct dentry	*ioc_dump;
+	struct mpt3sas_hwmon *hwmon;
 	PUT_SMID_IO_FP_HIP put_smid_scsi_io;
 	PUT_SMID_IO_FP_HIP put_smid_fast_path;
 	PUT_SMID_IO_FP_HIP put_smid_hi_priority;
@@ -2049,6 +2050,22 @@ void mpt3sas_destroy_debugfs(struct MPT3SAS_ADAPTER *ioc);
 void mpt3sas_init_debugfs(void);
 void mpt3sas_exit_debugfs(void);
 
+#if IS_ENABLED(CONFIG_SCSI_MPT3SAS_HWMON)
+int mpt3sas_hwmon_register(struct MPT3SAS_ADAPTER *ioc);
+void mpt3sas_hwmon_unregister(struct MPT3SAS_ADAPTER *ioc);
+#else
+static inline int
+mpt3sas_hwmon_register(struct MPT3SAS_ADAPTER *ioc)
+{
+	return 0;
+}
+
+static inline void
+mpt3sas_hwmon_unregister(struct MPT3SAS_ADAPTER *ioc)
+{
+}
+#endif
+
 /**
  * _scsih_is_pcie_scsi_device - determines if device is an pcie scsi device
  * @device_info: bitfield providing information about the device.
diff --git a/drivers/scsi/mpt3sas/mpt3sas_hwmon.c b/drivers/scsi/mpt3sas/mpt3sas_hwmon.c
new file mode 100644
index 000000000000..26227a992f35
--- /dev/null
+++ b/drivers/scsi/mpt3sas/mpt3sas_hwmon.c
@@ -0,0 +1,200 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardware monitoring (hwmon) support for the LSI / Broadcom mpt3sas
+ * SAS HBA driver. Exposes the IOC and board temperature sensors by
+ * reading MPI IO Unit Page 7.
+ */
+
+#include <linux/err.h>
+#include <linux/hwmon.h>
+#include <linux/kernel.h>
+#include <linux/slab.h>
+
+#include "mpt3sas_base.h"
+
+struct mpt3sas_hwmon {
+	struct MPT3SAS_ADAPTER *ioc;
+	struct device *hwmon_dev;
+	bool ioc_present;
+	bool board_present;
+};
+
+/*
+ * Convert a (raw, units) reading to millidegrees Celsius.
+ * Returns -ENODATA when the sensor reports "not present" or
+ * unknown units. Temperature values are interpreted as signed
+ * two's-complement integers.
+ *
+ * The MPI2_IOUNITPAGE7_IOC_TEMP_* and MPI2_IOUNITPAGE7_BOARD_TEMP_*
+ * defines in mpi2_cnfg.h share the same values; the IOC ones are
+ * used for both channels.
+ */
+static int
+_hwmon_to_mdegc(s16 raw, u8 units, long *out)
+{
+	switch (units) {
+	case MPI2_IOUNITPAGE7_IOC_TEMP_CELSIUS:
+		*out = (long)raw * 1000;
+		return 0;
+	case MPI2_IOUNITPAGE7_IOC_TEMP_FAHRENHEIT:
+		/* (F - 32) * 5 / 9, expressed in milli-units */
+		*out = ((long)raw - 32) * 5000 / 9;
+		return 0;
+	default:
+		return -ENODATA;
+	}
+}
+
+static umode_t
+_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
+		  u32 attr, int channel)
+{
+	const struct mpt3sas_hwmon *h = drvdata;
+
+	if (type != hwmon_temp)
+		return 0;
+	if (attr != hwmon_temp_input && attr != hwmon_temp_label)
+		return 0;
+	if (channel == 0 && h->ioc_present)
+		return 0444;
+	if (channel == 1 && h->board_present)
+		return 0444;
+	return 0;
+}
+
+static int
+_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+	    u32 attr, int channel, long *val)
+{
+	struct mpt3sas_hwmon *h = dev_get_drvdata(dev);
+	Mpi2ConfigReply_t mpi_reply;
+	Mpi2IOUnitPage7_t page;
+	int r;
+
+	if (type != hwmon_temp || attr != hwmon_temp_input)
+		return -EOPNOTSUPP;
+
+	r = mpt3sas_config_get_iounit_pg7(h->ioc, &mpi_reply, &page);
+	if (r)
+		return r;
+
+	if (channel == 0)
+		return _hwmon_to_mdegc((s16)le16_to_cpu(page.IOCTemperature),
+				       page.IOCTemperatureUnits, val);
+	if (channel == 1)
+		return _hwmon_to_mdegc((s16)le16_to_cpu(page.BoardTemperature),
+				       page.BoardTemperatureUnits, val);
+	return -EOPNOTSUPP;
+}
+
+static const char * const mpt3sas_hwmon_temp_labels[] = {
+	"IOC",
+	"Board",
+};
+
+static int
+_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+		   u32 attr, int channel, const char **str)
+{
+	if (type != hwmon_temp || attr != hwmon_temp_label)
+		return -EOPNOTSUPP;
+	*str = mpt3sas_hwmon_temp_labels[channel];
+	return 0;
+}
+
+static const struct hwmon_channel_info * const mpt3sas_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp,
+			   HWMON_T_INPUT | HWMON_T_LABEL,
+			   HWMON_T_INPUT | HWMON_T_LABEL),
+	NULL,
+};
+
+static const struct hwmon_ops mpt3sas_hwmon_ops = {
+	.is_visible	= _hwmon_is_visible,
+	.read		= _hwmon_read,
+	.read_string	= _hwmon_read_string,
+};
+
+static const struct hwmon_chip_info mpt3sas_hwmon_chip_info = {
+	.ops	= &mpt3sas_hwmon_ops,
+	.info	= mpt3sas_hwmon_info,
+};
+
+/**
+ * mpt3sas_hwmon_register - register an hwmon device for the IOC
+ * @ioc: per adapter object
+ * Context: sleep.
+ *
+ * Succeeds without registering when no temperature sensors are present,
+ * so cards without thermal monitoring do not expose an empty hwmon node.
+ * Paired with mpt3sas_hwmon_unregister() from the driver's remove path.
+ *
+ * Return: 0 for success, non-zero for failure.
+ */
+int
+mpt3sas_hwmon_register(struct MPT3SAS_ADAPTER *ioc)
+{
+	struct device *parent = &ioc->pdev->dev;
+	struct mpt3sas_hwmon *h;
+	struct device *hwdev;
+	Mpi2ConfigReply_t mpi_reply;
+	Mpi2IOUnitPage7_t page;
+	int r;
+
+	h = kzalloc_obj(*h);
+	if (!h)
+		return -ENOMEM;
+
+	h->ioc = ioc;
+
+	r = mpt3sas_config_get_iounit_pg7(ioc, &mpi_reply, &page);
+	if (r) {
+		kfree(h);
+		return r;
+	}
+
+	h->ioc_present = page.IOCTemperatureUnits != MPI2_IOUNITPAGE7_IOC_TEMP_NOT_PRESENT;
+	h->board_present = page.BoardTemperatureUnits != MPI2_IOUNITPAGE7_BOARD_TEMP_NOT_PRESENT;
+
+	/*
+	 * A page where both *TemperatureUnits are NOT_PRESENT covers
+	 * two cases: cards that genuinely lack sensors, and firmware
+	 * errors that left the page zero-filled (the accessor mirrors
+	 * _config_request() behaviour). Either way: skip registration.
+	 */
+	if (!h->ioc_present && !h->board_present) {
+		kfree(h);
+		return 0;
+	}
+
+	hwdev = hwmon_device_register_with_info(parent, "mpt3sas", h,
+						&mpt3sas_hwmon_chip_info,
+						NULL);
+	if (IS_ERR(hwdev)) {
+		kfree(h);
+		return PTR_ERR(hwdev);
+	}
+
+	h->hwmon_dev = hwdev;
+	ioc->hwmon = h;
+	return 0;
+}
+
+/**
+ * mpt3sas_hwmon_unregister - tear down the hwmon device, if any
+ * @ioc: per adapter object
+ *
+ * Safe to call when registration was skipped (no sensors) or
+ * failed; in those cases ioc->hwmon is NULL and this is a no-op.
+ */
+void
+mpt3sas_hwmon_unregister(struct MPT3SAS_ADAPTER *ioc)
+{
+	struct mpt3sas_hwmon *h = ioc->hwmon;
+
+	if (!h)
+		return;
+	hwmon_device_unregister(h->hwmon_dev);
+	kfree(h);
+	ioc->hwmon = NULL;
+}
diff --git a/drivers/scsi/mpt3sas/mpt3sas_scsih.c b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
index 12caffeed3a0..dea78688cc9b 100644
--- a/drivers/scsi/mpt3sas/mpt3sas_scsih.c
+++ b/drivers/scsi/mpt3sas/mpt3sas_scsih.c
@@ -12562,6 +12562,7 @@ static void scsih_remove(struct pci_dev *pdev)
 	/* release all the volumes */
 	_scsih_ir_shutdown(ioc);
 	mpt3sas_destroy_debugfs(ioc);
+	mpt3sas_hwmon_unregister(ioc);
 	sas_remove_host(shost);
 	list_for_each_entry_safe(raid_device, next, &ioc->raid_device_list,
 	    list) {
@@ -13651,6 +13652,11 @@ _scsih_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	scsi_scan_host(shost);
+
+	if (mpt3sas_hwmon_register(ioc))
+		ioc_warn(ioc,
+			 "hwmon registration failed; temperatures not exposed\n");
+
 	mpt3sas_setup_debugfs(ioc);
 	return 0;
 out_add_shost_fail:
-- 
2.54.0

