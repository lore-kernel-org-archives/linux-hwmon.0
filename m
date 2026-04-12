Received: from mail-106119.protonmail.ch (mail-106119.protonmail.ch [79.135.106.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81481239E75
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 00:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775953062; cv=none; b=V1LQ7dWmaYFSGmZAHDn8fb2ZRAsLGwE9JFY/n8SLqFsNoHatNTHk67XVsoUlRecTnjQ4+oOdDzx4gbhfNjA7r4fr0upcN+y7jGNSScTvKJrtEu6fOLsy+U8BU1hGmizYNBhkYi1e3UEO4Zt0jlNlLdak6EFZrfL6GyT1YAWl4do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775953062; c=relaxed/simple;
	bh=sGDP6YfQkfdY0EURoSGrFdUfVbQIdMyQw+1Zai7F0XY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=P/noO64z7vXrMCvcVfD3luYVH1jxpF3cPQuT7/Ncr+gRLI5waWnR3TLZk7CGCbbhIozEOd5DEveOj3m2jo6BHwnWo4aZQMMxQfA+xm0eivmWfI9BJ8GVudMknprWqXalqjuTmSsjnCJHhoA6SoT0kQMGfaHF9sH4Ydd+VJy2xhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=RCNsgqXG; arc=none smtp.client-ip=79.135.106.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="RCNsgqXG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1775953052; x=1776212252;
	bh=sGDP6YfQkfdY0EURoSGrFdUfVbQIdMyQw+1Zai7F0XY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=RCNsgqXG+oT7xfDDm4TPpwKWZD+XEMo3YKY2J5KNOQqypwfpAGme9cP1TZ99wezSj
	 v0GY0pIKFDpSFVZyoCBcGpytW61avggTMDimGKkRhOiFJvPhs57zLF6pU3wMCFgbqL
	 HO3Tvwi9dTLDVtYQhd5FBWD4/e5wLn5gaUbGKsKS9gbmoHDo2qBp8061V02XWuUchZ
	 C5I7Wwl0/dO1h1Qj/CpK2roOkLGO4pz5mbCOD8Kk8zqPTRWN/8cK0biawWlHi6qDL/
	 WASOg7Ag4r6UwT4cEHgwBcH1ornzO6EPxN1TJzp6iR4X0nApLCjy/RPErK54Ho6ehf
	 LNQNDvx53Ocpw==
Date: Sun, 12 Apr 2026 00:17:27 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: pklotz0@protonmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, Petr Klotz <pklotz0@protonmail.com>
Subject: [PATCH v3] hwmon: (nct6683) Add customer ID for ASRock B650I Lightning WiFi
Message-ID: <20260412000911.9063-2-pklotz0@protonmail.com>
Feedback-ID: 191960931:user:proton
X-Pm-Message-ID: 65dadbd4f481c0f3b9553757082949555b12cf5f
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Petr Klotz <pklotz0@protonmail.com>

The ASRock B650I Lightning WiFi motherboard uses an NCT6686D chip with a
customer ID of 0x1633. Without this ID, the nct6683 driver fails to
recognize the hardware on this board, preventing hardware monitoring
from working.

Add NCT6683_CUSTOMER_ID_ASROCK6 (0x1633) to the list of supported customer
IDs and update the probe function to handle it

Signed-off-by: Petr Klotz <pklotz0@protonmail.com>

---
v3:
- Changed commit message based on feedback

v2:
- Fix indentation: replace spaces with tabs

 drivers/hwmon/nct6683.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 4a8380414038..0581770380cc 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -182,6 +182,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_ASROCK3=090x1631
 #define NCT6683_CUSTOMER_ID_ASROCK4=090x163e
 #define NCT6683_CUSTOMER_ID_ASROCK5=090x1621
+#define NCT6683_CUSTOMER_ID_ASROCK6=090x1633
=20
 #define NCT6683_REG_BUILD_YEAR=09=090x604
 #define NCT6683_REG_BUILD_MONTH=09=090x605
@@ -1245,6 +1246,8 @@ static int nct6683_probe(struct platform_device *pdev=
)
 =09=09break;
 =09case NCT6683_CUSTOMER_ID_ASROCK5:
 =09=09break;
+=09case NCT6683_CUSTOMER_ID_ASROCK6:
+=09=09break;
 =09default:
 =09=09if (!force)
 =09=09=09return -ENODEV;
--=20
2.53.0


