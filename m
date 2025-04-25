Received: from 13.mo583.mail-out.ovh.net (13.mo583.mail-out.ovh.net [87.98.182.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AA2459F0
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Apr 2025 11:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.182.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745581288; cv=none; b=VAswRGFI/3Qzug6SJnkR6o76pmeIg/dI3LFmZ9KqAWrxzoPZ6hwQ7b/d4tur5pDTighgPLQuNR+vY2cTeLwqEourKEaNW+DQFGNWnwmwi7yO5jhPDujoe4B1+DQVt3VV1qdUg05IEDrFIO03anSpHx5zFc2fwhktsfhyFGs5nJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745581288; c=relaxed/simple;
	bh=1tBiExbO/dqP9Y43zSGXcf1iO42e1kbQ/zg5CeWF7Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SQ5ZX8y4dzT9t8kmzwVzPNSKaIYcch5YSPCZ+m5fM70Vpp6qqOGQ3RriBswAMPwMddD5QWkF5gKsbaJE8gNvAE+tjuYopPN8cmYEQtuViUjzmaFL41Got7HFWFTqmAVB1+yOS7/2kBXlGfzsSwK/F8qdG1aVYlJ9OLsIH1b416U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=T8Iaa2PJ; arc=none smtp.client-ip=87.98.182.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="T8Iaa2PJ"
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.148.126])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4ZkVmc5B0fz1WS4
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Apr 2025 11:22:08 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-tf4sx (unknown [10.110.164.115])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4E8B91FE7E;
	Fri, 25 Apr 2025 11:22:07 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-tf4sx with ESMTPSA
	id Aq1wBF9wC2jbfgAAIqE1SQ
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 25 Apr 2025 11:22:07 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R00148a07b6e-124c-464c-bd2d-5114462cf9c1,
                    189BF360F9312264DCAC3AB77C65C4FB1C0F3093) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	tomasz.pakula.oficjalny@gmail.com,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	michal.kopec@3mdeb.com,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v8 0/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Fri, 25 Apr 2025 13:21:46 +0200
Message-ID: <20250425112147.69308-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8097472130927955353
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqhhifmhhonhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=EIesLx6eJsuvXKzvGp2e9K8hauzF2VkB0WHxEx/C4CA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745580128; v=1;
 b=T8Iaa2PJg5vZkoFdio7iW0nt+gPmX9YKSCgpDTJ2L/B0Z4wHUtHXWF4YzgCBlSikRbbLstju
 TcSKN6Wwm+HApzYzqjNF1LhsEO1GNvqRoY92bSt7KeLI0K0q0SsAVTt2LQmMadmp+LKltxIcnPo
 mHLWVWMmEql3UF7FJEJv1ZofptzVMocGsnM9INYA7xopDsWSYNCTbNirMN84SsKVZnV1L35kf1e
 TftEiBPCvOWsO0nTEiTADxW1hSsIf7Hacv15P28EL7WD6BoL4UBMnjkfhURzmIzDI6NsgJPYsE0
 pyU7MWIl3UiG5PPu1EHonBO+L7LsOoriwkomOt/3ImkWQ==

Introduce a driver for devices running Dasharo firmware. The driver
supports thermal monitoring using a new ACPI interface in Dasharo. The
initial version supports monitoring fan speeds, fan PWM duty cycles and
system temperatures as well as determining which specific interfaces are
implemented by firmware.

It has been tested on a NovaCustom laptop running pre-release Dasharo
firmware, which implements fan and thermal monitoring for the CPU and
the discrete GPU, if present.

Changes in v2:
- Remove redundant copyright information
- Turn dasharo_fill_* functions into single dasharo_fill_feature_caps
  function
- Code style fixes
- Turn large if / else blocks into switch / case
- Fix possible positive return values in hwmon read handler
- Change while loops to for loops
- Add local variable for data->sensors[data->sensors_count] in
  dasharo_fill_feature_caps
- Replace snprintf with scnprintf per Ilpo's review
- Keep the "ok" path silent

Changes in V3:
- Simplify dasharo_read_value_by_cap_idx arguments and rename to
  dasharo_read_channel

Changes in V4:
- Remove unnecessary linebreaks
- Simplify naming of variables
- Constify zone lookup table
- Remove unneeded includes
- Switch to platform_device API
- Remove unneeded driver remove handler
- Add myself to MAINTAINERS

Changes in V5:
- Fix up the MAINTAINERS entry
- Use PTR_ERR_OR_ZERO for the hwmon pointer in the register func
- Simplify if blocks in dasharo_hwmon_read
- Use ACPI_FAILURE instead of !ACPI_SUCCESS

Changes in V6:
- Validate input parameters in dasharo_read_channel
- Add default return code in dasharo_hwmon_read
- Return error if invalid channel is requested in hwmon_read_string
- Add missing include for ARRAY_SIZE
- Align line continuations in dasharo_probe

Changes in V7:
- Use cap count for bound checking in dasharo_read_channel

Changes in V8:
- Fix line breaks over 100 chars
- Remove unneeded empty line

Michał Kopeć (1):
  platform/x86: Introduce dasharo-acpi platform driver

 MAINTAINERS                         |   6 +
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 360 ++++++++++++++++++++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

-- 
2.49.0

