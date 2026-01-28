Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBB22D7DF3;
	Wed, 28 Jan 2026 10:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595305; cv=none; b=pNCJII9JKVpxBw8oGG0rCbTqlpir5CHotp4A5f/gVx2UMYW8u0WsXERBFh2toHxC22jOVXmCPzAOSqoBUWMASXLuSZ7eJJeeJnlhGW4A0BvVJjsoV3fvbuumxSK0uFObykK1fgiegnt/8dh+Dm80QcY3WIKpzSUFFFALgkMpvew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595305; c=relaxed/simple;
	bh=UnvHFCUVQQlu6NdzOns/vxEe64tjvztMJQ8UYIDWtWE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fIC6/gcqCXS8OSXAG2DxgcqzVm4NcqIseXJ84b9hO3uF3GFV2j2gDUjYAo8UEjfZxf0USQF9BMfps8hVp3xRUzDu/tnNMmhh1UCndBNSnSFfn8ks7byL9ML5JlOoL9J0w/JBnV4r2P8Am6NC+I0jH5cAjE/dz7pBScfutn0GnB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005182LT.eswin.cn (unknown [10.12.96.155])
	by app1 (Coremail) with SMTP id TAJkCgBHlzeK4XlpxngAAA--.2598S2;
	Wed, 28 Jan 2026 18:14:36 +0800 (CST)
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
Subject: [PATCH v2 0/2] Add driver support for ESWIN EIC7700 PVT controller
Date: Wed, 28 Jan 2026 18:14:00 +0800
Message-Id: <20260128101400.859-1-hehuan1@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgBHlzeK4XlpxngAAA--.2598S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr48CFy7WrWkuFWfuw17Wrg_yoW5Gryrpa
	y8GrW5Cr4UWrWIqFZrJ3WF9FWfJan3JFW7Jr4xXwnYv3WDt34jvFy8K3WYkFyDZw1rXFy3
	tFyUtr4xC3WqyFJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

Add support for the ESWIN EIC7700 PVT (Process, Voltage, Temperature)
sensor

Features:
The driver supports monitoring of process, voltage and temperature
parameters through the hardware monitoring subsystem. It provides an
access to the sampled Temperature and Voltage.

Test:
Tested this patch on the SiFive HiFive Premier P550 (which uses the ESWIN
EIC7700 SoC).

Updates:

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

 .../bindings/hwmon/eswin,eic7700-pvt.yaml     |  70 ++
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/eic7700-pvt.c                   | 612 ++++++++++++++++++
 drivers/hwmon/eic7700-pvt.h                   | 106 +++
 5 files changed, 801 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/eswin,eic7700-pvt.yaml
 create mode 100644 drivers/hwmon/eic7700-pvt.c
 create mode 100644 drivers/hwmon/eic7700-pvt.h

-- 
2.25.1

