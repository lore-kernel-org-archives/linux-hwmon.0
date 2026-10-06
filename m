Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1787D4503E1;
	Tue,  6 Oct 2026 12:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291275; cv=none; b=Z++8g3J2LOajDPI0TbKSebDwlYF86//rpr++brF8jOqRAVMCvfCBGnoDgJw3OPvg9csN8NKtbXtoHMtgpcxvN5DAd/9Thqzr61g3IgGieW46FzFuCINKK6nYTeHTnTw+vN+DjtfgTciEU3oS0JEtZS8FRo/wVuEzt5tCwLfTvhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291275; c=relaxed/simple;
	bh=f6IAYwcrCk+Y0JiLWHhRpS+GzXmDGgNOUxGjDzM874c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TsSTa7OO7BQcinby3tmSfFGKXpCeaR2XvjH56Vaj1NAptXY1p1xdXUBHZByzUFGYb3uBlY4NLLnm1PT7NVLI0YWLNjvdIHVgPITv9uG1VULOv+9ykmK4mkI2YWWGAX5oDaQ22utpEkkkBY/0wBneCnTO1j3RtgDLNsXrJw5s8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BKJepJvA; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BKJepJvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791291272; x=1822827272;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=f6IAYwcrCk+Y0JiLWHhRpS+GzXmDGgNOUxGjDzM874c=;
  b=BKJepJvAlhx2BSAuQ9flurUbyLrbYH1mz20PYQT5qDrSpU7neBn4YMXV
   Inr7KYzEGArRd+0xrGOT8rQa4Mzk2Xh9G2SEn46BS5SjJ1FVJJXQjZeL8
   z+Ljm0+sthPat7MzAW9GQ5dC0Q0Dz0uPFtg/p5Eoi3juoeVVuaj+9BvM9
   fZB+UF3SudwBAuDvLt89VYx4SjMggoabs/HAjHjeNIH69echTrFaA3aiV
   +N52xU1Y+dK6aaCGMIcDIEeroBAw0BZIm6I1AnqMZaYPg6rppTeJ5sYvt
   vaNUnOWpU9ngQ8wmhJgV54dRyPmdS4YCgmB4he3UKBIRzBMbRVv2iWi4z
   g==;
X-CSE-ConnectionGUID: MaBKzO15TxWhHBVbQXA3Hw==
X-CSE-MsgGUID: zIZUrMLOQIaw5TTkYWEJsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94850388"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="94850388"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:54:29 -0700
X-CSE-ConnectionGUID: iDDkTCUdSWWyE/9g+d/VRw==
X-CSE-MsgGUID: D42SBJwdTOOTaBhVhxHqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="285044250"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:54:29 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Tue, 06 Oct 2026 06:04:56 -0700
Subject: [PATCH v2] hwmon: (coretemp) Return -ENODATA for invalid
 temperature readings
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-coretemp-enodata-v2-1-64e788acc7dc@linux.intel.com>
X-B4-Tracking: v=1; b=H4sIAPfxxGoC/x3MsQqAIBRG4VeJOyeYWkOvEg1mf3WHVDQikN49a
 fyGcwplJEamsSmUcHPm4CtU25A7rN8heK0mJdXQSamFCwkXzijgw2ovK2CU6Y2EXoyjmsWEjZ9
 /Oc3v+wEIoHBIYgAAAA==
To: Guenter Roeck <linux@roeck-us.net>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 ricardo.neri@intel.com, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791291906; l=4497;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=f6IAYwcrCk+Y0JiLWHhRpS+GzXmDGgNOUxGjDzM874c=;
 b=2I0MHVe9AlES+YTQAJKs6o4vH7sVhPPuXlENeEJKMHcJEW9shBZ1s+z5Y2o2Qqa0jIywksgTo
 G58h0AI2Pd3AIn/qkDxEL97RtlxL1YWdItD5U9Xlg9ms7DmhnWVEFd2
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

IA32_THERM_STATUS and IA32_PACKAGE_THERM_STATUS have a valid bit, bit 31.
The Intel SDM documents it only for the former, but the package register
implements it too: x86_pkg_temp_thermal has required it since commit
f1a18a105660 ("Thermal: CPU Package temperature thermal").

This driver checked the bit for both registers as well, until
commit bf6ea084ebb5 ("hwmon: (coretemp) Do not return -EAGAIN for low
temperatures") made it ignore the bit because some CPUs clear it while
the temperature is too low to be measured. Since then, temp%d_input
reports such a reading as a real temperature. Userspace cannot tell it
apart from a genuinely low one.

Fail the read with -ENODATA while the CPU reports the reading as invalid.
On a CPU that clears the bit, reading temp%d_input now fails where it
used to return a low value. sensors(1) shows N/A in its place.

Suggested-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/all/46f9f319-de71-412f-a424-6cb801478456@roeck-us.net/
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes in v2:
- Patches 1 and 2 of v1 have been applied. This is a rework of patch 3.
- Drop temp%d_fault and fail temp%d_input with -ENODATA instead. (Guenter)
- Link to v1: https://lore.kernel.org/r/20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com
---
 Documentation/hwmon/coretemp.rst |  3 +++
 drivers/hwmon/coretemp.c         | 21 +++++++++++++++------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index 349301683381..09f885a847e3 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -50,6 +50,9 @@ All sysfs entries are named with their core_id (represented here by 'X').
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
+		  Reading fails with -ENODATA while the CPU reports the
+		  temperature as invalid. Some CPUs do this when the
+		  temperature is too low to be measured.
 tempX_max	  Maximum recommended operating temperature (Tcontrol).
 		  All cooling devices should be turned on.
 tempX_crit	  Maximum junction temperature (in millidegrees Celsius).
diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 0ab6bbff5637..a9edbb4924a7 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -60,6 +60,8 @@ enum coretemp_attr_index {
 
 /*
  * Per-Core Temperature Data
+ * @temp_valid: Whether the CPU reported @temp as valid. @temp is not
+ *		reported when this is false.
  * @tjmax: The static tjmax value when tjmax cannot be retrieved from
  *		IA32_TEMPERATURE_TARGET MSR.
  * @last_updated: The time when the current temperature value was updated
@@ -72,6 +74,7 @@ enum coretemp_attr_index {
  */
 struct temp_data {
 	int temp;
+	bool temp_valid;
 	int tjmax;
 	unsigned long last_updated;
 	unsigned int cpu;
@@ -398,7 +401,8 @@ static ssize_t show_temp(struct device *dev,
 {
 	struct msr val;
 	struct temp_data *tdata = container_of(devattr, struct temp_data, sd_attrs[ATTR_TEMP]);
-	int tjmax;
+	int tjmax, temp;
+	bool valid;
 
 	mutex_lock(&tdata->update_lock);
 
@@ -407,17 +411,22 @@ static ssize_t show_temp(struct device *dev,
 		tjmax = get_tjmax(tdata, dev);
 		rdmsrq_on_cpu(tdata->cpu, tdata->status_reg, &val.q);
 		/*
-		 * Ignore the valid bit. In all observed cases the register
-		 * value is either low or zero if the valid bit is 0.
-		 * Return it instead of reporting an error which doesn't
-		 * really help at all.
+		 * Bit 31 indicates whether the reading is valid. Some CPUs
+		 * clear it while the temperature is too low to be measured.
+		 * Such a reading is not a temperature. Do not report it.
 		 */
+		tdata->temp_valid = (val.l >> 31) & 1;
 		tdata->temp = tjmax - ((val.l >> 16) & 0xff) * 1000;
 		tdata->last_updated = jiffies;
 	}
 
+	valid = tdata->temp_valid;
+	temp = tdata->temp;
 	mutex_unlock(&tdata->update_lock);
-	return sprintf(buf, "%d\n", tdata->temp);
+
+	if (!valid)
+		return -ENODATA;
+	return sprintf(buf, "%d\n", temp);
 }
 
 static int create_core_attrs(struct temp_data *tdata, struct device *dev)

---
base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
change-id: 20261003-coretemp-enodata-e424540e3b4c

Best regards,
-- 
Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

