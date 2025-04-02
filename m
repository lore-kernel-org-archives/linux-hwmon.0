Received: from 10.mo575.mail-out.ovh.net (10.mo575.mail-out.ovh.net [46.105.79.203])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAB8237179
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Apr 2025 10:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.105.79.203
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743590643; cv=none; b=Q806mMvBz17p2jmwT9RwE93oLE+mCeT711T7UueXZgOAQyUi1rS5luht9S9A0V+edWsJkHEXkBeXVVGDoLFYIBj2+CqrnW9G29YPXOXl7YDpclQlcDAMKmuRE1rgUze3HdzcaWu4jb7sF4aA98csO7jIRfhXoKsE0Aayp/4prt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743590643; c=relaxed/simple;
	bh=EzdHxW81hN6HIX2xMeDvPOVXkeyID9Trj+boirZ22Dc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E8GawQnHdhOV1gF9ea7Ro07/zpUPQE+0PcXcVOWjaKNLRANz3lEBmI3wVEZLhdZEbn+WAS57+X+dpqNapWO1sX7obb9sKpHciZ8FM4+d0sx+SJUNkD4XjEf//JQgBFX4EuSz32kxRR93j9QLf661BH88KGkfRogvXzgEDtq5mog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=Cr1Ci+h5; arc=none smtp.client-ip=46.105.79.203
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="Cr1Ci+h5"
Received: from director4.ghost.mail-out.ovh.net (unknown [10.108.25.166])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4ZSLtN4ffYz1rlM
	for <linux-hwmon@vger.kernel.org>; Wed,  2 Apr 2025 10:38:04 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-dpvsw (unknown [10.111.174.60])
	by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 3BC311FD46;
	Wed,  2 Apr 2025 10:38:03 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-dpvsw with ESMTPSA
	id QkQENooT7WfaGQAAFHTgiw
	(envelope-from <michal.kopec@3mdeb.com>); Wed, 02 Apr 2025 10:38:03 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R001bbd2d3bc-15be-44db-91fa-19141c932659,
                    5FCBFF1DCA98F7E0201DF243E115F3AF9CF69AF3) smtp.auth=michal.kopec@3mdeb.com
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
Subject: [PATCH v5 0/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Wed,  2 Apr 2025 12:37:45 +0200
Message-ID: <20250402103746.92575-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 1408500786861116825
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeehgeehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqhhifmhhonhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheejhegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=oOVF/Yn2fXr8gv4LEnTc2BmKgPUm9BdbOLjP0udGp1E=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743590284; v=1;
 b=Cr1Ci+h5E9AL1i3KvBE6HD2QgjUlsbP1VJhY/cc7Qc7Ymg3XH0BX/MG8YwHEHZ+Gl7VoMSet
 fuy4SwEUwKZCydTPplu5/ilP2s3bXxyyZaQl62TKRWqxe+Eb0dN9hcLSaxpHgWEI7nkqSG8Smbr
 GIW1qHAtnf14WJWkX0iAKjDv+QX+W946cl/cEnjlfzW6hVMgRKzNYjI2eivz8g3Oqy0UCoa3Dlk
 V7YknLZIc/w0vzUVZLjfsYQ+uCo0qOFdhV0+uxzEQaIa6GiDJ0PgLwgVo1tHRrtcVzXzxOLAA46
 mNA8fUBo/AjAb8aw34LQB6+yWKN7hHyfeWxOGWJyn55wA==

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

Changex in V5:
- Fix up the MAINTAINERS entry
- Use PTR_ERR_OR_ZERO for the hwmon pointer in the register func
- Simplify if blocks in dasharo_hwmon_read
- Use ACPI_FAILURE instead of !ACPI_SUCCESS

Michał Kopeć (1):
  platform/x86: Introduce dasharo-acpi platform driver

 MAINTAINERS                         |   6 +
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 345 ++++++++++++++++++++++++++++
 4 files changed, 364 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

-- 
2.49.0

