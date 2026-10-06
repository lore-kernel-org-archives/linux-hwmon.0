Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1123E9C11;
	Tue,  6 Oct 2026 14:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791297408; cv=none; b=Xvt3bKxE2UsScYgdGl1fnQd30ubd6l8SzFvTodsf90B1qw/If7QfkZroQc9WBnsSTm1RXQTEjVFBXfN2ccncydgRS3gzVvdSGE5anctVJxOb+Qp+IHuQkzjwqeUJrpukDccr3kkyj90VHQW1PmAy6wt1dQ+jclZ9VpVrzf1Whoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791297408; c=relaxed/simple;
	bh=9I+o/C2SXiONiY8T5xeVhDX4bsupG3mvIVSTYTxJgto=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHSE1foKZrPEgaw3y4YhkRPIrovSZUMMfRbmv/NFJ1vukCtxAx3Qc6JqK4y8jOmW0OCZ7D2E4X1Tn7uwpQ+ouyYGiVkwff4R2ndPxVBKyzeGyHjwGYtzNnMF+bdZUds9Z4RP407GNItLHT0X1qxLd1RpC3pFxx+7u3fvB58AMXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TS2921Wi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TS2921Wi"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DF0BC4AF60;
	Tue,  6 Oct 2026 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791297408;
	bh=9I+o/C2SXiONiY8T5xeVhDX4bsupG3mvIVSTYTxJgto=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TS2921WiAi4cCZniYJLsZ1/3vloxoVpA/5+bJ7xQ24W2Ihfni0faZuuTSvpBCAMHb
	 t/rD154YiFR5yyfcc9KUrofbfe6m79c3SzyvXJobil5UmE0oNzmZD6/Rn1UzZjPkxW
	 VVnJKFTQq52Mc/NKrAMfWy2ftqW7Baa8r1BVeoRfRBD+hoG4t0fBRGoLHD3mSsqB0w
	 jj+Q/BTIAxohEiloc3F4tWt8iXancnlSg9n8w24DCkT6ShnQvkzUdKwwW3P3umlO8I
	 RA1B8JE6hGPKXBLjNJQb15crPyWb2zSPqf1yyMTBQ3Nj/b8mDWBqC9pjXskwCh7ygT
	 7Q/lc4RhzquUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E51CA5FFE;
	Tue,  6 Oct 2026 14:36:48 +0000 (UTC)
From: Matt Layher via B4 Relay <devnull+mdlayher.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 10:35:37 -0400
Subject: [PATCH v3] hwmon: (asus-ec-sensors) add CPU_Opt fan for ROG STRIX
 X570-E GAMING
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-asus-ec-x570e-cpu-opt-v3-1-62672edc18b3@gmail.com>
References: <20261006-asus-ec-x570e-cpu-opt-v3-0-62672edc18b3@gmail.com>
In-Reply-To: <20261006-asus-ec-x570e-cpu-opt-v3-0-62672edc18b3@gmail.com>
To: Eugene Shalygin <eugene.shalygin@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Matt Layher <mdlayher@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791297407; l=925;
 i=mdlayher@gmail.com; s=linuxdev; h=from:subject:message-id;
 bh=neFRa9yM7J68Bw3LwyksLxTmfSCixK0ZjZK4PIQ+vwQ=;
 b=92bFwaGWqtmre0ZZLPS7D0+Dx/NO02LV9yiDy6orwsV6q0MTns/Kl42E/HO6e3fOVA2Wz9K8x
 +gTyc4ZfC5XCxacY5RmmPsb0Oh3Fq7UW3sDqVk/rh3hX1snRPWh0v9y
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

-- 
2.54.0


