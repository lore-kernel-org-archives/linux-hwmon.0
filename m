Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52854175D53;
	Thu, 30 Apr 2026 03:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777518103; cv=none; b=DnfaiFlHPGVst6qAJ5G+s2oU8e5WOOwv99S0vi6L6jfGWSBuEQGh98gPTip8uEALur6w8iPx9jZa5+KpZivfULWMFPCpKZ1bSP0xv8SJn888lkg0L4z8uWdQdHVXW/83T9jawC1yXydzAx3Acv25S4Qg9GxMdJoUK8pDHmZUGe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777518103; c=relaxed/simple;
	bh=tlzEWOI2Bk6ERLRdi65Kh4oJRVAuZAgYxkBxwEA9mZ4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jUx5i3TvEwa+7mYhnEr8hWM/5SkWdJZBqfg1B8Gl+cHEzfLHJ2cgnAu4l01CDt2j7kHuiXCozYukS0KJWjXCgRqMjkHAUCNK6jg2KOPOdGPxW5fWXxl16wJYwXmW4sPCKyIdrxFATHRzn1cvdtkLHtH5t2WFRtNDU99zqZKKCQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lyq3LeXn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lyq3LeXn"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1D340C19425;
	Thu, 30 Apr 2026 03:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777518103;
	bh=tlzEWOI2Bk6ERLRdi65Kh4oJRVAuZAgYxkBxwEA9mZ4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=lyq3LeXnvb27bYQNkJlLhoECDf/6C+jyI6pPUojviN+AbEBE6aHXIScxwTA3345S+
	 CdgnATzcU7tdNLxCakp5De1BzprxGGalQ2jEpg11Nd3zzbU8a8C8Yq80HJiUjYjETG
	 MXBJIht6FZSMG2oTAQrvWJ3gRGJNd7oU/koT+jW6B+TNTNBNAqSiOO0zltXJPEPY4H
	 qOz7rvwQDgf52Ow5Rq1Tz5jjaLJlZHH8GildON1nPJIkQFZz4r1wkfcIb/SX9siEM+
	 6AyKWGgzcv/9DGu6d6WuUxrKd2ZiCi8+UEEkXmhuLy158YEu7C2HqWbo/qz8N1tQnh
	 Mcp0fvnpqulMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CDAAFF8864;
	Thu, 30 Apr 2026 03:01:43 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] add support for Delta E50SN12051
Date: Thu, 30 Apr 2026 11:01:33 +0800
Message-Id: <20260430-add-e50sn12051-v2-0-d76fe42482ab@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA3G8mkC/13Myw6CMBCF4Vchs7ZmpkqLrnwPw6KXESYRMK0hG
 sK7W3Hn8j/J+RbInIQznKsFEs+SZRpL6F0FoXdjx0piadCoDR7IKBej4hrzSBprKtnoxkVjrXV
 QTo/EN3lt4LUt3Ut+Tum9+TN91x911Kd/aiaFKhASm9Cg9/7SDU7u+zAN0K7r+gEUeeSrrAAAA
 A==
X-Change-ID: 20260316-add-e50sn12051-ad828ad6777a
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chang <kevin.chang2@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Colin Huang <colin.huang2@amd.com>, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777518101; l=1561;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=tlzEWOI2Bk6ERLRdi65Kh4oJRVAuZAgYxkBxwEA9mZ4=;
 b=Owte91CT2l71O+i3QT/2nkaxam9kSmuLCvn1K4VF9UajfdR3U0D3sC5LZtnmrOSaRTh94Us6Z
 cPLKZrWFolMD2jeSf8n9t/dsP2lxxRLczzzrCSWrr1lL64M/ixKvFRw
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
 drivers/hwmon/pmbus/e50sn12051.c                   | 59 ++++++++++++++++
 6 files changed, 192 insertions(+)
---
base-commit: b584e7d50af502462349910bf4ed30057620b69f
change-id: 20260316-add-e50sn12051-ad828ad6777a

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


