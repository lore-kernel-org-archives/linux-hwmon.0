Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE5F39E6F1;
	Sat, 26 Sep 2026 20:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790453518; cv=none; b=UZJkObxlFSRughRjbZC24sI0wfII5qjh0J1MrsFeEem26+eoaBy4Q0S4V04u99H1Z4EjSz8/O+i05QT9jdgi6FfSfYTtGmYpw2FTYAg0bbJpcVgoAMwhCPF6S5kN/TXfdAHcQ12oYVO1akNH2rpsuKKQqGxBMRBesB7erLAaK+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790453518; c=relaxed/simple;
	bh=1B4p1+6ULhEPyZ3UOWOnVAYM4qhJw3ENiTOj/9tlJcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LaLurAI7ARH8sasJ4zxIOfCBYH4MES6HgWDa1nGrT9vErK5iPGfS9BiGzUmkGzP5P9GMSZMtOQbOEW2XDJwzqsMbH8Buvg9c7lPygliBByx3uoGBH1Bhy/3yFoeXLaF8LPhhAYFu5sd3lpgZIqWgNd7xh4nTpoRTNnsuRqRj/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGMcGnes; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGMcGnes"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DE48C2BCF4;
	Sat, 26 Sep 2026 20:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790453517;
	bh=1B4p1+6ULhEPyZ3UOWOnVAYM4qhJw3ENiTOj/9tlJcI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=XGMcGnest8YJQYCIx8q+r4rTWM1fKMwp6Y4LKRJEagkIftafkk0LTG0BRgbyeAQb0
	 3pPhBtaCc71G/soorki3MmgBAuR2tICqPMkHF5luNgs2Qz3MYhTJsABYq86wAvpJ+n
	 Rfb/qkRiJXLzRm9t09vdXLpYPyK3amgMM6IfxmBNr/NN9i6JzseCQH/NKKxr2SSni6
	 wcpd99V/jUTD+VOrAvoHexNUJKi7alYtjGBCzwViFhZBu+5NSlVinDd0Sm6EL4/r8m
	 pSpErZFf+y9EYrk1QeZB+WKE06sEiENvfk3OBV8V+RanfwQFxLxuqHprd0Xa2gKvr9
	 8kD8Afhgg9AOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D752C9832F;
	Sat, 26 Sep 2026 20:11:57 +0000 (UTC)
From: Alexei Solcanu via B4 Relay <devnull+alexei.solcanu.pm.me@kernel.org>
Date: Sat, 26 Sep 2026 16:11:20 -0400
Subject: [PATCH v2 1/2] hwmon: (gpd-fan) Reset both fans to automatic on
 duo boards
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-gpd-fan-duo-auto-v2-1-0a2ea41ee3b5@pm.me>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
In-Reply-To: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
To: Guenter Roeck <linux@roeck-us.net>, 
 Cryolitia PukNgae <cryolitia@uniontech.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Antheas Kapenekakis <lkml@antheas.dev>, 
 Alexei Solcanu <alexei.solcanu@pm.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790453516; l=1200;
 i=alexei.solcanu@pm.me; s=20260925; h=from:subject:message-id;
 bh=+nlB/lxvtjXsfgj7z4lKurSGOTzHgxp5QbIYzM1esmM=;
 b=BhXSljpP2xwOAsQEnbESNsa5OZQFvdnSpt1nURScxoiYUMOe5KmDAtno8YRgIpFc2L8lq1iH9
 +nhY+MRZYzVCK7aAyvsBSRjBHY7mvkjiHEUc7ohh/dNsykIBTmygVUH
X-Developer-Key: i=alexei.solcanu@pm.me; a=ed25519;
 pk=iK6ervbccknflfirBb6E4x7TaOyCpnoGd33gzfiNEeo=
X-Endpoint-Received: by B4 Relay for alexei.solcanu@pm.me/20260925 with
 auth_id=1064
X-Original-From: Alexei Solcanu <alexei.solcanu@pm.me>
Reply-To: alexei.solcanu@pm.me

From: Alexei Solcanu <alexei.solcanu@pm.me>

On boards using gpd_duo_drvdata (GPD Duo, GPD Win 5), writing
pwm1_enable=2 only returns the first fan to EC control. The second fan
keeps its last manual duty cycle, e.g. full speed after pwm1=255, so a
fan control tool that exits leaves it running at that speed.

gpd_duo_write_pwm() writes both fan registers (pwm_write and
pwm_write + 1), but switching to automatic only clears pwm_write.
Also clear pwm_write + 1, so both fans return to EC control.

Tested on a GPD Win 5 (G1618-05). Not tested on the GPD Duo.

Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
Assisted-by: LLM
Signed-off-by: Alexei Solcanu <alexei.solcanu@pm.me>
---
 drivers/hwmon/gpd-fan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
index ed212615b2f..b3b75f99f58 100644
--- a/drivers/hwmon/gpd-fan.c
+++ b/drivers/hwmon/gpd-fan.c
@@ -444,6 +444,7 @@ static void gpd_duo_set_pwm_enable(struct gpd_fan_data *data, enum FAN_PWM_ENABL
 		break;
 	case AUTOMATIC:
 		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write, 0);
+		gpd_ecram_write(data->drvdata, data->drvdata->pwm_write + 1, 0);
 		break;
 	}
 }

-- 
2.55.0


