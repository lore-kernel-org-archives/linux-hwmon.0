Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1C93A7F69;
	Tue, 23 Jun 2026 05:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782194165; cv=none; b=GVD5S/VqE3OyrPwqSLsr+axN2z8gRQswWcBhf9lErkxtDhNF4vLfTZMiPplfWUv+Qz5DtfvP8dWGbQTSL91k5HHVtrCf9z8QEIpzgAqZ2cdsrwiyqi6pIO46xHE4L6R5X94FSv4hv4ZmPK/fx5AakfGLqWHLf6xImQvhZD9GGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782194165; c=relaxed/simple;
	bh=XxHC+WBSkAS51ORVmSx/YM7z+DWofPW1mqwUDLPdqdM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cg8/KEwM1yzz6roDZkLPZ8o6RDkVl08mdTQG/DLi8/kGs2ZAMrqv80RrKlgLIYvJO1+k2ug97pveOgUlIeBxaiPJ6E75SWi7Q/hBOOFoeGQ0A3p1TAJkGJTx9WyyaIUZ624lFD7/Y/c1OvQFvF+NqLdh8pAQjebVkUIV8Og1AVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ore5ZPac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ore5ZPac"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53D7FC2BCB8;
	Tue, 23 Jun 2026 05:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782194165;
	bh=XxHC+WBSkAS51ORVmSx/YM7z+DWofPW1mqwUDLPdqdM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ore5ZPac2OeoiimpPdp8rG1eK3SzKmzvuC44yS2FujE4Utbw3S/q/7EfBu1XzYTsw
	 +RE6nrl/yb3uSUmBjQrdPaSMVeD79o+xOmygZRZhvpcKdtnk/sxJ2guTwlP3/AVROG
	 qW2s5blWnXUqUsfEDX8Pag8x4lK9cDHOXwcKBZ9UQEYNy02OIvQ46Nm2+Nw9ppdF20
	 AMIRsrWmi9fYn2EmBIfTJngTU0x3V3IBLUaZV8jHvnP07q9FQSc3UZSvusAfcyH+c0
	 Wo7AiUls/B/IBf+pyNYR51vAUZ3OajHPVuQJaIT5hY5vEPfd0m9GpsPNHWiU+gprDi
	 VUiR1nj8shpOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E543CDB470;
	Tue, 23 Jun 2026 05:56:05 +0000 (UTC)
From: Selvamani Rajagopal via B4 Relay <devnull+Selvamani.Rajagopal.onsemi.com@kernel.org>
Subject: [PATCH 0/3] Support onsemi's FD5121 multiphase digital controller
Date: Mon, 22 Jun 2026 22:55:36 -0700
Message-Id: <20260622-support-fd5121-from-onsemi-v1-0-b31767689c65@onsemi.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANgfOmoC/x3MOwrDMAwA0KsEzRXYgpgmVwkd8pFaDbGN1JZCy
 N1jOr7lHeBsyg5jd4DxV11Lboi3DtbXnJ+MujUDBUohEaF/ai32Rtn6SBHFyo4lO++KSeZBhvv
 SLxKgBdVY9PfPp8d5XqV2fBNsAAAA
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Selva Rajagopal <selvamani.rajagopal@onsemi.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782194144; l=1270;
 i=Selvamani.Rajagopal@onsemi.com; s=20260531; h=from:subject:message-id;
 bh=XxHC+WBSkAS51ORVmSx/YM7z+DWofPW1mqwUDLPdqdM=;
 b=O+5KQ40A0TgaP9oDBztyUxV5bx3S4eld/u7bTs2DIoewQ62OMXYw1Teqm/wZU2hGyUq1sWYER
 WIeYGdvs3CHCJgve+f30LSywGE3AVupaO6zFCZc4ze9WtXQ13Cfl/KO
X-Developer-Key: i=Selvamani.Rajagopal@onsemi.com; a=ed25519;
 pk=5QRdM0HS/LGWWcUZZ9hVfZ+qbPQGZCumcTXOiN7Fyug=
X-Endpoint-Received: by B4 Relay for
 Selvamani.Rajagopal@onsemi.com/20260531 with auth_id=803
X-Original-From: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Reply-To: Selvamani.Rajagopal@onsemi.com

FD5121 is a dual rail, multi-phase controller designed to
power CPU, ASIC or SoC with fully configurable rails.

This driver adds support for FD5121, FD5123 and FD5125. These
controllers configurability through PMBus 1.4.1. 

Added documents for these controllers.

Signed-off-by: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
---
Selvamani Rajagopal (3):
      Documentation/hwmon: Add onsemi's FD5121 controllers' documentation
      dt-bindings: hwmon: pmbus: Support for onsemi's FD5121
      hwmon: (pmbus/fd5121): Add support FD5121, FD5123 and FD5125

 .../bindings/hwmon/pmbus/onnn,fd5121.yaml          |   41 +
 Documentation/hwmon/fd5121.rst                     |   93 ++
 Documentation/hwmon/index.rst                      |    1 +
 MAINTAINERS                                        |    8 +
 drivers/hwmon/pmbus/Kconfig                        |    9 +
 drivers/hwmon/pmbus/Makefile                       |    1 +
 drivers/hwmon/pmbus/fd5121.c                       | 1004 ++++++++++++++++++++
 7 files changed, 1157 insertions(+)
---
base-commit: 1a3746ccbb0a97bed3c06ccde6b880013b1dddc1
change-id: 20260622-support-fd5121-from-onsemi-6fa9f98b5bf0

Best regards,
-- 
Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>


