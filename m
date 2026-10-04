Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBC33612F1;
	Sun,  4 Oct 2026 14:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124003; cv=none; b=IxG4DUKVJgvw9hymEu4FCcxazOzoroJ1HRLE78dTJ6RvALDtOG38m+CMIS+LLFidFBFc/775hncidKMBI2Of3XgDvdmo1VfYTkeenbJ/DX8LRNMWoMPkgDWeCUwtibYknb/IsoPPljmIOeAsQws9xPkeYns4guD663awdsmw/eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124003; c=relaxed/simple;
	bh=mYyoKmz7PztwvOgGfWP9fwPEmOF10/H8tStniHmi9zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YnZLB3RKw+h4arj6PYJd6ZnSnhIlkDKAu5zqC26QsBNfNn4Mi1bycy1n8DsH9P75bL1tDjrqRJgBwe+U8m+hVhmWSRywpp8EAEZ4YqxjKmyMXiwb5CsCyE1F2oMk+Ofqnu3ScjCbwNZHW/fYe2DdknCDM3BnJ2/aAPlefyhUrTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXpfFZiK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXpfFZiK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 386A2C2BCB9;
	Sun,  4 Oct 2026 14:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791124003;
	bh=mYyoKmz7PztwvOgGfWP9fwPEmOF10/H8tStniHmi9zg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=IXpfFZiKL8j2UdAi1xu906FLfp7BAu0jvj/zX2pLxiB4PwdR3KbIckdPUjNDFdpbI
	 zTVj13J0j+xVuA0a5KFv86ZWnUlKD5sQvFxtMnAFV8tY5yVpcP9uPPeqOMc4RxpV8O
	 QOI4ElDqbI+X2AvLzMOzhcwA7zBHO7sbrIGaTT5HQkATp77AKp6XcOnvnsh5ywfMBT
	 r3svFxx0sIcd7hU0YSLEiBqL6gzjh6pZPku74+IkldMygKx694lNcFFG47nT+t2UxD
	 x3O0RAqRqxuXNef4iHCiaOH/BCdK+DAXDkJdUYQ3l07op6T5y8yejw0A9qrj57YWwd
	 IwCJE7Uw5cqdA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1442ACA5FEF;
	Sun,  4 Oct 2026 14:26:43 +0000 (UTC)
From: Matt Layher via B4 Relay <devnull+mdlayher.gmail.com@kernel.org>
Date: Sun, 04 Oct 2026 10:26:27 -0400
Subject: [PATCH] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-asus-ec-x570e-cpu-opt-v1-1-d9ea371c30d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTvJtEKJXsW4qHWAYQFNpzUkh
 LtTdfkW/++gnIQV7s0OiT+isi4V5tJAmPwyMsq7GixZZ4ha9FoUOeDW9cQYYsE1ZnT26qzxA/U
 3gtrGxINsv+/j+beW18whf2dwHCcRgOQSeQAAAA==
X-Change-ID: 20261004-asus-ec-x570e-cpu-opt-623621af0790
To: Eugene Shalygin <eugene.shalygin@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Layher <mdlayher@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791124002; l=2211;
 i=mdlayher@gmail.com; s=linuxdev; h=from:subject:message-id;
 bh=HEHb7pz+5CIVTAUXjsxnncxE0oQGAoREpSaAebUx9AQ=;
 b=lH+GY7hQhCIRrlVSwJEabDbMMuuSttNbGlGKto0goC43sa7ced/zA6BldftpntEozBMDear3u
 374btCATaKDBmZqbkFcVxUwTjxw+zVZyahe44B4ZuLzAzq5fosBTLGC
X-Developer-Key: i=mdlayher@gmail.com; a=ed25519;
 pk=jO44g3WNw2T0EoKPeB+RUgDmyrZpA5Pmr830ITlwhaA=
X-Endpoint-Received: by B4 Relay for mdlayher@gmail.com/linuxdev with
 auth_id=1109
X-Original-From: Matt Layher <mdlayher@gmail.com>
Reply-To: mdlayher@gmail.com

From: Matt Layher <mdlayher@gmail.com>

Enable the CPU_Opt fan sensor for ROG STRIX X570-E GAMING.

The board has a CPU_OPT fan header, and its UEFI hardware monitor shows a
fan connected to it spinning at about 2000 RPM, but the driver does not
expose the sensor and the board's NCT6798D does not report it either.

Reading the EC directly through ec_sys on this board (BIOS 4408), the
CPU_Opt register used by the rest of the AMD 500 series family (bank 0,
0xb0) returns 0x0580, 1408 RPM under the operating system's fan curve,
while the chipset fan register at 0xb4 returns 0, matching what the
driver already reports for that fan.

Assisted-by: LLM sparse
Signed-off-by: Matt Layher <mdlayher@gmail.com>
---
An LLM coding assistant did most of the work on this patch: it found the
missing sensor while auditing this machine's monitoring, compared the
driver's board table with the BIOS hardware monitor, worked out which EC
register to read, and drafted the change and this changelog. I
reviewed both, and every test below ran on my own machines.

Testing:
- Runtime: the same one-line change applied to the driver in v6.18.54,
  loaded on the board in place of the stock module; CPU_Opt read
  1454-1463 RPM and the chipset fan 0.
- Build: hwmon-next with W=1 and sparse (C=1), no warnings;
  checkpatch --strict reports no errors, warnings or checks.
---
 drivers/hwmon/asus-ec-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 19f423e45ce5..8261ddd00653 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -721,7 +721,7 @@ static const struct ec_board_info board_info_strix_x470_i_gaming = {
 
 static const struct ec_board_info board_info_strix_x570_e_gaming = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
-		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_T_SENSOR | SENSOR_FAN_CPU_OPT |
 		SENSOR_FAN_CHIPSET | SENSOR_CURR_CPU |
 		SENSOR_IN_CPU_CORE,
 	.mutex_path = ASUS_HW_ACCESS_MUTEX_ASMX,

---
base-commit: 4781ca52761e666cf18b591e6bb0478396c90320
change-id: 20261004-asus-ec-x570e-cpu-opt-623621af0790

Best regards,
--  
Matt Layher <mdlayher@gmail.com>


