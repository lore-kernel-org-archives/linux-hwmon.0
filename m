Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45BE36D9EC;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777529784; cv=none; b=eIlJ5ZVNZopSNW+FFFJk5GJNdbnO5/0BagjUW/QtlYYFPqKx+xaAEcWQNn7De8gbt2SMotqkLtluPdQZ46MzQBv6LkxO5zwBblismsNMtyW3w619Y5WHRo8CHnziX6ojZzTyE6y2icFksAlT6VNnNSGDrtwc4Crojx0Bbklu0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777529784; c=relaxed/simple;
	bh=oBgPU0ydwALQl3qIwEqmaToaIV3W/b8yAthgaWa/kQQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b3rPh8pb6PkLTJtStWoiPds7yOnvAQib81HqBMRA0twOn/GmXmW2t2eZXNLt/xYCSBs5LsVoC4OFUgsZ97cZIeZGArf+VC7XRzdfDJEW9Oz1Oo/25wdFmDu+ly1I2ZFerXAfK47IZtNDsO7Ws1NCR0zLmSuoGxS5Lzj3qvWyOoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cqCJGe8S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cqCJGe8S"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77351C2BCB9;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777529784;
	bh=oBgPU0ydwALQl3qIwEqmaToaIV3W/b8yAthgaWa/kQQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cqCJGe8Sov0YontGESjNxYaRzYer6aU182OUoW2SNyQiX4U6XmVom8cun/qGdA9zz
	 M38TVBxIVo99oGKjKch6uLe9TvWq8OL3omwtK4fTjRbP82UJ/nahBRnoWVP0RkOzy9
	 5ivyi8MqCYJc7jRlisoz+XFrcao1h0cRuR/6FtFYLBDcGnmy6UwYqc+4SgDifXBmSJ
	 QYLMSnMq+z7L0O1LtFV1VP0h31w9B7FsRJjnVeI1SZjuNUgJ7EV7izNLZk2BCfW6dV
	 tDtRYijfNb8+h6/ebwgUA5i68u1MRVR/UURNkQW5JMbV4I7+xQLzS+VAwlO1kmGL2+
	 n2TaANHfvRxLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E5DFF8875;
	Thu, 30 Apr 2026 06:16:24 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] add support for Delta E50SN12051
Date: Thu, 30 Apr 2026 14:16:19 +0800
Message-Id: <20260430-add-e50sn12051-v3-0-f6d4e043ec7c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALPz8mkC/2WMSw6CMBQAr0K6tub1AW115T2Mi9I+oImAaU2jI
 dzdghs/y5lkZmaRgqfIjsXMAiUf/TRmKHcFs70ZO+LeZWYIKKEUkhvnONUQR4FQi4watXFSKWV
 Yjm6BWv/YhudL5t7H+xSe2z+J1b5XFR5+V0lw4FaAIGk1NE1z6gbjr3s7DWxdJfzIS/jLMedOy
 ZYqrDSar3xZlhcVOVtY6wAAAA==
X-Change-ID: 20260316-add-e50sn12051-ad828ad6777a
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777529782; l=1777;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=oBgPU0ydwALQl3qIwEqmaToaIV3W/b8yAthgaWa/kQQ=;
 b=MJCpHh3s6Klg5DyEsYd1zAt40UXgIurJ+nlj5CE3VVN4EWAMFNKCUQ2iOSnCuXupVOSp6p3tJ
 VPBzu9gEDpiDWVFhW/orCN6YSuV83Sxh3kqthNYZ/VS4Nl0XcjcGqJg
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

Delta E50SN12051 is a 600W non-isolated 1/8th brick DC-DC power module.
With this series applied, voltage, current and temperature sensors can 
be exposed through the standard hwmon interface.

Changes in this series:
- Introduce device-tree binding documentation for the new device
- Add hwmon documentation describing the supported sensors
- Add PMBus driver support for Delta E50SN12051

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v3:
- Simplify to pass &e50sn12051_info directly to pmbus_do_probe() 
  to avoid the extra memory allocation
- Link to v2: https://lore.kernel.org/r/20260430-add-e50sn12051-v2-0-d76fe42482ab@gmail.com

Changes in v2:
- Add %YAML 1.2 declaration in binding document.
- Use a generic node name in examples in binding document.
- Add MODULE_IMPORT_NS("PMBUS")
- Remove unused / incorrect headers
- Link to v1: https://lore.kernel.org/r/20260429-add-e50sn12051-v1-0-c101e6c80bbb@gmail.com

---
Colin Huang (3):
      dt-bindings: hwmon: pmbus: add Delta E50SN12051 binding
      Documentation/hwmon: add Delta E50SN12051 documentation
      hwmon: (pmbus) add support for Delta E50SN12051

 .../bindings/hwmon/pmbus/delta,e50sn12051.yaml     | 41 +++++++++++
 Documentation/hwmon/e50sn12051.rst                 | 81 ++++++++++++++++++++++
 Documentation/hwmon/index.rst                      |  1 +
 drivers/hwmon/pmbus/Kconfig                        |  9 +++
 drivers/hwmon/pmbus/Makefile                       |  1 +
 drivers/hwmon/pmbus/e50sn12051.c                   | 52 ++++++++++++++
 6 files changed, 185 insertions(+)
---
base-commit: b584e7d50af502462349910bf4ed30057620b69f
change-id: 20260316-add-e50sn12051-ad828ad6777a

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


