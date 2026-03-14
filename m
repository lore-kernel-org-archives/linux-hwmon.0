Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E23315772;
	Sat, 14 Mar 2026 17:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773510808; cv=none; b=YhTjuLXWWNR12Y8AqgKxvfS8sSnLTfyW5SPc/sBJLp9oL2wOkh2wdBZsdl9wx4qiORWwUNJm9G4K99Dj+d+gZvggn9RGHJlz95s6RBb6ujEyU+YAxSIfOihdmO6l8MvbQwdEZKuZbkMTka9+iL50IYfrJ0OOqnSklCjjtWjOi4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773510808; c=relaxed/simple;
	bh=SqweSPMsH4HqXOsd2sZD7/Hh3IJrjXIlGqhuz/auuWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q6/YavX1zQuFVN1EWdkt2N/VCo36LnAIPFzeAwHRbslukYSp0puFauqWA/zhHsLPMg2v0B1s1TnO4T4gS/5YjPuz69A3Tg82OwxoAkELLgub1eFyETjuiZJv2H9i+ll5/iUe1RD90EUhRX81jkrqR4aooOenuo8jlcd5nIuooko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=TcWectYO; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="TcWectYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773510791; x=1774115591; i=w_armin@gmx.de;
	bh=P+64dvjHEeZmIFdFCc5sY8gYzpmwfYyJEuPr4PRmg2A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TcWectYOBpu/M3y4xN6aYHXgpxDKya8em8t+0fBNfF7mb2cllIPwSOBNWOS2SEuR
	 YXwpKE03YgqqAsx8jpnG9y10HsQxiX4BgMdzqJBLW+pbbAe0ZW97QQz3NU2WkKzqv
	 JkWwxN+bGfbgl7jvLz10O1De/iBnRZm7JTIyPtY9C87rgqOw/W67wOtG2BwESRvv1
	 ZVzEh1TUKLOVSEimL3wHCRNJ6xEt2vikscr+TI//DNwFwqMPd3RCAadsfHtW2w9kn
	 8zq+n9rSyEqxRTDeMLVRvsQQNGct78TYnHIgqrnFA5tPqrDDFpop3IeeHjUvkZos1
	 ufwOUOsiwVfBhVN3GA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MZktZ-1w56Uz3RLD-00VcsQ; Sat, 14
 Mar 2026 18:53:10 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: Dell.Client.Kernel@dell.com,
	pali@kernel.org,
	mjg59@srcf.ucam.org
Cc: soyer@irl.hu,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	mario.limonciello@amd.com
Subject: [PATCH v3 6/9] hwmon: (dell-smm) Use new buffer-based WMI API
Date: Sat, 14 Mar 2026 18:52:46 +0100
Message-Id: <20260314175249.16040-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260314175249.16040-1-W_Armin@gmx.de>
References: <20260314175249.16040-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MIO2FobxPhivj4BXVgrMjeMqs9nomb9yLyIiuGNHVNXJAQisTCl
 r6ExW4IA/VWU12qxUUzBqNtl7Gk1SkwR6NFR6Z3hA4Yx2p99Qclnff4mo+6sFk/DCYlg/Fe
 dKy8Iv+sMkfCRrYSqF1AlhlcnmL04UU6D53g4ZB9bPnlbF57mjfQYFmMHuKKwUjRgEXSp02
 45UR9wbZ9lILw830JF3HQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SP9DLMvCoCM=;81s3DBdIgZFtgWwdG7uyrxQ7PGa
 ob8exyS2GKeP59p+VASUJavzC08tlneev9v5fkbgQVgP+kwV8ToLkxxf03sDL6RPmrLg6Jsqq
 kwj04FFUow8eSKD5r6fEoirsoG/bK6QplsR8vUuCJzn2j5JvntPHRde9leaZ5g/qjn71Aznjw
 Ex02snqxuykfOaqDjMFkjqAMSjYNX1Os4NjeWGiHM75rFnsC3vVYVzMJiz2FkrhGViANP6ySp
 6BrMywS9Ln/zKlbIPn1U064d99ezU+VzuLHabdQEA+IsSjP7yJOboSa+VyyGcXAsyQZhxx5qY
 xvX6ULE7UHUq9izd5KhLADpAYRuoP15qcSFL4Xmi85wgc4Pu8IjP6YrV7cqcISW9Vxp1xiRkC
 g1zlwA0GXhCiDgQRuKCZzM/YAxDq4ZfNYK1jWBv6UkDjHF2eW7HBMMTKVrkzRb3hBNynqsfV5
 55I37ZndsyGL3ygHDX22lUik+z5soKNHYiVUWZML0h/dq78X5hZNxrNPOpPfnndtE/cE9f2GA
 GkiDBw51TVouVyO11f5kGo96k80kkQL6Frkk6BSSO6fwFH1z+GYSU5RcMFkkg5GlUKFqUUg7s
 DIyRYl2e+4Mkv3BmGBZI5KFK31oxeZjbv5rxrlyPNAK9vfmCHKV2b5YrqAbmqwTJC4THfECz3
 WUivBKHH8/FEDgN99mlngmIAZmIUy4xSteLsAEfzXlvST27ARWcXMwxVTSmCe/duEH+AdzZRn
 +YtY/FLESAJh8aX24l3ZlcjKioegrUrw4B00wbYJsPbWqSd19zATcfQiz+NCstp4zn2LNt8om
 bIw8+Ny/4UtIcsacSbtP4k6Y/WnteoIJY2Tyrd0bhOaE6F88krbIP3rK1Q4uIfXTt+q6NWBAX
 4oFYFnzvxx6IylS39P5rFidqDYzITEKl1Gp0mozem/ShDwX3yL6WeFpZeYCDLxT4JEC7yWpuu
 m1UBTuEz6qVTPztVhCQzR8rlJ5hAXmbgbnjxVksmwEJyzxbNDJrmC7cxqwX6yQkm23BmCLljk
 TmOUzvI1bFFrfiQ6XwTf4V4cExIiQX4TUTmIQ7JXM8fg824wPdDUey+Gn5dsQ5P0oVOkJB2Vt
 o5jr9pQ/qyrSTDYBZDAn1N0D+/Kzv3y1FcX2ihANTz/dK1M+TA4v97lmWNKGvw9tf2jomzjrZ
 8NVxvJpFhvGtc69OzYd4C+jBs15An46ezpHF3XRyQz2A6FwOcoQSFpUtPxYQgtWYlH7g81pSQ
 FuHgk523X7R3VIv7ZHdzM5TR4diYpGzQfT5fCOQTAimm3G4unGAGe7uX33BttShcxiVB7ToS3
 rQTtsYsPItylGZ0/mr2YEYK1FFn0bnRR5vK2YjlH3Ujff1fCMu/1uiCUeaOa+eDgU4/Gi7YYd
 VJSmFMthA8J9N+11m/u5lhyycm20zzXjmvXmEcRHV93MQdlw2iiBr7Gm9+ngpoGsifPxuhtNA
 K5v6BEioYUjg4/7JMfeT27gy02QvnOr4zgC+haVjZoQUjYvpXT+XBm6WWSd0tJ/C2WF/hcG2P
 HrlRkOx/Osf3EvYLY2iN8L539S5KweGA0kgTnPhbC5B1GOBGtpGZ6/PiJNl3m5j2Ft+0YWrlD
 5ONmcl18ggPwbc0ttvr7h+ddUS+5G8+Y0wlv774CEDjT2/GKvHPR1j2VcDJhMahxp8CfMnLU0
 qk5/uvWIF0WfjZ0WCtjPS4wNO0pU2ibmp6iLB1BSrgjNUC2U4Qlncygmxhf71MmYpR+v1FGpL
 LNaRN+Dg/2kcYYCw/xXQ8SVbjMY+TwMr1c5kG3PsBfVkXkBG2gUv2BJJLX3PZ53JfU7Y3NWzI
 DO9ld+yi92C2Lw8THuU5hhVSkAGxjkXV2esSKiBnBEo/PbuY9xMPD4/Yk+w7Le0m4QUdj0kuC
 ZnUQybg5iHPffKPgcAHKB1MVimJ1oYrabFEcMuWxWF5W6IBd0pnPaQcjmeta/MtbRlO0daxrz
 fm8fCWwGYqVpgIIAo/CPf91o8XsRDLjkWG0a98F5TqfmFFAuXLCBd+dY/Wd18r9qN7A5HjXcg
 f2upuSi1ox54ccEQlAZpVv8Crt6BUhJPJ9sKBy5n40YkHD2mWzNo4tZHZ7AE8KCSLf8KqIlE1
 ndKVs4xhT9uEUAKbKqhYMgNrv5KE97m5Ym0b+C99o6ai/LLVkW3U0J1IsfCJ9on6QS8Lnw8hi
 B7G/J9vsgNh5XnXfwBpshh0ipzGSOS5PdMSWW/HMzjG8cnOL/vWfTQsIN+g5tptbtYbFu7q4d
 Df/GFsUjI3n4tiqlnRAMEnzcS4n3bWjQ3BkwgqLQmsbU+iDXGKfFHpNyuwD8jnyvB3P0dGm5v
 U9SFYyv9AqqkT/PY7hjK0BG2MOjSQI8YbFKNrQKDjHxJcpcDiSNTzFOHEkx9euMbk1xyBPSeF
 Zy/ptAp63AY455FwOaE+KejoA/Ec9iu/uCWYh8tovxed0Im74yXQHRbEA2bTWtBJ7DdMZjcYO
 g6Rp9Apazc2leSk+8QhndqYTFocToDHi2WmVuGkVnTnijYukiRpvlLYCvV5WGrsxQQfZdzDdO
 Z9GCSYIvvJMVt+lU1P6C3Dl+7iYfu7YGdpG7nnbRMAsabggPuLgo2ImmBgbR5Tpm07+L0kjGb
 ZR5MO5GEmPASQ0NfdWgJV7BgSYtkaLy/3LhXHlzksSLaCEb+T/iMKANme4KYwuboDT46Bi+PL
 yTeTSurO5K9Go/A4+Djb7b5oca5KF+m9R4+ujbJX3PmhvtLqBbboSqita8Jg+WWyaue8m/7Up
 ZHrV7M/9Z7dAcojvTP3/Ldhc1/+yvBsBZ9MdK8s8lMcFlT0+y4zsuTE6rJV8TDO0PIuX0Jc1y
 ZNIyqBZne5MfszjrrUvODFsy3aZAE3NhN9ieWnx4NyQts/TvC4fbHa+Y2sW7Hf4OcMLtPUl5j
 ntS7aqO7+x6pUp775DM37rULf0AmFnK0Pb/Ez9A7Ea0jijR2KlG33OANH4TYJLNdmSryfyrIM
 GtqtzxXG2yKY6BODZGx8jcRU2p1Nhl1F9od9h7TzjynKD0J/ea/qSgItMsDXQczHUpOH71RgB
 hShNEs18XC1Gk3aXbFN0iBeK1EWzkpa7PilNO7qUFwpv3Y2Y9qkxOOEpZnybGKcGWn618EtYE
 OJVGBQretFRkxwXL56xx/W2UX5ObmdJEfFBkZ2TTYiCLYAAyeH2mmsFsDNy41TbF49L5IYMvk
 Ujy0PlNmBwLUFtP7+I9d1Y269fCFezu492qaBCn6yMPcp5+CcqHybS0ftpOxXJr/LQmF0JBip
 pdWrCPwS6O+ctbXXDxqtgcWJHwz3SzeVEnE7TIRIpnHjK9okfo27CJ6oyI/Y1e4veAl1s2R+a
 sAgikRGfRfixD9jGTzozDwAfKJC47NA7YIO79YmrOq77wBF843sgM6SHQtOu55MHZ5V53B68F
 +wOkpL1TIdOIFCzCZQ8kofTt7cGRnacuYieGMxV6/Cz7+tXPiQv4A3aMCzJh2ZfVGF8wj+ZCZ
 XKrDDTL5dn+DOIYyDbLMWVUSZz/ydHitcSgkvTr7uQriHl6YEf1RedKsD+TdtM6n3QVcGsC4A
 S9R75q6jtsq1jawBOCYo+B68MCe8EYnZ1D5tqflCDYCnV+J2FCAoB4AOm8Ik0m9lZ7c/iv7Ti
 D4LOjP3iVGWN4r66PThVqxosMn+pINBC48wsA1yiEpnQdlfs28NZsF2woXoCtlPG8ub+MZ7at
 vF0H2lP8mWVJWRvC46eE+PN+Rdt8rfc0YXyk27om1dV89aVlqFInXXJnop2qkG/+WA1syRqk+
 upYxRAbrTcVFGcZAGtMz801523rYVMGyiiU4EDhg7m6mXwrgDCL8PprtPEejI/spKcELAi3QT
 K7WejmX0A9RsU+ylzE3IXa0erPWIhBL3c6I9dW8FdpMCzgbTFNdQ+IBsin0NRslAJYS76vJl7
 1wC9O9bvIbVqEvDV/HIuXSJYrcYp89IbtgNjIxHwAG1JizVRsFVAuZ7FWa+w1f5TVLtBxHIe2
 lgLVWxuTozTKwmnPPMNWdaiyabijukzLggyKuOBpb6Blx3GIIj7sMPm50BoYt6IePRZUK6sys
 tK92HR63oBej+Ql91tOFrxMZIP4WA0uLvXrlFg6F3OCKvkHenGsLgWzSjbkyujyvoNzlxG/T5
 ZiU+M9gbZxLBFLMmMOwu7/3/dv9Zgovm+tjtxnLFPO7oZhB47coK2/QSCu86ovZtVruzGqN02
 e8njKz4BCeEG0hTZPasGcU+Nbm5Fg2XXt5NlE1iihkceYm5noWCq6fORAf3mmQY2tpiDQe73c
 oVGXwF51InczMlfhnNK1HK9U/aY2fvCf7o4ql0YAEGwJ9uzOmm/TqrmwsvhV+7eqpSTz4u5tB
 dl6jrH7wj0qlsnSRPCWCYoFerieCLTOXYwHUFezi+VELSSaG5cVHgb+TxjzM1k5Df0Kh3u2mN
 miwg5noFkJFj6nPYN8w9juedk1qCNZaI/lEoIEJE7KusOuguNhAjfNH9Kz2bMV6WdLJt04sEH
 oXuFZVGnPHkGDwnJUPzvXAZZ9ukRDZZNja5VcjNua7hbGdRk3K3KGMGj2AmK8Wjw+ZP3dZ/tS
 +aqfyxQDRntFGCBbZhHW2QlOyWonL7Hzh9tqv+/+4uxRwdTXzapoiMFdRMMrvPDS1LEbR/ASI
 bAZ6Elw5kT9djs3bZPXbNLPigRxDdSHKz/7muXFAZLIxiYeiKReN6AYUQctMhQRjCcIzygdnm
 Wpn77fYgJM2dYTKZ0aA0o8J/RzL2LnMhPhB6rQ5wBQ+B8KF2/ntvZvsfmSCM2RYOu8TiADXXt
 Nh1yDoXYZxvRxYQzG6b4suLBOxUxdyCOscZlLKm18cd6yGmUqd61fC+qjaiAJU3Dqt5vz42V8
 2SwNuGSDbBBeclqxtV5RrzUrOSnEkWfu/B0zOJsWHNU+bW2BWlDfLCb3mWkt6aQ15tQCfFk7h
 xWaMn3c0Yj6DdqaiHFTExTBQa1D46iY/QHbEbJMszb6B0f4mGa5Z66J1DwvxlL2MtARUBMIty
 oBbwhQppO3IENWhwT0W3k2DbQsBYpgK49ampLWvjgkmnNA9hBhrjGDwT66JjaJDrOSkiMR9eP
 tT5TRNbRq350/mLLF/LNaSwuDAKT43CHF7Eq/3zhH1CO1RDZjLMMjwA3JZMYs0ipxWD695Z3A
 e4y5WyDA4YHWEZ0lS/ISe9AL7U3hvf7g7XRSaKThG9x+8xbBpTJLzGajmpRL5MT+Kn94B+CQ4
 +6ShZDXYhD7vU+uuwUOI0wLATcbzJ5cO1eb3Z6Jxhp/KAMc3Ku+sljrD16JSKFAeOiYVZc5h0
 rxK5PjmNJDisZoNyQjBw+IOxExKLm4nuL8Ay+xqBCOq14GkwHY1NMcgvI79zIZwmai08a/fcW
 pX95So3UUCZA/UcIBG+PA/hDINbe4NyiFo2tyn0rdM+gqGsh1N98bk=

Use the new buffer-based WMI API to also support ACPI firmware
implementations that do not use ACPI buffers for returning the
results of a SMM call.

Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 47 ++++++++++++----------------------
 1 file changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 038edffc1ac7..82aa626fc4b8 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -12,8 +12,9 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/acpi.h>
+#include <linux/align.h>
 #include <linux/capability.h>
+#include <linux/compiler_attributes.h>
 #include <linux/cpu.h>
 #include <linux/ctype.h>
 #include <linux/delay.h>
@@ -36,10 +37,10 @@
 #include <linux/thermal.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
+#include <linux/unaligned.h>
 #include <linux/wmi.h>
=20
 #include <linux/i8k.h>
-#include <linux/unaligned.h>
=20
 #define I8K_SMM_FN_STATUS	0x0025
 #define I8K_SMM_POWER_STATUS	0x0069
@@ -232,7 +233,7 @@ static const struct dell_smm_ops i8k_smm_ops =3D {
 /*
  * Call the System Management Mode BIOS over WMI.
  */
-static ssize_t wmi_parse_register(u8 *buffer, u32 length, unsigned int *r=
eg)
+static ssize_t wmi_parse_register(u8 *buffer, size_t length, unsigned int=
 *reg)
 {
 	__le32 value;
 	u32 reg_size;
@@ -253,7 +254,7 @@ static ssize_t wmi_parse_register(u8 *buffer, u32 leng=
th, unsigned int *reg)
 	return reg_size + sizeof(reg_size);
 }
=20
-static int wmi_parse_response(u8 *buffer, u32 length, struct smm_regs *re=
gs)
+static int wmi_parse_response(u8 *buffer, size_t length, struct smm_regs =
*regs)
 {
 	unsigned int *registers[] =3D {
 		&regs->eax,
@@ -261,7 +262,7 @@ static int wmi_parse_response(u8 *buffer, u32 length, =
struct smm_regs *regs)
 		&regs->ecx,
 		&regs->edx
 	};
-	u32 offset =3D 0;
+	size_t offset =3D 0;
 	ssize_t ret;
 	int i;
=20
@@ -273,19 +274,16 @@ static int wmi_parse_response(u8 *buffer, u32 length=
, struct smm_regs *regs)
 		if (ret < 0)
 			return ret;
=20
-		offset +=3D ret;
+		/* WMI aligns u32 integers on a 4 byte boundary */
+		offset =3D ALIGN(offset + ret, 4);
 	}
=20
-	if (offset !=3D length)
-		return -ENOMSG;
-
 	return 0;
 }
=20
 static int wmi_smm_call(struct device *dev, struct smm_regs *regs)
 {
 	struct wmi_device *wdev =3D container_of(dev, struct wmi_device, dev);
-	struct acpi_buffer out =3D { ACPI_ALLOCATE_BUFFER, NULL };
 	u32 wmi_payload[] =3D {
 		sizeof(regs->eax),
 		regs->eax,
@@ -296,32 +294,19 @@ static int wmi_smm_call(struct device *dev, struct s=
mm_regs *regs)
 		sizeof(regs->edx),
 		regs->edx
 	};
-	const struct acpi_buffer in =3D {
+	const struct wmi_buffer in =3D {
 		.length =3D sizeof(wmi_payload),
-		.pointer =3D &wmi_payload,
+		.data =3D &wmi_payload,
 	};
-	union acpi_object *obj;
-	acpi_status status;
+	struct wmi_buffer out;
 	int ret;
=20
-	status =3D wmidev_evaluate_method(wdev, 0x0, DELL_SMM_LEGACY_EXECUTE, &i=
n, &out);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	obj =3D out.pointer;
-	if (!obj)
-		return -ENODATA;
-
-	if (obj->type !=3D ACPI_TYPE_BUFFER) {
-		ret =3D -ENOMSG;
-
-		goto err_free;
-	}
-
-	ret =3D wmi_parse_response(obj->buffer.pointer, obj->buffer.length, regs=
);
+	ret =3D wmidev_invoke_method(wdev, 0x0, DELL_SMM_LEGACY_EXECUTE, &in, &o=
ut);
+	if (ret < 0)
+		return ret;
=20
-err_free:
-	kfree(obj);
+	ret =3D wmi_parse_response(out.data, out.length,  regs);
+	kfree(out.data);
=20
 	return ret;
 }
=2D-=20
2.39.5

