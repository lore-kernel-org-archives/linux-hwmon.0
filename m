Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50CF438FED;
	Fri, 15 May 2026 09:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836807; cv=none; b=ERgGFJnuHv3ZarEsPVifimcz4PQuTbXPoiJdVrjzQin+tD2F/JtcKMWE9a9QTXZMkZLUTrXz14A4Zz2YZrVChHrhvBStmlDcmoKdHLL0G9I5zBEXrfUxlvKhtwB+h/zR5U8hzyxCZ3B/zURiaezvNhu03wj37FQTPWmYSBByLMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836807; c=relaxed/simple;
	bh=fUUn0TdKfL0L65YktW9s4vS3M0ChxssfBo6NnIhL06A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ipekXGaLSF/1sTPyz/z9yyN7AAI8sj9OkSeVWCwKQFX10uXaGvmfx+tODvdUxHRD8bwpOIe5xRkXrbI0UMp1z5O3XVzZ8CyYh75culvNS+evV+yOhfxkLYTgRyx36R3A89eqQtA3i95rRzTft2w8K5g7XShHmECWAjC37VBThBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005156LT.eswin.cn (unknown [10.12.96.79])
	by app1 (Coremail) with SMTP id TAJkCgDniXMy5QZqeqwZAA--.38055S2;
	Fri, 15 May 2026 17:19:48 +0800 (CST)
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
	Huan He <hehuan1@eswincomputing.com>
Subject: [PATCH v5 0/2] Add driver support for ESWIN EIC7700 PVT controller
Date: Fri, 15 May 2026 17:19:42 +0800
Message-ID: <20260515091942.449-1-hehuan1@eswincomputing.com>
X-Mailer: git-send-email 2.47.1.windows.2
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgDniXMy5QZqeqwZAA--.38055S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw1kGrWfXr43uF15ZF4Utwb_yoW7CF4UpF
	W8WryYkF4DXrWSqrWDt3W09rWftan3JF47Ar4fWw18Z3W5K34jvFy8K3WYvFyDZrn5X3Zx
	ta4Yqw17CF1qyFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 drivers/hwmon/eic7700-pvt.c                   | 506 ++++++++++++++++++
 drivers/hwmon/eic7700-pvt.h                   |  99 ++++
 5 files changed, 681 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
 create mode 100644 drivers/hwmon/eic7700-pvt.c
 create mode 100644 drivers/hwmon/eic7700-pvt.h

-- 
2.25.1

