Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1CA4E06D4;
	Thu, 17 Sep 2026 11:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646373; cv=none; b=NbJZA987ZjWU3gHSvFFRXYvwfK8Fl3ckmE6UKrzHOflWMgnG4P0jrXY6jAG0iLrXPKiPm879GVWmDNQ1sahv/wxbykNcKCDRx6obQGq8iZ0mBvNeOdYfbC7SHIdwIIhMKs7iU3bv47O7oMnQIOPvTss/6F4WI1MgJL83utEjqGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646373; c=relaxed/simple;
	bh=1AQLc+FuPl+WmSJJkZ9Vb9d3VFCwdlChzaTPcCfb0Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cKBtzlaWkFJpOugZhr/S4xFubBXcjAe0zL12G6U4RHiAChXa/F6AFQnlMU9BvsW8QcI5TUOcaXpIP9DmhneEC5my/GC+3TdM4/2TzJwicVvx4QKETvVv/kUjKvC98tsoZGZC2I0/7FMmeTGeZtQLVXEgc7bN9CVxlQlwc1RZ8sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=GV0ViWIl; arc=none smtp.client-ip=220.197.31.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="GV0ViWIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=DY
	5hg0oG2n14IkGfO3z7zsyaI7BrSzLCYgqaOw77aLA=; b=GV0ViWIlR1KZyhjXDX
	eiajrRA7mZJ5YbImyhZfBV+Z+HkmapaALqOa1bRQk3JPmdBIrhCcuG2jvIRmYEv4
	fT80QRY930isyhI7wxfuUZmVV+GESy62egDlAAFEzSTHrW/hkH09rs9oW+yTszHR
	LW6mIn8ChgDJtuBX1DgXvbP24=
Received: from chaosheng-ASUS-TUF-Gaming-F16-FX607JV-FX607JV.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wAH7aTa1atqD7D0BA--.50575S2;
	Thu, 17 Sep 2026 19:58:19 +0800 (CST)
From: Quchaosheng <quchaosheng000406@163.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Quchaosheng <quchaosheng000406@163.com>
Subject: [PATCH 1/2] hwmon: vexpress: point the DT binding reference at the schema
Date: Thu, 17 Sep 2026 19:58:17 +0800
Message-ID: <20260917115818.540344-1-quchaosheng000406@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAH7aTa1atqD7D0BA--.50575S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr4fGrW3Wr13Zry7Cry5XFb_yoWkCrgEkF
	W0qF4vk3yUAFWSgFyUAFWrCrn7Xr4Skr4xCrn7Wrs0y34jqa9xGFykX343Aw1xurW7uw15
	WrWfJrWDJ3ZFgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMsjjDUUUUU==
X-CM-SenderInfo: xtxfxtprvkv0bjqqikiqw6il2tof0z/xtbC5Bsxpmqr1du6BwAA3a

Documentation/hwmon/vexpress.rst points at
Documentation/devicetree/bindings/hwmon/vexpress.txt for the device tree
binding of the arm,vexpress-volt, -amp, -temp, -power and -energy sensors.

That file only restates the compatibles and the label property, which the
arm/vexpress-config.yaml schema describes now. Point the reference there.

Assisted-by: LLM
Signed-off-by: Quchaosheng <quchaosheng000406@163.com>
---
 Documentation/hwmon/vexpress.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/vexpress.rst b/Documentation/hwmon/vexpress.rst
index 7fc99f75b3b1..84b2a33e2d40 100644
--- a/Documentation/hwmon/vexpress.rst
+++ b/Documentation/hwmon/vexpress.rst
@@ -38,4 +38,4 @@ via a custom interface, abstracted by the "vexpress_config" API.
 
 As these devices are non-discoverable, they must be described in a Device
 Tree passed to the kernel. Details of the DT binding for them can be found
-in Documentation/devicetree/bindings/hwmon/vexpress.txt.
+in Documentation/devicetree/bindings/arm/vexpress-config.yaml.
-- 
2.43.0

