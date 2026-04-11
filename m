Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32148175A9C
	for <linux-hwmon@vger.kernel.org>; Sat, 11 Apr 2026 20:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775940020; cv=none; b=k/Tf8JFWiEbFnAoulEnJZPDVvUXZGLBqBU/XeStVUXmWQ1sO9hFfDJsUOUNN3vmKfGktGjaO6N6gLX3b1HKeNE7nC9W9iJhRupFW0PoI0j5m1L5UFj1/BY7Qh+loA+JQexiANwmRos9OK9YorRu/nRQbjQWDUgi6/tDph/cuuC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775940020; c=relaxed/simple;
	bh=BO9HvDH3Btsaxiy+CmTIjUXNpRe6lNzzRY/sCzE8JZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IcXccD5pN9efd4vh9NN0p0DWvfP1HkDbHnOgKC9ktOKZD1UBut8IKJGtsnfj9SZ5XcJLqpaE+/WApXVMLqFsjjP6FRYkKKFlBr7Kpsdf9YXGc5Vnn4G5dvOZpqwFOp4KTpJQbFZ0e6gy4IvTHRxLhVOIp9lCOsmRult47DjH+1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=gVDAPfmn; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="gVDAPfmn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1775940016; x=1776199216;
	bh=BO9HvDH3Btsaxiy+CmTIjUXNpRe6lNzzRY/sCzE8JZQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=gVDAPfmn53ZhrDvwc6FKcK79FgUO4XxPLnJCUXzZQLRtOMkGylN/2zqRwGoApwsJM
	 CraP7x8IpYQjl/8Ruix6KNraFAt9T4xCJnpamKVZQ+8xLbssNlxuMSCwSSnN+MpLqm
	 VbX5hC3Kl0zaL0NApiFANWenXXF/DEjo9CiyDjm4GxYZtVgAdJO0Fvv/QmN74STQ+b
	 nPmgUVM0v4lMkmOvWD4xk5/7M4Ev1ijp0J7VlsjauSRkfmZgkQZ1fULO6RHJn/5psh
	 WKKCQmW+RckC0bJgT2rT41pq0/bNA4AbOyWljo3xxgDjNDPQWYzieTOKAyE9nson86
	 xR0ozyOSH70kg==
Date: Sat, 11 Apr 2026 20:40:11 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: pklotz0@protonmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, Petr Klotz <pklotz0@protonmail.com>
Subject: [PATCH v2] hwmon: (nct6683) Add customer ID for ASRock B650I Lightning WiFi
Message-ID: <20260411203953.9843-2-pklotz0@protonmail.com>
Feedback-ID: 191960931:user:proton
X-Pm-Message-ID: 483255275bdfcbfd76fea0bcc7f468c5b82fb778
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Petr Klotz <pklotz0@protonmail.com>

This value was found on ASRock B650I Lightning WiFi with NCT6686D chip.
Signed-off-by: Petr Klotz <pklotz0@protonmail.com>
---
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


