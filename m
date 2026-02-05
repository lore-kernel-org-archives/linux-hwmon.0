Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE244361DA4;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285702; cv=none; b=CvpRXTLPYJsEDS+c/yM3705nrfsNpGw8Haga/htzLdOrdnbPafOfwaIY4vE60Sg49ia2KxCFlSO3DP79YlySmbXTKS/8qDfpsyRdMJOPStvNkzwXkH2g1pz6zMILQ9Y6lKcHUZ7XOZWElFo4V8E6px+chkhp61XKngUgsG2qNug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285702; c=relaxed/simple;
	bh=DFrlS59fjMgBzDiAHSMCR4kAn5bfamElxFbhVStZ664=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aO4C3EDcrEfsrgRK8RJPa9OrV11Wo7BdutakHyk4zD80BHuG+DWzmD1+sEf7gE4l8yPCM+8ZHzam8bGe1bTevWtk6d/nrJofpmCLEPFXdBAcx1EJx0eWfPukx97M1CXVOEgRCW9iRpKbECtVxBtpo6N9les/DFcs3sabbTUTIQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DOc/i9KM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DOc/i9KM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C370C4CEF7;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770285701;
	bh=DFrlS59fjMgBzDiAHSMCR4kAn5bfamElxFbhVStZ664=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DOc/i9KMBKx/7E1fuluIoVvsWDiJ3XJvTK40zO1EMoTpSO+cUhJ2+zvkae6Z3ebG3
	 4wWKYq0Y/ErDhBSCzJuQaKYn+EgcEZe2RoxiH7U/cW6n3fYD7yxtmA6AX9LSgMo5uX
	 Xubvi+j9HmHdFe3jve6c+tY7Fc73W6ZXgPtZsG/557tiKLUrVMp9fBvvRvU4GJerW7
	 JfVZr4nTbJbhe122U2neFtYvyQqPx++JqY/cosgQxsZck6K2LAZrC1Aq2l4MRIqJIM
	 zN+RLTl3VCessmh3+WyGnL+owipy6HhYvPE9LIkcOwqhAhSUFwBsP3gzeyBx6WyFI4
	 zK+oU6upKMLKA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F56EC1E86;
	Thu,  5 Feb 2026 10:01:41 +0000 (UTC)
From: Carl Lee via B4 Relay <devnull+carl.lee.amd.com@kernel.org>
Subject: [PATCH v2 0/3] hwmon: pmbus: Add support for MPQ8786
Date: Thu, 05 Feb 2026 18:01:36 +0800
Message-Id: <20260205-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v2-0-3744cd9b2850@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIBqhGkC/6WOSxKCMBBEr0Jl7VhJjAFdeQ+LBZABZpGPCaAWx
 d2NlDdw168X/XplCSNhYtdiZREXSuRdBnkoWDc2bkAgk5lJLjWX/ARmgpacITckGJ/WOwi2nRP
 Y8KjK6gyNMb+sIc0h+DhBryquLlgpIZDl5RCxp9duvdeZR0qTj+/9xCK+7X++RYAAXbZcCZR9q
 eWtsebYecvqbds+8ZOJU/QAAAA=
X-Change-ID: 20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-f48049e8411e
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Charles Hsu <ythsu0511@gmail.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, carl.lee@amd.com, peter.shen@amd.com, 
 colin.huang2@amd.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770285700; l=1326;
 i=carl.lee@amd.com; s=20260203; h=from:subject:message-id;
 bh=DFrlS59fjMgBzDiAHSMCR4kAn5bfamElxFbhVStZ664=;
 b=7qGpO4iddJJUHIK/BZ/PIoUzhQpV18z7EKW+T3ZoLBYmGj0Kal+jH61J7ZWmHS8cykG9xgCzw
 kPnCu9xUc/VBaHD93aMxNi2ZUPpNeEGWJaYEZGD8KyWlE/NySeyyA3M
X-Developer-Key: i=carl.lee@amd.com; a=ed25519;
 pk=pyq7QaQvoxMg806KVkRwpCbiah+7ncWr4MBpK1AEyjA=
X-Endpoint-Received: by B4 Relay for carl.lee@amd.com/20260203 with
 auth_id=623
X-Original-From: Carl Lee <carl.lee@amd.com>
Reply-To: carl.lee@amd.com

This series includes the devicetree binding update followed by the corresponding
hwmon driver changes. In addition to basic MPQ8786 support, the series
also fixes VOUT reporting by forcing direct mode for VID VOUT on both
MPQ8785 and MPQ8786, as VID mode configuration is equivalent to direct
mode according to the datasheet.

Signed-off-by: Carl Lee <carl.lee@amd.com>
---
Changes in v2:
- Combine DT binding and driver changes into a single series
- Fix VOUT reporting by forcing direct mode for VID VOUT
- Link to v1: https://lore.kernel.org/r/20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-v1-1-67b041e2f762@amd.com

---
Carl Lee (3):
      dt-bindings: hwmon: pmbus: mpq8785: add MPQ8786 support
      hwmon: pmbus: mpq8785: add support for MPQ8786
      hwmon: pmbus: mpq8785: force direct mode for VID VOUT on MPQ8785/MPQ8786

 .../bindings/hwmon/pmbus/mps,mpq8785.yaml          |  5 ++++-
 Documentation/hwmon/mpq8785.rst                    |  7 ++++++
 drivers/hwmon/pmbus/mpq8785.c                      | 26 +++++++++++++++++++++-
 3 files changed, 36 insertions(+), 2 deletions(-)
---
base-commit: 4c87cdd0328495759f6e9f9f4e1e53ef8032a76f
change-id: 20260203-dt-bindings-hwmon-pmbus-mpq8785-add-mpq8786-support-f48049e8411e

Best regards,
-- 
Carl Lee <carl.lee@amd.com>


