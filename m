Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7549C40DFD7;
	Thu, 30 Apr 2026 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531292; cv=none; b=Pz9yzlV4wy1UT1QRUWoIYvSGR2Ix+2Rxc9pFmE/zW3Dyesu2kxT4hgCIt8QGUS2T/5lXI2PhD0K6xNVgFH4X6MCqfRZRD7oYU88ebtWEqStG/hk4x7PKcvLgVvb67Cv+XaX7L1XkKRsgxkmoEqByHSj9Vh+mSgUW+s5/VcNzABA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531292; c=relaxed/simple;
	bh=9vBeHWPbN5SET0NRCtn5jIv0vf6rWnPyhN396COklVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lzJ2GUDx/odTyaq7wcX3C2J0M+Mw8i1ahMvLoQEUEmDuBIcrO1sruX+rzb2m92O6WucBnJVAOFVLLUGpRNVFCAcZScsRf3tptM12id/BSP0K3Bkgp5lQUDcyiEA+s/EmBEwRru7fI2J+ePkUTu2VtG1Cdyyy8vO+4bxwvPMIq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005156LT.eswin.cn (unknown [10.12.96.79])
	by app2 (Coremail) with SMTP id TQJkCgCHnaCG+fJpS+cVAA--.31998S2;
	Thu, 30 Apr 2026 14:41:11 +0800 (CST)
From: hehuan1@eswincomputing.com
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	luyulin@eswincomputing.com,
	hehuan1@eswincomputing.com
Subject: [PATCH v4 0/2] Add driver support for ESWIN EIC7700 PVT controller
Date: Thu, 30 Apr 2026 14:41:07 +0800
Message-ID: <20260430064107.1598-1-hehuan1@eswincomputing.com>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgCHnaCG+fJpS+cVAA--.31998S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr1DKFyrCw18GFW7CF1Utrb_yoWrZF13pa
	y8WryYkF4DXrWSqFWDJ3WF9F4fJan3JFW3Ar4fWw18Z3Z8K34j9Fy8K3WjvFyDZrn3Xa43
	ta48Jr1xGF1DAFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHCJQUUUUU=
X-CM-SenderInfo: 5khk3tzqr6v25zlqu0xpsx3x1qjou0bp/

From: Huan He <hehuan1@eswincomputing.com>

Add support for the ESWIN EIC7700 PVT (Voltage, Temperature) sensor

Features:
The driver supports monitoring of voltage and temperature parameters
through the hardware monitoring subsystem. It provides an access to the
sampled Temperature and Voltage.

Test:
Tested this patch on the SiFive HiFive Premier P550 (which uses the ESWIN
EIC7700 SoC).

Updates:

  Changes in v4:
  - Update eswin,eic7700-pvt.yaml
    - Delete reviewed-by tag of Conor Dooley, because the label enum
      constraint is introduced
  - Update eic7700-pvt.c and eic7700-pvt.h
    - Remove the unused LVT/ULVT/SVT process-monitoring channels
    - Remove the probe-time power check since the PVT block is always
      powered on EIC7700 and the extra verification is unnecessary
    - Stop requesting the interrupt as shared and use the dedicated PVT IRQ
      only
    - Reorder probe initialization so the interface is initialized before
      the clock is disabled, avoiding register accesses with the clock gated
    - Fix runtime PM reference handling on error paths by balancing
      pm_runtime_get_noresume() with pm_runtime_put_noidle()
    - Add pm_runtime_put_noidle() handling for failed pm_runtime_get_sync()
      calls in hwmon read/write paths
    - Switch the PM callback registration from pm_sleep_ptr() to pm_ptr()

  Changes in v3:
  - Update eswin,eic7700-pvt.yaml
    - Remove redundant label property description and use 'label: true' to
      reference the definition in hwmon-common.yaml
    - Replace 'additionalProperties: false' with
      'unevaluatedProperties: false'
    - Remove the description for '#thermal-sensor-cells'
  - Update eic7700-pvt.c and eic7700-pvt.h
    - Fix clock reference count imbalance with Runtime PM:
      Replace devm_clk_get_enabled() with devm_clk_get() and manually
      manage clock enable/disable to avoid double-disable in remove() when
      Runtime PM is active. Clock is now enabled only during probe for
      eic7700_pvt_check_pwr(), then disabled before enabling Runtime PM,
      which takes full control of the clock thereafter
    - Add detailed comment explaining the spurious interrupt risk in
      eic7700_pvt_check_pwr()
    - Replace wait_for_completion_interruptible() with
      wait_for_completion_timeout() to prevent infinite wait

  Changes in v2:
  - Update eswin,eic7700-pvt.yaml
    - Reference the hwmon-common.yaml file
    - Remove the clock-names and reset-names properties
    - Move additionalProperties: false after the required block
    - Remove one example node to avoid redundancy
  - Update eic7700-pvt.c and eic7700-pvt.h
    - Remove unused sensor macros (PVT_SENSOR_FIRST, PVT_SENSOR_LAST,
      PVT_SENSORS_NUM)
    - Drop the unnecessary hwmon-sysfs.h header
    - Replace dynamic sensor info allocation with a static array and unify
      sensor labels
    - Remove unused hwmon_temp_type attribute
    - Eliminate redundant validation checks
    - Remove mutex and related locking, relying on hwmon core
      serialization
    - Replace per-sensor caches and completions with a single data cache
      and completion object
    - Remove pvt->sensor tracking. ISR no longer depends on the currently
      selected sensor
    - Move devm_add_action() registration after init_completion() for
      safer cleanup, and update cleanup function (pvt_clear_data)
    - Replace devm_reset_control_get_optional_exclusive() with
      devm_reset_control_get_exclusive_deasserted()
    - Replace eic7700_pvt_remove() with eic7700_pvt_disable_pm_runtime()
      and move it after PM runtime enable to avoid resource leaks on probe
      failure and remove clock disable and reset assert from
      eic7700_pvt_disable_pm_runtime() as it is already handled by devm_*
      framework
    - Remove redundant clock presence check in runtime_resume

  - Link to v1: https://lore.kernel.org/all/20260109090718.442-1-hehuan1@eswincomputing.com/

Huan He (2):
  dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
  hwmon: Add Eswin EIC7700 PVT sensor driver

 .../bindings/hwmon/eswin,eic7700-pvt.yaml     |  68 ++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/eic7700-pvt.c                   | 591 ++++++++++++++++++
 drivers/hwmon/eic7700-pvt.h                   |  99 +++
 5 files changed, 771 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
 create mode 100644 drivers/hwmon/eic7700-pvt.c
 create mode 100644 drivers/hwmon/eic7700-pvt.h

-- 
2.25.1

