Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795681290;
	b=UAoDYQN23PyYTruXvy79ZCxqH/kGR/YVX7lTTWcjJNo6z3pMdjIq3OmiXYJViOVyWC6F
	 3dT9kP/P6tIgNtsV6+uiIWqc8Q9Lx11pecmgK8f9PY8ZdSwW4a+9m8DPSFM0cxJXrbN74
	 kAhou64Xcar+cxjEGitXpRVSmyH/wus0YlVA8sSBuF0rw7lEa7jq7kkHgHWBwKHDQVE9X
	 quT1Ro7TBaTSKzorAAW+pyYWswGswPj5frQtO8QVIVHkTZLb0850D3PAPydSR8XzAtCPS
	 or1mZzGXXJVUi+GbTvXke5DEeUbdgOefASmb2jcikQYSJ88XDe/6SNelflUaVgFKurw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681290;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Wo5MKvR70XCkVerTcR7xLh9cyMkvF7a2vdgvROGBbmM=;
	b=wq5SpzEJ31KzWqmirGVqIcpf/IW4Xi+s26msrMEB2SONre71izknpjdUR6aRaKv3FMgt
	 Pehqs4EMlYcBAK5t5cKbndDDR2341BF4+dsle8zaczWsg9npbYaPS+cpjPfPfDYOFVUwZ
	 MxE8bRDBYYB4VI6q18D+Pfg5HgpzLWF++llpt0BAhaWAmtiGnp2fzJ6oR5rFrzhZ3ZRbr
	 bxMVqYwjCRav2r43hZPmiA5DX1dtOFevGCYB/yCZtkA7dcLonxJc7w/Xhaa3l2x1ghHe4
	 rqmY+kGoLK/N4tQVLwBSV1nT5wTwBuhzJPBDvg1JlG+FftQilNiOfZcHQIQ9cPPobTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdqMHzJg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C57606A682;
	Thu, 26 Nov 2026 08:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdqMHzJg
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795681290;
	b=NKGpTLyn50Fso901PBzyzN0uc0qiylTKEKcmZXSrz2WMO94u3xirl6zh1R5rMAN4/+kt
	 oXByC9O65Opkz341fHmxOALJXQQjLK9jtrBcuAz5yw8mxoYKWO+VCJ2R7kbPcsgS23WTk
	 /7oyNRyT+gkeTxSSHvUhqw3gDXHvmAwUu18K7cDvG+/j5T0lnQ4LmVIju3fIc8I0lAZ/r
	 u54tqa9FMKARJSk8yJy7fzpO+cHP7g+mLjEfqTDuUu43kUwx29f8xYMqLMJHHSMHtR9/U
	 dMhooO/9vIQ+JNPvRYxk40aPqDDmjzTSZns4qoh2Zd2luGwBrEpJzXhRx+0qgeicZNQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795681290;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Wo5MKvR70XCkVerTcR7xLh9cyMkvF7a2vdgvROGBbmM=;
	b=KhBmYMJwH8hX/88rro9dqfq/EFLDb7Uqw0POVtSpiYkKou5jueSLw08gWoH2Dao8vfR5
	 RFGz+8vkISw/NQLKY4ml74+dmXreGgxqvDQwIDzNpvMRrRiTxwmHL1B5U4FXDaKCKf47V
	 xajjsOyPgz+QEP3Oz8VcQRJEL3n1lcRJKY9RrhYyVVqED2dZEym94+wlYovSq3kQvcBQb
	 BiEgBR3w1X2PzedC2RDLEtEMI5NhsS3lGQyE25d8tgF0EiYH1ypWkH59xkQopyVY7WVXf
	 UyBCZ1FBGMl7uhqXEZnFAZLrSZW3iR+ryZMQ6C5wq0mqukPc0Kn4JLLV9hrol8u4sCA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E03C1F000F2;
	Thu, 26 Nov 2026 08:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795681290;
	bh=Wo5MKvR70XCkVerTcR7xLh9cyMkvF7a2vdgvROGBbmM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jdqMHzJgSA9xxVHAoXhAE4i+V1AnGOVYXFzQ2h/daxVan5r02jAenq8FPtMEQRfEb
	 cSIXGHdPq2wKTrog+IzztfzlZ3zM6LVkHlW4DkKLVcgDmz1GIlHVOiw+rNsaWQSaYb
	 SeoNvq7U09Nu0OGU1BHquZ3zeDK/vRWBBVDPEMlMOMo3SxNNwEZacI8S4RJoIHwrOd
	 +A9FIWMFKwryYInfpVLsHTiKK5I51fAa3qb1XKwdk9crWBFKOQ934GaRh8ECGJpVr2
	 TMa0UQVd2FRrNNXfMemz8Cz9y5CpfliBuHVciLEWGys1QrhvNxr/gp/3ciU5DEKwjO
	 HtF0RDFVKT6mA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 18A724D2FE;
	Thu, 26 Nov 2026 08:21:19 +0000 (UTC)
From: Ziqiang Xia via B4 Relay <devnull+xiazq123666.gmail.com@kernel.org>
Date: Thu, 26 Nov 2026 00:21:18 -0800
Subject: [PATCH v3 1/2] Documentation: ABI: testing: Add emdoor-intel-wmi
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
Message-Id: <20261126-emdoor-intel-wmi-rfc-v3-1-7dfbb70f04a9@gmail.com>
References: <20261126-emdoor-intel-wmi-rfc-v3-0-7dfbb70f04a9@gmail.com>
In-Reply-To: <20261126-emdoor-intel-wmi-rfc-v3-0-7dfbb70f04a9@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Ziqiang Xia <xiazq123666@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681277; l=1523;
 i=xiazq123666@gmail.com; s=20261113; h=from:subject:message-id;
 bh=YPi53SRn/Zh9Q5N54bVHsdt2ZfThIXfpmrAzoI0vBJY=;
 b=C/j2PX+YZMe0uKjwAg0oKJnbrWGLRUGBOYU8aXASycCm1WyE77qxwuIXgAnPhnFSaGC521sSf
 nodJ7nUwcq2CnYnVQBnrnno04ovyUAYxKfXbY72GGk8F/srKpH5UaZu
X-Developer-Key: i=xiazq123666@gmail.com; a=ed25519;
 pk=mrJQOUoyemvqamFAwqXZF59Z8eZnI11ZI+BEtDNxq7Q=
X-Endpoint-Received: by B4 Relay for xiazq123666@gmail.com/20261113 with
 auth_id=1513
X-Original-From: Ziqiang Xia <xiazq123666@gmail.com>
Reply-To: xiazq123666@gmail.com
Content-Transfer-Encoding: 7bit

From: Ziqiang Xia <xiazq123666@gmail.com>

Document the read-only touchpad_enabled sysfs attribute exposed by
the Emdoor Intel EWMI platform driver.

Signed-off-by: Ziqiang Xia <xiazq123666@gmail.com>
---
 Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi | 7 +++++++
 MAINTAINERS                                                 | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi b/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi
new file mode 100644
index 000000000..9dd1c6d6c
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi
@@ -0,0 +1,7 @@
+What:		/sys/bus/wmi/devices/0B30FD67-1B62-4FCA-B10B-50DC7ADE6A39-*/touchpad_enabled
+Date:		November 2026
+KernelVersion:	7.5
+Contact:	platform-driver-x86@vger.kernel.org
+Description:
+		(RO) Firmware touchpad enable state ("0" or "1") queried via
+		WMCD GTPS (0x03/0x07).
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


