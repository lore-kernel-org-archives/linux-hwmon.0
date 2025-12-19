Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EB33570AE
	for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 15:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159336; cv=none; b=IDLjZd38hT6LrWDyhXsS5Lx33rbpBOlJsyj6XsLw0+NFGnzXczqh2K8Bz7ZWTI/v2JCY/ZAyUvzBJNe00gZ4Ix4mMa82mR8ucN9ZiH01cXsKDbTe1qlSQ5JZjfW9Y6rIInaNiZjUYh07QDruGJ1SkHlC2gcRfU9fOFJUt6grpG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159336; c=relaxed/simple;
	bh=YdvmcO/xWrVGKvGLN3Sbu0MCh7VMaT4TyrfZK7GjnsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eNw0gz3VDh0F/f5T0TRrs6NIx0ORH5bIhsQcv5TSDTAkRqVIW484dZTVf9LI7ESaobBBc0HcmA1tN0SrKYLYaFwoDPZqN3JgGb2V2H1Vh+S/pWypsXRW8nGnYODN0n/RtFiv4EJrNiBJhpsKkKj58DtXmIIDKifzP0NMmreikBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUVcbWRj; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUVcbWRj"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37b9728a353so24039821fa.0
        for <linux-hwmon@vger.kernel.org>; Fri, 19 Dec 2025 07:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766159333; x=1766764133; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58EPOJ/ZliofUV0ndmhYUncAeMIjljEM//D48U8N39M=;
        b=WUVcbWRj1iz3pxLs5I8NK4Y42qU4qo0Fvfgw7P0hVVUS/YmbNzL5zmO7Bjuh8tgazD
         EaLiCb5mxoC5QJdJvbGp3GscZBczWPIENroa4Dx8w5B/9wWtJZMffO2kJJreVUtMs+Pw
         v6fAlhfIKu4uaUDkrbXK+nQWbvUBIR0ilv+4Nvk+97j9MvNAaH8483DPGtLh5rC3jsmp
         IuI9erRb8xvM2P/9yqpcBNRLKh7uteaOJz3J5RI1JmxUDiJsIC4McD0gUfpWXTX58K0b
         Nr3Q6ti8NkjtGI4g0E7AHxNF/F1xCMpdYAkbr45wi7CwUJ80wW8dNHCrAdk5thtZLIiB
         4wxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766159333; x=1766764133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=58EPOJ/ZliofUV0ndmhYUncAeMIjljEM//D48U8N39M=;
        b=PGszpYnj4cEg2sOkQZJjsleec1XE1JHAbEBja1w42oaE/P+KcpRaKO3ntMeD615rLI
         h4b/m9Hg0K8rfF+LD4pIupSj6hjokeugdPaOdacumBWtWj2VMjtp1gXFD3jkZWLR728S
         dcuNACjEeXEvMyZ+GB5V5ZUa7zOvhZ+lqfFFmKf1uQ0VARwa8aLwKwKsKCAL7yhCvLpV
         R6Mywb0PixYvOZq1+8c23qXxy29I2xJe7RvTjzcAqBV+/64XprTQUHB/rbPTS6MvygEq
         lKBwXucZ2TXdxYghqwSZiPKUbVa5qUDuuNM0ToqsdFNJ4Ao+p/QoFQCMwjkv2rbYW5g0
         HAlw==
X-Gm-Message-State: AOJu0YykTPPlrmGwEA7vOyPlDwbAcAevPllnz1tr1Qk7gMLq7vMge4SW
	DH6SuidUHJ0LZeCKvegLjLSOHRlSe7KCMeY/mVU47IwK3rvALjLhnMWt
X-Gm-Gg: AY/fxX5Q9HpSkT5Ak32Awo/A9nbrk+bTy77LL+IFwq3SvmhP4dANBUlpVyt7fruHMEC
	YmwBi3PMQWa79KQ8YZhZ+lPd+cvvmAC06AFib5gHBfyH9N2ZGQHhe5WITAw+qwz0aLD2vn6R9jZ
	WuujYUoEMDCcrRNs6qZclZWbNvna54MeKltaUi78k1tfhKRgDqgZS9VpnKKO4i2EAsziLsysAR0
	s3VDmWwKcm3dK1D9LOrcvY/MGjomv35h0Puhfz1jKJanZOIZ4VHIRsyuF9q6mIXiTHdZncFLztZ
	vGfvqr+4IPhv4vy/R+9e+i63+wKtJoneT7Rt/rEloOt4xLYfgQ/9nu20jrP+eczgScSnO0h2ztf
	+CRs4tsxMSNl3inOeC7U+jLFCT3CRgMf0QKzyrrgOZmBB4zsLB4fyPcL7ty3EIPGVF84oZZO+Vh
	cf2BC3HbVhBwPRyx6BzWaZrg3wGIpoH/2g4jwRO0riYXfiQ/qMLnoVqN3I3AH99SPyhbxwckbB/
	5Vx2Q==
X-Google-Smtp-Source: AGHT+IE7DsXldnsgfFUfZ0nWr1RvMsCKQcYmg5SxRFy8db1TNKQLxGI32gQJnwTCwqSt+BzRJBLk1Q==
X-Received: by 2002:a2e:a905:0:b0:37e:566f:fc69 with SMTP id 38308e7fff4ca-38121637290mr10210591fa.30.1766159332971;
        Fri, 19 Dec 2025 07:48:52 -0800 (PST)
Received: from LT-5CG5341NQ4.nordic.imtech.com (84-253-208-48.bb.dnainternet.fi. [84.253.208.48])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de76csm6356391fa.10.2025.12.19.07.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 07:48:52 -0800 (PST)
From: Kari Argillander <kari.argillander@gmail.com>
Date: Fri, 19 Dec 2025 17:48:14 +0200
Subject: [PATCH 1/2] hwmon: Fix wrong return errno in *sanitize_name()
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-hwmon-fixes-v1-1-21b29097ea3b@gmail.com>
References: <20251219-hwmon-fixes-v1-0-21b29097ea3b@gmail.com>
In-Reply-To: <20251219-hwmon-fixes-v1-0-21b29097ea3b@gmail.com>
To: Kari Argillander <kari.argillander@gmail.com>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766159330; l=998;
 i=kari.argillander@gmail.com; s=20251219; h=from:subject:message-id;
 bh=YdvmcO/xWrVGKvGLN3Sbu0MCh7VMaT4TyrfZK7GjnsY=;
 b=FIb+ROzvU8LN8nCjYfHOQ8eCkBKEvKpzL+Lgt1MruoF+g2RST6kKUhfvLazleWpH7go9oZZLl
 UXcjJ9QKj6ZDkAtjWi1r5ANmpWa4cjm3vZl9GHrbJqySsOAC7qGe5MO
X-Developer-Key: i=kari.argillander@gmail.com; a=ed25519;
 pk=RwSxyhTpE3z4sywdDbIkC3q33ZQLNyhYWxT44iTY6r4=

Currently if user of *sanitize_name() function gives nullptr for name
they get's ENOMEM. Logically it should be EINVAL.

Signed-off-by: Kari Argillander <kari.argillander@gmail.com>
---
 drivers/hwmon/hwmon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
index 0b4bdcd33c7b..7a784d685d77 100644
--- a/drivers/hwmon/hwmon.c
+++ b/drivers/hwmon/hwmon.c
@@ -1260,6 +1260,9 @@ static char *__hwmon_sanitize_name(struct device *dev, const char *old_name)
  */
 char *hwmon_sanitize_name(const char *name)
 {
+	if (!name)
+		return ERR_PTR(-EINVAL);
+
 	return __hwmon_sanitize_name(NULL, name);
 }
 EXPORT_SYMBOL_GPL(hwmon_sanitize_name);
@@ -1276,7 +1279,7 @@ EXPORT_SYMBOL_GPL(hwmon_sanitize_name);
  */
 char *devm_hwmon_sanitize_name(struct device *dev, const char *name)
 {
-	if (!dev)
+	if (!dev || !name)
 		return ERR_PTR(-EINVAL);
 
 	return __hwmon_sanitize_name(dev, name);

-- 
2.43.0

