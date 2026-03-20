Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1469F2D73A1
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 10:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774004368; cv=none; b=kQEceSbsGO0K3wUKE4gYxlYaXpGqJLEmYlKje27glDL63cpzCKhx29Xt/Sg785eSu23TqmQdIAERpBJK3BVg1NSVjvzo/6E26OIHmjiE0JdOJtP42pYMuXhKGaDe5QUotbcqK+sjdCQlVecpNcqqCIyzTdDZbYPZHBHc0m/FXOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774004368; c=relaxed/simple;
	bh=ueAMrGHDoawb4zzO1qxqaoFpEpkNBTxL0fcirYINgqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EhJfT/WNzv4dc5Zovk2kKevu4HyHyRhdat9y8HnrpfzNtr5le7dPWuV9QoI2p2IZRoVruc7ZAA8EIhyoB4Fy20BzXUBeguaqNJ8AFy4OpMK9Th8UwAozJFMPKg8a0/o3I9E7UYIPdx7vcHdVPJ6dTkp7ldBej2oQsutuT/1lJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c5hInp6K; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c5hInp6K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774004364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DUgYI+/6D1OUszdWIWII53ywK+I9fX9nCmEnQ/dDaTE=;
	b=c5hInp6KZb9OqGcydPZ+CFftf11vMv7Ead0KK/Fo/aQlfciJj6UVHd80rG5GmGmNDP/L29
	i+zFB3X+dZ0lByDRD6zBh6NYz56JzTZdKOD9h0YG73cMQJTvANHdPsFJtmERpYveLYlqMK
	8zvdf2c9PHtxDG/3h8EttwFIZ9S1zAk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-x_86A-xWOZygP_LDwi4XfA-1; Fri,
 20 Mar 2026 06:59:22 -0400
X-MC-Unique: x_86A-xWOZygP_LDwi4XfA-1
X-Mimecast-MFC-AGG-ID: x_86A-xWOZygP_LDwi4XfA_1774004361
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CB20B1955F6A;
	Fri, 20 Mar 2026 10:59:20 +0000 (UTC)
Received: from p16v.redhat.com (unknown [10.45.225.20])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 921491955F21;
	Fri, 20 Mar 2026 10:59:16 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jiri Pirko <jiri@resnulli.us>,
	Prathosh Satish <Prathosh.Satish@microchip.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Michal Schmidt <mschmidt@redhat.com>,
	Petr Oros <poros@redhat.com>,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net-next 0/3] dpll: zl3073x: add hwmon support
Date: Fri, 20 Mar 2026 11:59:12 +0100
Message-ID: <20260320105915.149068-1-ivecera@redhat.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add hwmon support to the ZL3073x DPLL driver, exposing die temperature
and input reference frequency measurements via the standard hwmon
interface.

Patch 1 registers an hwmon device with the standard temperature sensor
channel. The die temperature is only available on chip variants with the
ZL3073X_FLAG_DIE_TEMP flag and visibility is controlled via the
is_visible callback. The temperature register value in 0.1°C units is
converted to millidegrees Celsius.

Patch 2 adds the frequency measurement infrastructure. It extracts
common measurement latch logic into a zl3073x_ref_freq_meas_latch()
helper shared with the existing FFO measurement code, and adds
zl3073x_ref_freq_meas_update() to periodically read absolute input
reference frequencies in Hz.

Patch 3 exposes the measured frequencies via custom sysfs attributes
(freqN_input and freqN_label) since hwmon has no native frequency
sensor type. A cached device ready flag ensures freq_input_show()
returns -ENODATA without I2C access when firmware is not configured.

The hwmon registration is conditionally compiled using
IS_REACHABLE(CONFIG_HWMON) with a stub fallback.

Tested on Microchip EDS2 (pcb8385) platform:

  $ sensors zl3073x-i2c-1-70
  zl3073x-i2c-1-70
  Adapter: AT91
  temp1:        +24.2°C
  REF0P:        125 MHz
  REF0N:          0 Hz
  REF1P:        125 MHz
  REF1N:        125 MHz
  REF2P:         10 MHz
  REF2N:       1000 mHz
  REF3P:          0 Hz
  REF3N:       1000 mHz
  REF4P:         25 MHz
  REF4N:        170 kHz

  $ sensors -u zl3073x-i2c-1-70
  zl3073x-i2c-1-70
  Adapter: AT91
  temp1:
    temp1_input: 24.200
  REF0P:
    freq0_input: 124999220.000
  REF0N:
    freq1_input: 0.000
  REF1P:
    freq2_input: 125001660.000
  REF1N:
    freq3_input: 125001661.000
  REF2P:
    freq4_input: 10000000.000
  REF2N:
    freq5_input: 1.000
  REF3P:
    freq6_input: 0.000
  REF3N:
    freq7_input: 1.000
  REF4P:
    freq8_input: 25000000.000
  REF4N:
    freq9_input: 169598.000

Ivan Vecera (3):
  dpll: zl3073x: add hwmon support for die temperature
  dpll: zl3073x: add input reference frequency measurement
  dpll: zl3073x: add hwmon support for input reference frequencies

 drivers/dpll/zl3073x/Makefile |   1 +
 drivers/dpll/zl3073x/core.c   |  91 ++++++++++++++++----
 drivers/dpll/zl3073x/core.h   |   2 +
 drivers/dpll/zl3073x/hwmon.c  | 151 ++++++++++++++++++++++++++++++++++
 drivers/dpll/zl3073x/hwmon.h  |  16 ++++
 drivers/dpll/zl3073x/ref.h    |  14 ++++
 6 files changed, 261 insertions(+), 14 deletions(-)
 create mode 100644 drivers/dpll/zl3073x/hwmon.c
 create mode 100644 drivers/dpll/zl3073x/hwmon.h

-- 
2.52.0

