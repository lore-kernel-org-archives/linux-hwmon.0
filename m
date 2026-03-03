Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172AE3845A5
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772551756; cv=none; b=IBNKLhxeEmbMgFhfFnLhlU0TVhtUgTsayPXKGmz3bHc3iD0ZTVBx9MnjR1sBsAhdEfzJrhWtDvpOCFZ1kUX5GkCZNbqZN3YwUcztaFN7WrTFoiXqpcRNjFgzjD2erogXpeCx1MX3C0lmBoyduvRsIeBA5+7V3Dz3F3YLarXj8PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772551756; c=relaxed/simple;
	bh=Fczhz83vB01fX3d99i4mElhXZovlyUgCeRXu0JlMcMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FvoENp0bT/itxw+dfff0p7D0PpFAyjJqXmiqIAL9qi5XBdpm5oQkRpxRzyhXFbW5vaW4xupVM+eepAOedIFaNsN9We2a0WZn/ypG/lQog8C7wGR2KfZrupQiarze0n9+Rt8lwtBd8ZbMvACEy/mguhXmbYGqIa3MaGFzEtlwUfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz; spf=pass smtp.mailfrom=turingtested.xyz; dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b=R9RSIyER; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=n8osgv3Q; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=turingtested.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=turingtested.xyz header.i=@turingtested.xyz header.b="R9RSIyER";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="n8osgv3Q"
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=R9RSIyERlIwZwoRI08hBs+59+fTOv1zVWQ8JNsRBVLEdGMn8KZH/OwkKUDx2GUcked09tr61fFxYkZOdg+0H4h/mCpKLTx7OfYr8dSA4iMkR3nw0c5BHUMPXhDKqUSmp2tUFXC5WI930lm43O508Hro4UXeDJ8eUMkajFl5rzc150q9TS/C+P8yrtCFfprAgBKXn6jmrr7K+1GFBie/aCIkk17+Yll0QKBnsb1WoTD5nqJW3NxM8ZlypJS+Rat0qFoJ5EjhUtdHPShDG0qb7Ksf4USoZbtx8RzcKgnS9FL+Z0mfutuZKjT4IAQoyvH9gmDdW2L7KZ6Z/gtqSmkElFg==; s=purelymail3; d=turingtested.xyz; v=1; bh=Fczhz83vB01fX3d99i4mElhXZovlyUgCeRXu0JlMcMU=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=n8osgv3QavcXCahGN9G2KSSbnZOwzY/JLgyTgUmkQhZ8NeSHDP9rOQ8zLRpPD39IXV/ZtA0y0tkOXSRmTJMJUT2yOfvFfY0Ofas+6hR2GNQIPha4CtHQv6veC6KmS/v2kJHHA6NhpjiXOCe2jror5AUtcx5TjtsaSSP5GA3ACpfkC1e/YNBpv8CVzEj/Lk7V03DqlbEcx47d4w4qAVuY7gB8/6srHqT8+VQogYDj7mtGDgd9syNKn3OD7AbTXXnRtFsTpkEqmDWCgKs44A1n9pBggZlb8fM7FyRNsatRjxr4u5hfjUDfj05T73kqb1m96UEa+CoqTRoakpR8Mr0NSg==; s=purelymail3; d=purelymail.com; v=1; bh=Fczhz83vB01fX3d99i4mElhXZovlyUgCeRXu0JlMcMU=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 591296:32372:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -223101953;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 03 Mar 2026 15:29:13 +0000 (UTC)
From: Amay Agarwal <tt@turingtested.xyz>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	Amay Agarwal <tt@turingtested.xyz>
Subject: [PATCH v2 3/5] hwmon: (ads7828) Replace sprintf() with sysfs_emit()
Date: Tue,  3 Mar 2026 20:54:54 +0530
Message-ID: <20260303152456.35763-4-tt@turingtested.xyz>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303152456.35763-1-tt@turingtested.xyz>
References: <20260303152456.35763-1-tt@turingtested.xyz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Replace sprintf() with sysfs_emit() when writing to sysfs buffers.

sysfs_emit() performs proper bounds checking and is the preferred
helper for sysfs output.

No functional change intended.

Signed-off-by: Amay Agarwal <tt@turingtested.xyz>
---
 drivers/hwmon/ads7828.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
index 436637264056..a09de9d016ac 100644
--- a/drivers/hwmon/ads7828.c
+++ b/drivers/hwmon/ads7828.c
@@ -62,7 +62,7 @@ static ssize_t ads7828_in_show(struct device *dev,
 =09if (err < 0)
 =09=09return err;
=20
-=09return sprintf(buf, "%d\n",
+=09return sysfs_emit(buf, "%d\n",
 =09=09       DIV_ROUND_CLOSEST(regval * data->lsb_resol, 1000));
 }
=20
--=20
2.53.0

