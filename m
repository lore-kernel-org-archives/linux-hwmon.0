Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B5135AC0E;
	Sat, 16 May 2026 06:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778911219; cv=none; b=RQSXE6FZ0Kzq8YR98JyKHSrZudH19qC0XguFotHsm4uSDiUvJ9+lLF06E/AZOVjsUk7PyO0q3M47eOKb2prqSzrLRVvmGU5G0Ibj1AohjgtxDqdL4CxiEy+m3CHlA8OXTTOJY5xAxuua8ezK3e49UzUDcXZjJYYkiKjB84dWrMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778911219; c=relaxed/simple;
	bh=3EfO2EvYow3i6WJ5h4w9E7EX5JGTLiNFTnp055mrlfE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T++8WRY+3jiPiIWmvFqO1ssr9TV8roTBAX/fsv4uHHEHlP57lHQIynJORqbHQ0imdSUXNBUJrZfXPl2ucCE9+SkPWcytn5STEQgk94byGNHQ7ERhQ1tGfKslGJZ26pyjmy9TNLQ6Be8nOFWUPcCcnW4Bih+nYav9UwXUmAJ1rZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=Na6P6Bqz; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="Na6P6Bqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1778911208; x=1779170408;
	bh=3EfO2EvYow3i6WJ5h4w9E7EX5JGTLiNFTnp055mrlfE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Na6P6BqzCmlo11mNn7rnYRFmTWhBIhMTL/xNtDINjQ2z/JWWtjaDwHqtO5TACaVtD
	 M7QIOOmioZc/7Qvs+u9naqFXZJn8fCkcdKGzfJzOIsdFbXrhPWINnNSlRGAvR6eHxs
	 bJt50y4WJr85zf/j5s177AWTLyhbPPqqo0Gy0dV6SS+J0xncstUYxJV4mIqbO+sYWY
	 X12UADhJNC9lnrUctBefESYiu0kbYKMj+EAwMsXlMrr+56Pq8uKxtDBz40nNXRybrd
	 ADUB2JG67ZubokN/8LfLmcGHLlXiB0nYbfqBktHcbNcTe2B7ke5akjGJb5WQ44XSx0
	 ozzdcIYw7tRhQ==
Date: Sat, 16 May 2026 06:00:01 +0000
To: "linux@roeck-us.net" <linux@roeck-us.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "corbet@lwn.net" <corbet@lwn.net>
From: Hassan Maazu <maazudev@proton.me>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND] Documentation: fix typo in heading for max31730
Message-ID: <hGgiFItk4iaav9-zfXL4hA_EVmxAaZYRbYviXz8aKKzOVAqduObTpd-PvRy1-9Ksuziam1HIXZNEkXbw3znqWX86Lplbq-Axo3fImYbtNZA=@proton.me>
Feedback-ID: 83974785:user:proton
X-Pm-Message-ID: 600e2220327944c2b2b7f59f193c8c18e2619b65
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Wrong device name used in heading.

Signed-off-by: Hassan Maazu <maazudev@proton.me>
---
 Documentation/hwmon/max31730.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max31730.rst b/Documentation/hwmon/max3173=
0.rst
index 1c5a32b64187..0936ba2eac24 100644
--- a/Documentation/hwmon/max31730.rst
+++ b/Documentation/hwmon/max31730.rst
@@ -1,4 +1,4 @@
-Kernel driver max31790
+Kernel driver max31730
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

 Supported chips:
--
2.54.0
