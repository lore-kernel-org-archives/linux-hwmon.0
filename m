Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795442234;
	b=rXCeSZwTM8BXdFztDYcPnLPNAMNGzbQi4KmEfOU82n1aA8/DSQuZ4Lo47dhTHyTwrD5C
	 Nt4a1tQX/yhuYSyhTQheI+zvJQJdc4GvJgoAkyTUsZBm1iZWm5deb8Hj5PZcG4d/5pXFn
	 avbF4FaN+mDCgX74i66yjfWmbcc5uKrZxQVRYP73hGtVCugAgk51JPCUCJX4nNaIJ07g3
	 JR95R/vl2ALvekPxSdxnt+2mt5jk35FQjB6V+jPEKk3ahWh7BGGpHeqU/gv50SJ4RfQai
	 VRUyLhDzbdKM9mrfmX66iiONgitKYfIwx/s7+yd3K+kkVSZNu/KzZjT8fS2oJUG+7ng==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442234;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Gx9y3QZ9PKgfEg1g2p9aOBk4NQZlmROrAvf+BKTlrqs=;
	b=KLMT4aIdo3NcgCEndoAGK2cPQhMon4L9OMJzSkfA+c50vbZMdybM/ahvZ72yq7tVkXoG
	 yEdn2584cCRm0+HnRwOQib/TaqHlDusGSZgTjotlYYsDK5eeVSG4Cz1kmvBqFhM6GkFtP
	 rwh5VoD/jeFTXOXZRELepGOAsVFbAnx+rvUw6TgybZ8jeuuxgHbdneekvFe2MeSOuBJQI
	 Vk8hzB+ukqq62T7vxUTF7YDlcmKkXPJZjhhOALrSGTzjFTVB7xeLDbp8knixKwCIi7lq7
	 IsGHwKW3YTCPmMh6miUbtZljl0Jfnmjsa9CaYyzZu/tfGBok9UidPdPeeDbEsiTCcUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bBnbWa4K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB844606A31F;
	Mon, 23 Nov 2026 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bBnbWa4K
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795442234;
	b=0g4TSZxhum7ifldYGYTMiMIhXbCawS2GN9k0SRxxhJQMkGiabkli4SoIZ89T7JTCd3Gq
	 gsouWVgCBBh3285RKwzAqb0A0B2jxbeXn7pszoCUrKrRfp3QzGvkeJ57+Vf5Nszh/Dme4
	 Jj5uGbaazO9BtxU8l7zzvPd2RMp5sOL3qL5s7cJvGpCJRYgMTZUStkUd/0zRWULLwFltw
	 GBK2nNDKlXMUyBINtAHWzeIY4WwuhFdHf090ELaxqUb9tP8Yfmd/flLNe2U5Ck3BRtPpC
	 +4EWxNeaR0sauHH2mvE8afM3a+6VkigMcXbYG0pIfTIdqD/AOW+9BwyPDIAM02wvjHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795442234;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Gx9y3QZ9PKgfEg1g2p9aOBk4NQZlmROrAvf+BKTlrqs=;
	b=HfajYA7RTxXtO9e5tJAFDQIsokgjgJLoBvizSbc6Tk8IexsqQ8CkjVKkddra+wBScDJG
	 gyZ0fYvKml7g2dcUdhsWU+Elg9a4dZjlhUXh2jsJa+7owybZb5G1hwi1kgO02xXy414Du
	 8O03PH4SXbW1dq43zCd7ehoYJHuTEAUmI7pA8mrXudj2sfJ+6Joo2+Knq4mYJKxUV+7hC
	 Q7d9tuXIf4lDb/hB+lh5J6rIB0Hk1NdEUbFPkILVl6YrJwLdJr7640s0yUY/9iL/rvazV
	 5Qyt9tOE3R4aPMRfuOAPpPtl3kQU2K3Dee9ivlFVWFTM3MFuYlPODv5y6zF15XQ4rdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D39441F000D3;
	Mon, 23 Nov 2026 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442234;
	bh=Gx9y3QZ9PKgfEg1g2p9aOBk4NQZlmROrAvf+BKTlrqs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=bBnbWa4KWqjdtk/kqLGHvZ83m5/k47M+U0Kxq22kp7N3XkdlXB+VaeESHdWYeiTwn
	 FlOAB9lJeLQ49SEVbQxmILVI8Q46eUbQmVeSRHdZTYnSjnvWCcRKt/QHmJ56Nso4EC
	 Vskn5hBoHYVTBGzKpGWD8bP276shylBiouhdlkUwiFEqhVhTonaCE+Sm6h5wypU/YG
	 NaQX2kwVqRVsHQ4+kpJJe0X/yN+TCW4gRkQFfCj3msV54VsKKxzh8kmsV2YhYlWQoz
	 pqqCDTA4qsA6UZskO/hmnNqEshPE4xV0WLK8SqvfYk37H2Qk12onRLFHcL1NI/Rquy
	 4ytvZKjSBJVnw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 604EC4C4B7;
	Mon, 23 Nov 2026 13:56:52 +0000 (UTC)
From: Ziqiang Xia via B4 Relay <devnull+xiazq123666.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 05:56:51 -0800
Subject: [PATCH v2 1/2] Documentation: ABI: testing: Add emdoor-intel-wmi
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
Message-Id: <20261123-emdoor-intel-wmi-rfc-v2-1-3f4a03095f2e@gmail.com>
References: <20261123-emdoor-intel-wmi-rfc-v2-0-3f4a03095f2e@gmail.com>
In-Reply-To: <20261123-emdoor-intel-wmi-rfc-v2-0-3f4a03095f2e@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, Ziqiang Xia <xiazq123666@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795442211; l=1523;
 i=xiazq123666@gmail.com; s=20261113; h=from:subject:message-id;
 bh=DS8F/t2qcz85jbuQ4iMIKORFvJuKOvOLneJQvWGmXpQ=;
 b=HKTLUecXHruX5UPIKDfQrtx04XgE61GQFo0cmv8GbF1HWu/ma+pF6gbNQQBOfRm6OEMuuRjX0
 wpFRhUJX44tAc/eKNgOHcww+gp7izaMq9rzZX5H+Qnq9WTNitlx3qnJ
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
index 000000000..6cf85db62
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-wmi-devices-emdoor-ewmi
@@ -0,0 +1,7 @@
+What:		/sys/bus/wmi/devices/0B30FD67-1B62-4FCA-B10B-50DC7ADE6A39-*/touchpad_enabled
+Date:		November 2026
+KernelVersion:	7.4
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


