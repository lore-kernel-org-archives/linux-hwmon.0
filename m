Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662C770813
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Jan 2025 01:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.77.79.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736212665; cv=none; b=bqFOB+X0Onl4J415IsfHxjfh8D6jwl69M6BxQOgs+sLz815RXE8nCllFKnT6DjN55wqru6voaOx6GK0ZgVxeRb5J/eF+fx75D9FnTvi/+m23Nj5xdiwqvTzwjqEu+8xJUT71nXG0y+sTcyPWRAxalrnSyxQsXUXW4iNmUUzQotU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736212665; c=relaxed/simple;
	bh=1eSXAGm0kNbwrjgklelcUyjitZNdJlgGhCD39OOQeoA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s1ki49DimRUWjAeKLM/mRpctVGl2xXLIFfoOrHIHyzbftGHkGKIVCPPR4nyFhHkuD3EPPEWiFc16rM549xhFtJVxWp94KuP/NSQqCkYBBnG54i7QDUfx5XSR9oIYZMDQ2KwXakXo1/UAAlWWDN/i9dScAAuAw9MEGYAwgShfTZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=SeEygUn1; arc=none smtp.client-ip=51.77.79.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="SeEygUn1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1736212652; x=1736471852;
	bh=zVCYRMbanWTf5FDrAIqcJFnsPA5qC9AW/FhRXjKeuVw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=SeEygUn1z2wiZwCvkdaFeykkOyNgIcmfCusVfb1aLH8OqkESRZHzggVr3NTmLpSwp
	 nJyWy1UCoZISDZnLcik6X6F+0p23tuJItt8/xu2j7sitVQ2f8zGxvCo3Cpcb/OXf3c
	 Yev6X09H7wKqqrmBaX4s0HhSIdyrFht9LtqTOG0k9F+x2TnpYZEVWAE6pgA6c+k1+d
	 YtTXFBKUh5AjwTqOdJ/w2SwR/owdw0a4mzxJ7NfzTnupLSfvF51/fL+7Cqn0k9cDv8
	 yhBCQ7vFGY0SEYG3MVV7/UXAbIpGUaaY/DKh/rC96SiT/EvJXZkfl1YniNP2T9Mzaz
	 AEV4aiMlc5WPA==
Date: Tue, 07 Jan 2025 01:17:27 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: John <therealgraysky@proton.me>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>
Subject: [PATCH v3] hwmon: (nct6683) Add another customer ID for MSI
Message-ID: <43w0nnxd04iDaHsiW0YhJOpdkr4W2DNlLQ1zRJOG0B_dd5se040WWEupLETO53QEyvVzQw88MgzWa5H-_X7TJGz3cZZPQBjtjWdLFnEBD4M=@proton.me>
In-Reply-To: <2dc31c52-2ca1-459c-8423-7d367d1619a6@roeck-us.net>
References: <RHgpMv2vm9aouIOCtyVI2mjH9atCSSL2Zo7fO9QqQwapyOv1ATQhPQGgITlRHcXcEGY_PcyxUPmbXmbPlqCGyFgaEjhuPeaCGvWY4UdB1uA=@proton.me> <d6d10360-a2a4-4910-b3c3-80bf9d67383a@roeck-us.net> <zw2UJN123_RVNb7oaPDKfZjROMOGtEoLGZN9xK1Ha-p7Nqi-f2a682LoKaHhj498dDGqbuApHa5VYNWoB8GLlUhI4cAdj213hU95zEmzxPk=@proton.me> <KY1Lwa2kjE7V78ZKOvQv0IavCNAQXJMIL4LYAALEUI52yxCxzzucAifFH8Y1wRFUm38ZZsBvCM0poaJL6bIqnjS1tL1o9K-h_h5-JJAe2rk=@proton.me> <2dc31c52-2ca1-459c-8423-7d367d1619a6@roeck-us.net>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 5fc0e5d856573ca9a09f597c23e3937d7ceaecb4
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, January 6th, 2025 at 5:57 PM, Guenter Roeck <linux@roeck-us.net>=
 wrote:

> More serious though is what checkpatch has to say:
>=20
> WARNING: From:/Signed-off-by: email address mismatch: 'From: John Audia t=
herealgraysky@proton.me' !=3D 'Signed-off-by: John Audia thereadgraysky@pro=
ton.me'
>=20
>=20
> Notice "therealgraysky" vs. "thereadgraysky"
> ^ ^
>=20
> This means I can't fix the problems myself (which I would have done
> since I already spent way too much time on this).

Apologizes for the typo.

From e4aea88b0c8423d0b3293e43ab7f3beb4c3936f8 Mon Sep 17 00:00:00 2001
From: John Audia <therealgraysky@proton.me>
Date: Wed, 1 Jan 2025 08:27:59 -0500
Subject: [PATCH v3] hwmon: (nct6683) Add another customer ID for MSI

The new customer ID was found on a MPG X870E CARBON WIFI (MS-7E49) with
a NCT6687D chip.

Signed-off-by: John Audia <therealgraysky@proton.me>
---
 V2 -> V3: commit msg changed/correct email address mismatch typo

 Documentation/hwmon/nct6683.rst | 1 +
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.=
rst
index 2a7a78eb1b46..2302b1ac95b1 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -65,4 +65,5 @@ ASRock X570=09NCT6683D EC firmware version 1.0 build 06/2=
8/19
 ASRock X670E=09NCT6686D EC firmware version 1.0 build 05/19/22
 MSI B550=09NCT6687D EC firmware version 1.0 build 05/07/20
 MSI X670-P=09NCT6687D EC firmware version 0.0 build 09/27/22
+MSI X870E=09NCT6687D EC firmware version 0.0 build 11/13/24
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index f71615e06a8f..288f497d364a 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -175,6 +175,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_MSI=09=090x201
 #define NCT6683_CUSTOMER_ID_MSI2=090x200
 #define NCT6683_CUSTOMER_ID_MSI3=090x207
+#define NCT6683_CUSTOMER_ID_MSI4=090x20d
 #define NCT6683_CUSTOMER_ID_ASROCK=09=090xe2c
 #define NCT6683_CUSTOMER_ID_ASROCK2=090xe1b
 #define NCT6683_CUSTOMER_ID_ASROCK3=090x1631
@@ -1227,6 +1228,8 @@ static int nct6683_probe(struct platform_device *pdev=
)
 =09=09break;
 =09case NCT6683_CUSTOMER_ID_MSI3:
 =09=09break;
+=09case NCT6683_CUSTOMER_ID_MSI4:
+=09=09break;
 =09case NCT6683_CUSTOMER_ID_ASROCK:
 =09=09break;
 =09case NCT6683_CUSTOMER_ID_ASROCK2:
--=20
2.47.1


