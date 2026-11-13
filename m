Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592893;
	b=ZSB6sL8/It93U7Vf59rIQ2LctXnUXHaK60V50Gbf4fjP5jsDSy+t6ZOa/3Su2CQJ7Tm4
	 zCi9TYnXFcteGQzU+28WauLEATk3AsldN/ImB0qUYyOUfNWeVMdy88NFTnZbx2WQfwSPc
	 kd3w13hyEAQsckxWieVzQBrqSzYJsWTPFVPcaSqaKAnX7XLKUNCPvCXF21I6xpzsvgr+J
	 jmI5OXjSrLDbKna+QinWNCIoNImyaWAiBSMJmTPduKaqJ71eXU8lswmbZnCUjBBoohcpK
	 eNdW6CT6aXwwFaHCHVW/U/1dsMXdnyvCr6aHWNvqenROnYWc2V0tiATNi9PNg8pr8fQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592893;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QbVuTswcjZuEWKxQRXbfUXYhkt0gQJq2rqVw2UUvjcA=;
	b=1Dwy6Kuja53eJZlisEuMF4RvOPa5CEwHS2ITbZ+BAbqjwSLxqayCTZaAR/sFNzDiW2RX
	 U5a3WsR5Iw3ET7VvC3gN9tM/YaMj343GK4MHbS2qUn+HtyEgUGnUXTBa9hLxshzz4Am4i
	 Y536OZ6+2is6LCkwvyDtXdbHSYw5yLQlYuq/VUJzwr55RtRDxQwi3bN6mmm1WGp0Sx78x
	 BMIg2hJT26qQvtJ/GeKZ4LUpl4aiKZDv6h7ns9csfp1JYorBdi30/6Dd8yt+WUbG0BRvE
	 nYcPhEFH50j0b2IhatplI0+UkycM5B9W+1n8T8VZmpRXhEi5Fp1bMvHk3mx7aR6mHsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9viOV1L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74838606B20E;
	Fri, 13 Nov 2026 18:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F9viOV1L
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794592893;
	b=qB7SsftdqLzNnXbxKm/G1gEOrqIyWjz59afSFTYPB0q00/FPK/CcgXwsP4TGRb4ycI8L
	 lm5Hn4p7bDiPe1SpsrzS9g62kvoivuNa/k+N0dAeH7ILGB+eB9yHclZSpj5AnRtlSzLCr
	 yeKcND5vgi3sYshgjNldEam/CTh7fMWlKV8fqkcbv2PTYbEQMJnJvPqBTQpblv4UjpaFL
	 XWSBd++5Smv6KAXkMumtO8jQMTXvjhAAcWnEA5bZXY4kJSd+LfJrkYFmhqAwqcWw16DPr
	 NZYduojyKHWVz2xX6w0mSQB+cI8wPK6Ou6RH2K54xo54zuaml8jdNCkm9rg2HvUFGWw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794592893;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QbVuTswcjZuEWKxQRXbfUXYhkt0gQJq2rqVw2UUvjcA=;
	b=Tl2StJNrLmVpiukoYTubSZRlsJAWWLMGNV0ukgYhZvmRrzdE6zcAXlLN78Y2LToJRooC
	 JnO7cEiC2H5b1r/Fw/BGMJLkJdL3kF3diOeHLm+bADpTSb6VVWxhF067Vvm5guhzXagkd
	 +ptLY2SfnqlEKeGebagQEXeIsQ4vvAcWqgRQjOAFWgbKCCxR9mhECBRasnmfsJsDEszHd
	 caomgdW2ck80NXLnMUAxsuKKHHaVO+U4KRNzzxwg2Wmf01of2t+gsK5rTF1y3h/Aj1/jR
	 IAHMUTrj2kHb/J+21SQpyw/CwBOXCkHdVwndvWRQfBuHsZkaZVcu/Vx8JPcMLdlrPow==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 44EB41F000C5;
	Fri, 13 Nov 2026 18:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592893;
	bh=QbVuTswcjZuEWKxQRXbfUXYhkt0gQJq2rqVw2UUvjcA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=F9viOV1LhNSrNfoJl2ffoYp20GMhI20zusjjTIViioB7a6c5Dr0+OdIGeVkvmhX6W
	 i3mjWam5NiEZk0tamm41l7ttVqeZ01GumFRdY/KyN6dR8Uqif4eGrMUCRoT+9yM6uO
	 ho/vdAgaBDYSz4nxEnTslw56Qdtgm6MY7PU3Zixn76mFgvoONOXs7C38X5I5neiGid
	 zCDKEYo3KSsIA5b1xJaBhI9QJKXbVMwo0poeRJXsoISdF5wQe+hvXkVItTMLxZPfHv
	 h6YY4PacNMrqo+Y/JalTZyngUnE66dFX7QaVDgivptieUZv7xiEUeYEyAItzmbJMkL
	 Km8KSsks/AoqQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CA44F49A23;
	Fri, 13 Nov 2026 18:01:31 +0000 (UTC)
From: Ziqiang Xia via B4 Relay <devnull+xiazq123666.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 10:01:30 -0800
Subject: [PATCH RFC 1/2] Documentation: ABI: testing: Add emdoor-intel-wmi
 sysfs ABI
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261113-emdoor-intel-wmi-rfc-v1-1-d77ecf23693b@gmail.com>
References: <20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com>
In-Reply-To: <20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Ziqiang Xia <xiazq123666@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794592890; l=2451;
 i=xiazq123666@gmail.com; s=20261113; h=from:subject:message-id;
 bh=JHu1JfOu+vTVqHRdgjqMlj3/Yz1nLajuOsJbpAPgyKc=;
 b=Mo0Xf4pqFde80uUR9hBzy/qvLAl6CZ370bTKfZ4CZRrZ6ZchimFTmH7ZL2zQ0a2pUkoqC2iCX
 2llfC+aJZfEChggdkmL2qQ42MDDAFTnyT9eUUHKUq/PE4ggyefRxTsP
X-Developer-Key: i=xiazq123666@gmail.com; a=ed25519;
 pk=mrJQOUoyemvqamFAwqXZF59Z8eZnI11ZI+BEtDNxq7Q=
X-Endpoint-Received: by B4 Relay for xiazq123666@gmail.com/20261113 with
 auth_id=1513
X-Original-From: Ziqiang Xia <xiazq123666@gmail.com>
Reply-To: xiazq123666@gmail.com
Content-Transfer-Encoding: 7bit

From: Ziqiang Xia <xiazq123666@gmail.com>

Document the fn_lock, win_lock, touchpad_enabled, and auto_power_on
sysfs attributes exposed by the Emdoor Intel EWMI platform driver.

Signed-off-by: Ziqiang Xia <xiazq123666@gmail.com>
---
 .../ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi  | 28 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++++
 2 files changed, 34 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi b/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi
new file mode 100644
index 000000000..e139d2929
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi
@@ -0,0 +1,28 @@
+What:		/sys/bus/wmi/devices/0B30FD67-1B62-4FCA-B10B-50DC7ADE6A39-*/fn_lock
+What:		/sys/bus/wmi/devices/0B30FD67-1B62-4FCA-B10B-50DC7ADE6A39-*/win_lock
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	platform-driver-x86@vger.kernel.org
+Description:
+		(RW) Current Fn-lock or Windows-key-lock state ("0" or "1")
+		queried via GFLS (0x03/0x03) / GWLS (0x03/0x01) and updated
+		via SFLS (0x03/0x04) / SWLS (0x03/0x02) followed by settling
+		delay and readback verification.
+
+What:		/sys/bus/wmi/devices/0B30FD67-1B62-4FCA-B10B-50DC7ADE6A39-*/touchpad_enabled
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	platform-driver-x86@vger.kernel.org
+Description:
+		(RO) Firmware touchpad enable state ("0" or "1") queried via
+		GTPS (0x03/0x07).
+
+What:		/sys/bus/wmi/devices/C75665A3-4382-4646-ADC8-C81AE146E455-*/auto_power_on
+Date:		November 2026
+KernelVersion:	7.4
+Contact:	platform-driver-x86@vger.kernel.org
+Description:
+		(RW) AC power-on recovery setting ("0" or "1"), backed by
+		board EC register 0xF5 (0x00=off, 0xa0=on) and updated
+		through standard WMI method WMCC followed by settling delay
+		and EC readback verification.
diff --git a/MAINTAINERS b/MAINTAINERS
index 981eb3fdb..70c976ffe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9848,6 +9848,12 @@ T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/em28xx*
 F:	drivers/media/usb/em28xx/
 
+EMDOOR INTEL EWMI DRIVER
+M:	Ziqiang Xia <xiazq123666@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi
+
 EMMC CMDQ HOST CONTROLLER INTERFACE (CQHCI) DRIVER
 M:	Adrian Hunter <adrian.hunter@intel.com>
 M:	Asutosh Das <quic_asutoshd@quicinc.com>

-- 
2.56.1


