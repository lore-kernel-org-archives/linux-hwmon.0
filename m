Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794649033;
	b=vqU+hk0l4+UE5yVZkREL7y1DjIM+khmzKlMyqh8O+Lu+rGT5mltmeF1Z1eXk9BMkB0pC
	 CskUFQU9RyMKaS+nCcEE/V7/IxKjoF5PF59CaXPd7MJv1pxAvThL/883fOhBa/cMz/WAI
	 lDVCGJHnaCGU+xiig+fi3xGBIEIwhBgX6i05mMDmxrqsF79wybLmADETQOjqjTsxLQsHK
	 pLz4SZ4eysjTmW9T9293f7HPIActYZhL8JzGWvxebJDfEbU5dFRS1q9bnHCvX8XBLH6XF
	 tKXVKzo86a/r/46RHAMaNKrLVATlBWcaFOwhbtPcQKxyBSCSsPuKlrZ38sDh5U+7QLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794649033;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LVmatjt0Kpf1teZNpyx311evR/TYigEPlZv/+0j5x0Y=;
	b=DDYc/akq30GzUd6eM4n2zCeyGywh4e9TdbqWrAeOnPWl1rQqg7NfLY6qC3B6Yc4bf1VJ
	 UmXoF5dWf69cmdgt24F16zSJIv6hKsK8ioOGwfOi3Pyn9I8mCDRwJmHBG9hGikNzq4KDV
	 cT6aiASxMivgj0B/tPBmlhoWQAaL2PDE+IL98vyJ3e7ooNI9tsCrCKuWrh47Z6TcCvup5
	 5tYp4IFpO2bGO7ipby52zmgruiBJMpAAFy1/8ysOl3m8WrmtRb/N2MffsqgEKW1NFGkUu
	 fCnUGWzvh6foRe2GTb1Q1aJlL2ZGeRcNwMSR6EvGbpqTe4ywlX44JyAybAVFeZh9AgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCSTWvGH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266E5606A323;
	Sat, 14 Nov 2026 09:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VCSTWvGH
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794649032;
	b=qUAuv4brtcH8cHKz39ppAMs8tC6+zlcKkkN7i0SFUKQu9Sl4qgYMmyvo+QqwTli2KlUC
	 xCJ5T/Xt+UWtQKzqbeUvYllt+MHK5sx8WRgtotXbUPps4VP4AJuwXeJe7tn3NfeuGFCzv
	 L72qbjkwmubf47DZVUilFbx9kTuedo9Gi91YdC4Q8I6yU7PyLv1csLDRN/k4IKJh6Ttww
	 rpU47t/P/NPAGeLRONoyCZdK5QPoa83HxIeE2ldV4vCRP1wgEG4yZ8tha7zLtcmXVcIKt
	 LyERu+JZpBy+h9+Hqu9rB9ISJsUGtfNi6wqu31uwHyDSHOrDV4z2brcJ9Ul89uU1diQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794649032;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LVmatjt0Kpf1teZNpyx311evR/TYigEPlZv/+0j5x0Y=;
	b=nhUPlDm/m9Rvyvws/+ozS5HeI56fDFPNeWyLZlsRTtQpXIx7iwXYCiiXi7nw9AHwLoik
	 IuHtYpg8y+sAU4i6iOTDBHRVlpI5w7SQQWObn1wXHrJo7Kqh4hW60uoXfhJwko7Is4b9v
	 iI3RI+qxSWjMFfvwdug9l60JlnWZpU2HjGBBbuCM7RW4Ff/WQ+FaoLGBZszs4CsGPVH64
	 8ZBp8k7UMbrw7LFFM6ahfqdJ3neQhd192Ob5lOH38CQOf4titeTOIWbx0Pxzje9KcI8CF
	 dNdHUqHnK53fm5JA4oe6yuV5zVBib+fRxNIu/eudizwgVCWMWbVe4rZBFGTM1J3j/2w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 53E5F1F000C4;
	Sat, 14 Nov 2026 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794649032;
	bh=LVmatjt0Kpf1teZNpyx311evR/TYigEPlZv/+0j5x0Y=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=VCSTWvGHTh/0Hom/YWP39/gmX6A5ofRy/cVaDzDo71kn2esSmm2XdM+dDU56Axg47
	 C4lgGgstfFDG9wpiHExHvfQ6hEfI7B6p+Tn+5mbMveo+Puj9IHr6b/LUmtsKdzy7Ww
	 uX1PV1i6QntieUgfAu7yni0rMwqkwtmjPYbZJMIy2yW7pTVBzLXACvIePD8S8XwoZ3
	 28SSq0QCT6ta4VR55Z4jROOMVSIMwYwgYMMhcSVJNlwMivCt0JfO9AHJgzN95lO6yU
	 ejMvGBG2uXPwaaoV1YPuTC+b8z4g4ohnbZpdCXGmRx9ZrSh+KPG6ZQLbh+7ON1bzgZ
	 XGl5KpxxXIE6g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A53C149D2F;
	Sat, 14 Nov 2026 09:37:11 +0000 (UTC)
From: Samuel Herdman via B4 Relay <devnull+lk.gzpc0.passmail.com@kernel.org>
Date: Sat, 14 Nov 2026 20:37:11 +1100
Subject: [PATCH] hwmon: (nct6683) Add customer ID for ASRock X600DC-ITX
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-nct6683-asrock-x600dc-itx-v1-1-cbccf1a627fe@passmail.com>
X-B4-Tracking: v=1; b=H4sIAMYr+GoC/yXMSw7CMAwA0atUXmMpbkr4XAWxaB0DBilFcUCRq
 t6dAMu3mFnAJKsYHLsFsrzVdE4NtOmAb2O6Cmpsht71gYgGTFxC2HscLc/8wBqci4xaKvpIu2l
 wh+i3Hlr/zHLR+nufzn/ba7oLl+8Q1vUDqnQOyX0AAAA=
X-Change-ID: 20261114-nct6683-asrock-x600dc-itx-3d17b409d353
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Dahlin <jdahlin@gmail.com>, 
 Samuel Herdman <lk.gzpc0@passmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794649030; l=3221;
 i=lk.gzpc0@passmail.com; s=linux-kernel-email; h=from:subject:message-id;
 bh=r00174raxcwNDJ0unlfuiA9FEN/TRz6+o/AOvvcTaUE=;
 b=r/OEHth9ckNwibOkJ4agSSH0EI4C5VV6R/ALYCm8m8Mc4qhxhGiCaD8JxZVzYX7weoH7ZenUu
 DPTXBRBQ7lxA8ovEtGlACvNNRP4QcttEk0GCMTOxvzTvD2l1tH/7fdp
X-Developer-Key: i=lk.gzpc0@passmail.com; a=ed25519;
 pk=tqivbAq+N5SMZTlmU8VfcD5yzezM4r5J8zXeFSl+KIE=
X-Endpoint-Received: by B4 Relay for
 lk.gzpc0@passmail.com/linux-kernel-email with auth_id=1519
X-Original-From: Samuel Herdman <lk.gzpc0@passmail.com>
Reply-To: lk.gzpc0@passmail.com
Content-Transfer-Encoding: 7bit

From: Samuel Herdman <lk.gzpc0@passmail.com>

The ASRock X600DC-ITX (BIOS 2.02) has an NCT6686D with customer ID
0x165f, which the driver does not know, so it only binds with force=1:

  nct6683: Found NCT6686D or compatible chip at 0x2e:0xa20
  nct6683 nct6683.2592: Enabling support for unknown customer ID 0x165f
  nct6683 nct6683.2592: NCT6686D EC firmware version 1.0 build 12/23/25

The change:

Add the customer ID so the driver binds on this board without force=1,
and add the board to the list of tested boards.

Tests:

- With force=1 the readings are plausible: the CPU temperature (AMD TSI
  Addr 98h) is within a few degrees of k10temp's Tctl, VCC, VSB and
  AVSB read 3.36 V, VBAT reads 3.2 V, and fan1 reads about 1450 RPM.
- With the same change applied to v7.3.3 on this board, the driver
  binds without force=1 and reports temperature and fan readings.

The patch and this changelog were drafted with an AI coding assistant
(Claude Code); I reviewed them and ran the tests above on my board.

Signed-off-by: Samuel Herdman <lk.gzpc0@passmail.com>
---
This overlaps with Johan Dahlin's pending series "hwmon: (nct6683) Fan
control and sensor names for ASRock NCT6686D boards" (v2, 11 Nov 2026).
Its first patch also adds NCT6683_CUSTOMER_ID_ASROCK8 (0x164a) and a
table row at the same spot, and its later patches key fan control on
that macro. Whichever lands second needs its macro renumbered
throughout; I'm happy to rebase on top of that series if preferred.
---
 Documentation/hwmon/nct6683.rst | 1 +
 drivers/hwmon/nct6683.c         | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 62da8fd01..e2e95a33e 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -97,6 +97,7 @@ ASRock X570			NCT6683D EC firmware version 1.0 build 06/28/19
 ASRock X670E			NCT6686D EC firmware version 1.0 build 05/19/22
 ASRock B650 Steel Legend WiFi	NCT6686D EC firmware version 1.0 build 11/09/23
 ASRock Z590 Taichi		NCT6686D EC firmware version 1.0 build 01/25/21
+ASRock X600DC-ITX		NCT6686D EC firmware version 1.0 build 12/23/25
 MSI B550			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI B550M			NCT6687D EC firmware version 1.0 build 05/07/20
 MSI B650			NCT6687D EC firmware version 0.0 build 09/27/22
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index de5b0194c..01784fa6a 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -209,6 +209,7 @@ superio_exit(int ioreg)
 #define NCT6683_CUSTOMER_ID_ASROCK5	0x1621
 #define NCT6683_CUSTOMER_ID_ASROCK6	0x1633
 #define NCT6683_CUSTOMER_ID_ASROCK7	0x163d
+#define NCT6683_CUSTOMER_ID_ASROCK8	0x165f
 
 #define NCT6683_REG_BUILD_YEAR		0x604
 #define NCT6683_REG_BUILD_MONTH		0x605
@@ -1640,6 +1641,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK7:
 		break;
+	case NCT6683_CUSTOMER_ID_ASROCK8:
+		break;
 	default:
 		if (!force)
 			return -ENODEV;

---
base-commit: f9f5501d60c77c71f60bf5b273375e3777d66080
change-id: 20261114-nct6683-asrock-x600dc-itx-3d17b409d353

Best regards,
--  
Samuel Herdman <lk.gzpc0@passmail.com>


