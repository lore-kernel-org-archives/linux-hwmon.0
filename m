Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DF346EC79;
	Tue,  6 Oct 2026 14:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791296120; cv=none; b=U0NFfdFYzg9xzW/qbgLk5VC0CfjRskJWowoTUbP2OKLWpgrmQuPQiuQ/NcIWvXfvTe+29K/nSoiuGN2eSwARdtDb6tE7HVs20J03MIzdO3y5WTZvl7J3MVoyGyuBAxxt8U9AkygZjHGTjx1vO5heL3VJBYFLLDiO7eM5281zk1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791296120; c=relaxed/simple;
	bh=GQVRcnluMsT6WbBeW6txfNzcwk8/QinH0Noe//sOcAY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eoOuCJw4S3+cm7vMDo8jPd1rqIXQotBkXU5mpRIz8NA+k1LJBzIf64osiRNsKmwHHbRlZgOqFEJKadfWRI5zHZMe8FtTNMqkPBMAT5cU3tsOkmxSuseNGJTrLWi2wLoEm1ZpOYlJjcPJ6G30pKNDzLXLYyWxcSYwYGHeA/yAxcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djqjmfU6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djqjmfU6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03D26C2BCF4;
	Tue,  6 Oct 2026 14:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791296120;
	bh=GQVRcnluMsT6WbBeW6txfNzcwk8/QinH0Noe//sOcAY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=djqjmfU6trFWQ7/P+i0y+ZKSe76tHisrkuwqI+Bs/orEaWlreeCC7HAo3thnyvOfl
	 e6ilaxjPz7drw8oOkwJuCZu+aoj1505AhFHeK6p6dS9Araf5C2kdYA3O/88eXBvHoh
	 Ll68cML0CIcCaO+2O0VOIgWwxP7Eq09iZESJkLB9L8zGNTWY9+4PH90uD4pZlQe6tO
	 c6V56CHMYrRfJzPtUwH7p1Qo87nLOV/PhSpUNBkHG0MHK2u1UdkpSGGutzT6vInBjY
	 Mye2q7/vI8Niir3esdVyiwV0CoFrmcz9Hg/oNiUGQmuvo0MNYoLuw1jVe1oyg6BIsg
	 AAzC2/gJ2mlAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2931CA6001;
	Tue,  6 Oct 2026 14:15:19 +0000 (UTC)
From: Matt Layher via B4 Relay <devnull+mdlayher.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 10:14:54 -0400
Subject: [PATCH v2] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-asus-ec-x570e-cpu-opt-v2-1-74df23c22f04@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7Zi2CARX3MOwqGWAMUJJBwiGc
 HcBD+DyJe+/v4JQYBK4RysEmlnY9zuYSwSutX1DyNXOYJRJtVI3tDIJksMlyRShGyb0w4ipiVO
 jba2yXMG+HQLVvJzdR/ljmZ4vcuMRO4yWZfThcx7P+vD+fcwaNVY52TjTLlZVUjSd5ffV+Q7Kb
 du+u6AgncwAAAA=
X-Change-ID: 20261004-asus-ec-x570e-cpu-opt-623621af0790
To: Eugene Shalygin <eugene.shalygin@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Layher <mdlayher@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791296119; l=1907;
 i=mdlayher@gmail.com; s=linuxdev; h=from:subject:message-id;
 bh=r9Kqq/TD7jU/KmlKjk1tFe7tewjCRtaP4rus01J8hTU=;
 b=GGvYsehoIJvqAAzsP+p3srKlR+N6wM8pOzlAXoFNVOiKx5jxa1SOSWuorMz1fNtJiM8hsjdvq
 Yk60l8CIqG0DwYeGQqAsXEMpf80JY3w450CyGQmTrWZjWK/pVl0hSrz
X-Developer-Key: i=mdlayher@gmail.com; a=ed25519;
 pk=jO44g3WNw2T0EoKPeB+RUgDmyrZpA5Pmr830ITlwhaA=
X-Endpoint-Received: by B4 Relay for mdlayher@gmail.com/linuxdev with
 auth_id=1109
X-Original-From: Matt Layher <mdlayher@gmail.com>
Reply-To: mdlayher@gmail.com

From: Matt Layher <mdlayher@gmail.com>

The board has a CPU_OPT fan header, which the EC reports at the same
register (bank 0, 0xb0) as the other AMD 500 series boards. Enable it.

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
Changes in v2:
- Shorten the commit message (Eugene).
- Link to v1: https://patch.msgid.link/20261004-asus-ec-x570e-cpu-opt-v1-1-d9ea371c30d5@gmail.com
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


