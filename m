Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [207.46.229.174])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889F3390226;
	Thu, 11 Jun 2026 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.46.229.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781168733; cv=none; b=M+O4f1pk6mxxh5i9z/Vjcz2/r3gd32rH/QwOnc7Xlu+cjyer6T0ItLPCzNRM9j2ieBfaiDK+apPR5C68U7f0ywm9kMjqdT/uGuOkXfnfzMFXMbLD/IGlYFn0Xu6f8yviygfrkG5lrU5PP7Xg4Wz1GtL3QzNQwPKyOitRDUDK08M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781168733; c=relaxed/simple;
	bh=pHizmCAfXQI1dtVo74oqoHEUeeKBax2QAr7ygVBz//k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bk3kbKNpul/0D3SZxk8A/x9FrcQ0vCNEhqpZ29zH7XOHsIIPeDSaGvdGtXyyPk7bwOdxHFXmqR7LXbJE/gQjCvpCOOAejrCmraFUdV1SHi8M/d/IBt1KLVitFBGWcCo+8HAq5p/CP6Y08zTmOAZs/6rh/b2XWTVWpab7Qbo1RgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=207.46.229.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005156LT.eswin.cn (unknown [10.12.96.79])
	by app2 (Coremail) with SMTP id TQJkCgD3DKBEeipqQsUmAA--.10346S2;
	Thu, 11 Jun 2026 17:05:10 +0800 (CST)
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
	dongxuyang@eswincomputing.com,
	Huan He <hehuan1@eswincomputing.com>
Subject: [PATCH v7 0/2] Add driver support for ESWIN EIC7700 PVT controller
Date: Thu, 11 Jun 2026 17:05:05 +0800
Message-ID: <20260611090505.734-1-hehuan1@eswincomputing.com>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgD3DKBEeipqQsUmAA--.10346S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4UJFy3XryUZr1UJrWxtFb_yoWxXFykpF
	W8W3yYkF4DXrWSqFWDt3W09rWfJan3JFW3Ar4xWw18Z3W5K34jvFyfK3WYvFyDZrn5X3Wa
	qa4Yqw17C3WqyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmjgxUUUUU=
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

  Changes in v7:
  - Remove the unused reset control pointer from struct pvt_hwmon and keep
    the reset control handle local to eic7700_pvt_probe()
  - Update eic7700_pvt_init_iface() to disable PVT_ENA_EN before clearing
    the interrupt status, preventing a possible level-triggered interrupt
    storm if the bootloader leaves the conversion engine running
  - Update eic7700_pvt_disable_pm_runtime() to explicitly disable runtime
    PM and avoid an unbalanced disable_depth

  Changes in v6:
  - Fix the !CONFIG_PM probe error path by disabling the clock if IRQ
    request fails before the PM cleanup action is registered
  - Replace pm_runtime_put_noidle() with pm_runtime_put() in the IRQ
    handler to avoid a runtime PM reference-count race with the read path
  - Remove the unused pvt_clear_data() devres action and its associated
    devm_add_action() registration

  Changes in v5:
  - Update eswin,eic7700-pvt.yaml
    - Drop the label enum constraint and remove label from the required
      list
    - Add '#thermal-sensor-cells' to the required list
    - Rename the example node to the generic sensor@... form
    - Update the binding description to describe one temperature sensor
      and one voltage sensor
  - Update eic7700-pvt.c
    - Register the hwmon device with the fixed name "pvt"
    - Remove label-based instance identification from the driver
    - Fix CONFIG_PM=n support by keeping the clock enabled when runtime PM
      is unavailable
    - Add pm_runtime_force_suspend() in the cleanup path to avoid leaving
      the device active during unbind
    - Switch system sleep callbacks to pm_runtime_force_suspend() and
      pm_runtime_force_resume()
    - Guard ISR register accesses with pm_runtime_get_if_active()
    - Add synchronize_irq() on the timeout path to avoid stale completion
      races
    - Remove temp_offset support because the raw trim register does not
      match the hwmon ABI
    - Align the commit message with the implementation (one temperature
      sensor, one voltage sensor)

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

 .../bindings/hwmon/eswin,eic7700-pvt.yaml     |  63 +++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/eic7700-pvt.c                   | 497 ++++++++++++++++++
 drivers/hwmon/eic7700-pvt.h                   |  98 ++++
 5 files changed, 671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
 create mode 100644 drivers/hwmon/eic7700-pvt.c
 create mode 100644 drivers/hwmon/eic7700-pvt.h

-- 
2.25.1

