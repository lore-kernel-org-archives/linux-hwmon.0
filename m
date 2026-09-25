Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8206F3655FA;
	Fri, 25 Sep 2026 02:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790303018; cv=none; b=uPsFXSO6zr1SA434vvFExb8p7GEKdLJ9jOICMLIbocaGiHSVH0EEGZaCsWZBRcIqlFZg5btcbP3DmiExWW7vRjdGfKxkbLPbSb5plSmVkFuEnL6jeDNoYRMk4JXeiOSEIu3isfSYpDm/7tlTCbSD0ysarBVc3wiAe9n1hFicJiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790303018; c=relaxed/simple;
	bh=4vRNppN3FLumiUhSCw+3UtKUBCkiE/1MEBId+otF5Y0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s7foXsmvZ4vJ/CPQ0PEf9q7CYOuigUXLc4KWGVBtq+1hJhDw7f3pvftzBtgUPWNImqn7DV2MwefW53G13Ymz6hEjWas0TkU6CrNzxjDVGyVNvTKqezhXUr4mZB1GyV0jXZ6UpQB4fq84QbQLcMTc/vjNIP8ab19hsrcNJc+Y6r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lhkV36Zv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lhkV36Zv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790303015; x=1821839015;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=4vRNppN3FLumiUhSCw+3UtKUBCkiE/1MEBId+otF5Y0=;
  b=lhkV36ZvHmZf50jaEuiC59Gr6kTQ1MHwUSVlA1J7Uga+/8sOYsyMDofk
   QH0RpR13nmKHeqVGYQEPdQPgPKumQbHtjbu8X64ZG0+6e1timp9PZzlr5
   1EZQ4xRXpr5FxDdQmzerhPsmvG6w1YeU+TROrbGskrv+UwZLSyFdnT17w
   4zZQiOd5YOs7Ojj9FqzKcY++3a+vjsFDDouWQpQWR+xnFDI8r1wUBBsyh
   Vp9vSXoE7xqnPfITq8vbzM/NxaTKiCQOhhtNs0JbnWRygxvXH5KZPn+cb
   6S3AJp500IW5UuiGXKPOjpL42CTzWhaK6YoacmdrcUnga2k2GIIruiPxj
   A==;
X-CSE-ConnectionGUID: FwlG4xMLRTav3Q6yqTSCvw==
X-CSE-MsgGUID: dBrMrvnQS4aeR7/MtRcOvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="91107238"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="91107238"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:22:59 -0700
X-CSE-ConnectionGUID: VOqYqExYQmCP6QL4dXlDPA==
X-CSE-MsgGUID: Z06w/pnQQMuAWMmJAWQRag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="278920527"
Received: from unknown (HELO [172.25.112.21]) ([172.25.112.21])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 19:22:58 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Thu, 24 Sep 2026 19:33:22 -0700
Subject: [PATCH 3/3] hwmon: (coretemp) Add temp%d_fault sysfs attribute
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-coretemp-temp-fault-v1-3-1884f0ff97d5@linux.intel.com>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
In-Reply-To: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 ricardo.neri@intel.com, 
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790303618; l=6261;
 i=ricardo.neri-calderon@linux.intel.com; s=20250602;
 h=from:subject:message-id; bh=4vRNppN3FLumiUhSCw+3UtKUBCkiE/1MEBId+otF5Y0=;
 b=RJFcrYQvldkg009hpAnvxLFqQ0ETrNTFFNCl34JelbKNaL11bxMJmvxPLcCMCCiajMsVhirPB
 fEpgaPxy94mDlUFRuKGuKdJTpHn/0ZpaPaR9v4i9MTUw7dgAeKo2nzw
X-Developer-Key: i=ricardo.neri-calderon@linux.intel.com; a=ed25519;
 pk=NfZw5SyQ2lxVfmNMaMR6KUj3+0OhcwDPyRzFDH9gY2w=

The temp%d_input sysfs attribute reports the CPU core temperature
regardless of the valid bit (bit 31) in IA32_[PACKAGE]_THERM_STATUS.
Commit bf6ea084ebb5 ("hwmon: (coretemp) Do not return -EAGAIN for low
temperatures") established this behavior after observing that some Intel
CPUs do not set the valid bit while the temperature is too low to be
measured. The value reported is of more use than an error. Changing this is
not an option: the interface is long-established and userspace relies on
it never failing.

Userspace, however, cannot distinguish a genuinely low temperature from
one the CPU could not measure. Until that commit it could: reading
temp%d_input returned -EAGAIN. That signal was removed and nothing
replaced it. Report the inverse of the valid bit through the standard hwmon
temp%d_fault attribute. Its documented meaning is that the measurement
for that channel should not be trusted. Tools built on libsensors consume
the standard attribute.

temp%d_input continues to ignore the valid bit. A new update_temp() helper
refreshes the cached temperature and its fault state together, so both
attributes are served from the same reading of the status register.

Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
 Documentation/hwmon/coretemp.rst |  4 +++
 drivers/hwmon/coretemp.c         | 68 +++++++++++++++++++++++++++-------------
 2 files changed, 51 insertions(+), 21 deletions(-)

diff --git a/Documentation/hwmon/coretemp.rst b/Documentation/hwmon/coretemp.rst
index 349301683381..e3e3205b5155 100644
--- a/Documentation/hwmon/coretemp.rst
+++ b/Documentation/hwmon/coretemp.rst
@@ -50,6 +50,10 @@ All sysfs entries are named with their core_id (represented here by 'X').
 
 ================= ========================================================
 tempX_input	  Core temperature (in millidegrees Celsius).
+tempX_fault	  Set when the CPU reports the reading in tempX_input as
+		  invalid. Some CPUs do this while the temperature is too
+		  low to be measured. tempX_input still reports a value in
+		  this state; it is low or zero.
 tempX_max	  Maximum recommended operating temperature (Tcontrol).
 		  All cooling devices should be turned on.
 tempX_crit	  Maximum junction temperature (in millidegrees Celsius).
diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index 0ab6bbff5637..e0fb7c0ef4d0 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -45,6 +45,7 @@ enum coretemp_attr_index {
 	ATTR_LABEL,
 	ATTR_CRIT_ALARM,
 	ATTR_TEMP,
+	ATTR_TEMP_FAULT,
 	ATTR_TJMAX,
 	ATTR_TTARGET,
 	MAX_CORE_ATTRS = ATTR_TJMAX + 1,	/* Maximum no of basic attrs */
@@ -60,6 +61,9 @@ enum coretemp_attr_index {
 
 /*
  * Per-Core Temperature Data
+ * @temp_fault: The temperature in @temp is not to be trusted. Mirrors the
+ *		meaning of the tempX_fault attribute, and is therefore the
+ *		inverse of the valid bit the CPU reports in @status_reg.
  * @tjmax: The static tjmax value when tjmax cannot be retrieved from
  *		IA32_TEMPERATURE_TARGET MSR.
  * @last_updated: The time when the current temperature value was updated
@@ -72,6 +76,7 @@ enum coretemp_attr_index {
  */
 struct temp_data {
 	int temp;
+	bool temp_fault;
 	int tjmax;
 	unsigned long last_updated;
 	unsigned int cpu;
@@ -393,41 +398,62 @@ static ssize_t show_ttarget(struct device *dev,
 	return sprintf(buf, "%d\n", ttarget);
 }
 
-static ssize_t show_temp(struct device *dev,
-			 struct device_attribute *devattr, char *buf)
+/* Requires tdata->update_lock to be held. */
+static void update_temp(struct temp_data *tdata, struct device *dev)
 {
 	struct msr val;
-	struct temp_data *tdata = container_of(devattr, struct temp_data, sd_attrs[ATTR_TEMP]);
 	int tjmax;
 
-	mutex_lock(&tdata->update_lock);
-
 	/* Check whether the time interval has elapsed */
-	if (time_after(jiffies, tdata->last_updated + HZ)) {
-		tjmax = get_tjmax(tdata, dev);
-		rdmsrq_on_cpu(tdata->cpu, tdata->status_reg, &val.q);
-		/*
-		 * Ignore the valid bit. In all observed cases the register
-		 * value is either low or zero if the valid bit is 0.
-		 * Return it instead of reporting an error which doesn't
-		 * really help at all.
-		 */
-		tdata->temp = tjmax - ((val.l >> 16) & 0xff) * 1000;
-		tdata->last_updated = jiffies;
-	}
+	if (!time_after(jiffies, tdata->last_updated + HZ))
+		return;
+
+	tjmax = get_tjmax(tdata, dev);
+
+	rdmsrq_on_cpu(tdata->cpu, tdata->status_reg, &val.q);
+
+	/*
+	 * Cache the temperature even when the CPU reports it as invalid. In
+	 * all observed cases the register value is either low or zero if the
+	 * valid bit is 0, which is of more use than reporting an error.
+	 * tempX_fault tells userspace when the temperature is unreliable.
+	 */
+	tdata->temp_fault = !((val.l >> 31) & 1);
+	tdata->temp = tjmax - ((val.l >> 16) & 0xff) * 1000;
+	tdata->last_updated = jiffies;
+}
+
+static ssize_t show_temp(struct device *dev,
+			 struct device_attribute *devattr, char *buf)
+{
+	struct temp_data *tdata = container_of(devattr, struct temp_data, sd_attrs[ATTR_TEMP]);
+
+	guard(mutex)(&tdata->update_lock);
+	update_temp(tdata, dev);
 
-	mutex_unlock(&tdata->update_lock);
 	return sprintf(buf, "%d\n", tdata->temp);
 }
 
+static ssize_t show_temp_fault(struct device *dev,
+			       struct device_attribute *devattr, char *buf)
+{
+	struct temp_data *tdata = container_of(devattr, struct temp_data,
+					       sd_attrs[ATTR_TEMP_FAULT]);
+
+	guard(mutex)(&tdata->update_lock);
+	update_temp(tdata, dev);
+
+	return sprintf(buf, "%d\n", tdata->temp_fault);
+}
+
 static int create_core_attrs(struct temp_data *tdata, struct device *dev)
 {
 	static ssize_t (*const rd_ptr[TOTAL_ATTRS]) (struct device *dev,
 			struct device_attribute *devattr, char *buf) = {
-			show_label, show_crit_alarm, show_temp, show_tjmax,
-			show_ttarget };
+			show_label, show_crit_alarm, show_temp, show_temp_fault,
+			show_tjmax, show_ttarget };
 	static const char *const suffixes[TOTAL_ATTRS] = {
-		"label", "crit_alarm", "input", "crit", "max"
+		"label", "crit_alarm", "input", "fault", "crit", "max"
 	};
 	int i;
 

-- 
2.43.0

