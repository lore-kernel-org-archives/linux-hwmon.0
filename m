Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32A834F48E;
	Thu, 26 Mar 2026 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774552965; cv=pass; b=MQeR7xnldvokTHU8p5b9aXy/WjQDfKxHr2EWHvEAcEc26kTCFhN/1r2Z6zzzpTI7G4ButVPxPPYpvd7OawOEQUdL+L3EGwKuzbG2FnzpIM0hdqXgbQudwY/ahtmuA1b7W4yAXd38CJiBwUzPASdFQf4MSfU+poj/Px3oBx4kgr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774552965; c=relaxed/simple;
	bh=HbYZ60qrLzqhafhDhXmS9+prkP2azgHQMIHNCWQ3yjo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kokM5250jWuTEHUpycBrsc6JL/NLQVDsg+S3loR+H/zKGad8F+kp+xibECMAOJbnHlmpuik8nND3Rh969fstWtsRou+Vm7TARrKeeRWg3gMO99iAMBk7ZO24y4yKXhtp2lzUQviSgRib0mtz0hbJ+MQ9zqmkMmne+D5UuOI714U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=KgDVsZiH; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="KgDVsZiH"
ARC-Seal: i=1; a=rsa-sha256; t=1774552946; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YDewQ7Eisoq1w7ICnXrDNiGW1xG7q6WKfDNGaduCX7NteTcqc52vfb9G5YZ6gkVRIIe37v62WHKImyFnrfIPqNEIhCtfRWeadndLSu+WnwB2SptZxxV3MvYqUKeqT34Uhdmt6o4eFb+EJs7BlitLLevK8Wuy+9Mxy2N4grwNvHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774552946; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5+utr8pYKvO3ZMksOXxs+qfptcs+4xumv9piq8O1JzY=; 
	b=bVHElHwmwFkMQfTZ8WpuYN8L8AXULXu+xSejaULizpPNvpfjJzwXuMHR4wBRcCjphsRi6IZD+xRc//0vd8s+xTcFtItmnIQfdUiFr69yD5TpvAUiB81z5SmHl6TvbnMdVk2DaEs7OOmd8DQHxA7HqbyjkSYcO5zH9vz/Srkck2U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774552946;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=5+utr8pYKvO3ZMksOXxs+qfptcs+4xumv9piq8O1JzY=;
	b=KgDVsZiHVKncVMFSI1Y+pNbSyE9f/nZhEJ/QWwb7LBtNJ6Y/qjYnVueTwoiOPRcI
	HGRZDluJiYNXdkSTvSBA8EEAXKZf6Qk1/L93yH4KEXLtyeNrVBI+e1BPZLwbA0URCfd
	daj+sB8j7fcZMdwK/K54rHItq0KHbEkgn+yp++/Ltt02fHpWpD4tLChqa/UaQ2XUZE/
	KSjg5PdgYuIks1k2t3Ih+SJN1TUVm2emwzDfpbd8T7FtGYJBn2O4A4DBHhiiwLRFoGz
	qUPMJOzcsw8614nXcUfmJV4wELbY35OBRrKc1xwsbHLvYnELF99flxgAARSKYbpxyto
	9OKayk2Qeg==
Received: by mx.zohomail.com with SMTPS id 1774552944999543.6591470391733;
	Thu, 26 Mar 2026 12:22:24 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Subject: [PATCH 0/4] hwmon: Add WITRN USB tester driver
Date: Fri, 27 Mar 2026 03:19:49 +0800
Message-Id: <20260327-b4-hwmon-witrn-v1-0-8d2f1896c045@rong.moe>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANWGxWkC/yXMwQ5DQBCA4VeROZtkOpTwKuJgdVojsWQXKxHvb
 tsev8P/n+DFqXiokxOc7Op1thGPNIF+6OxHUF/RwMQFZVyiyXEI02wx6OosdgVXpqKc+EkQo8X
 JW4/fsGn/9psZpV+/F7iuG0ZJcYNyAAAA
X-Change-ID: 20260327-b4-hwmon-witrn-a629b9040250
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-ad80c
X-ZohoMailClient: External

WITRN produces a series of devices to monitor power characteristics of
USB connections and display those on a on-device display. Most of them
contain an additional port which exposes the measurements via USB HID.

These devices report sensor values in IEEE-754 float (binary32) format.
The driver must perform floating-point number to integer conversions to
provide hwmon channels. Meanwhile, they also report accumulative float
values, and simple division or multiplication turns them into useful
hwmon channels.

Patch 1 adds label support for 64-bit energy attributes, as the driver
needs it.

Patch 2 adds a helper module for floating-point to integer conversions,
so that the conversion, multification and division methods can be used
in this driver as well as other drivers (I am also working on another
USB tester driver that needs it).

Patch 3 adds a barebone HID driver for WITRN K2.

Patch 4 adds hwmon channels and attributes to the driver.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Rong Zhang (4):
      hwmon: Add label support for 64-bit energy attributes
      hwmon: New helper module for floating-point to integer conversions
      hwmon: Add barebone HID driver for WITRN
      hwmon: (witrn) Add monitoring support

 Documentation/hwmon/index.rst |   1 +
 Documentation/hwmon/witrn.rst |  53 ++++
 MAINTAINERS                   |   7 +
 drivers/hwmon/Kconfig         |  14 +
 drivers/hwmon/Makefile        |   2 +
 drivers/hwmon/hwmon-fp.c      | 262 ++++++++++++++++
 drivers/hwmon/hwmon-fp.h      | 212 +++++++++++++
 drivers/hwmon/hwmon.c         |   1 +
 drivers/hwmon/witrn.c         | 691 ++++++++++++++++++++++++++++++++++++++++++
 9 files changed, 1243 insertions(+)
---
base-commit: 0138af2472dfdef0d56fc4697416eaa0ff2589bd
change-id: 20260327-b4-hwmon-witrn-a629b9040250

Thanks,
Rong

