Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1377379960;
	Fri, 29 May 2026 20:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780086731; cv=none; b=E2S356BsxkhrIT+E9iNeldYZ7bFgzS01oWGDHKGAAVz1Na5/wd+yXKUChRkjxf1gldTmgKVtyYLRlGCopWwSLfrQabh9kNxcI53S/v4Mz34tmAJ2kQbDy25q+7RtclEf8Ks8yBs/FoCt6nkaYtCyEkPyRj1qadPjL91nTgbDktk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780086731; c=relaxed/simple;
	bh=Ky8L4lA3yo7PFD7iBo6oAcdZcPDbE9U+3KavKenGgT8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DbrjPCjFvNmNUIhZ1e3SdszREVjIQh17AbL0dT8xqYjCIBXAshtk+hFYx4LNyee6ss628eMki7hG3gg2QdhYnoPQNDtZwrgFCkGBGNp35DyE/FcNmtXi8fymtukJDrKNGpyN98CRuwychjsxYwa4ssQsurAZkdp14WaPtnwie48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=U2rvkXQI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="U2rvkXQI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780086726;
	bh=Ky8L4lA3yo7PFD7iBo6oAcdZcPDbE9U+3KavKenGgT8=;
	h=From:Subject:Date:To:Cc:From;
	b=U2rvkXQI3YBLoEfplkwAqxm/MkBy3CoBFFN2d/rus6wUh89WuJrvQ1TJKL4acDm3/
	 HDFP5DPnM1bKG1AkymQyQ/DVOa8EZ/RaW/QZvyl5NuDxQwdBYdhVMF+dPOdMrlheDN
	 IE901dqGyQ6JciKOWEiL8/UZK37foBP/78AUgzAQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/5] hwmon: (cros_ec) Add support for fan curves
Date: Fri, 29 May 2026 22:31:51 +0200
Message-Id: <20260529-cros_ec-hwmon-fan-curve-v1-0-da6792b3830f@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCMAxA0V8ZeTbQdlTEXxGRLstcBFtJtimM/
 fuqPp6He1cwVmGDc7OC8iImJVf4QwM0pnxnlL4aggtHF4NH0mI3Jhzfz5JxSBlp1oUxnGLrUte
 m6Blq/VIe5PM7X65/29w9mKbvDrZtB27wz+17AAAA
X-Change-ID: 20260521-cros_ec-hwmon-fan-curve-28530ab3a51e
To: Guenter Roeck <linux@roeck-us.net>, Benson Leung <bleung@chromium.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780086726; l=925;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Ky8L4lA3yo7PFD7iBo6oAcdZcPDbE9U+3KavKenGgT8=;
 b=HDT8T+V3lRpjgU+zFGPWjKM5OgsE15Yna06tEXCVoEPgqADC8bdBxvTKu+zDLluUdOhS92I1s
 D0DIv+bH2M2BcYaH0deLd8StUIRkFz+9FNvro8C0ML2SZQi/7vMdHqU
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Allow reading and writing the fan curves used by the embedded
controller.
Only allow the curves to be made more aggressive than the current ones.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (5):
      hwmon: (cros_ec) Implement custom kelvin to celsius conversions
      hwmon: (cros_ec) Prepare the addition of custom groups
      hwmon: (cros_ec) Split out cros_ec_hwmon_get_thermal_config()
      hwmon: (cros_ec) Add support for displaying fan curves
      hwmon: (cros_ec) Allow modification of fan curves

 Documentation/hwmon/cros_ec_hwmon.rst |   3 +
 drivers/hwmon/cros_ec_hwmon.c         | 248 +++++++++++++++++++++++++++++++++-
 2 files changed, 244 insertions(+), 7 deletions(-)
---
base-commit: 18825a69b1bf72ac6e80c6f45f59cac52745927d
change-id: 20260521-cros_ec-hwmon-fan-curve-28530ab3a51e

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

